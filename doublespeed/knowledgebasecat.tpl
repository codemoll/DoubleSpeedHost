{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Knowledge Base Category</h1>
            
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
                {if $kbarticles}
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        {foreach $kbarticles as $article}
                            <div class="bg-dark-bg rounded-lg p-4 border border-gray-600 hover:border-neon-green transition-colors">
                                <h3 class="text-lg font-semibold text-white mb-2">
                                    <a href="{$WEB_ROOT}/knowledgebase.php?action=displayarticle&id={$article.id}" 
                                       class="hover:text-neon-green transition-colors">
                                        {$article.title}
                                    </a>
                                </h3>
                                <p class="text-text-light text-sm mb-3">{$article.preview}</p>
                                <div class="flex justify-between items-center text-xs text-text-light">
                                    <span>{$article.views} views</span>
                                    <span>Updated: {$article.updated}</span>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                    
                    {if $pagination}
                        <div class="flex justify-center">
                            {$pagination}
                        </div>
                    {/if}
                {else}
                    <div class="text-center py-12">
                        <svg class="w-16 h-16 text-gray-500 mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                        </svg>
                        <h3 class="text-xl font-semibold text-white mb-2">No Articles Found</h3>
                        <p class="text-text-light">There are currently no articles in this category.</p>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
