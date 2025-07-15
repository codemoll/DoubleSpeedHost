{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">SSL Configuration - Step 2</h1>
            
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
                <form method="post" class="space-y-6">
                    <div>
                        <label class="block text-sm font-medium text-text-light mb-2">Certificate Signing Request (CSR)</label>
                        <textarea name="csr" rows="10" class="input-dark w-full" placeholder="Paste your CSR here..."></textarea>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-text-light mb-2">Validation Method</label>
                        <select name="validation" class="input-dark w-full">
                            <option value="email">Email Validation</option>
                            <option value="dns">DNS Validation</option>
                            <option value="file">File Validation</option>
                        </select>
                    </div>
                    
                    <div class="flex space-x-4">
                        <button type="button" onclick="history.back()" class="btn-outline flex-1">Back</button>
                        <button type="submit" class="btn-primary flex-1">Complete Configuration</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
