{* Confirmation Dialog Component *}
{* Usage: {include file="$template/includes/confirmation.tpl" message="Are you sure?" action="delete" target="#item"} *}

{assign var="confirmId" value=$id|default:"confirmation-modal"}
{assign var="confirmType" value=$type|default:"danger"}

<div id="{$confirmId}" class="fixed inset-0 z-50 overflow-y-auto hidden" aria-labelledby="{$confirmId}-title" role="dialog" aria-modal="true">
    <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
        
        {* Background overlay *}
        <div class="fixed inset-0 bg-black bg-opacity-75 transition-opacity" aria-hidden="true"></div>
        
        {* Center modal *}
        <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>
        
        {* Modal panel *}
        <div class="inline-block align-bottom bg-dark-surface rounded-lg border border-gray-700 text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
            
            {* Modal Header *}
            <div class="px-6 py-4 border-b border-gray-700 {if $confirmType == 'danger'}bg-gradient-to-r from-red-500/10 to-transparent{elseif $confirmType == 'warning'}bg-gradient-to-r from-yellow-500/10 to-transparent{else}bg-gradient-to-r from-neon-green/10 to-transparent{/if}">
                <div class="flex items-center">
                    <div class="flex-shrink-0">
                        {if $confirmType == 'danger'}
                            <i class="fas fa-exclamation-triangle text-red-400 text-2xl"></i>
                        {elseif $confirmType == 'warning'}
                            <i class="fas fa-exclamation-circle text-yellow-400 text-2xl"></i>
                        {else}
                            <i class="fas fa-question-circle text-neon-green text-2xl"></i>
                        {/if}
                    </div>
                    <div class="ml-3">
                        <h3 class="text-lg font-semibold {if $confirmType == 'danger'}text-red-400{elseif $confirmType == 'warning'}text-yellow-400{else}text-neon-green{/if}" id="{$confirmId}-title">
                            {$title|default:$LANG.confirm}
                        </h3>
                    </div>
                </div>
            </div>
            
            {* Modal Body *}
            <div class="px-6 py-4">
                <div class="text-gray-300">
                    {if $message}
                        {$message}
                    {else}
                        {$LANG.confirmaction}
                    {/if}
                </div>
                
                {if $details}
                    <div class="mt-3 p-3 bg-gray-900/50 border border-gray-700 rounded text-sm text-gray-400">
                        {$details}
                    </div>
                {/if}
            </div>
            
            {* Modal Footer *}
            <div class="px-6 py-4 border-t border-gray-700 bg-gray-900/30">
                <div class="flex items-center justify-end space-x-3">
                    <button type="button" 
                            class="px-4 py-2 text-sm font-medium text-gray-300 bg-gray-700 border border-gray-600 rounded-lg hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-gray-500 transition-colors duration-200" 
                            onclick="closeConfirmation('{$confirmId}')">
                        {$cancelText|default:$LANG.cancel}
                    </button>
                    <button type="button" 
                            class="px-4 py-2 text-sm font-medium text-white {if $confirmType == 'danger'}bg-red-600 border border-red-500 hover:bg-red-700 focus:ring-red-500{elseif $confirmType == 'warning'}bg-yellow-600 border border-yellow-500 hover:bg-yellow-700 focus:ring-yellow-500{else}bg-neon-green border border-neon-green hover:bg-neon-green/80 focus:ring-neon-green{/if} rounded-lg focus:outline-none focus:ring-2 transition-colors duration-200" 
                            onclick="confirmAction('{$confirmId}', '{$action}', '{$target}')">
                        {$confirmText|default:$LANG.confirm}
                    </button>
                </div>
            </div>
            
        </div>
    </div>
</div>

{* JavaScript for confirmation functionality *}
<script>
function showConfirmation(modalId, message, action, target) {
    if (message) {
        document.querySelector('#' + modalId + ' .text-gray-300').innerHTML = message;
    }
    if (action) {
        document.querySelector('#' + modalId + ' button[onclick*="confirmAction"]').setAttribute('onclick', 'confirmAction("' + modalId + '", "' + action + '", "' + target + '")');
    }
    document.getElementById(modalId).classList.remove('hidden');
    document.body.classList.add('overflow-hidden');
}

function closeConfirmation(modalId) {
    document.getElementById(modalId).classList.add('hidden');
    document.body.classList.remove('overflow-hidden');
}

function confirmAction(modalId, action, target) {
    closeConfirmation(modalId);
    
    if (action && typeof window[action] === 'function') {
        window[action](target);
    } else if (target) {
        if (target.startsWith('#')) {
            const element = document.querySelector(target);
            if (element) {
                if (action === 'delete' || action === 'remove') {
                    element.remove();
                } else if (action === 'submit' && element.tagName === 'FORM') {
                    element.submit();
                }
            }
        } else if (target.startsWith('http') || target.includes('.php')) {
            window.location.href = target;
        }
    }
}
</script>