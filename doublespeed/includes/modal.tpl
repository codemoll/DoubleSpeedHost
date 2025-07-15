{* Modal Dialog Component *}
{* Usage: {include file="$template/includes/modal.tpl" id="modalId" title="Modal Title" size="default" type="default"} *}

{assign var="modalId" value=$id|default:"modal"}
{assign var="modalSize" value=$size|default:"default"}
{assign var="modalType" value=$type|default:"default"}

{* Modal Backdrop *}
<div id="{$modalId}" class="fixed inset-0 z-50 overflow-y-auto hidden" aria-labelledby="{$modalId}-title" role="dialog" aria-modal="true">
    <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
        
        {* Background overlay *}
        <div class="fixed inset-0 bg-black bg-opacity-75 transition-opacity" aria-hidden="true" onclick="closeModal('{$modalId}')"></div>
        
        {* Center modal *}
        <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>
        
        {* Modal panel *}
        <div class="inline-block align-bottom bg-dark-surface rounded-lg border border-gray-700 text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle {if $modalSize == 'small'}sm:max-w-sm{elseif $modalSize == 'large'}sm:max-w-4xl{elseif $modalSize == 'xl'}sm:max-w-6xl{else}sm:max-w-lg{/if} sm:w-full">
            
            {* Modal Header *}
            {if $title || $showCloseButton != false}
                <div class="px-6 py-4 border-b border-gray-700 {if $modalType == 'primary'}bg-gradient-to-r from-neon-green/10 to-transparent{elseif $modalType == 'secondary'}bg-gradient-to-r from-electric-blue/10 to-transparent{elseif $modalType == 'success'}bg-gradient-to-r from-green-500/10 to-transparent{elseif $modalType == 'warning'}bg-gradient-to-r from-yellow-500/10 to-transparent{elseif $modalType == 'danger'}bg-gradient-to-r from-red-500/10 to-transparent{else}bg-gray-900/50{/if}">
                    <div class="flex items-center justify-between">
                        {if $title}
                            <h3 class="text-lg font-semibold {if $modalType == 'primary'}text-neon-green{elseif $modalType == 'secondary'}text-electric-blue{elseif $modalType == 'success'}text-green-400{elseif $modalType == 'warning'}text-yellow-400{elseif $modalType == 'danger'}text-red-400{else}text-white{/if}" id="{$modalId}-title">
                                {if $icon}<i class="{$icon} mr-2"></i>{/if}
                                {$title}
                            </h3>
                        {/if}
                        {if $showCloseButton != false}
                            <button type="button" class="text-gray-400 hover:text-white focus:outline-none focus:text-white transition-colors duration-200" onclick="closeModal('{$modalId}')">
                                <i class="fas fa-times text-lg"></i>
                            </button>
                        {/if}
                    </div>
                </div>
            {/if}
            
            {* Modal Body *}
            <div class="px-6 py-4">
                {if $content}
                    {$content}
                {else}
                    <div class="text-gray-300">
                        {if $message}{$message}{else}Modal content goes here{/if}
                    </div>
                {/if}
            </div>
            
            {* Modal Footer *}
            {if $footerContent || $buttons}
                <div class="px-6 py-4 border-t border-gray-700 bg-gray-900/30">
                    <div class="flex items-center justify-end space-x-3">
                        {if $footerContent}
                            <div class="text-sm text-gray-400 mr-auto">
                                {$footerContent}
                            </div>
                        {/if}
                        {if $buttons}
                            {$buttons}
                        {else}
                            <button type="button" class="px-4 py-2 text-sm font-medium text-gray-300 bg-gray-700 border border-gray-600 rounded-lg hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-gray-500 transition-colors duration-200" onclick="closeModal('{$modalId}')">
                                Close
                            </button>
                        {/if}
                    </div>
                </div>
            {/if}
            
        </div>
    </div>
</div>

{* JavaScript for modal functionality *}
<script>
function showModal(modalId) {
    document.getElementById(modalId).classList.remove('hidden');
    document.body.classList.add('overflow-hidden');
}

function closeModal(modalId) {
    document.getElementById(modalId).classList.add('hidden');
    document.body.classList.remove('overflow-hidden');
}

// Close modal on Escape key
document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
        const modals = document.querySelectorAll('[id$="modal"]:not(.hidden)');
        modals.forEach(modal => {
            closeModal(modal.id);
        });
    }
});
</script>