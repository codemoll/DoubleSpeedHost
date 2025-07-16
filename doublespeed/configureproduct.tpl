{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-20 px-4 sm:px-6 lg:px-8">
    <div class="config-panel-container">
        <!-- Header -->
        <div class="text-center mb-8">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-4">
                Configure Product
            </h1>
            {if $productname}
                <p class="text-lg text-text-light">
                    Configure your {$productname} service
                </p>
            {/if}
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

        <form method="post" action="{$smarty.server.PHP_SELF}" class="order-form-section">
            <div class="space-y-8 constrain-width">
                
                <!-- Product Information -->
                {if $productinfo}
                    <div class="config-panel-section">
                        <h2 class="text-xl font-orbitron font-semibold text-white mb-6">Product Details</h2>
                        
                        <div class="space-y-4">
                            <div class="flex justify-between items-start">
                                <div class="flex-1 min-w-0">
                                    <h3 class="text-lg font-medium text-white">{$productinfo.name}</h3>
                                    {if $productinfo.description}
                                        <p class="text-text-light mt-1">{$productinfo.description}</p>
                                    {/if}
                                </div>
                                <div class="text-right flex-shrink-0 ml-4">
                                    <span class="text-2xl font-bold text-neon-green">{$productinfo.price}</span>
                                    {if $productinfo.billingcycle}
                                        <p class="text-text-light text-sm">/{$productinfo.billingcycle}</p>
                                    {/if}
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}

                <!-- Billing Cycle -->
                {if $billingcycles}
                    <div class="config-panel-section">
                        <h3 class="text-lg font-orbitron font-semibold text-white mb-4">Billing Cycle</h3>
                        
                        <div class="responsive-grid-auto">
                            {foreach from=$billingcycles item=cycle key=period}
                                <label class="relative cursor-pointer">
                                    <input type="radio" name="billingcycle" value="{$period}" 
                                           {if $selectedbillingcycle eq $period}checked{/if}
                                           class="sr-only">
                                    <div class="border-2 border-gray-700 rounded-lg p-4 hover:border-neon-green transition-all duration-300 cycle-option">
                                        <div class="text-center">
                                            <div class="text-white font-medium">{$cycle.name}</div>
                                            <div class="text-neon-green text-lg font-bold mt-1">{$cycle.price}</div>
                                            {if $cycle.savings}
                                                <div class="text-electric-blue text-sm">Save {$cycle.savings}</div>
                                            {/if}
                                        </div>
                                    </div>
                                </label>
                            {/foreach}
                        </div>
                    </div>
                {/if}
                                                </option>
                                            {/foreach}
                                        </select>
                                    {elseif $option.optiontype eq "radio"}
                                        <div class="space-y-2">
                                            {foreach from=$option.options item=suboption key=key}
                                                <label class="flex items-center">
                                                    <input type="radio" name="configoption[{$option.id}]" value="{$key}" 
                                                           {if $option.selectedvalue eq $key}checked{/if}
                                                           class="mr-3">
                                                    <span class="text-white">
                                                        {$suboption.name} {if $suboption.price}(+{$suboption.price}){/if}
                                                    </span>
                                                </label>
                                            {/foreach}
                                        </div>
                                    {elseif $option.optiontype eq "checkbox"}
                                        <label class="flex items-center">
                                            <input type="checkbox" name="configoption[{$option.id}]" value="1" 
                                                   {if $option.selectedvalue}checked{/if}
                                                   class="mr-3">
                                            <span class="text-white">
                                                {$option.options.1.name} {if $option.options.1.price}(+{$option.options.1.price}){/if}
                                            </span>
                                        </label>
                                    {elseif $option.optiontype eq "text"}
                                        <input type="text" name="configoption[{$option.id}]" value="{$option.selectedvalue}" 
                                               class="input-dark">
                                    {elseif $option.optiontype eq "textarea"}
                                        <textarea name="configoption[{$option.id}]" rows="3" class="input-dark">{$option.selectedvalue}</textarea>
                                    {/if}
                                    
                                    {if $option.description}
                                        <p class="text-text-light text-sm mt-1">{$option.description}</p>
                                    {/if}
                                </div>
                            {/foreach}
                        </div>
                    </div>
                {/if}

                <!-- Addons -->
                {if $addons}
                    <div class="card-dark">
                        <h3 class="text-lg font-orbitron font-semibold text-white mb-6">Available Add-ons</h3>
                        
                        <div class="space-y-4">
                            {foreach from=$addons item=addon}
                                <div class="border border-gray-700 rounded-lg p-4">
                                    <label class="flex items-start space-x-3 cursor-pointer">
                                        <input type="checkbox" name="addon[{$addon.id}]" value="1" 
                                               {if $addon.selected}checked{/if}
                                               class="mt-1">
                                        <div class="flex-1">
                                            <div class="flex justify-between items-start">
                                                <div>
                                                    <h4 class="text-white font-medium">{$addon.name}</h4>
                                                    {if $addon.description}
                                                        <p class="text-text-light text-sm mt-1">{$addon.description}</p>
                                                    {/if}
                                                </div>
                                                <span class="text-neon-green font-bold">{$addon.price}</span>
                                            </div>
                                        </div>
                                    </label>
                                </div>
                            {/foreach}
                        </div>
                    </div>
                {/if}

                <!-- Order Summary -->
                <div class="card-dark">
                    <h3 class="text-lg font-orbitron font-semibold text-white mb-6">Order Summary</h3>
                    
                    <div class="space-y-3">
                        <div class="flex justify-between">
                            <span class="text-text-light">Setup Fee:</span>
                            <span class="text-white">{if $setupfee}{$setupfee}{else}Free{/if}</span>
                        </div>
                        <div class="flex justify-between">
                            <span class="text-text-light">Recurring Price:</span>
                            <span class="text-white">{if $recurringprice}{$recurringprice}{else}$0.00{/if}</span>
                        </div>
                        <div class="border-t border-gray-700 pt-3">
                            <div class="flex justify-between text-lg">
                                <span class="text-white font-semibold">Total Today:</span>
                                <span class="text-neon-green font-bold">{if $totaltoday}{$totaltoday}{else}$0.00{/if}</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Actions -->
                <div class="flex justify-between">
                    <a href="{$WEB_ROOT}/cart.php" class="btn-secondary">
                        ← Back to Cart
                    </a>
                    <button type="submit" name="update" class="btn-primary">
                        Update Configuration
                    </button>
                    <button type="submit" name="addtocart" class="btn-primary bg-gradient-to-r from-neon-green to-electric-blue">
                        Add to Cart →
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

<style>
.cycle-option {
    transition: all 0.3s ease;
}
input[type="radio"]:checked + .cycle-option {
    border-color: #00FF88;
    background-color: rgba(0, 255, 136, 0.1);
}
</style>

{include file="$template/footer.tpl"}