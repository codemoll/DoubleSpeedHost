{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Domain Add-ons</h1>
            
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
                {if $domainaddons}
                    {foreach $domainaddons as $addon}
                        <div class="bg-dark-bg rounded-lg p-4 border border-gray-600">
                            <div class="flex justify-between items-start">
                                <div>
                                    <h3 class="text-lg font-semibold text-white mb-2">{$addon.name}</h3>
                                    <p class="text-text-light mb-4">{$addon.description}</p>
                                </div>
                                <div class="text-right">
                                    <span class="text-neon-green font-semibold">${$addon.price}</span>
                                    <form method="post" class="mt-2">
                                        <input type="hidden" name="addon" value="{$addon.id}">
                                        <button type="submit" class="btn-primary btn-sm">Add</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                {else}
                    <div class="text-center py-8">
                        <p class="text-text-light">No domain add-ons available for this domain.</p>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
