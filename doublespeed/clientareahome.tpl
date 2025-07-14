{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-7xl mx-auto">
        
        <!-- Welcome Section -->
        <div class="mb-8">
            <div class="bg-dark-surface border border-gray-700 rounded-lg p-6">
                <div class="flex items-center justify-between">
                    <div>
                        <h1 class="text-3xl font-orbitron font-bold text-white mb-2">
                            Welcome back, <span class="glow-text">{$clientsdetails.firstname}</span>
                        </h1>
                        <p class="text-text-light">
                            Manage your hosting services, domains, and support tickets from your dashboard.
                        </p>
                    </div>
                    <div class="hidden md:block">
                        <div class="w-16 h-16 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center">
                            <span class="text-dark-bg font-bold text-xl">{$clientsdetails.firstname|substr:0:1}{$clientsdetails.lastname|substr:0:1}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Quick Stats -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-neon-green mb-2">{$numactiveservices}</div>
                <div class="text-text-light text-sm">Active Services</div>
            </div>
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-electric-blue mb-2">{$numdomains}</div>
                <div class="text-text-light text-sm">Domains</div>
            </div>
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-cyber-purple mb-2">{$numtickets}</div>
                <div class="text-text-light text-sm">Open Tickets</div>
            </div>
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-neon-green mb-2">{$numunpaidinvoices}</div>
                <div class="text-text-light text-sm">Unpaid Invoices</div>
            </div>
        </div>
        
        <!-- Main Dashboard Content -->
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            
            <!-- Services Overview -->
            <div class="card-dark">
                <div class="flex items-center justify-between mb-6">
                    <h2 class="text-xl font-orbitron font-semibold text-white">Your Services</h2>
                    <a href="{$WEB_ROOT}/clientarea.php?action=services" class="text-neon-green hover:text-electric-blue transition-colors duration-300 text-sm">
                        View All →
                    </a>
                </div>
                
                {if $services}
                    <div class="space-y-4">
                        {foreach from=$services item=service name=services}
                            {if $smarty.foreach.services.index < 3}
                                <div class="bg-dark-bg border border-gray-700 rounded-lg p-4 hover:border-neon-green transition-all duration-300">
                                    <div class="flex items-center justify-between">
                                        <div>
                                            <h3 class="text-white font-medium">{$service.product}</h3>
                                            <p class="text-text-light text-sm">{$service.domain}</p>
                                        </div>
                                        <div class="text-right">
                                            <span class="inline-block px-3 py-1 rounded-full text-xs font-medium
                                                {if $service.status eq 'Active'}bg-neon-green text-dark-bg
                                                {elseif $service.status eq 'Suspended'}bg-red-500 text-white
                                                {else}bg-yellow-500 text-dark-bg{/if}">
                                                {$service.status}
                                            </span>
                                            <div class="text-text-light text-sm mt-1">
                                                Next Due: {$service.nextduedate}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            {/if}
                        {/foreach}
                    </div>
                {else}
                    <div class="text-center py-8">
                        <svg class="w-16 h-16 text-text-light mx-auto mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"/>
                        </svg>
                        <p class="text-text-light mb-4">No active services found</p>
                        <a href="{$WEB_ROOT}/cart.php" class="btn-primary">Browse Hosting Plans</a>
                    </div>
                {/if}
            </div>
            
            <!-- Recent Invoices -->
            <div class="card-dark">
                <div class="flex items-center justify-between mb-6">
                    <h2 class="text-xl font-orbitron font-semibold text-white">Recent Invoices</h2>
                    <a href="{$WEB_ROOT}/clientarea.php?action=invoices" class="text-neon-green hover:text-electric-blue transition-colors duration-300 text-sm">
                        View All →
                    </a>
                </div>
                
                {if $invoices}
                    <div class="space-y-4">
                        {foreach from=$invoices item=invoice name=invoices}
                            {if $smarty.foreach.invoices.index < 3}
                                <div class="bg-dark-bg border border-gray-700 rounded-lg p-4 hover:border-neon-green transition-all duration-300">
                                    <div class="flex items-center justify-between">
                                        <div>
                                            <h3 class="text-white font-medium">Invoice #{$invoice.id}</h3>
                                            <p class="text-text-light text-sm">{$invoice.datedue}</p>
                                        </div>
                                        <div class="text-right">
                                            <div class="text-white font-medium">{$invoice.total}</div>
                                            <span class="inline-block px-3 py-1 rounded-full text-xs font-medium
                                                {if $invoice.status eq 'Paid'}bg-neon-green text-dark-bg
                                                {elseif $invoice.status eq 'Unpaid'}bg-red-500 text-white
                                                {else}bg-yellow-500 text-dark-bg{/if}">
                                                {$invoice.status}
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            {/if}
                        {/foreach}
                    </div>
                {else}
                    <div class="text-center py-8">
                        <svg class="w-16 h-16 text-text-light mx-auto mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                        </svg>
                        <p class="text-text-light">No invoices found</p>
                    </div>
                {/if}
            </div>
            
            <!-- Support Tickets -->
            <div class="card-dark">
                <div class="flex items-center justify-between mb-6">
                    <h2 class="text-xl font-orbitron font-semibold text-white">Support Tickets</h2>
                    <a href="{$WEB_ROOT}/clientarea.php?action=tickets" class="text-neon-green hover:text-electric-blue transition-colors duration-300 text-sm">
                        View All →
                    </a>
                </div>
                
                {if $tickets}
                    <div class="space-y-4">
                        {foreach from=$tickets item=ticket name=tickets}
                            {if $smarty.foreach.tickets.index < 3}
                                <div class="bg-dark-bg border border-gray-700 rounded-lg p-4 hover:border-neon-green transition-all duration-300">
                                    <div class="flex items-center justify-between">
                                        <div>
                                            <h3 class="text-white font-medium">#{$ticket.tid} - {$ticket.subject}</h3>
                                            <p class="text-text-light text-sm">{$ticket.lastreply}</p>
                                        </div>
                                        <div class="text-right">
                                            <span class="inline-block px-3 py-1 rounded-full text-xs font-medium
                                                {if $ticket.status eq 'Open'}bg-neon-green text-dark-bg
                                                {elseif $ticket.status eq 'Customer-Reply'}bg-electric-blue text-white
                                                {elseif $ticket.status eq 'Answered'}bg-cyber-purple text-white
                                                {else}bg-gray-500 text-white{/if}">
                                                {$ticket.status}
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            {/if}
                        {/foreach}
                    </div>
                {else}
                    <div class="text-center py-8">
                        <svg class="w-16 h-16 text-text-light mx-auto mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z"/>
                        </svg>
                        <p class="text-text-light mb-4">No support tickets</p>
                        <a href="{$WEB_ROOT}/submitticket.php" class="btn-primary">Submit New Ticket</a>
                    </div>
                {/if}
            </div>
            
            <!-- Quick Actions -->
            <div class="card-dark">
                <h2 class="text-xl font-orbitron font-semibold text-white mb-6">Quick Actions</h2>
                
                <div class="grid grid-cols-2 gap-4">
                    <a href="{$WEB_ROOT}/cart.php" class="group bg-gradient-to-br from-neon-green to-electric-blue p-4 rounded-lg text-center hover:scale-105 transition-transform duration-300">
                        <svg class="w-8 h-8 text-dark-bg mx-auto mb-2" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z"/>
                        </svg>
                        <span class="text-dark-bg font-medium text-sm">Order Services</span>
                    </a>
                    
                    <a href="{$WEB_ROOT}/domainchecker.php" class="group bg-gradient-to-br from-electric-blue to-cyber-purple p-4 rounded-lg text-center hover:scale-105 transition-transform duration-300">
                        <svg class="w-8 h-8 text-white mx-auto mb-2" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M12.316 3.051a1 1 0 01.633 1.265l-4 12a1 1 0 11-1.898-.632l4-12a1 1 0 011.265-.633zM5.707 6.293a1 1 0 010 1.414L3.414 10l2.293 2.293a1 1 0 11-1.414 1.414l-3-3a1 1 0 010-1.414l3-3a1 1 0 011.414 0zm8.586 0a1 1 0 011.414 0l3 3a1 1 0 010 1.414l-3 3a1 1 0 11-1.414-1.414L16.586 10l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-white font-medium text-sm">Register Domain</span>
                    </a>
                    
                    <a href="{$WEB_ROOT}/submitticket.php" class="group bg-gradient-to-br from-cyber-purple to-neon-green p-4 rounded-lg text-center hover:scale-105 transition-transform duration-300">
                        <svg class="w-8 h-8 text-white mx-auto mb-2" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-3a1 1 0 00-.867.5 1 1 0 11-1.731-1A3 3 0 0113 8a3.001 3.001 0 01-2 2.83V11a1 1 0 11-2 0v-1a1 1 0 011-1 1 1 0 100-2zm0 8a1 1 0 100-2 1 1 0 000 2z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-white font-medium text-sm">Get Support</span>
                    </a>
                    
                    <a href="{$WEB_ROOT}/clientarea.php?action=details" class="group bg-gradient-to-br from-neon-green to-cyber-purple p-4 rounded-lg text-center hover:scale-105 transition-transform duration-300">
                        <svg class="w-8 h-8 text-dark-bg mx-auto mb-2" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-6-3a2 2 0 11-4 0 2 2 0 014 0zm-2 4a5 5 0 00-4.546 2.916A5.986 5.986 0 0010 16a5.986 5.986 0 004.546-2.084A5 5 0 0010 11z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-dark-bg font-medium text-sm">Edit Profile</span>
                    </a>
                </div>
            </div>
        </div>
        
        <!-- Account Status Alerts -->
        {if $numunpaidinvoices > 0}
            <div class="mt-8">
                <div class="bg-red-900 border border-red-700 rounded-lg p-6">
                    <div class="flex items-center">
                        <svg class="w-8 h-8 text-red-400 mr-4" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
                        </svg>
                        <div>
                            <h3 class="text-white font-semibold">Payment Required</h3>
                            <p class="text-red-200 text-sm">You have {$numunpaidinvoices} unpaid invoice{if $numunpaidinvoices > 1}s{/if}. Please pay to avoid service interruption.</p>
                        </div>
                        <a href="{$WEB_ROOT}/clientarea.php?action=invoices" class="ml-auto btn-primary">View Invoices</a>
                    </div>
                </div>
            </div>
        {/if}
    </div>
</div>

{include file="$template/footer.tpl"}