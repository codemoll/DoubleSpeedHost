{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Mass Payment</h1>
            
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
            
            <form method="post" class="space-y-6">
                <div class="bg-yellow-900 border border-yellow-700 rounded-lg p-4">
                    <p class="text-yellow-200 text-sm">
                        Use this feature to pay multiple invoices at once. Select the invoices you want to pay and choose a payment method.
                    </p>
                </div>
                
                {if $invoices}
                    <div class="overflow-x-auto">
                        <table class="w-full table-auto">
                            <thead>
                                <tr class="border-b border-gray-600">
                                    <th class="text-left py-3 px-4">
                                        <input type="checkbox" id="selectAll" class="mr-2">
                                        <label for="selectAll" class="text-text-light">Select All</label>
                                    </th>
                                    <th class="text-left py-3 px-4 text-text-light">Invoice #</th>
                                    <th class="text-left py-3 px-4 text-text-light">Date</th>
                                    <th class="text-left py-3 px-4 text-text-light">Amount</th>
                                    <th class="text-left py-3 px-4 text-text-light">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $invoices as $invoice}
                                    <tr class="border-b border-gray-700">
                                        <td class="py-3 px-4">
                                            <input type="checkbox" name="invoices[]" value="{$invoice.id}" class="invoice-checkbox">
                                        </td>
                                        <td class="py-3 px-4 text-white">#{$invoice.number}</td>
                                        <td class="py-3 px-4 text-text-light">{$invoice.date}</td>
                                        <td class="py-3 px-4 text-neon-green font-semibold">${$invoice.total}</td>
                                        <td class="py-3 px-4">
                                            <span class="px-2 py-1 text-xs rounded {if $invoice.status == 'paid'}bg-green-900 text-green-200{elseif $invoice.status == 'overdue'}bg-red-900 text-red-200{else}bg-yellow-900 text-yellow-200{/if}">
                                                {$invoice.status|ucfirst}
                                            </span>
                                        </td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="bg-dark-bg rounded-lg p-6 border border-gray-600">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label class="block text-sm font-medium text-text-light mb-2">Payment Method</label>
                                <select name="paymentmethod" class="input-dark w-full" required>
                                    <option value="">Select Payment Method...</option>
                                    {foreach $gateways as $gateway}
                                        <option value="{$gateway.sysname}">{$gateway.name}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class="flex items-end">
                                <div class="w-full">
                                    <p class="text-sm text-text-light mb-2">Total Selected:</p>
                                    <p class="text-2xl font-bold text-neon-green" id="totalAmount">$0.00</p>
                                </div>
                            </div>
                        </div>
                        
                        <button type="submit" class="btn-primary w-full mt-6">
                            Pay Selected Invoices
                        </button>
                    </div>
                {else}
                    <div class="text-center py-12">
                        <p class="text-text-light">No unpaid invoices available for mass payment.</p>
                    </div>
                {/if}
            </form>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
