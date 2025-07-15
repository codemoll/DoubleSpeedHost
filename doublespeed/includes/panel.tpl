{* Panel/Card Component *}
{* Usage: {include file="$template/includes/panel.tpl" title="Panel Title" content="Panel content" type="default" class="additional-classes"} *}

{assign var="panelType" value=$type|default:"default"}
{assign var="panelClass" value=$class|default:""}

<div class="bg-dark-surface border border-gray-700 rounded-lg overflow-hidden shadow-lg hover:shadow-xl transition-all duration-300 {$panelClass} {if $panelType == 'primary'}border-neon-green{elseif $panelType == 'secondary'}border-electric-blue{elseif $panelType == 'success'}border-green-500{elseif $panelType == 'warning'}border-yellow-500{elseif $panelType == 'danger'}border-red-500{/if}">
    
    {* Panel Header *}
    {if $title || $headerContent}
        <div class="px-6 py-4 border-b border-gray-700 {if $panelType == 'primary'}bg-gradient-to-r from-neon-green/10 to-transparent{elseif $panelType == 'secondary'}bg-gradient-to-r from-electric-blue/10 to-transparent{elseif $panelType == 'success'}bg-gradient-to-r from-green-500/10 to-transparent{elseif $panelType == 'warning'}bg-gradient-to-r from-yellow-500/10 to-transparent{elseif $panelType == 'danger'}bg-gradient-to-r from-red-500/10 to-transparent{else}bg-gray-900/50{/if}">
            <div class="flex items-center justify-between">
                {if $title}
                    <h3 class="text-lg font-semibold {if $panelType == 'primary'}text-neon-green{elseif $panelType == 'secondary'}text-electric-blue{elseif $panelType == 'success'}text-green-400{elseif $panelType == 'warning'}text-yellow-400{elseif $panelType == 'danger'}text-red-400{else}text-white{/if}">
                        {if $icon}<i class="{$icon} mr-2"></i>{/if}
                        {$title}
                    </h3>
                {/if}
                {if $headerContent}
                    <div class="text-gray-400">
                        {$headerContent}
                    </div>
                {/if}
            </div>
        </div>
    {/if}
    
    {* Panel Body *}
    <div class="px-6 py-4">
        {if $content}
            {$content}
        {else}
            {* Allow for inline content between include tags *}
            <div class="text-gray-300">
                {if $message}{$message}{else}Panel content goes here{/if}
            </div>
        {/if}
    </div>
    
    {* Panel Footer *}
    {if $footerContent || $actions}
        <div class="px-6 py-4 border-t border-gray-700 bg-gray-900/30">
            <div class="flex items-center justify-between">
                {if $footerContent}
                    <div class="text-sm text-gray-400">
                        {$footerContent}
                    </div>
                {/if}
                {if $actions}
                    <div class="flex space-x-2">
                        {$actions}
                    </div>
                {/if}
            </div>
        </div>
    {/if}
    
</div>