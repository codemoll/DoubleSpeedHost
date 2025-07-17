{* Navigation Bar Component *}
{* Usage: {include file="$template/includes/navbar.tpl" position="top" transparent="false" fixed="true"} *}

{assign var="navPosition" value=$position|default:"top"}
{assign var="isTransparent" value=$transparent|default:false}
{assign var="isFixed" value=$fixed|default:true}

<nav class="navbar navbar-expand-lg navbar-dark {if $isFixed}fixed-top{/if} {if $navPosition == 'bottom'}fixed-bottom{/if} {if $isTransparent}navbar-transparent{/if}" style="background-color: var(--ds-dark-bg-alt); border-bottom: 1px solid var(--ds-gray-700);">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center w-100">
            
            {* Logo/Brand *}
            <div class="navbar-brand">
                <a href="{$WEB_ROOT}/index.php" class="d-flex align-items-center text-decoration-none" style="transition: opacity 0.2s ease;">
                    {if isset($templatefile) && is_array($templatefile) && $templatefile.logourl}
                        <img src="{$templatefile.logourl}" alt="{$companyname}" class="me-3" style="height: 32px; width: auto;">
                    {else}
                        <div class="me-3 ds-glow" style="width: 32px; height: 32px; background: linear-gradient(135deg, var(--ds-neon-green), var(--ds-electric-blue)); border-radius: 4px;"></div>
                    {/if}
                    <span class="font-orbitron fw-bold text-white d-none d-sm-block" style="font-size: 1.25rem; text-shadow: 0 0 20px rgba(0, 255, 136, 0.3);">{$companyname}</span>
                </a>
            </div>
            
            {* Desktop Navigation Links *}
            <div class="d-none d-md-block">
                <ul class="nav navbar-nav">
                    {if !$loggedin}
                        <li class="nav-item">
                            <a href="{$WEB_ROOT}/index.php" class="nav-link {if $filename == 'index'}active{/if}">
                                <i class="fas fa-home me-1"></i> Home
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{$WEB_ROOT}/domainchecker.php" class="nav-link {if $filename == 'domainchecker'}active{/if}">
                                <i class="fas fa-search me-1"></i> Domains
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{$WEB_ROOT}/cart.php" class="nav-link {if $filename == 'products' || $filename == 'cart'}active{/if}">
                                <i class="fas fa-server me-1"></i> Hosting
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{$WEB_ROOT}/knowledgebase.php" class="nav-link {if $filename == 'knowledgebase'}active{/if}">
                                <i class="fas fa-book me-1"></i> Knowledge Base
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{$WEB_ROOT}/submitticket.php" class="nav-link {if $filename == 'submitticket'}active{/if}">
                                <i class="fas fa-life-ring me-1"></i> Support
                            </a>
                        </li>
                    {else}
                        <li class="nav-item">
                            <a href="{$WEB_ROOT}/clientarea.php" class="nav-link {if $filename == 'clientareahome'}active{/if}">
                                <i class="fas fa-tachometer-alt me-1"></i> Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{$WEB_ROOT}/clientarea.php?action=products" class="nav-link {if $filename == 'clientareaproducts'}active{/if}">
                                <i class="fas fa-server me-1"></i> My Services
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{$WEB_ROOT}/clientarea.php?action=domains" class="nav-link {if $filename == 'clientareadomains'}active{/if}">
                                <i class="fas fa-globe me-1"></i> My Domains
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{$WEB_ROOT}/clientarea.php?action=invoices" class="nav-link {if $filename == 'clientareainvoices'}active{/if}">
                                <i class="fas fa-file-invoice-dollar me-1"></i> Invoices
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{$WEB_ROOT}/supporttickets.php" class="nav-link {if $filename == 'supporttickets'}active{/if}">
                                <i class="fas fa-ticket-alt me-1"></i> Support
                            </a>
                        </li>
                    {/if}
                </ul>
            </div>
            
            {* User Menu / Auth Buttons *}
            <div class="d-flex align-items-center">
                {if $loggedin}
                    {* User Dropdown *}
                    <div class="dropdown">
                        <button type="button" class="btn btn-link dropdown-toggle d-flex align-items-center text-decoration-none" data-bs-toggle="dropdown" aria-expanded="false" style="color: var(--ds-text-light); border: none; background: transparent;">
                            <div class="me-2 d-flex align-items-center justify-content-center text-center fw-bold" style="width: 32px; height: 32px; background: linear-gradient(135deg, var(--ds-neon-green), var(--ds-electric-blue)); border-radius: 50%; color: var(--ds-dark-bg); font-size: 0.875rem;">
                                {if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.firstname)}
                                    {$clientsdetails.firstname|substr:0:1}{if isset($clientsdetails.lastname)}{$clientsdetails.lastname|substr:0:1}{/if}
                                {else}
                                    U
                                {/if}
                            </div>
                            <span class="d-none d-sm-block me-1">
                                {if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.firstname)}
                                    {$clientsdetails.firstname}
                                {else}
                                    Account
                                {/if}
                            </span>
                            <i class="fas fa-chevron-down" style="font-size: 0.75rem;"></i>
                        </button>
                        
                        {* Dropdown Menu *}
                        <ul class="dropdown-menu dropdown-menu-end" style="background-color: var(--ds-dark-surface); border: 1px solid var(--ds-gray-700); border-radius: 8px;">
                            <li>
                                <a href="{$WEB_ROOT}/clientarea.php?action=details" class="dropdown-item" style="color: var(--ds-text-light); padding: 10px 20px;">
                                    <i class="fas fa-user me-2"></i> My Account
                                </a>
                            </li>
                            <li>
                                <a href="{$WEB_ROOT}/clientarea.php?action=security" class="dropdown-item" style="color: var(--ds-text-light); padding: 10px 20px;">
                                    <i class="fas fa-shield-alt me-2"></i> Security
                                </a>
                            </li>
                            <li><hr class="dropdown-divider" style="border-color: var(--ds-gray-700);"></li>
                            <li>
                                <a href="{$WEB_ROOT}/logout.php" class="dropdown-item" style="color: #dc3545; padding: 10px 20px;">
                                    <i class="fas fa-sign-out-alt me-2"></i> Logout
                                </a>
                            </li>
                        </ul>
                    </div>
                    </div>
                {else}
                    {* Login/Register Buttons *}
                    <a href="{$WEB_ROOT}/login.php" class="btn btn-secondary btn-sm me-2">
                        <i class="fas fa-sign-in-alt me-1"></i> Login
                    </a>
                    <a href="{$WEB_ROOT}/register.php" class="btn btn-primary btn-sm">
                        <i class="fas fa-user-plus me-1"></i> Register
                    </a>
                {/if}
                
                {* Mobile menu button *}
                <button type="button" class="btn btn-link d-md-none" onclick="toggleMobileMenu()" style="color: var(--ds-text-light); border: none; background: transparent; padding: 8px;">
                    <i class="fas fa-bars" style="font-size: 1.125rem;"></i>
                </button>
            </div>
        </div>
        
        {* Mobile Navigation Menu *}
        <div id="mobileMenu" class="d-md-none" style="display: none;">
            <div class="container">
                <div style="padding: 10px 0; border-top: 1px solid var(--ds-gray-700);">
                    {if !$loggedin}
                        <a href="{$WEB_ROOT}/index.php" class="nav-link d-block py-2 {if $filename == 'index'}active{/if}">
                            <i class="fas fa-home me-2"></i> Home
                        </a>
                        <a href="{$WEB_ROOT}/domainchecker.php" class="nav-link d-block py-2 {if $filename == 'domainchecker'}active{/if}">
                            <i class="fas fa-search me-2"></i> Domains
                        </a>
                        <a href="{$WEB_ROOT}/cart.php" class="nav-link d-block py-2 {if $filename == 'products' || $filename == 'cart'}active{/if}">
                            <i class="fas fa-server me-2"></i> Hosting
                        </a>
                        <a href="{$WEB_ROOT}/knowledgebase.php" class="nav-link d-block py-2 {if $filename == 'knowledgebase'}active{/if}">
                            <i class="fas fa-book me-2"></i> Knowledge Base
                        </a>
                        <a href="{$WEB_ROOT}/submitticket.php" class="nav-link d-block py-2 {if $filename == 'submitticket'}active{/if}">
                            <i class="fas fa-life-ring me-2"></i> Support
                        </a>
                    {else}
                        <a href="{$WEB_ROOT}/clientarea.php" class="nav-link d-block py-2 {if $filename == 'clientareahome'}active{/if}">
                            <i class="fas fa-tachometer-alt me-2"></i> Dashboard
                        </a>
                        <a href="{$WEB_ROOT}/clientarea.php?action=products" class="nav-link d-block py-2 {if $filename == 'clientareaproducts'}active{/if}">
                            <i class="fas fa-server me-2"></i> My Services
                        </a>
                        <a href="{$WEB_ROOT}/clientarea.php?action=domains" class="nav-link d-block py-2 {if $filename == 'clientareadomains'}active{/if}">
                            <i class="fas fa-globe me-2"></i> My Domains
                        </a>
                        <a href="{$WEB_ROOT}/clientarea.php?action=invoices" class="nav-link d-block py-2 {if $filename == 'clientareainvoices'}active{/if}">
                            <i class="fas fa-file-invoice-dollar me-2"></i> Invoices
                        </a>
                        <a href="{$WEB_ROOT}/supporttickets.php" class="nav-link d-block py-2 {if $filename == 'supporttickets'}active{/if}">
                            <i class="fas fa-ticket-alt me-2"></i> Support
                        </a>
                    {/if}
                </div>
            </div>
        </div>
    </div>
</nav>

<style>
/* Custom styles for this navbar */
.navbar-transparent {
    background-color: rgba(26, 26, 26, 0.9) !important;
    backdrop-filter: blur(10px);
}

.dropdown-item:hover {
    background-color: rgba(0, 255, 136, 0.1) !important;
    color: var(--ds-neon-green) !important;
}

.nav-link.active {
    color: var(--ds-neon-green) !important;
}

.nav-link:hover {
    color: var(--ds-neon-green) !important;
}

@media (min-width: 768px) {
    .navbar {
        height: 64px;
    }
    
    .navbar .nav {
        margin-left: 40px;
    }
    
    .nav-item {
        margin-right: 15px;
    }
}
</style>

<script>
function toggleMobileMenu() {
    var menu = document.getElementById('mobileMenu');
    if (menu.style.display === 'none' || menu.style.display === '') {
        menu.style.display = 'block';
    } else {
        menu.style.display = 'none';
    }
}
</script>
