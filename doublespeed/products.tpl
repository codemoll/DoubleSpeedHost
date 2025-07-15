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
                Our Products & Services
            </h1>
            <p class="text-lg text-text-light max-w-2xl mx-auto">
                Choose from our range of hosting solutions designed to power your online presence.
            </p>
        </div>

        {if $productgroups}
            {foreach from=$productgroups item=productgroup}
                <div class="mb-12">
                    <div class="text-center mb-8">
                        <h2 class="text-2xl font-orbitron font-bold text-white mb-4">{$productgroup.name}</h2>
                        {if $productgroup.description}
                            <p class="text-text-light max-w-3xl mx-auto">{$productgroup.description}</p>
                        {/if}
                    </div>
                    
                    {if $productgroup.products}
                        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                            {foreach from=$productgroup.products item=product}
                                <div class="card-dark hover:border-neon-green transition-all duration-300 group">
                                    <div class="text-center mb-6">
                                        <h3 class="text-xl font-orbitron font-semibold text-white mb-2">{$product.name}</h3>
                                        {if $product.description}
                                            <p class="text-text-light text-sm">{$product.description|strip_tags|truncate:120}</p>
                                        {/if}
                                    </div>
                                    
                                    {if $product.pricing}
                                        <div class="text-center mb-6">
                                            <div class="text-3xl font-bold text-neon-green mb-2">
                                                {if $product.pricing.monthly}
                                                    {$product.pricing.monthly}
                                                {elseif $product.pricing.annually}
                                                    {$product.pricing.annually}
                                                {elseif $product.pricing.oneoff}
                                                    {$product.pricing.oneoff}
                                                {else}
                                                    Contact Us
                                                {/if}
                                            </div>
                                            {if $product.pricing.monthly}
                                                <div class="text-text-light text-sm">/month</div>
                                            {elseif $product.pricing.annually}
                                                <div class="text-text-light text-sm">/year</div>
                                            {/if}
                                        </div>
                                    {/if}
                                    
                                    {if $product.features}
                                        <div class="space-y-3 mb-6">
                                            {foreach from=$product.features item=feature name=features}
                                                {if $smarty.foreach.features.index < 5}
                                                    <div class="flex items-center space-x-3">
                                                        <svg class="w-5 h-5 text-neon-green flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                                                        </svg>
                                                        <span class="text-white text-sm">{$feature}</span>
                                                    </div>
                                                {/if}
                                            {/foreach}
                                        </div>
                                    {/if}
                                    
                                    <div class="text-center">
                                        <a href="{$WEB_ROOT}/cart.php?a=add&pid={$product.pid}" class="btn-primary w-full group-hover:bg-gradient-to-r group-hover:from-neon-green group-hover:to-electric-blue">
                                            Order Now
                                        </a>
                                        {if $product.configoptions}
                                            <a href="{$WEB_ROOT}/cart.php?a=confproduct&i={$product.pid}" class="btn-outline w-full mt-2">
                                                Configure
                                            </a>
                                        {/if}
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    {/if}
                </div>
            {/foreach}
        {else}
            <!-- Default products when no data available -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                <!-- Basic Hosting -->
                <div class="card-dark hover:border-neon-green transition-all duration-300 group">
                    <div class="text-center mb-6">
                        <h3 class="text-xl font-orbitron font-semibold text-white mb-2">Basic Hosting</h3>
                        <p class="text-text-light text-sm">Perfect for personal websites and blogs</p>
                    </div>
                    
                    <div class="text-center mb-6">
                        <div class="text-3xl font-bold text-neon-green mb-2">$9.99</div>
                        <div class="text-text-light text-sm">/month</div>
                    </div>
                    
                    <div class="space-y-3 mb-6">
                        <div class="flex items-center space-x-3">
                            <svg class="w-5 h-5 text-neon-green flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">10 GB SSD Storage</span>
                        </div>
                        <div class="flex items-center space-x-3">
                            <svg class="w-5 h-5 text-neon-green flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">100 GB Bandwidth</span>
                        </div>
                        <div class="flex items-center space-x-3">
                            <svg class="w-5 h-5 text-neon-green flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">5 Email Accounts</span>
                        </div>
                        <div class="flex items-center space-x-3">
                            <svg class="w-5 h-5 text-neon-green flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">Free SSL Certificate</span>
                        </div>
                    </div>
                    
                    <div class="text-center">
                        <a href="{$WEB_ROOT}/cart.php?a=add&pid=1" class="btn-primary w-full group-hover:bg-gradient-to-r group-hover:from-neon-green group-hover:to-electric-blue">
                            Order Now
                        </a>
                    </div>
                </div>

                <!-- Standard Hosting -->
                <div class="card-dark hover:border-electric-blue transition-all duration-300 group border-electric-blue">
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
                    
                    <div class="space-y-3 mb-6">
                        <div class="flex items-center space-x-3">
                            <svg class="w-5 h-5 text-electric-blue flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">50 GB SSD Storage</span>
                        </div>
                        <div class="flex items-center space-x-3">
                            <svg class="w-5 h-5 text-electric-blue flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">500 GB Bandwidth</span>
                        </div>
                        <div class="flex items-center space-x-3">
                            <svg class="w-5 h-5 text-electric-blue flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">Unlimited Email</span>
                        </div>
                        <div class="flex items-center space-x-3">
                            <svg class="w-5 h-5 text-electric-blue flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">Free Domain + SSL</span>
                        </div>
                    </div>
                    
                    <div class="text-center">
                        <a href="{$WEB_ROOT}/cart.php?a=add&pid=2" class="btn-primary w-full bg-electric-blue group-hover:bg-gradient-to-r group-hover:from-electric-blue group-hover:to-cyber-purple">
                            Order Now
                        </a>
                    </div>
                </div>

                <!-- Premium Hosting -->
                <div class="card-dark hover:border-cyber-purple transition-all duration-300 group">
                    <div class="text-center mb-6">
                        <h3 class="text-xl font-orbitron font-semibold text-white mb-2">Premium Hosting</h3>
                        <p class="text-text-light text-sm">Maximum performance for high-traffic sites</p>
                    </div>
                    
                    <div class="text-center mb-6">
                        <div class="text-3xl font-bold text-cyber-purple mb-2">$39.99</div>
                        <div class="text-text-light text-sm">/month</div>
                    </div>
                    
                    <div class="space-y-3 mb-6">
                        <div class="flex items-center space-x-3">
                            <svg class="w-5 h-5 text-cyber-purple flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">200 GB SSD Storage</span>
                        </div>
                        <div class="flex items-center space-x-3">
                            <svg class="w-5 h-5 text-cyber-purple flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">Unlimited Bandwidth</span>
                        </div>
                        <div class="flex items-center space-x-3">
                            <svg class="w-5 h-5 text-cyber-purple flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">Unlimited Everything</span>
                        </div>
                        <div class="flex items-center space-x-3">
                            <svg class="w-5 h-5 text-cyber-purple flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">Priority Support</span>
                        </div>
                    </div>
                    
                    <div class="text-center">
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