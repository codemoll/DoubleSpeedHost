{* Subheader Component *}
{* Usage: {include file="$template/includes/subheader.tpl" title="Page Title" subtitle="Page Description" breadcrumbs=$breadcrumbs} *}

{assign var="showBreadcrumbs" value=$showBreadcrumbs|default:true}
{assign var="showActions" value=$showActions|default:true}

<div class="subheader bg-dark-bg-alt border-b border-gray-800 {$class|default:''}">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="py-6">
            
            {* Breadcrumbs *}
            {if $showBreadcrumbs && ($breadcrumbs || $pagetitle)}
                <nav class="flex mb-4" aria-label="Breadcrumb">
                    <ol class="inline-flex items-center space-x-1 md:space-x-3">
                        <li class="inline-flex items-center">
                            <a href="{$WEB_ROOT}/index.php" class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-neon-green transition-colors duration-200">
                                <i class="fas fa-home mr-2"></i>
                                {$LANG.globalhome|default:"Home"}
                            </a>
                        </li>
                        
                        {if $loggedin}
                            <li>
                                <div class="flex items-center">
                                    <i class="fas fa-chevron-right text-gray-600 mx-2"></i>
                                    <a href="{$WEB_ROOT}/clientarea.php" class="text-sm font-medium text-gray-400 hover:text-neon-green transition-colors duration-200">
                                        {$LANG.clientarea}
                                    </a>
                                </div>
                            </li>
                        {/if}
                        
                        {if $breadcrumbs}
                            {foreach from=$breadcrumbs item=crumb}
                                <li>
                                    <div class="flex items-center">
                                        <i class="fas fa-chevron-right text-gray-600 mx-2"></i>
                                        {if $crumb.url}
                                            <a href="{$crumb.url}" class="text-sm font-medium text-gray-400 hover:text-neon-green transition-colors duration-200">
                                                {$crumb.title}
                                            </a>
                                        {else}
                                            <span class="text-sm font-medium text-gray-300">
                                                {$crumb.title}
                                            </span>
                                        {/if}
                                    </div>
                                </li>
                            {/foreach}
                        {else}
                            {if $pagetitle}
                                <li>
                                    <div class="flex items-center">
                                        <i class="fas fa-chevron-right text-gray-600 mx-2"></i>
                                        <span class="text-sm font-medium text-gray-300">
                                            {$pagetitle}
                                        </span>
                                    </div>
                                </li>
                            {/if}
                        {/if}
                    </ol>
                </nav>
            {/if}
            
            {* Page Header *}
            <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between">
                <div class="flex-1 min-w-0">
                    <div class="flex items-center">
                        {if $icon}
                            <div class="flex-shrink-0 mr-4">
                                <div class="w-12 h-12 bg-gradient-to-br from-neon-green to-electric-blue rounded-lg flex items-center justify-center">
                                    <i class="{$icon} text-white text-xl"></i>
                                </div>
                            </div>
                        {/if}
                        
                        <div>
                            <h1 class="text-2xl font-bold text-white font-orbitron">
                                {$title|default:$pagetitle|default:"Page Title"}
                                {if $badge}
                                    <span class="ml-2 px-3 py-1 text-sm font-medium bg-neon-green/20 text-neon-green border border-neon-green/30 rounded-full">
                                        {$badge}
                                    </span>
                                {/if}
                            </h1>
                            
                            {if $subtitle || $description}
                                <p class="mt-1 text-sm text-gray-400">
                                    {$subtitle|default:$description}
                                </p>
                            {/if}
                            
                            {if $meta}
                                <div class="mt-2 flex items-center space-x-4 text-xs text-gray-500">
                                    {$meta}
                                </div>
                            {/if}
                        </div>
                    </div>
                </div>
                
                {* Actions *}
                {if $showActions && ($actions || $primaryAction)}
                    <div class="mt-4 sm:mt-0 sm:ml-4 flex-shrink-0">
                        <div class="flex items-center space-x-3">
                            {if $actions}
                                {$actions}
                            {/if}
                            
                            {if $primaryAction}
                                <a href="{$primaryAction.url}" 
                                   class="inline-flex items-center px-4 py-2 bg-neon-green text-black font-medium rounded-lg hover:bg-neon-green/80 focus:outline-none focus:ring-2 focus:ring-neon-green/50 transition-all duration-200">
                                    {if $primaryAction.icon}
                                        <i class="{$primaryAction.icon} mr-2"></i>
                                    {/if}
                                    {$primaryAction.text}
                                </a>
                            {/if}
                        </div>
                    </div>
                {/if}
            </div>
            
            {* Secondary Content *}
            {if $secondaryContent}
                <div class="mt-4">
                    {$secondaryContent}
                </div>
            {/if}
            
            {* Tabs Navigation *}
            {if $tabs}
                <div class="mt-6">
                    <div class="border-b border-gray-700">
                        <nav class="flex space-x-8" aria-label="Tabs">
                            {foreach from=$tabs item=tab}
                                <a href="{$tab.url|default:'#'}" 
                                   class="whitespace-nowrap py-2 px-1 border-b-2 font-medium text-sm transition-colors duration-200 {if $tab.active}border-neon-green text-neon-green{else}border-transparent text-gray-400 hover:text-gray-300 hover:border-gray-300{/if}">
                                    {if $tab.icon}
                                        <i class="{$tab.icon} mr-2"></i>
                                    {/if}
                                    {$tab.title}
                                    {if $tab.count}
                                        <span class="ml-2 px-2 py-0.5 text-xs bg-gray-700 text-gray-300 rounded-full">
                                            {$tab.count}
                                        </span>
                                    {/if}
                                </a>
                            {/foreach}
                        </nav>
                    </div>
                </div>
            {/if}
            
        </div>
    </div>
</div>

{* Quick Stats (if provided) *}
{if $stats}
    <div class="bg-dark-surface border-b border-gray-700">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
            <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                {foreach from=$stats item=stat}
                    <div class="text-center">
                        <div class="text-2xl font-bold text-neon-green font-orbitron">
                            {$stat.value}
                        </div>
                        <div class="text-xs text-gray-400 uppercase tracking-wide">
                            {$stat.label}
                        </div>
                        {if $stat.change}
                            <div class="text-xs {if $stat.change > 0}text-green-400{elseif $stat.change < 0}text-red-400{else}text-gray-400{/if}">
                                {if $stat.change > 0}+{/if}{$stat.change}%
                            </div>
                        {/if}
                    </div>
                {/foreach}
            </div>
        </div>
    </div>
{/if}