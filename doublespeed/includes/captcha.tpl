{* CAPTCHA Component for DoubleSpeedHost - Based on WHMCS Six Template *}
{* Usage: {include file="$template/includes/captcha.tpl"} *}

{if $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm)}
    <div class="card-dark">
        <h2 class="text-2xl font-orbitron font-semibold text-white mb-6 flex items-center">
            <svg class="w-6 h-6 mr-3 text-yellow-400" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M2.166 4.999A11.954 11.954 0 0010 1.944 11.954 11.954 0 0017.834 5c.11.65.166 1.32.166 2.001 0 5.225-3.34 9.67-8 11.317C5.34 16.67 2 12.225 2 7c0-.682.057-1.35.166-2.001zm11.541 3.708a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
            </svg>
            {if isset($LANG.captchaverify)}{$LANG.captchaverify}{else}Security Verification{/if}
        </h2>

        {if $captcha->recaptcha->isEnabled() && !$captcha->recaptcha->isInvisible()}
            {* Google reCAPTCHA *}
            <div class="recaptcha-wrapper">
                <div id="google-recaptcha-domainchecker" class="form-group recaptcha-container"></div>
            </div>
        {elseif !$captcha->recaptcha->isEnabled()}
            {* Traditional CAPTCHA *}
            <div class="space-y-4">
                <p class="text-text-light">
                    {if isset($LANG.captchaverify)}{$LANG.captchaverify}{else}Please enter the verification code shown below{/if}
                </p>
                
                <div class="flex flex-col md:flex-row items-center space-y-4 md:space-y-0 md:space-x-4">
                    {* CAPTCHA Image *}
                    <div class="relative">
                        <img id="inputCaptchaImage" 
                             data-src="{$systemurl}includes/verifyimage.php" 
                             src="{$systemurl}includes/verifyimage.php" 
                             alt="{if isset($LANG.captcha)}{$LANG.captcha}{else}CAPTCHA{/if}"
                             class="border border-gray-600 rounded-lg bg-white p-2">
                        <button type="button" 
                                onclick="refreshCaptcha()" 
                                class="absolute -top-2 -right-2 w-8 h-8 bg-neon-green/20 text-neon-green border border-neon-green/30 rounded-full text-sm hover:bg-neon-green/30 transition-colors duration-200 flex items-center justify-center"
                                title="{if isset($LANG.refresh)}{$LANG.refresh}{else}Refresh{/if}">
                            <i class="fas fa-redo"></i>
                        </button>
                    </div>
                    
                    {* CAPTCHA Input *}
                    <div class="flex-1">
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-shield-alt text-text-light"></i>
                            </div>
                            <input id="inputCaptcha" 
                                   type="text" 
                                   name="code" 
                                   maxlength="6" 
                                   autocomplete="off"
                                   required
                                   class="input-dark w-full pl-10"
                                   placeholder="{if isset($LANG.enterimagetext)}{$LANG.enterimagetext}{else}Enter verification code{/if}"
                                   data-toggle="tooltip" 
                                   data-placement="right" 
                                   data-trigger="manual" 
                                   title="{if isset($LANG.orderForm) && isset($LANG.orderForm.required)}{$LANG.orderForm.required}{else}Required field{/if}"/>
                        </div>
                        <p class="text-xs text-text-light mt-2">
                            {if isset($LANG.enterimagetext)}{$LANG.enterimagetext}{else}Enter the code shown in the image{/if}
                        </p>
                    </div>
                </div>
            </div>
        {/if}
        
        {* Error Message *}
        {if $errormessage && ($errormessage == $LANG.errorcaptcha || $errormessage|strpos:'captcha' !== false)}
            <div class="mt-4 p-3 bg-red-900/50 border border-red-500 rounded-lg">
                <div class="flex items-center">
                    <i class="fas fa-exclamation-triangle text-red-400 mr-2"></i>
                    <span class="text-red-200 text-sm">{$errormessage}</span>
                </div>
            </div>
        {/if}
    </div>
{/if}

{* JavaScript for CAPTCHA functionality *}
<script>
function refreshCaptcha() {
    const captchaImg = document.getElementById('inputCaptchaImage');
    if (captchaImg) {
        const newSrc = captchaImg.getAttribute('data-src') + '?' + Math.random();
        captchaImg.src = newSrc;
        // Clear the input field when refreshing
        const captchaInput = document.getElementById('inputCaptcha');
        if (captchaInput) {
            captchaInput.value = '';
        }
    }
}

// Auto-refresh CAPTCHA on load to ensure fresh image
document.addEventListener('DOMContentLoaded', function() {
    const captchaImg = document.getElementById('inputCaptchaImage');
    if (captchaImg) {
        refreshCaptcha();
    }
});
</script>

{* Styling for reCAPTCHA integration *}
<style>
.recaptcha-wrapper .g-recaptcha {
    transform: scale(1);
    transform-origin: 0 0;
}

@media (max-width: 640px) {
    .recaptcha-wrapper .g-recaptcha {
        transform: scale(0.85);
        transform-origin: 0 0;
    }
}

.recaptcha-wrapper iframe {
    border-radius: 0.5rem;
}

/* Dark theme styling for CAPTCHA */
.recaptcha-wrapper {
    background: var(--dark-surface);
    border-radius: 0.5rem;
    padding: 1rem;
}
</style>