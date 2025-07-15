{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Quotes</h1>
            
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
                {if $quotes}
                    <div class="space-y-4">
                        {foreach $quotes as $quote}
                            <div class="bg-dark-bg rounded-lg p-4 border border-gray-600">
                                <div class="flex justify-between items-start">
                                    <div>
                                        <h3 class="text-white font-semibold mb-1">Quote #{$quote.id}</h3>
                                        <p class="text-text-light text-sm mb-2">
                                            <span class="mr-4">Date: {$quote.date}</span>
                                            <span class="mr-4">Valid Until: {$quote.validuntil}</span>
                                        </p>
                                        <p class="text-text-light">{$quote.subject}</p>
                                    </div>
                                    <div class="text-right">
                                        <p class="text-2xl font-bold text-neon-green mb-2">${$quote.total}</p>
                                        <div class="space-x-2">
                                            <a href="{$WEB_ROOT}/viewquote.php?id={$quote.id}" class="btn-secondary btn-sm">View</a>
                                            {if $quote.status == 'sent'}
                                                <a href="{$WEB_ROOT}/acceptquote.php?id={$quote.id}" class="btn-primary btn-sm">Accept</a>
                                            {/if}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                {else}
                    <div class="text-center py-8">
                        <svg class="w-16 h-16 text-gray-500 mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M4 4a2 2 0 00-2 2v8a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2H4zm0 2h12v8H4V6z" clip-rule="evenodd"/>
                        </svg>
                        <p class="text-text-light">No quotes found.</p>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
