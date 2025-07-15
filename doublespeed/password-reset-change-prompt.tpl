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
                Change Your Password
            </h2>
            <p class="mt-2 text-sm text-text-light">
                Enter your new password below to complete the reset process.
            </p>
        </div>
        
        <div class="card-dark">
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

            <form method="post" action="{$systemurl}pwreset.php" class="space-y-6">
                <input type="hidden" name="sub" value="newpw" />
                <input type="hidden" name="email" value="{$email}" />
                <input type="hidden" name="key" value="{$key}" />
                
                <div>
                    <label for="newpw" class="block text-sm font-medium text-text-light mb-2">New Password *</label>
                    <input type="password" id="newpw" name="newpw" required 
                           class="input-dark w-full focus:shadow-glow-green" 
                           placeholder="Enter your new password">
                    <p class="mt-2 text-xs text-text-light">
                        Password must be at least 8 characters long
                    </p>
                </div>

                <div>
                    <label for="confirmpw" class="block text-sm font-medium text-text-light mb-2">Confirm New Password *</label>
                    <input type="password" id="confirmpw" name="confirmpw" required 
                           class="input-dark w-full focus:shadow-glow-green" 
                           placeholder="Confirm your new password">
                </div>

                <div class="space-y-4">
                    <button type="submit" class="w-full btn-primary">
                        <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                        </svg>
                        Update Password
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