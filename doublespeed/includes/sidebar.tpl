{* Sidebar Component *}
{* Usage: {include file="$template/includes/sidebar.tpl" items=$sidebarItems position="left"} *}

{assign var="sidebarPosition" value=$position|default:"left"}
{assign var="sidebarClass" value=$class|default:""}
{assign var="sidebarId" value=$id|default:"sidebar"}

<aside id="{$sidebarId}" class="sidebar bg-dark-surface border-r border-gray-700 flex-shrink-0 {$sidebarClass} {if $sidebarPosition == 'right'}border-r-0 border-l border-gray-700{/if}">
    
    {* Sidebar Header *}
    {if $title || $headerContent}
        <div class="sidebar-header px-4 py-3 border-b border-gray-700 bg-gradient-to-r from-neon-green/10 to-transparent">
            {if $title}
                <h3 class="text-lg font-semibold text-neon-green font-orbitron">
                    {if $icon}<i class="{$icon} mr-2"></i>{/if}
                    {$title}
                </h3>
            {/if}
            {if $headerContent}
                <div class="mt-2 text-sm text-gray-400">
                    {$headerContent}
                </div>
            {/if}
        </div>
    {/if}
    
    {* Sidebar Navigation *}
    <nav class="sidebar-nav p-4 space-y-1 overflow-y-auto flex-1">
        
        {if $items}
            {foreach from=$items item=item}
                {if $item.type == 'header'}
                    <div class="sidebar-header-item px-3 py-2 text-xs font-semibold text-gray-400 uppercase tracking-wider">
                        {$item.title}
                    </div>
                {elseif $item.type == 'divider'}
                    <hr class="my-3 border-gray-700">
                {else}
                    <a href="{$item.url|default:'#'}" 
                       class="sidebar-item flex items-center px-3 py-2 text-sm font-medium rounded-lg transition-all duration-200 {if $item.active}bg-neon-green/20 text-neon-green border-l-2 border-neon-green{else}text-gray-300 hover:text-white hover:bg-gray-800{/if}">
                        {if $item.icon}
                            <i class="{$item.icon} mr-3 text-base {if $item.active}text-neon-green{else}text-gray-400{/if}"></i>
                        {/if}
                        <span class="flex-1">{$item.title}</span>
                        {if $item.badge}
                            <span class="ml-2 px-2 py-0.5 text-xs font-medium {if $item.active}bg-neon-green text-black{else}bg-gray-700 text-gray-300{/if} rounded-full">
                                {$item.badge}
                            </span>
                        {/if}
                        {if $item.arrow}
                            <i class="fas fa-chevron-right ml-2 text-xs {if $item.active}text-neon-green{else}text-gray-400{/if}"></i>
                        {/if}
                    </a>
                    
                    {* Submenu *}
                    {if $item.children && $item.active}
                        <div class="ml-6 mt-1 space-y-1">
                            {foreach from=$item.children item=child}
                                <a href="{$child.url|default:'#'}" 
                                   class="flex items-center px-3 py-1 text-xs font-medium rounded-lg transition-colors duration-200 {if $child.active}text-neon-green{else}text-gray-400 hover:text-white{/if}">
                                    {if $child.icon}
                                        <i class="{$child.icon} mr-2"></i>
                                    {/if}
                                    {$child.title}
                                </a>
                            {/foreach}
                        </div>
                    {/if}
                {/if}
            {/foreach}
        {else}
            {* Default sidebar items for WHMCS *}
            <a href="{$WEB_ROOT}/clientarea.php" 
               class="sidebar-item flex items-center px-3 py-2 text-sm font-medium rounded-lg transition-all duration-200 {if $filename == 'clientareahome'}bg-neon-green/20 text-neon-green border-l-2 border-neon-green{else}text-gray-300 hover:text-white hover:bg-gray-800{/if}">
                <i class="fas fa-tachometer-alt mr-3 text-base {if $filename == 'clientareahome'}text-neon-green{else}text-gray-400{/if}"></i>
                <span>{$LANG.clientareadashboard}</span>
            </a>
            
            <a href="{$WEB_ROOT}/clientarea.php?action=products" 
               class="sidebar-item flex items-center px-3 py-2 text-sm font-medium rounded-lg transition-all duration-200 {if $filename == 'clientareaproducts'}bg-neon-green/20 text-neon-green border-l-2 border-neon-green{else}text-gray-300 hover:text-white hover:bg-gray-800{/if}">
                <i class="fas fa-server mr-3 text-base {if $filename == 'clientareaproducts'}text-neon-green{else}text-gray-400{/if}"></i>
                <span>{$LANG.clientareanavservices}</span>
                {if $myproductscount > 0}
                    <span class="ml-2 px-2 py-0.5 text-xs font-medium bg-gray-700 text-gray-300 rounded-full">
                        {$myproductscount}
                    </span>
                {/if}
            </a>
            
            <a href="{$WEB_ROOT}/clientarea.php?action=domains" 
               class="sidebar-item flex items-center px-3 py-2 text-sm font-medium rounded-lg transition-all duration-200 {if $filename == 'clientareadomains'}bg-neon-green/20 text-neon-green border-l-2 border-neon-green{else}text-gray-300 hover:text-white hover:bg-gray-800{/if}">
                <i class="fas fa-globe mr-3 text-base {if $filename == 'clientareadomains'}text-neon-green{else}text-gray-400{/if}"></i>
                <span>{$LANG.clientareanavdomains}</span>
                {if $domainscount > 0}
                    <span class="ml-2 px-2 py-0.5 text-xs font-medium bg-gray-700 text-gray-300 rounded-full">
                        {$domainscount}
                    </span>
                {/if}
            </a>
            
            <a href="{$WEB_ROOT}/clientarea.php?action=invoices" 
               class="sidebar-item flex items-center px-3 py-2 text-sm font-medium rounded-lg transition-all duration-200 {if $filename == 'clientareainvoices'}bg-neon-green/20 text-neon-green border-l-2 border-neon-green{else}text-gray-300 hover:text-white hover:bg-gray-800{/if}">
                <i class="fas fa-file-invoice-dollar mr-3 text-base {if $filename == 'clientareainvoices'}text-neon-green{else}text-gray-400{/if}"></i>
                <span>{$LANG.clientareanavbilling}</span>
                {if $unpaininvoicescount > 0}
                    <span class="ml-2 px-2 py-0.5 text-xs font-medium bg-red-600 text-white rounded-full">
                        {$unpaininvoicescount}
                    </span>
                {/if}
            </a>
            
            <a href="{$WEB_ROOT}/supporttickets.php" 
               class="sidebar-item flex items-center px-3 py-2 text-sm font-medium rounded-lg transition-all duration-200 {if $filename == 'supporttickets' || $filename == 'supportticketslist' || $filename == 'viewticket'}bg-neon-green/20 text-neon-green border-l-2 border-neon-green{else}text-gray-300 hover:text-white hover:bg-gray-800{/if}">
                <i class="fas fa-life-ring mr-3 text-base {if $filename == 'supporttickets' || $filename == 'supportticketslist' || $filename == 'viewticket'}text-neon-green{else}text-gray-400{/if}"></i>
                <span>{$LANG.clientareanavtickets}</span>
                {if $openticketcount > 0}
                    <span class="ml-2 px-2 py-0.5 text-xs font-medium bg-yellow-600 text-white rounded-full">
                        {$openticketcount}
                    </span>
                {/if}
            </a>
            
            <hr class="my-3 border-gray-700">
            
            <a href="{$WEB_ROOT}/clientarea.php?action=details" 
               class="sidebar-item flex items-center px-3 py-2 text-sm font-medium rounded-lg transition-all duration-200 {if $filename == 'clientareadetails'}bg-neon-green/20 text-neon-green border-l-2 border-neon-green{else}text-gray-300 hover:text-white hover:bg-gray-800{/if}">
                <i class="fas fa-user mr-3 text-base {if $filename == 'clientareadetails'}text-neon-green{else}text-gray-400{/if}"></i>
                <span>{$LANG.clientareanavdetails}</span>
            </a>
            
            <a href="{$WEB_ROOT}/logout.php" 
               class="sidebar-item flex items-center px-3 py-2 text-sm font-medium rounded-lg transition-all duration-200 text-red-400 hover:text-red-300 hover:bg-red-900/20">
                <i class="fas fa-sign-out-alt mr-3 text-base"></i>
                <span>{$LANG.logouttitle}</span>
            </a>
        {/if}
        
    </nav>
    
    {* Sidebar Footer *}
    {if $footerContent}
        <div class="sidebar-footer px-4 py-3 border-t border-gray-700 bg-gray-900/30">
            {$footerContent}
        </div>
    {/if}
    
</aside>

{* Mobile sidebar toggle (if needed) *}
{if $mobileSidebar}
    <script>
    function toggleSidebar() {
        const sidebar = document.getElementById('{$sidebarId}');
        sidebar.classList.toggle('sidebar-mobile-hidden');
    }
    
    // Close sidebar when clicking outside on mobile
    document.addEventListener('click', function(event) {
        const sidebar = document.getElementById('{$sidebarId}');
        const trigger = document.querySelector('[onclick*="toggleSidebar"]');
        
        if (window.innerWidth < 768 && !sidebar.contains(event.target) && !trigger.contains(event.target)) {
            sidebar.classList.add('sidebar-mobile-hidden');
        }
    });
    </script>
{/if}