{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-4xl mx-auto">
        
        <!-- Page Header -->
        <div class="text-center mb-12">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M3 3a1 1 0 000 2v8a2 2 0 002 2h2.586l-1.293 1.293a1 1 0 101.414 1.414L10 15.414l2.293 2.293a1 1 0 001.414-1.414L12.414 15H15a2 2 0 002-2V5a1 1 0 100-2H3zm11.707 4.707a1 1 0 00-1.414-1.414L10 9.586 8.707 8.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                </svg>
            </div>
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">Domain Search</h1>
            <p class="text-xl text-text-light max-w-2xl mx-auto">
                Find the perfect domain name for your website. Search across hundreds of domain extensions.
            </p>
        </div>

        <!-- Domain Search Form -->
        <div class="card-dark mb-8">
            <form method="post" action="{$WEB_ROOT}/domainchecker.php" class="space-y-6">
                <div>
                    <label for="domain" class="block text-lg font-orbitron font-semibold text-white mb-4">
                        Enter your desired domain name
                    </label>
                    <div class="flex flex-col sm:flex-row gap-4">
                        <div class="flex-1">
                            <input type="text" 
                                   name="domain" 
                                   id="domain"
                                   value="{if isset($searchterm) && $searchterm}{$searchterm}{/if}"
                                   placeholder="yourdomain"
                                   class="input-dark w-full text-lg py-4"
                                   required>
                        </div>
                        <div class="sm:w-48">
                            <select name="ext" class="input-dark w-full py-4 text-lg">
                                {if isset($domainextensions) && is_array($domainextensions) && count($domainextensions) > 0}
                                    {foreach $domainextensions as $extension}
                                        {assign var="ext_value" value="{if isset($extension.extension)}{$extension.extension}{elseif isset($extension.tld)}{$extension.tld}{elseif is_string($extension)}{$extension}{else}com{/if}"}
                                        <option value=".{$ext_value}" 
                                                {if isset($selectedext) && ($selectedext eq $ext_value || $selectedext eq ".{$ext_value}")}selected{/if}>
                                            .{$ext_value}
                                        </option>
                                    {/foreach}
                                {else}
                                    {* Fallback extensions when WHMCS data is not available *}
                                    <option value=".com" {if isset($selectedext) && ($selectedext eq 'com' || $selectedext eq '.com')}selected{/if}>.com</option>
                                    <option value=".net" {if isset($selectedext) && ($selectedext eq 'net' || $selectedext eq '.net')}selected{/if}>.net</option>
                                    <option value=".org" {if isset($selectedext) && ($selectedext eq 'org' || $selectedext eq '.org')}selected{/if}>.org</option>
                                    <option value=".info" {if isset($selectedext) && ($selectedext eq 'info' || $selectedext eq '.info')}selected{/if}>.info</option>
                                    <option value=".biz" {if isset($selectedext) && ($selectedext eq 'biz' || $selectedext eq '.biz')}selected{/if}>.biz</option>
                                    <option value=".us" {if isset($selectedext) && ($selectedext eq 'us' || $selectedext eq '.us')}selected{/if}>.us</option>
                                    <option value=".io" {if isset($selectedext) && ($selectedext eq 'io' || $selectedext eq '.io')}selected{/if}>.io</option>
                                    <option value=".co" {if isset($selectedext) && ($selectedext eq 'co' || $selectedext eq '.co')}selected{/if}>.co</option>
                                    <option value=".dev" {if isset($selectedext) && ($selectedext eq 'dev' || $selectedext eq '.dev')}selected{/if}>.dev</option>
                                    <option value=".app" {if isset($selectedext) && ($selectedext eq 'app' || $selectedext eq '.app')}selected{/if}>.app</option>
                                {/if}
                            </select>
                        </div>
                        <button type="submit" class="btn-primary px-8 py-4 text-lg whitespace-nowrap">
                            <svg class="w-5 h-5 mr-2 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
                            </svg>
                            Search
                        </button>
                    </div>
                </div>
                
                {if $error}
                    <div class="bg-red-900 border border-red-700 rounded-lg p-4">
                        <div class="flex">
                            <svg class="w-5 h-5 text-red-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                            </svg>
                            <div class="text-red-200 text-sm">
                                {$error}
                            </div>
                        </div>
                    </div>
                {/if}
            </form>
        </div>

        <!-- Search Results -->
        {if isset($results) && is_array($results) && count($results) > 0}
            <div class="space-y-4">
                <h2 class="text-2xl font-orbitron font-bold text-white mb-6">Search Results</h2>
                
                {foreach $results as $result}
                    <div class="domain-result {if isset($result.status) && ($result.status eq 'available' || $result.status eq 'Available')}available{else}unavailable{/if}">
                        <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between p-4 gap-4">
                            <div class="flex-1">
                                <div class="domain-name text-lg font-semibold text-white">
                                    {if isset($result.domain) && $result.domain}
                                        {$result.domain}
                                    {elseif isset($result.domainname) && $result.domainname}
                                        {$result.domainname}
                                    {elseif isset($result.sld) && isset($result.tld)}
                                        {$result.sld}.{$result.tld}
                                    {else}
                                        Domain Name
                                    {/if}
                                </div>
                                <div class="domain-status mt-1">
                                    {if isset($result.status) && ($result.status eq 'available' || $result.status eq 'Available')}
                                        <span class="text-neon-green text-sm">✓ Available</span>
                                    {elseif isset($result.status) && ($result.status eq 'unavailable' || $result.status eq 'Unavailable' || $result.status eq 'taken')}
                                        <span class="text-red-400 text-sm">✗ Unavailable</span>
                                    {else}
                                        <span class="text-yellow-400 text-sm">? Status Unknown</span>
                                    {/if}
                                </div>
                            </div>
                            
                            {if isset($result.status) && ($result.status eq 'available' || $result.status eq 'Available')}
                                <div class="flex flex-col sm:flex-row items-start sm:items-center gap-3">
                                    {if isset($result.price) && $result.price}
                                        <div class="domain-price text-lg font-bold text-white">
                                            {if $result.price|strpos:'$' === false && $result.price neq 'Free'}${/if}{$result.price}
                                        </div>
                                    {elseif isset($result.pricing) && isset($result.pricing.register)}
                                        <div class="domain-price text-lg font-bold text-white">
                                            {if $result.pricing.register|strpos:'$' === false}${/if}{$result.pricing.register}
                                        </div>
                                    {/if}
                                    <div class="domain-action">
                                        {assign var="cart_domain" value="{if isset($result.domain) && $result.domain}{$result.domain}{elseif isset($result.domainname) && $result.domainname}{$result.domainname}{elseif isset($result.sld) && isset($result.tld)}{$result.sld}.{$result.tld}{else}example.com{/if}"}
                                        <a href="{$WEB_ROOT}/cart.php?a=add&domain=register&query={$cart_domain}" 
                                           class="btn-primary text-sm px-4 py-2">
                                            Add to Cart
                                        </a>
                                    </div>
                                </div>
                            {/if}
                        </div>
                    </div>
                {/foreach}
            </div>
        {elseif isset($searchterm) && $searchterm}
            <div class="text-center py-8">
                <div class="bg-blue-900 border border-blue-600 rounded-lg p-6">
                    <svg class="w-12 h-12 text-blue-400 mx-auto mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
                    </svg>
                    <h3 class="text-blue-300 font-semibold mb-2">Search Complete</h3>
                    <p class="text-blue-200">No results found for "{$searchterm}". Try a different domain name or extension.</p>
                </div>
            </div>
        {/if}

        <!-- Popular Extensions -->
        <div class="mt-12">
            <h2 class="text-2xl font-orbitron font-bold text-white mb-6 text-center">Popular Domain Extensions</h2>
            <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-4">
                {if isset($popularextensions) && is_array($popularextensions)}
                    {foreach $popularextensions as $extension}
                        <div class="card-dark text-center py-4 hover:border-neon-green transition-all duration-300">
                            <div class="text-lg font-orbitron font-bold text-neon-green">
                                .{if isset($extension.extension)}{$extension.extension|upper}{else}COM{/if}
                            </div>
                            <div class="text-text-light text-sm">
                                {if isset($extension.price)}{$extension.price}{else}Contact us{/if}
                            </div>
                            {if isset($extension.price)}
                                <a href="{$WEB_ROOT}/cart.php?a=add&domain=register&query=.{$extension.extension}" 
                                   class="btn-outline btn-sm mt-2 text-xs">
                                    Register
                                </a>
                            {/if}
                        </div>
                    {/foreach}
                {else}
                    <!-- Default popular extensions -->
                    <div class="card-dark text-center py-4 hover:border-neon-green transition-all duration-300">
                        <div class="text-lg font-orbitron font-bold text-neon-green">.COM</div>
                        <div class="text-text-light text-sm">$12.99/year</div>
                    </div>
                    <div class="card-dark text-center py-4 hover:border-electric-blue transition-all duration-300">
                        <div class="text-lg font-orbitron font-bold text-electric-blue">.NET</div>
                        <div class="text-text-light text-sm">$14.99/year</div>
                    </div>
                    <div class="card-dark text-center py-4 hover:border-cyber-purple transition-all duration-300">
                        <div class="text-lg font-orbitron font-bold text-cyber-purple">.ORG</div>
                        <div class="text-text-light text-sm">$13.99/year</div>
                    </div>
                    <div class="card-dark text-center py-4 hover:border-yellow-500 transition-all duration-300">
                        <div class="text-lg font-orbitron font-bold text-yellow-500">.IO</div>
                        <div class="text-text-light text-sm">$59.99/year</div>
                    </div>
                    <div class="card-dark text-center py-4 hover:border-green-400 transition-all duration-300">
                        <div class="text-lg font-orbitron font-bold text-green-400">.CO</div>
                        <div class="text-text-light text-sm">$29.99/year</div>
                    </div>
                    <div class="card-dark text-center py-4 hover:border-orange-400 transition-all duration-300">
                        <div class="text-lg font-orbitron font-bold text-orange-400">.INFO</div>
                        <div class="text-text-light text-sm">$18.99/year</div>
                    </div>
                {/if}
            </div>
        </div>
        
    </div>
</div>

{include file="$template/footer.tpl"}
