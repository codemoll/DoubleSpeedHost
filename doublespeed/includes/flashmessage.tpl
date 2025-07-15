{* Flash Message Component *}
{* Usage: {include file="$template/includes/flashmessage.tpl" type="success" message="Message text" dismissible=true} *}

{if $message || $successes || $errors || $warnings || $infos}
    <div class="flash-messages space-y-3 mb-6">
        
        {* Success Messages *}
        {if $message && $type == 'success' || $successes}
            {if $message && $type == 'success'}
                <div class="flash-message flash-success bg-green-900/50 border border-green-500 rounded-lg p-4" role="alert">
                    <div class="flex items-start">
                        <div class="flex-shrink-0">
                            <i class="fas fa-check-circle text-green-400 text-lg"></i>
                        </div>
                        <div class="ml-3 flex-1">
                            <div class="text-green-100 text-sm">
                                {$message}
                            </div>
                        </div>
                        {if $dismissible}
                            <div class="ml-auto pl-3">
                                <button type="button" class="inline-flex rounded-md p-1.5 text-green-400 hover:bg-green-800 focus:outline-none" onclick="this.closest('.flash-message').remove()">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        {/if}
                    </div>
                </div>
            {/if}
            
            {if $successes}
                {foreach from=$successes item=success}
                    <div class="flash-message flash-success bg-green-900/50 border border-green-500 rounded-lg p-4" role="alert">
                        <div class="flex items-start">
                            <div class="flex-shrink-0">
                                <i class="fas fa-check-circle text-green-400 text-lg"></i>
                            </div>
                            <div class="ml-3 flex-1">
                                <div class="text-green-100 text-sm">
                                    {$success}
                                </div>
                            </div>
                            <div class="ml-auto pl-3">
                                <button type="button" class="inline-flex rounded-md p-1.5 text-green-400 hover:bg-green-800 focus:outline-none" onclick="this.closest('.flash-message').remove()">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                {/foreach}
            {/if}
        {/if}
        
        {* Error Messages *}
        {if $message && $type == 'error' || $errors}
            {if $message && $type == 'error'}
                <div class="flash-message flash-error bg-red-900/50 border border-red-500 rounded-lg p-4" role="alert">
                    <div class="flex items-start">
                        <div class="flex-shrink-0">
                            <i class="fas fa-exclamation-triangle text-red-400 text-lg"></i>
                        </div>
                        <div class="ml-3 flex-1">
                            <div class="text-red-100 text-sm">
                                {$message}
                            </div>
                        </div>
                        {if $dismissible}
                            <div class="ml-auto pl-3">
                                <button type="button" class="inline-flex rounded-md p-1.5 text-red-400 hover:bg-red-800 focus:outline-none" onclick="this.closest('.flash-message').remove()">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        {/if}
                    </div>
                </div>
            {/if}
            
            {if $errors}
                {foreach from=$errors item=error}
                    <div class="flash-message flash-error bg-red-900/50 border border-red-500 rounded-lg p-4" role="alert">
                        <div class="flex items-start">
                            <div class="flex-shrink-0">
                                <i class="fas fa-exclamation-triangle text-red-400 text-lg"></i>
                            </div>
                            <div class="ml-3 flex-1">
                                <div class="text-red-100 text-sm">
                                    {$error}
                                </div>
                            </div>
                            <div class="ml-auto pl-3">
                                <button type="button" class="inline-flex rounded-md p-1.5 text-red-400 hover:bg-red-800 focus:outline-none" onclick="this.closest('.flash-message').remove()">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                {/foreach}
            {/if}
        {/if}
        
        {* Warning Messages *}
        {if $message && $type == 'warning' || $warnings}
            {if $message && $type == 'warning'}
                <div class="flash-message flash-warning bg-yellow-900/50 border border-yellow-500 rounded-lg p-4" role="alert">
                    <div class="flex items-start">
                        <div class="flex-shrink-0">
                            <i class="fas fa-exclamation-circle text-yellow-400 text-lg"></i>
                        </div>
                        <div class="ml-3 flex-1">
                            <div class="text-yellow-100 text-sm">
                                {$message}
                            </div>
                        </div>
                        {if $dismissible}
                            <div class="ml-auto pl-3">
                                <button type="button" class="inline-flex rounded-md p-1.5 text-yellow-400 hover:bg-yellow-800 focus:outline-none" onclick="this.closest('.flash-message').remove()">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        {/if}
                    </div>
                </div>
            {/if}
            
            {if $warnings}
                {foreach from=$warnings item=warning}
                    <div class="flash-message flash-warning bg-yellow-900/50 border border-yellow-500 rounded-lg p-4" role="alert">
                        <div class="flex items-start">
                            <div class="flex-shrink-0">
                                <i class="fas fa-exclamation-circle text-yellow-400 text-lg"></i>
                            </div>
                            <div class="ml-3 flex-1">
                                <div class="text-yellow-100 text-sm">
                                    {$warning}
                                </div>
                            </div>
                            <div class="ml-auto pl-3">
                                <button type="button" class="inline-flex rounded-md p-1.5 text-yellow-400 hover:bg-yellow-800 focus:outline-none" onclick="this.closest('.flash-message').remove()">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                {/foreach}
            {/if}
        {/if}
        
        {* Info Messages *}
        {if $message && $type == 'info' || $infos}
            {if $message && $type == 'info'}
                <div class="flash-message flash-info bg-blue-900/50 border border-blue-500 rounded-lg p-4" role="alert">
                    <div class="flex items-start">
                        <div class="flex-shrink-0">
                            <i class="fas fa-info-circle text-blue-400 text-lg"></i>
                        </div>
                        <div class="ml-3 flex-1">
                            <div class="text-blue-100 text-sm">
                                {$message}
                            </div>
                        </div>
                        {if $dismissible}
                            <div class="ml-auto pl-3">
                                <button type="button" class="inline-flex rounded-md p-1.5 text-blue-400 hover:bg-blue-800 focus:outline-none" onclick="this.closest('.flash-message').remove()">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        {/if}
                    </div>
                </div>
            {/if}
            
            {if $infos}
                {foreach from=$infos item=info}
                    <div class="flash-message flash-info bg-blue-900/50 border border-blue-500 rounded-lg p-4" role="alert">
                        <div class="flex items-start">
                            <div class="flex-shrink-0">
                                <i class="fas fa-info-circle text-blue-400 text-lg"></i>
                            </div>
                            <div class="ml-3 flex-1">
                                <div class="text-blue-100 text-sm">
                                    {$info}
                                </div>
                            </div>
                            <div class="ml-auto pl-3">
                                <button type="button" class="inline-flex rounded-md p-1.5 text-blue-400 hover:bg-blue-800 focus:outline-none" onclick="this.closest('.flash-message').remove()">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                {/foreach}
            {/if}
        {/if}
        
    </div>
    
    {* Auto-dismiss flash messages after 5 seconds *}
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const flashMessages = document.querySelectorAll('.flash-message');
        flashMessages.forEach(function(message) {
            if (message.querySelector('button')) {
                setTimeout(function() {
                    if (message.parentNode) {
                        message.style.opacity = '0';
                        message.style.transform = 'translateY(-10px)';
                        setTimeout(function() {
                            message.remove();
                        }, 300);
                    }
                }, 5000);
            }
        });
    });
    </script>
{/if}