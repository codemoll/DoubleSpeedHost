{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-20 px-4 sm:px-6 lg:px-8">
    <div class="max-w-6xl mx-auto">
        <!-- Header -->
        <div class="text-center mb-12">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z"/>
                </svg>
            </div>
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                Weebly Website Builder
            </h1>
            <p class="text-lg text-text-light max-w-2xl mx-auto">
                Create beautiful, professional websites with Weebly's powerful drag-and-drop builder.
            </p>
        </div>

        <!-- Features -->
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8 mb-12">
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-neon-green rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Drag & Drop Design</h3>
                <p class="text-text-light">Intuitive drag-and-drop interface makes building websites simple and fun.</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-electric-blue rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z"/>
                        <path fill-rule="evenodd" d="M4 5a2 2 0 012-2v1a1 1 0 102 0V3a2 2 0 012 2v6a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm2.5 7a1.5 1.5 0 100-3 1.5 1.5 0 000 3z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Mobile Optimized</h3>
                <p class="text-text-light">All websites are automatically optimized for mobile devices and tablets.</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-cyber-purple rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M3 1a1 1 0 000 2h1.22l.305 1.222a.997.997 0 00.01.042l1.358 5.43-.893.892C3.74 11.846 4.632 14 6.414 14H15a1 1 0 000-2H6.414l1-1H14a1 1 0 00.894-.553l3-6A1 1 0 0017 3H6.28l-.31-1.243A1 1 0 005 1H3zM16 16.5a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0zM6.5 18a1.5 1.5 0 100-3 1.5 1.5 0 000 3z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">E-commerce Ready</h3>
                <p class="text-text-light">Built-in e-commerce features to sell products and services online.</p>
            </div>
        </div>

        <!-- Templates -->
        <div class="bg-dark-surface rounded-lg border border-gray-700 p-8 mb-12">
            <h2 class="text-2xl font-orbitron font-bold text-white mb-6 text-center">Professional Templates</h2>
            <div class="grid md:grid-cols-3 gap-6">
                <div class="text-center">
                    <div class="bg-gray-600 rounded-lg h-32 mb-4 flex items-center justify-center">
                        <span class="text-white">Business Template</span>
                    </div>
                    <h4 class="text-white font-semibold">Business</h4>
                </div>
                <div class="text-center">
                    <div class="bg-gray-600 rounded-lg h-32 mb-4 flex items-center justify-center">
                        <span class="text-white">Portfolio Template</span>
                    </div>
                    <h4 class="text-white font-semibold">Portfolio</h4>
                </div>
                <div class="text-center">
                    <div class="bg-gray-600 rounded-lg h-32 mb-4 flex items-center justify-center">
                        <span class="text-white">Store Template</span>
                    </div>
                    <h4 class="text-white font-semibold">Online Store</h4>
                </div>
            </div>
        </div>

        <!-- CTA -->
        <div class="text-center">
            <a href="{$WEB_ROOT}/cart.php?a=add&pid=weebly" class="btn-primary">
                Start Building with Weebly
            </a>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}