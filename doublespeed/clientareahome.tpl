{include file="$template/header.tpl"}

{* Function to render MarketConnect promotion panels with Bootstrap classes *}
{function name=outputHomePanels}
    <div menuItemName="{$item->getName()}" class="card mb-4 panel-marketing{if $item->getClass()} {$item->getClass()}{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
        
        {* Header with title and button *}
        <div class="card-header d-flex justify-content-between align-items-center">
            <h5 class="card-title mb-0 d-flex align-items-center">
                {if $item->hasIcon()}<i class="{$item->getIcon()} me-2 text-primary"></i>{/if}
                {$item->getLabel()}
                {if $item->hasBadge()}<span class="badge bg-primary ms-2">{$item->getBadge()}</span>{/if}
            </h5>
            {if $item->getExtra('btn-link') && $item->getExtra('btn-text')}
                <a href="{$item->getExtra('btn-link')}" class="btn btn-primary btn-sm">
                    {if $item->getExtra('btn-icon')}<i class="{$item->getExtra('btn-icon')} me-1"></i>{/if}
                    {$item->getExtra('btn-text')}
                </a>
            {/if}
        </div>
        
        {* Body content *}
        {if $item->hasBodyHtml()}
            <div class="card-body">
                {$item->getBodyHtml()}
            </div>
        {/if}
        
        {* Child items as list *}
        {if $item->hasChildren()}
            <div class="list-group list-group-flush">
                {foreach $item->getChildren() as $childItem}
                    {if $childItem->getUri()}
                        <a menuItemName="{$childItem->getName()}" href="{$childItem->getUri()}" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center{if $childItem->getClass()} {$childItem->getClass()}{/if}{if $childItem->isCurrent()} active{/if}"{if $childItem->getAttribute('dataToggleTab')} data-toggle="tab"{/if}{if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if} id="{$childItem->getId()}">
                            <div class="d-flex align-items-center">
                                {if $childItem->hasIcon()}<i class="{$childItem->getIcon()} me-2 text-primary"></i>{/if}
                                <span>{$childItem->getLabel()}</span>
                            </div>
                            {if $childItem->hasBadge()}<span class="badge bg-secondary">{$childItem->getBadge()}</span>{/if}
                        </a>
                    {else}
                        <div menuItemName="{$childItem->getName()}" class="flex items-center justify-between p-4 border-b border-gray-700 last:border-b-0{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}">
                            <div class="flex items-center">
                                {if $childItem->hasIcon()}<i class="{$childItem->getIcon()} mr-3 text-{if $item->getExtra('color') eq 'green'}neon-green{elseif $item->getExtra('color') eq 'blue'}electric-blue{elseif $item->getExtra('color') eq 'purple'}cyber-purple{else}neon-green{/if}"></i>{/if}
                                <span class="text-white">{$childItem->getLabel()}</span>
                            </div>
                            {if $childItem->hasBadge()}<span class="px-2 py-1 rounded-full text-xs font-medium bg-gray-700 text-gray-300">{$childItem->getBadge()}</span>{/if}
                        </div>
                    {/if}
                {/foreach}
            </div>
        {/if}
        
        {* Footer content *}
        {if $item->hasFooterHtml()}
            <div class="p-6 border-t border-gray-700 bg-dark-bg/50">
                {$item->getFooterHtml()}
            </div>
        {/if}
    </div>
{/function}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-7xl mx-auto">
        
        <!-- Welcome Section -->
        <div class="mb-8">
            <div class="bg-dark-surface border border-gray-700 rounded-lg p-6">
                <div class="flex items-center justify-between">
                    <div>
                        <h1 class="text-3xl font-orbitron font-bold text-white mb-2">
                            Welcome back, <span class="glow-text">
                                {if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.firstname)}
                                    {$clientsdetails.firstname}
                                {else}
                                    User
                                {/if}
                            </span>
                        </h1>
                        <p class="text-text-light">
                            Manage your hosting services, domains, and support tickets from your dashboard.
                        </p>
                    </div>
                    <div class="hidden md:block">
                        <div class="w-16 h-16 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center">
                            <span class="text-dark-bg font-bold text-xl">
                                {if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.firstname) && isset($clientsdetails.lastname)}
                                    {$clientsdetails.firstname|substr:0:1}{$clientsdetails.lastname|substr:0:1}
                                {else}
                                    U
                                {/if}
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Quick Stats -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-neon-green mb-2">
                    {if isset($clientsstats.productsnumactive)}{$clientsstats.productsnumactive}
                    {elseif isset($stats.numactiveservices)}{$stats.numactiveservices}
                    {elseif isset($numactiveservices)}{$numactiveservices}
                    {else}0{/if}
                </div>
                <div class="text-text-light text-sm">Active Services</div>
            </div>
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-electric-blue mb-2">
                    {if isset($clientsstats.numdomains)}{$clientsstats.numdomains}
                    {elseif isset($stats.numdomains)}{$stats.numdomains}
                    {elseif isset($numdomains)}{$numdomains}
                    {else}0{/if}
                </div>
                <div class="text-text-light text-sm">Domains</div>
            </div>
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-cyber-purple mb-2">
                    {if isset($clientsstats.numtickets)}{$clientsstats.numtickets}
                    {elseif isset($stats.numtickets)}{$stats.numtickets}
                    {elseif isset($numtickets)}{$numtickets}
                    {else}0{/if}
                </div>
                <div class="text-text-light text-sm">Open Tickets</div>
            </div>
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-neon-green mb-2">
                    {if isset($clientsstats.numunpaidinvoices)}{$clientsstats.numunpaidinvoices}
                    {elseif isset($stats.numunpaidinvoices)}{$stats.numunpaidinvoices}
                    {elseif isset($numunpaidinvoices)}{$numunpaidinvoices}
                    {else}0{/if}
                </div>
                <div class="text-text-light text-sm">Unpaid Invoices</div>
            </div>
        </div>
        
        <!-- MarketConnect Promotion Panels -->
        {if isset($panels) && $panels}
            <div class="mb-8">
                {* Check if there are any full-width panels *}
                {assign var="hasFullWidthPanels" value=false}
                {foreach $panels as $item}
                    {if $item->getExtra('colspan')}
                        {assign var="hasFullWidthPanels" value=true}
                        {break}
                    {/if}
                {/foreach}
                
                {if $hasFullWidthPanels}
                    <div class="space-y-6">
                        <!-- Full-width panels first -->
                        {foreach $panels as $item}
                            {if $item->getExtra('colspan')}
                                {outputHomePanels}
                                {assign "panels" $panels->removeChild($item->getName())}
                            {/if}
                        {/foreach}
                        
                        <!-- Two-column layout for remaining panels -->
                        {if $panels && count($panels) > 0}
                            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                                <!-- Left column - odd panels -->
                                <div class="space-y-6">
                                    {foreach $panels as $item}
                                        {if $item@iteration is odd}
                                            {outputHomePanels}
                                        {/if}
                                    {/foreach}
                                </div>
                                
                                <!-- Right column - even panels -->
                                <div class="space-y-6">
                                    {foreach $panels as $item}
                                        {if $item@iteration is even}
                                            {outputHomePanels}
                                        {/if}
                                    {/foreach}
                                </div>
                            </div>
                        {/if}
                    </div>
                {else}
                    <!-- No full-width panels - use two-column layout directly -->
                    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                        <!-- Left column - odd panels -->
                        <div class="space-y-6">
                            {foreach $panels as $item}
                                {if $item@iteration is odd}
                                    {outputHomePanels}
                                {/if}
                            {/foreach}
                        </div>
                        
                        <!-- Right column - even panels -->
                        <div class="space-y-6">
                            {foreach $panels as $item}
                                {if $item@iteration is even}
                                    {outputHomePanels}
                                {/if}
                            {/foreach}
                        </div>
                    </div>
                {/if}
            </div>
        {/if}
        
        <!-- Main Dashboard Content -->
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            
            <!-- Services Overview -->
            <div class="card-dark">
                <div class="flex items-center justify-between mb-6">
                    <h2 class="text-xl font-orbitron font-semibold text-white">Your Services</h2>
                    <a href="{$WEB_ROOT}/clientarea.php?action=products" class="text-neon-green hover:text-electric-blue transition-colors duration-300 text-sm">
                        View All →
                    </a>
                </div>
                
                {if $products}
                    <div class="space-y-4">
                        {assign var="activeCount" value=0}
                        {foreach from=$products item=service name=services}
                            {if $service.status eq 'Active' && $activeCount < 3}
                                {assign var="activeCount" value=$activeCount+1}
                                <a href="{$WEB_ROOT}/clientarea.php?action=productdetails&id={$service.id}" class="block bg-dark-bg border border-gray-700 rounded-lg p-4 hover:border-neon-green transition-all duration-300 cursor-pointer">
                                    <div class="flex items-center justify-between">
                                        <div>
                                            <h3 class="text-white font-medium">{$service.product}</h3>
                                            <p class="text-text-light text-sm">{$service.domain}</p>
                                        </div>
                                        <div class="text-right">
                                            <span class="inline-block px-3 py-1 rounded-full text-xs font-medium bg-neon-green text-dark-bg">
                                                {$service.status}
                                            </span>
                                            <div class="text-text-light text-sm mt-1">
                                                Next Due: {$service.nextduedate}
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            {/if}
                        {/foreach}
                        
                        {* If no active services, show first 3 services regardless of status *}
                        {if $activeCount eq 0}
                            {foreach from=$products item=service name=services}
                                {if $smarty.foreach.services.index < 3}
                                    <a href="{$WEB_ROOT}/clientarea.php?action=productdetails&id={$service.id}" class="block bg-dark-bg border border-gray-700 rounded-lg p-4 hover:border-neon-green transition-all duration-300 cursor-pointer">
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
                                    </a>
                                {/if}
                            {/foreach}
                        {/if}
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
                    {* Check for overdue invoices first *}
                    {assign var="overdueCount" value=0}
                    {assign var="overdueTotal" value=0}
                    {foreach from=$invoices item=invoice}
                        {if $invoice.status eq 'Unpaid' && $invoice.overdue}
                            {assign var="overdueCount" value=$overdueCount+1}
                            {assign var="overdueTotal" value=$overdueTotal+$invoice.rawbalance}
                        {/if}
                    {/foreach}
                    
                    {if $overdueCount > 0}
                        <div class="bg-red-900 border border-red-700 rounded-lg p-4 mb-4">
                            <div class="flex items-center">
                                <svg class="w-6 h-6 text-red-400 mr-3" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
                                </svg>
                                <div class="flex-1">
                                    <p class="text-red-200 text-sm">
                                        You have <strong>({$overdueCount})</strong> Overdue invoice{if $overdueCount > 1}s{/if} with a total balance due of <strong>{$currency.prefix}{$overdueTotal|string_format:"%.2f"} {$currency.code}</strong>. Pay them now to avoid any interruptions in service.
                                    </p>
                                </div>
                                <a href="{$WEB_ROOT}/clientarea.php?action=invoices&status=Unpaid" class="ml-4 bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded text-sm transition-colors duration-300">Pay Now</a>
                            </div>
                        </div>
                    {/if}
                    
                    <div class="space-y-4">
                        {assign var="displayCount" value=0}
                        {* First, show unpaid invoices *}
                        {foreach from=$invoices item=invoice name=invoices}
                            {if $invoice.status eq 'Unpaid' && $displayCount < 3}
                                {assign var="displayCount" value=$displayCount+1}
                                <a href="{$WEB_ROOT}/viewinvoice.php?id={$invoice.id}" class="block bg-dark-bg border border-gray-700 rounded-lg p-4 hover:border-neon-green transition-all duration-300">
                                    <div class="flex items-center justify-between">
                                        <div>
                                            <h3 class="text-white font-medium">Invoice #{$invoice.invoicenum}</h3>
                                            <p class="text-text-light text-sm">Due: {$invoice.datedue}</p>
                                        </div>
                                        <div class="text-right">
                                            <div class="text-white font-medium">{$invoice.total}</div>
                                            <span class="inline-block px-3 py-1 rounded-full text-xs font-medium bg-red-500 text-white">
                                                {$invoice.status}
                                            </span>
                                        </div>
                                    </div>
                                </a>
                            {/if}
                        {/foreach}
                        
                        {* Then, fill remaining slots with other recent invoices *}
                        {foreach from=$invoices item=invoice name=invoices}
                            {if $invoice.status neq 'Unpaid' && $displayCount < 3}
                                {assign var="displayCount" value=$displayCount+1}
                                <a href="{$WEB_ROOT}/viewinvoice.php?id={$invoice.id}" class="block bg-dark-bg border border-gray-700 rounded-lg p-4 hover:border-neon-green transition-all duration-300">
                                    <div class="flex items-center justify-between">
                                        <div>
                                            <h3 class="text-white font-medium">Invoice #{$invoice.invoicenum}</h3>
                                            <p class="text-text-light text-sm">Due: {$invoice.datedue}</p>
                                        </div>
                                        <div class="text-right">
                                            <div class="text-white font-medium">{$invoice.total}</div>
                                            <span class="inline-block px-3 py-1 rounded-full text-xs font-medium
                                                {if $invoice.status eq 'Paid'}bg-neon-green text-dark-bg
                                                {elseif $invoice.status eq 'Cancelled'}bg-gray-500 text-white
                                                {else}bg-yellow-500 text-dark-bg{/if}">
                                                {$invoice.status}
                                            </span>
                                        </div>
                                    </div>
                                </a>
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
                    <a href="{$WEB_ROOT}/supporttickets.php" class="text-neon-green hover:text-electric-blue transition-colors duration-300 text-sm">
                        View All →
                    </a>
                </div>
                
                {if $tickets}
                    <div class="space-y-4">
                        {foreach from=$tickets item=ticket name=tickets}
                            {if $smarty.foreach.tickets.index < 3}
                                <a href="{$WEB_ROOT}/viewticket.php?tid={$ticket.tid}" class="block bg-dark-bg border border-gray-700 rounded-lg p-4 hover:border-neon-green transition-all duration-300">
                                    <div class="flex items-center justify-between">
                                        <div>
                                            <h3 class="text-white font-medium">#{$ticket.tid} - {$ticket.subject}</h3>
                                            <p class="text-text-light text-sm">Last Reply: {$ticket.lastreply}</p>
                                        </div>
                                        <div class="text-right">
                                            <span class="inline-block px-3 py-1 rounded-full text-xs font-medium
                                                {if $ticket.status eq 'Open'}bg-neon-green text-dark-bg
                                                {elseif $ticket.status eq 'Customer-Reply'}bg-electric-blue text-white
                                                {elseif $ticket.status eq 'Answered'}bg-cyber-purple text-white
                                                {elseif $ticket.status eq 'Closed'}bg-gray-500 text-white
                                                {else}bg-yellow-500 text-dark-bg{/if}">
                                                {$ticket.status}
                                            </span>
                                        </div>
                                    </div>
                                </a>
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
        {assign var="unpaidCount" value=$clientsstats.numunpaidinvoices|default:$numunpaidinvoices|default:0}
        {if $unpaidCount > 0}
            <div class="mt-8">
                <div class="bg-red-900 border border-red-700 rounded-lg p-6">
                    <div class="flex items-center">
                        <svg class="w-8 h-8 text-red-400 mr-4" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
                        </svg>
                        <div>
                            <h3 class="text-white font-semibold">Payment Required</h3>
                            <p class="text-red-200 text-sm">You have {$unpaidCount} unpaid invoice{if $unpaidCount > 1}s{/if}. Please pay to avoid service interruption.</p>
                        </div>
                        <a href="{$WEB_ROOT}/clientarea.php?action=invoices" class="ml-auto btn-primary">View Invoices</a>
                    </div>
                </div>
            </div>
        {/if}
    </div>
</div>

{include file="$template/footer.tpl"}