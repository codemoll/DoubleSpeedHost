{* CAPTCHA Component *}
{* Usage: {include file="$template/includes/captcha.tpl"} *}

<div class="captcha-container mb-4">
    {if $recaptchahtml}
        {* Google reCAPTCHA *}
        <div class="mb-4">
            <label class="block text-sm font-medium text-gray-300 mb-2">
                {$LANG.captchaverify}
            </label>
            <div class="recaptcha-wrapper">
                {$recaptchahtml}
            </div>
        </div>
    {elseif $captcha}
        {* Traditional CAPTCHA *}
        <div class="mb-4">
            <label class="block text-sm font-medium text-gray-300 mb-2">
                {$LANG.captchaverify}
            </label>
            
            {* CAPTCHA Image *}
            <div class="flex items-center space-x-3 mb-3">
                <div class="relative">
                    <img src="{$captcha.imagesrc}" alt="{$LANG.captcha}" 
                         class="border border-gray-600 rounded bg-white p-1">
                    <button type="button" 
                            onclick="document.querySelector('[src=&quot;{$captcha.imagesrc}&quot;]').src='{$captcha.imagesrc}?'+Math.random()" 
                            class="absolute -top-2 -right-2 w-6 h-6 bg-neon-green/20 text-neon-green border border-neon-green/30 rounded-full text-xs hover:bg-neon-green/30 transition-colors duration-200 flex items-center justify-center"
                            title="{$LANG.refresh}">
                        <i class="fas fa-redo text-xs"></i>
                    </button>
                </div>
            </div>
            
            {* CAPTCHA Input *}
            <div class="relative">
                <input type="text" 
                       name="code" 
                       id="code"
                       autocomplete="off"
                       required
                       class="w-full px-4 py-2 bg-dark-surface border border-gray-600 rounded-lg text-white placeholder-gray-400 focus:outline-none focus:border-neon-green focus:ring-1 focus:ring-neon-green transition-all duration-200"
                       placeholder="{$LANG.enterimagetext}">
                <div class="absolute inset-y-0 right-0 pr-3 flex items-center">
                    <i class="fas fa-shield-alt text-gray-400"></i>
                </div>
            </div>
            
            <p class="text-xs text-gray-500 mt-1">
                {$LANG.enterimagetext}
            </p>
        </div>
    {/if}
    
    {* Error Message *}
    {if $errormessage && ($errormessage == $LANG.errorcaptcha || $errormessage|strpos:'captcha' !== false)}
        <div class="mt-2 p-3 bg-red-900/50 border border-red-500 rounded-lg">
            <div class="flex items-center">
                <i class="fas fa-exclamation-triangle text-red-400 mr-2"></i>
                <span class="text-red-200 text-sm">{$errormessage}</span>
            </div>
        </div>
    {/if}
</div>

{* Styling for reCAPTCHA *}
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
</style>