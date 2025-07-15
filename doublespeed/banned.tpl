{include file="$template/header.tpl"}

<div class="min-h-screen flex items-center justify-center bg-dark-bg py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full space-y-8">
        <div class="text-center">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-red-500 to-red-700 rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-white" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
                </svg>
            </div>
            <h2 class="text-3xl font-orbitron font-bold text-white mb-4">
                Account Banned
            </h2>
            <p class="text-text-light mb-8">
                Your account has been temporarily suspended. Please contact our support team for assistance.
            </p>
        </div>
        
        <div class="card-dark">
            {if $reason}
                <div class="bg-red-900 border border-red-700 rounded-lg p-4 mb-6">
                    <h3 class="text-red-200 font-semibold mb-2">Suspension Reason:</h3>
                    <p class="text-red-300 text-sm">{$reason}</p>
                </div>
            {/if}
            
            <div class="text-center">
                <h3 class="text-xl font-semibold text-white mb-4">Need Help?</h3>
                <p class="text-text-light mb-6">
                    Our support team is available 24/7 to help resolve any issues with your account.
                </p>
                
                <div class="space-y-4">
                    <a href="{$WEB_ROOT}/submitticket.php" class="btn-primary w-full block text-center">
                        Contact Support
                    </a>
                    
                    <div class="text-sm text-text-light">
                        <p>Or reach us directly:</p>
                        <div class="mt-2 space-y-1">
                            <p>📧 {if isset($templatefile) && is_array($templatefile) && $templatefile.supportemail}support@{$templatefile.supportemail}{else}support@{$companyname|lower|replace:' ':''}.com{/if}</p>
                            <p>📞 {if isset($templatefile) && is_array($templatefile) && $templatefile.supportphone}{$templatefile.supportphone}{else}+1 (555) 123-4567{/if}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="text-center">
            <a href="{$WEB_ROOT}/index.php" class="text-neon-green hover:text-electric-blue transition-colors duration-300">
                ← Return to Homepage
            </a>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}