{* Page Header Component *}
{* Usage: {include file="$template/includes/pageheader.tpl" title="Page Title" subtitle="Page subtitle" icon="fas fa-icon"} *}

{assign var="headerTitle" value=$title|default:$pagetitle}
{assign var="headerSubtitle" value=$subtitle|default:$pagesubtitle}
{assign var="headerIcon" value=$icon|default:$pageicon}

{if $headerTitle || $headerSubtitle || $actions || $breadcrumbs}
    <div class="bg-gradient-to-r from-dark-bg-alt to-dark-bg border-b border-gray-800 -mx-4 sm:-mx-6 lg:-mx-8 px-4 sm:px-6 lg:px-8 py-6 mb-6">
        <div class="max-w-7xl mx-auto">
            
            {* Breadcrumbs *}
            {if $breadcrumbs && $showBreadcrumbs != false}
                <div class="mb-4">
                    {include file="$template/includes/breadcrumb.tpl" items=$breadcrumbs}
                </div>
            {/if}
            
            <div class="md:flex md:items-center md:justify-between">
                <div class="flex-1 min-w-0">
                    {* Page Title *}
                    {if $headerTitle}
                        <h1 class="text-2xl font-bold text-white sm:text-3xl sm:truncate">
                            {if $headerIcon}
                                <i class="{$headerIcon} text-neon-green mr-3"></i>
                            {/if}
                            {$headerTitle}
                        </h1>
                    {/if}
                    
                    {* Page Subtitle/Description *}
                    {if $headerSubtitle}
                        <p class="mt-2 text-sm text-gray-400 sm:text-base max-w-2xl">
                            {$headerSubtitle}
                        </p>
                    {/if}
                    
                    {* Additional Info *}
                    {if $info}
                        <div class="mt-3 flex flex-wrap items-center text-sm text-gray-500 space-x-4">
                            {$info}
                        </div>
                    {/if}
                </div>
                
                {* Actions/Buttons *}
                {if $actions}
                    <div class="mt-4 flex md:mt-0 md:ml-4 space-x-3">
                        {$actions}
                    </div>
                {/if}
            </div>
            
            {* Tabs/Navigation *}
            {if $tabs}
                <div class="mt-6">
                    <div class="border-b border-gray-700">
                        <nav class="-mb-px flex space-x-8" aria-label="Tabs">
                            {foreach from=$tabs item=tab}
                                <a href="{$tab.url|default:'#'}" 
                                   class="whitespace-nowrap py-2 px-1 border-b-2 font-medium text-sm {if $tab.active}border-neon-green text-neon-green{else}border-transparent text-gray-400 hover:text-gray-300 hover:border-gray-300{/if} transition-colors duration-200">
                                    {if $tab.icon}<i class="{$tab.icon} mr-2"></i>{/if}
                                    {$tab.title|default:$tab.name}
                                    {if $tab.count}
                                        <span class="ml-2 px-2 py-0.5 text-xs rounded-full {if $tab.active}bg-neon-green/20 text-neon-green{else}bg-gray-700 text-gray-400{/if}">
                                            {$tab.count}
                                        </span>
                                    {/if}
                                </a>
                            {/foreach}
                        </nav>
                    </div>
                </div>
            {/if}
            
            {* Status/Alerts *}
            {if $status}
                <div class="mt-4">
                    {include file="$template/includes/alert.tpl" type=$status.type message=$status.message title=$status.title}
                </div>
            {/if}
            
        </div>
    </div>
{/if}

{* Example usage with tabs:
   {assign var="tabs" value=[
       {title="Overview", url="{$WEB_ROOT}/clientarea.php", icon="fas fa-tachometer-alt", active=true},
       {title="Services", url="{$WEB_ROOT}/clientarea.php?action=products", icon="fas fa-server", count=5},
       {title="Invoices", url="{$WEB_ROOT}/clientarea.php?action=invoices", icon="fas fa-file-invoice", count=2}
   ]}
   {assign var="actions" value='<a href="#" class="btn-primary"><i class="fas fa-plus mr-1"></i> Add New</a>'}
   {include file="$template/includes/pageheader.tpl" title="My Dashboard" subtitle="Manage your services and account" icon="fas fa-tachometer-alt" tabs=$tabs actions=$actions}
*}