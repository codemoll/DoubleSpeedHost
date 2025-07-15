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
                XoviNow SEO Suite
            </h1>
            <p class="text-lg text-text-light max-w-2xl mx-auto">
                Professional SEO tools and analytics to optimize your website and improve search rankings.
            </p>
        </div>

        <!-- Features -->
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8 mb-12">
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-neon-green rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M7 3a1 1 0 000 2h6a1 1 0 100-2H7zM4 7a1 1 0 011-1h10a1 1 0 110 2H5a1 1 0 01-1-1zM2 11a2 2 0 012-2h12a2 2 0 012 2v4a2 2 0 01-2 2H4a2 2 0 01-2-2v-4z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Keyword Monitoring</h3>
                <p class="text-text-light">Track your keyword rankings across multiple search engines in real-time.</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-electric-blue rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Website Analysis</h3>
                <p class="text-text-light">Comprehensive website audits with actionable SEO recommendations.</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-cyber-purple rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z"/>
                        <path fill-rule="evenodd" d="M4 5a2 2 0 012-2v1a1 1 0 102 0V3a2 2 0 012 2v6a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm2.5 7a1.5 1.5 0 100-3 1.5 1.5 0 000 3z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Competitor Analysis</h3>
                <p class="text-text-light">Monitor competitor rankings and discover new keyword opportunities.</p>
            </div>
        </div>

        <!-- Analytics Dashboard -->
        <div class="bg-dark-surface rounded-lg border border-gray-700 p-8 mb-12">
            <h2 class="text-2xl font-orbitron font-bold text-white mb-6 text-center">Comprehensive Analytics</h2>
            <div class="grid md:grid-cols-4 gap-6">
                <div class="text-center">
                    <div class="text-3xl font-bold text-neon-green mb-2">📊</div>
                    <h4 class="text-white font-semibold mb-2">Rankings</h4>
                    <p class="text-text-light text-sm">Track keyword positions</p>
                </div>
                <div class="text-center">
                    <div class="text-3xl font-bold text-electric-blue mb-2">🔍</div>
                    <h4 class="text-white font-semibold mb-2">Keywords</h4>
                    <p class="text-text-light text-sm">Research & monitor</p>
                </div>
                <div class="text-center">
                    <div class="text-3xl font-bold text-cyber-purple mb-2">🎯</div>
                    <h4 class="text-white font-semibold mb-2">Competition</h4>
                    <p class="text-text-light text-sm">Analyze competitors</p>
                </div>
                <div class="text-center">
                    <div class="text-3xl font-bold text-gray-400 mb-2">📈</div>
                    <h4 class="text-white font-semibold mb-2">Reports</h4>
                    <p class="text-text-light text-sm">Detailed insights</p>
                </div>
            </div>
        </div>

        <!-- CTA -->
        <div class="text-center">
            <a href="{$WEB_ROOT}/cart.php?a=add&pid=xovinow" class="btn-primary">
                Start SEO Analysis
            </a>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}