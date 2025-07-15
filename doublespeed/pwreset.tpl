{include file="$template/header.tpl"}

<div class="min-h-screen flex items-center justify-center bg-dark-bg py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full space-y-8">
        <div class="text-center">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-electric-blue to-cyber-purple rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M18 8a6 6 0 01-7.743 5.743L10 14l-1 1-1 1H6l-2-2v-2l4.257-4.257A6 6 0 1118 8zm-6-4a1 1 0 100 2 2 2 0 012 2 1 1 0 102 0 4 4 0 00-4-4z" clip-rule="evenodd"/>
                </svg>
            </div>
            <h2 class="text-3xl font-orbitron font-bold text-white">
                Reset Your Password
            </h2>
            <p class="mt-2 text-sm text-text-light">
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
                        <div class="text-green-200 text-sm">
                            <strong>Password reset email sent!</strong><br>
                            We've sent a password reset link to your email address. Please check your inbox and follow the instructions to reset your password.
                        </div>
                    </div>
                </div>
                
                <div class="text-center">
                    <p class="text-text-light mb-4">Didn't receive the email?</p>
                    <div class="space-y-3">
                        <a href="{$WEB_ROOT}/pwreset.php" class="btn-secondary w-full">
                            <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M4 2a1 1 0 011 1v2.101a7.002 7.002 0 0111.601 2.566 1 1 0 11-1.885.666A5.002 5.002 0 005.999 7H9a1 1 0 010 2H4a1 1 0 01-1-1V3a1 1 0 011-1zm.008 9.057a1 1 0 011.276.61A5.002 5.002 0 0014.001 13H11a1 1 0 110-2h5a1 1 0 011 1v5a1 1 0 11-2 0v-2.101a7.002 7.002 0 01-11.601-2.566 1 1 0 01.61-1.276z" clip-rule="evenodd"/>
                            </svg>
                            Try Again
                        </a>
                        <a href="{$WEB_ROOT}/contact.php" class="btn-outline w-full">
                            <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                                <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                            </svg>
                            Contact Support
                        </a>
                    </div>
                </div>
            {else}
                {if $errormessage}
                    <div class="bg-red-900 border border-red-700 rounded-lg p-4 mb-6">
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

                <form method="post" action="{$WEB_ROOT}/pwreset.php" class="space-y-6">
                    <div>
                        <label for="email" class="block text-sm font-medium text-text-light mb-2">Email Address *</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <svg class="h-5 w-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                                    <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                                    <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                                </svg>
                            </div>
                            <input type="email" id="email" name="email" required 
                                   value="{if isset($email)}{$email}{/if}"
                                   class="block w-full pl-10 pr-3 py-3 bg-dark-surface border border-gray-600 rounded-lg text-white placeholder-gray-400 focus:ring-2 focus:ring-electric-blue focus:border-transparent transition-all duration-300"
                                   placeholder="Enter your email address">
                        </div>
                        <p class="mt-2 text-xs text-text-light">
                            Enter the email address associated with your account
                        </p>
                    </div>

                    {if $capcha}
                        <div>
                            <label class="block text-sm font-medium text-text-light mb-2">Security Verification</label>
                            <div class="bg-dark-surface border border-gray-600 rounded-lg p-4">
                                {$capcha}
                            </div>
                        </div>
                    {/if}

                    <div class="space-y-4">
                        <button type="submit" class="w-full btn-primary">
                            <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                                <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                            </svg>
                            Send Reset Link
                        </button>
                        
                        <div class="text-center">
                            <a href="{$WEB_ROOT}/login.php" class="text-sm text-neon-green hover:text-electric-blue transition-colors duration-300">
                                <svg class="w-4 h-4 mr-1 inline" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z" clip-rule="evenodd"/>
                                </svg>
                                Back to Login
                            </a>
                        </div>
                    </div>
                </form>
            {/if}
            
            <div class="mt-8 pt-6 border-t border-gray-700">
                <div class="text-center">
                    <p class="text-xs text-text-light mb-3">Need additional help?</p>
                    <a href="{$WEB_ROOT}/contact.php" class="text-sm text-electric-blue hover:text-neon-green transition-colors duration-300">
                        Contact our support team
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}