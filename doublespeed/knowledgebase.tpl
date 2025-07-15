{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-20 px-4 sm:px-6 lg:px-8">
    <div class="max-w-6xl mx-auto">
        <!-- Header -->
        <div class="text-center mb-12">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                </svg>
            </div>
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                Knowledge Base
            </h1>
            <p class="text-lg text-text-light max-w-2xl mx-auto">
                Find answers to common questions and learn how to get the most out of our hosting services.
            </p>
        </div>

        <!-- Search -->
        <div class="card-dark mb-8">
            <form method="get" action="{$smarty.server.PHP_SELF}" class="flex gap-4">
                <div class="flex-1">
                    <input type="text" name="search" value="{if isset($smarty.get.search)}{$smarty.get.search}{/if}" 
                           placeholder="Search knowledge base..." 
                           class="input-dark">
                </div>
                <button type="submit" class="btn-primary px-6">
                    Search
                </button>
            </form>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-4 gap-8">
            <!-- Categories Sidebar -->
            <div class="lg:col-span-1">
                <div class="card-dark sticky top-24">
                    <h3 class="text-lg font-orbitron font-semibold text-white mb-4">Categories</h3>
                    
                    {if $kbcats}
                        <ul class="space-y-2">
                            {foreach from=$kbcats item=category}
                                <li>
                                    <a href="{$WEB_ROOT}/knowledgebase.php?action=displaycat&catid={$category.id}" 
                                       class="block p-3 rounded-lg border border-gray-700 hover:border-neon-green hover:bg-dark-bg-alt transition-all duration-300">
                                        <div class="flex items-center justify-between">
                                            <span class="text-white">{$category.name}</span>
                                            <span class="text-xs text-text-light bg-dark-bg px-2 py-1 rounded">{$category.numarticles}</span>
                                        </div>
                                        {if $category.description}
                                            <p class="text-xs text-text-light mt-1">{$category.description}</p>
                                        {/if}
                                    </a>
                                </li>
                            {/foreach}
                        </ul>
                    {else}
                        <ul class="space-y-2">
                            <li>
                                <a href="#" class="block p-3 rounded-lg border border-gray-700 hover:border-neon-green hover:bg-dark-bg-alt transition-all duration-300">
                                    <div class="flex items-center justify-between">
                                        <span class="text-white">Getting Started</span>
                                        <span class="text-xs text-text-light bg-dark-bg px-2 py-1 rounded">5</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="block p-3 rounded-lg border border-gray-700 hover:border-neon-green hover:bg-dark-bg-alt transition-all duration-300">
                                    <div class="flex items-center justify-between">
                                        <span class="text-white">Web Hosting</span>
                                        <span class="text-xs text-text-light bg-dark-bg px-2 py-1 rounded">12</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="block p-3 rounded-lg border border-gray-700 hover:border-neon-green hover:bg-dark-bg-alt transition-all duration-300">
                                    <div class="flex items-center justify-between">
                                        <span class="text-white">Domain Management</span>
                                        <span class="text-xs text-text-light bg-dark-bg px-2 py-1 rounded">8</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="block p-3 rounded-lg border border-gray-700 hover:border-neon-green hover:bg-dark-bg-alt transition-all duration-300">
                                    <div class="flex items-center justify-between">
                                        <span class="text-white">Email Services</span>
                                        <span class="text-xs text-text-light bg-dark-bg px-2 py-1 rounded">6</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="block p-3 rounded-lg border border-gray-700 hover:border-neon-green hover:bg-dark-bg-alt transition-all duration-300">
                                    <div class="flex items-center justify-between">
                                        <span class="text-white">Billing & Account</span>
                                        <span class="text-xs text-text-light bg-dark-bg px-2 py-1 rounded">9</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    {/if}
                </div>
            </div>

            <!-- Content Area -->
            <div class="lg:col-span-3">
                {if $kbarticle}
                    <!-- Article View -->
                    <div class="card-dark">
                        <div class="mb-6">
                            <div class="flex items-center text-sm text-text-light mb-4">
                                <a href="{$WEB_ROOT}/knowledgebase.php" class="hover:text-neon-green">Knowledge Base</a>
                                <svg class="w-4 h-4 mx-2" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"/>
                                </svg>
                                <span>{$kbarticle.title}</span>
                            </div>
                            
                            <h1 class="text-3xl font-orbitron font-bold text-white mb-4">{$kbarticle.title}</h1>
                            
                            <div class="flex items-center space-x-4 text-sm text-text-light">
                                <span>Last updated: {$kbarticle.date}</span>
                                <span>Views: {$kbarticle.views}</span>
                                {if $kbarticle.rating}
                                    <div class="flex items-center space-x-1">
                                        <span>Rating:</span>
                                        <div class="flex text-yellow-400">
                                            {for $i=1 to 5}
                                                {if $i <= $kbarticle.rating}
                                                    <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                                                        <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                                                    </svg>
                                                {else}
                                                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.922-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.176 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.784-.57-.38-1.81.588-1.81h4.914a1 1 0 00.951-.69l1.519-4.674z"/>
                                                    </svg>
                                                {/if}
                                            {/for}
                                        </div>
                                    </div>
                                {/if}
                            </div>
                        </div>
                        
                        <div class="prose prose-invert max-w-none">
                            {$kbarticle.article}
                        </div>
                        
                        {if $kbarticle.attachments}
                            <div class="mt-8 pt-8 border-t border-gray-700">
                                <h3 class="text-lg font-semibold text-white mb-4">Attachments</h3>
                                <div class="space-y-2">
                                    {foreach from=$kbarticle.attachments item=attachment}
                                        <a href="{$attachment.url}" class="flex items-center space-x-3 p-3 border border-gray-700 rounded-lg hover:border-neon-green transition-colors duration-300">
                                            <svg class="w-5 h-5 text-neon-green" fill="currentColor" viewBox="0 0 20 20">
                                                <path fill-rule="evenodd" d="M8 4a3 3 0 00-3 3v4a5 5 0 0010 0V7a1 1 0 112 0v4a7 7 0 11-14 0V7a5 5 0 0110 0v4a3 3 0 11-6 0V7a1 1 0 012 0v4a1 1 0 102 0V7a3 3 0 00-3-3z" clip-rule="evenodd"/>
                                            </svg>
                                            <span class="text-white">{$attachment.filename}</span>
                                            <span class="text-text-light text-sm">({$attachment.size})</span>
                                        </a>
                                    {/foreach}
                                </div>
                            </div>
                        {/if}
                    </div>
                {elseif $kbcats}
                    <!-- Category Listing -->
                    <div class="space-y-6">
                        {foreach from=$kbcats item=category}
                            <div class="card-dark">
                                <h2 class="text-xl font-orbitron font-semibold text-white mb-4">{$category.name}</h2>
                                {if $category.description}
                                    <p class="text-text-light mb-6">{$category.description}</p>
                                {/if}
                                
                                {if $category.articles}
                                    <div class="space-y-3">
                                        {foreach from=$category.articles item=article}
                                            <a href="{$WEB_ROOT}/knowledgebase.php?action=displayarticle&id={$article.id}" 
                                               class="block p-4 border border-gray-700 rounded-lg hover:border-neon-green hover:bg-dark-bg-alt transition-all duration-300">
                                                <h3 class="text-white font-medium mb-1">{$article.title}</h3>
                                                {if $article.article}
                                                    <p class="text-text-light text-sm line-clamp-2">{$article.article|strip_tags|truncate:120}</p>
                                                {/if}
                                                <div class="flex items-center justify-between mt-2 text-xs text-text-light">
                                                    <span>Updated: {$article.date}</span>
                                                    <span>Views: {$article.views}</span>
                                                </div>
                                            </a>
                                        {/foreach}
                                    </div>
                                {/if}
                            </div>
                        {/foreach}
                    </div>
                {else}
                    <!-- Default Popular Articles -->
                    <div class="space-y-6">
                        <div class="card-dark">
                            <h2 class="text-xl font-orbitron font-semibold text-white mb-6">Popular Articles</h2>
                            <div class="space-y-3">
                                <a href="#" class="block p-4 border border-gray-700 rounded-lg hover:border-neon-green hover:bg-dark-bg-alt transition-all duration-300">
                                    <h3 class="text-white font-medium mb-1">Getting Started with Web Hosting</h3>
                                    <p class="text-text-light text-sm">Learn the basics of web hosting and how to get your website online quickly.</p>
                                </a>
                                <a href="#" class="block p-4 border border-gray-700 rounded-lg hover:border-neon-green hover:bg-dark-bg-alt transition-all duration-300">
                                    <h3 class="text-white font-medium mb-1">How to Set Up Email Accounts</h3>
                                    <p class="text-text-light text-sm">Step-by-step guide to creating and configuring email accounts for your domain.</p>
                                </a>
                                <a href="#" class="block p-4 border border-gray-700 rounded-lg hover:border-neon-green hover:bg-dark-bg-alt transition-all duration-300">
                                    <h3 class="text-white font-medium mb-1">Domain Name Management</h3>
                                    <p class="text-text-light text-sm">Everything you need to know about managing your domain names and DNS settings.</p>
                                </a>
                            </div>
                        </div>
                        
                        <div class="card-dark">
                            <h2 class="text-xl font-orbitron font-semibold text-white mb-6">Need More Help?</h2>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <a href="{$WEB_ROOT}/submitticket.php" class="btn-primary text-center">
                                    Open Support Ticket
                                </a>
                                <a href="{$WEB_ROOT}/contact.php" class="btn-secondary text-center">
                                    Contact Us
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