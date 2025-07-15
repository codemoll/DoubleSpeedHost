{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-20 px-4 sm:px-6 lg:px-8">
    <div class="max-w-4xl mx-auto">
        <!-- Header -->
        <div class="text-center mb-12">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                </svg>
            </div>
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                Domain Search
            </h1>
            <p class="text-lg text-text-light max-w-2xl mx-auto">
                Find and register your perfect domain name with our advanced domain search tools.
            </p>
        </div>

        <!-- Domain Search Form -->
        <div class="card-dark mb-8">
            <h2 class="text-xl font-orbitron font-semibold text-white mb-6">Search for your domain</h2>
            
            <form method="post" action="{$WEB_ROOT}/domainchecker.php" class="space-y-6">
                <div class="flex gap-4">
                    <div class="flex-1">
                        <input type="text" name="domain" value="{if isset($domain)}{$domain}{/if}" 
                               placeholder="Enter domain name..." 
                               class="input-dark text-lg h-12" required>
                    </div>
                    <button type="submit" class="btn-primary px-8 h-12">
                        Search
                    </button>
                </div>
                
                {if $searchextensions}
                    <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-3">
                        {foreach from=$searchextensions item=extension}
                            <label class="flex items-center space-x-2 cursor-pointer">
                                <input type="checkbox" name="ext[]" value="{$extension.extension}" 
                                       {if $extension.selected}checked{/if} class="rounded border-gray-600 bg-dark-bg-alt">
                                <span class="text-text-light">.{$extension.extension}</span>
                            </label>
                        {/foreach}
                    </div>
                {/if}
            </form>
        </div>

        <!-- Search Results -->
        {if $searchresults}
            <div class="space-y-4 mb-8">
                <h3 class="text-2xl font-orbitron font-bold text-white">Search Results</h3>
                
                {foreach from=$searchresults item=result}
                    <div class="card-dark">
                        <div class="flex items-center justify-between">
                            <div class="flex items-center space-x-4">
                                <div class="flex items-center justify-center w-10 h-10 rounded-full {if $result.status eq 'available'}bg-green-500{else}bg-red-500{/if}">
                                    {if $result.status eq 'available'}
                                        <svg class="w-5 h-5 text-white" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                                        </svg>
                                    {else}
                                        <svg class="w-5 h-5 text-white" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"/>
                                        </svg>
                                    {/if}
                                </div>
                                <div>
                                    <h4 class="text-lg font-medium text-white">{$result.domain}</h4>
                                    <p class="text-sm text-text-light">
                                        {if $result.status eq 'available'}Available for registration{else}Not available{/if}
                                    </p>
                                </div>
                            </div>
                            
                            {if $result.status eq 'available'}
                                <div class="flex items-center space-x-4">
                                    <span class="text-xl font-bold text-neon-green">{$result.price}</span>
                                    <a href="{$WEB_ROOT}/cart.php?a=add&domain=register&query={$result.domain}" class="btn-primary">
                                        Add to Cart
                                    </a>
                                </div>
                            {/if}
                        </div>
                    </div>
                {/foreach}
            </div>
        {/if}

        <!-- Domain Management (for logged in users) -->
        {if $loggedin}
            <div class="card-dark">
                <h3 class="text-xl font-orbitron font-semibold text-white mb-6">Domain Management</h3>
                
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                    <a href="{$WEB_ROOT}/clientarea.php?action=domains" class="block p-6 border border-gray-700 rounded-lg hover:border-neon-green transition-colors duration-300">
                        <div class="text-center">
                            <svg class="w-8 h-8 text-neon-green mx-auto mb-3" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M4 4a2 2 0 00-2 2v1h16V6a2 2 0 00-2-2H4zM18 9H2v5a2 2 0 002 2h12a2 2 0 002-2V9zM4 13a1 1 0 011-1h1a1 1 0 110 2H5a1 1 0 01-1-1zm5-1a1 1 0 100 2h1a1 1 0 100-2H9z"/>
                            </svg>
                            <h4 class="text-white font-medium">My Domains</h4>
                            <p class="text-text-light text-sm mt-1">Manage your domains</p>
                        </div>
                    </a>
                    
                    <a href="{$WEB_ROOT}/clientarea.php?action=domaintransfer" class="block p-6 border border-gray-700 rounded-lg hover:border-neon-green transition-colors duration-300">
                        <div class="text-center">
                            <svg class="w-8 h-8 text-electric-blue mx-auto mb-3" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M8 5a1 1 0 100 2h5.586l-1.293 1.293a1 1 0 001.414 1.414l3-3a1 1 0 000-1.414l-3-3a1 1 0 10-1.414 1.414L13.586 5H8zM12 15a1 1 0 100-2H6.414l1.293-1.293a1 1 0 10-1.414-1.414l-3 3a1 1 0 000 1.414l3 3a1 1 0 001.414-1.414L6.414 15H12z"/>
                            </svg>
                            <h4 class="text-white font-medium">Transfer Domain</h4>
                            <p class="text-text-light text-sm mt-1">Transfer to us</p>
                        </div>
                    </a>
                    
                    <a href="{$WEB_ROOT}/clientarea.php?action=domainrenew" class="block p-6 border border-gray-700 rounded-lg hover:border-neon-green transition-colors duration-300">
                        <div class="text-center">
                            <svg class="w-8 h-8 text-cyber-purple mx-auto mb-3" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M4 2a1 1 0 011 1v2.101a7.002 7.002 0 0111.601 2.566 1 1 0 11-1.885.666A5.002 5.002 0 005.999 7H9a1 1 0 010 2H4a1 1 0 01-1-1V3a1 1 0 011-1zm.008 9.057a1 1 0 011.276.61A5.002 5.002 0 0014.001 13H11a1 1 0 110-2h5a1 1 0 011 1v5a1 1 0 11-2 0v-2.101a7.002 7.002 0 01-11.601-2.566 1 1 0 01.61-1.276z" clip-rule="evenodd"/>
                            </svg>
                            <h4 class="text-white font-medium">Renew Domain</h4>
                            <p class="text-text-light text-sm mt-1">Extend registration</p>
                        </div>
                    </a>
                </div>
            </div>
        {/if}

        <!-- Popular TLDs -->
        <div class="card-dark mt-8">
            <h3 class="text-xl font-orbitron font-semibold text-white mb-6">Popular Domain Extensions</h3>
            
            <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-4">
                {if $tlds}
                    {foreach from=$tlds item=tld}
                        <div class="text-center p-4 border border-gray-700 rounded-lg hover:border-neon-green transition-colors duration-300">
                            <div class="text-lg font-bold text-white">.{$tld.tld}</div>
                            <div class="text-sm text-neon-green">{$tld.price}</div>
                        </div>
                    {/foreach}
                {else}
                    <div class="text-center p-4 border border-gray-700 rounded-lg">.com</div>
                    <div class="text-center p-4 border border-gray-700 rounded-lg">.net</div>
                    <div class="text-center p-4 border border-gray-700 rounded-lg">.org</div>
                    <div class="text-center p-4 border border-gray-700 rounded-lg">.io</div>
                    <div class="text-center p-4 border border-gray-700 rounded-lg">.co</div>
                    <div class="text-center p-4 border border-gray-700 rounded-lg">.info</div>
                {/if}
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}