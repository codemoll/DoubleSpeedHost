{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">WHOIS Lookup</h1>
            
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
                <form method="post" class="space-y-4">
                    <div>
                        <label class="block text-sm font-medium text-text-light mb-2">Domain Name</label>
                        <div class="flex space-x-4">
                            <input type="text" name="domain" value="{$domain}" 
                                   class="input-dark flex-1" placeholder="example.com">
                            <button type="submit" class="btn-primary">
                                WHOIS Lookup
                            </button>
                        </div>
                    </div>
                </form>
                
                {if $whoisdata}
                    <div class="bg-dark-bg rounded-lg p-6 border border-gray-600">
                        <h3 class="text-lg font-semibold text-white mb-4">WHOIS Information for {$domain}</h3>
                        
                        <div class="bg-dark-surface rounded-lg p-4 font-mono text-sm text-text-light whitespace-pre-wrap">
                            {$whoisdata}
                        </div>
                    </div>
                {elseif $error}
                    <div class="bg-red-900 border border-red-700 rounded-lg p-4">
                        <p class="text-red-200 text-sm">{$error}</p>
                    </div>
                {/if}
                
                <div class="bg-blue-900 border border-blue-700 rounded-lg p-4">
                    <h3 class="text-blue-200 font-semibold mb-2">About WHOIS</h3>
                    <p class="text-blue-200 text-sm">
                        WHOIS is a query protocol that displays information about domain name registration, 
                        including registrant details, registration dates, and nameserver information.
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
