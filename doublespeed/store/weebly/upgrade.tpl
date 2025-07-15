{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-20 px-4 sm:px-6 lg:px-8">
    <div class="max-w-6xl mx-auto">
        <!-- Header -->
        <div class="text-center mb-12">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M7 3a1 1 0 000 2h6a1 1 0 100-2H7zM4 7a1 1 0 011-1h10a1 1 0 110 2H5a1 1 0 01-1-1zM2 11a2 2 0 012-2h12a2 2 0 012 2v4a2 2 0 01-2 2H4a2 2 0 01-2-2v-4z"/>
                </svg>
            </div>
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                Upgrade Weebly Plan
            </h1>
            <p class="text-lg text-text-light max-w-2xl mx-auto">
                Unlock premium features and advanced functionality with a Weebly plan upgrade.
            </p>
        </div>

        <!-- Upgrade Plans -->
        <div class="grid md:grid-cols-3 gap-8 mb-12">
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <h3 class="text-xl font-semibold text-white mb-4">Pro Plan</h3>
                <div class="text-neon-green text-2xl font-bold mb-4">$12/month</div>
                <ul class="text-text-light space-y-2 mb-6">
                    <li>• Remove Weebly Ads</li>
                    <li>• Connect Your Domain</li>
                    <li>• Site Search</li>
                    <li>• HD Video & Audio</li>
                    <li>• Password Protection</li>
                </ul>
                <a href="{$WEB_ROOT}/cart.php?a=add&pid=weebly-pro" class="btn-primary w-full block text-center">
                    Upgrade to Pro
                </a>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-neon-green p-6 relative">
                <div class="absolute -top-3 left-1/2 transform -translate-x-1/2 bg-neon-green text-dark-bg px-4 py-1 rounded-full text-sm font-semibold">Most Popular</div>
                <h3 class="text-xl font-semibold text-white mb-4">Business Plan</h3>
                <div class="text-neon-green text-2xl font-bold mb-4">$25/month</div>
                <ul class="text-text-light space-y-2 mb-6">
                    <li>• Everything in Pro</li>
                    <li>• Phone Support</li>
                    <li>• Lead Capture</li>
                    <li>• Advanced Stats</li>
                    <li>• Shopping Cart</li>
                </ul>
                <a href="{$WEB_ROOT}/cart.php?a=add&pid=weebly-business" class="btn-primary w-full block text-center">
                    Upgrade to Business
                </a>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <h3 class="text-xl font-semibold text-white mb-4">Performance Plan</h3>
                <div class="text-neon-green text-2xl font-bold mb-4">$38/month</div>
                <ul class="text-text-light space-y-2 mb-6">
                    <li>• Everything in Business</li>
                    <li>• Real-time Shipping</li>
                    <li>• Inventory Management</li>
                    <li>• Tax Calculator</li>
                    <li>• Abandoned Cart Recovery</li>
                </ul>
                <a href="{$WEB_ROOT}/cart.php?a=add&pid=weebly-performance" class="btn-primary w-full block text-center">
                    Upgrade to Performance
                </a>
            </div>
        </div>

        <!-- Benefits -->
        <div class="text-center">
            <h2 class="text-2xl font-orbitron font-bold text-white mb-4">Why Upgrade?</h2>
            <p class="text-text-light max-w-2xl mx-auto">
                Upgrade your Weebly plan to unlock advanced features, remove advertisements, and access professional tools to grow your online presence.
            </p>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}