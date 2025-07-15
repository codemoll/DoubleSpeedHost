{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-6xl mx-auto">
        
        <!-- Page Header -->
        <div class="mb-8">
            <div class="flex items-center space-x-3 mb-4">
                <a href="{$WEB_ROOT}/clientarea.php?action=products" 
                   class="text-neon-green hover:text-electric-blue transition-colors duration-300">
                    <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z" clip-rule="evenodd"/>
                    </svg>
                </a>
                <h1 class="text-4xl font-orbitron font-bold text-white">
                    <span class="glow-text">Service Details</span>
                </h1>
            </div>
            <p class="text-text-light">
                Manage your service: <span class="text-neon-green font-semibold">{$product.productname}</span>
                {if $product.domain}
                    <span class="text-electric-blue">({$product.domain})</span>
                {/if}
            </p>
        </div>
        
        <!-- Service Status Alert -->
        {if $product.status == 'Suspended'}
            <div class="bg-orange-900 border border-orange-700 rounded-lg p-4 mb-8">
                <div class="flex">
                    <svg class="w-5 h-5 text-orange-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
                    </svg>
                    <div>
                        <div class="text-orange-200 text-sm font-medium">Service Suspended</div>
                        <div class="text-orange-300 text-xs mt-1">
                            This service has been suspended. Please contact support or pay any outstanding invoices to restore service.
                        </div>
                    </div>
                </div>
            </div>
        {elseif $product.status == 'Pending'}
            <div class="bg-blue-900 border border-blue-700 rounded-lg p-4 mb-8">
                <div class="flex">
                    <svg class="w-5 h-5 text-blue-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                    </svg>
                    <div>
                        <div class="text-blue-200 text-sm font-medium">Service Setup in Progress</div>
                        <div class="text-blue-300 text-xs mt-1">
                            Your service is being set up. You'll receive an email when it's ready.
                        </div>
                    </div>
                </div>
            </div>
        {/if}
        
        <!-- Service Overview -->
        <div class="card-dark mb-8">
            <div class="flex flex-col lg:flex-row lg:items-center lg:justify-between">
                <div class="mb-6 lg:mb-0">
                    <h2 class="text-2xl font-semibold text-white mb-4">
                        {$product.productname}
                        {if $product.domain}
                            <span class="text-neon-green">({$product.domain})</span>
                        {/if}
                    </h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm">
                        <div class="space-y-2">
                            <div class="flex justify-between">
                                <span class="text-text-light">Service ID:</span>
                                <span class="text-electric-blue font-mono">#{$product.id}</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-text-light">Status:</span>
                                <span class="text-{if $product.status == 'Active'}green-400{elseif $product.status == 'Suspended'}orange-400{else}red-400{/if}">
                                    {$product.status}
                                </span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-text-light">Registration Date:</span>
                                <span class="text-white">{$product.regdate}</span>
                            </div>
                        </div>
                        <div class="space-y-2">
                            <div class="flex justify-between">
                                <span class="text-text-light">Next Due Date:</span>
                                <span class="text-{if $product.overdue}red-400{else}white{/if}">{$product.nextduedate}</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-text-light">Billing Cycle:</span>
                                <span class="text-white">{$product.billingcycle}</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-text-light">Recurring Amount:</span>
                                <span class="text-neon-green">{$product.recurringamount}</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Action Buttons -->
                <div class="flex flex-col space-y-3 lg:ml-6">
                    {if $product.status == 'Active'}
                        {if $product.serverdata.cpanelurl}
                            <a href="{$product.serverdata.cpanelurl}" target="_blank" class="btn-primary text-center">
                                <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M3 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"/>
                                </svg>
                                Control Panel
                            </a>
                        {/if}
                        
                        {if $product.canupgrade}
                            <a href="{$WEB_ROOT}/upgrade.php?type=package&id={$product.id}" class="btn-secondary text-center">
                                <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 6a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 14a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"/>
                                </svg>
                                Upgrade
                            </a>
                        {/if}
                    {/if}
                    
                    {if $product.overdue}
                        <a href="{$WEB_ROOT}/viewinvoice.php?id={$product.overdueinvoiceid}" class="btn-primary text-center">
                            <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M4 4a2 2 0 00-2 2v1h16V6a2 2 0 00-2-2H4z"/>
                                <path fill-rule="evenodd" d="M18 9H2v5a2 2 0 002 2h12a2 2 0 002-2V9zM4 13a1 1 0 011-1h1a1 1 0 110 2H5a1 1 0 01-1-1zm5-1a1 1 0 100 2h1a1 1 0 100-2H9z" clip-rule="evenodd"/>
                            </svg>
                            Pay Outstanding Invoice
                        </a>
                    {/if}
                </div>
            </div>
        </div>
        
        <!-- Usage Statistics -->
        {if $product.usage}
            <div class="card-dark mb-8">
                <h3 class="text-xl font-semibold text-white mb-6">Usage Statistics</h3>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                    {if $product.usage.diskusage}
                        <div>
                            <div class="flex justify-between text-sm mb-2">
                                <span class="text-text-light">Disk Usage</span>
                                <span class="text-white">{$product.usage.diskusage.used} / {$product.usage.diskusage.limit}</span>
                            </div>
                            <div class="w-full bg-dark-bg rounded-full h-3">
                                <div class="bg-neon-green h-3 rounded-full transition-all duration-300" 
                                     style="width: {$product.usage.diskusage.percentage}%"></div>
                            </div>
                            <div class="text-xs text-text-light mt-1">
                                {$product.usage.diskusage.percentage}% used
                            </div>
                        </div>
                    {/if}
                    
                    {if $product.usage.bandwidth}
                        <div>
                            <div class="flex justify-between text-sm mb-2">
                                <span class="text-text-light">Bandwidth</span>
                                <span class="text-white">{$product.usage.bandwidth.used} / {$product.usage.bandwidth.limit}</span>
                            </div>
                            <div class="w-full bg-dark-bg rounded-full h-3">
                                <div class="bg-electric-blue h-3 rounded-full transition-all duration-300" 
                                     style="width: {$product.usage.bandwidth.percentage}%"></div>
                            </div>
                            <div class="text-xs text-text-light mt-1">
                                {$product.usage.bandwidth.percentage}% used
                            </div>
                        </div>
                    {/if}
                    
                    {if $product.usage.emails}
                        <div>
                            <div class="flex justify-between text-sm mb-2">
                                <span class="text-text-light">Email Accounts</span>
                                <span class="text-white">{$product.usage.emails.used} / {$product.usage.emails.limit}</span>
                            </div>
                            <div class="w-full bg-dark-bg rounded-full h-3">
                                <div class="bg-cyber-purple h-3 rounded-full transition-all duration-300" 
                                     style="width: {$product.usage.emails.percentage}%"></div>
                            </div>
                            <div class="text-xs text-text-light mt-1">
                                {$product.usage.emails.percentage}% used
                            </div>
                        </div>
                    {/if}
                </div>
                
                {if $product.usage.lastupdate}
                    <div class="mt-4 text-xs text-text-light">
                        Last updated: {$product.usage.lastupdate}
                    </div>
                {/if}
            </div>
        {/if}
        
        <!-- Service Configuration -->
        {if $product.configoptions}
            <div class="card-dark mb-8">
                <h3 class="text-xl font-semibold text-white mb-6">Service Configuration</h3>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    {foreach from=$product.configoptions item=option}
                        <div class="flex justify-between p-3 bg-dark-bg rounded border border-gray-700">
                            <span class="text-text-light">{$option.name}:</span>
                            <span class="text-white font-medium">{$option.value}</span>
                        </div>
                    {/foreach}
                </div>
            </div>
        {/if}
        
        <!-- Server Information -->
        {if $product.serverdata}
            <div class="card-dark mb-8">
                <h3 class="text-xl font-semibold text-white mb-6">Server Information</h3>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div class="space-y-3">
                        {if $product.serverdata.servername}
                            <div class="flex justify-between">
                                <span class="text-text-light">Server:</span>
                                <span class="text-white">{$product.serverdata.servername}</span>
                            </div>
                        {/if}
                        
                        {if $product.serverdata.serverip}
                            <div class="flex justify-between">
                                <span class="text-text-light">IP Address:</span>
                                <span class="text-white font-mono">{$product.serverdata.serverip}</span>
                            </div>
                        {/if}
                        
                        {if $product.serverdata.hostname}
                            <div class="flex justify-between">
                                <span class="text-text-light">Hostname:</span>
                                <span class="text-white">{$product.serverdata.hostname}</span>
                            </div>
                        {/if}
                    </div>
                    
                    <div class="space-y-3">
                        {if $product.serverdata.username}
                            <div class="flex justify-between">
                                <span class="text-text-light">Username:</span>
                                <span class="text-white font-mono">{$product.serverdata.username}</span>
                            </div>
                        {/if}
                        
                        {if $product.serverdata.password}
                            <div class="flex justify-between items-center">
                                <span class="text-text-light">Password:</span>
                                <div class="flex items-center space-x-2">
                                    <span class="text-white font-mono" id="password-display">
                                        ••••••••••••
                                    </span>
                                    <button onclick="togglePassword()" class="text-neon-green hover:text-electric-blue">
                                        <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20" id="show-icon">
                                            <path d="M10 12a2 2 0 100-4 2 2 0 000 4z"/>
                                            <path fill-rule="evenodd" d="M.458 10C1.732 5.943 5.522 3 10 3s8.268 2.943 9.542 7c-1.274 4.057-5.064 7-9.542 7S1.732 14.057.458 10zM14 10a4 4 0 11-8 0 4 4 0 018 0z" clip-rule="evenodd"/>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        {/if}
                        
                        {if $product.serverdata.nameservers}
                            <div>
                                <span class="text-text-light">Nameservers:</span>
                                <div class="mt-1 space-y-1">
                                    {foreach from=$product.serverdata.nameservers item=ns}
                                        <div class="text-white font-mono text-sm">{$ns}</div>
                                    {/foreach}
                                </div>
                            </div>
                        {/if}
                    </div>
                </div>
            </div>
        {/if}
        
        <!-- Available Actions -->
        <div class="card-dark mb-8">
            <h3 class="text-xl font-semibold text-white mb-6">Available Actions</h3>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                {if $product.modulebuttons}
                    {foreach from=$product.modulebuttons item=button}
                        <button onclick="performModuleAction('{$button.action}')" 
                                class="btn-outline w-full">
                            {$button.name}
                        </button>
                    {/foreach}
                {else}
                    <a href="{$WEB_ROOT}/submitticket.php" class="btn-outline text-center">
                        <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M18 13V5a2 2 0 00-2-2H4a2 2 0 00-2 2v8a2 2 0 002 2h3l3 3 3-3h3a2 2 0 002-2zM5 7a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zm1 3a1 1 0 100 2h3a1 1 0 100-2H6z" clip-rule="evenodd"/>
                        </svg>
                        Contact Support
                    </a>
                    
                    <a href="{$WEB_ROOT}/clientarea.php?action=cancel&id={$product.id}" class="btn-outline text-center">
                        <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z" clip-rule="evenodd"/>
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                        </svg>
                        Request Cancellation
                    </a>
                    
                    <a href="{$WEB_ROOT}/clientarea.php?action=invoices&serviceid={$product.id}" class="btn-outline text-center">
                        <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M4 4a2 2 0 00-2 2v8a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2H4zm0 2h12v8H4V6zm2 2a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm0 3a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1z" clip-rule="evenodd"/>
                        </svg>
                        View Invoices
                    </a>
                {/if}
            </div>
        </div>
        
        <!-- Addons -->
        {if $product.addons}
            <div class="card-dark">
                <h3 class="text-xl font-semibold text-white mb-6">Service Add-ons</h3>
                <div class="space-y-4">
                    {foreach from=$product.addons item=addon}
                        <div class="flex items-center justify-between p-4 bg-dark-bg rounded border border-gray-700">
                            <div>
                                <div class="text-white font-medium">{$addon.name}</div>
                                <div class="text-text-light text-sm">{$addon.description}</div>
                            </div>
                            <div class="text-right">
                                <div class="text-neon-green font-semibold">{$addon.recurring}</div>
                                <div class="text-text-light text-xs">{$addon.status}</div>
                            </div>
                        </div>
                    {/foreach}
                </div>
            </div>
        {/if}
    </div>
</div>

<script>
function togglePassword() {
    const display = document.getElementById('password-display');
    const icon = document.getElementById('show-icon');
    
    if (display.textContent === '••••••••••••') {
        display.textContent = '{$product.serverdata.password}';
        icon.innerHTML = '<path d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.878 9.878L8.464 8.464m1.414 1.414L8.464 8.464m5.656 5.656l1.415 1.414m-1.415-1.414l-2.121-2.121m2.121 2.121L16 16m0 0l-1.414-1.414M16 16l1.414 1.414M8.464 8.464L4 4"/>';
    } else {
        display.textContent = '••••••••••••';
        icon.innerHTML = '<path d="M10 12a2 2 0 100-4 2 2 0 000 4z"/><path fill-rule="evenodd" d="M.458 10C1.732 5.943 5.522 3 10 3s8.268 2.943 9.542 7c-1.274 4.057-5.064 7-9.542 7S1.732 14.057.458 10zM14 10a4 4 0 11-8 0 4 4 0 018 0z" clip-rule="evenodd"/>';
    }
}

function performModuleAction(action) {
    if (confirm('Are you sure you want to perform this action?')) {
        window.location.href = '{$WEB_ROOT}/clientarea.php?action=productdetails&id={$product.id}&modop=' + action;
    }
}
</script>

{include file="$template/footer.tpl"}