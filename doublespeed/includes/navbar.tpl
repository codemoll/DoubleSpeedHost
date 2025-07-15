{* Navigation Bar Component *}
{* Usage: {include file="$template/includes/navbar.tpl" position="top" transparent="false" fixed="true"} *}

{assign var="navPosition" value=$position|default:"top"}
{assign var="isTransparent" value=$transparent|default:false}
{assign var="isFixed" value=$fixed|default:true}

<nav class="bg-dark-bg-alt border-b border-gray-800 {if $isFixed}fixed w-full z-50{/if} {if $navPosition == 'top'}top-0{elseif $navPosition == 'bottom'}bottom-0{/if} {if $isTransparent}bg-opacity-90 backdrop-blur-sm{/if}">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-16">
            
            {* Logo/Brand *}
            <div class="flex items-center">
                <a href="{$WEB_ROOT}/index.php" class="flex items-center space-x-3 hover:opacity-80 transition-opacity duration-200">
                    {if isset($templatefile) && is_array($templatefile) && $templatefile.logourl}
                        <img src="{$templatefile.logourl}" alt="{$companyname}" class="h-8 w-auto">
                    {else}
                        <div class="w-8 h-8 bg-gradient-to-br from-neon-green to-electric-blue rounded glow-sm"></div>
                    {/if}
                    <span class="font-orbitron font-bold text-xl text-white glow-text hidden sm:block">{$companyname}</span>
                </a>
            </div>
            
            {* Desktop Navigation Links *}
            <div class="hidden md:block">
                <div class="ml-10 flex items-baseline space-x-4">
                    {if !$loggedin}
                        <a href="{$WEB_ROOT}/index.php" class="nav-link {if $filename == 'index'}nav-link-active{/if}">
                            <i class="fas fa-home mr-1"></i> Home
                        </a>
                        <a href="{$WEB_ROOT}/domainchecker.php" class="nav-link {if $filename == 'domainchecker'}nav-link-active{/if}">
                            <i class="fas fa-search mr-1"></i> Domains
                        </a>
                        <a href="{$WEB_ROOT}/cart.php" class="nav-link {if $filename == 'products' || $filename == 'cart'}nav-link-active{/if}">
                            <i class="fas fa-server mr-1"></i> Hosting
                        </a>
                        <a href="{$WEB_ROOT}/knowledgebase.php" class="nav-link {if $filename == 'knowledgebase'}nav-link-active{/if}">
                            <i class="fas fa-book mr-1"></i> Knowledge Base
                        </a>
                        <a href="{$WEB_ROOT}/submitticket.php" class="nav-link {if $filename == 'submitticket'}nav-link-active{/if}">
                            <i class="fas fa-life-ring mr-1"></i> Support
                        </a>
                    {else}
                        <a href="{$WEB_ROOT}/clientarea.php" class="nav-link {if $filename == 'clientareahome'}nav-link-active{/if}">
                            <i class="fas fa-tachometer-alt mr-1"></i> Dashboard
                        </a>
                        <a href="{$WEB_ROOT}/clientarea.php?action=products" class="nav-link {if $filename == 'clientareaproducts'}nav-link-active{/if}">
                            <i class="fas fa-server mr-1"></i> My Services
                        </a>
                        <a href="{$WEB_ROOT}/clientarea.php?action=domains" class="nav-link {if $filename == 'clientareadomains'}nav-link-active{/if}">
                            <i class="fas fa-globe mr-1"></i> My Domains
                        </a>
                        <a href="{$WEB_ROOT}/clientarea.php?action=invoices" class="nav-link {if $filename == 'clientareainvoices'}nav-link-active{/if}">
                            <i class="fas fa-file-invoice-dollar mr-1"></i> Invoices
                        </a>
                        <a href="{$WEB_ROOT}/supporttickets.php" class="nav-link {if $filename == 'supporttickets'}nav-link-active{/if}">
                            <i class="fas fa-ticket-alt mr-1"></i> Support
                        </a>
                    {/if}
                </div>
            </div>
            
            {* User Menu / Auth Buttons *}
            <div class="flex items-center space-x-4">
                {if $loggedin}
                    {* User Dropdown *}
                    <div class="relative">
                        <button type="button" class="flex items-center space-x-2 text-gray-300 hover:text-white focus:outline-none focus:text-white transition-colors duration-200" onclick="toggleDropdown('userDropdown')">
                            <div class="w-8 h-8 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center text-dark-bg font-bold text-sm">
                                {if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.firstname)}
                                    {$clientsdetails.firstname|substr:0:1}{if isset($clientsdetails.lastname)}{$clientsdetails.lastname|substr:0:1}{/if}
                                {else}
                                    U
                                {/if}
                            </div>
                            <span class="hidden sm:block">
                                {if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.firstname)}
                                    {$clientsdetails.firstname}
                                {else}
                                    Account
                                {/if}
                            </span>
                            <i class="fas fa-chevron-down text-xs"></i>
                        </button>
                        
                        {* Dropdown Menu *}
                        <div id="userDropdown" class="absolute right-0 mt-2 w-48 bg-dark-surface border border-gray-700 rounded-lg shadow-lg hidden z-50">
                            <div class="py-1">
                                <a href="{$WEB_ROOT}/clientarea.php?action=details" class="dropdown-link">
                                    <i class="fas fa-user mr-2"></i> My Account
                                </a>
                                <a href="{$WEB_ROOT}/clientarea.php?action=security" class="dropdown-link">
                                    <i class="fas fa-shield-alt mr-2"></i> Security
                                </a>
                                <div class="border-t border-gray-700 my-1"></div>
                                <a href="{$WEB_ROOT}/logout.php" class="dropdown-link text-red-400 hover:bg-red-900/20">
                                    <i class="fas fa-sign-out-alt mr-2"></i> Logout
                                </a>
                            </div>
                        </div>
                    </div>
                {else}
                    {* Login/Register Buttons *}
                    <a href="{$WEB_ROOT}/login.php" class="btn-secondary text-sm">
                        <i class="fas fa-sign-in-alt mr-1"></i> Login
                    </a>
                    <a href="{$WEB_ROOT}/register.php" class="btn-primary text-sm">
                        <i class="fas fa-user-plus mr-1"></i> Register
                    </a>
                {/if}
                
                {* Mobile menu button *}
                <button type="button" class="md:hidden text-gray-300 hover:text-white focus:outline-none focus:text-white" onclick="toggleMobileMenu()">
                    <i class="fas fa-bars text-lg"></i>
                </button>
            </div>
        </div>
        
        {* Mobile Navigation Menu *}
        <div id="mobileMenu" class="md:hidden hidden">
            <div class="px-2 pt-2 pb-3 space-y-1 border-t border-gray-700">
                {if !$loggedin}
                    <a href="{$WEB_ROOT}/index.php" class="mobile-nav-link {if $filename == 'index'}mobile-nav-link-active{/if}">
                        <i class="fas fa-home mr-2"></i> Home
                    </a>
                    <a href="{$WEB_ROOT}/domainchecker.php" class="mobile-nav-link {if $filename == 'domainchecker'}mobile-nav-link-active{/if}">
                        <i class="fas fa-search mr-2"></i> Domains
                    </a>
                    <a href="{$WEB_ROOT}/cart.php" class="mobile-nav-link {if $filename == 'products' || $filename == 'cart'}mobile-nav-link-active{/if}">
                        <i class="fas fa-server mr-2"></i> Hosting
                    </a>
                    <a href="{$WEB_ROOT}/knowledgebase.php" class="mobile-nav-link {if $filename == 'knowledgebase'}mobile-nav-link-active{/if}">
                        <i class="fas fa-book mr-2"></i> Knowledge Base
                    </a>
                    <a href="{$WEB_ROOT}/submitticket.php" class="mobile-nav-link {if $filename == 'submitticket'}mobile-nav-link-active{/if}">
                        <i class="fas fa-life-ring mr-2"></i> Support
                    </a>
                {else}
                    <a href="{$WEB_ROOT}/clientarea.php" class="mobile-nav-link {if $filename == 'clientareahome'}mobile-nav-link-active{/if}">
                        <i class="fas fa-tachometer-alt mr-2"></i> Dashboard
                    </a>
                    <a href="{$WEB_ROOT}/clientarea.php?action=products" class="mobile-nav-link {if $filename == 'clientareaproducts'}mobile-nav-link-active{/if}">
                        <i class="fas fa-server mr-2"></i> My Services
                    </a>
                    <a href="{$WEB_ROOT}/clientarea.php?action=domains" class="mobile-nav-link {if $filename == 'clientareadomains'}mobile-nav-link-active{/if}">
                        <i class="fas fa-globe mr-2"></i> My Domains
                    </a>
                    <a href="{$WEB_ROOT}/clientarea.php?action=invoices" class="mobile-nav-link {if $filename == 'clientareainvoices'}mobile-nav-link-active{/if}">
                        <i class="fas fa-file-invoice-dollar mr-2"></i> Invoices
                    </a>
                    <a href="{$WEB_ROOT}/supporttickets.php" class="mobile-nav-link {if $filename == 'supporttickets'}mobile-nav-link-active{/if}">
                        <i class="fas fa-ticket-alt mr-2"></i> Support
                    </a>
                {/if}
            </div>
        </div>
    </div>
</nav>

{* JavaScript for navbar functionality *}
<script>
function toggleDropdown(dropdownId) {
    const dropdown = document.getElementById(dropdownId);
    dropdown.classList.toggle('hidden');
    
    // Close dropdown when clicking outside
    document.addEventListener('click', function(event) {
        if (!event.target.closest(`#${dropdownId}`) && !event.target.closest('button')) {
            dropdown.classList.add('hidden');
        }
    });
}

function toggleMobileMenu() {
    const mobileMenu = document.getElementById('mobileMenu');
    mobileMenu.classList.toggle('hidden');
}

// Close mobile menu when clicking outside
document.addEventListener('click', function(event) {
    const mobileMenu = document.getElementById('mobileMenu');
    const menuButton = event.target.closest('[onclick="toggleMobileMenu()"]');
    
    if (!menuButton && !mobileMenu.contains(event.target)) {
        mobileMenu.classList.add('hidden');
    }
});
</script>