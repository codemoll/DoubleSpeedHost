{include file="$template/header.tpl"}

{* Debug Mode - Only show when debug is enabled in template settings *}
{if isset($template_debug_mode) && $template_debug_mode}
    <div class="container mx-auto px-4 py-4">
        <div class="bg-yellow-900 border border-yellow-600 rounded-lg p-4 mb-4">
            <h3 class="text-yellow-300 font-bold mb-2">🐛 Debug Mode: Products Template</h3>
            <div class="text-yellow-200 text-sm space-y-2">
                <div><strong>Product Groups:</strong> {if isset($productgroups)}{if is_array($productgroups)}Array with {count($productgroups)} groups{else}Type: {gettype($productgroups)}{/if}{else}Not set{/if}</div>
                {if isset($productgroups) && is_array($productgroups) && count($productgroups) > 0}
                    <div><strong>Sample Group:</strong> 
                        {foreach from=$productgroups item=pg name=debug_loop}
                            {if $smarty.foreach.debug_loop.first}
                                Name: {if isset($pg.name)}{$pg.name}{else}N/A{/if}, 
                                Products: {if isset($pg.products) && is_array($pg.products)}{count($pg.products)} items{else}N/A{/if}
                            {/if}
                        {/foreach}
                    </div>
                {/if}
                <div><strong>Template File:</strong> products.tpl</div>
                <div><strong>Timestamp:</strong> {$smarty.now|date_format:"%Y-%m-%d %H:%M:%S"}</div>
            </div>
        </div>
    </div>
{/if}

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
                Our Products & Services
            </h1>
            <p class="text-lg text-text-light max-w-2xl mx-auto">
                Choose from our range of hosting solutions designed to power your online presence.
            </p>
        </div>

        {if isset($productgroups) && is_array($productgroups) && count($productgroups) > 0}
            {foreach from=$productgroups item=productgroup}
                <div class="mb-12">
                    <div class="text-center mb-8">
                        <h2 class="text-2xl font-orbitron font-bold text-white mb-4">
                            {if isset($productgroup.name) && $productgroup.name}
                                {$productgroup.name}
                            {elseif isset($productgroup.groupname) && $productgroup.groupname}
                                {$productgroup.groupname}
                            {else}
                                Products & Services
                            {/if}
                        </h2>
                        {if isset($productgroup.description) && $productgroup.description}
                            <p class="text-text-light max-w-3xl mx-auto">{$productgroup.description}</p>
                        {elseif isset($productgroup.desc) && $productgroup.desc}
                            <p class="text-text-light max-w-3xl mx-auto">{$productgroup.desc}</p>
                        {/if}
                    </div>
                    
                    {if isset($productgroup.products) && is_array($productgroup.products) && count($productgroup.products) > 0}
                        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 lg:gap-8">
                            {foreach from=$productgroup.products item=product}
                                <div class="card-dark hover:border-neon-green transition-all duration-300 group flex flex-col">
                                    <div class="text-center mb-6">
                                        <h3 class="text-xl font-orbitron font-semibold text-white mb-2">
                                            {if isset($product.name) && $product.name}
                                                {$product.name}
                                            {elseif isset($product.productname) && $product.productname}
                                                {$product.productname}
                                            {else}
                                                Hosting Plan
                                            {/if}
                                        </h3>
                                        {if isset($product.description) && $product.description}
                                            <p class="text-text-light text-sm">{$product.description|strip_tags|truncate:120}</p>
                                        {elseif isset($product.desc) && $product.desc}
                                            <p class="text-text-light text-sm">{$product.desc|strip_tags|truncate:120}</p>
                                        {/if}
                                    </div>
                                    
                                    {* Enhanced pricing display with multiple fallback options *}
                                    <div class="text-center mb-6">
                                        <div class="text-3xl font-bold text-neon-green mb-2">
                                            {if isset($product.pricing) && is_array($product.pricing)}
                                                {if isset($product.pricing.monthly) && $product.pricing.monthly}
                                                    {$product.pricing.monthly}
                                                {elseif isset($product.pricing.annually) && $product.pricing.annually}
                                                    {$product.pricing.annually}
                                                {elseif isset($product.pricing.oneoff) && $product.pricing.oneoff}
                                                    {$product.pricing.oneoff}
                                                {elseif isset($product.pricing.setup) && $product.pricing.setup}
                                                    {$product.pricing.setup}
                                                {else}
                                                    Contact Us
                                                {/if}
                                            {elseif isset($product.price) && $product.price}
                                                {$product.price}
                                            {elseif isset($product.monthly) && $product.monthly}
                                                {$product.monthly}
                                            {elseif isset($product.annually) && $product.annually}
                                                {$product.annually}
                                            {else}
                                                Contact Us
                                            {/if}
                                        </div>
                                        <div class="text-text-light text-sm">
                                            {if isset($product.pricing) && is_array($product.pricing)}
                                                {if isset($product.pricing.monthly) && $product.pricing.monthly}
                                                    /month
                                                {elseif isset($product.pricing.annually) && $product.pricing.annually}
                                                    /year
                                                {/if}
                                            {elseif isset($product.billingcycle) && $product.billingcycle}
                                                {if $product.billingcycle eq 'monthly'}/month{/if}
                                                {if $product.billingcycle eq 'annually'}/year{/if}
                                                {if $product.billingcycle eq 'quarterly'}/quarter{/if}
                                            {elseif isset($product.monthly) && $product.monthly}
                                                /month
                                            {elseif isset($product.annually) && $product.annually}
                                                /year
                                            {/if}
                                        </div>
                                    </div>
                                    
                                    {* Enhanced features display *}
                                    {if isset($product.features) && is_array($product.features) && count($product.features) > 0}
                                        <div class="space-y-3 mb-6 flex-grow">
                                            {foreach from=$product.features item=feature name=features}
                                                {if $smarty.foreach.features.index < 5}
                                                    <div class="flex items-start space-x-3">
                                                        <svg class="w-5 h-5 text-neon-green flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                                                        </svg>
                                                        <span class="text-white text-sm">
                                                            {if is_array($feature)}
                                                                {if isset($feature.feature)}{$feature.feature}{elseif isset($feature.name)}{$feature.name}{else}Feature{/if}
                                                            {else}
                                                                {$feature}
                                                            {/if}
                                                        </span>
                                                    </div>
                                                {/if}
                                            {/foreach}
                                            {if count($product.features) > 5}
                                                <div class="text-text-light text-xs italic">
                                                    +{count($product.features) - 5} more features
                                                </div>
                                            {/if}
                                        </div>
                                    {elseif isset($product.configoptions) && is_array($product.configoptions) && count($product.configoptions) > 0}
                                        <div class="space-y-3 mb-6 flex-grow">
                                            {foreach from=$product.configoptions item=config name=configs}
                                                {if $smarty.foreach.configs.index < 5}
                                                    <div class="flex items-start space-x-3">
                                                        <svg class="w-5 h-5 text-electric-blue flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                                                        </svg>
                                                        <span class="text-white text-sm">
                                                            {if isset($config.optionname)}{$config.optionname}{elseif isset($config.name)}{$config.name}{else}Configuration Option{/if}
                                                        </span>
                                                    </div>
                                                {/if}
                                            {/foreach}
                                        </div>
                                    {/if}
                                    
                                    <div class="space-y-3 mt-auto">
                                        {assign var="product_id" value="{if isset($product.pid) && $product.pid}{$product.pid}{elseif isset($product.id) && $product.id}{$product.id}{else}1{/if}"}
                                        <a href="{$WEB_ROOT}/cart.php?a=add&pid={$product_id}" 
                                           class="btn-primary w-full group-hover:bg-gradient-to-r group-hover:from-neon-green group-hover:to-electric-blue">
                                            Order Now
                                        </a>
                                        {if (isset($product.configoptions) && $product.configoptions) || (isset($product.customfields) && $product.customfields)}
                                            <a href="{$WEB_ROOT}/cart.php?a=confproduct&i={$product_id}" 
                                               class="btn-outline w-full">
                                                Configure
                                            </a>
                                        {/if}
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    {else}
                        <div class="text-center py-8">
                            <div class="bg-gray-800 border border-gray-600 rounded-lg p-6">
                                <svg class="w-12 h-12 text-gray-400 mx-auto mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-2.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 009.586 13H7"/>
                                </svg>
                                <h3 class="text-gray-300 font-semibold mb-2">No Products Available</h3>
                                <p class="text-gray-400">No products are currently available in this category. Please check back later or contact support.</p>
                            </div>
                        </div>
                    {/if}
                </div>
            {/foreach}
        {else}
            <!-- Enhanced fallback when no product groups available -->
            <div class="text-center py-12 mb-8">
                <div class="bg-orange-900 border border-orange-600 rounded-lg p-8 max-w-2xl mx-auto">
                    <svg class="w-16 h-16 text-orange-400 mx-auto mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                    <h2 class="text-orange-300 font-orbitron font-bold text-xl mb-3">Products Temporarily Unavailable</h2>
                    <p class="text-orange-200 mb-4">
                        Our product catalog is currently being updated. Please contact our sales team for current pricing and availability.
                    </p>
                    <div class="space-y-3">
                        <a href="{$WEB_ROOT}/contact.php" class="btn-primary inline-block">
                            Contact Sales
                        </a>
                        <a href="{$WEB_ROOT}/supportticketsubmit.php" class="btn-outline inline-block ml-4">
                            Get Support
                        </a>
                    </div>
                </div>
            </div>
            
            <!-- Default products when no data available -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 lg:gap-8">
                <!-- Basic Hosting -->
                <div class="card-dark hover:border-neon-green transition-all duration-300 group flex flex-col">
                    <div class="text-center mb-6">
                        <h3 class="text-xl font-orbitron font-semibold text-white mb-2">Basic Hosting</h3>
                        <p class="text-text-light text-sm">Perfect for personal websites and blogs</p>
                    </div>
                    
                    <div class="text-center mb-6">
                        <div class="text-3xl font-bold text-neon-green mb-2">$9.99</div>
                        <div class="text-text-light text-sm">/month</div>
                    </div>
                    
                    <div class="space-y-3 mb-6 flex-grow">
                        <div class="flex items-start space-x-3">
                            <svg class="w-5 h-5 text-neon-green flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">10 GB SSD Storage</span>
                        </div>
                        <div class="flex items-start space-x-3">
                            <svg class="w-5 h-5 text-neon-green flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">100 GB Bandwidth</span>
                        </div>
                        <div class="flex items-start space-x-3">
                            <svg class="w-5 h-5 text-neon-green flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">5 Email Accounts</span>
                        </div>
                        <div class="flex items-start space-x-3">
                            <svg class="w-5 h-5 text-neon-green flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">Free SSL Certificate</span>
                        </div>
                    </div>
                    
                    <div class="mt-auto">
                        <a href="{$WEB_ROOT}/cart.php?a=add&pid=1" class="btn-primary w-full group-hover:bg-gradient-to-r group-hover:from-neon-green group-hover:to-electric-blue">
                            Order Now
                        </a>
                    </div>
                </div>

                <!-- Standard Hosting -->
                <div class="card-dark hover:border-electric-blue transition-all duration-300 group border-electric-blue relative flex flex-col">
                    <div class="absolute -top-3 left-1/2 transform -translate-x-1/2">
                        <span class="bg-electric-blue text-dark-bg px-4 py-1 rounded-full text-sm font-semibold">Most Popular</span>
                    </div>
                    
                    <div class="text-center mb-6 mt-4">
                        <h3 class="text-xl font-orbitron font-semibold text-white mb-2">Standard Hosting</h3>
                        <p class="text-text-light text-sm">Great for growing businesses and portfolios</p>
                    </div>
                    
                    <div class="text-center mb-6">
                        <div class="text-3xl font-bold text-electric-blue mb-2">$19.99</div>
                        <div class="text-text-light text-sm">/month</div>
                    </div>
                    
                    <div class="space-y-3 mb-6 flex-grow">
                        <div class="flex items-start space-x-3">
                            <svg class="w-5 h-5 text-electric-blue flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">50 GB SSD Storage</span>
                        </div>
                        <div class="flex items-start space-x-3">
                            <svg class="w-5 h-5 text-electric-blue flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">500 GB Bandwidth</span>
                        </div>
                        <div class="flex items-start space-x-3">
                            <svg class="w-5 h-5 text-electric-blue flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">Unlimited Email</span>
                        </div>
                        <div class="flex items-start space-x-3">
                            <svg class="w-5 h-5 text-electric-blue flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">Free Domain + SSL</span>
                        </div>
                    </div>
                    
                    <div class="mt-auto">
                        <a href="{$WEB_ROOT}/cart.php?a=add&pid=2" class="btn-primary w-full bg-electric-blue group-hover:bg-gradient-to-r group-hover:from-electric-blue group-hover:to-cyber-purple">
                            Order Now
                        </a>
                    </div>
                </div>

                <!-- Premium Hosting -->
                <div class="card-dark hover:border-cyber-purple transition-all duration-300 group flex flex-col">
                    <div class="text-center mb-6">
                        <h3 class="text-xl font-orbitron font-semibold text-white mb-2">Premium Hosting</h3>
                        <p class="text-text-light text-sm">Maximum performance for high-traffic sites</p>
                    </div>
                    
                    <div class="text-center mb-6">
                        <div class="text-3xl font-bold text-cyber-purple mb-2">$39.99</div>
                        <div class="text-text-light text-sm">/month</div>
                    </div>
                    
                    <div class="space-y-3 mb-6 flex-grow">
                        <div class="flex items-start space-x-3">
                            <svg class="w-5 h-5 text-cyber-purple flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">200 GB SSD Storage</span>
                        </div>
                        <div class="flex items-start space-x-3">
                            <svg class="w-5 h-5 text-cyber-purple flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">Unlimited Bandwidth</span>
                        </div>
                        <div class="flex items-start space-x-3">
                            <svg class="w-5 h-5 text-cyber-purple flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">Unlimited Everything</span>
                        </div>
                        <div class="flex items-start space-x-3">
                            <svg class="w-5 h-5 text-cyber-purple flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">Priority Support</span>
                        </div>
                    </div>
                    
                    <div class="mt-auto">
                        <a href="{$WEB_ROOT}/cart.php?a=add&pid=3" class="btn-primary w-full group-hover:bg-gradient-to-r group-hover:from-cyber-purple group-hover:to-neon-green">
                            Order Now
                        </a>
                    </div>
                </div>
            </div>
        {/if}

        <!-- Additional Services -->
        <div class="mt-16">
            <div class="text-center mb-12">
                <h2 class="text-3xl font-orbitron font-bold text-white mb-4">Additional Services</h2>
                <p class="text-text-light max-w-2xl mx-auto">Enhance your hosting experience with our premium add-ons and services.</p>
            </div>
            
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                <div class="card-dark text-center hover:border-neon-green transition-colors duration-300">
                    <svg class="w-12 h-12 text-neon-green mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                    </svg>
                    <h3 class="text-white font-semibold mb-2">SSL Certificates</h3>
                    <p class="text-text-light text-sm mb-4">Secure your website with premium SSL certificates</p>
                    <a href="{$WEB_ROOT}/cart.php?gid=addons" class="btn-outline w-full">Learn More</a>
                </div>
                
                <div class="card-dark text-center hover:border-electric-blue transition-colors duration-300">
                    <svg class="w-12 h-12 text-electric-blue mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z"/>
                    </svg>
                    <h3 class="text-white font-semibold mb-2">Website Backups</h3>
                    <p class="text-text-light text-sm mb-4">Automated daily backups for peace of mind</p>
                    <a href="{$WEB_ROOT}/cart.php?gid=addons" class="btn-outline w-full">Learn More</a>
                </div>
                
                <div class="card-dark text-center hover:border-cyber-purple transition-colors duration-300">
                    <svg class="w-12 h-12 text-cyber-purple mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                        <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                    </svg>
                    <h3 class="text-white font-semibold mb-2">Email Hosting</h3>
                    <p class="text-text-light text-sm mb-4">Professional email solutions for your business</p>
                    <a href="{$WEB_ROOT}/cart.php?gid=addons" class="btn-outline w-full">Learn More</a>
                </div>
                
                <div class="card-dark text-center hover:border-neon-green transition-colors duration-300">
                    <svg class="w-12 h-12 text-neon-green mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-2 0c0 .993-.241 1.929-.668 2.754l-1.524-1.525a3 3 0 00-1.366-1.366l-1.525-1.524c.825-.427 1.761-.668 2.754-.668 2.21 0 4 1.79 4 4zm-6 0a2 2 0 11-4 0 2 2 0 014 0zm-6 0c0-.993.241-1.929.668-2.754L6.192 5.721A6.988 6.988 0 004 10a7 7 0 1014 0c0-1.19-.307-2.311-.845-3.279L15.63 8.246A3 3 0 0013 11.732V14a1 1 0 11-2 0v-2.268A3 3 0 019.268 10H7a1 1 0 110-2h2.268A3 3 0 0111.732 6V4a1 1 0 112 0v2.268A3 3 0 0115.732 8h.537c-.427-.825-1.04-1.562-1.792-2.123z" clip-rule="evenodd"/>
                    </svg>
                    <h3 class="text-white font-semibold mb-2">Site Migration</h3>
                    <p class="text-text-light text-sm mb-4">Free website migration from your current host</p>
                    <a href="{$WEB_ROOT}/contact.php" class="btn-outline w-full">Contact Us</a>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}