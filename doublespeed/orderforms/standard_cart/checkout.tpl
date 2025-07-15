{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-8">
    <div class="container mx-auto px-4">
        <div class="max-w-6xl mx-auto">
            <!-- Order Progress -->
            <div class="mb-8">
                <div class="flex items-center justify-center space-x-4 mb-6">
                    <div class="flex items-center {if $step == 1 || $step == 2 || $step == 3 || $step == 4}text-neon-green{else}text-gray-400{/if}">
                        <div class="w-8 h-8 rounded-full border-2 {if $step == 1 || $step == 2 || $step == 3 || $step == 4}border-neon-green bg-neon-green text-dark-bg{else}border-gray-400{/if} flex items-center justify-center font-bold text-sm">1</div>
                        <span class="ml-2 font-semibold">Configure</span>
                    </div>
                    <div class="w-12 h-0.5 {if $step == 2 || $step == 3 || $step == 4}bg-neon-green{else}bg-gray-400{/if}"></div>
                    
                    <div class="flex items-center {if $step == 2 || $step == 3 || $step == 4}text-neon-green{else}text-gray-400{/if}">
                        <div class="w-8 h-8 rounded-full border-2 {if $step == 2 || $step == 3 || $step == 4}border-neon-green bg-neon-green text-dark-bg{else}border-gray-400{/if} flex items-center justify-center font-bold text-sm">2</div>
                        <span class="ml-2 font-semibold">Review</span>
                    </div>
                    <div class="w-12 h-0.5 {if $step == 3 || $step == 4}bg-neon-green{else}bg-gray-400{/if}"></div>
                    
                    <div class="flex items-center {if $step == 3 || $step == 4}text-neon-green{else}text-gray-400{/if}">
                        <div class="w-8 h-8 rounded-full border-2 {if $step == 3 || $step == 4}border-neon-green bg-neon-green text-dark-bg{else}border-gray-400{/if} flex items-center justify-center font-bold text-sm">3</div>
                        <span class="ml-2 font-semibold">Checkout</span>
                    </div>
                    <div class="w-12 h-0.5 {if $step == 4}bg-neon-green{else}bg-gray-400{/if}"></div>
                    
                    <div class="flex items-center {if $step == 4}text-neon-green{else}text-gray-400{/if}">
                        <div class="w-8 h-8 rounded-full border-2 {if $step == 4}border-neon-green bg-neon-green text-dark-bg{else}border-gray-400{/if} flex items-center justify-center font-bold text-sm">4</div>
                        <span class="ml-2 font-semibold">Complete</span>
                    </div>
                </div>
            </div>

            <div class="grid lg:grid-cols-3 gap-8">
                <!-- Main Content -->
                <div class="lg:col-span-2">
                    {if $step == 1}
                        <!-- Step 1: Product Configuration -->
                        <div class="bg-dark-surface rounded-xl border border-gray-700 p-6">
                            <h2 class="text-2xl font-bold text-white mb-6">
                                <i class="fas fa-cogs mr-2 text-neon-green"></i>
                                Configure Your Service
                            </h2>
                            
                            {if $products}
                                <div class="grid md:grid-cols-2 gap-6">
                                    {foreach from=$products item=product}
                                        <div class="bg-dark-bg rounded-lg border border-gray-600 p-6 hover:border-neon-green transition-colors duration-300">
                                            <h3 class="text-xl font-semibold text-white mb-2">{$product.name}</h3>
                                            <p class="text-gray-400 mb-4">{$product.description}</p>
                                            
                                            <div class="space-y-3 mb-4">
                                                {foreach from=$product.features item=feature}
                                                    <div class="flex items-center text-sm">
                                                        <i class="fas fa-check text-neon-green mr-2"></i>
                                                        <span class="text-gray-300">{$feature}</span>
                                                    </div>
                                                {/foreach}
                                            </div>
                                            
                                            <div class="border-t border-gray-600 pt-4">
                                                <div class="text-2xl font-bold text-neon-green mb-2">{$product.price}</div>
                                                <a href="{$WEB_ROOT}/cart.php?a=add&pid={$product.id}" class="block w-full bg-neon-green text-dark-bg font-semibold py-2 px-4 rounded-lg text-center hover:shadow-neon-green/50 hover:shadow-lg transition-all duration-300">
                                                    Select Plan
                                                </a>
                                            </div>
                                        </div>
                                    {/foreach}
                                </div>
                            {/if}
                        </div>
                        
                    {elseif $step == 2}
                        <!-- Step 2: Review & Customize -->
                        <form action="{$WEB_ROOT}/cart.php" method="post">
                            <div class="bg-dark-surface rounded-xl border border-gray-700 p-6">
                                <h2 class="text-2xl font-bold text-white mb-6">
                                    <i class="fas fa-edit mr-2 text-electric-blue"></i>
                                    Review & Customize
                                </h2>
                                
                                {if $billingcycles}
                                    <div class="mb-6">
                                        <h3 class="text-lg font-semibold text-white mb-3">Billing Cycle</h3>
                                        <div class="grid md:grid-cols-4 gap-3">
                                            {foreach from=$billingcycles item=cycle}
                                                <label class="block">
                                                    <div class="bg-dark-bg rounded-lg border border-gray-600 p-3 hover:border-electric-blue cursor-pointer transition-colors duration-300 {if $cycle.selected}border-electric-blue bg-electric-blue/10{/if}">
                                                        <input type="radio" name="billingcycle" value="{$cycle.cycle}" {if $cycle.selected}checked{/if} class="sr-only">
                                                        <div class="text-center">
                                                            <div class="text-white font-semibold">{$cycle.name}</div>
                                                            <div class="text-electric-blue font-bold">{$cycle.price}</div>
                                                        </div>
                                                    </div>
                                                </label>
                                            {/foreach}
                                        </div>
                                    </div>
                                {/if}
                                
                                {if $addons}
                                    <div class="mb-6">
                                        <h3 class="text-lg font-semibold text-white mb-3">Available Add-ons</h3>
                                        <div class="space-y-3">
                                            {foreach from=$addons item=addon}
                                                <label class="flex items-center justify-between bg-dark-bg rounded-lg border border-gray-600 p-4 hover:border-cyber-purple cursor-pointer transition-colors duration-300">
                                                    <div class="flex items-center">
                                                        <input type="checkbox" name="addons[]" value="{$addon.id}" class="text-cyber-purple bg-dark-bg border-gray-600 rounded focus:ring-cyber-purple mr-3">
                                                        <div>
                                                            <div class="text-white font-semibold">{$addon.name}</div>
                                                            <div class="text-gray-400 text-sm">{$addon.description}</div>
                                                        </div>
                                                    </div>
                                                    <div class="text-cyber-purple font-bold">{$addon.price}</div>
                                                </label>
                                            {/foreach}
                                        </div>
                                    </div>
                                {/if}
                                
                                <div class="text-center">
                                    <button type="submit" class="bg-electric-blue text-white font-semibold py-3 px-8 rounded-lg hover:shadow-electric-blue/50 hover:shadow-lg transition-all duration-300">
                                        Continue to Checkout
                                    </button>
                                </div>
                            </div>
                        </form>
                        
                    {elseif $step == 3}
                        <!-- Step 3: Checkout -->
                        <div class="bg-dark-surface rounded-xl border border-gray-700 p-6">
                            <h2 class="text-2xl font-bold text-white mb-6">
                                <i class="fas fa-credit-card mr-2 text-cyber-purple"></i>
                                Checkout
                            </h2>
                            <!-- Checkout form content would go here -->
                            <p class="text-gray-400">Checkout form implementation...</p>
                        </div>
                        
                    {else}
                        <!-- Step 4: Order Complete -->
                        <div class="bg-dark-surface rounded-xl border border-gray-700 p-6 text-center">
                            <div class="text-6xl text-neon-green mb-4">
                                <i class="fas fa-check-circle"></i>
                            </div>
                            <h2 class="text-2xl font-bold text-white mb-4">Order Complete!</h2>
                            <p class="text-gray-400 mb-6">Thank you for your order. You will receive a confirmation email shortly.</p>
                            <a href="{$WEB_ROOT}/clientarea.php" class="bg-neon-green text-dark-bg font-semibold py-3 px-8 rounded-lg hover:shadow-neon-green/50 hover:shadow-lg transition-all duration-300">
                                Go to Client Area
                            </a>
                        </div>
                    {/if}
                </div>

                <!-- Order Summary Sidebar -->
                <div class="lg:col-span-1">
                    <div class="bg-dark-surface rounded-xl border border-gray-700 p-6 sticky top-8">
                        <h3 class="text-xl font-semibold text-white mb-4">
                            <i class="fas fa-shopping-cart mr-2 text-neon-green"></i>
                            Order Summary
                        </h3>
                        
                        {if $cartitems}
                            <div class="space-y-4">
                                {foreach from=$cartitems item=item}
                                    <div class="border-b border-gray-600 pb-3">
                                        <div class="text-white font-semibold">{$item.name}</div>
                                        <div class="text-gray-400 text-sm">{$item.description}</div>
                                        <div class="text-neon-green font-bold text-right">{$item.price}</div>
                                    </div>
                                {/foreach}
                            </div>
                            
                            <div class="border-t border-gray-500 pt-4 mt-4">
                                <div class="flex justify-between items-center text-lg">
                                    <span class="text-white font-bold">Total:</span>
                                    <span class="text-neon-green font-bold">{$total}</span>
                                </div>
                            </div>
                        {else}
                            <p class="text-gray-400">Your cart is empty</p>
                        {/if}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}