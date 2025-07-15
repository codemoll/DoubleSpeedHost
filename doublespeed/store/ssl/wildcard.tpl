{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-20 px-4 sm:px-6 lg:px-8">
    <div class="max-w-6xl mx-auto">
        <!-- Header -->
        <div class="text-center mb-12">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M3 4a1 1 0 011-1h4a1 1 0 010 2H6.414l2.293 2.293a1 1 0 11-1.414 1.414L5 6.414V8a1 1 0 01-2 0V4zm9 1a1 1 0 010-2h4a1 1 0 011 1v4a1 1 0 01-2 0V6.414l-2.293 2.293a1 1 0 11-1.414-1.414L13.586 5H12zm-9 7a1 1 0 012 0v1.586l2.293-2.293a1 1 0 111.414 1.414L6.414 15H8a1 1 0 010 2H4a1 1 0 01-1-1v-4zm13-1a1 1 0 011 1v4a1 1 0 01-1 1h-4a1 1 0 010-2h1.586l-2.293-2.293a1 1 0 111.414-1.414L15.586 13H14a1 1 0 01-1-1z" clip-rule="evenodd"/>
                </svg>
            </div>
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                Wildcard SSL Certificates
            </h1>
            <p class="text-lg text-text-light max-w-2xl mx-auto">
                Secure unlimited subdomains with a single wildcard SSL certificate.
            </p>
        </div>

        {include file="$template/store/ssl/shared/nav.tpl"}

        <!-- Wildcard SSL Benefits -->
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8 mb-12">
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-neon-green rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M3 4a1 1 0 011-1h4a1 1 0 010 2H6.414l2.293 2.293a1 1 0 11-1.414 1.414L5 6.414V8a1 1 0 01-2 0V4zm9 1a1 1 0 010-2h4a1 1 0 011 1v4a1 1 0 01-2 0V6.414l-2.293 2.293a1 1 0 11-1.414-1.414L13.586 5H12zm-9 7a1 1 0 012 0v1.586l2.293-2.293a1 1 0 111.414 1.414L6.414 15H8a1 1 0 010 2H4a1 1 0 01-1-1v-4zm13-1a1 1 0 011 1v4a1 1 0 01-1 1h-4a1 1 0 010-2h1.586l-2.293-2.293a1 1 0 111.414-1.414L15.586 13H14a1 1 0 01-1-1z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Unlimited Subdomains</h3>
                <p class="text-text-light">Secure infinite subdomains with a single certificate (*.yourdomain.com).</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-electric-blue rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Cost Effective</h3>
                <p class="text-text-light">Much cheaper than buying individual certificates for each subdomain.</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-cyber-purple rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Easy Management</h3>
                <p class="text-text-light">Install once and automatically secure all current and future subdomains.</p>
            </div>
        </div>

        <!-- Subdomain Examples -->
        <div class="bg-dark-surface rounded-lg border border-gray-700 p-8 mb-12">
            <h2 class="text-2xl font-orbitron font-bold text-white mb-6 text-center">Wildcard SSL Coverage Examples</h2>
            <div class="max-w-3xl mx-auto">
                <div class="bg-gray-800 rounded-lg p-6">
                    <h3 class="text-white font-semibold mb-4">One certificate (*.yourdomain.com) secures:</h3>
                    <div class="grid md:grid-cols-2 gap-4">
                        <div class="space-y-2">
                            <div class="flex items-center space-x-2">
                                <span class="w-2 h-2 bg-neon-green rounded-full"></span>
                                <span class="text-text-light">www.yourdomain.com</span>
                            </div>
                            <div class="flex items-center space-x-2">
                                <span class="w-2 h-2 bg-neon-green rounded-full"></span>
                                <span class="text-text-light">blog.yourdomain.com</span>
                            </div>
                            <div class="flex items-center space-x-2">
                                <span class="w-2 h-2 bg-neon-green rounded-full"></span>
                                <span class="text-text-light">shop.yourdomain.com</span>
                            </div>
                            <div class="flex items-center space-x-2">
                                <span class="w-2 h-2 bg-neon-green rounded-full"></span>
                                <span class="text-text-light">api.yourdomain.com</span>
                            </div>
                        </div>
                        
                        <div class="space-y-2">
                            <div class="flex items-center space-x-2">
                                <span class="w-2 h-2 bg-neon-green rounded-full"></span>
                                <span class="text-text-light">support.yourdomain.com</span>
                            </div>
                            <div class="flex items-center space-x-2">
                                <span class="w-2 h-2 bg-neon-green rounded-full"></span>
                                <span class="text-text-light">admin.yourdomain.com</span>
                            </div>
                            <div class="flex items-center space-x-2">
                                <span class="w-2 h-2 bg-neon-green rounded-full"></span>
                                <span class="text-text-light">mail.yourdomain.com</span>
                            </div>
                            <div class="flex items-center space-x-2">
                                <span class="w-2 h-2 bg-electric-blue rounded-full"></span>
                                <span class="text-text-light">+ Any future subdomains</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Use Cases -->
        <div class="grid md:grid-cols-2 gap-8 mb-12">
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <h3 class="text-xl font-semibold text-white mb-4">Perfect For:</h3>
                <ul class="text-text-light space-y-2">
                    <li>• Multi-site WordPress installations</li>
                    <li>• SaaS applications with customer subdomains</li>
                    <li>• E-commerce sites with multiple storefronts</li>
                    <li>• Corporate websites with various departments</li>
                    <li>• Development and staging environments</li>
                </ul>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <h3 class="text-xl font-semibold text-white mb-4">Important Notes:</h3>
                <ul class="text-text-light space-y-2">
                    <li>• Only covers first-level subdomains</li>
                    <li>• Does not secure the root domain without www</li>
                    <li>• Cannot secure sub-subdomains (*.*.domain.com)</li>
                    <li>• Domain validation required</li>
                    <li>• 2-year maximum validity period</li>
                </ul>
            </div>
        </div>

        <!-- CTA -->
        <div class="text-center">
            <a href="{$WEB_ROOT}/cart.php?a=add&pid=ssl-wildcard" class="btn-primary">
                Order Wildcard SSL Certificate
            </a>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}