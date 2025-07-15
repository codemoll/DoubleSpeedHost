{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-6xl mx-auto">
        
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                <span class="glow-text">Knowledge Base</span>
            </h1>
            <p class="text-text-light">
                Find answers to common questions and learn how to get the most out of your services.
            </p>
        </div>
        
        <!-- Search -->
        <div class="card-dark mb-8">
            <form method="get" action="{$smarty.server.PHP_SELF}" class="flex gap-4">
                <div class="flex-1">
                    <input type="text" name="search" placeholder="Search knowledge base..." 
                           class="input-dark w-full" value="{if $smarty.get.search}{$smarty.get.search}{/if}">
                </div>
                <button type="submit" class="btn-primary whitespace-nowrap">
                    <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"/>
                    </svg>
                    Search
                </button>
            </form>
        </div>
        
        {if $kbcat || $smarty.get.search}
            <!-- Breadcrumbs -->
            {if $kbcat}
                <div class="mb-6">
                    <nav class="flex items-center space-x-2 text-sm">
                        <a href="{$WEB_ROOT}/knowledgebase.php" class="text-neon-green hover:text-electric-blue transition-colors duration-300">
                            Knowledge Base
                        </a>
                        <svg class="w-4 h-4 text-text-light" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-white">{$kbcat.name}</span>
                    </nav>
                </div>
            {/if}
            
            <!-- Articles List -->
            {if $kbarticles}
                <div class="space-y-4">
                    {foreach from=$kbarticles item=article}
                        <div class="card-dark hover:border-neon-green transition-colors duration-300">
                            <div class="flex items-start justify-between">
                                <div class="flex-1">
                                    <h3 class="text-xl font-semibold text-white mb-2">
                                        <a href="{$WEB_ROOT}/knowledgebase.php?action=displayarticle&id={$article.id}" 
                                           class="hover:text-neon-green transition-colors duration-300">
                                            {$article.title}
                                        </a>
                                    </h3>
                                    <p class="text-text-light text-sm mb-4">
                                        {$article.article|strip_tags|truncate:200}
                                    </p>
                                    <div class="flex items-center space-x-4 text-xs text-text-light">
                                        <span>📅 {$article.datecreated}</span>
                                        <span>👁 {$article.views} views</span>
                                        {if $article.rating}
                                            <span>⭐ {$article.rating}/5</span>
                                        {/if}
                                    </div>
                                </div>
                                <div class="ml-4">
                                    <a href="{$WEB_ROOT}/knowledgebase.php?action=displayarticle&id={$article.id}" 
                                       class="btn-outline text-sm px-3 py-1">
                                        Read More
                                    </a>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                </div>
            {else}
                <div class="card-dark text-center py-12">
                    <div class="mx-auto w-20 h-20 bg-gradient-to-br from-gray-600 to-gray-700 rounded-full flex items-center justify-center mb-6">
                        <svg class="w-10 h-10 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                        </svg>
                    </div>
                    <h3 class="text-xl font-semibold text-white mb-2">No Articles Found</h3>
                    <p class="text-text-light mb-6">
                        {if $smarty.get.search}
                            No articles match your search criteria. Try different keywords or browse categories below.
                        {else}
                            This category doesn't contain any articles yet.
                        {/if}
                    </p>
                    {if $smarty.get.search}
                        <a href="{$WEB_ROOT}/knowledgebase.php" class="btn-primary">
                            Browse Categories
                        </a>
                    {/if}
                </div>
            {/if}
        {else}
            <!-- Categories Grid -->
            {if $kbcats}
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
                    {foreach from=$kbcats item=category}
                        <div class="card-dark hover:border-neon-green transition-all duration-300 group">
                            <a href="{$WEB_ROOT}/knowledgebase.php?action=displaycat&catid={$category.id}" 
                               class="block">
                                <div class="flex items-center space-x-4 mb-4">
                                    <div class="w-12 h-12 bg-gradient-to-br from-neon-green to-electric-blue rounded-lg flex items-center justify-center group-hover:scale-110 transition-transform duration-300">
                                        <svg class="w-6 h-6 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                                            <path d="M2 6a2 2 0 012-2h5l2 2h5a2 2 0 012 2v6a2 2 0 01-2 2H4a2 2 0 01-2-2V6z"/>
                                        </svg>
                                    </div>
                                    <div>
                                        <h3 class="text-lg font-semibold text-white group-hover:text-neon-green transition-colors duration-300">
                                            {$category.name}
                                        </h3>
                                        <p class="text-text-light text-sm">
                                            {$category.numarticles} article{if $category.numarticles != 1}s{/if}
                                        </p>
                                    </div>
                                </div>
                                <p class="text-text-light text-sm">
                                    {$category.description|truncate:100}
                                </p>
                            </a>
                        </div>
                    {/foreach}
                </div>
                
                <!-- Popular Articles -->
                {if $populararticles}
                    <div class="card-dark">
                        <h2 class="text-2xl font-semibold text-white mb-6">Popular Articles</h2>
                        <div class="space-y-4">
                            {foreach from=$populararticles item=article}
                                <div class="flex items-center justify-between p-4 bg-dark-bg rounded-lg border border-gray-700 hover:border-electric-blue transition-colors duration-300">
                                    <div>
                                        <h4 class="text-white font-medium mb-1">
                                            <a href="{$WEB_ROOT}/knowledgebase.php?action=displayarticle&id={$article.id}" 
                                               class="hover:text-electric-blue transition-colors duration-300">
                                                {$article.title}
                                            </a>
                                        </h4>
                                        <p class="text-text-light text-sm">
                                            {$article.views} views • {$article.category}
                                        </p>
                                    </div>
                                    <a href="{$WEB_ROOT}/knowledgebase.php?action=displayarticle&id={$article.id}" 
                                       class="text-neon-green hover:text-electric-blue transition-colors duration-300">
                                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"/>
                                        </svg>
                                    </a>
                                </div>
                            {/foreach}
                        </div>
                    </div>
                {/if}
            {else}
                <div class="card-dark text-center py-12">
                    <div class="mx-auto w-20 h-20 bg-gradient-to-br from-gray-600 to-gray-700 rounded-full flex items-center justify-center mb-6">
                        <svg class="w-10 h-10 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-3a1 1 0 00-.867.5 1 1 0 11-1.731-1A3 3 0 0113 8a3.001 3.001 0 01-2 2.83V11a1 1 0 11-2 0v-1a1 1 0 011-1 1 1 0 100-2zm0 8a1 1 0 100-2 1 1 0 000 2z" clip-rule="evenodd"/>
                        </svg>
                    </div>
                    <h3 class="text-xl font-semibold text-white mb-2">No Categories Available</h3>
                    <p class="text-text-light mb-6">
                        The knowledge base is being set up. Please check back later or contact support for assistance.
                    </p>
                    <a href="{$WEB_ROOT}/submitticket.php" class="btn-primary">
                        Contact Support
                    </a>
                </div>
            {/if}
        {/if}
        
        <!-- Help Section -->
        <div class="mt-8 grid grid-cols-1 md:grid-cols-3 gap-6">
            <div class="card-dark text-center">
                <svg class="w-12 h-12 text-neon-green mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M18 13V5a2 2 0 00-2-2H4a2 2 0 00-2 2v8a2 2 0 002 2h3l3 3 3-3h3a2 2 0 002-2zM5 7a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zm1 3a1 1 0 100 2h3a1 1 0 100-2H6z" clip-rule="evenodd"/>
                </svg>
                <h3 class="text-lg font-semibold text-white mb-2">Submit Ticket</h3>
                <p class="text-text-light text-sm mb-4">Can't find what you're looking for? Get personalized help</p>
                <a href="{$WEB_ROOT}/submitticket.php" class="btn-outline">Open Ticket</a>
            </div>
            
            <div class="card-dark text-center">
                <svg class="w-12 h-12 text-electric-blue mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M18 10c0 3.866-3.582 7-8 7a8.841 8.841 0 01-4.083-.98L2 17l1.338-3.123C2.493 12.767 2 11.434 2 10c0-3.866 3.582-7 8-7s8 3.134 8 7zM7 9H5v2h2V9zm8 0h-2v2h2V9zM9 9h2v2H9V9z" clip-rule="evenodd"/>
                </svg>
                <h3 class="text-lg font-semibold text-white mb-2">Live Chat</h3>
                <p class="text-text-light text-sm mb-4">Chat with our support team in real-time</p>
                <a href="#" onclick="openLiveChat()" class="btn-outline">Start Chat</a>
            </div>
            
            <div class="card-dark text-center">
                <svg class="w-12 h-12 text-cyber-purple mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                    <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                </svg>
                <h3 class="text-lg font-semibold text-white mb-2">Email Support</h3>
                <p class="text-text-light text-sm mb-4">Send us an email and we'll get back to you</p>
                <a href="{$WEB_ROOT}/contact.php" class="btn-outline">Contact Us</a>
            </div>
        </div>
    </div>
</div>

<script>
function openLiveChat() {
    // This would typically open a live chat widget
    // For now, redirect to ticket system
    window.location.href = '{$WEB_ROOT}/submitticket.php';
}
</script>

{include file="$template/footer.tpl"}