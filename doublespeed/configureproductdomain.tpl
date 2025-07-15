{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-20 px-4 sm:px-6 lg:px-8">
    <div class="max-w-4xl mx-auto">
        <!-- Header -->
        <div class="text-center mb-8">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-4">
                Configure Domain
            </h1>
            <p class="text-lg text-text-light">
                Configure domain settings for your hosting service
            </p>
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

        <form method="post" action="{$smarty.server.PHP_SELF}">
            <div class="space-y-8">

                <!-- Domain Options -->
                <div class="card-dark">
                    <h2 class="text-xl font-orbitron font-semibold text-white mb-6">Domain Configuration</h2>
                    
                    <div class="space-y-6">
                        {if $domainoptions}
                            {foreach from=$domainoptions item=option key=type}
                                <label class="block">
                                    <div class="flex items-start space-x-3">
                                        <input type="radio" name="domaintype" value="{$type}" 
                                               {if $selecteddomaintype eq $type}checked{/if}
                                               class="mt-1" onchange="toggleDomainFields(this.value)">
                                        <div class="flex-1">
                                            <div class="text-white font-medium mb-2">{$option.name}</div>
                                            {if $option.description}
                                                <p class="text-text-light text-sm">{$option.description}</p>
                                            {/if}
                                            {if $option.price}
                                                <span class="text-neon-green font-bold">{$option.price}</span>
                                            {/if}
                                        </div>
                                    </div>
                                </label>
                            {/foreach}
                        {else}
                            <!-- Default domain options when WHMCS variables not available -->
                            <label class="block">
                                <div class="flex items-start space-x-3">
                                    <input type="radio" name="domaintype" value="register" checked class="mt-1" onchange="toggleDomainFields(this.value)">
                                    <div class="flex-1">
                                        <div class="text-white font-medium mb-2">Register a new domain</div>
                                        <p class="text-text-light text-sm">Register a brand new domain name</p>
                                    </div>
                                </div>
                            </label>
                            
                            <label class="block">
                                <div class="flex items-start space-x-3">
                                    <input type="radio" name="domaintype" value="transfer" class="mt-1" onchange="toggleDomainFields(this.value)">
                                    <div class="flex-1">
                                        <div class="text-white font-medium mb-2">Transfer domain from another registrar</div>
                                        <p class="text-text-light text-sm">Transfer an existing domain to us</p>
                                    </div>
                                </div>
                            </label>
                            
                            <label class="block">
                                <div class="flex items-start space-x-3">
                                    <input type="radio" name="domaintype" value="owndomain" class="mt-1" onchange="toggleDomainFields(this.value)">
                                    <div class="flex-1">
                                        <div class="text-white font-medium mb-2">Use my own domain</div>
                                        <p class="text-text-light text-sm">I will use an existing domain and update my nameservers</p>
                                    </div>
                                </div>
                            </label>
                            
                            <label class="block">
                                <div class="flex items-start space-x-3">
                                    <input type="radio" name="domaintype" value="subdomain" class="mt-1" onchange="toggleDomainFields(this.value)">
                                    <div class="flex-1">
                                        <div class="text-white font-medium mb-2">Use a subdomain</div>
                                        <p class="text-text-light text-sm">Use a free subdomain (e.g., yourdomain.oursite.com)</p>
                                    </div>
                                </div>
                            </label>
                        {/if}
                    </div>
                </div>

                <!-- Domain Input Fields -->
                <div class="card-dark">
                    <h3 class="text-lg font-orbitron font-semibold text-white mb-6">Domain Details</h3>
                    
                    <!-- Register Domain -->
                    <div id="register-fields" class="domain-fields">
                        <div class="space-y-4">
                            <div>
                                <label class="block text-sm font-medium text-text-light mb-2">
                                    Domain Name <span class="text-red-400">*</span>
                                </label>
                                <div class="flex">
                                    <input type="text" name="sld" value="{if isset($sld)}{$sld}{/if}" 
                                           placeholder="yourdomain" class="input-dark flex-1 rounded-r-none">
                                    <select name="tld" class="select-dark rounded-l-none border-l-0 w-32">
                                        {if $tlds}
                                            {foreach from=$tlds item=tld}
                                                <option value="{$tld.tld}" {if isset($selectedtld) && $selectedtld eq $tld.tld}selected{/if}>
                                                    .{$tld.tld}
                                                </option>
                                            {/foreach}
                                        {else}
                                            <option value="com">.com</option>
                                            <option value="net">.net</option>
                                            <option value="org">.org</option>
                                            <option value="info">.info</option>
                                            <option value="biz">.biz</option>
                                        {/if}
                                    </select>
                                </div>
                            </div>
                            
                            {if isset($domainregperiods)}
                                <div>
                                    <label class="block text-sm font-medium text-text-light mb-2">
                                        Registration Period
                                    </label>
                                    <select name="regperiod" class="select-dark">
                                        {foreach from=$domainregperiods item=period key=years}
                                            <option value="{$years}">{$years} Year{if $years > 1}s{/if} - {$period}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            {/if}
                        </div>
                    </div>

                    <!-- Transfer Domain -->
                    <div id="transfer-fields" class="domain-fields" style="display: none;">
                        <div class="space-y-4">
                            <div>
                                <label class="block text-sm font-medium text-text-light mb-2">
                                    Domain to Transfer <span class="text-red-400">*</span>
                                </label>
                                <input type="text" name="transferdomain" value="{if isset($transferdomain)}{$transferdomain}{/if}" 
                                       placeholder="yourdomain.com" class="input-dark">
                            </div>
                            
                            <div>
                                <label class="block text-sm font-medium text-text-light mb-2">
                                    EPP/Authorization Code
                                </label>
                                <input type="text" name="eppcode" value="{if isset($eppcode)}{$eppcode}{/if}" 
                                       placeholder="Enter EPP code" class="input-dark">
                                <p class="text-text-light text-sm mt-1">
                                    Required for most TLDs. Contact your current registrar to obtain this code.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Own Domain -->
                    <div id="owndomain-fields" class="domain-fields" style="display: none;">
                        <div>
                            <label class="block text-sm font-medium text-text-light mb-2">
                                Your Domain <span class="text-red-400">*</span>
                            </label>
                            <input type="text" name="hostname" value="{if isset($hostname)}{$hostname}{/if}" 
                                   placeholder="yourdomain.com" class="input-dark">
                            <p class="text-text-light text-sm mt-1">
                                Enter your existing domain name. You'll need to update your nameservers to point to our hosting.
                            </p>
                        </div>
                    </div>

                    <!-- Subdomain -->
                    <div id="subdomain-fields" class="domain-fields" style="display: none;">
                        <div>
                            <label class="block text-sm font-medium text-text-light mb-2">
                                Subdomain <span class="text-red-400">*</span>
                            </label>
                            <div class="flex">
                                <input type="text" name="subdomain" value="{if isset($subdomain)}{$subdomain}{/if}" 
                                       placeholder="yoursite" class="input-dark flex-1 rounded-r-none">
                                <select name="subdomainsuffix" class="select-dark rounded-l-none border-l-0">
                                    {if $subdomainsuffixes}
                                        {foreach from=$subdomainsuffixes item=suffix}
                                            <option value="{$suffix}">{$suffix}</option>
                                        {/foreach}
                                    {else}
                                        <option value=".doublespeedhost.com">.doublespeedhost.com</option>
                                        <option value=".hosting.com">.hosting.com</option>
                                    {/if}
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Nameservers -->
                <div class="card-dark">
                    <h3 class="text-lg font-orbitron font-semibold text-white mb-6">Nameservers</h3>
                    
                    <div class="space-y-4">
                        <label class="flex items-center">
                            <input type="radio" name="nschoice" value="default" checked class="mr-3">
                            <span class="text-white">Use default nameservers</span>
                        </label>
                        
                        <label class="flex items-center">
                            <input type="radio" name="nschoice" value="custom" class="mr-3" onchange="toggleCustomNS(this.checked)">
                            <span class="text-white">Use custom nameservers</span>
                        </label>
                        
                        <div id="custom-ns" style="display: none;" class="ml-6 space-y-3">
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div>
                                    <label class="block text-sm font-medium text-text-light mb-2">Nameserver 1</label>
                                    <input type="text" name="ns1" value="{if isset($ns1)}{$ns1}{/if}" class="input-dark">
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-text-light mb-2">Nameserver 2</label>
                                    <input type="text" name="ns2" value="{if isset($ns2)}{$ns2}{/if}" class="input-dark">
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-text-light mb-2">Nameserver 3 (Optional)</label>
                                    <input type="text" name="ns3" value="{if isset($ns3)}{$ns3}{/if}" class="input-dark">
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-text-light mb-2">Nameserver 4 (Optional)</label>
                                    <input type="text" name="ns4" value="{if isset($ns4)}{$ns4}{/if}" class="input-dark">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Actions -->
                <div class="flex justify-between">
                    <a href="{$WEB_ROOT}/cart.php" class="btn-secondary">
                        ← Back to Cart
                    </a>
                    <button type="submit" name="continue" class="btn-primary">
                        Continue →
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
function toggleDomainFields(type) {
    // Hide all domain fields
    const fields = document.querySelectorAll('.domain-fields');
    fields.forEach(field => field.style.display = 'none');
    
    // Show the selected type
    const targetField = document.getElementById(type + '-fields');
    if (targetField) {
        targetField.style.display = 'block';
    }
}

function toggleCustomNS(show) {
    const customNS = document.getElementById('custom-ns');
    customNS.style.display = show ? 'block' : 'none';
}

// Initialize on page load
document.addEventListener('DOMContentLoaded', function() {
    const selectedType = document.querySelector('input[name="domaintype"]:checked');
    if (selectedType) {
        toggleDomainFields(selectedType.value);
    }
});
</script>

{include file="$template/footer.tpl"}