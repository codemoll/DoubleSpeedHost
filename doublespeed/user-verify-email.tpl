{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Verify Email Address</h1>
            
            {if $errormessage}
                <div class="bg-red-900 border border-red-700 rounded-lg p-4 mb-6">
                    <div class="flex">
                        <svg class="w-5 h-5 text-red-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                        </svg>
                        <div class="text-red-200 text-sm">
                            {$errormessage}
                        </div>
                    </div>
                </div>
            {/if}
            
            <div class="text-center space-y-6">
                <div class="mx-auto w-20 h-20 bg-gradient-to-br from-electric-blue to-cyber-purple rounded-full flex items-center justify-center mb-6">
                    <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                        <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                    </svg>
                </div>
                
                {if $verified}
                    <div>
                        <h2 class="text-2xl font-bold text-white mb-4">Email Verified Successfully!</h2>
                        <p class="text-text-light mb-6">
                            Your email address has been verified. You can now access all features of your account.
                        </p>
                    </div>
                    
                    <div class="space-y-4">
                        <a href="{$WEB_ROOT}/clientarea.php" class="btn-primary w-full block text-center">
                            Go to Client Area
                        </a>
                    </div>
                {else}
                    <div>
                        <h2 class="text-2xl font-bold text-white mb-4">Verify Your Email Address</h2>
                        <p class="text-text-light mb-6">
                            Please check your email and click the verification link to activate your account.
                        </p>
                    </div>
                    
                    <div class="space-y-4">
                        <form method="post" class="space-y-4">
                            <button type="submit" name="resend" class="btn-secondary w-full">
                                Resend Verification Email
                            </button>
                        </form>
                        <a href="{$WEB_ROOT}/clientarea.php" class="btn-outline w-full block text-center">
                            Return to Client Area
                        </a>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
