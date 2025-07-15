{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Add Funds</h1>
            
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
                <div>
                    <label class="block text-sm font-medium text-text-light mb-2">Amount to Add</label>
                    <input type="number" name="amount" min="1" step="0.01" class="input-dark w-full" placeholder="0.00">
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-text-light mb-2">Payment Method</label>
                    <select name="paymentmethod" class="input-dark w-full">
                        {foreach $gateways as $gateway}
                            <option value="{$gateway.sysname}">{$gateway.name}</option>
                        {/foreach}
                    </select>
                </div>
                
                <button type="submit" class="btn-primary w-full">Add Funds</button>
            </form>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
