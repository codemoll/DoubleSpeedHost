<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="{$charset}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>
    
    {if $systemsslurl}
        <base href="{$systemsslurl}" />
    {else}
        <base href="{$systemurl}" />
    {/if}
    
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="{$WEB_ROOT}/templates/{$template}/css/style.css" />
    
    <!-- Favicon -->
    <link rel="shortcut icon" href="{$WEB_ROOT}/templates/{$template}/images/favicon.ico" type="image/x-icon" />
    
    <!-- Meta Tags -->
    <meta name="description" content="DoubleSpeed Host - Fast, reliable, and secure hosting solutions with cutting-edge technology and 24/7 support.">
    <meta name="keywords" content="web hosting, cloud hosting, dedicated servers, VPS, domain registration, SSL certificates">
    <meta name="author" content="DoubleSpeed Host">
    
    <!-- Open Graph -->
    <meta property="og:title" content="{$pagetitle} - {$companyname}">
    <meta property="og:description" content="Fast, reliable, and secure hosting solutions">
    <meta property="og:type" content="website">
    <meta property="og:url" content="{$systemurl}">
    
    {$headoutput}
</head>

<body class="bg-dark-bg text-text-white min-h-screen">
    
    <!-- Navigation -->
    <nav class="bg-dark-bg-alt border-b border-gray-800 fixed w-full z-50 top-0">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between items-center h-16">
                <!-- Logo -->
                <div class="flex items-center">
                    <a href="{$WEB_ROOT}/index.php" class="flex items-center space-x-3">
                        {if isset($templatefile) && is_array($templatefile) && $templatefile.logourl}
                            <img src="{$templatefile.logourl}" alt="{$companyname}" class="h-8 w-auto">
                        {else}
                            <div class="w-8 h-8 bg-gradient-to-br from-neon-green to-electric-blue rounded"></div>
                        {/if}
                        <span class="font-orbitron font-bold text-xl glow-text">{$companyname}</span>
                    </a>
                </div>
                
                <!-- Desktop Navigation -->
                <div class="hidden md:block">
                    <div class="ml-10 flex items-baseline space-x-4">
                        <a href="{$WEB_ROOT}/index.php" class="nav-link {if $filename eq 'index'}active{/if}">Home</a>
                        <a href="{$WEB_ROOT}/cart.php" class="nav-link">Hosting</a>
                        <a href="{$WEB_ROOT}/domainchecker.php" class="nav-link">Domains</a>
                        <a href="{$WEB_ROOT}/knowledgebase.php" class="nav-link">Support</a>
                        <a href="{$WEB_ROOT}/contact.php" class="nav-link">Contact</a>
                    </div>
                </div>
                
                <!-- User Menu -->
                <div class="hidden md:block">
                    <div class="ml-4 flex items-center md:ml-6">
                        {if $loggedin}
                            <div class="relative">
                                <button type="button" class="flex items-center text-sm rounded-full text-text-light hover:text-white focus:outline-none focus:ring-2 focus:ring-neon-green" id="user-menu-button">
                                    <span class="sr-only">Open user menu</span>
                                    <div class="w-8 h-8 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center">
                                        <span class="text-dark-bg font-medium text-sm">
                                            {if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.firstname) && isset($clientsdetails.lastname)}
                                                {$clientsdetails.firstname|substr:0:1}{$clientsdetails.lastname|substr:0:1}
                                            {else}
                                                U
                                            {/if}
                                        </span>
                                    </div>
                                    <span class="ml-2">
                                        {if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.firstname)}
                                            {$clientsdetails.firstname}
                                        {else}
                                            User
                                        {/if}
                                    </span>
                                </button>
                                <div class="origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg bg-dark-surface ring-1 ring-gray-700 hidden" id="user-menu">
                                    <div class="py-1">
                                        <a href="{$WEB_ROOT}/clientarea.php" class="block px-4 py-2 text-sm text-text-light hover:bg-gray-700 hover:text-white">Dashboard</a>
                                        <a href="{$WEB_ROOT}/clientarea.php?action=details" class="block px-4 py-2 text-sm text-text-light hover:bg-gray-700 hover:text-white">Profile</a>
                                        <a href="{$WEB_ROOT}/logout.php" class="block px-4 py-2 text-sm text-text-light hover:bg-gray-700 hover:text-white">Logout</a>
                                    </div>
                                </div>
                            </div>
                        {else}
                            <div class="flex space-x-4">
                                <a href="{$WEB_ROOT}/clientarea.php" class="text-text-light hover:text-white px-3 py-2 rounded-md text-sm font-medium transition-colors duration-300">Login</a>
                                <a href="{$WEB_ROOT}/register.php" class="btn-primary text-sm">Get Started</a>
                            </div>
                        {/if}
                    </div>
                </div>
                
                <!-- Mobile menu button -->
                <div class="md:hidden">
                    <button type="button" class="bg-dark-surface inline-flex items-center justify-center p-2 rounded-md text-text-light hover:text-white hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-neon-green" id="mobile-menu-button">
                        <span class="sr-only">Open main menu</span>
                        <svg class="block h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
                        </svg>
                    </button>
                </div>
            </div>
        </div>
        
        <!-- Mobile menu -->
        <div class="md:hidden hidden" id="mobile-menu">
            <div class="px-2 pt-2 pb-3 space-y-1 sm:px-3 bg-dark-surface">
                <a href="{$WEB_ROOT}/index.php" class="nav-link-mobile {if $filename eq 'index'}active{/if}">Home</a>
                <a href="{$WEB_ROOT}/cart.php" class="nav-link-mobile">Hosting</a>
                <a href="{$WEB_ROOT}/domainchecker.php" class="nav-link-mobile">Domains</a>
                <a href="{$WEB_ROOT}/knowledgebase.php" class="nav-link-mobile">Support</a>
                <a href="{$WEB_ROOT}/contact.php" class="nav-link-mobile">Contact</a>
                {if not $loggedin}
                    <div class="pt-4 pb-3 border-t border-gray-700">
                        <a href="{$WEB_ROOT}/clientarea.php" class="nav-link-mobile">Login</a>
                        <a href="{$WEB_ROOT}/register.php" class="nav-link-mobile">Register</a>
                    </div>
                {/if}
            </div>
        </div>
    </nav>
    
    <!-- Main Content -->
    <main class="pt-16">
        
        <style>
        .nav-link {
            @apply text-text-light hover:text-white px-3 py-2 rounded-md text-sm font-medium transition-all duration-300 relative;
        }
        
        .nav-link:hover {
            @apply shadow-glow-white;
        }
        
        .nav-link.active {
            @apply text-neon-green;
        }
        
        .nav-link-mobile {
            @apply text-text-light hover:text-white hover:bg-gray-700 block px-3 py-2 rounded-md text-base font-medium transition-colors duration-300;
        }
        
        .nav-link-mobile.active {
            @apply text-neon-green bg-gray-700;
        }
        </style>
        
        <script>
        // Mobile menu toggle
        document.getElementById('mobile-menu-button').addEventListener('click', function() {
            document.getElementById('mobile-menu').classList.toggle('hidden');
        });
        
        // User menu toggle
        if (document.getElementById('user-menu-button')) {
            document.getElementById('user-menu-button').addEventListener('click', function() {
                document.getElementById('user-menu').classList.toggle('hidden');
            });
        }
        
        // Close menus when clicking outside
        document.addEventListener('click', function(event) {
            const mobileMenu = document.getElementById('mobile-menu');
            const mobileButton = document.getElementById('mobile-menu-button');
            const userMenu = document.getElementById('user-menu');
            const userButton = document.getElementById('user-menu-button');
            
            if (!mobileButton.contains(event.target) && !mobileMenu.contains(event.target)) {
                mobileMenu.classList.add('hidden');
            }
            
            if (userButton && userMenu && !userButton.contains(event.target) && !userMenu.contains(event.target)) {
                userMenu.classList.add('hidden');
            }
        });
        </script>