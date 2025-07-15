{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-20 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md mx-auto">
        <div class="text-center mb-8">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                </svg>
            </div>
            <h2 class="text-3xl font-orbitron font-bold text-white">
                Reset Password
            </h2>
            <p class="mt-2 text-sm text-text-light">
                Enter your email address and we'll send you instructions to reset your password.
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

            {if $successmessage}
                <div class="bg-green-900 border border-green-700 rounded-lg p-4 mb-6">
                    <div class="flex">
                        <svg class="w-5 h-5 text-green-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                        </svg>
                        <div class="text-green-200 text-sm">
                            {$successmessage}
                        </div>
                    </div>
                </div>
            {/if}

            {if !$successmessage}
                <form method="post" action="{$smarty.server.PHP_SELF}">
                    <div class="mb-6">
                        <label for="email" class="block text-sm font-medium text-text-light mb-2">
                            Email Address <span class="text-red-400">*</span>
                        </label>
                        <input type="email" id="email" name="email" value="{if isset($email)}{$email}{/if}" 
                               required class="input-dark" placeholder="Enter your email address">
                    </div>
                    
                    {if $captcha}
                        <div class="mb-6">
                            <label class="block text-sm font-medium text-text-light mb-2">
                                Security Verification
                            </label>
                            {$captcha}
                        </div>
                    {/if}
                    
                    <button type="submit" class="btn-primary w-full">
                        Send Reset Instructions
                    </button>
                </form>
            {/if}
            
            <div class="mt-6 text-center">
                <p class="text-sm text-text-light">
                    Remember your password?
                    <a href="{$WEB_ROOT}/clientarea.php" class="font-medium text-neon-green hover:text-electric-blue transition-colors duration-300">
                        Sign in here
                    </a>
                </p>
            </div>
        </div>
        
        <!-- Help Section -->
        <div class="mt-8 text-center">
            <p class="text-sm text-text-light mb-4">
                Still having trouble? Our support team is here to help.
            </p>
            <div class="space-y-2">
                <a href="{$WEB_ROOT}/submitticket.php" class="btn-secondary w-full text-center inline-block">
                    Open Support Ticket
                </a>
                <a href="{$WEB_ROOT}/contact.php" class="btn-outline w-full text-center inline-block">
                    Contact Us
                </a>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}