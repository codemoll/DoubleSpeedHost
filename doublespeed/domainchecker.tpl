{include file="$template/header.tpl"}

<div class="container-fluid" style="min-height: 100vh; background-color: var(--ds-dark-bg); padding: 80px 0 40px;">
    <div class="container">
        
        <!-- Page Header -->
        <div class="text-center mb-5">
            <div class="mx-auto mb-4 d-flex align-items-center justify-content-center" style="width: 80px; height: 80px; background: linear-gradient(135deg, var(--ds-neon-green), var(--ds-electric-blue)); border-radius: 50%;">
                <svg style="width: 40px; height: 40px; color: var(--ds-dark-bg);" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M3 3a1 1 0 000 2v8a2 2 0 002 2h2.586l-1.293 1.293a1 1 0 101.414 1.414L10 15.414l2.293 2.293a1 1 0 001.414-1.414L12.414 15H15a2 2 0 002-2V5a1 1 0 100-2H3zm11.707 4.707a1 1 0 00-1.414-1.414L10 9.586 8.707 8.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                </svg>
            </div>
            <h1 class="ds-hero-title" style="font-size: 2.5rem; margin-bottom: 1rem;">Domain Search</h1>
            <p class="ds-hero-subtitle" style="max-width: 42rem; margin: 0 auto;">
                Find the perfect domain name for your website. Search across hundreds of domain extensions.
            </p>
        </div>

        <!-- Domain Search Form -->
        <div class="row justify-content-center mb-5">
            <div class="col-lg-8">
                <div class="panel panel-default ds-glow">
                    <div class="panel-body">
                        <form method="post" action="{$WEB_ROOT}/domainchecker.php" id="domain-search-form">
                            <div class="form-group mb-4">
                                <label for="domain" class="form-label" style="font-size: 1.125rem; font-family: 'Orbitron', monospace; font-weight: 600;">
                                    Enter your desired domain name
                                </label>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <input type="text" 
                                                   name="domain" 
                                                   id="domain"
                                                   value="{if isset($searchterm) && $searchterm}{$searchterm}{/if}"
                                                   placeholder="yourdomain"
                                                   class="form-control form-control-lg"
                                                   required
                                                   autocomplete="off"
                                                   spellcheck="false">
                                            <span class="input-group-text">
                                                <svg style="width: 20px; height: 20px;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
                                                </svg>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <select name="ext" class="form-select form-select-lg">
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
                            <button type="submit" class="btn-primary px-8 py-4 text-lg whitespace-nowrap hover:scale-105 transition-all duration-300" id="search-submit-btn">
                                <svg class="w-5 h-5 mr-2 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
                                </svg>
                                <span class="search-btn-text">Search</span>
                            </button>
                        </div>
                    </div>
                    
                    {if $error}
                        <div class="bg-red-900/20 border border-red-600/50 rounded-lg p-4 animate-pulse">
                            <div class="flex items-start">
                                <svg class="w-5 h-5 text-red-400 mr-3 mt-0.5 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                                </svg>
                                <div class="text-red-200 text-sm">
                                    <strong class="font-semibold">Search Error:</strong> {$error}
                                </div>
                            </div>
                        </div>
                    {/if}
                </form>
            </div>
        </div>

        <!-- Search Results -->
        {if isset($results) && is_array($results) && count($results) > 0}
            <div id="domain-search-results" class="domain-results-container animate-in">
                <div class="domain-results-grid">
                    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between mb-6">
                        <h2 class="text-2xl font-orbitron font-bold text-white">Search Results</h2>
                        <div class="text-text-light text-sm mt-2 sm:mt-0">
                            Found {count($results)} result{if count($results) != 1}s{/if} for "{if isset($searchterm)}{$searchterm}{/if}"
                        </div>
                    </div>
                    
                    {foreach $results as $result}
                        <div class="domain-result-enhanced {if isset($result.status) && ($result.status eq 'available' || $result.status eq 'Available')}available{else}unavailable{/if}">
                            <div class="domain-result-content">
                                <div class="domain-name text-xl font-semibold text-white mb-2 truncate">
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
                                <div class="domain-status flex items-center gap-2">
                                    {if isset($result.status) && ($result.status eq 'available' || $result.status eq 'Available')}
                                        <div class="flex items-center text-neon-green">
                                            <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                                            </svg>
                                            <span class="font-medium">Available for Registration</span>
                                        </div>
                                    {elseif isset($result.status) && ($result.status eq 'unavailable' || $result.status eq 'Unavailable' || $result.status eq 'taken')}
                                        <div class="flex items-center text-red-400">
                                            <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                                            </svg>
                                            <span class="font-medium">Not Available</span>
                                        </div>
                                    {else}
                                        <div class="flex items-center text-yellow-400">
                                            <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                                            </svg>
                                            <span class="font-medium">Status Unknown</span>
                                        </div>
                                    {/if}
                                </div>
                                {if isset($result.status) && ($result.status eq 'available' || $result.status eq 'Available')}
                                    <div class="text-text-light text-sm mt-1">
                                        Perfect for your website, email, and more
                                    </div>
                                {/if}
                            </div>
                            
                            {if isset($result.status) && ($result.status eq 'available' || $result.status eq 'Available')}
                                <div class="domain-result-actions flex flex-col sm:flex-row items-start sm:items-center gap-4 pt-4 lg:pt-0 border-t lg:border-t-0 lg:border-l border-gray-700 lg:pl-6">
                                    <div class="text-center sm:text-right">
                                        {if isset($result.price) && $result.price}
                                            <div class="domain-price text-2xl font-bold text-neon-green">
                                                {if $result.price|strpos:'$' === false && $result.price neq 'Free'}${/if}{$result.price}
                                            </div>
                                            <div class="text-text-light text-sm">per year</div>
                                        {elseif isset($result.pricing) && isset($result.pricing.register)}
                                            <div class="domain-price text-2xl font-bold text-neon-green">
                                                {if $result.pricing.register|strpos:'$' === false}${/if}{$result.pricing.register}
                                            </div>
                                            <div class="text-text-light text-sm">per year</div>
                                        {else}
                                            <div class="domain-price text-lg font-bold text-white">Contact us</div>
                                            <div class="text-text-light text-sm">for pricing</div>
                                        {/if}
                                    </div>
                                    <div class="domain-action w-full sm:w-auto">
                                        {assign var="cart_domain" value="{if isset($result.domain) && $result.domain}{$result.domain}{elseif isset($result.domainname) && $result.domainname}{$result.domainname}{elseif isset($result.sld) && isset($result.tld)}{$result.sld}.{$result.tld}{else}example.com{/if}"}
                                        <a href="{$WEB_ROOT}/cart.php?a=add&domain=register&query={$cart_domain}" 
                                           class="btn-primary px-6 py-3 text-center w-full sm:w-auto hover:scale-105 transition-all duration-300 group-hover:shadow-glow-green">
                                            <svg class="w-4 h-4 mr-2 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"/>
                                            </svg>
                                            Add to Cart
                                        </a>
                                    </div>
                                </div>
                            {else}
                                <div class="domain-result-actions flex flex-col gap-2 pt-4 lg:pt-0 border-t lg:border-t-0 lg:border-l border-gray-700 lg:pl-6">
                                    <div class="text-text-light text-sm">This domain is not available for registration.</div>
                                    <button class="btn-outline text-sm px-4 py-2 w-full sm:w-auto" onclick="suggestAlternatives('{if isset($result.domain)}{$result.domain}{elseif isset($result.domainname)}{$result.domainname}{elseif isset($result.sld) && isset($result.tld)}{$result.sld}.{$result.tld}{/if}')">
                                        <svg class="w-4 h-4 mr-2 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.663 17h4.673M12 3v1m6.364 1.636l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z"/>
                                        </svg>
                                        Find Alternatives
                                    </button>
                                </div>
                            {/if}
                        </div>
                    {/foreach}
                    
                    <!-- Additional Actions -->
                    <div class="bg-dark-bg-alt border border-gray-700 rounded-lg p-6 mt-8">
                        <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
                            <div>
                                <h3 class="text-white font-semibold mb-2">Need help choosing?</h3>
                                <p class="text-text-light text-sm">Our domain experts can help you find the perfect domain name for your project.</p>
                            </div>
                            <div class="button-group">
                                <a href="{$WEB_ROOT}/contact.php" class="btn-outline px-4 py-2 text-center">
                                    Contact Support
                                </a>
                                <button onclick="searchAgain()" class="btn-secondary px-4 py-2">
                                    <svg class="w-4 h-4 mr-2 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
                                    </svg>
                                    Search Again
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        {elseif isset($searchterm) && $searchterm}
            <div class="text-center py-12" id="no-results">
                <div class="bg-blue-900/20 border border-blue-600/50 rounded-lg p-8 max-w-2xl mx-auto">
                    <svg class="w-16 h-16 text-blue-400 mx-auto mb-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
                    </svg>
                    <h3 class="text-blue-300 font-orbitron font-bold text-xl mb-3">No Results Found</h3>
                    <p class="text-blue-200 mb-6">
                        We couldn't find any results for "<strong>{$searchterm}</strong>". 
                        Try a different domain name or check your spelling.
                    </p>
                    <div class="button-group justify-center">
                        <button onclick="searchAgain()" class="btn-primary px-6 py-3">
                            <svg class="w-4 h-4 mr-2 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
                            </svg>
                            Try Another Search
                        </button>
                        <button onclick="suggestAlternatives('{$searchterm}')" class="btn-outline px-6 py-3">
                            <svg class="w-4 h-4 mr-2 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.663 17h4.673M12 3v1m6.364 1.636l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z"/>
                            </svg>
                            Get Suggestions
                        </button>
                    </div>
                </div>
            </div>
        {/if}

        <!-- Popular Extensions -->
        <div class="mt-12">
            <h2 class="text-2xl font-orbitron font-bold text-white mb-6 text-center">Popular Domain Extensions</h2>
            <div class="responsive-grid-auto">
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

<script>
// Enhanced domain search functionality
function searchAgain() {
    const domainInput = document.getElementById('domain');
    if (domainInput) {
        domainInput.focus();
        domainInput.select();
        // Smooth scroll to search form
        document.getElementById('domain-search-form').scrollIntoView({ 
            behavior: 'smooth', 
            block: 'start' 
        });
    }
}

function suggestAlternatives(domain) {
    const cleanDomain = domain.replace(/\.[a-z]+$/i, ''); // Remove extension
    const suggestions = [
        cleanDomain + 'site',
        cleanDomain + 'app', 
        cleanDomain + 'web',
        cleanDomain + 'online',
        cleanDomain + 'pro',
        'my' + cleanDomain,
        'get' + cleanDomain
    ];
    
    // Create suggestion modal
    const modal = document.createElement('div');
    modal.className = 'fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-75';
    modal.innerHTML = `
        <div class="card-dark max-w-md mx-4 max-h-96 overflow-y-auto">
            <div class="flex justify-between items-center mb-4">
                <h3 class="text-xl font-orbitron font-bold text-white">Domain Suggestions</h3>
                <button class="close-modal text-gray-400 hover:text-white text-2xl">&times;</button>
            </div>
            <div class="space-y-2 mb-6">
                ${suggestions.map(suggestion => `
                    <div class="flex items-center justify-between p-3 bg-dark-bg-alt rounded-lg hover:bg-gray-700 transition-colors cursor-pointer" 
                         onclick="searchSuggestion('${suggestion}')">
                        <span class="text-white">${suggestion}</span>
                        <svg class="w-4 h-4 text-neon-green" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
                        </svg>
                    </div>
                `).join('')}
            </div>
            <button class="close-modal btn-outline w-full">Close</button>
        </div>
    `;

    document.body.appendChild(modal);

    // Handle modal close
    modal.querySelectorAll('.close-modal').forEach(btn => {
        btn.addEventListener('click', function() {
            document.body.removeChild(modal);
        });
    });

    // Close on backdrop click
    modal.addEventListener('click', function(e) {
        if (e.target === modal) {
            document.body.removeChild(modal);
        }
    });
}

function searchSuggestion(domain) {
    const domainInput = document.getElementById('domain');
    if (domainInput) {
        domainInput.value = domain;
        // Close modal
        const modal = document.querySelector('.fixed.inset-0');
        if (modal) {
            document.body.removeChild(modal);
        }
        // Focus and scroll to form
        searchAgain();
    }
}

// Add animation class for results
document.addEventListener('DOMContentLoaded', function() {
    const results = document.getElementById('domain-search-results');
    if (results) {
        results.style.opacity = '0';
        results.style.transform = 'translateY(20px)';
        setTimeout(() => {
            results.style.transition = 'all 0.5s ease';
            results.style.opacity = '1';
            results.style.transform = 'translateY(0)';
        }, 100);
    }
});
</script>

<script src="{$WEB_ROOT}/templates/{$template}/js/domain-search.js"></script>
