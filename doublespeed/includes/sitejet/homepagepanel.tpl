{* SiteJet Homepage Panel Component *}
{* Usage: {include file="$template/includes/sitejet/homepagepanel.tpl" title="Panel Title" content="Content" icon="fas fa-icon"} *}

{assign var="panelId" value=$id|default:"homepage-panel"}
{assign var="panelClass" value=$class|default:""}

<div class="bg-dark-surface border border-gray-700 rounded-lg overflow-hidden shadow-lg hover:shadow-xl transition-all duration-300 {$panelClass}">
    
    {* Panel Header *}
    {if $title}
        <div class="px-6 py-4 border-b border-gray-700 bg-gradient-to-r from-neon-green/10 to-transparent">
            <div class="flex items-center">
                {if $icon}
                    <div class="flex-shrink-0">
                        <i class="{$icon} text-neon-green text-xl mr-3"></i>
                    </div>
                {/if}
                <h3 class="text-lg font-semibold text-white font-orbitron">
                    {$title}
                </h3>
                {if $badge}
                    <span class="ml-2 px-2 py-1 text-xs font-medium bg-neon-green/20 text-neon-green rounded-full border border-neon-green/30">
                        {$badge}
                    </span>
                {/if}
            </div>
        </div>
    {/if}
    
    {* Panel Body *}
    <div class="px-6 py-4">
        {if $content}
            <div class="text-gray-300">
                {$content}
            </div>
        {/if}
        
        {if $description}
            <p class="text-gray-400 text-sm mt-2">
                {$description}
            </p>
        {/if}
        
        {* SiteJet specific features *}
        {if $features}
            <div class="mt-4 space-y-2">
                {foreach from=$features item=feature}
                    <div class="flex items-center">
                        <i class="fas fa-check text-neon-green text-sm mr-2"></i>
                        <span class="text-gray-300 text-sm">{$feature}</span>
                    </div>
                {/foreach}
            </div>
        {/if}
        
        {* Statistics or metrics *}
        {if $stats}
            <div class="mt-4 grid grid-cols-2 gap-4">
                {foreach from=$stats item=stat}
                    <div class="text-center">
                        <div class="text-2xl font-bold text-neon-green font-orbitron">
                            {$stat.value}
                        </div>
                        <div class="text-xs text-gray-400 uppercase tracking-wide">
                            {$stat.label}
                        </div>
                    </div>
                {/foreach}
            </div>
        {/if}
    </div>
    
    {* Panel Footer with Actions *}
    {if $actions || $footerContent}
        <div class="px-6 py-4 border-t border-gray-700 bg-gray-900/30">
            <div class="flex items-center justify-between">
                {if $footerContent}
                    <div class="text-sm text-gray-400">
                        {$footerContent}
                    </div>
                {/if}
                {if $actions}
                    <div class="flex space-x-2 {if !$footerContent}w-full justify-end{/if}">
                        {$actions}
                    </div>
                {/if}
            </div>
        </div>
    {/if}
    
</div>