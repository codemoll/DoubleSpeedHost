{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Credit Card Management</h1>
            
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
                        Manage your stored credit card information securely.
                    </p>
                </div>
                
                <form method="post" class="space-y-6">
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
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-sm font-medium text-text-light mb-2">CVV</label>
                            <input type="text" name="cvv" class="input-dark w-full" placeholder="123">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-text-light mb-2">Cardholder Name</label>
                            <input type="text" name="cardholder" class="input-dark w-full" placeholder="Name on Card">
                        </div>
                    </div>
                    
                    <button type="submit" class="btn-primary">Update Credit Card</button>
                </form>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
