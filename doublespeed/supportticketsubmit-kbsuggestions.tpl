{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Knowledge Base Suggestions</h1>
            
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
                        Before submitting your ticket, please check if any of these articles might help resolve your issue.
                    </p>
                </div>
                
                {if $suggestions}
                    <div class="space-y-4">
                        {foreach $suggestions as $article}
                            <div class="bg-dark-bg rounded-lg p-4 border border-gray-600 hover:border-neon-green transition-colors">
                                <div class="flex justify-between items-start">
                                    <div class="flex-1">
                                        <h3 class="text-white font-semibold mb-2">{$article.title}</h3>
                                        <p class="text-text-light text-sm mb-3">{$article.preview}</p>
                                        <div class="flex items-center text-xs text-text-light">
                                            <span class="mr-4">Views: {$article.views}</span>
                                            <span>Last updated: {$article.updated}</span>
                                        </div>
                                    </div>
                                    <div class="ml-4">
                                        <a href="{$WEB_ROOT}/knowledgebase.php?action=displayarticle&id={$article.id}" 
                                           target="_blank" class="btn-secondary btn-sm">
                                            Read Article
                                        </a>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                {/if}
                
                <div class="bg-dark-bg rounded-lg p-6 border border-gray-600">
                    <h3 class="text-lg font-semibold text-white mb-4">Still need help?</h3>
                    <p class="text-text-light mb-4">
                        If none of these articles resolve your issue, please continue with submitting your support ticket.
                    </p>
                    <div class="flex space-x-4">
                        <a href="{$WEB_ROOT}/knowledgebase.php" class="btn-outline flex-1 text-center">
                            Browse Knowledge Base
                        </a>
                        <button type="button" onclick="continueTicketSubmission()" class="btn-primary flex-1">
                            Continue with Ticket
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
