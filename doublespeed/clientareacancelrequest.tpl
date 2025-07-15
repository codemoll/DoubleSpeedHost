{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Cancellation Request</h1>
            
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
                <div class="bg-yellow-900 border border-yellow-700 rounded-lg p-4 mb-6">
                    <p class="text-yellow-200 text-sm">
                        Are you sure you want to request cancellation of this service?
                    </p>
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-text-light mb-2">Cancellation Type</label>
                    <select name="type" class="input-dark w-full">
                        <option value="immediate">Immediate</option>
                        <option value="end_of_billing_period">End of Billing Period</option>
                    </select>
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-text-light mb-2">Reason for Cancellation</label>
                    <textarea name="reason" rows="4" class="input-dark w-full" placeholder="Please provide a reason..."></textarea>
                </div>
                
                <div class="flex space-x-4">
                    <button type="button" onclick="history.back()" class="btn-outline flex-1">Cancel</button>
                    <button type="submit" class="btn-primary flex-1">Submit Request</button>
                </div>
            </form>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
