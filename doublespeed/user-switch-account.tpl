{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Switch Account</h1>
            
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
            
            <div class="space-y-6">
                {if $accounts}
                    <div class="bg-blue-900 border border-blue-700 rounded-lg p-4">
                        <p class="text-blue-200 text-sm">
                            Select an account to switch to. You have access to the following accounts:
                        </p>
                    </div>
                    
                    <div class="space-y-4">
                        {foreach $accounts as $account}
                            <div class="bg-dark-bg rounded-lg p-4 border border-gray-600 hover:border-neon-green transition-colors">
                                <div class="flex justify-between items-center">
                                    <div>
                                        <h3 class="text-lg font-semibold text-white">{$account.name}</h3>
                                        <p class="text-text-light text-sm">{$account.email}</p>
                                        <p class="text-text-light text-xs">Role: {$account.role}</p>
                                    </div>
                                    <div>
                                        {if $account.current}
                                            <span class="px-3 py-2 bg-neon-green text-dark-bg rounded-lg font-semibold">
                                                Current Account
                                            </span>
                                        {else}
                                            <a href="{$WEB_ROOT}/switch-account.php?id={$account.id}" class="btn-primary btn-sm">
                                                Switch to Account
                                            </a>
                                        {/if}
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                {else}
                    <div class="text-center py-12">
                        <p class="text-text-light">You don't have access to any other accounts.</p>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
