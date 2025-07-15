{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-20 px-4 sm:px-6 lg:px-8">
    <div class="max-w-6xl mx-auto">
        <!-- Header -->
        <div class="text-center mb-12">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                </svg>
            </div>
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                Domain Validated (DV) SSL Certificates
            </h1>
            <p class="text-lg text-text-light max-w-2xl mx-auto">
                Fast and affordable SSL certificates for basic website protection.
            </p>
        </div>

        {include file="$template/store/ssl/shared/nav.tpl"}

        <!-- DV SSL Benefits -->
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8 mb-12">
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-neon-green rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Quick Validation</h3>
                <p class="text-text-light">Domain ownership verified automatically in minutes, not days.</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-electric-blue rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Cost Effective</h3>
                <p class="text-text-light">Most affordable SSL option perfect for personal websites and blogs.</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-cyber-purple rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Full Encryption</h3>
                <p class="text-text-light">Same 256-bit encryption as premium certificates at a fraction of the cost.</p>
            </div>
        </div>

        {include file="$template/store/ssl/shared/certificate-pricing.tpl"}

        <!-- CTA -->
        <div class="text-center mt-12">
            <a href="{$WEB_ROOT}/cart.php?a=add&pid=ssl-dv" class="btn-primary">
                Order DV SSL Certificate
            </a>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}