{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Register Nameservers</h1>
            
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
                        Register custom nameservers for your domain.
                    </p>
                </div>
                
                <form method="post" class="space-y-6">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-sm font-medium text-text-light mb-2">Nameserver 1</label>
                            <input type="text" name="ns1" class="input-dark w-full" placeholder="ns1.yourdomain.com">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-text-light mb-2">IP Address 1</label>
                            <input type="text" name="ip1" class="input-dark w-full" placeholder="192.168.1.1">
                        </div>
                    </div>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-sm font-medium text-text-light mb-2">Nameserver 2</label>
                            <input type="text" name="ns2" class="input-dark w-full" placeholder="ns2.yourdomain.com">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-text-light mb-2">IP Address 2</label>
                            <input type="text" name="ip2" class="input-dark w-full" placeholder="192.168.1.2">
                        </div>
                    </div>
                    
                    <button type="submit" class="btn-primary">Register Nameservers</button>
                </form>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
