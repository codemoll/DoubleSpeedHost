{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-6xl mx-auto">
        <div class="mb-8">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-4">Downloads</h1>
        </div>
        
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            {if $downloads}
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    {foreach $downloads as $download}
                        <div class="bg-dark-bg rounded-lg p-4 border border-gray-600 hover:border-neon-green transition-colors">
                            <div class="text-center">
                                <div class="w-16 h-16 bg-gradient-to-br from-neon-green to-electric-blue rounded-lg flex items-center justify-center mx-auto mb-4">
                                    <svg class="w-8 h-8 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M3 17a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm3.293-7.707a1 1 0 011.414 0L9 10.586V3a1 1 0 112 0v7.586l1.293-1.293a1 1 0 111.414 1.414l-3 3a1 1 0 01-1.414 0l-3-3a1 1 0 010-1.414z" clip-rule="evenodd"/>
                                    </svg>
                                </div>
                                <h3 class="text-lg font-semibold text-white mb-2">{$download.title}</h3>
                                <p class="text-text-light text-sm mb-4">{$download.description}</p>
                                <div class="space-y-2">
                                    <p class="text-xs text-text-light">
                                        <span class="mr-3">Size: {$download.filesize}</span>
                                        <span>Downloads: {$download.downloads}</span>
                                    </p>
                                    <a href="{$download.link}" class="btn-primary btn-sm w-full">
                                        Download
                                    </a>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                </div>
            {else}
                <div class="text-center py-12">
                    <svg class="w-16 h-16 text-gray-500 mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M3 17a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm3.293-7.707a1 1 0 011.414 0L9 10.586V3a1 1 0 112 0v7.586l1.293-1.293a1 1 0 111.414 1.414l-3 3a1 1 0 01-1.414 0l-3-3a1 1 0 010-1.414z" clip-rule="evenodd"/>
                    </svg>
                    <h3 class="text-xl font-semibold text-white mb-2">No Downloads Available</h3>
                    <p class="text-text-light">There are currently no downloads available.</p>
                </div>
            {/if}
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
