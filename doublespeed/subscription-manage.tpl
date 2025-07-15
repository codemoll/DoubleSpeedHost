{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Manage Subscription</h1>
            
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
                {if $subscription}
                    <div class="bg-dark-bg rounded-lg p-6 border border-gray-600">
                        <div class="flex justify-between items-start mb-6">
                            <div>
                                <h2 class="text-2xl font-bold text-white">{$subscription.name}</h2>
                                <p class="text-text-light">Subscription ID: {$subscription.id}</p>
                            </div>
                            <div class="text-right">
                                <p class="text-2xl font-bold text-neon-green">${$subscription.amount}</p>
                                <p class="text-text-light">per {$subscription.cycle}</p>
                                <span class="px-3 py-1 text-sm rounded {if $subscription.status == 'active'}bg-green-900 text-green-200{elseif $subscription.status == 'cancelled'}bg-red-900 text-red-200{else}bg-yellow-900 text-yellow-200{/if}">
                                    {$subscription.status|ucfirst}
                                </span>
                            </div>
                        </div>
                        
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <h3 class="text-lg font-semibold text-white mb-3">Subscription Details</h3>
                                <div class="space-y-2 text-sm">
                                    <p class="text-text-light"><strong>Started:</strong> {$subscription.startdate}</p>
                                    <p class="text-text-light"><strong>Next Payment:</strong> {$subscription.nextpayment}</p>
                                    <p class="text-text-light"><strong>Payment Method:</strong> {$subscription.paymentmethod}</p>
                                </div>
                            </div>
                            
                            <div>
                                <h3 class="text-lg font-semibold text-white mb-3">Billing History</h3>
                                {if $subscription.history}
                                    <div class="max-h-40 overflow-y-auto">
                                        {foreach $subscription.history as $payment}
                                            <div class="flex justify-between text-sm py-1">
                                                <span class="text-text-light">{$payment.date}</span>
                                                <span class="text-neon-green">${$payment.amount}</span>
                                            </div>
                                        {/foreach}
                                    </div>
                                {else}
                                    <p class="text-text-light text-sm">No billing history available.</p>
                                {/if}
                            </div>
                        </div>
                    </div>
                    
                    <div class="bg-dark-bg rounded-lg p-6 border border-gray-600">
                        <h3 class="text-lg font-semibold text-white mb-4">Subscription Actions</h3>
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                            {if $subscription.status == 'active'}
                                <button class="btn-secondary w-full">Update Payment Method</button>
                                <button class="btn-outline w-full">Pause Subscription</button>
                                <button class="btn-outline w-full text-red-400 border-red-400 hover:bg-red-900">Cancel Subscription</button>
                            {elseif $subscription.status == 'paused'}
                                <button class="btn-primary w-full">Resume Subscription</button>
                                <button class="btn-secondary w-full">Update Payment Method</button>
                                <button class="btn-outline w-full text-red-400 border-red-400 hover:bg-red-900">Cancel Subscription</button>
                            {elseif $subscription.status == 'cancelled'}
                                <button class="btn-primary w-full">Reactivate Subscription</button>
                            {/if}
                        </div>
                    </div>
                {else}
                    <div class="text-center py-12">
                        <svg class="w-16 h-16 text-gray-500 mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M4 4a2 2 0 00-2 2v8a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2H4zm0 2h12v8H4V6z" clip-rule="evenodd"/>
                        </svg>
                        <h3 class="text-xl font-semibold text-white mb-2">No Subscription Found</h3>
                        <p class="text-text-light">You don't have an active subscription.</p>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
