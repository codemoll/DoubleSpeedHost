{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        
        <!-- Page Header -->
        <div class="mb-8">
            <div class="flex items-center space-x-3 mb-4">
                <a href="{$WEB_ROOT}/clientarea.php?action=domains" 
                   class="text-neon-green hover:text-electric-blue transition-colors duration-300">
                    <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z" clip-rule="evenodd"/>
                    </svg>
                </a>
                <h1 class="text-4xl font-orbitron font-bold text-white">
                    <span class="glow-text">Domain Details</span>
                </h1>
            </div>
            <p class="text-text-light">
                Manage your domain: <span class="text-neon-green font-semibold">{$domain}</span>
            </p>
        </div>
        
        <!-- Domain Overview -->
        <div class="card-dark mb-8">
            <div class="flex flex-col lg:flex-row lg:items-center lg:justify-between">
                <div class="mb-6 lg:mb-0">
                    <h2 class="text-2xl font-semibold text-white mb-4">{$domain}</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm">
                        <div class="space-y-2">
                            <div class="flex justify-between">
                                <span class="text-text-light">Status:</span>
                                <span class="text-{if $status == 'Active'}green-400{elseif $status == 'Expired'}red-400{else}orange-400{/if}">
                                    {$status}
                                </span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-text-light">Registration Date:</span>
                                <span class="text-white">{$registrationdate}</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-text-light">Expiry Date:</span>
                                <span class="text-{if $daysuntilexpiry < 30}red-400{elseif $daysuntilexpiry < 90}orange-400{else}white{/if}">
                                    {$expirydate}
                                </span>
                            </div>
                        </div>
                        <div class="space-y-2">
                            <div class="flex justify-between">
                                <span class="text-text-light">Auto Renew:</span>
                                <span class="text-{if $autorenew}neon-green{else}red-400{/if}">
                                    {if $autorenew}Enabled{else}Disabled{/if}
                                </span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-text-light">Registrar:</span>
                                <span class="text-white">{$registrar}</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-text-light">Next Due Date:</span>
                                <span class="text-white">{$nextduedate}</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Quick Actions -->
                <div class="flex flex-col space-y-3 lg:ml-6">
                    {if $canrenew}
                        <a href="{$WEB_ROOT}/cart.php?a=renewdomain&domain={$domain}" 
                           class="btn-primary text-center">
                            Renew Domain
                        </a>
                    {/if}
                    
                    <button onclick="toggleAutoRenew()" class="btn-secondary">
                        {if $autorenew}Disable{else}Enable{/if} Auto Renew
                    </button>
                </div>
            </div>
        </div>
        
        <!-- Management Sections -->
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            
            <!-- Nameservers -->
            <div class="card-dark">
                <div class="flex items-center justify-between mb-6">
                    <h3 class="text-xl font-semibold text-white">Nameservers</h3>
                    <button onclick="editNameservers()" class="btn-outline text-sm px-3 py-1">
                        Edit
                    </button>
                </div>
                
                <div id="nameservers-display">
                    {if $nameservers}
                        <div class="space-y-2">
                            {foreach from=$nameservers item=ns}
                                <div class="flex items-center space-x-3">
                                    <div class="w-2 h-2 bg-neon-green rounded-full"></div>
                                    <span class="text-text-light font-mono text-sm">{$ns}</span>
                                </div>
                            {/foreach}
                        </div>
                    {else}
                        <p class="text-text-light text-sm">No nameservers configured</p>
                    {/if}
                </div>
                
                <div id="nameservers-edit" class="hidden">
                    <form method="post" action="{$smarty.server.PHP_SELF}" class="space-y-4">
                        <input type="hidden" name="action" value="domainnameservers" />
                        <input type="hidden" name="domainid" value="{$domainid}" />
                        
                        {for $i=1 to 4}
                            <div>
                                <label for="ns{$i}" class="block text-sm font-medium text-white mb-2">
                                    Nameserver {$i}:
                                </label>
                                <input type="text" id="ns{$i}" name="ns{$i}" 
                                       class="input-dark w-full" 
                                       placeholder="ns{$i}.example.com"
                                       value="{if $nameservers[$i-1]}{$nameservers[$i-1]}{/if}">
                            </div>
                        {/for}
                        
                        <div class="flex space-x-3">
                            <button type="submit" name="submit" class="btn-primary">
                                Update Nameservers
                            </button>
                            <button type="button" onclick="cancelEditNameservers()" class="btn-outline">
                                Cancel
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            
            <!-- Contact Information -->
            <div class="card-dark">
                <div class="flex items-center justify-between mb-6">
                    <h3 class="text-xl font-semibold text-white">Contact Information</h3>
                    <a href="{$WEB_ROOT}/clientarea.php?action=domaincontacts&domainid={$domainid}" 
                       class="btn-outline text-sm px-3 py-1">
                        Manage
                    </a>
                </div>
                
                <div class="space-y-4">
                    <div>
                        <h4 class="text-sm font-medium text-neon-green mb-2">Registrant Contact</h4>
                        <div class="text-sm text-text-light">
                            {if $contacts.registrant}
                                <div>{$contacts.registrant.firstname} {$contacts.registrant.lastname}</div>
                                <div>{$contacts.registrant.email}</div>
                                {if $contacts.registrant.organization}
                                    <div>{$contacts.registrant.organization}</div>
                                {/if}
                            {else}
                                <div>Contact information not available</div>
                            {/if}
                        </div>
                    </div>
                    
                    <div>
                        <h4 class="text-sm font-medium text-electric-blue mb-2">Administrative Contact</h4>
                        <div class="text-sm text-text-light">
                            {if $contacts.admin}
                                <div>{$contacts.admin.firstname} {$contacts.admin.lastname}</div>
                                <div>{$contacts.admin.email}</div>
                            {else}
                                <div>Same as registrant</div>
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        
        <!-- DNS Management -->
        {if $dnsmanagement}
            <div class="card-dark mt-8">
                <div class="flex items-center justify-between mb-6">
                    <h3 class="text-xl font-semibold text-white">DNS Management</h3>
                    <a href="{$WEB_ROOT}/clientarea.php?action=domaindns&domainid={$domainid}" 
                       class="btn-secondary">
                        Manage DNS Records
                    </a>
                </div>
                
                <p class="text-text-light text-sm">
                    Manage your domain's DNS records including A, CNAME, MX, and TXT records.
                </p>
            </div>
        {/if}
        
        <!-- Email Forwarding -->
        {if $emailforwarding}
            <div class="card-dark mt-8">
                <div class="flex items-center justify-between mb-6">
                    <h3 class="text-xl font-semibold text-white">Email Forwarding</h3>
                    <a href="{$WEB_ROOT}/clientarea.php?action=domainemailforwarding&domainid={$domainid}" 
                       class="btn-secondary">
                        Manage Forwarding
                    </a>
                </div>
                
                <p class="text-text-light text-sm">
                    Set up email forwarding to redirect emails from your domain to existing email addresses.
                </p>
            </div>
        {/if}
        
        <!-- Domain Addons -->
        {if $addons}
            <div class="card-dark mt-8">
                <h3 class="text-xl font-semibold text-white mb-6">Domain Services</h3>
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    {foreach from=$addons item=addon}
                        <div class="flex items-center justify-between p-4 bg-dark-bg rounded-lg border border-gray-700">
                            <div>
                                <div class="text-white font-medium">{$addon.name}</div>
                                <div class="text-text-light text-sm">{$addon.description}</div>
                            </div>
                            <div class="text-right">
                                <div class="text-neon-green font-semibold">{$addon.price}</div>
                                {if $addon.active}
                                    <span class="text-green-400 text-xs">Active</span>
                                {else}
                                    <a href="{$addon.order_url}" class="text-electric-blue hover:text-neon-green text-xs">
                                        Order
                                    </a>
                                {/if}
                            </div>
                        </div>
                    {/foreach}
                </div>
            </div>
        {/if}
        
        <!-- Transfer Domain -->
        {if $transferout}
            <div class="card-dark mt-8">
                <h3 class="text-xl font-semibold text-white mb-6">Transfer Domain</h3>
                
                <div class="bg-yellow-900 border border-yellow-700 rounded-lg p-4 mb-4">
                    <div class="flex">
                        <svg class="w-5 h-5 text-yellow-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
                        </svg>
                        <div class="text-yellow-200 text-sm">
                            <strong>Important:</strong> Transferring your domain to another registrar will move it away from our management.
                        </div>
                    </div>
                </div>
                
                <p class="text-text-light text-sm mb-4">
                    To transfer this domain to another registrar, you'll need the EPP/authorization code.
                </p>
                
                <a href="{$WEB_ROOT}/clientarea.php?action=domainepp&domainid={$domainid}" 
                   class="btn-outline">
                    Get EPP Code
                </a>
            </div>
        {/if}
    </div>
</div>

<script>
function editNameservers() {
    document.getElementById('nameservers-display').classList.add('hidden');
    document.getElementById('nameservers-edit').classList.remove('hidden');
}

function cancelEditNameservers() {
    document.getElementById('nameservers-display').classList.remove('hidden');
    document.getElementById('nameservers-edit').classList.add('hidden');
}

function toggleAutoRenew() {
    // This would typically make an AJAX call to toggle auto-renewal
    // For now, we'll just reload the page with a parameter
    window.location.href = '{$WEB_ROOT}/clientarea.php?action=domaindetails&id={$domainid}&autorenew=toggle';
}
</script>

{include file="$template/footer.tpl"}