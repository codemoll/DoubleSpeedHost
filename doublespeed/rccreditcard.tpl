{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Recurring Credit Card</h1>
            
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
                <div class="bg-blue-900 border border-blue-700 rounded-lg p-4">
                    <p class="text-blue-200 text-sm">
                        Update your recurring payment credit card information. This card will be used for automatic renewals.
                    </p>
                </div>
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label class="block text-sm font-medium text-text-light mb-2">Card Number *</label>
                        <input type="text" name="ccnumber" class="input-dark w-full" placeholder="1234 5678 9012 3456" maxlength="19">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-text-light mb-2">Cardholder Name *</label>
                        <input type="text" name="ccname" class="input-dark w-full" placeholder="Name on card">
                    </div>
                </div>
                
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                    <div>
                        <label class="block text-sm font-medium text-text-light mb-2">Expiry Month *</label>
                        <select name="ccexpirymonth" class="input-dark w-full">
                            <option value="">Month</option>
                            {for $i=1 to 12}
                                <option value="{$i|string_format:"%02d"}">{$i|string_format:"%02d"}</option>
                            {/for}
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-text-light mb-2">Expiry Year *</label>
                        <select name="ccexpiryyear" class="input-dark w-full">
                            <option value="">Year</option>
                            {for $i=0 to 10}
                                {assign var="year" value=$smarty.now|date_format:"%Y"+$i}
                                <option value="{$year}">{$year}</option>
                            {/for}
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-text-light mb-2">CVV *</label>
                        <input type="text" name="cccvv" class="input-dark w-full" placeholder="123" maxlength="4">
                    </div>
                </div>
                
                <button type="submit" class="btn-primary w-full">
                    Update Recurring Payment Card
                </button>
            </form>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
