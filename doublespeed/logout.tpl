{include file="$template/header.tpl"}

<div class="min-h-screen flex items-center justify-center bg-dark-bg py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full space-y-8">
        <div class="text-center">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-cyber-purple to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-white" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M3 3a1 1 0 000 2v8a2 2 0 002 2h2.586l-1.293 1.293a1 1 0 101.414 1.414L10 15.414l2.293 2.293a1 1 0 001.414-1.414L12.414 15H15a2 2 0 002-2V5a1 1 0 100-2H3zm11.707 4.707a1 1 0 00-1.414-1.414L10 9.586 8.707 8.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                </svg>
            </div>
            <h2 class="text-3xl font-orbitron font-bold text-white mb-4">
                Logout Successful
            </h2>
            <p class="text-text-light mb-8">
                You have been successfully logged out of your account. Thank you for using our services.
            </p>
        </div>
        
        <div class="card-dark text-center">
            <div class="space-y-6">
                
                <!-- Security Notice -->
                <div class="bg-dark-bg border border-gray-700 rounded-lg p-4">
                    <div class="flex">
                        <svg class="w-5 h-5 text-neon-green mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                        </svg>
                        <div class="text-neon-green text-sm">
                            <strong>Security Tip:</strong> For your security, always log out when using shared or public computers.
                        </div>
                    </div>
                </div>
                
                <!-- Quick Actions -->
                <div class="space-y-4">
                    <h3 class="text-lg font-semibold text-white">What would you like to do next?</h3>
                    
                    <div class="grid grid-cols-1 gap-3">
                        <a href="{$WEB_ROOT}/login.php" class="btn-primary">
                            <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M3 3a1 1 0 011 1v12a1 1 0 11-2 0V4a1 1 0 011-1zm7.707 3.293a1 1 0 010 1.414L9.414 9H17a1 1 0 110 2H9.414l1.293 1.293a1 1 0 01-1.414 1.414l-3-3a1 1 0 010-1.414l3-3a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            Sign In Again
                        </a>
                        
                        <a href="{$WEB_ROOT}/index.php" class="btn-outline">
                            <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"/>
                            </svg>
                            Go to Homepage
                        </a>
                        
                        <a href="{$WEB_ROOT}/register.php" class="btn-secondary">
                            <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M8 9a3 3 0 100-6 3 3 0 000 6zM8 11a6 6 0 016 6H2a6 6 0 016-6zM16 7a1 1 0 10-2 0v1h-1a1 1 0 100 2h1v1a1 1 0 102 0v-1h1a1 1 0 100-2h-1V7z"/>
                            </svg>
                            Create Account
                        </a>
                    </div>
                </div>
                
                <!-- Support Links -->
                <div class="pt-6 border-t border-gray-700">
                    <h4 class="text-sm font-medium text-white mb-3">Need Help?</h4>
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-2 text-sm">
                        <a href="{$WEB_ROOT}/contact.php" 
                           class="text-electric-blue hover:text-neon-green transition-colors duration-300">
                            📧 Contact Support
                        </a>
                        <a href="{$WEB_ROOT}/knowledgebase.php" 
                           class="text-electric-blue hover:text-neon-green transition-colors duration-300">
                            📚 Knowledge Base
                        </a>
                        <a href="{$WEB_ROOT}/serverstatus.php" 
                           class="text-electric-blue hover:text-neon-green transition-colors duration-300">
                            📊 Server Status
                        </a>
                        <a href="{$WEB_ROOT}/announcements.php" 
                           class="text-electric-blue hover:text-neon-green transition-colors duration-300">
                            📢 Announcements
                        </a>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Session Information -->
        <div class="text-center text-xs text-text-light">
            <p>Session ended at {$smarty.now|date_format:"%Y-%m-%d %H:%M:%S"}</p>
            <p class="mt-1">
                IP Address: <span class="font-mono">{$smarty.server.REMOTE_ADDR}</span>
            </p>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}