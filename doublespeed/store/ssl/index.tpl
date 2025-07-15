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
                SSL Certificates
            </h1>
            <p class="text-lg text-text-light max-w-2xl mx-auto">
                Secure your website and build customer trust with industry-leading SSL certificates.
            </p>
        </div>

        {include file="$template/store/ssl/shared/nav.tpl"}

        <!-- SSL Types -->
        <div class="grid md:grid-cols-3 gap-8 mb-12">
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-neon-green rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Domain Validated (DV)</h3>
                <p class="text-text-light mb-4">Basic SSL protection for individual websites and blogs.</p>
                <a href="{$WEB_ROOT}/store/ssl/dv" class="btn-outline w-full">Learn More</a>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-electric-blue rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Organization Validated (OV)</h3>
                <p class="text-text-light mb-4">Enhanced SSL with organization verification for businesses.</p>
                <a href="{$WEB_ROOT}/store/ssl/ov" class="btn-outline w-full">Learn More</a>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-cyber-purple rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Extended Validation (EV)</h3>
                <p class="text-text-light mb-4">Premium SSL with green address bar for maximum trust.</p>
                <a href="{$WEB_ROOT}/store/ssl/ev" class="btn-outline w-full">Learn More</a>
            </div>
        </div>

        {include file="$template/store/ssl/shared/features.tpl"}
        {include file="$template/store/ssl/shared/logos.tpl"}

        <!-- CTA -->
        <div class="text-center">
            <a href="{$WEB_ROOT}/store/ssl/shared/chooser" class="btn-primary">
                Choose Your SSL Certificate
            </a>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}