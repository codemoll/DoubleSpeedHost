{include file="$template/header.tpl"}

<div class="min-h-screen flex items-center justify-center bg-dark-bg py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full space-y-8">
        <div class="text-center">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-electric-blue to-cyber-purple rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                    <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                </svg>
            </div>
            <h2 class="text-3xl font-orbitron font-bold text-white">
                Password Reset
            </h2>
            <p class="mt-2 text-sm text-text-light">
                We'll send you an email with instructions to reset your password.
            </p>
        </div>
        
        <div class="card-dark">
            <div class="bg-blue-900 border border-blue-700 rounded-lg p-4 mb-6">
                <div class="flex">
                    <svg class="w-5 h-5 text-blue-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                    </svg>
                    <div class="text-blue-200 text-sm">
                        Please provide your email address to continue with the password reset process.
                    </div>
                </div>
            </div>

            <form method="post" action="{$systemurl}pwreset.php" class="space-y-6">
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
                               class="block w-full pl-10 pr-3 py-3 bg-dark-surface border border-gray-600 rounded-lg text-white placeholder-gray-400 focus:ring-2 focus:ring-electric-blue focus:border-transparent transition-all duration-300"
                               placeholder="Enter your email address">
                    </div>
                    <p class="mt-2 text-xs text-text-light">
                        Enter the email address associated with your account
                    </p>
                </div>

                <div class="space-y-4">
                    <button type="submit" class="w-full btn-primary">
                        <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                            <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                        </svg>
                        Send Reset Email
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
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}