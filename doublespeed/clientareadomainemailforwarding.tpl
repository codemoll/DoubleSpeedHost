{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Email Forwarding</h1>
            
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
                        Set up email forwarding for your domain. Forward emails from your domain to any email address.
                    </p>
                </div>
                
                {if $emailforwards}
                    <div class="space-y-4">
                        {foreach $emailforwards as $forward}
                            <div class="bg-dark-bg rounded-lg p-4 border border-gray-600">
                                <div class="flex justify-between items-center">
                                    <div>
                                        <p class="text-white font-semibold">{$forward.source}</p>
                                        <p class="text-text-light text-sm">Forwards to: {$forward.destination}</p>
                                    </div>
                                    <button class="btn-outline btn-sm">Delete</button>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                {/if}
                
                <div class="border-t border-gray-600 pt-6">
                    <h3 class="text-lg font-semibold text-white mb-4">Add Email Forward</h3>
                    <form method="post" class="space-y-4">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="block text-sm font-medium text-text-light mb-2">From</label>
                                <input type="text" name="source" class="input-dark w-full" placeholder="info@yourdomain.com">
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-text-light mb-2">To</label>
                                <input type="email" name="destination" class="input-dark w-full" placeholder="your@email.com">
                            </div>
                        </div>
                        <button type="submit" class="btn-primary">Add Forward</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
