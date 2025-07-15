{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Recurring Invoice</h1>
            
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
                {if $invoice}
                    <div class="bg-dark-bg rounded-lg p-6 border border-gray-600">
                        <div class="flex justify-between items-start mb-6">
                            <div>
                                <h2 class="text-2xl font-bold text-white">Recurring Invoice #{$invoice.id}</h2>
                                <p class="text-text-light">Created: {$invoice.date}</p>
                                <p class="text-text-light">Next Due: {$invoice.nextdue}</p>
                            </div>
                            <div class="text-right">
                                <p class="text-2xl font-bold text-neon-green">${$invoice.total}</p>
                                <span class="px-3 py-1 text-sm rounded bg-blue-900 text-blue-200">
                                    Recurring {$invoice.cycle}
                                </span>
                            </div>
                        </div>
                        
                        {if $invoice.items}
                            <div class="overflow-x-auto">
                                <table class="w-full table-auto">
                                    <thead>
                                        <tr class="border-b border-gray-600">
                                            <th class="text-left py-3 text-text-light">Description</th>
                                            <th class="text-right py-3 text-text-light">Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {foreach $invoice.items as $item}
                                            <tr class="border-b border-gray-700">
                                                <td class="py-3 text-white">{$item.description}</td>
                                                <td class="py-3 text-right text-text-light">${$item.amount}</td>
                                            </tr>
                                        {/foreach}
                                    </tbody>
                                </table>
                            </div>
                        {/if}
                        
                        <div class="mt-6 p-4 bg-blue-900 border border-blue-700 rounded-lg">
                            <h3 class="text-blue-200 font-semibold mb-2">Automatic Payment Information</h3>
                            <p class="text-blue-200 text-sm">
                                This invoice will be automatically charged to your default payment method on {$invoice.nextdue}.
                            </p>
                        </div>
                    </div>
                    
                    <div class="flex space-x-4">
                        <a href="{$WEB_ROOT}/clientarea.php?action=invoices" class="btn-outline flex-1 text-center">
                            Back to Invoices
                        </a>
                        <a href="{$WEB_ROOT}/clientarea.php?action=creditcard" class="btn-primary flex-1 text-center">
                            Update Payment Method
                        </a>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
