{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">View Quote</h1>
            
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
            
            {if $quote}
                <div class="space-y-6">
                    <div class="bg-dark-bg rounded-lg p-6 border border-gray-600">
                        <div class="flex justify-between items-start mb-6">
                            <div>
                                <h2 class="text-2xl font-bold text-white">Quote #{$quote.id}</h2>
                                <p class="text-text-light">Date: {$quote.date}</p>
                                <p class="text-text-light">Valid Until: {$quote.validuntil}</p>
                                <p class="text-text-light">Subject: {$quote.subject}</p>
                            </div>
                            <div class="text-right">
                                <p class="text-2xl font-bold text-neon-green">${$quote.total}</p>
                                <span class="px-3 py-1 text-sm rounded {if $quote.status == 'accepted'}bg-green-900 text-green-200{elseif $quote.status == 'expired'}bg-red-900 text-red-200{else}bg-blue-900 text-blue-200{/if}">
                                    {$quote.status|ucfirst}
                                </span>
                            </div>
                        </div>
                        
                        {if $quote.items}
                            <div class="overflow-x-auto">
                                <table class="w-full table-auto">
                                    <thead>
                                        <tr class="border-b border-gray-600">
                                            <th class="text-left py-3 text-text-light">Description</th>
                                            <th class="text-center py-3 text-text-light">Qty</th>
                                            <th class="text-right py-3 text-text-light">Unit Price</th>
                                            <th class="text-right py-3 text-text-light">Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {foreach $quote.items as $item}
                                            <tr class="border-b border-gray-700">
                                                <td class="py-3 text-white">{$item.description}</td>
                                                <td class="py-3 text-center text-text-light">{$item.qty}</td>
                                                <td class="py-3 text-right text-text-light">${$item.unitprice}</td>
                                                <td class="py-3 text-right text-neon-green">${$item.amount}</td>
                                            </tr>
                                        {/foreach}
                                    </tbody>
                                </table>
                            </div>
                        {/if}
                        
                        {if $quote.notes}
                            <div class="mt-6 p-4 bg-blue-900 border border-blue-700 rounded-lg">
                                <h3 class="text-blue-200 font-semibold mb-2">Notes</h3>
                                <p class="text-blue-200 text-sm">{$quote.notes}</p>
                            </div>
                        {/if}
                    </div>
                    
                    <div class="flex space-x-4">
                        <a href="{$WEB_ROOT}/clientarea.php?action=quotes" class="btn-outline flex-1 text-center">
                            Back to Quotes
                        </a>
                        {if $quote.status == 'sent'}
                            <a href="{$WEB_ROOT}/acceptquote.php?id={$quote.id}" class="btn-primary flex-1 text-center">
                                Accept Quote
                            </a>
                        {/if}
                        <button onclick="window.print()" class="btn-secondary">
                            Print Quote
                        </button>
                    </div>
                </div>
            {else}
                <div class="text-center py-12">
                    <p class="text-text-light">Quote not found.</p>
                </div>
            {/if}
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
