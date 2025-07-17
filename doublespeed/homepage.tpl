{include file="$template/header.tpl"}

<!-- Hero Section -->
<section class="ds-header" style="position: relative; overflow: hidden; min-height: 100vh; display: flex; align-items: center; justify-content: center;">
    <!-- Animated Background Elements -->
    <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; pointer-events: none;">
        <div style="position: absolute; top: 80px; left: 40px; width: 256px; height: 256px; background: var(--ds-neon-green); opacity: 0.1; border-radius: 50%; filter: blur(64px); animation: float 3s ease-in-out infinite;"></div>
        <div style="position: absolute; bottom: 80px; right: 40px; width: 384px; height: 384px; background: var(--ds-electric-blue); opacity: 0.1; border-radius: 50%; filter: blur(64px); animation: float 3s ease-in-out infinite 1s;"></div>
        <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 192px; height: 192px; background: var(--ds-cyber-purple); opacity: 0.1; border-radius: 50%; filter: blur(64px); animation: float 3s ease-in-out infinite 2s;"></div>
    </div>
    
    <div class="container" style="position: relative; z-index: 10;">
        <div class="text-center">
            <h1 class="ds-hero-title">
                <span style="color: var(--ds-neon-green); text-shadow: 0 0 20px rgba(0, 255, 136, 0.5);">DoubleSpeed</span>
                <span class="text-white">Host</span>
            </h1>
            <p class="ds-hero-subtitle" style="max-width: 48rem; margin: 0 auto 2rem;">
                {if isset($templatefile) && is_array($templatefile) && $templatefile.herosubtitle}
                    {$templatefile.herosubtitle}
                {else}
                    Experience lightning-fast hosting with cutting-edge technology and 24/7 expert support.
                {/if}
            </p>
            <div class="d-flex flex-column flex-sm-row justify-content-center align-items-center mb-5">
                <a href="{$WEB_ROOT}/cart.php" class="btn btn-primary btn-lg me-sm-3 mb-3 mb-sm-0" style="padding: 12px 32px; font-size: 1.125rem;">
                    Get Started Now
                    <svg style="width: 20px; height: 20px; margin-left: 8px; display: inline;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7l5 5m0 0l-5 5m5-5H6"/>
                    </svg>
                </a>
                <a href="#features" class="btn btn-outline-primary btn-lg" style="padding: 12px 32px; font-size: 1.125rem;">
                    Learn More
                </a>
            </div>
            
            <!-- Stats -->
            <div class="row mt-5">
                <div class="col-6 col-md-3 text-center">
                    <div style="font-size: 2.5rem; font-family: 'Orbitron', monospace; font-weight: 700; color: var(--ds-neon-green); margin-bottom: 8px;">99.9%</div>
                    <div style="color: var(--ds-text-light); font-size: 0.875rem;">Uptime Guarantee</div>
                </div>
                <div class="col-6 col-md-3 text-center">
                    <div style="font-size: 2.5rem; font-family: 'Orbitron', monospace; font-weight: 700; color: var(--ds-electric-blue); margin-bottom: 8px;">24/7</div>
                    <div style="color: var(--ds-text-light); font-size: 0.875rem;">Expert Support</div>
                </div>
                <div class="col-6 col-md-3 text-center">
                    <div style="font-size: 2.5rem; font-family: 'Orbitron', monospace; font-weight: 700; color: var(--ds-cyber-purple); margin-bottom: 8px;">50K+</div>
                    <div style="color: var(--ds-text-light); font-size: 0.875rem;">Happy Clients</div>
                </div>
                <div class="text-center">
                    <div class="text-3xl md:text-4xl font-orbitron font-bold text-neon-green mb-2">&lt;100ms</div>
                    <div class="text-text-light text-sm">Response Time</div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Features Section -->
<section id="features" class="py-20 bg-dark-bg-alt">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
            <h2 class="text-4xl md:text-5xl font-orbitron font-bold mb-4">
                <span class="glow-text">Cutting-Edge</span> Features
            </h2>
            <p class="text-xl text-text-light max-w-3xl mx-auto">
                Discover why thousands of businesses trust DoubleSpeed Host for their web hosting needs.
            </p>
        </div>
        
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <!-- Feature 1 -->
            <div class="card-dark text-center group">
                <div class="w-16 h-16 bg-gradient-to-br from-neon-green to-electric-blue rounded-lg flex items-center justify-center mx-auto mb-6 group-hover:scale-110 transition-transform duration-300">
                    <svg class="w-8 h-8 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M11.3 1.046A1 1 0 0112 2v5h4a1 1 0 01.82 1.573l-7 10A1 1 0 018 18v-5H4a1 1 0 01-.82-1.573l7-10a1 1 0 011.12-.38z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-xl font-orbitron font-semibold text-white mb-4">Lightning Fast</h3>
                <p class="text-text-light">
                    SSD storage, CDN integration, and optimized servers ensure your website loads in milliseconds.
                </p>
            </div>
            
            <!-- Feature 2 -->
            <div class="card-dark text-center group">
                <div class="w-16 h-16 bg-gradient-to-br from-electric-blue to-cyber-purple rounded-lg flex items-center justify-center mx-auto mb-6 group-hover:scale-110 transition-transform duration-300">
                    <svg class="w-8 h-8 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M2.166 4.999A11.954 11.954 0 0010 1.944 11.954 11.954 0 0017.834 5c.11.65.166 1.32.166 2.001 0 5.225-3.34 9.67-8 11.317C5.34 16.67 2 12.225 2 7c0-.682.057-1.35.166-2.001zm11.541 3.708a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-xl font-orbitron font-semibold text-white mb-4">Secure & Reliable</h3>
                <p class="text-text-light">
                    Advanced security measures, daily backups, and 99.9% uptime guarantee keep your data safe.
                </p>
            </div>
            
            <!-- Feature 3 -->
            <div class="card-dark text-center group">
                <div class="w-16 h-16 bg-gradient-to-br from-cyber-purple to-neon-green rounded-lg flex items-center justify-center mx-auto mb-6 group-hover:scale-110 transition-transform duration-300">
                    <svg class="w-8 h-8 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-6-3a2 2 0 11-4 0 2 2 0 014 0zm-2 4a5 5 0 00-4.546 2.916A5.986 5.986 0 0010 16a5.986 5.986 0 004.546-2.084A5 5 0 0010 11z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-xl font-orbitron font-semibold text-white mb-4">Expert Support</h3>
                <p class="text-text-light">
                    24/7 technical support from hosting experts who actually know what they're talking about.
                </p>
            </div>
        </div>
    </div>
</section>

<!-- Pricing Section -->
<section id="pricing" class="py-20 bg-dark-bg">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
            <h2 class="text-4xl md:text-5xl font-orbitron font-bold mb-4">
                <span class="glow-text">Transparent</span> Pricing
            </h2>
            <p class="text-xl text-text-light max-w-3xl mx-auto">
                Choose the perfect plan for your needs. No hidden fees, no surprises.
            </p>
        </div>
        
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <!-- Basic Plan -->
            <div class="pricing-card">
                <div class="text-center mb-8">
                    <h3 class="text-2xl font-orbitron font-bold text-white mb-2">Basic</h3>
                    <div class="text-4xl font-bold text-neon-green mb-2">
                        $9.99<span class="text-lg text-text-light">/month</span>
                    </div>
                    <p class="text-text-light">Perfect for personal websites</p>
                </div>
                
                <ul class="space-y-4 mb-8">
                    <li class="flex items-center">
                        <svg class="w-5 h-5 text-neon-green mr-3" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-text-light">10GB SSD Storage</span>
                    </li>
                    <li class="flex items-center">
                        <svg class="w-5 h-5 text-neon-green mr-3" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-text-light">100GB Bandwidth</span>
                    </li>
                    <li class="flex items-center">
                        <svg class="w-5 h-5 text-neon-green mr-3" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-text-light">1 Website</span>
                    </li>
                    <li class="flex items-center">
                        <svg class="w-5 h-5 text-neon-green mr-3" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-text-light">Free SSL Certificate</span>
                    </li>
                </ul>
                
                <a href="{$WEB_ROOT}/cart.php?a=add&pid=1" class="btn-outline w-full text-center block">Choose Basic</a>
            </div>
            
            <!-- Standard Plan - Popular -->
            <div class="pricing-card relative border-neon-green">
                <div class="absolute -top-4 left-1/2 transform -translate-x-1/2">
                    <span class="bg-neon-green text-dark-bg px-4 py-1 rounded-full text-sm font-semibold">Most Popular</span>
                </div>
                
                <div class="text-center mb-8">
                    <h3 class="text-2xl font-orbitron font-bold text-white mb-2">Standard</h3>
                    <div class="text-4xl font-bold text-neon-green mb-2">
                        $19.99<span class="text-lg text-text-light">/month</span>
                    </div>
                    <p class="text-text-light">Great for growing businesses</p>
                </div>
                
                <ul class="space-y-4 mb-8">
                    <li class="flex items-center">
                        <svg class="w-5 h-5 text-neon-green mr-3" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-text-light">50GB SSD Storage</span>
                    </li>
                    <li class="flex items-center">
                        <svg class="w-5 h-5 text-neon-green mr-3" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-text-light">500GB Bandwidth</span>
                    </li>
                    <li class="flex items-center">
                        <svg class="w-5 h-5 text-neon-green mr-3" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-text-light">5 Websites</span>
                    </li>
                    <li class="flex items-center">
                        <svg class="w-5 h-5 text-neon-green mr-3" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-text-light">Free SSL & Daily Backups</span>
                    </li>
                </ul>
                
                <a href="{$WEB_ROOT}/cart.php?a=add&pid=2" class="btn-primary w-full text-center block">Choose Standard</a>
            </div>
            
            <!-- Premium Plan -->
            <div class="pricing-card">
                <div class="text-center mb-8">
                    <h3 class="text-2xl font-orbitron font-bold text-white mb-2">Premium</h3>
                    <div class="text-4xl font-bold text-neon-green mb-2">
                        $39.99<span class="text-lg text-text-light">/month</span>
                    </div>
                    <p class="text-text-light">For high-traffic websites</p>
                </div>
                
                <ul class="space-y-4 mb-8">
                    <li class="flex items-center">
                        <svg class="w-5 h-5 text-neon-green mr-3" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-text-light">200GB SSD Storage</span>
                    </li>
                    <li class="flex items-center">
                        <svg class="w-5 h-5 text-neon-green mr-3" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-text-light">Unlimited Bandwidth</span>
                    </li>
                    <li class="flex items-center">
                        <svg class="w-5 h-5 text-neon-green mr-3" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-text-light">Unlimited Websites</span>
                    </li>
                    <li class="flex items-center">
                        <svg class="w-5 h-5 text-neon-green mr-3" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                        </svg>
                        <span class="text-text-light">Priority Support & CDN</span>
                    </li>
                </ul>
                
                <a href="{$WEB_ROOT}/cart.php?a=add&pid=3" class="btn-outline w-full text-center block">Choose Premium</a>
            </div>
        </div>
    </div>
</section>

<!-- Testimonials Section -->
<section class="py-20 bg-dark-bg-alt">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
            <h2 class="text-4xl md:text-5xl font-orbitron font-bold mb-4">
                What Our <span class="glow-text">Clients Say</span>
            </h2>
            <p class="text-xl text-text-light max-w-3xl mx-auto">
                Don't just take our word for it. See what our satisfied customers have to say.
            </p>
        </div>
        
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <!-- Testimonial 1 -->
            <div class="card-dark">
                <div class="flex items-center mb-4">
                    <div class="w-12 h-12 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center">
                        <span class="text-dark-bg font-bold">JS</span>
                    </div>
                    <div class="ml-4">
                        <h4 class="text-white font-semibold">John Smith</h4>
                        <p class="text-text-light text-sm">CEO, TechStart Inc.</p>
                    </div>
                </div>
                <p class="text-text-light italic">
                    "DoubleSpeed Host has been incredible. Our website loads lightning fast and their support team is always there when we need them. Highly recommended!"
                </p>
                <div class="flex mt-4">
                    {for $i=1 to 5}
                        <svg class="w-5 h-5 text-neon-green" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                        </svg>
                    {/for}
                </div>
            </div>
            
            <!-- Testimonial 2 -->
            <div class="card-dark">
                <div class="flex items-center mb-4">
                    <div class="w-12 h-12 bg-gradient-to-br from-electric-blue to-cyber-purple rounded-full flex items-center justify-center">
                        <span class="text-dark-bg font-bold">MJ</span>
                    </div>
                    <div class="ml-4">
                        <h4 class="text-white font-semibold">Maria Johnson</h4>
                        <p class="text-text-light text-sm">Founder, Digital Agency</p>
                    </div>
                </div>
                <p class="text-text-light italic">
                    "Switched to DoubleSpeed from another host and the difference is night and day. Performance is amazing and the migration was seamless."
                </p>
                <div class="flex mt-4">
                    {for $i=1 to 5}
                        <svg class="w-5 h-5 text-neon-green" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                        </svg>
                    {/for}
                </div>
            </div>
            
            <!-- Testimonial 3 -->
            <div class="card-dark">
                <div class="flex items-center mb-4">
                    <div class="w-12 h-12 bg-gradient-to-br from-cyber-purple to-neon-green rounded-full flex items-center justify-center">
                        <span class="text-dark-bg font-bold">RW</span>
                    </div>
                    <div class="ml-4">
                        <h4 class="text-white font-semibold">Robert Wilson</h4>
                        <p class="text-text-light text-sm">E-commerce Owner</p>
                    </div>
                </div>
                <p class="text-text-light italic">
                    "Our online store has never been faster. Customer satisfaction is up and our conversion rates have improved significantly since moving to DoubleSpeed."
                </p>
                <div class="flex mt-4">
                    {for $i=1 to 5}
                        <svg class="w-5 h-5 text-neon-green" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                        </svg>
                    {/for}
                </div>
            </div>
        </div>
    </div>
</section>

{include file="$template/footer.tpl"}