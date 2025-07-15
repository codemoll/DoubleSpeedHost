{include file="$template/header.tpl"}

<div class="min-h-screen flex items-center justify-center bg-dark-bg py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full space-y-8">
        <div class="text-center">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M18 8a6 6 0 01-7.743 5.743L10 14l-4 4-4-4 4-4 .257-.257A6 6 0 1118 8zm-6-2a1 1 0 11-2 0 1 1 0 012 0z" clip-rule="evenodd"/>
                </svg>
            </div>
            <h2 class="text-3xl font-orbitron font-bold text-white mb-4">
                Reset Your Password
            </h2>
            <p class="text-text-light mb-8">
                Enter your email address and we'll send you a link to reset your password.
            </p>
        </div>
        
        <div class="card-dark">
            {if $sent}
                <div class="bg-green-900 border border-green-700 rounded-lg p-4 mb-6">
                    <div class="flex">
                        <svg class="w-5 h-5 text-green-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                        </svg>
                        <div>
                            <div class="text-green-200 text-sm font-medium">Email Sent Successfully!</div>
                            <div class="text-green-300 text-xs mt-1">
                                Check your email for password reset instructions. If you don't see it, check your spam folder.
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="text-center">
                    <p class="text-text-light text-sm mb-4">
                        Didn't receive the email? You can request another one.
                    </p>
                    <a href="{$WEB_ROOT}/pwreset.php" class="btn-outline">
                        Send Another Email
                    </a>
                </div>
            {else}
                <form method="post" action="{$smarty.server.PHP_SELF}" class="space-y-6">
                    {if $errormessage}
                        <div class="bg-red-900 border border-red-700 rounded-lg p-4">
                            <div class="flex">
                                <svg class="w-5 h-5 text-red-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                                </svg>
                                <div class="text-red-200 text-sm">{$errormessage}</div>
                            </div>
                        </div>
                    {/if}
                    
                    <div>
                        <label for="email" class="block text-sm font-medium text-white mb-2">
                            Email Address
                        </label>
                        <input type="email" 
                               id="email" 
                               name="email" 
                               required 
                               class="input-dark w-full" 
                               placeholder="Enter your email address"
                               value="{if $smarty.post.email}{$smarty.post.email}{/if}"
                               autofocus>
                        <p class="text-text-light text-xs mt-1">
                            Enter the email address associated with your account
                        </p>
                    </div>
                    
                    {if $recaptchahtml}
                        <div>{$recaptchahtml}</div>
                    {/if}
                    
                    <button type="submit" name="submit" class="btn-primary w-full">
                        <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                            <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                        </svg>
                        Send Reset Email
                    </button>
                </form>
            {/if}
            
            <!-- Alternative Options -->
            <div class="mt-6 pt-6 border-t border-gray-700">
                <div class="text-center space-y-2">
                    <p class="text-text-light text-sm">Remember your password?</p>
                    <a href="{$WEB_ROOT}/login.php" 
                       class="text-electric-blue hover:text-neon-green transition-colors duration-300 text-sm">
                        Return to login
                    </a>
                </div>
            </div>
        </div>
        
        <!-- Security Notice -->
        <div class="text-center">
            <div class="inline-flex items-center space-x-2 text-sm text-text-light">
                <svg class="w-4 h-4 text-neon-green" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                </svg>
                <span>Password reset links expire after 1 hour for security</span>
            </div>
        </div>
        
        <!-- Help Options -->
        <div class="card-dark">
            <h3 class="text-lg font-semibold text-white mb-4">Need additional help?</h3>
            <div class="space-y-3 text-sm">
                <div class="flex items-center space-x-3">
                    <svg class="w-4 h-4 text-electric-blue" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M18 13V5a2 2 0 00-2-2H4a2 2 0 00-2 2v8a2 2 0 002 2h3l3 3 3-3h3a2 2 0 002-2zM5 7a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zm1 3a1 1 0 100 2h3a1 1 0 100-2H6z" clip-rule="evenodd"/>
                    </svg>
                    <a href="{$WEB_ROOT}/submitticket.php" class="text-electric-blue hover:text-neon-green transition-colors duration-300">
                        Contact support for account recovery
                    </a>
                </div>
                <div class="flex items-center space-x-3">
                    <svg class="w-4 h-4 text-cyber-purple" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-3a1 1 0 00-.867.5 1 1 0 11-1.731-1A3 3 0 0113 8a3.001 3.001 0 01-2 2.83V11a1 1 0 11-2 0v-1a1 1 0 011-1 1 1 0 100-2zm0 8a1 1 0 100-2 1 1 0 000 2z" clip-rule="evenodd"/>
                    </svg>
                    <a href="{$WEB_ROOT}/knowledgebase.php" class="text-cyber-purple hover:text-neon-green transition-colors duration-300">
                        Check our knowledge base for common issues
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}