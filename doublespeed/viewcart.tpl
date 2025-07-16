{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-20 px-4 sm:px-6 lg:px-8">
    <div class="checkout-container">
        <!-- Header -->
        <div class="text-center mb-8">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-4">Shopping Cart</h1>
            <p class="text-text-light">Review your order before proceeding to checkout</p>
        </div>

        {if $errormessage}
            <div class="bg-red-900 border border-red-700 rounded-lg p-4 mb-6">
                <div class="flex">
                    <svg class="w-5 h-5 text-red-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                    </svg>
                    <div class="text-red-200 text-sm">
                        {$errormessage}
                    </div>
                </div>
            </div>
        {/if}

        <div class="checkout-grid">
            <!-- Cart Items -->
            <div class="checkout-main">
                {if $products}
                    <div class="space-y-6">
                        {foreach from=$products item=product key=num}
                            <div class="checkout-card">
                                <div class="flex flex-col lg:flex-row lg:items-start lg:justify-between gap-4">
                                    <div class="flex-1 min-w-0">
                                        <h3 class="text-lg font-semibold text-white mb-2 truncate">{$product.product}</h3>
                                        {if $product.domain}
                                            <p class="text-text-light mb-2">Domain: {$product.domain}</p>
                                        {/if}
                                        {if $product.productdescription}
                                            <p class="text-text-light text-sm mb-4">{$product.productdescription}</p>
                                        {/if}
                                        
                                        {if $product.configoptions}
                                            <div class="space-y-2 mb-4">
                                                <h4 class="text-white font-medium">Configuration:</h4>
                                                {foreach from=$product.configoptions item=configoption}
                                                    <div class="flex justify-between text-sm">
                                                        <span class="text-text-light">{$configoption.optionname}:</span>
                                                        <span class="text-white">{$configoption.optionvalue}</span>
                                                    </div>
                                                {/foreach}
                                            </div>
                                        {/if}
                                        
                                        <div class="flex items-center space-x-4">
                                            <a href="{$WEB_ROOT}/cart.php?a=confproduct&i={$num}" class="text-neon-green hover:text-electric-blue text-sm">
                                                Edit Configuration
                                            </a>
                                            <a href="{$WEB_ROOT}/cart.php?a=remove&i={$num}" class="text-red-400 hover:text-red-300 text-sm">
                                                Remove
                                            </a>
                                        </div>
                                    </div>
                                    
                                    <div class="text-right ml-6">
                                        {if $product.setupfee && $product.setupfee neq "0.00"}
                                            <div class="text-text-light text-sm">Setup: {$product.setupfee}</div>
                                        {/if}
                                        <div class="text-lg font-bold text-neon-green">{$product.price}</div>
                                        {if $product.billingcycle}
                                            <div class="text-text-light text-sm">{$product.billingcycle}</div>
                                        {/if}
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                {/if}

                {if $addons}
                    <div class="space-y-4 mt-6">
                        <h3 class="text-xl font-orbitron font-semibold text-white">Add-ons</h3>
                        {foreach from=$addons item=addon key=num}
                            <div class="card-dark">
                                <div class="flex items-center justify-between">
                                    <div>
                                        <h4 class="text-white font-medium">{$addon.name}</h4>
                                        {if $addon.description}
                                            <p class="text-text-light text-sm">{$addon.description}</p>
                                        {/if}
                                    </div>
                                    <div class="text-right">
                                        <div class="text-lg font-bold text-electric-blue">{$addon.price}</div>
                                        <a href="{$WEB_ROOT}/cart.php?a=remove&i={$num}&t=addon" class="text-red-400 hover:text-red-300 text-sm">
                                            Remove
                                        </a>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                {/if}

                {if $domains}
                    <div class="space-y-4 mt-6">
                        <h3 class="text-xl font-orbitron font-semibold text-white">Domains</h3>
                        {foreach from=$domains item=domain key=num}
                            <div class="card-dark">
                                <div class="flex items-center justify-between">
                                    <div>
                                        <h4 class="text-white font-medium">{$domain.domain}</h4>
                                        <p class="text-text-light text-sm">{$domain.type} for {$domain.regperiod} years</p>
                                    </div>
                                    <div class="text-right">
                                        <div class="text-lg font-bold text-cyber-purple">{$domain.price}</div>
                                        <a href="{$WEB_ROOT}/cart.php?a=remove&i={$num}&t=domain" class="text-red-400 hover:text-red-300 text-sm">
                                            Remove
                                        </a>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                {/if}

                {if !$products && !$addons && !$domains}
                    <!-- Empty Cart -->
                    <div class="card-dark text-center py-12">
                        <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                            <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M3 1a1 1 0 000 2h1.22l.305 1.222a.997.997 0 00.01.042l1.358 5.43-.893.892C3.74 11.846 4.632 14 6.414 14H15a1 1 0 000-2H6.414l1-1H14a1 1 0 00.894-.553l3-6A1 1 0 0017 3H6.28l-.31-1.243A1 1 0 005 1H3zM16 16.5a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0zM6.5 18a1.5 1.5 0 100-3 1.5 1.5 0 000 3z"/>
                            </svg>
                        </div>
                        <h3 class="text-xl font-orbitron font-semibold text-white mb-4">Your Cart is Empty</h3>
                        <p class="text-text-light mb-6">Add some products or services to get started.</p>
                        <a href="{$WEB_ROOT}/index.php" class="btn-primary">
                            Browse Our Services
                        </a>
                    </div>
                {/if}
            </div>

            <!-- Order Summary -->
            <div class="lg:col-span-1">
                {if $products || $addons || $domains}
                    <div class="card-dark sticky top-8">
                        <h3 class="text-xl font-orbitron font-semibold text-white mb-6">Order Summary</h3>
                        
                        <div class="space-y-3 mb-6">
                            {if $products}
                                <div class="flex justify-between">
                                    <span class="text-text-light">Products/Services:</span>
                                    <span class="text-white">{$subtotal}</span>
                                </div>
                            {/if}
                            
                            {if $addons}
                                <div class="flex justify-between">
                                    <span class="text-text-light">Add-ons:</span>
                                    <span class="text-white">{$addonssub}</span>
                                </div>
                            {/if}
                            
                            {if $domains}
                                <div class="flex justify-between">
                                    <span class="text-text-light">Domains:</span>
                                    <span class="text-white">{$domainssub}</span>
                                </div>
                            {/if}
                            
                            {if $setupfees}
                                <div class="flex justify-between">
                                    <span class="text-text-light">Setup Fees:</span>
                                    <span class="text-white">{$setupfees}</span>
                                </div>
                            {/if}
                            
                            {if $taxrate}
                                <div class="flex justify-between">
                                    <span class="text-text-light">Tax ({$taxname}):</span>
                                    <span class="text-white">{$taxtotal}</span>
                                </div>
                            {/if}
                            
                            {if $discount}
                                <div class="flex justify-between text-green-400">
                                    <span>Discount ({$promocode}):</span>
                                    <span>-{$discount}</span>
                                </div>
                            {/if}
                        </div>
                        
                        <div class="border-t border-gray-700 pt-4 mb-6">
                            <div class="flex justify-between text-lg">
                                <span class="text-white font-semibold">Total:</span>
                                <span class="text-neon-green font-bold">{if $total}{$total}{else}$0.00{/if}</span>
                            </div>
                            {if $recurring}
                                <div class="text-text-light text-sm mt-1">
                                    Then {$recurring} recurring
                                </div>
                            {/if}
                        </div>
                        
                        <!-- Promo Code -->
                        {if $enablepromos}
                            <div class="mb-6">
                                <form method="post" action="{$smarty.server.PHP_SELF}">
                                    <div class="flex">
                                        <input type="text" name="promocode" value="{$promocode}" 
                                               placeholder="Promo code" class="input-dark flex-1 rounded-r-none">
                                        <button type="submit" name="validatepromo" class="btn-secondary rounded-l-none border-l-0">
                                            Apply
                                        </button>
                                    </div>
                                </form>
                            </div>
                        {/if}
                        
                        <!-- Checkout Button -->
                        <a href="{$WEB_ROOT}/cart.php?a=checkout" class="btn-primary w-full text-center bg-gradient-to-r from-neon-green to-electric-blue">
                            Proceed to Checkout
                        </a>
                        
                        <!-- Continue Shopping -->
                        <a href="{$WEB_ROOT}/index.php" class="btn-outline w-full text-center mt-3">
                            Continue Shopping
                        </a>
                    </div>
                {/if}

                <!-- Trust Indicators -->
                <div class="card-dark mt-6">
                    <h4 class="text-lg font-semibold text-white mb-4">Why Choose Us?</h4>
                    <div class="space-y-3">
                        <div class="flex items-center space-x-3">
                            <svg class="w-5 h-5 text-neon-green" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">99.9% Uptime Guarantee</span>
                        </div>
                        <div class="flex items-center space-x-3">
                            <svg class="w-5 h-5 text-electric-blue" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">24/7 Expert Support</span>
                        </div>
                        <div class="flex items-center space-x-3">
                            <svg class="w-5 h-5 text-cyber-purple" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-white text-sm">30-Day Money Back</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}