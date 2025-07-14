{include file="$template/header.tpl"}

<div class="min-h-screen flex items-center justify-center bg-dark-bg py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full space-y-8">
        <div class="text-center">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                </svg>
            </div>
            <h2 class="text-3xl font-orbitron font-bold text-white">
                Sign in to your account
            </h2>
            <p class="mt-2 text-sm text-text-light">
                Or
                <a href="{$WEB_ROOT}/register.php" class="font-medium text-neon-green hover:text-electric-blue transition-colors duration-300">
                    create a new account
                </a>
            </p>
        </div>
        
        <div class="card-dark">
            <form class="space-y-6" method="post" action="{$WEB_ROOT}/dologin.php">
                {if $incorrect}
                    <div class="bg-red-900 border border-red-700 rounded-lg p-4">
                        <div class="flex">
                            <svg class="w-5 h-5 text-red-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                            </svg>
                            <div class="text-red-200 text-sm">
                                {$errormessage}
                            </div>
                        </div>
                    </div>
                {/if}

                {if $info}
                    <div class="bg-blue-900 border border-blue-700 rounded-lg p-4">
                        <div class="flex">
                            <svg class="w-5 h-5 text-blue-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                            </svg>
                            <div class="text-blue-200 text-sm">
                                {$info}
                            </div>
                        </div>
                    </div>
                {/if}
                
                <div>
                    <label for="username" class="block text-sm font-medium text-text-light mb-2">
                        Email Address
                    </label>
                    <input id="username" name="username" type="email" autocomplete="email" required 
                           value="{$username}"
                           class="input-dark w-full focus:shadow-glow-green" 
                           placeholder="Enter your email address">
                </div>
                
                <div>
                    <label for="password" class="block text-sm font-medium text-text-light mb-2">
                        Password
                    </label>
                    <input id="password" name="password" type="password" autocomplete="current-password" required 
                           class="input-dark w-full focus:shadow-glow-green" 
                           placeholder="Enter your password">
                </div>
                
                <div class="flex items-center justify-between">
                    <div class="flex items-center">
                        <input id="rememberme" name="rememberme" type="checkbox" 
                               class="h-4 w-4 text-neon-green bg-dark-surface border-gray-600 rounded focus:ring-neon-green focus:ring-2">
                        <label for="rememberme" class="ml-2 block text-sm text-text-light">
                            Remember me
                        </label>
                    </div>
                    
                    <div class="text-sm">
                        <a href="{$WEB_ROOT}/pwreset.php" class="font-medium text-neon-green hover:text-electric-blue transition-colors duration-300">
                            Forgot your password?
                        </a>
                    </div>
                </div>
                
                <div>
                    <button type="submit" class="btn-primary w-full text-lg">
                        <svg class="w-5 h-5 mr-2 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1"/>
                        </svg>
                        Sign in
                    </button>
                </div>
            </form>
            
            <!-- Social Login (if enabled) -->
            {if $providerintegrations}
                <div class="mt-6">
                    <div class="relative">
                        <div class="absolute inset-0 flex items-center">
                            <div class="w-full border-t border-gray-600"></div>
                        </div>
                        <div class="relative flex justify-center text-sm">
                            <span class="bg-dark-surface px-2 text-text-light">Or continue with</span>
                        </div>
                    </div>
                    
                    <div class="mt-6 grid grid-cols-2 gap-3">
                        {foreach $providerintegrations as $integration}
                            <a href="{$integration.link}" class="w-full inline-flex justify-center py-2 px-4 border border-gray-600 rounded-lg bg-dark-bg text-sm font-medium text-text-light hover:bg-gray-700 hover:border-neon-green transition-all duration-300">
                                <span class="sr-only">Sign in with {$integration.display_name}</span>
                                <img class="w-5 h-5" src="{$integration.logo_url}" alt="{$integration.display_name}">
                                <span class="ml-2">{$integration.display_name}</span>
                            </a>
                        {/foreach}
                    </div>
                </div>
            {/if}
        </div>
        
        <!-- Additional Links -->
        <div class="text-center space-y-2">
            <p class="text-sm text-text-light">
                Don't have an account?
                <a href="{$WEB_ROOT}/register.php" class="font-medium text-neon-green hover:text-electric-blue transition-colors duration-300">
                    Sign up now
                </a>
            </p>
            <p class="text-sm text-text-light">
                Need help?
                <a href="{$WEB_ROOT}/contact.php" class="font-medium text-neon-green hover:text-electric-blue transition-colors duration-300">
                    Contact Support
                </a>
            </p>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}