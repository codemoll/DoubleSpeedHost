{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Get EPP Code</h1>
            
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
                        The EPP/Authorization code is required to transfer your domain to another registrar.
                    </p>
                </div>
                
                {if $eppcode}
                    <div class="bg-green-900 border border-green-700 rounded-lg p-4">
                        <h3 class="text-green-200 font-semibold mb-2">EPP/Authorization Code</h3>
                        <div class="bg-dark-bg rounded p-3 font-mono text-white">
                            {$eppcode}
                        </div>
                        <p class="text-green-200 text-sm mt-2">
                            Keep this code secure and only share it with your new registrar.
                        </p>
                    </div>
                {else}
                    <form method="post" class="text-center">
                        <p class="text-text-light mb-6">
                            Click the button below to request the EPP/Authorization code for this domain.
                        </p>
                        <button type="submit" name="action" value="getepp" class="btn-primary">
                            Get EPP Code
                        </button>
                    </form>
                {/if}
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
