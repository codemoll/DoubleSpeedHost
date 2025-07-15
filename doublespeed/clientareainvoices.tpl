{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-6xl mx-auto">
        
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                <span class="glow-text">Invoices</span>
            </h1>
            <p class="text-text-light">
                View and manage your billing history, download invoices, and track payment status.
            </p>
        </div>
        
        <!-- Summary Cards -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-neon-green mb-2">
                    {if $invoicestats.total}{$invoicestats.total}{else}0{/if}
                </div>
                <div class="text-text-light text-sm">Total Invoices</div>
            </div>
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-electric-blue mb-2">
                    {if $invoicestats.paid}{$invoicestats.paid}{else}0{/if}
                </div>
                <div class="text-text-light text-sm">Paid</div>
            </div>
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-red-400 mb-2">
                    {if $invoicestats.unpaid}{$invoicestats.unpaid}{else}0{/if}
                </div>
                <div class="text-text-light text-sm">Unpaid</div>
            </div>
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-orange-400 mb-2">
                    {if $invoicestats.overdue}{$invoicestats.overdue}{else}0{/if}
                </div>
                <div class="text-text-light text-sm">Overdue</div>
            </div>
        </div>
        
        <!-- Filter Options -->
        <div class="card-dark mb-8">
            <h2 class="text-xl font-semibold text-white mb-4">Filter Invoices</h2>
            <form method="get" action="{$smarty.server.PHP_SELF}" class="grid grid-cols-1 md:grid-cols-4 gap-4">
                <input type="hidden" name="action" value="invoices" />
                
                <div>
                    <label for="status" class="block text-sm font-medium text-white mb-2">Status</label>
                    <select id="status" name="status" class="input-dark w-full">
                        <option value="">All Status</option>
                        <option value="Paid" {if $smarty.get.status == 'Paid'}selected{/if}>Paid</option>
                        <option value="Unpaid" {if $smarty.get.status == 'Unpaid'}selected{/if}>Unpaid</option>
                        <option value="Overdue" {if $smarty.get.status == 'Overdue'}selected{/if}>Overdue</option>
                        <option value="Cancelled" {if $smarty.get.status == 'Cancelled'}selected{/if}>Cancelled</option>
                    </select>
                </div>
                
                <div>
                    <label for="year" class="block text-sm font-medium text-white mb-2">Year</label>
                    <select id="year" name="year" class="input-dark w-full">
                        <option value="">All Years</option>
                        {for $year = $smarty.now|date_format:"%Y" to $smarty.now|date_format:"%Y"-5 step=-1}
                            <option value="{$year}" {if $smarty.get.year == $year}selected{/if}>{$year}</option>
                        {/for}
                    </select>
                </div>
                
                <div>
                    <label for="search" class="block text-sm font-medium text-white mb-2">Search</label>
                    <input type="text" id="search" name="search" 
                           class="input-dark w-full" placeholder="Invoice ID or amount"
                           value="{if $smarty.get.search}{$smarty.get.search}{/if}">
                </div>
                
                <div class="flex items-end">
                    <button type="submit" class="btn-primary w-full">
                        Apply Filters
                    </button>
                </div>
            </form>
        </div>
        
        {if $invoices}
            <!-- Invoices Table -->
            <div class="card-dark">
                <div class="overflow-x-auto">
                    <table class="w-full">
                        <thead>
                            <tr class="border-b border-gray-700">
                                <th class="text-left py-4 text-white font-medium">Invoice #</th>
                                <th class="text-left py-4 text-white font-medium">Date</th>
                                <th class="text-left py-4 text-white font-medium">Due Date</th>
                                <th class="text-left py-4 text-white font-medium">Amount</th>
                                <th class="text-left py-4 text-white font-medium">Status</th>
                                <th class="text-left py-4 text-white font-medium">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$invoices item=invoice}
                                <tr class="border-b border-gray-800 hover:bg-dark-surface transition-colors duration-300">
                                    <td class="py-4">
                                        <a href="{$WEB_ROOT}/viewinvoice.php?id={$invoice.id}" 
                                           class="font-mono text-neon-green hover:text-electric-blue transition-colors duration-300">
                                            #{$invoice.invoicenum}
                                        </a>
                                    </td>
                                    <td class="py-4 text-text-light">{$invoice.datecreated}</td>
                                    <td class="py-4 text-text-light">{$invoice.duedate}</td>
                                    <td class="py-4">
                                        <span class="font-semibold text-white">
                                            {$invoice.total}
                                        </span>
                                    </td>
                                    <td class="py-4">
                                        {if $invoice.status == 'Paid'}
                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-green-900 text-green-200">
                                                <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                                                </svg>
                                                Paid
                                            </span>
                                        {elseif $invoice.status == 'Unpaid'}
                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-yellow-900 text-yellow-200">
                                                <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                                    <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
                                                </svg>
                                                Unpaid
                                            </span>
                                        {elseif $invoice.status == 'Overdue'}
                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-red-900 text-red-200">
                                                <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                                                </svg>
                                                Overdue
                                            </span>
                                        {else}
                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-gray-900 text-gray-200">
                                                {$invoice.status}
                                            </span>
                                        {/if}
                                    </td>
                                    <td class="py-4">
                                        <div class="flex space-x-2">
                                            <a href="{$WEB_ROOT}/viewinvoice.php?id={$invoice.id}" 
                                               class="btn-outline text-xs px-3 py-1">
                                                View
                                            </a>
                                            <a href="{$WEB_ROOT}/dl.php?type=i&id={$invoice.id}" 
                                               class="btn-secondary text-xs px-3 py-1">
                                                Download
                                            </a>
                                            {if $invoice.status != 'Paid'}
                                                <a href="{$WEB_ROOT}/viewinvoice.php?id={$invoice.id}&paynow=true" 
                                                   class="btn-primary text-xs px-3 py-1">
                                                    Pay Now
                                                </a>
                                            {/if}
                                        </div>
                                    </td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
                
                <!-- Pagination -->
                {if $pagination}
                    <div class="mt-6 flex items-center justify-between">
                        <div class="text-text-light text-sm">
                            Showing {$pagination.start} to {$pagination.end} of {$pagination.total} invoices
                        </div>
                        <div class="flex space-x-2">
                            {if $pagination.prev}
                                <a href="{$pagination.prev}" class="btn-outline text-xs px-3 py-1">Previous</a>
                            {/if}
                            {foreach from=$pagination.pages item=page}
                                {if $page.current}
                                    <span class="btn-primary text-xs px-3 py-1">{$page.num}</span>
                                {else}
                                    <a href="{$page.url}" class="btn-outline text-xs px-3 py-1">{$page.num}</a>
                                {/if}
                            {/foreach}
                            {if $pagination.next}
                                <a href="{$pagination.next}" class="btn-outline text-xs px-3 py-1">Next</a>
                            {/if}
                        </div>
                    </div>
                {/if}
            </div>
        {else}
            <!-- No Invoices -->
            <div class="card-dark text-center py-12">
                <div class="mx-auto w-20 h-20 bg-gradient-to-br from-gray-600 to-gray-700 rounded-full flex items-center justify-center mb-6">
                    <svg class="w-10 h-10 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M4 4a2 2 0 00-2 2v8a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2H4zm0 2h12v8H4V6zm2 2a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm0 3a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">No Invoices Found</h3>
                <p class="text-text-light mb-6">
                    {if $smarty.get.status || $smarty.get.year || $smarty.get.search}
                        No invoices match your current filter criteria. Try adjusting your filters.
                    {else}
                        You don't have any invoices yet. Invoices will appear here when you make purchases.
                    {/if}
                </p>
                {if $smarty.get.status || $smarty.get.year || $smarty.get.search}
                    <a href="{$WEB_ROOT}/clientarea.php?action=invoices" class="btn-primary">
                        Clear Filters
                    </a>
                {else}
                    <a href="{$WEB_ROOT}/cart.php" class="btn-primary">
                        Browse Services
                    </a>
                {/if}
            </div>
        {/if}
        
        <!-- Quick Actions -->
        <div class="mt-8 grid grid-cols-1 md:grid-cols-3 gap-6">
            <div class="card-dark text-center">
                <svg class="w-12 h-12 text-neon-green mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M4 4a2 2 0 00-2 2v1h16V6a2 2 0 00-2-2H4z"/>
                    <path fill-rule="evenodd" d="M18 9H2v5a2 2 0 002 2h12a2 2 0 002-2V9zM4 13a1 1 0 011-1h1a1 1 0 110 2H5a1 1 0 01-1-1zm5-1a1 1 0 100 2h1a1 1 0 100-2H9z" clip-rule="evenodd"/>
                </svg>
                <h3 class="text-lg font-semibold text-white mb-2">Add Funds</h3>
                <p class="text-text-light text-sm mb-4">Add credit to your account for future purchases</p>
                <a href="{$WEB_ROOT}/clientarea.php?action=addfunds" class="btn-outline">Add Funds</a>
            </div>
            
            <div class="card-dark text-center">
                <svg class="w-12 h-12 text-electric-blue mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M3 17a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm3.293-7.707a1 1 0 011.414 0L9 10.586V3a1 1 0 112 0v7.586l1.293-1.293a1 1 0 111.414 1.414l-3 3a1 1 0 01-1.414 0l-3-3a1 1 0 010-1.414z" clip-rule="evenodd"/>
                </svg>
                <h3 class="text-lg font-semibold text-white mb-2">Mass Payment</h3>
                <p class="text-text-light text-sm mb-4">Pay multiple invoices at once</p>
                <a href="{$WEB_ROOT}/clientarea.php?action=masspay" class="btn-outline">Mass Pay</a>
            </div>
            
            <div class="card-dark text-center">
                <svg class="w-12 h-12 text-cyber-purple mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M6 2a2 2 0 00-2 2v12a2 2 0 002 2h8a2 2 0 002-2V7.414A2 2 0 0015.414 6L12 2.586A2 2 0 0010.586 2H6zm5 6a1 1 0 10-2 0v3.586l-1.293-1.293a1 1 0 10-1.414 1.414l3 3a1 1 0 001.414 0l3-3a1 1 0 00-1.414-1.414L11 11.586V8z" clip-rule="evenodd"/>
                </svg>
                <h3 class="text-lg font-semibold text-white mb-2">Tax Documents</h3>
                <p class="text-text-light text-sm mb-4">Download tax invoices and receipts</p>
                <a href="{$WEB_ROOT}/clientarea.php?action=invoices&tax=true" class="btn-outline">View Tax Docs</a>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}