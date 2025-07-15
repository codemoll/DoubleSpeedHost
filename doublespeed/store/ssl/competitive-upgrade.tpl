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
                Upgrade Your SSL Certificate
            </h1>
            <p class="text-lg text-text-light max-w-2xl mx-auto">
                Switch to our premium SSL certificates for better security, higher warranties, and enhanced customer trust.
            </p>
        </div>

        <!-- Current vs New Comparison -->
        <div class="grid md:grid-cols-2 gap-8 mb-12">
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <h2 class="text-xl font-orbitron font-bold text-white mb-6 text-center">Your Current SSL</h2>
                <div class="space-y-4">
                    <div class="flex justify-between items-center">
                        <span class="text-text-light">Validation Level:</span>
                        <span class="text-white">Basic Domain</span>
                    </div>
                    <div class="flex justify-between items-center">
                        <span class="text-text-light">Warranty:</span>
                        <span class="text-white">$250,000</span>
                    </div>
                    <div class="flex justify-between items-center">
                        <span class="text-text-light">Business Identity:</span>
                        <span class="text-red-400">Not Verified</span>
                    </div>
                    <div class="flex justify-between items-center">
                        <span class="text-text-light">Green Address Bar:</span>
                        <span class="text-red-400">No</span>
                    </div>
                    <div class="flex justify-between items-center">
                        <span class="text-text-light">Trust Level:</span>
                        <span class="text-yellow-400">Basic</span>
                    </div>
                </div>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-neon-green p-6 relative">
                <div class="absolute -top-3 left-1/2 transform -translate-x-1/2 bg-neon-green text-dark-bg px-4 py-1 rounded-full text-sm font-semibold">Recommended</div>
                <h2 class="text-xl font-orbitron font-bold text-white mb-6 text-center">Extended Validation SSL</h2>
                <div class="space-y-4">
                    <div class="flex justify-between items-center">
                        <span class="text-text-light">Validation Level:</span>
                        <span class="text-neon-green">Extended Validation</span>
                    </div>
                    <div class="flex justify-between items-center">
                        <span class="text-text-light">Warranty:</span>
                        <span class="text-neon-green">$1,000,000</span>
                    </div>
                    <div class="flex justify-between items-center">
                        <span class="text-text-light">Business Identity:</span>
                        <span class="text-neon-green">Fully Verified</span>
                    </div>
                    <div class="flex justify-between items-center">
                        <span class="text-text-light">Green Address Bar:</span>
                        <span class="text-neon-green">Yes</span>
                    </div>
                    <div class="flex justify-between items-center">
                        <span class="text-text-light">Trust Level:</span>
                        <span class="text-neon-green">Maximum</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Why Upgrade -->
        <div class="bg-dark-surface rounded-lg border border-gray-700 p-8 mb-12">
            <h2 class="text-2xl font-orbitron font-bold text-white mb-6 text-center">Why Upgrade Your SSL?</h2>
            <div class="grid md:grid-cols-3 gap-6">
                <div class="text-center">
                    <div class="w-16 h-16 bg-neon-green rounded-full flex items-center justify-center mx-auto mb-4">
                        <svg class="w-8 h-8 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M2.166 4.999A11.954 11.954 0 0010 1.944 11.954 11.954 0 0017.834 5c.11.65.166 1.32.166 2.001 0 5.225-3.34 9.67-8 11.317C5.34 16.67 2 12.225 2 7c0-.682.057-1.35.166-2.001zm11.541 3.708a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                    </svg>
                </div>
                    <h3 class="text-white font-semibold mb-2">Enhanced Trust</h3>
                    <p class="text-text-light text-sm">Build maximum customer confidence with verified business identity and green address bar.</p>
                </div>
                
                <div class="text-center">
                    <div class="w-16 h-16 bg-electric-blue rounded-full flex items-center justify-center mx-auto mb-4">
                        <svg class="w-8 h-8 text-white" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                        </svg>
                    </div>
                    <h3 class="text-white font-semibold mb-2">Higher Conversion</h3>
                    <p class="text-text-light text-sm">Studies show EV SSL certificates can increase conversion rates by up to 15%.</p>
                </div>
                
                <div class="text-center">
                    <div class="w-16 h-16 bg-cyber-purple rounded-full flex items-center justify-center mx-auto mb-4">
                        <svg class="w-8 h-8 text-white" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M3 3a1 1 0 000 2v8a2 2 0 002 2h2.586l-1.293 1.293a1 1 0 101.414 1.414L10 15.414l2.293 2.293a1 1 0 001.414-1.414L12.414 15H15a2 2 0 002-2V5a1 1 0 100-2H3zm11.707 4.707a1 1 0 00-1.414-1.414L10 9.586 8.707 8.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                        </svg>
                    </div>
                    <h3 class="text-white font-semibold mb-2">Better Protection</h3>
                    <p class="text-text-light text-sm">4x higher warranty coverage and the most rigorous validation process available.</p>
                </div>
            </div>
        </div>

        <!-- Upgrade Options -->
        <div class="grid md:grid-cols-2 gap-8 mb-12">
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <h3 class="text-xl font-semibold text-white mb-4">Organization Validated (OV) SSL</h3>
                <div class="text-electric-blue text-2xl font-bold mb-4">$59.99/year</div>
                <ul class="text-text-light space-y-2 mb-6">
                    <li>• Business identity verification</li>
                    <li>• $500,000 warranty</li>
                    <li>• Company name in certificate</li>
                    <li>• 1-3 day issuance</li>
                    <li>• Better customer trust</li>
                </ul>
                <a href="{$WEB_ROOT}/cart.php?a=add&pid=ssl-ov&upgrade=1" class="btn-outline w-full block text-center">
                    Upgrade to OV SSL
                </a>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-neon-green p-6 relative">
                <div class="absolute -top-3 left-1/2 transform -translate-x-1/2 bg-neon-green text-dark-bg px-4 py-1 rounded-full text-sm font-semibold">Best Value</div>
                <h3 class="text-xl font-semibold text-white mb-4">Extended Validation (EV) SSL</h3>
                <div class="text-neon-green text-2xl font-bold mb-4">$149.99/year</div>
                <ul class="text-text-light space-y-2 mb-6">
                    <li>• Green address bar</li>
                    <li>• $1,000,000 warranty</li>
                    <li>• Maximum trust level</li>
                    <li>• Rigorous validation</li>
                    <li>• Highest conversion rates</li>
                </ul>
                <a href="{$WEB_ROOT}/cart.php?a=add&pid=ssl-ev&upgrade=1" class="btn-primary w-full block text-center">
                    Upgrade to EV SSL
                </a>
            </div>
        </div>

        <!-- Migration Help -->
        <div class="bg-dark-surface rounded-lg border border-gray-700 p-8 text-center">
            <h2 class="text-2xl font-orbitron font-bold text-white mb-4">Need Help with Migration?</h2>
            <p class="text-text-light mb-6 max-w-2xl mx-auto">
                Our SSL experts can help you seamlessly migrate from your current certificate to a premium SSL 
                with zero downtime. Contact us for a free consultation.
            </p>
            <div class="flex flex-col sm:flex-row gap-4 justify-center">
                <a href="{$WEB_ROOT}/contact.php" class="btn-outline">
                    Contact SSL Expert
                </a>
                <a href="{$WEB_ROOT}/knowledgebase.php?action=displaycat&catid=ssl" class="btn-outline">
                    View SSL Guides
                </a>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}