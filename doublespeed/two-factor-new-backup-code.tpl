{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Two-Factor Backup Code</h1>
            
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
                <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                    <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M18 8a6 6 0 01-7.743 5.743L10 14l-1 1-1 1H6l-2-2v-2l4.257-4.257A6 6 0 1118 8zm-6-4a1 1 0 100 2 2 2 0 012 2 1 1 0 102 0 4 4 0 00-4-4z" clip-rule="evenodd"/>
                    </svg>
                </div>
                
                <div>
                    <h2 class="text-2xl font-bold text-white mb-4">New Backup Code Generated</h2>
                    <p class="text-text-light mb-6">
                        Please save this backup code in a secure location. You can use it to access your account if you lose your two-factor authentication device.
                    </p>
                </div>
                
                {if $backupcode}
                    <div class="bg-dark-bg rounded-lg p-6 border-2 border-neon-green">
                        <h3 class="text-lg font-semibold text-white mb-4">Your Backup Code:</h3>
                        <div class="bg-dark-surface rounded p-4 font-mono text-2xl text-neon-green tracking-wider">
                            {$backupcode}
                        </div>
                        <p class="text-text-light text-sm mt-4">
                            This code can only be used once. Store it safely and do not share it with anyone.
                        </p>
                    </div>
                {/if}
                
                <div class="space-y-4">
                    <button onclick="window.print()" class="btn-secondary w-full">
                        Print Backup Code
                    </button>
                    <a href="{$WEB_ROOT}/clientarea.php?action=security" class="btn-primary w-full block text-center">
                        Return to Security Settings
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
