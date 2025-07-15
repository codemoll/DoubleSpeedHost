{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Usage Billing Pricing</h1>
            
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
            
            <div class="space-y-8">
                <div class="text-center">
                    <h2 class="text-2xl font-bold text-white mb-4">Usage-Based Pricing</h2>
                    <p class="text-text-light">Pay only for what you use with our flexible pricing tiers.</p>
                </div>
                
                {if $pricingtiers}
                    <div class="overflow-x-auto">
                        <table class="w-full table-auto">
                            <thead>
                                <tr class="border-b border-gray-600">
                                    <th class="text-left py-4 px-4 text-text-light">Usage Range</th>
                                    <th class="text-center py-4 px-4 text-text-light">Price per Unit</th>
                                    <th class="text-center py-4 px-4 text-text-light">Monthly Cap</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $pricingtiers as $tier}
                                    <tr class="border-b border-gray-700 hover:bg-dark-bg transition-colors">
                                        <td class="py-4 px-4">
                                            <div>
                                                <span class="text-white font-semibold">{$tier.range}</span>
                                                {if $tier.description}
                                                    <p class="text-text-light text-sm">{$tier.description}</p>
                                                {/if}
                                            </div>
                                        </td>
                                        <td class="py-4 px-4 text-center">
                                            <span class="text-lg font-semibold text-neon-green">${$tier.price}</span>
                                            <p class="text-text-light text-xs">per {$tier.unit}</p>
                                        </td>
                                        <td class="py-4 px-4 text-center">
                                            {if $tier.cap}
                                                <span class="text-electric-blue font-semibold">${$tier.cap}</span>
                                            {else}
                                                <span class="text-text-light">No cap</span>
                                            {/if}
                                        </td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                {/if}
                
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                    <div class="bg-dark-bg rounded-lg p-6 border border-gray-600 text-center">
                        <svg class="w-12 h-12 text-neon-green mx-auto mb-3" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M6 6V5a3 3 0 013-3h2a3 3 0 013 3v1h2a2 2 0 012 2v3.57A22.952 22.952 0 0110 13a22.95 22.95 0 01-8-1.43V8a2 2 0 012-2h2zm2-1a1 1 0 011-1h2a1 1 0 011 1v1H8V5zm1 5a1 1 0 011-1h.01a1 1 0 110 2H10a1 1 0 01-1-1z" clip-rule="evenodd"/>
                            <path d="M2 13.692V16a2 2 0 002 2h12a2 2 0 002-2v-2.308A24.974 24.974 0 0110 15c-2.796 0-5.487-.46-8-1.308z"/>
                        </svg>
                        <h3 class="text-white font-semibold mb-2">Flexible Billing</h3>
                        <p class="text-text-light text-sm">Pay only for resources you actually use</p>
                    </div>
                    
                    <div class="bg-dark-bg rounded-lg p-6 border border-gray-600 text-center">
                        <svg class="w-12 h-12 text-electric-blue mx-auto mb-3" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-12a1 1 0 10-2 0v4a1 1 0 00.293.707l2.828 2.829a1 1 0 101.415-1.415L11 9.586V6z" clip-rule="evenodd"/>
                        </svg>
                        <h3 class="text-white font-semibold mb-2">Real-time Monitoring</h3>
                        <p class="text-text-light text-sm">Track your usage in real-time through your dashboard</p>
                    </div>
                    
                    <div class="bg-dark-bg rounded-lg p-6 border border-gray-600 text-center">
                        <svg class="w-12 h-12 text-cyber-purple mx-auto mb-3" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M3 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"/>
                        </svg>
                        <h3 class="text-white font-semibold mb-2">Detailed Reports</h3>
                        <p class="text-text-light text-sm">Get detailed usage reports and cost breakdowns</p>
                    </div>
                </div>
                
                <div class="bg-blue-900 border border-blue-700 rounded-lg p-6">
                    <h3 class="text-blue-200 font-semibold mb-2">How Usage Billing Works</h3>
                    <div class="text-blue-200 text-sm space-y-2">
                        <p>• Usage is measured in real-time and billed monthly</p>
                        <p>• Lower tiers offer better per-unit pricing for cost efficiency</p>
                        <p>• Monthly caps protect you from unexpected high usage charges</p>
                        <p>• You can set up usage alerts to monitor your spending</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
