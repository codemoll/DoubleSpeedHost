{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-20 px-4 sm:px-6 lg:px-8">
    <div class="max-w-6xl mx-auto">
        <!-- Header -->
        <div class="text-center mb-12">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                </svg>
            </div>
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                Extended Validation (EV) SSL Certificates
            </h1>
            <p class="text-lg text-text-light max-w-2xl mx-auto">
                The highest level of SSL security with green address bar for maximum customer trust.
            </p>
        </div>

        {include file="$template/store/ssl/shared/nav.tpl"}

        <!-- EV SSL Benefits -->
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8 mb-12">
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-neon-green rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Green Address Bar</h3>
                <p class="text-text-light">Displays your company name in green in the browser address bar.</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-electric-blue rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M2.166 4.999A11.954 11.954 0 0010 1.944 11.954 11.954 0 0017.834 5c.11.65.166 1.32.166 2.001 0 5.225-3.34 9.67-8 11.317C5.34 16.67 2 12.225 2 7c0-.682.057-1.35.166-2.001zm11.541 3.708a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Rigorous Validation</h3>
                <p class="text-text-light">Extensive legal and operational verification of your business.</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-cyber-purple rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">$1M Warranty</h3>
                <p class="text-text-light">Highest warranty protection available with SSL certificates.</p>
            </div>
        </div>

        <!-- Green Bar Demo -->
        <div class="bg-dark-surface rounded-lg border border-gray-700 p-8 mb-12">
            <h2 class="text-2xl font-orbitron font-bold text-white mb-6 text-center">Green Address Bar Example</h2>
            <div class="max-w-2xl mx-auto">
                <div class="bg-gray-100 rounded-lg p-4 mb-4">
                    <div class="flex items-center space-x-2">
                        <div class="w-4 h-4 bg-green-500 rounded-full"></div>
                        <span class="text-green-600 font-semibold">Your Company Name Inc.</span>
                        <span class="text-gray-600">- https://yourdomain.com</span>
                        <div class="w-4 h-4 bg-gray-400 rounded"></div>
                    </div>
                </div>
                <p class="text-text-light text-center">
                    EV SSL certificates display your verified company name in green, giving customers
                    maximum confidence in your website's authenticity and security.
                </p>
            </div>
        </div>

        <!-- Requirements -->
        <div class="bg-dark-surface rounded-lg border border-gray-700 p-8 mb-12">
            <h2 class="text-2xl font-orbitron font-bold text-white mb-6 text-center">EV SSL Requirements</h2>
            <div class="grid md:grid-cols-2 gap-8">
                <div>
                    <h3 class="text-lg font-semibold text-white mb-4">Required Documents</h3>
                    <ul class="text-text-light space-y-2">
                        <li>• Legal business registration documents</li>
                        <li>• Verified business address</li>
                        <li>• Operational phone number</li>
                        <li>• Authorized contact person verification</li>
                        <li>• Domain ownership verification</li>
                    </ul>
                </div>
                
                <div>
                    <h3 class="text-lg font-semibold text-white mb-4">Validation Timeline</h3>
                    <ul class="text-text-light space-y-2">
                        <li>• Initial review: 1-2 business days</li>
                        <li>• Document verification: 2-3 business days</li>
                        <li>• Phone verification: 1 business day</li>
                        <li>• Certificate issuance: Same day after approval</li>
                        <li>• Total time: 3-7 business days</li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- CTA -->
        <div class="text-center">
            <a href="{$WEB_ROOT}/cart.php?a=add&pid=ssl-ev" class="btn-primary">
                Order EV SSL Certificate
            </a>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}