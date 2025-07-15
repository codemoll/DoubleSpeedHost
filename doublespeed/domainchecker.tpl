{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-8">
    <div class="container mx-auto px-4">
        <!-- Page Header -->
        <div class="text-center mb-12">
            <h1 class="text-4xl font-bold text-white mb-4">
                <i class="fas fa-globe mr-3 text-neon-green"></i>
                Domain Search
            </h1>
            <p class="text-gray-400 text-lg max-w-2xl mx-auto">
                Find your perfect domain name and check availability across multiple extensions
            </p>
        </div>

        <!-- Domain Search Form -->
        <div class="max-w-4xl mx-auto mb-12">
            <form action="{$WEB_ROOT}/domainchecker.php" method="post" class="bg-dark-surface rounded-2xl border border-gray-700 p-8 shadow-2xl">
                <div class="flex flex-col md:flex-row gap-4">
                    <div class="flex-1">
                        <input type="text" 
                               name="domain" 
                               id="domain" 
                               placeholder="Enter your domain name (without www)" 
                               value="{if $domain}{$domain}{/if}"
                               class="w-full bg-dark-bg border border-gray-600 rounded-lg px-4 py-3 text-white placeholder-gray-400 focus:border-neon-green focus:ring-2 focus:ring-neon-green/50 transition-all duration-300"
                               required>
                    </div>
                    <button type="submit" class="bg-neon-green text-dark-bg font-semibold py-3 px-8 rounded-lg hover:shadow-neon-green/50 hover:shadow-lg transition-all duration-300 whitespace-nowrap">
                        <i class="fas fa-search mr-2"></i>
                        Check Availability
                    </button>
                </div>
                
                <!-- TLD Selection -->
                {if $tlds}
                    <div class="mt-6">
                        <h3 class="text-white font-semibold mb-3">Select extensions to check:</h3>
                        <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-3">
                            {foreach from=$tlds item=tld}
                                <label class="flex items-center space-x-2 bg-dark-bg rounded-lg p-3 border border-gray-600 hover:border-neon-green cursor-pointer transition-colors duration-300">
                                    <input type="checkbox" name="tlds[]" value="{$tld.extension}" 
                                           {if $tld.selected}checked{/if}
                                           class="text-neon-green bg-dark-bg border-gray-600 rounded focus:ring-neon-green focus:ring-2">
                                    <span class="text-white text-sm">.{$tld.extension}</span>
                                    {if $tld.price}
                                        <span class="text-gray-400 text-xs ml-auto">{$tld.price}</span>
                                    {/if}
                                </label>
                            {/foreach}
                        </div>
                    </div>
                {/if}
            </form>
        </div>

        <!-- Search Results -->
        {if $results}
            <div class="max-w-4xl mx-auto">
                <h2 class="text-2xl font-bold text-white mb-6">
                    <i class="fas fa-list-ul mr-2 text-electric-blue"></i>
                    Search Results for "{$searchterm}"
                </h2>
                
                <div class="space-y-4">
                    {foreach from=$results item=result}
                        <div class="bg-dark-surface rounded-xl border border-gray-700 p-6 hover:border-{if $result.status == 'available'}neon-green{else}red-500{/if} transition-colors duration-300">
                            <div class="flex flex-col md:flex-row md:items-center justify-between">
                                <div class="flex items-center space-x-4 mb-4 md:mb-0">
                                    <div class="text-2xl">
                                        {if $result.status == 'available'}
                                            <i class="fas fa-check-circle text-neon-green"></i>
                                        {elseif $result.status == 'unavailable'}
                                            <i class="fas fa-times-circle text-red-500"></i>
                                        {else}
                                            <i class="fas fa-question-circle text-yellow-500"></i>
                                        {/if}
                                    </div>
                                    <div>
                                        <h3 class="text-xl font-semibold text-white">{$result.domain}</h3>
                                        <p class="text-gray-400 text-sm">
                                            {if $result.status == 'available'}
                                                Available for registration
                                            {elseif $result.status == 'unavailable'}
                                                Already registered
                                            {else}
                                                Status unknown
                                            {/if}
                                        </p>
                                    </div>
                                </div>
                                
                                <div class="flex items-center space-x-4">
                                    {if $result.price && $result.status == 'available'}
                                        <div class="text-center">
                                            <div class="text-2xl font-bold text-neon-green">{$result.price}</div>
                                            <div class="text-gray-400 text-xs">per year</div>
                                        </div>
                                    {/if}
                                    
                                    {if $result.status == 'available'}
                                        <a href="{$WEB_ROOT}/cart.php?a=add&domain=register&query={$result.domain}" 
                                           class="bg-neon-green text-dark-bg font-semibold py-2 px-6 rounded-lg hover:shadow-neon-green/50 hover:shadow-lg transition-all duration-300">
                                            Register Now
                                        </a>
                                    {elseif $result.status == 'unavailable'}
                                        <a href="{$WEB_ROOT}/cart.php?a=add&domain=transfer&query={$result.domain}" 
                                           class="bg-electric-blue text-white font-semibold py-2 px-6 rounded-lg hover:shadow-electric-blue/50 hover:shadow-lg transition-all duration-300">
                                            Transfer
                                        </a>
                                    {/if}
                                </div>
                            </div>
                        </div>
                    {/foreach}
                </div>
            </div>
        {/if}

        <!-- Popular TLDs -->
        {if !$results}
            <div class="max-w-4xl mx-auto">
                <h2 class="text-2xl font-bold text-white mb-6 text-center">
                    <i class="fas fa-star mr-2 text-cyber-purple"></i>
                    Popular Domain Extensions
                </h2>
                
                <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
                    <div class="bg-dark-surface rounded-xl border border-gray-700 p-6 hover:border-neon-green transition-colors duration-300">
                        <h3 class="text-lg font-semibold text-white mb-2">.com</h3>
                        <p class="text-gray-400 text-sm mb-4">Most popular and trusted extension</p>
                        <div class="text-neon-green font-bold">Starting at $12.99/year</div>
                    </div>
                    
                    <div class="bg-dark-surface rounded-xl border border-gray-700 p-6 hover:border-electric-blue transition-colors duration-300">
                        <h3 class="text-lg font-semibold text-white mb-2">.net</h3>
                        <p class="text-gray-400 text-sm mb-4">Great for tech and networking sites</p>
                        <div class="text-electric-blue font-bold">Starting at $14.99/year</div>
                    </div>
                    
                    <div class="bg-dark-surface rounded-xl border border-gray-700 p-6 hover:border-cyber-purple transition-colors duration-300">
                        <h3 class="text-lg font-semibold text-white mb-2">.org</h3>
                        <p class="text-gray-400 text-sm mb-4">Perfect for organizations</p>
                        <div class="text-cyber-purple font-bold">Starting at $13.99/year</div>
                    </div>
                </div>
            </div>
        {/if}
    </div>
</div>

{include file="$template/footer.tpl"}