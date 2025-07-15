{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-20 px-4 sm:px-6 lg:px-8">
    <div class="max-w-6xl mx-auto">
        <!-- Header -->
        <div class="text-center mb-12">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                </svg>
            </div>
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                360 Website Monitoring
            </h1>
            <p class="text-lg text-text-light max-w-2xl mx-auto">
                Comprehensive website monitoring to ensure your site is always online and performing optimally.
            </p>
        </div>

        <!-- Features -->
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8 mb-12">
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-neon-green rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M10 12a2 2 0 100-4 2 2 0 000 4z"/>
                        <path fill-rule="evenodd" d="M.458 10C1.732 5.943 5.522 3 10 3s8.268 2.943 9.542 7c-1.274 4.057-5.064 7-9.542 7S1.732 14.057.458 10zM14 10a4 4 0 11-8 0 4 4 0 018 0z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">24/7 Uptime Monitoring</h3>
                <p class="text-text-light">Continuous monitoring from multiple global locations to detect downtime instantly.</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-electric-blue rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M12 15v2m-6 0v2m6-10v6m-6-6v6m6-13v2m-6 0V4m6 5a2 2 0 100-4 2 2 0 000 4zm-6 0a2 2 0 100-4 2 2 0 000 4z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Performance Analytics</h3>
                <p class="text-text-light">Detailed performance metrics including load times, response codes, and trends.</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-cyber-purple rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M15 17h5l-5 5v-5zM4.828 7l2.536 2.536L6.95 10.95 2 6l4.95-4.95.414.414L4.828 4H10a7 7 0 017 7v2a1 1 0 11-2 0v-2a5 5 0 00-5-5H4.828z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Instant Alerts</h3>
                <p class="text-text-light">Get notified immediately via email, SMS, or webhook when issues are detected.</p>
            </div>
        </div>

        <!-- Monitoring Locations -->
        <div class="bg-dark-surface rounded-lg border border-gray-700 p-8 mb-12">
            <h2 class="text-2xl font-orbitron font-bold text-white mb-6 text-center">Global Monitoring Network</h2>
            <div class="grid md:grid-cols-4 gap-4 text-center">
                <div>
                    <div class="text-2xl mb-2">🇺🇸</div>
                    <div class="text-text-light text-sm">United States</div>
                </div>
                <div>
                    <div class="text-2xl mb-2">🇪🇺</div>
                    <div class="text-text-light text-sm">Europe</div>
                </div>
                <div>
                    <div class="text-2xl mb-2">🇦🇺</div>
                    <div class="text-text-light text-sm">Asia Pacific</div>
                </div>
                <div>
                    <div class="text-2xl mb-2">🌍</div>
                    <div class="text-text-light text-sm">More Locations</div>
                </div>
            </div>
        </div>

        <!-- CTA -->
        <div class="text-center">
            <a href="{$WEB_ROOT}/cart.php?a=add&pid=threesixtymonitoring" class="btn-primary">
                Start Monitoring
            </a>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}