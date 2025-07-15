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
                SiteLock Website Security
            </h1>
            <p class="text-lg text-text-light max-w-2xl mx-auto">
                Protect your website from malware, hackers, and other security threats with comprehensive security monitoring.
            </p>
        </div>

        <!-- Features -->
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8 mb-12">
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-neon-green rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Malware Scanning</h3>
                <p class="text-text-light">Daily automated scans to detect malware, viruses, and security vulnerabilities.</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-electric-blue rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M2.166 4.999A11.954 11.954 0 0010 1.944 11.954 11.954 0 0017.834 5c.11.65.166 1.32.166 2.001 0 5.225-3.34 9.67-8 11.317C5.34 16.67 2 12.225 2 7c0-.682.057-1.35.166-2.001zm11.541 3.708a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Firewall Protection</h3>
                <p class="text-text-light">Web application firewall blocks malicious traffic before it reaches your site.</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-cyber-purple rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M4 2a1 1 0 011 1v2.586l8.707 8.707a1 1 0 010 1.414L12.293 17.12a1 1 0 01-1.414 0L2.172 8.414a1 1 0 010-1.414L3.586 5.586V3a1 1 0 011-1h8a1 1 0 110 2H5v1.586l6.707 6.707 1.414-1.414L6.414 5H4V2z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Automatic Cleanup</h3>
                <p class="text-text-light">Automatically remove malware and restore your website to a clean state.</p>
            </div>
        </div>

        <!-- Security Badge -->
        <div class="bg-dark-surface rounded-lg border border-gray-700 p-8 mb-12 text-center">
            <h2 class="text-2xl font-orbitron font-bold text-white mb-4">Security Trust Badge</h2>
            <p class="text-text-light mb-6">Display a SiteLock security badge on your website to build visitor trust and confidence.</p>
            <div class="inline-block bg-neon-green text-dark-bg px-6 py-3 rounded-lg font-bold">
                🔒 SECURED BY SITELOCK
            </div>
        </div>

        <!-- CTA -->
        <div class="text-center">
            <a href="{$WEB_ROOT}/cart.php?a=add&pid=sitelock" class="btn-primary">
                Secure Your Website
            </a>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}