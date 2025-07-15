{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-20 px-4 sm:px-6 lg:px-8">
    <div class="max-w-6xl mx-auto">
        <!-- Header -->
        <div class="text-center mb-12">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M9 12l2 2 4-4m5.07-1.07a2.121 2.121 0 00-2.828-2.828L10 11.414l-1.414-1.414a2.121 2.121 0 00-2.828 2.828l1.414 1.414L10 11.414l2.828 2.828 1.414-1.414L11.414 10l2.828-2.828z"/>
                </svg>
            </div>
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                CodeGuard Website Backup
            </h1>
            <p class="text-lg text-text-light max-w-2xl mx-auto">
                Automated daily backups to protect your website from data loss, hacking, and human error.
            </p>
        </div>

        <!-- Features -->
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8 mb-12">
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-neon-green rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M3 17a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1v-2zM3 10a1 1 0 011-1h12a1 1 0 011 1v4a1 1 0 01-1 1H4a1 1 0 01-1-1v-4zM3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Automated Daily Backups</h3>
                <p class="text-text-light">Complete website backups performed automatically every day without interruption to your site.</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-electric-blue rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M12 15v2m-6 0v2m6-10v6m-6-6v6m6-13v2m-6 0V4m6 5a2 2 0 100-4 2 2 0 000 4zm-6 0a2 2 0 100-4 2 2 0 000 4z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Change Monitoring</h3>
                <p class="text-text-light">Real-time monitoring of file changes with instant alerts for unauthorized modifications.</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-cyber-purple rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M4 2a1 1 0 011 1v2.586l8.707 8.707a1 1 0 010 1.414L12.293 17.12a1 1 0 01-1.414 0L2.172 8.414a1 1 0 010-1.414L3.586 5.586V3a1 1 0 011-1h8a1 1 0 110 2H5v1.586l6.707 6.707 1.414-1.414L6.414 5H4V2z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">One-Click Restore</h3>
                <p class="text-text-light">Restore your entire website or individual files with a single click from any backup point.</p>
            </div>
        </div>

        <!-- Pricing -->
        <div class="bg-dark-surface rounded-lg border border-gray-700 p-8 mb-12">
            <div class="text-center">
                <h2 class="text-2xl font-orbitron font-bold text-white mb-4">Pricing Plans</h2>
                <div class="grid md:grid-cols-3 gap-6">
                    <div class="border border-gray-600 rounded-lg p-6">
                        <h3 class="text-lg font-semibold text-white mb-2">Basic</h3>
                        <p class="text-neon-green text-2xl font-bold mb-4">$2.95/mo</p>
                        <ul class="text-text-light text-sm space-y-2">
                            <li>• 1 Website</li>
                            <li>• Daily Backups</li>
                            <li>• 30-Day History</li>
                        </ul>
                    </div>
                    <div class="border border-neon-green rounded-lg p-6 relative">
                        <div class="absolute -top-3 left-1/2 transform -translate-x-1/2 bg-neon-green text-dark-bg px-4 py-1 rounded-full text-sm font-semibold">Popular</div>
                        <h3 class="text-lg font-semibold text-white mb-2">Pro</h3>
                        <p class="text-neon-green text-2xl font-bold mb-4">$5.95/mo</p>
                        <ul class="text-text-light text-sm space-y-2">
                            <li>• 5 Websites</li>
                            <li>• Daily Backups</li>
                            <li>• 90-Day History</li>
                        </ul>
                    </div>
                    <div class="border border-gray-600 rounded-lg p-6">
                        <h3 class="text-lg font-semibold text-white mb-2">Business</h3>
                        <p class="text-neon-green text-2xl font-bold mb-4">$9.95/mo</p>
                        <ul class="text-text-light text-sm space-y-2">
                            <li>• 10 Websites</li>
                            <li>• Daily Backups</li>
                            <li>• 1-Year History</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- CTA -->
        <div class="text-center">
            <a href="{$WEB_ROOT}/cart.php?a=add&pid=codeguard" class="btn-primary">
                Protect Your Website Now
            </a>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}