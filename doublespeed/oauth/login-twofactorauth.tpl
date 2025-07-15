{capture name="oauth_content"}
<div class="min-h-screen flex items-center justify-center bg-dark-bg py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full space-y-8">
        <div class="text-center">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M18 8a6 6 0 01-7.743 5.743L10 14l-4 4-4-4 4-4 .257-.257A6 6 0 1118 8zm-6-2a1 1 0 11-2 0 1 1 0 012 0z" clip-rule="evenodd"/>
                </svg>
            </div>
            <h2 class="text-3xl font-orbitron font-bold text-white mb-4">
                Two-Factor Authentication
            </h2>
            <p class="text-text-light mb-8">
                Enter the verification code from your authenticator app to complete OAuth login.
            </p>
        </div>
        
        <div class="card-dark">
            <!-- OAuth App Info -->
            {if $app_name}
                <div class="mb-6 p-4 bg-dark-surface border border-gray-700 rounded-lg text-center">
                    <p class="text-sm text-text-light">
                        Continuing login for <strong class="text-neon-green">{$app_name}</strong>
                    </p>
                </div>
            {/if}
            
            <form method="post" action="{$WEB_ROOT}/oauth/login.php" class="space-y-6">
                <input type="hidden" name="oauth_session" value="{$oauth_session}" />
                {if $client_id}
                    <input type="hidden" name="client_id" value="{$client_id}" />
                {/if}
                {if $redirect_uri}
                    <input type="hidden" name="redirect_uri" value="{$redirect_uri}" />
                {/if}
                {if $state}
                    <input type="hidden" name="state" value="{$state}" />
                {/if}
                
                {if $incorrectcode}
                    <div class="bg-red-900 border border-red-700 rounded-lg p-4">
                        <div class="flex">
                            <svg class="w-5 h-5 text-red-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                            </svg>
                            <div class="text-red-200 text-sm">
                                The verification code you entered is incorrect. Please try again.
                            </div>
                        </div>
                    </div>
                {/if}
                
                <div>
                    <label for="code" class="block text-sm font-medium text-white mb-2">
                        Verification Code
                    </label>
                    <input type="text" 
                           id="code" 
                           name="code" 
                           required 
                           maxlength="6"
                           pattern="[0-9]{6}"
                           class="input-dark w-full text-center text-2xl tracking-widest" 
                           placeholder="000000"
                           autocomplete="one-time-code"
                           autofocus>
                    <p class="text-text-light text-xs mt-1">
                        Enter the 6-digit code from your authenticator app
                    </p>
                </div>
                
                <button type="submit" name="submit" class="btn-primary w-full">
                    Verify and Continue
                </button>
                
                <!-- Trust This Device -->
                <div class="flex items-center">
                    <input type="checkbox" 
                           id="trustdevice" 
                           name="trustdevice" 
                           value="1"
                           class="rounded border-gray-600 bg-dark-surface text-neon-green focus:ring-neon-green">
                    <label for="trustdevice" class="ml-2 text-sm text-text-light">
                        Trust this device for OAuth logins (30 days)
                    </label>
                </div>
            </form>
            
            <!-- Backup Options -->
            <div class="mt-6 pt-6 border-t border-gray-700">
                <p class="text-text-light text-sm mb-4">Can't access your authenticator app?</p>
                <div class="space-y-2">
                    <a href="{$WEB_ROOT}/oauth/login.php?action=recovery&oauth_session={$oauth_session}" 
                       class="block text-electric-blue hover:text-neon-green transition-colors duration-300 text-sm">
                        Use backup recovery code
                    </a>
                    <a href="{$WEB_ROOT}/submitticket.php" 
                       class="block text-electric-blue hover:text-neon-green transition-colors duration-300 text-sm">
                        Contact support for help
                    </a>
                </div>
            </div>
        </div>
        
        <!-- Security Notice -->
        <div class="text-center">
            <div class="inline-flex items-center space-x-2 text-sm text-text-light">
                <svg class="w-4 h-4 text-neon-green" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                </svg>
                <span>Secure OAuth authentication in progress</span>
            </div>
        </div>
        
        <div class="text-center">
            <a href="{$WEB_ROOT}/oauth/login.php?action=cancel&oauth_session={$oauth_session}" 
               class="text-neon-green hover:text-electric-blue transition-colors duration-300">
                ← Cancel OAuth Login
            </a>
        </div>
    </div>
</div>

<script>
// Auto-format verification code input
document.getElementById('code').addEventListener('input', function(e) {
    // Remove any non-numeric characters
    this.value = this.value.replace(/[^0-9]/g, '');
    
    // Auto-submit when 6 digits are entered
    if (this.value.length === 6) {
        // Slight delay to show the complete code
        setTimeout(() => {
            this.form.submit();
        }, 100);
    }
});

// Auto-focus and select all on load
document.addEventListener('DOMContentLoaded', function() {
    const codeInput = document.getElementById('code');
    codeInput.focus();
    codeInput.select();
});
</script>
{/capture}

{include file="$template/oauth/layout.tpl" content=$smarty.capture.oauth_content}