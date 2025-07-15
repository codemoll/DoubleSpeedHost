{* Linked Accounts Component *}
{* Usage: {include file="$template/includes/linkedaccounts.tpl" accounts=$linkedaccounts} *}

{if $linkedAccounts || $linkedaccounts}
    {assign var="accounts" value=$linkedAccounts|default:$linkedaccounts}
    
    <div class="linked-accounts-component">
        <div class="bg-dark-surface border border-gray-700 rounded-lg overflow-hidden">
            
            {* Header *}
            <div class="px-6 py-4 border-b border-gray-700 bg-gradient-to-r from-electric-blue/10 to-transparent">
                <div class="flex items-center justify-between">
                    <h3 class="text-lg font-semibold text-electric-blue">
                        <i class="fas fa-link mr-2"></i>
                        {$LANG.linkedaccounts|default:"Linked Accounts"}
                    </h3>
                    {if $allowLinking}
                        <button type="button" 
                                class="px-3 py-1 text-xs font-medium bg-electric-blue/20 text-electric-blue border border-electric-blue/30 rounded hover:bg-electric-blue/30 transition-colors duration-200"
                                onclick="showLinkAccountModal()">
                            <i class="fas fa-plus mr-1"></i>
                            {$LANG.linkaccount|default:"Link Account"}
                        </button>
                    {/if}
                </div>
            </div>
            
            {* Accounts List *}
            <div class="divide-y divide-gray-700">
                {if $accounts}
                    {foreach from=$accounts item=account}
                        <div class="px-6 py-4 hover:bg-gray-900/30 transition-colors duration-200">
                            <div class="flex items-center justify-between">
                                <div class="flex items-center">
                                    <div class="flex-shrink-0">
                                        {if $account.provider == 'google'}
                                            <i class="fab fa-google text-xl text-red-400"></i>
                                        {elseif $account.provider == 'facebook'}
                                            <i class="fab fa-facebook text-xl text-blue-400"></i>
                                        {elseif $account.provider == 'twitter'}
                                            <i class="fab fa-twitter text-xl text-blue-400"></i>
                                        {elseif $account.provider == 'github'}
                                            <i class="fab fa-github text-xl text-gray-400"></i>
                                        {elseif $account.provider == 'linkedin'}
                                            <i class="fab fa-linkedin text-xl text-blue-600"></i>
                                        {else}
                                            <i class="fas fa-user-circle text-xl text-gray-400"></i>
                                        {/if}
                                    </div>
                                    <div class="ml-3">
                                        <div class="text-sm font-medium text-white">
                                            {$account.provider_name|default:$account.provider|capitalize}
                                        </div>
                                        <div class="text-xs text-gray-400">
                                            {if $account.email}
                                                {$account.email}
                                            {elseif $account.username}
                                                @{$account.username}
                                            {else}
                                                {$LANG.linkedon|default:"Linked on"} {$account.created_at|date_format:"%B %e, %Y"}
                                            {/if}
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="flex items-center space-x-2">
                                    {if $account.status == 'active'}
                                        <span class="px-2 py-1 text-xs font-medium bg-green-900/50 text-green-400 border border-green-500 rounded-full">
                                            {$LANG.active|default:"Active"}
                                        </span>
                                    {elseif $account.status == 'pending'}
                                        <span class="px-2 py-1 text-xs font-medium bg-yellow-900/50 text-yellow-400 border border-yellow-500 rounded-full">
                                            {$LANG.pending|default:"Pending"}
                                        </span>
                                    {/if}
                                    
                                    {if $allowUnlinking}
                                        <button type="button" 
                                                class="text-red-400 hover:text-red-300 focus:outline-none text-sm"
                                                onclick="unlinkAccount('{$account.id}', '{$account.provider_name|default:$account.provider}')"
                                                title="{$LANG.unlink|default:'Unlink'}">
                                            <i class="fas fa-unlink"></i>
                                        </button>
                                    {/if}
                                </div>
                            </div>
                        </div>
                    {/foreach}
                {else}
                    <div class="px-6 py-8 text-center">
                        <div class="text-gray-400">
                            <i class="fas fa-link text-3xl mb-3 opacity-50"></i>
                            <p class="text-sm">
                                {$LANG.nolinkedaccounts|default:"No linked accounts found."}
                            </p>
                            {if $allowLinking}
                                <p class="text-xs mt-2">
                                    {$LANG.linkaccountdesc|default:"Link your social accounts for easier login."}
                                </p>
                            {/if}
                        </div>
                    </div>
                {/if}
            </div>
            
        </div>
    </div>
    
    {* Available Providers (if linking is allowed) *}
    {if $allowLinking && $availableProviders}
        <div class="mt-6 bg-dark-surface border border-gray-700 rounded-lg p-6">
            <h4 class="text-md font-medium text-white mb-4">
                <i class="fas fa-plus-circle mr-2"></i>
                {$LANG.availableproviders|default:"Available Providers"}
            </h4>
            
            <div class="grid grid-cols-2 md:grid-cols-4 gap-3">
                {foreach from=$availableProviders item=provider}
                    <a href="{$WEB_ROOT}/oauth/link.php?provider={$provider.id}" 
                       class="flex items-center justify-center p-3 border border-gray-600 rounded-lg hover:border-electric-blue/50 hover:bg-electric-blue/10 transition-all duration-200 group">
                        {if $provider.id == 'google'}
                            <i class="fab fa-google text-xl text-red-400 group-hover:text-red-300"></i>
                        {elseif $provider.id == 'facebook'}
                            <i class="fab fa-facebook text-xl text-blue-400 group-hover:text-blue-300"></i>
                        {elseif $provider.id == 'twitter'}
                            <i class="fab fa-twitter text-xl text-blue-400 group-hover:text-blue-300"></i>
                        {elseif $provider.id == 'github'}
                            <i class="fab fa-github text-xl text-gray-400 group-hover:text-gray-300"></i>
                        {elseif $provider.id == 'linkedin'}
                            <i class="fab fa-linkedin text-xl text-blue-600 group-hover:text-blue-500"></i>
                        {else}
                            <i class="fas fa-user-circle text-xl text-gray-400 group-hover:text-gray-300"></i>
                        {/if}
                        <span class="ml-2 text-sm text-gray-300 group-hover:text-white">
                            {$provider.name|default:$provider.id|capitalize}
                        </span>
                    </a>
                {/foreach}
            </div>
        </div>
    {/if}
{/if}

{* JavaScript for account management *}
<script>
function unlinkAccount(accountId, providerName) {
    if (confirm('{$LANG.confirmunlink|default:"Are you sure you want to unlink this account?"}' + ' (' + providerName + ')')) {
        // Submit form or make AJAX request to unlink account
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = window.location.href;
        
        const actionInput = document.createElement('input');
        actionInput.type = 'hidden';
        actionInput.name = 'action';
        actionInput.value = 'unlink';
        
        const accountInput = document.createElement('input');
        accountInput.type = 'hidden';
        accountInput.name = 'account_id';
        accountInput.value = accountId;
        
        form.appendChild(actionInput);
        form.appendChild(accountInput);
        document.body.appendChild(form);
        form.submit();
    }
}

function showLinkAccountModal() {
    // Show modal or redirect to linking page
    window.location.href = '{$WEB_ROOT}/oauth/link.php';
}
</script>