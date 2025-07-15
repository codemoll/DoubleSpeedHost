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
                SSL Certificate Chooser
            </h1>
            <p class="text-lg text-text-light max-w-2xl mx-auto">
                Find the perfect SSL certificate for your needs with our interactive guide.
            </p>
        </div>

        <!-- SSL Selection Form -->
        <div class="bg-dark-surface rounded-lg border border-gray-700 p-8 mb-12">
            <form class="space-y-6">
                <div>
                    <label class="block text-white font-semibold mb-2">What type of website do you have?</label>
                    <div class="grid md:grid-cols-3 gap-4">
                        <label class="ssl-option">
                            <input type="radio" name="website_type" value="personal" class="hidden">
                            <div class="ssl-option-content">
                                <h3>Personal/Blog</h3>
                                <p>Basic website or blog</p>
                            </div>
                        </label>
                        
                        <label class="ssl-option">
                            <input type="radio" name="website_type" value="business" class="hidden">
                            <div class="ssl-option-content">
                                <h3>Business</h3>
                                <p>Company website</p>
                            </div>
                        </label>
                        
                        <label class="ssl-option">
                            <input type="radio" name="website_type" value="ecommerce" class="hidden">
                            <div class="ssl-option-content">
                                <h3>E-commerce</h3>
                                <p>Online store</p>
                            </div>
                        </label>
                    </div>
                </div>
                
                <div>
                    <label class="block text-white font-semibold mb-2">How many domains do you need to secure?</label>
                    <div class="grid md:grid-cols-3 gap-4">
                        <label class="ssl-option">
                            <input type="radio" name="domain_count" value="single" class="hidden">
                            <div class="ssl-option-content">
                                <h3>Single Domain</h3>
                                <p>One domain only</p>
                            </div>
                        </label>
                        
                        <label class="ssl-option">
                            <input type="radio" name="domain_count" value="multiple" class="hidden">
                            <div class="ssl-option-content">
                                <h3>Multiple Domains</h3>
                                <p>2-250 domains</p>
                            </div>
                        </label>
                        
                        <label class="ssl-option">
                            <input type="radio" name="domain_count" value="wildcard" class="hidden">
                            <div class="ssl-option-content">
                                <h3>Subdomains</h3>
                                <p>All subdomains</p>
                            </div>
                        </label>
                    </div>
                </div>
                
                <div class="text-center">
                    <button type="button" onclick="findSSL()" class="btn-primary">
                        Find My SSL Certificate
                    </button>
                </div>
            </form>
        </div>

        <!-- Recommendation Result -->
        <div id="ssl-recommendation" class="hidden bg-dark-surface rounded-lg border border-neon-green p-8">
            <h2 class="text-2xl font-orbitron font-bold text-white mb-4 text-center">Recommended SSL Certificate</h2>
            <div id="recommendation-content"></div>
        </div>
    </div>
</div>

<style>
.ssl-option {
    @apply cursor-pointer;
}
.ssl-option-content {
    @apply border border-gray-600 rounded-lg p-4 hover:border-neon-green transition-colors;
}
.ssl-option input:checked + .ssl-option-content {
    @apply border-neon-green bg-neon-green bg-opacity-10;
}
.ssl-option-content h3 {
    @apply text-white font-semibold mb-1;
}
.ssl-option-content p {
    @apply text-text-light text-sm;
}
</style>

<script>
function findSSL() {
    const websiteType = document.querySelector('input[name="website_type"]:checked')?.value;
    const domainCount = document.querySelector('input[name="domain_count"]:checked')?.value;
    
    if (!websiteType || !domainCount) {
        alert('Please answer both questions to get a recommendation.');
        return;
    }
    
    let recommendation = '';
    
    if (websiteType === 'personal' && domainCount === 'single') {
        recommendation = 'Domain Validated (DV) SSL - Perfect for personal websites and blogs.';
    } else if (websiteType === 'business') {
        recommendation = 'Organization Validated (OV) SSL - Ideal for business websites with verified company information.';
    } else if (websiteType === 'ecommerce') {
        recommendation = 'Extended Validation (EV) SSL - Maximum trust for e-commerce sites with green address bar.';
    } else if (domainCount === 'wildcard') {
        recommendation = 'Wildcard SSL - Secures unlimited subdomains with a single certificate.';
    } else {
        recommendation = 'Multi-Domain SSL - Secure multiple domains with one certificate.';
    }
    
    document.getElementById('recommendation-content').innerHTML = 
        '<p class="text-text-light text-center mb-6">' + recommendation + '</p>' +
        '<div class="text-center">' +
        '<a href="/cart.php?a=add&pid=ssl" class="btn-primary">Order Now</a>' +
        '</div>';
    
    document.getElementById('ssl-recommendation').classList.remove('hidden');
}
</script>

{include file="$template/footer.tpl"}