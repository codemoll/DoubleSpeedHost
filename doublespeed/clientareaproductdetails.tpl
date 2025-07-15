{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-20 px-4 sm:px-6 lg:px-8">
    <div class="max-w-4xl mx-auto">
        <!-- Breadcrumb -->
        <div class="flex items-center text-sm text-text-light mb-6">
            <a href="{$WEB_ROOT}/clientarea.php" class="hover:text-neon-green">Client Area</a>
            <svg class="w-4 h-4 mx-2" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"/>
            </svg>
            <a href="{$WEB_ROOT}/clientarea.php?action=products" class="hover:text-neon-green">My Products</a>
            <svg class="w-4 h-4 mx-2" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"/>
            </svg>
            <span>{if $product.product}{$product.product}{else}Product Details{/if}</span>
        </div>

        <!-- Product Header -->
        <div class="card-dark mb-8">
            <div class="flex items-center justify-between mb-6">
                <div class="flex items-center space-x-4">
                    <div class="w-16 h-16 bg-gradient-to-br from-neon-green to-electric-blue rounded-lg flex items-center justify-center">
                        <svg class="w-8 h-8 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z"/>
                        </svg>
                    </div>
                    <div>
                        <h1 class="text-2xl font-orbitron font-bold text-white">{if $product.product}{$product.product}{else}Web Hosting Service{/if}</h1>
                        <p class="text-text-light">{if $product.domain}{$product.domain}{else}example.com{/if}</p>
                    </div>
                </div>
                
                <div class="text-right">
                    <div class="flex items-center space-x-2 mb-2">
                        <div class="w-3 h-3 rounded-full {if $product.status eq 'Active'}bg-green-500{elseif $product.status eq 'Suspended'}bg-red-500{else}bg-yellow-500{/if}"></div>
                        <span class="font-medium {if $product.status eq 'Active'}text-green-400{elseif $product.status eq 'Suspended'}text-red-400{else}text-yellow-400{/if}">
                            {if $product.status}{$product.status}{else}Active{/if}
                        </span>
                    </div>
                    <p class="text-text-light text-sm">Next Due: {if $product.nextduedate}{$product.nextduedate}{else}2024-12-15{/if}</p>
                </div>
            </div>

            <!-- Quick Actions -->
            <div class="flex flex-wrap gap-3">
                {if $product.status eq 'Active'}
                    {if $product.serverdata.cpanelurl}
                        <a href="{$product.serverdata.cpanelurl}" target="_blank" class="btn-primary">
                            cPanel Login
                        </a>
                    {/if}
                    {if $product.serverdata.webmailurl}
                        <a href="{$product.serverdata.webmailurl}" target="_blank" class="btn-secondary">
                            Webmail
                        </a>
                    {/if}
                {/if}
                <a href="{$WEB_ROOT}/submitticket.php?deptid=1" class="btn-outline">
                    Get Support
                </a>
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <!-- Main Content -->
            <div class="lg:col-span-2 space-y-8">
                <!-- Product Information -->
                <div class="card-dark">
                    <h2 class="text-xl font-orbitron font-semibold text-white mb-6">Product Information</h2>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-sm font-medium text-text-light mb-1">Product/Service</label>
                            <p class="text-white">{if $product.product}{$product.product}{else}Shared Hosting - Basic{/if}</p>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-text-light mb-1">Domain</label>
                            <p class="text-white">{if $product.domain}{$product.domain}{else}example.com{/if}</p>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-text-light mb-1">Registration Date</label>
                            <p class="text-white">{if $product.regdate}{$product.regdate}{else}2024-01-15{/if}</p>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-text-light mb-1">Next Due Date</label>
                            <p class="text-white">{if $product.nextduedate}{$product.nextduedate}{else}2024-12-15{/if}</p>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-text-light mb-1">Billing Cycle</label>
                            <p class="text-white">{if $product.billingcycle}{$product.billingcycle}{else}Annually{/if}</p>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-text-light mb-1">Recurring Amount</label>
                            <p class="text-white">{if $product.amount}{$product.amount}{else}$99.99{/if}</p>
                        </div>
                    </div>
                </div>

                <!-- Usage Statistics -->
                {if $product.usage || !$product}
                    <div class="card-dark">
                        <h2 class="text-xl font-orbitron font-semibold text-white mb-6">Usage Statistics</h2>
                        
                        <div class="space-y-6">
                            <!-- Disk Usage -->
                            <div>
                                <div class="flex justify-between items-center mb-2">
                                    <span class="text-text-light">Disk Space</span>
                                    <span class="text-white text-sm">
                                        {if $product.usage.disk}
                                            {$product.usage.disk.used} / {$product.usage.disk.limit}
                                        {else}
                                            2.1 GB / 10 GB
                                        {/if}
                                    </span>
                                </div>
                                <div class="w-full bg-gray-700 rounded-full h-2">
                                    <div class="bg-gradient-to-r from-neon-green to-electric-blue h-2 rounded-full" 
                                         style="width: {if $product.usage.disk}{$product.usage.disk.percentage}{else}21{/if}%"></div>
                                </div>
                            </div>

                            <!-- Bandwidth Usage -->
                            <div>
                                <div class="flex justify-between items-center mb-2">
                                    <span class="text-text-light">Bandwidth</span>
                                    <span class="text-white text-sm">
                                        {if $product.usage.bandwidth}
                                            {$product.usage.bandwidth.used} / {$product.usage.bandwidth.limit}
                                        {else}
                                            45 GB / 100 GB
                                        {/if}
                                    </span>
                                </div>
                                <div class="w-full bg-gray-700 rounded-full h-2">
                                    <div class="bg-gradient-to-r from-electric-blue to-cyber-purple h-2 rounded-full" 
                                         style="width: {if $product.usage.bandwidth}{$product.usage.bandwidth.percentage}{else}45{/if}%"></div>
                                </div>
                            </div>

                            <!-- Email Accounts -->
                            <div>
                                <div class="flex justify-between items-center mb-2">
                                    <span class="text-text-light">Email Accounts</span>
                                    <span class="text-white text-sm">
                                        {if $product.usage.email}
                                            {$product.usage.email.used} / {$product.usage.email.limit}
                                        {else}
                                            3 / Unlimited
                                        {/if}
                                    </span>
                                </div>
                                <div class="w-full bg-gray-700 rounded-full h-2">
                                    <div class="bg-gradient-to-r from-cyber-purple to-neon-green h-2 rounded-full" 
                                         style="width: {if $product.usage.email}{$product.usage.email.percentage}{else}10{/if}%"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}

                <!-- Server Information -->
                {if $product.serverdata || !$product}
                    <div class="card-dark">
                        <h2 class="text-xl font-orbitron font-semibold text-white mb-6">Server Information</h2>
                        
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label class="block text-sm font-medium text-text-light mb-1">Server Name</label>
                                <p class="text-white">{if $product.serverdata.servername}{$product.serverdata.servername}{else}server1.doublespeedhost.com{/if}</p>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-text-light mb-1">IP Address</label>
                                <p class="text-white">{if $product.serverdata.dedicatedip}{$product.serverdata.dedicatedip}{else}192.168.1.100{/if}</p>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-text-light mb-1">Username</label>
                                <p class="text-white">{if $product.username}{$product.username}{else}user123{/if}</p>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-text-light mb-1">Control Panel</label>
                                <p class="text-white">cPanel</p>
                            </div>
                        </div>
                    </div>
                {/if}
            </div>

            <!-- Sidebar -->
            <div class="space-y-6">
                <!-- Recent Invoices -->
                <div class="card-dark">
                    <h3 class="text-lg font-orbitron font-semibold text-white mb-4">Recent Invoices</h3>
                    
                    {if $invoices}
                        <div class="space-y-3">
                            {foreach from=$invoices item=invoice}
                                <div class="flex items-center justify-between p-3 border border-gray-700 rounded-lg">
                                    <div>
                                        <p class="text-white text-sm font-medium">#{$invoice.id}</p>
                                        <p class="text-text-light text-xs">{$invoice.date}</p>
                                    </div>
                                    <div class="text-right">
                                        <p class="text-white text-sm">{$invoice.total}</p>
                                        <span class="text-xs px-2 py-1 rounded-full {if $invoice.status eq 'Paid'}bg-green-900 text-green-200{else}bg-red-900 text-red-200{/if}">
                                            {$invoice.status}
                                        </span>
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    {else}
                        <div class="space-y-3">
                            <div class="flex items-center justify-between p-3 border border-gray-700 rounded-lg">
                                <div>
                                    <p class="text-white text-sm font-medium">#12345</p>
                                    <p class="text-text-light text-xs">2024-01-15</p>
                                </div>
                                <div class="text-right">
                                    <p class="text-white text-sm">$99.99</p>
                                    <span class="text-xs px-2 py-1 rounded-full bg-green-900 text-green-200">Paid</span>
                                </div>
                            </div>
                        </div>
                    {/if}
                    
                    <a href="{$WEB_ROOT}/clientarea.php?action=invoices" class="block text-center text-neon-green hover:text-electric-blue text-sm mt-4">
                        View All Invoices
                    </a>
                </div>

                <!-- Support Tickets -->
                <div class="card-dark">
                    <h3 class="text-lg font-orbitron font-semibold text-white mb-4">Recent Tickets</h3>
                    
                    {if $tickets}
                        <div class="space-y-3">
                            {foreach from=$tickets item=ticket}
                                <div class="p-3 border border-gray-700 rounded-lg">
                                    <div class="flex items-center justify-between mb-2">
                                        <p class="text-white text-sm font-medium">#{$ticket.tid}</p>
                                        <span class="text-xs px-2 py-1 rounded-full {if $ticket.status eq 'Open'}bg-yellow-900 text-yellow-200{elseif $ticket.status eq 'Answered'}bg-blue-900 text-blue-200{else}bg-gray-900 text-gray-200{/if}">
                                            {$ticket.status}
                                        </span>
                                    </div>
                                    <p class="text-text-light text-xs">{$ticket.subject}</p>
                                    <p class="text-text-light text-xs mt-1">{$ticket.date}</p>
                                </div>
                            {/foreach}
                        </div>
                    {else}
                        <div class="text-center py-6">
                            <svg class="w-8 h-8 text-text-light mx-auto mb-2" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                            </svg>
                            <p class="text-text-light text-sm">No recent tickets</p>
                        </div>
                    {/if}
                    
                    <a href="{$WEB_ROOT}/submitticket.php" class="btn-outline w-full text-center mt-4">
                        Open New Ticket
                    </a>
                </div>

                <!-- Quick Links -->
                <div class="card-dark">
                    <h3 class="text-lg font-orbitron font-semibold text-white mb-4">Quick Actions</h3>
                    
                    <div class="space-y-2">
                        <a href="{$WEB_ROOT}/clientarea.php?action=changepw" class="block p-3 text-white hover:bg-dark-bg-alt rounded-lg transition-colors duration-300">
                            Change Password
                        </a>
                        <a href="{$WEB_ROOT}/clientarea.php?action=details" class="block p-3 text-white hover:bg-dark-bg-alt rounded-lg transition-colors duration-300">
                            Update Details
                        </a>
                        <a href="{$WEB_ROOT}/clientarea.php?action=addfunds" class="block p-3 text-white hover:bg-dark-bg-alt rounded-lg transition-colors duration-300">
                            Add Funds
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}