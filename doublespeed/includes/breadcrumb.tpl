{* Breadcrumb Navigation Component *}
{* Usage: {include file="$template/includes/breadcrumb.tpl" items=$breadcrumbs showHome=true} *}

{if $items || $breadcrumbs}
    {assign var="breadcrumbItems" value=$items|default:$breadcrumbs}
    {assign var="showHomeLink" value=$showHome|default:true}
    
    <nav class="flex mb-6" aria-label="Breadcrumb">
        <ol class="inline-flex items-center space-x-1 md:space-x-3">
            
            {* Home Link *}
            {if $showHomeLink}
                <li class="inline-flex items-center">
                    <a href="{$WEB_ROOT}/index.php" class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-neon-green transition-colors duration-200">
                        <i class="fas fa-home mr-2"></i>
                        Home
                    </a>
                </li>
                
                {if $breadcrumbItems}
                    <li>
                        <div class="flex items-center">
                            <i class="fas fa-chevron-right text-gray-600 mx-2"></i>
                        </div>
                    </li>
                {/if}
            {/if}
            
            {* Dynamic Breadcrumb Items *}
            {if $breadcrumbItems}
                {foreach from=$breadcrumbItems item=item name=breadcrumb}
                    <li class="inline-flex items-center">
                        {if $item.url && !$smarty.foreach.breadcrumb.last}
                            <a href="{$item.url}" class="inline-flex items-center text-sm font-medium text-gray-400 hover:text-neon-green transition-colors duration-200">
                                {if $item.icon}<i class="{$item.icon} mr-2"></i>{/if}
                                {$item.title|default:$item.name|default:$item}
                            </a>
                        {else}
                            <span class="inline-flex items-center text-sm font-medium text-gray-300">
                                {if $item.icon}<i class="{$item.icon} mr-2"></i>{/if}
                                {$item.title|default:$item.name|default:$item}
                            </span>
                        {/if}
                    </li>
                    
                    {if !$smarty.foreach.breadcrumb.last}
                        <li>
                            <div class="flex items-center">
                                <i class="fas fa-chevron-right text-gray-600 mx-2"></i>
                            </div>
                        </li>
                    {/if}
                {/foreach}
            {/if}
            
            {* Simple Text-based Breadcrumbs (fallback) *}
            {if $pagetitle && !$breadcrumbItems}
                <li class="inline-flex items-center">
                    <span class="inline-flex items-center text-sm font-medium text-gray-300">
                        {if $pageicon}<i class="{$pageicon} mr-2"></i>{/if}
                        {$pagetitle}
                    </span>
                </li>
            {/if}
            
        </ol>
    </nav>
{/if}

{* Alternative usage with manual items *}
{* Example breadcrumb data structure:
   {assign var="breadcrumbs" value=[
       {title="Dashboard", url="{$WEB_ROOT}/clientarea.php", icon="fas fa-tachometer-alt"},
       {title="My Services", url="{$WEB_ROOT}/clientarea.php?action=products", icon="fas fa-server"},
       {title="Service Details", icon="fas fa-info-circle"}
   ]}
   {include file="$template/includes/breadcrumb.tpl" items=$breadcrumbs}
*}