{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-6xl mx-auto">
        <div class="text-center mb-12">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                </svg>
            </div>
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">Knowledge Base</h1>
            <p class="text-xl text-text-light max-w-2xl mx-auto">
                Find answers to common questions and helpful tutorials
            </p>
        </div>

        <!-- Search -->
        <div class="card-dark mb-8">
            <form method="get" action="{$smarty.server.PHP_SELF}" class="flex gap-4">
                <div class="flex-1">
                    <label for="search" class="sr-only">Search knowledge base</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <svg class="h-5 w-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"/>
                            </svg>
                        </div>
                        <input type="text" id="search" name="search" 
                               value="{if isset($smarty.get.search)}{$smarty.get.search}{/if}"
                               class="block w-full pl-10 pr-3 py-3 bg-dark-surface border border-gray-600 rounded-lg text-white placeholder-gray-400 focus:ring-2 focus:ring-neon-green focus:border-transparent transition-all duration-300"
                               placeholder="Search articles...">
                    </div>
                </div>
                <button type="submit" class="btn-primary px-6 py-3">
                    <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"/>
                    </svg>
                    Search
                </button>
            </form>
        </div>

        <!-- Knowledge Base Categories and Articles -->
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <!-- Categories Sidebar -->
            <div class="lg:col-span-1">
                <div class="card-dark">
                    <h2 class="text-xl font-orbitron font-bold text-white mb-6">Categories</h2>
                    {if isset($kbcats) && is_array($kbcats) && $kbcats|@count > 0}
                        <nav class="space-y-2">
                            {foreach from=$kbcats item=category}
                                <a href="{$WEB_ROOT}/knowledgebase.php?action=displaycat&catid={$category.id}"
                                   class="flex items-center justify-between p-3 rounded-lg bg-dark-surface hover:bg-gray-700 text-text-light hover:text-white transition-all duration-300 group">
                                    <span class="font-medium">{$category.name}</span>
                                    {if isset($category.numarticles) && $category.numarticles > 0}
                                        <span class="text-xs bg-neon-green bg-opacity-20 text-neon-green px-2 py-1 rounded-full">
                                            {$category.numarticles}
                                        </span>
                                    {/if}
                                </a>
                            {/foreach}
                        </nav>
                    {else}
                        <div class="text-center py-8">
                            <svg class="w-12 h-12 text-gray-600 mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z" clip-rule="evenodd"/>
                            </svg>
                            <p class="text-text-light">No categories available</p>
                        </div>
                    {/if}
                </div>
            </div>

            <!-- Articles Content -->
            <div class="lg:col-span-2">
                {if isset($kbarticles) && is_array($kbarticles) && $kbarticles|@count > 0}
                    <div class="space-y-6">
                        {foreach from=$kbarticles item=article}
                            <div class="card-dark">
                                <div class="flex items-start justify-between">
                                    <div class="flex-1">
                                        <h3 class="text-xl font-semibold text-white mb-2">
                                            <a href="{$WEB_ROOT}/knowledgebase.php?action=displayarticle&id={$article.id}" 
                                               class="hover:text-neon-green transition-colors duration-300">
                                                {$article.title}
                                            </a>
                                        </h3>
                                        {if isset($article.article) && $article.article}
                                            <p class="text-text-light mb-4 leading-relaxed">
                                                {$article.article|strip_tags|truncate:200:"..."}
                                            </p>
                                        {/if}
                                        <div class="flex items-center space-x-4 text-sm text-gray-400">
                                            {if isset($article.datecreated) && $article.datecreated}
                                                <span class="flex items-center">
                                                    <svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                                                        <path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"/>
                                                    </svg>
                                                    {$article.datecreated|date_format:"%B %e, %Y"}
                                                </span>
                                            {/if}
                                            {if isset($article.views) && $article.views}
                                                <span class="flex items-center">
                                                    <svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                                                        <path d="M10 12a2 2 0 100-4 2 2 0 000 4z"/>
                                                        <path fill-rule="evenodd" d="M.458 10C1.732 5.943 5.522 3 10 3s8.268 2.943 9.542 7c-1.274 4.057-5.064 7-9.542 7S1.732 14.057.458 10zM14 10a4 4 0 11-8 0 4 4 0 018 0z" clip-rule="evenodd"/>
                                                    </svg>
                                                    {$article.views} views
                                                </span>
                                            {/if}
                                            {if isset($article.helpful) && $article.helpful}
                                                <span class="flex items-center">
                                                    <svg class="w-4 h-4 mr-1 text-green-400" fill="currentColor" viewBox="0 0 20 20">
                                                        <path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd"/>
                                                    </svg>
                                                    {$article.helpful}% helpful
                                                </span>
                                            {/if}
                                        </div>
                                    </div>
                                    <div class="ml-4">
                                        <a href="{$WEB_ROOT}/knowledgebase.php?action=displayarticle&id={$article.id}" 
                                           class="inline-flex items-center px-4 py-2 bg-gradient-to-r from-neon-green to-electric-blue text-dark-bg font-medium rounded-lg hover:from-electric-blue hover:to-neon-green transition-all duration-300">
                                            Read More
                                            <svg class="w-4 h-4 ml-2" fill="currentColor" viewBox="0 0 20 20">
                                                <path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"/>
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>

                    {if isset($numfound) && $numfound > 0 && isset($limit) && $limit && $numfound > $limit}
                        <div class="mt-8 text-center">
                            <p class="text-text-light mb-4">Showing {$limit} of {$numfound} articles</p>
                            <!-- Pagination can be added here if needed -->
                        </div>
                    {/if}
                {else}
                    <div class="card-dark">
                        <div class="text-center py-12">
                            <div class="mx-auto w-16 h-16 bg-gradient-to-br from-gray-600 to-gray-700 rounded-full flex items-center justify-center mb-6">
                                <svg class="w-8 h-8 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                                </svg>
                            </div>
                            <h3 class="text-xl font-semibold text-white mb-2">No Articles Found</h3>
                            <p class="text-text-light mb-6">
                                {if isset($smarty.get.search) && $smarty.get.search}
                                    No articles match your search for "{$smarty.get.search}". Try using different keywords or browse our categories.
                                {else}
                                    There are currently no articles available in this knowledge base. Check back later for helpful content.
                                {/if}
                            </p>
                            <div class="flex flex-col sm:flex-row gap-3 justify-center">
                                {if isset($smarty.get.search) && $smarty.get.search}
                                    <a href="{$WEB_ROOT}/knowledgebase.php" class="btn-secondary">
                                        <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z" clip-rule="evenodd"/>
                                        </svg>
                                        View All Articles
                                    </a>
                                {/if}
                                <a href="{$WEB_ROOT}/contact.php" class="btn-primary">
                                    <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                        <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                                        <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                                    </svg>
                                    Contact Support
                                </a>
                            </div>
                        </div>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}