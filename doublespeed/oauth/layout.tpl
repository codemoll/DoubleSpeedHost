<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="{$charset}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{if $pagetitle}{$pagetitle} - {/if}{$companyname}</title>
    
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
    <meta name="description" content="Secure OAuth Authentication - {$companyname}">
    <meta name="robots" content="noindex, nofollow">
    
    {$headoutput}
</head>

<body class="bg-dark-bg text-text-white min-h-screen">
    
    <!-- OAuth Header -->
    <div class="bg-dark-bg-alt border-b border-gray-800">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between items-center h-16">
                <!-- Logo -->
                <div class="flex items-center">
                    <a href="{$WEB_ROOT}/index.php" class="flex items-center space-x-3">
                        {if isset($templatefile) && is_array($templatefile) && $templatefile.logourl}
                            <img src="{$templatefile.logourl}" alt="{$companyname}" class="h-8 w-auto">
                        {else}
                            <div class="text-2xl font-orbitron font-bold text-white">
                                <span class="text-neon-green">D</span>ouble<span class="text-electric-blue">S</span>peed
                            </div>
                        {/if}
                    </a>
                </div>
                
                <!-- Security Badge -->
                <div class="flex items-center space-x-2 text-sm text-text-light">
                    <svg class="w-4 h-4 text-neon-green" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                    </svg>
                    <span>Secure Authentication</span>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Main Content -->
    <main>
        {$content}
    </main>
    
    <!-- OAuth Footer -->
    <footer class="bg-dark-bg-alt border-t border-gray-800 mt-auto">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
            <div class="text-center text-sm text-text-light">
                <p>&copy; {$date_year} {$companyname}. All rights reserved.</p>
                <p class="mt-1">
                    <a href="{$WEB_ROOT}/privacy.php" class="text-neon-green hover:text-electric-blue transition-colors duration-300">Privacy Policy</a>
                    <span class="mx-2">|</span>
                    <a href="{$WEB_ROOT}/terms.php" class="text-neon-green hover:text-electric-blue transition-colors duration-300">Terms of Service</a>
                </p>
            </div>
        </div>
    </footer>
    
    {$footeroutput}
</body>
</html>