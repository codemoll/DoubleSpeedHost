{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        
        <!-- Page Header -->
        <div class="mb-8">
            <div class="flex items-center space-x-3 mb-4">
                <a href="{$WEB_ROOT}/knowledgebase.php" 
                   class="text-neon-green hover:text-electric-blue transition-colors duration-300">
                    <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z" clip-rule="evenodd"/>
                    </svg>
                </a>
                <h1 class="text-4xl font-orbitron font-bold text-white">
                    <span class="glow-text">{$kbarticle.title}</span>
                </h1>
            </div>
            
            <!-- Article Meta -->
            <div class="flex flex-wrap items-center gap-4 text-sm text-text-light">
                <div class="flex items-center space-x-2">
                    <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M2 6a2 2 0 012-2h5l2 2h5a2 2 0 012 2v6a2 2 0 01-2 2H4a2 2 0 01-2-2V6z"/>
                    </svg>
                    <span>{$kbarticle.categoryname}</span>
                </div>
                <div class="flex items-center space-x-2">
                    <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"/>
                    </svg>
                    <span>Published: {$kbarticle.datecreated}</span>
                </div>
                <div class="flex items-center space-x-2">
                    <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M10 12a2 2 0 100-4 2 2 0 000 4z"/>
                        <path fill-rule="evenodd" d="M.458 10C1.732 5.943 5.522 3 10 3s8.268 2.943 9.542 7c-1.274 4.057-5.064 7-9.542 7S1.732 14.057.458 10zM14 10a4 4 0 11-8 0 4 4 0 018 0z" clip-rule="evenodd"/>
                    </svg>
                    <span>{$kbarticle.views} views</span>
                </div>
                {if $kbarticle.rating}
                    <div class="flex items-center space-x-2">
                        <svg class="w-4 h-4 text-yellow-400" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                        </svg>
                        <span>{$kbarticle.rating}/5 ({$kbarticle.votes} votes)</span>
                    </div>
                {/if}
            </div>
        </div>
        
        <!-- Article Content -->
        <div class="card-dark mb-8">
            <div class="prose prose-invert max-w-none">
                {$kbarticle.article}
            </div>
        </div>
        
        <!-- Article Rating -->
        <div class="card-dark mb-8">
            <h3 class="text-xl font-semibold text-white mb-6">Was this article helpful?</h3>
            
            {if $rated}
                <div class="bg-green-900 border border-green-700 rounded-lg p-4">
                    <div class="flex">
                        <svg class="w-5 h-5 text-green-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                        </svg>
                        <div class="text-green-200 text-sm">
                            Thank you for your feedback!
                        </div>
                    </div>
                </div>
            {else}
                <div class="flex items-center justify-center space-x-4">
                    <form method="post" action="{$smarty.server.PHP_SELF}" class="inline-block">
                        <input type="hidden" name="articleid" value="{$kbarticle.id}">
                        <input type="hidden" name="rating" value="5">
                        <button type="submit" name="rate" 
                                class="flex items-center space-x-2 px-6 py-3 bg-green-900 hover:bg-green-800 text-green-200 rounded-lg transition-colors duration-300">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M2 10.5a1.5 1.5 0 113 0v6a1.5 1.5 0 01-3 0v-6zM6 10.333v5.43a2 2 0 001.106 1.79l.05.025A4 4 0 008.943 18h5.416a2 2 0 001.962-1.608l1.2-6A2 2 0 0015.56 8H12V4a2 2 0 00-2-2 1 1 0 00-1 1v.667a4 4 0 01-.8 2.4L6.8 7.933a4 4 0 00-.8 2.4z"/>
                            </svg>
                            <span>Yes, helpful</span>
                        </button>
                    </form>
                    
                    <form method="post" action="{$smarty.server.PHP_SELF}" class="inline-block">
                        <input type="hidden" name="articleid" value="{$kbarticle.id}">
                        <input type="hidden" name="rating" value="1">
                        <button type="submit" name="rate" 
                                class="flex items-center space-x-2 px-6 py-3 bg-red-900 hover:bg-red-800 text-red-200 rounded-lg transition-colors duration-300">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M18 9.5a1.5 1.5 0 11-3 0v-6a1.5 1.5 0 013 0v6zM14 9.667v-5.43a2 2 0 00-1.106-1.79l-.05-.025A4 4 0 0011.157 2H5.741a2 2 0 00-1.962 1.608l-1.2 6A2 2 0 004.539 12H8v4a2 2 0 002 2 1 1 0 001-1v-.667a4 4 0 01.8-2.4l1.4-1.866a4 4 0 00.8-2.4z"/>
                            </svg>
                            <span>No, not helpful</span>
                        </button>
                    </form>
                </div>
            {/if}
        </div>
        
        <!-- Related Articles -->
        {if $relatedarticles}
            <div class="card-dark mb-8">
                <h3 class="text-xl font-semibold text-white mb-6">Related Articles</h3>
                <div class="space-y-4">
                    {foreach from=$relatedarticles item=article}
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
        
        <!-- Contact Support -->
        <div class="card-dark text-center">
            <h3 class="text-xl font-semibold text-white mb-4">Still need help?</h3>
            <p class="text-text-light mb-6">
                If this article didn't solve your problem, our support team is here to help you.
            </p>
            <div class="flex flex-col sm:flex-row gap-4 justify-center">
                <a href="{$WEB_ROOT}/submitticket.php" class="btn-primary">
                    <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M18 13V5a2 2 0 00-2-2H4a2 2 0 00-2 2v8a2 2 0 002 2h3l3 3 3-3h3a2 2 0 002-2zM5 7a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zm1 3a1 1 0 100 2h3a1 1 0 100-2H6z" clip-rule="evenodd"/>
                    </svg>
                    Submit Support Ticket
                </a>
                <a href="{$WEB_ROOT}/contact.php" class="btn-outline">
                    <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                        <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                    </svg>
                    Contact Us
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Custom Styles for Article Content -->
<style>
.prose h1, .prose h2, .prose h3, .prose h4, .prose h5, .prose h6 {
    color: #ffffff;
    font-family: 'Orbitron', monospace;
    margin-top: 1.5em;
    margin-bottom: 0.5em;
}

.prose h1 { font-size: 2em; }
.prose h2 { font-size: 1.75em; }
.prose h3 { font-size: 1.5em; }
.prose h4 { font-size: 1.25em; }

.prose p {
    color: #BFBFBF;
    line-height: 1.7;
    margin-bottom: 1em;
}

.prose ul, .prose ol {
    color: #BFBFBF;
    margin-bottom: 1em;
    padding-left: 1.5em;
}

.prose li {
    margin-bottom: 0.5em;
}

.prose blockquote {
    border-left: 4px solid #00FF88;
    background: rgba(0, 255, 136, 0.1);
    margin: 1em 0;
    padding: 1em;
    border-radius: 0.5em;
}

.prose code {
    background: #121212;
    color: #00FF88;
    padding: 0.2em 0.4em;
    border-radius: 0.3em;
    font-family: 'Courier New', monospace;
}

.prose pre {
    background: #121212;
    color: #ffffff;
    padding: 1em;
    border-radius: 0.5em;
    overflow-x: auto;
    margin: 1em 0;
    border: 1px solid #374151;
}

.prose a {
    color: #00FF88;
    text-decoration: none;
    transition: color 0.3s;
}

.prose a:hover {
    color: #007BFF;
}

.prose img {
    max-width: 100%;
    border-radius: 0.5em;
    margin: 1em 0;
}

.prose table {
    width: 100%;
    border-collapse: collapse;
    margin: 1em 0;
}

.prose th, .prose td {
    border: 1px solid #374151;
    padding: 0.75em;
    text-align: left;
}

.prose th {
    background: #2A2A2A;
    color: #ffffff;
    font-weight: 600;
}

.prose td {
    color: #BFBFBF;
}
</style>

{include file="$template/footer.tpl"}