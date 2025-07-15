{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Email History</h1>
            
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
                {if $emails}
                    <div class="space-y-4">
                        {foreach $emails as $email}
                            <div class="bg-dark-bg rounded-lg p-4 border border-gray-600">
                                <div class="flex justify-between items-start">
                                    <div class="flex-1">
                                        <h3 class="text-white font-semibold mb-1">{$email.subject}</h3>
                                        <p class="text-text-light text-sm mb-2">
                                            <span class="mr-4">From: {$email.from}</span>
                                            <span>Date: {$email.date}</span>
                                        </p>
                                        <p class="text-text-light text-sm">{$email.preview}</p>
                                    </div>
                                    <div class="ml-4">
                                        <a href="{$WEB_ROOT}/clientarea.php?action=emails&id={$email.id}" class="btn-secondary btn-sm">
                                            View Full Email
                                        </a>
                                    </div>
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
                    <div class="text-center py-8">
                        <svg class="w-16 h-16 text-gray-500 mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                            <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                        </svg>
                        <p class="text-text-light">No emails found.</p>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
