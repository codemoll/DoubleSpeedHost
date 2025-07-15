{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-8">
    <div class="container mx-auto px-4">
        <div class="max-w-4xl mx-auto">
            <!-- Page Header -->
            <div class="text-center mb-8">
                <h1 class="text-3xl font-bold text-white mb-4">
                    <i class="fas fa-plus-circle mr-3 text-neon-green"></i>
                    Configure SSL Certificate
                </h1>
                <p class="text-gray-400">
                    Secure your website with an SSL certificate
                </p>
            </div>

            {if $errormessage}
                {include file="$template/includes/alert.tpl" type="error" message=$errormessage}
            {/if}

            {if $successmessage}
                {include file="$template/includes/alert.tpl" type="success" message=$successmessage}
            {/if}

            <div class="bg-dark-surface rounded-xl border border-gray-700 p-6">
                <form action="{$WEB_ROOT}/configuressl.php" method="post">
                    <input type="hidden" name="id" value="{$id}" />
                    
                    <!-- SSL Certificate Type -->
                    <div class="mb-8">
                        <h2 class="text-xl font-semibold text-white mb-4">
                            <i class="fas fa-shield-alt mr-2 text-electric-blue"></i>
                            Choose SSL Certificate Type
                        </h2>
                        
                        <div class="grid md:grid-cols-3 gap-6">
                            {foreach from=$ssl_types item=ssl}
                                <label class="block">
                                    <div class="bg-dark-bg rounded-lg border border-gray-600 p-6 hover:border-neon-green cursor-pointer transition-colors duration-300 {if $ssl.selected}border-neon-green bg-neon-green/10{/if}">
                                        <div class="text-center">
                                            <input type="radio" 
                                                   name="ssl_type" 
                                                   value="{$ssl.type}" 
                                                   {if $ssl.selected}checked{/if}
                                                   class="text-neon-green bg-dark-bg border-gray-600 focus:ring-neon-green mb-3">
                                            
                                            <div class="text-2xl mb-3">
                                                <i class="fas {$ssl.icon} text-neon-green"></i>
                                            </div>
                                            
                                            <h3 class="text-white font-semibold text-lg mb-2">{$ssl.name}</h3>
                                            <p class="text-gray-400 text-sm mb-3">{$ssl.description}</p>
                                            
                                            <div class="text-neon-green font-bold text-xl">{$ssl.price}</div>
                                            {if $ssl.savings}
                                                <div class="text-green-400 text-sm">{$ssl.savings}</div>
                                            {/if}
                                        </div>
                                        
                                        {if $ssl.features}
                                            <div class="mt-4 pt-4 border-t border-gray-600">
                                                <ul class="text-sm space-y-1">
                                                    {foreach from=$ssl.features item=feature}
                                                        <li class="flex items-center text-gray-300">
                                                            <i class="fas fa-check text-neon-green mr-2"></i>
                                                            {$feature}
                                                        </li>
                                                    {/foreach}
                                                </ul>
                                            </div>
                                        {/if}
                                    </div>
                                </label>
                            {/foreach}
                        </div>
                    </div>

                    <!-- Domain Selection -->
                    <div class="mb-8">
                        <h2 class="text-xl font-semibold text-white mb-4">
                            <i class="fas fa-globe mr-2 text-cyber-purple"></i>
                            Select Domain
                        </h2>
                        
                        <div class="bg-dark-bg rounded-lg border border-gray-600 p-4">
                            {if $domains}
                                <select name="domain" class="w-full bg-dark-bg border border-gray-600 rounded-lg px-4 py-3 text-white focus:border-cyber-purple focus:ring-2 focus:ring-cyber-purple/50 transition-all duration-300">
                                    <option value="">Select a domain...</option>
                                    {foreach from=$domains item=domain}
                                        <option value="{$domain.name}" {if $domain.selected}selected{/if}>
                                            {$domain.name}
                                        </option>
                                    {/foreach}
                                </select>
                            {else}
                                <div class="text-center py-8">
                                    <div class="text-gray-400 mb-4">
                                        <i class="fas fa-info-circle text-4xl mb-2"></i>
                                        <p>No domains found in your account.</p>
                                    </div>
                                    <a href="{$WEB_ROOT}/cart.php?a=add&domain=register" class="bg-neon-green text-dark-bg font-semibold py-2 px-6 rounded-lg hover:shadow-neon-green/50 hover:shadow-lg transition-all duration-300">
                                        Register a Domain
                                    </a>
                                </div>
                            {/if}
                        </div>
                    </div>

                    <!-- Additional Options -->
                    <div class="mb-8">
                        <h2 class="text-xl font-semibold text-white mb-4">
                            <i class="fas fa-cogs mr-2 text-electric-blue"></i>
                            Configuration Options
                        </h2>
                        
                        <div class="space-y-4">
                            <label class="flex items-center">
                                <input type="checkbox" name="auto_install" value="1" class="text-neon-green bg-dark-bg border-gray-600 rounded focus:ring-neon-green">
                                <span class="ml-3 text-white">
                                    Auto-install SSL certificate
                                    <span class="block text-gray-400 text-sm">Automatically install and configure the SSL certificate on your hosting account</span>
                                </span>
                            </label>
                            
                            <label class="flex items-center">
                                <input type="checkbox" name="auto_renew" value="1" class="text-neon-green bg-dark-bg border-gray-600 rounded focus:ring-neon-green">
                                <span class="ml-3 text-white">
                                    Enable auto-renewal
                                    <span class="block text-gray-400 text-sm">Automatically renew the SSL certificate before expiration</span>
                                </span>
                            </label>
                        </div>
                    </div>

                    <!-- Order Summary -->
                    <div class="bg-dark-bg rounded-lg border border-gray-600 p-6 mb-8">
                        <h3 class="text-lg font-semibold text-white mb-4">
                            <i class="fas fa-receipt mr-2 text-neon-green"></i>
                            Order Summary
                        </h3>
                        
                        <div id="order-summary">
                            <div class="text-gray-400 text-center py-4">
                                Select an SSL certificate type to see pricing
                            </div>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="text-center">
                        <button type="submit" class="bg-neon-green text-dark-bg font-bold py-4 px-8 rounded-lg hover:shadow-neon-green/50 hover:shadow-lg transition-all duration-300 text-lg">
                            <i class="fas fa-shield-alt mr-2"></i>
                            Add SSL Certificate to Cart
                        </button>
                        
                        <div class="mt-4">
                            <a href="{$WEB_ROOT}/clientarea.php" class="text-gray-400 hover:text-neon-green transition-colors">
                                <i class="fas fa-arrow-left mr-1"></i>
                                Back to Client Area
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
// Update order summary when SSL type changes
document.addEventListener('DOMContentLoaded', function() {
    const sslInputs = document.querySelectorAll('input[name="ssl_type"]');
    const orderSummary = document.getElementById('order-summary');
    
    sslInputs.forEach(input => {
        input.addEventListener('change', function() {
            // Update order summary based on selection
            // This would typically be done via AJAX
        });
    });
});
</script>

{include file="$template/footer.tpl"}