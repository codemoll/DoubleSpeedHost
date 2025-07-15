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
                Organization Validated (OV) SSL Certificates
            </h1>
            <p class="text-lg text-text-light max-w-2xl mx-auto">
                Enhanced SSL certificates with verified business identity for increased customer trust.
            </p>
        </div>

        {include file="$template/store/ssl/shared/nav.tpl"}

        <!-- OV SSL Benefits -->
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8 mb-12">
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-neon-green rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Business Verification</h3>
                <p class="text-text-light">Your business identity is verified and displayed in the certificate details.</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-electric-blue rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M2.166 4.999A11.954 11.954 0 0010 1.944 11.954 11.954 0 0017.834 5c.11.65.166 1.32.166 2.001 0 5.225-3.34 9.67-8 11.317C5.34 16.67 2 12.225 2 7c0-.682.057-1.35.166-2.001zm11.541 3.708a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Enhanced Trust</h3>
                <p class="text-text-light">Customers see your verified business name when they view the certificate.</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <div class="w-12 h-12 bg-cyber-purple rounded-lg flex items-center justify-center mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Higher Warranty</h3>
                <p class="text-text-light">$500,000 warranty protection, double that of DV certificates.</p>
            </div>
        </div>

        <!-- Validation Process -->
        <div class="bg-dark-surface rounded-lg border border-gray-700 p-8 mb-12">
            <h2 class="text-2xl font-orbitron font-bold text-white mb-6 text-center">Validation Process</h2>
            <div class="grid md:grid-cols-3 gap-6">
                <div class="text-center">
                    <div class="w-16 h-16 bg-neon-green rounded-full flex items-center justify-center mx-auto mb-4">
                        <span class="text-dark-bg font-bold text-xl">1</span>
                    </div>
                    <h3 class="text-white font-semibold mb-2">Submit Application</h3>
                    <p class="text-text-light text-sm">Provide business documentation and domain verification.</p>
                </div>
                
                <div class="text-center">
                    <div class="w-16 h-16 bg-electric-blue rounded-full flex items-center justify-center mx-auto mb-4">
                        <span class="text-white font-bold text-xl">2</span>
                    </div>
                    <h3 class="text-white font-semibold mb-2">Business Verification</h3>
                    <p class="text-text-light text-sm">Certificate Authority verifies your business information.</p>
                </div>
                
                <div class="text-center">
                    <div class="w-16 h-16 bg-cyber-purple rounded-full flex items-center justify-center mx-auto mb-4">
                        <span class="text-white font-bold text-xl">3</span>
                    </div>
                    <h3 class="text-white font-semibold mb-2">Certificate Issued</h3>
                    <p class="text-text-light text-sm">Receive your OV SSL certificate within 1-3 business days.</p>
                </div>
            </div>
        </div>

        <!-- CTA -->
        <div class="text-center mt-12">
            <a href="{$WEB_ROOT}/cart.php?a=add&pid=ssl-ov" class="btn-primary">
                Order OV SSL Certificate
            </a>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}