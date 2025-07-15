{* Alert/Notification Component *}
{* Usage: {include file="$template/includes/alert.tpl" type="success" message="Operation completed successfully"} *}

{if $message}
    <div class="rounded-lg p-4 mb-4 {if $type == 'success'}bg-green-900/50 border border-green-500{elseif $type == 'error'}bg-red-900/50 border border-red-500{elseif $type == 'warning'}bg-yellow-900/50 border border-yellow-500{else}bg-blue-900/50 border border-blue-500{/if}">
        <div class="flex items-start">
            <div class="flex-shrink-0">
                {if $type == 'success'}
                    <i class="fas fa-check-circle text-green-400 text-lg"></i>
                {elseif $type == 'error'}
                    <i class="fas fa-exclamation-triangle text-red-400 text-lg"></i>
                {elseif $type == 'warning'}
                    <i class="fas fa-exclamation-circle text-yellow-400 text-lg"></i>
                {else}
                    <i class="fas fa-info-circle text-blue-400 text-lg"></i>
                {/if}
            </div>
            <div class="ml-3 flex-1">
                {if $title}
                    <h3 class="text-sm font-medium {if $type == 'success'}text-green-100{elseif $type == 'error'}text-red-100{elseif $type == 'warning'}text-yellow-100{else}text-blue-100{/if}">
                        {$title}
                    </h3>
                {/if}
                <div class="text-sm {if $type == 'success'}text-green-200{elseif $type == 'error'}text-red-200{elseif $type == 'warning'}text-yellow-200{else}text-blue-200{/if} {if $title}mt-1{/if}">
                    {$message}
                </div>
            </div>
            {if $dismissible}
                <div class="ml-auto pl-3">
                    <button type="button" class="inline-flex rounded-md p-1.5 {if $type == 'success'}text-green-400 hover:bg-green-800{elseif $type == 'error'}text-red-400 hover:bg-red-800{elseif $type == 'warning'}text-yellow-400 hover:bg-yellow-800{else}text-blue-400 hover:bg-blue-800{/if} focus:outline-none" onclick="this.parentElement.parentElement.parentElement.remove()">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
            {/if}
        </div>
    </div>
{/if}