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
                WP Toolkit for Plesk
            </h1>
            <p class="text-lg text-text-light max-w-2xl mx-auto">
                Advanced WordPress management tools integrated with Plesk hosting panel.
            </p>
        </div>

        <!-- Features -->
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8 mb-12">
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-neon-green rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Smart Updates</h3>
                <p class="text-text-light">Intelligent update management that keeps your WordPress sites current and secure.</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-electric-blue rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M12 15v2m-6 0v2m6-10v6m-6-6v6m6-13v2m-6 0V4m6 5a2 2 0 100-4 2 2 0 000 4zm-6 0a2 2 0 100-4 2 2 0 000 4z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Performance Optimization</h3>
                <p class="text-text-light">Built-in caching and optimization tools to boost your WordPress site performance.</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-cyber-purple rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M9 12l2 2 4-4m5.07-1.07a2.121 2.121 0 00-2.828-2.828L10 11.414l-1.414-1.414a2.121 2.121 0 00-2.828 2.828l1.414 1.414L10 11.414l2.828 2.828 1.414-1.414L11.414 10l2.828-2.828z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Security Hardening</h3>
                <p class="text-text-light">Advanced security features including malware scanning and firewall protection.</p>
            </div>
        </div>

        <!-- CTA -->
        <div class="text-center">
            <a href="{$WEB_ROOT}/cart.php?a=add&pid=wp-toolkit-plesk" class="btn-primary">
                Get WP Toolkit for Plesk
            </a>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}