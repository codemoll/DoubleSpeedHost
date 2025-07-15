{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-20 px-4 sm:px-6 lg:px-8">
    <div class="max-w-6xl mx-auto">
        <!-- Header -->
        <div class="text-center mb-12">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd"/>
                </svg>
            </div>
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                SiteLock VPN
            </h1>
            <p class="text-lg text-text-light max-w-2xl mx-auto">
                Secure VPN service by SiteLock to protect your online privacy and browsing activities.
            </p>
        </div>

        <!-- Features -->
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8 mb-12">
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-neon-green rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Bank-Level Encryption</h3>
                <p class="text-text-light">Military-grade AES-256 encryption protects your data and browsing activity.</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-electric-blue rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M2 10a8 8 0 108 8 8 8 0 00-8-8zM9 15a1 1 0 102 0V9a1 1 0 10-2 0v6z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Global Server Network</h3>
                <p class="text-text-light">Connect to servers worldwide for optimal speed and access to geo-restricted content.</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-cyber-purple rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M10 12a2 2 0 100-4 2 2 0 000 4z"/>
                        <path fill-rule="evenodd" d="M.458 10C1.732 5.943 5.522 3 10 3s8.268 2.943 9.542 7c-1.274 4.057-5.064 7-9.542 7S1.732 14.057.458 10zM14 10a4 4 0 11-8 0 4 4 0 018 0z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">No Activity Logs</h3>
                <p class="text-text-light">Strict no-logs policy ensures your online activities remain completely private.</p>
            </div>
        </div>

        <!-- Device Support -->
        <div class="bg-dark-surface rounded-lg border border-gray-700 p-8 mb-12 text-center">
            <h2 class="text-2xl font-orbitron font-bold text-white mb-4">Multi-Device Support</h2>
            <p class="text-text-light mb-6">Use SiteLock VPN on all your devices with a single subscription.</p>
            <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                <div class="text-center">
                    <div class="w-12 h-12 bg-neon-green rounded-lg flex items-center justify-center mx-auto mb-2">
                        <span class="text-dark-bg font-bold">📱</span>
                    </div>
                    <span class="text-text-light text-sm">Mobile</span>
                </div>
                <div class="text-center">
                    <div class="w-12 h-12 bg-electric-blue rounded-lg flex items-center justify-center mx-auto mb-2">
                        <span class="text-white font-bold">💻</span>
                    </div>
                    <span class="text-text-light text-sm">Desktop</span>
                </div>
                <div class="text-center">
                    <div class="w-12 h-12 bg-cyber-purple rounded-lg flex items-center justify-center mx-auto mb-2">
                        <span class="text-white font-bold">📱</span>
                    </div>
                    <span class="text-text-light text-sm">Tablet</span>
                </div>
                <div class="text-center">
                    <div class="w-12 h-12 bg-gray-600 rounded-lg flex items-center justify-center mx-auto mb-2">
                        <span class="text-white font-bold">🖥️</span>
                    </div>
                    <span class="text-text-light text-sm">Router</span>
                </div>
            </div>
        </div>

        <!-- CTA -->
        <div class="text-center">
            <a href="{$WEB_ROOT}/cart.php?a=add&pid=sitelockvpn" class="btn-primary">
                Get SiteLock VPN
            </a>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}