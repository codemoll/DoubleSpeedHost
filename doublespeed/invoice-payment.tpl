{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Invoice Payment</h1>
            
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
                        <div class="flex justify-between items-start mb-4">
                            <div>
                                <h2 class="text-2xl font-bold text-white">Invoice #{$invoice.id}</h2>
                                <p class="text-text-light">Date: {$invoice.date}</p>
                                <p class="text-text-light">Due Date: {$invoice.duedate}</p>
                            </div>
                            <div class="text-right">
                                <p class="text-2xl font-bold text-neon-green">${$invoice.total}</p>
                                <span class="px-3 py-1 text-sm rounded {if $invoice.status == 'paid'}bg-green-900 text-green-200{elseif $invoice.status == 'overdue'}bg-red-900 text-red-200{else}bg-yellow-900 text-yellow-200{/if}">
                                    {$invoice.status|ucfirst}
                                </span>
                            </div>
                        </div>
                        
                        {if $invoice.items}
                            <div class="overflow-x-auto">
                                <table class="w-full table-auto">
                                    <thead>
                                        <tr class="border-b border-gray-600">
                                            <th class="text-left py-2 text-text-light">Description</th>
                                            <th class="text-right py-2 text-text-light">Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {foreach $invoice.items as $item}
                                            <tr class="border-b border-gray-700">
                                                <td class="py-2 text-white">{$item.description}</td>
                                                <td class="py-2 text-right text-text-light">${$item.amount}</td>
                                            </tr>
                                        {/foreach}
                                    </tbody>
                                </table>
                            </div>
                        {/if}
                    </div>
                    
                    {if $invoice.status != 'paid'}
                        <div class="bg-dark-surface rounded-lg p-6 border border-gray-700">
                            <h3 class="text-xl font-semibold text-white mb-4">Payment Options</h3>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                {foreach $gateways as $gateway}
                                    <a href="{$WEB_ROOT}/modules/gateways/{$gateway.sysname}.php?invoiceid={$invoice.id}" 
                                       class="block p-4 bg-dark-bg border border-gray-600 rounded-lg hover:border-neon-green transition-colors">
                                        <div class="text-center">
                                            {if $gateway.logo}
                                                <img src="{$gateway.logo}" alt="{$gateway.name}" class="h-8 mx-auto mb-2">
                                            {/if}
                                            <p class="text-white font-semibold">{$gateway.name}</p>
                                        </div>
                                    </a>
                                {/foreach}
                            </div>
                        </div>
                    {/if}
                {/if}
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
