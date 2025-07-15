{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-6xl mx-auto">
        
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                <span class="glow-text">My Domains</span>
            </h1>
            <p class="text-text-light">
                Manage your domain registrations, DNS settings, and domain services.
            </p>
        </div>
        
        <!-- Domain Stats -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-neon-green mb-2">
                    {if $domainsstats.total}{$domainsstats.total}{else}0{/if}
                </div>
                <div class="text-text-light text-sm">Total Domains</div>
            </div>
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-electric-blue mb-2">
                    {if $domainsstats.active}{$domainsstats.active}{else}0{/if}
                </div>
                <div class="text-text-light text-sm">Active</div>
            </div>
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-orange-400 mb-2">
                    {if $domainsstats.expiring}{$domainsstats.expiring}{else}0{/if}
                </div>
                <div class="text-text-light text-sm">Expiring Soon</div>
            </div>
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-red-400 mb-2">
                    {if $domainsstats.expired}{$domainsstats.expired}{else}0{/if}
                </div>
                <div class="text-text-light text-sm">Expired</div>
            </div>
        </div>
        
        <!-- Register New Domain -->
        <div class="card-dark mb-8">
            <h2 class="text-xl font-semibold text-white mb-4">Register New Domain</h2>
            <form method="post" action="{$WEB_ROOT}/domainchecker.php" class="flex gap-4">
                <div class="flex-1">
                    <input type="text" name="domain" placeholder="Enter domain name (e.g., yoursite.com)" 
                           class="input-dark w-full" required>
                </div>
                <button type="submit" name="search" class="btn-primary whitespace-nowrap">
                    Search Domain
                </button>
            </form>
        </div>
        
        {if $domains}
            <!-- Domains List -->
            <div class="space-y-6">
                {foreach from=$domains item=domain}
                    <div class="card-dark">
                        <div class="flex flex-col lg:flex-row lg:items-center lg:justify-between">
                            <div class="flex-1">
                                <div class="flex items-start justify-between mb-4 lg:mb-0">
                                    <div>
                                        <h3 class="text-xl font-semibold text-white mb-2">
                                            {$domain.domain}
                                        </h3>
                                        <div class="space-y-1">
                                            <div class="flex items-center space-x-4 text-sm">
                                                <span class="text-text-light">Registered:</span>
                                                <span class="text-neon-green">{$domain.registrationdate}</span>
                                            </div>
                                            <div class="flex items-center space-x-4 text-sm">
                                                <span class="text-text-light">Expires:</span>
                                                <span class="text-{if $domain.daysuntilexpiry < 30}red-400{elseif $domain.daysuntilexpiry < 90}orange-400{else}electric-blue{/if}">
                                                    {$domain.expirydate} ({$domain.daysuntilexpiry} days)
                                                </span>
                                            </div>
                                            {if $domain.nextduedate}
                                                <div class="flex items-center space-x-4 text-sm">
                                                    <span class="text-text-light">Next Due:</span>
                                                    <span class="text-text-light">{$domain.nextduedate}</span>
                                                </div>
                                            {/if}
                                        </div>
                                    </div>
                                    
                                    <!-- Status Badge -->
                                    <div>
                                        {if $domain.status == 'Active'}
                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-green-900 text-green-200">
                                                <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                                                </svg>
                                                Active
                                            </span>
                                        {elseif $domain.status == 'Expired'}
                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-red-900 text-red-200">
                                                <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                                                </svg>
                                                Expired
                                            </span>
                                        {elseif $domain.status == 'Pending'}
                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-yellow-900 text-yellow-200">
                                                <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-12a1 1 0 10-2 0v4a1 1 0 00.293.707l2.828 2.829a1 1 0 101.415-1.415L11 9.586V6z" clip-rule="evenodd"/>
                                                </svg>
                                                Pending
                                            </span>
                                        {else}
                                            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-gray-900 text-gray-200">
                                                {$domain.status}
                                            </span>
                                        {/if}
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Action Buttons -->
                            <div class="flex flex-wrap gap-2 mt-4 lg:mt-0 lg:ml-6">
                                <a href="{$WEB_ROOT}/clientarea.php?action=domaindetails&id={$domain.id}" 
                                   class="btn-outline text-xs px-3 py-1">
                                    Manage
                                </a>
                                
                                {if $domain.status == 'Active'}
                                    <a href="{$WEB_ROOT}/clientarea.php?action=domaindns&domainid={$domain.id}" 
                                       class="btn-secondary text-xs px-3 py-1">
                                        DNS
                                    </a>
                                    
                                    <a href="{$WEB_ROOT}/clientarea.php?action=domaincontacts&domainid={$domain.id}" 
                                       class="btn-secondary text-xs px-3 py-1">
                                        Contacts
                                    </a>
                                {/if}
                                
                                {if $domain.canrenew}
                                    <a href="{$WEB_ROOT}/cart.php?a=renewdomain&domain={$domain.domain}" 
                                       class="btn-primary text-xs px-3 py-1">
                                        Renew
                                    </a>
                                {/if}
                            </div>
                        </div>
                        
                        <!-- Additional Domain Services -->
                        {if $domain.addons}
                            <div class="mt-4 pt-4 border-t border-gray-700">
                                <h4 class="text-sm font-medium text-white mb-3">Active Services:</h4>
                                <div class="flex flex-wrap gap-2">
                                    {foreach from=$domain.addons item=addon}
                                        <span class="inline-flex items-center px-2 py-1 rounded text-xs bg-dark-bg border border-neon-green text-neon-green">
                                            {$addon.name}
                                        </span>
                                    {/foreach}
                                </div>
                            </div>
                        {/if}
                        
                        {if $domain.nameservers}
                            <div class="mt-4 pt-4 border-t border-gray-700">
                                <h4 class="text-sm font-medium text-white mb-3">Nameservers:</h4>
                                <div class="grid grid-cols-1 md:grid-cols-2 gap-2 text-sm">
                                    {foreach from=$domain.nameservers item=ns}
                                        <div class="text-text-light font-mono">{$ns}</div>
                                    {/foreach}
                                </div>
                            </div>
                        {/if}
                    </div>
                {/foreach}
            </div>
        {else}
            <!-- No Domains -->
            <div class="card-dark text-center py-12">
                <div class="mx-auto w-20 h-20 bg-gradient-to-br from-gray-600 to-gray-700 rounded-full flex items-center justify-center mb-6">
                    <svg class="w-10 h-10 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M12.316 3.051a1 1 0 01.633 1.265l-4 12a1 1 0 11-1.898-.632l4-12a1 1 0 011.265-.633zM5.707 6.293a1 1 0 010 1.414L3.414 10l2.293 2.293a1 1 0 11-1.414 1.414l-3-3a1 1 0 010-1.414l3-3a1 1 0 011.414 0zm8.586 0a1 1 0 011.414 0l3 3a1 1 0 010 1.414l-3 3a1 1 0 11-1.414-1.414L16.586 10l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">No Domains Yet</h3>
                <p class="text-text-light mb-6">
                    You haven't registered any domains with us yet. Get started by searching for your perfect domain name.
                </p>
                <a href="{$WEB_ROOT}/domainchecker.php" class="btn-primary">
                    Search Domains
                </a>
            </div>
        {/if}
        
        <!-- Quick Actions -->
        <div class="mt-8 grid grid-cols-1 md:grid-cols-3 gap-6">
            <div class="card-dark text-center">
                <svg class="w-12 h-12 text-neon-green mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"/>
                </svg>
                <h3 class="text-lg font-semibold text-white mb-2">Domain Search</h3>
                <p class="text-text-light text-sm mb-4">Find and register new domain names</p>
                <a href="{$WEB_ROOT}/domainchecker.php" class="btn-outline">Search Domains</a>
            </div>
            
            <div class="card-dark text-center">
                <svg class="w-12 h-12 text-electric-blue mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z" clip-rule="evenodd"/>
                </svg>
                <h3 class="text-lg font-semibold text-white mb-2">Transfer Domain</h3>
                <p class="text-text-light text-sm mb-4">Transfer existing domains to us</p>
                <a href="{$WEB_ROOT}/cart.php?a=transfer" class="btn-outline">Transfer Domain</a>
            </div>
            
            <div class="card-dark text-center">
                <svg class="w-12 h-12 text-cyber-purple mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M3 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"/>
                </svg>
                <h3 class="text-lg font-semibold text-white mb-2">Bulk Management</h3>
                <p class="text-text-light text-sm mb-4">Manage multiple domains at once</p>
                <a href="{$WEB_ROOT}/clientarea.php?action=bulkdomainmanagement" class="btn-outline">Bulk Management</a>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}