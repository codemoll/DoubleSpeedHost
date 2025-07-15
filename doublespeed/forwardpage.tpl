{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Redirecting...</h1>
            
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
            
            <div class="text-center space-y-6">
                <div class="mx-auto w-20 h-20 bg-gradient-to-br from-electric-blue to-cyber-purple rounded-full flex items-center justify-center mb-6">
                    <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd"/>
                    </svg>
                </div>
                
                <div>
                    <h2 class="text-2xl font-bold text-white mb-4">Redirecting...</h2>
                    <p class="text-text-light mb-6">
                        You are being redirected to the next page. Please wait...
                    </p>
                </div>
                
                <div class="space-y-4">
                    {if $forwardurl}
                        <p class="text-sm text-text-light">
                            If you are not redirected automatically, 
                            <a href="{$forwardurl}" class="text-neon-green hover:text-electric-blue">click here</a>.
                        </p>
                        <script>
                            setTimeout(function() {
                                window.location.href = '{$forwardurl}';
                            }, 3000);
                        </script>
                    {else}
                        <a href="{$WEB_ROOT}/" class="btn-primary">
                            Return Home
                        </a>
                    {/if}
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
