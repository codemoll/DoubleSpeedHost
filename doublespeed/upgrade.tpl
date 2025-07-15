{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-8">
    <div class="container mx-auto px-4">
        <!-- Page Header -->
        <div class="text-center mb-8">
            <h1 class="text-3xl font-bold text-white mb-4">
                <i class="fas fa-arrow-up mr-3 text-neon-green"></i>
                Upgrade/Downgrade Service
            </h1>
            {if $productname}
                <p class="text-gray-400 text-lg">
                    Modify your <span class="text-neon-green font-semibold">{$productname}</span> service
                </p>
            {/if}
        </div>

        <div class="max-w-4xl mx-auto">
            {if $errormessage}
                <div class="bg-red-900/50 border border-red-500 rounded-lg p-4 mb-6">
                    <div class="flex items-center">
                        <i class="fas fa-exclamation-triangle text-red-400 mr-3"></i>
                        <div class="text-red-100">{$errormessage}</div>
                    </div>
                </div>
            {/if}

            {if $successmessage}
                <div class="bg-green-900/50 border border-green-500 rounded-lg p-4 mb-6">
                    <div class="flex items-center">
                        <i class="fas fa-check-circle text-green-400 mr-3"></i>
                        <div class="text-green-100">{$successmessage}</div>
                    </div>
                </div>
            {/if}

            <form action="{$WEB_ROOT}/upgrade.php" method="post">
                <input type="hidden" name="id" value="{$id}" />
                <input type="hidden" name="step" value="2" />

                <!-- Current Service Info -->
                <div class="bg-dark-surface rounded-xl border border-gray-700 p-6 mb-8">
                    <h2 class="text-xl font-semibold text-white mb-4">
                        <i class="fas fa-info-circle mr-2 text-electric-blue"></i>
                        Current Service
                    </h2>
                    
                    <div class="grid md:grid-cols-2 gap-6">
                        <div>
                            <div class="text-gray-400 text-sm mb-1">Product/Service</div>
                            <div class="text-white font-semibold">{$productname}</div>
                        </div>
                        
                        {if $currentplan}
                            <div>
                                <div class="text-gray-400 text-sm mb-1">Current Plan</div>
                                <div class="text-white font-semibold">{$currentplan}</div>
                            </div>
                        {/if}
                        
                        {if $currentbillingcycle}
                            <div>
                                <div class="text-gray-400 text-sm mb-1">Billing Cycle</div>
                                <div class="text-white font-semibold">{$currentbillingcycle}</div>
                            </div>
                        {/if}
                        
                        {if $currentprice}
                            <div>
                                <div class="text-gray-400 text-sm mb-1">Current Price</div>
                                <div class="text-neon-green font-bold">{$currentprice}</div>
                            </div>
                        {/if}
                    </div>
                </div>

                <!-- Upgrade Options -->
                {if $upgradepackages}
                    <div class="bg-dark-surface rounded-xl border border-gray-700 p-6 mb-8">
                        <h2 class="text-xl font-semibold text-white mb-6">
                            <i class="fas fa-rocket mr-2 text-neon-green"></i>
                            Available Upgrades
                        </h2>
                        
                        <div class="space-y-4">
                            {foreach from=$upgradepackages item=package}
                                <label class="block">
                                    <div class="bg-dark-bg rounded-lg border border-gray-600 p-4 hover:border-neon-green cursor-pointer transition-colors duration-300 {if $package.selected}border-neon-green bg-neon-green/10{/if}">
                                        <div class="flex items-center justify-between">
                                            <div class="flex items-center space-x-4">
                                                <input type="radio" 
                                                       name="pid" 
                                                       value="{$package.id}" 
                                                       {if $package.selected}checked{/if}
                                                       class="text-neon-green bg-dark-bg border-gray-600 focus:ring-neon-green">
                                                
                                                <div>
                                                    <h3 class="text-white font-semibold text-lg">{$package.name}</h3>
                                                    {if $package.description}
                                                        <p class="text-gray-400 text-sm">{$package.description}</p>
                                                    {/if}
                                                </div>
                                            </div>
                                            
                                            <div class="text-right">
                                                <div class="text-neon-green font-bold text-lg">{$package.price}</div>
                                                {if $package.billingcycle}
                                                    <div class="text-gray-400 text-sm">{$package.billingcycle}</div>
                                                {/if}
                                            </div>
                                        </div>
                                        
                                        {if $package.features}
                                            <div class="mt-3 pt-3 border-t border-gray-600">
                                                <div class="grid md:grid-cols-2 gap-2 text-sm">
                                                    {foreach from=$package.features item=feature}
                                                        <div class="flex items-center text-gray-300">
                                                            <i class="fas fa-check text-neon-green mr-2"></i>
                                                            {$feature}
                                                        </div>
                                                    {/foreach}
                                                </div>
                                            </div>
                                        {/if}
                                    </div>
                                </label>
                            {/foreach}
                        </div>
                    </div>
                {/if}

                <!-- Billing Cycle Options -->
                {if $billingcycles}
                    <div class="bg-dark-surface rounded-xl border border-gray-700 p-6 mb-8">
                        <h2 class="text-xl font-semibold text-white mb-6">
                            <i class="fas fa-calendar-alt mr-2 text-electric-blue"></i>
                            Billing Cycle
                        </h2>
                        
                        <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-4">
                            {foreach from=$billingcycles item=cycle}
                                <label class="block">
                                    <div class="bg-dark-bg rounded-lg border border-gray-600 p-4 hover:border-electric-blue cursor-pointer transition-colors duration-300 {if $cycle.selected}border-electric-blue bg-electric-blue/10{/if}">
                                        <div class="text-center">
                                            <input type="radio" 
                                                   name="billingcycle" 
                                                   value="{$cycle.cycle}" 
                                                   {if $cycle.selected}checked{/if}
                                                   class="text-electric-blue bg-dark-bg border-gray-600 focus:ring-electric-blue mb-2">
                                            
                                            <div class="text-white font-semibold">{$cycle.name}</div>
                                            <div class="text-electric-blue font-bold">{$cycle.price}</div>
                                            {if $cycle.savings}
                                                <div class="text-green-400 text-sm">{$cycle.savings}</div>
                                            {/if}
                                        </div>
                                    </div>
                                </label>
                            {/foreach}
                        </div>
                    </div>
                {/if}

                <!-- Order Summary -->
                {if $ordersummary}
                    <div class="bg-dark-surface rounded-xl border border-gray-700 p-6 mb-8">
                        <h2 class="text-xl font-semibold text-white mb-6">
                            <i class="fas fa-receipt mr-2 text-cyber-purple"></i>
                            Order Summary
                        </h2>
                        
                        <div class="space-y-3">
                            {foreach from=$ordersummary item=item}
                                <div class="flex justify-between items-center py-2 border-b border-gray-600">
                                    <span class="text-gray-300">{$item.description}</span>
                                    <span class="text-white font-semibold">{$item.amount}</span>
                                </div>
                            {/foreach}
                            
                            {if $totaldue}
                                <div class="flex justify-between items-center py-3 text-lg border-t border-gray-500">
                                    <span class="text-white font-bold">Total Due Today</span>
                                    <span class="text-neon-green font-bold">{$totaldue}</span>
                                </div>
                            {/if}
                        </div>
                    </div>
                {/if}

                <!-- Submit Button -->
                <div class="text-center">
                    <button type="submit" class="bg-neon-green text-dark-bg font-bold py-4 px-8 rounded-lg hover:shadow-neon-green/50 hover:shadow-lg transition-all duration-300 text-lg">
                        <i class="fas fa-shopping-cart mr-2"></i>
                        Continue to Checkout
                    </button>
                    
                    <div class="mt-4">
                        <a href="{$WEB_ROOT}/clientarea.php?action=productdetails&id={$id}" class="text-gray-400 hover:text-neon-green transition-colors">
                            <i class="fas fa-arrow-left mr-1"></i>
                            Back to Service Details
                        </a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}