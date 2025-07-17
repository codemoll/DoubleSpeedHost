{* Navigation Bar Component - WHMCS Six Compatible *}

{assign var="navPosition" value=$position|default:"top"}
{assign var="isTransparent" value=$transparent|default:false}
{assign var="isFixed" value=$fixed|default:true}

<nav class="navbar navbar-expand-lg navbar-dark {if $isFixed}fixed-top{/if} {if $navPosition == 'bottom'}fixed-bottom{/if} {if $isTransparent}navbar-transparent{/if}">
    <div class="container">
        {* Logo/Brand *}
        <a class="navbar-brand" href="{$WEB_ROOT}/index.php">
            <div class="d-flex align-items-center">
                {if isset($templatefile) && is_array($templatefile) && $templatefile.logourl}
                    <img src="{$templatefile.logourl}" alt="{$companyname}" class="navbar-logo me-2">
                {else}
                    <div class="navbar-logo-fallback me-2"></div>
                {/if}
                <span class="navbar-brand-text d-none d-sm-block">{$companyname}</span>
            </div>
        </a>
        
        {* Mobile toggle button *}
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        {* Navigation content *}
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
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
            
            {* User Menu / Auth Buttons *}
            <div class="navbar-nav">
                {if $loggedin}
                    {* User Dropdown *}
                    <div class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <div class="user-avatar me-2">
                                {if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.firstname)}
                                    {$clientsdetails.firstname|substr:0:1}{if isset($clientsdetails.lastname)}{$clientsdetails.lastname|substr:0:1}{/if}
                                {else}
                                    U
                                {/if}
                            </div>
                            <span class="d-none d-sm-block">
                                {if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.firstname)}
                                    {$clientsdetails.firstname}
                                {else}
                                    Account
                                {/if}
                            </span>
                        </a>
                        
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li>
                                <a href="{$WEB_ROOT}/clientarea.php?action=details" class="dropdown-item">
                                    <i class="fas fa-user me-2"></i> My Account
                                </a>
                            </li>
                            <li>
                                <a href="{$WEB_ROOT}/clientarea.php?action=security" class="dropdown-item">
                                    <i class="fas fa-shield-alt me-2"></i> Security
                                </a>
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <a href="{$WEB_ROOT}/logout.php" class="dropdown-item text-danger">
                                    <i class="fas fa-sign-out-alt me-2"></i> Logout
                                </a>
                            </li>
                        </ul>
                    </div>
                {else}
                    {* Login/Register Buttons *}
                    <div class="nav-item">
                        <a href="{$WEB_ROOT}/login.php" class="btn btn-outline-primary btn-sm me-2">
                            <i class="fas fa-sign-in-alt me-1"></i> Login
                        </a>
                    </div>
                    <div class="nav-item">
                        <a href="{$WEB_ROOT}/register.php" class="btn btn-primary btn-sm">
                            <i class="fas fa-user-plus me-1"></i> Register
                        </a>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</nav>

<style>
/* Navbar Styles - WHMCS Six Compatible */
.navbar {
    background-color: var(--ds-dark-bg-alt) !important;
    border-bottom: 1px solid var(--ds-gray-700);
    padding: 0.75rem 0;
}

.navbar-transparent {
    background-color: rgba(26, 26, 26, 0.95) !important;
    backdrop-filter: blur(10px);
}

.navbar-brand {
    color: var(--ds-text-white) !important;
    text-decoration: none;
    transition: opacity 0.2s ease;
}

.navbar-brand:hover {
    color: var(--ds-text-white) !important;
    opacity: 0.8;
}

.navbar-logo {
    height: 32px;
    width: auto;
}

.navbar-logo-fallback {
    width: 32px;
    height: 32px;
    background: linear-gradient(135deg, var(--ds-neon-green), var(--ds-electric-blue));
    border-radius: 4px;
}

.navbar-brand-text {
    font-family: 'Orbitron', monospace;
    font-weight: 700;
    font-size: 1.25rem;
    color: var(--ds-text-white);
    text-shadow: 0 0 10px rgba(0, 255, 136, 0.3);
}

.nav-link {
    color: var(--ds-text-light) !important;
    font-weight: 500;
    font-size: 0.875rem;
    padding: 0.5rem 1rem !important;
    transition: color 0.3s ease;
    border-radius: 6px;
    margin: 0 0.25rem;
}

.nav-link:hover,
.nav-link:focus {
    color: var(--ds-neon-green) !important;
}

.nav-link.active {
    color: var(--ds-neon-green) !important;
    background-color: rgba(0, 255, 136, 0.1);
}

.navbar-toggler {
    border: 1px solid var(--ds-gray-700);
    border-radius: 6px;
    padding: 0.5rem;
}

.navbar-toggler:focus {
    box-shadow: 0 0 0 0.2rem rgba(0, 255, 136, 0.25);
}

.navbar-toggler-icon {
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='rgba%28191, 191, 191, 1%29' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
}

.user-avatar {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 32px;
    height: 32px;
    background: linear-gradient(135deg, var(--ds-neon-green), var(--ds-electric-blue));
    border-radius: 50%;
    color: var(--ds-dark-bg);
    font-weight: 700;
    font-size: 0.875rem;
}

.dropdown-menu {
    background-color: var(--ds-dark-surface);
    border: 1px solid var(--ds-gray-700);
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.dropdown-item {
    color: var(--ds-text-light);
    padding: 0.75rem 1.25rem;
    transition: all 0.3s ease;
}

.dropdown-item:hover,
.dropdown-item:focus {
    background-color: rgba(0, 255, 136, 0.1);
    color: var(--ds-neon-green);
}

.dropdown-divider {
    border-color: var(--ds-gray-700);
}

.btn-outline-primary {
    border-color: var(--ds-neon-green);
    color: var(--ds-neon-green);
}

.btn-outline-primary:hover {
    background-color: var(--ds-neon-green);
    border-color: var(--ds-neon-green);
    color: var(--ds-dark-bg);
}

@media (max-width: 991.98px) {
    .navbar-collapse {
        margin-top: 1rem;
        padding-top: 1rem;
        border-top: 1px solid var(--ds-gray-700);
    }
    
    .nav-link {
        padding: 0.75rem 0 !important;
        margin: 0;
        border-radius: 0;
    }
}

/* Prevent navbar duplication */
nav:nth-of-type(n+2) {
    display: none !important;
}
</style>
