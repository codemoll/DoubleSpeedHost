{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">View Announcement</h1>
            
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
            
            {if $announcement}
                <div class="space-y-6">
                    <div class="bg-blue-900 border border-blue-700 rounded-lg p-4">
                        <div class="flex justify-between items-start">
                            <div>
                                <h2 class="text-xl font-bold text-blue-200 mb-2">{$announcement.title}</h2>
                                <p class="text-blue-200 text-sm">
                                    Published: {$announcement.date} | By: {$announcement.author}
                                </p>
                            </div>
                            <span class="px-3 py-1 text-sm rounded bg-blue-800 text-blue-200">
                                {$announcement.type|ucfirst}
                            </span>
                        </div>
                    </div>
                    
                    <div class="prose prose-invert max-w-none">
                        {$announcement.content}
                    </div>
                    
                    {if $announcement.attachments}
                        <div class="bg-dark-bg rounded-lg p-4 border border-gray-600">
                            <h3 class="text-white font-semibold mb-3">Attachments</h3>
                            <div class="space-y-2">
                                {foreach $announcement.attachments as $attachment}
                                    <a href="{$attachment.url}" class="flex items-center text-neon-green hover:text-electric-blue">
                                        <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M3 17a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm3.293-7.707a1 1 0 011.414 0L9 10.586V3a1 1 0 112 0v7.586l1.293-1.293a1 1 0 111.414 1.414l-3 3a1 1 0 01-1.414 0l-3-3a1 1 0 010-1.414z" clip-rule="evenodd"/>
                                        </svg>
                                        {$attachment.name}
                                    </a>
                                {/foreach}
                            </div>
                        </div>
                    {/if}
                </div>
            {else}
                <div class="text-center py-12">
                    <p class="text-text-light">Announcement not found.</p>
                </div>
            {/if}
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
