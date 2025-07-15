{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Account Switch Required</h1>
            
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
                <div class="mx-auto w-20 h-20 bg-gradient-to-br from-yellow-500 to-orange-500 rounded-full flex items-center justify-center mb-6">
                    <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
                    </svg>
                </div>
                
                <div>
                    <h2 class="text-2xl font-bold text-white mb-4">Account Switch Required</h2>
                    <p class="text-text-light mb-6">
                        You must switch to a different account to access this resource.
                    </p>
                </div>
                
                {if $availableaccounts}
                    <div class="text-left space-y-4">
                        <h3 class="text-lg font-semibold text-white text-center">Available Accounts:</h3>
                        {foreach $availableaccounts as $account}
                            <div class="bg-dark-bg rounded-lg p-4 border border-gray-600">
                                <div class="flex justify-between items-center">
                                    <div>
                                        <h4 class="font-semibold text-white">{$account.name}</h4>
                                        <p class="text-text-light text-sm">{$account.email}</p>
                                    </div>
                                    <a href="{$WEB_ROOT}/switch-account.php?id={$account.id}&redirect={$redirect}" 
                                       class="btn-primary btn-sm">
                                        Switch & Continue
                                    </a>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                {/if}
                
                <div class="pt-6">
                    <a href="{$WEB_ROOT}/clientarea.php" class="btn-outline">
                        Return to Client Area
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
