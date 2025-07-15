{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-6xl mx-auto">
        <div class="mb-8">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-4">Download Categories</h1>
        </div>
        
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            {if $categories}
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    {foreach $categories as $category}
                        <div class="bg-dark-bg rounded-lg p-6 border border-gray-600 hover:border-neon-green transition-colors">
                            <div class="text-center">
                                <div class="w-16 h-16 bg-gradient-to-br from-electric-blue to-cyber-purple rounded-lg flex items-center justify-center mx-auto mb-4">
                                    <svg class="w-8 h-8 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                                        <path d="M2 6a2 2 0 012-2h5l2 2h5a2 2 0 012 2v6a2 2 0 01-2 2H4a2 2 0 01-2-2V6z"/>
                                    </svg>
                                </div>
                                <h3 class="text-xl font-semibold text-white mb-2">{$category.name}</h3>
                                <p class="text-text-light mb-4">{$category.description}</p>
                                <div class="space-y-2">
                                    <p class="text-sm text-text-light">{$category.filecount} files</p>
                                    <a href="{$WEB_ROOT}/downloads.php?cat={$category.id}" class="btn-primary btn-sm w-full">
                                        Browse Files
                                    </a>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                </div>
            {else}
                <div class="text-center py-12">
                    <svg class="w-16 h-16 text-gray-500 mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M2 6a2 2 0 012-2h5l2 2h5a2 2 0 012 2v6a2 2 0 01-2 2H4a2 2 0 01-2-2V6z"/>
                    </svg>
                    <h3 class="text-xl font-semibold text-white mb-2">No Categories Available</h3>
                    <p class="text-text-light">There are currently no download categories available.</p>
                </div>
            {/if}
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
