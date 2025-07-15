{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">View Email</h1>
            
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
            
            {if $email}
                <div class="space-y-6">
                    <div class="bg-dark-bg rounded-lg p-6 border border-gray-600">
                        <div class="border-b border-gray-700 pb-4 mb-4">
                            <h2 class="text-xl font-bold text-white mb-2">{$email.subject}</h2>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm text-text-light">
                                <div>
                                    <p><strong>From:</strong> {$email.from}</p>
                                    <p><strong>To:</strong> {$email.to}</p>
                                </div>
                                <div>
                                    <p><strong>Date:</strong> {$email.date}</p>
                                    <p><strong>Type:</strong> {$email.type}</p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="prose prose-invert max-w-none">
                            {$email.content}
                        </div>
                    </div>
                    
                    <div class="flex space-x-4">
                        <a href="{$WEB_ROOT}/clientarea.php?action=emails" class="btn-outline">
                            Back to Emails
                        </a>
                        <button onclick="window.print()" class="btn-secondary">
                            Print Email
                        </button>
                    </div>
                </div>
            {else}
                <div class="text-center py-12">
                    <p class="text-text-light">Email not found.</p>
                </div>
            {/if}
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
