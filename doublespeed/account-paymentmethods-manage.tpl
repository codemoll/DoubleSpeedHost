{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Manage Payment Methods</h1>
            
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
                {if $paymentmethods}
                    <div class="space-y-4">
                        {foreach $paymentmethods as $method}
                            <div class="bg-dark-bg rounded-lg p-4 border border-gray-600">
                                <div class="flex justify-between items-center">
                                    <div>
                                        <h3 class="text-white font-semibold">{$method.type}</h3>
                                        <p class="text-text-light text-sm">{$method.description}</p>
                                    </div>
                                    <div class="space-x-2">
                                        <button class="btn-secondary btn-sm">Edit</button>
                                        <button class="btn-outline btn-sm">Delete</button>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                {/if}
                
                <div class="border-t border-gray-600 pt-6">
                    <h3 class="text-lg font-semibold text-white mb-4">Add New Payment Method</h3>
                    <form method="post" class="space-y-6">
                        <div>
                            <label class="block text-sm font-medium text-text-light mb-2">Payment Method Type</label>
                            <select name="type" class="input-dark w-full">
                                <option value="creditcard">Credit Card</option>
                                <option value="paypal">PayPal</option>
                                <option value="banktransfer">Bank Transfer</option>
                            </select>
                        </div>
                        
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label class="block text-sm font-medium text-text-light mb-2">Card Number</label>
                                <input type="text" name="cardnumber" class="input-dark w-full" placeholder="**** **** **** ****">
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-text-light mb-2">Expiry Date</label>
                                <input type="text" name="expiry" class="input-dark w-full" placeholder="MM/YY">
                            </div>
                        </div>
                        
                        <button type="submit" class="btn-primary">Add Payment Method</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
