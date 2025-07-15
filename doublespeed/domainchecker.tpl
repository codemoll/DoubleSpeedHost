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
                                   value="{if $searchterm}{$searchterm}{/if}"
                                   placeholder="yourdomain"
                                   class="input-dark w-full text-lg py-4"
                                   required>
                        </div>
                        <div class="sm:w-48">
                            <select name="ext" class="input-dark w-full py-4 text-lg">
                                <option value=".com">.com</option>
                                <option value=".net">.net</option>
                                <option value=".org">.org</option>
                                <option value=".info">.info</option>
                                <option value=".biz">.biz</option>
                                <option value=".us">.us</option>
                                <option value=".io">.io</option>
                                <option value=".co">.co</option>
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
        {if $results}
            <div class="space-y-4">
                <h2 class="text-2xl font-orbitron font-bold text-white mb-6">Search Results</h2>
                
                {foreach $results as $result}
                    <div class="domain-result {if $result.status eq 'available'}available{else}unavailable{/if}">
                        <div class="domain-name">{$result.domain}</div>
                        <div class="domain-status">
                            {if $result.status eq 'available'}
                                Available
                            {else}
                                Unavailable
                            {/if}
                        </div>
                        {if $result.status eq 'available'}
                            <div class="domain-price">{$result.price}</div>
                            <div class="domain-action">
                                <a href="cart.php?a=add&domain=register&query={$result.domain}" class="btn-primary text-sm">
                                    Add to Cart
                                </a>
                            </div>
                        {/if}
                    </div>
                {/foreach}
            </div>
        {/if}

        <!-- Popular Extensions -->
        <div class="mt-12">
            <h2 class="text-2xl font-orbitron font-bold text-white mb-6 text-center">Popular Domain Extensions</h2>
            <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-4">
                <div class="card-dark text-center py-4">
                    <div class="text-lg font-orbitron font-bold text-neon-green">.COM</div>
                    <div class="text-text-light text-sm">$12.99/year</div>
                </div>
                <div class="card-dark text-center py-4">
                    <div class="text-lg font-orbitron font-bold text-electric-blue">.NET</div>
                    <div class="text-text-light text-sm">$14.99/year</div>
                </div>
                <div class="card-dark text-center py-4">
                    <div class="text-lg font-orbitron font-bold text-cyber-purple">.ORG</div>
                    <div class="text-text-light text-sm">$13.99/year</div>
                </div>
                <div class="card-dark text-center py-4">
                    <div class="text-lg font-orbitron font-bold text-yellow-500">.IO</div>
                    <div class="text-text-light text-sm">$59.99/year</div>
                </div>
                <div class="card-dark text-center py-4">
                    <div class="text-lg font-orbitron font-bold text-green-400">.CO</div>
                    <div class="text-text-light text-sm">$29.99/year</div>
                </div>
                <div class="card-dark text-center py-4">
                    <div class="text-lg font-orbitron font-bold text-orange-400">.INFO</div>
                    <div class="text-text-light text-sm">$18.99/year</div>
                </div>
            </div>
        </div>
        
    </div>
</div>

{include file="$template/footer.tpl"}
