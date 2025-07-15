{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-6xl mx-auto">
        
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                <span class="glow-text">My Services</span>
            </h1>
            <p class="text-text-light">
                Manage your hosting services, view usage statistics, and access service-specific tools.
            </p>
        </div>
        
        <!-- Service Stats -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-neon-green mb-2">
                    {if $servicestats.total}{$servicestats.total}{else}0{/if}
                </div>
                <div class="text-text-light text-sm">Total Services</div>
            </div>
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-electric-blue mb-2">
                    {if $servicestats.active}{$servicestats.active}{else}0{/if}
                </div>
                <div class="text-text-light text-sm">Active</div>
            </div>
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-orange-400 mb-2">
                    {if $servicestats.suspended}{$servicestats.suspended}{else}0{/if}
                </div>
                <div class="text-text-light text-sm">Suspended</div>
            </div>
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-red-400 mb-2">
                    {if $servicestats.cancelled}{$servicestats.cancelled}{else}0{/if}
                </div>
                <div class="text-text-light text-sm">Cancelled</div>
            </div>
        </div>
        
        {if $services}
            <!-- Services List -->
            <div class="space-y-6">
                {foreach from=$services item=service}
                    <div class="card-dark">
                        <div class="flex flex-col lg:flex-row lg:items-center lg:justify-between">
                            <div class="flex-1">
                                <div class="flex items-start justify-between mb-4 lg:mb-0">
                                    <div>
                                        <h3 class="text-xl font-semibold text-white mb-2">
                                            {$service.productname}
                                            {if $service.domain}
                                                <span class="text-neon-green">({$service.domain})</span>
                                            {/if}
                                        </h3>
                                        <div class="space-y-1">
                                            <div class="flex items-center space-x-4 text-sm">
                                                <span class="text-text-light">Service ID:</span>
                                                <span class="text-electric-blue font-mono">#{$service.id}</span>
                                            </div>
                                            <div class="flex items-center space-x-4 text-sm">
                                                <span class="text-text-light">Registration Date:</span>
                                                <span class="text-text-light">{$service.regdate}</span>
                                            </div>
                                            <div class="flex items-center space-x-4 text-sm">
                                                <span class="text-text-light">Next Due Date:</span>
                                                <span class="text-{if $service.overdue}red-400{else}text-light{/if}">
                                                    {$service.nextduedate}
                                                </span>
                                            </div>
                                            <div class="flex items-center space-x-4 text-sm">
                                                <span class="text-text-light">Billing Cycle:</span>
                                                <span class="text-text-light">{$service.billingcycle}</span>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <!-- Status Badge -->
                                    <div>
                                        {if $service.status == 'Active'}
                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-green-900 text-green-200">
                                                <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                                                </svg>
                                                Active
                                            </span>
                                        {elseif $service.status == 'Suspended'}
                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-orange-900 text-orange-200">
                                                <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                                    <path fill-rule="evenodd" d="M13.477 14.89A6 6 0 015.11 6.524l8.367 8.368zm1.414-1.414L6.524 5.11a6 6 0 018.367 8.367zM18 10a8 8 0 11-16 0 8 8 0 0116 0z" clip-rule="evenodd"/>
                                                </svg>
                                                Suspended
                                            </span>
                                        {elseif $service.status == 'Pending'}
                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-yellow-900 text-yellow-200">
                                                <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-12a1 1 0 10-2 0v4a1 1 0 00.293.707l2.828 2.829a1 1 0 101.415-1.415L11 9.586V6z" clip-rule="evenodd"/>
                                                </svg>
                                                Pending
                                            </span>
                                        {elseif $service.status == 'Cancelled'}
                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-red-900 text-red-200">
                                                <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                                                </svg>
                                                Cancelled
                                            </span>
                                        {else}
                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-gray-900 text-gray-200">
                                                {$service.status}
                                            </span>
                                        {/if}
                                    </div>
                                </div>
                                
                                <!-- Service Details -->
                                {if $service.description}
                                    <p class="text-text-light text-sm mt-2">{$service.description}</p>
                                {/if}
                            </div>
                            
                            <!-- Action Buttons -->
                            <div class="flex flex-wrap gap-2 mt-4 lg:mt-0 lg:ml-6">
                                <a href="{$WEB_ROOT}/clientarea.php?action=productdetails&id={$service.id}" 
                                   class="btn-outline text-xs px-3 py-1">
                                    Manage
                                </a>
                                
                                {if $service.status == 'Active'}
                                    {if $service.serverdata.cpanelurl}
                                        <a href="{$service.serverdata.cpanelurl}" target="_blank"
                                           class="btn-secondary text-xs px-3 py-1">
                                            cPanel
                                        </a>
                                    {/if}
                                    
                                    {if $service.canupgrade}
                                        <a href="{$WEB_ROOT}/upgrade.php?type=package&id={$service.id}" 
                                           class="btn-primary text-xs px-3 py-1">
                                            Upgrade
                                        </a>
                                    {/if}
                                {/if}
                                
                                {if $service.overdue}
                                    <a href="{$WEB_ROOT}/viewinvoice.php?id={$service.overdueinvoiceid}" 
                                       class="btn-primary text-xs px-3 py-1">
                                        Pay Now
                                    </a>
                                {/if}
                            </div>
                        </div>
                        
                        <!-- Usage Information -->
                        {if $service.usage}
                            <div class="mt-4 pt-4 border-t border-gray-700">
                                <h4 class="text-sm font-medium text-white mb-3">Usage Statistics:</h4>
                                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                                    {if $service.usage.diskusage}
                                        <div>
                                            <div class="flex justify-between text-sm mb-1">
                                                <span class="text-text-light">Disk Usage</span>
                                                <span class="text-white">{$service.usage.diskusage.used} / {$service.usage.diskusage.limit}</span>
                                            </div>
                                            <div class="w-full bg-dark-bg rounded-full h-2">
                                                <div class="bg-neon-green h-2 rounded-full" style="width: {$service.usage.diskusage.percentage}%"></div>
                                            </div>
                                        </div>
                                    {/if}
                                    
                                    {if $service.usage.bandwidth}
                                        <div>
                                            <div class="flex justify-between text-sm mb-1">
                                                <span class="text-text-light">Bandwidth</span>
                                                <span class="text-white">{$service.usage.bandwidth.used} / {$service.usage.bandwidth.limit}</span>
                                            </div>
                                            <div class="w-full bg-dark-bg rounded-full h-2">
                                                <div class="bg-electric-blue h-2 rounded-full" style="width: {$service.usage.bandwidth.percentage}%"></div>
                                            </div>
                                        </div>
                                    {/if}
                                    
                                    {if $service.usage.emails}
                                        <div>
                                            <div class="flex justify-between text-sm mb-1">
                                                <span class="text-text-light">Email Accounts</span>
                                                <span class="text-white">{$service.usage.emails.used} / {$service.usage.emails.limit}</span>
                                            </div>
                                            <div class="w-full bg-dark-bg rounded-full h-2">
                                                <div class="bg-cyber-purple h-2 rounded-full" style="width: {$service.usage.emails.percentage}%"></div>
                                            </div>
                                        </div>
                                    {/if}
                                </div>
                            </div>
                        {/if}
                        
                        <!-- Service Configuration -->
                        {if $service.configoptions}
                            <div class="mt-4 pt-4 border-t border-gray-700">
                                <h4 class="text-sm font-medium text-white mb-3">Configuration:</h4>
                                <div class="grid grid-cols-1 md:grid-cols-2 gap-2 text-sm">
                                    {foreach from=$service.configoptions item=option}
                                        <div class="flex justify-between">
                                            <span class="text-text-light">{$option.name}:</span>
                                            <span class="text-white">{$option.value}</span>
                                        </div>
                                    {/foreach}
                                </div>
                            </div>
                        {/if}
                    </div>
                {/foreach}
            </div>
        {else}
            <!-- No Services -->
            <div class="card-dark text-center py-12">
                <div class="mx-auto w-20 h-20 bg-gradient-to-br from-gray-600 to-gray-700 rounded-full flex items-center justify-center mb-6">
                    <svg class="w-10 h-10 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M3 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">No Services Yet</h3>
                <p class="text-text-light mb-6">
                    You don't have any active services with us yet. Browse our hosting packages to get started.
                </p>
                <a href="{$WEB_ROOT}/cart.php" class="btn-primary">
                    Browse Hosting Plans
                </a>
            </div>
        {/if}
        
        <!-- Quick Actions -->
        <div class="mt-8 grid grid-cols-1 md:grid-cols-3 gap-6">
            <div class="card-dark text-center">
                <svg class="w-12 h-12 text-neon-green mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z" clip-rule="evenodd"/>
                </svg>
                <h3 class="text-lg font-semibold text-white mb-2">Order Service</h3>
                <p class="text-text-light text-sm mb-4">Browse and order new hosting services</p>
                <a href="{$WEB_ROOT}/cart.php" class="btn-outline">Browse Plans</a>
            </div>
            
            <div class="card-dark text-center">
                <svg class="w-12 h-12 text-electric-blue mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 6a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 14a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"/>
                </svg>
                <h3 class="text-lg font-semibold text-white mb-2">Usage Billing</h3>
                <p class="text-text-light text-sm mb-4">View detailed usage and billing information</p>
                <a href="{$WEB_ROOT}/clientarea.php?action=usagebilling" class="btn-outline">View Usage</a>
            </div>
            
            <div class="card-dark text-center">
                <svg class="w-12 h-12 text-cyber-purple mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M10 2a4 4 0 00-4 4v1H5a1 1 0 00-.994.89l-1 9A1 1 0 004 18h12a1 1 0 00.994-1.11l-1-9A1 1 0 0015 7h-1V6a4 4 0 00-4-4zm-2 5V6a2 2 0 114 0v1H8zm5 2.99l-.8 7.2H7.8L7 9.99h6z" clip-rule="evenodd"/>
                </svg>
                <h3 class="text-lg font-semibold text-white mb-2">Request Cancellation</h3>
                <p class="text-text-light text-sm mb-4">Submit a cancellation request for services</p>
                <a href="{$WEB_ROOT}/clientarea.php?action=cancel" class="btn-outline">Request Cancellation</a>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}