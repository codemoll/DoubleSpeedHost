{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Usage Billing</h1>
            
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
                <div class="bg-blue-900 border border-blue-700 rounded-lg p-4">
                    <p class="text-blue-200 text-sm">
                        View your usage-based billing information and current usage statistics.
                    </p>
                </div>
                
                {if $usagedata}
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                        <div class="bg-dark-bg rounded-lg p-4 border border-gray-600 text-center">
                            <h3 class="text-lg font-semibold text-white mb-2">Current Usage</h3>
                            <p class="text-2xl font-bold text-neon-green">{$usagedata.current}</p>
                            <p class="text-text-light text-sm">of {$usagedata.limit} limit</p>
                        </div>
                        <div class="bg-dark-bg rounded-lg p-4 border border-gray-600 text-center">
                            <h3 class="text-lg font-semibold text-white mb-2">This Month's Cost</h3>
                            <p class="text-2xl font-bold text-electric-blue">${$usagedata.cost}</p>
                        </div>
                        <div class="bg-dark-bg rounded-lg p-4 border border-gray-600 text-center">
                            <h3 class="text-lg font-semibold text-white mb-2">Billing Cycle</h3>
                            <p class="text-lg text-white">{$usagedata.cycle}</p>
                            <p class="text-text-light text-sm">Next bill: {$usagedata.nextbill}</p>
                        </div>
                    </div>
                    
                    <div class="bg-dark-bg rounded-lg p-6 border border-gray-600">
                        <h3 class="text-lg font-semibold text-white mb-4">Usage History</h3>
                        <div class="overflow-x-auto">
                            <table class="w-full table-auto">
                                <thead>
                                    <tr class="border-b border-gray-600">
                                        <th class="text-left py-3 px-4 text-text-light">Date</th>
                                        <th class="text-left py-3 px-4 text-text-light">Usage</th>
                                        <th class="text-left py-3 px-4 text-text-light">Cost</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach $usagehistory as $usage}
                                        <tr class="border-b border-gray-700">
                                            <td class="py-3 px-4 text-white">{$usage.date}</td>
                                            <td class="py-3 px-4 text-text-light">{$usage.amount}</td>
                                            <td class="py-3 px-4 text-neon-green">${$usage.cost}</td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    </div>
                {else}
                    <div class="text-center py-8">
                        <p class="text-text-light">No usage billing data available.</p>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
