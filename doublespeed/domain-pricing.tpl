{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-6xl mx-auto">
        <div class="mb-8">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-4">Domain Pricing</h1>
        </div>
        
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <div class="space-y-8">
                <div class="text-center">
                    <h2 class="text-2xl font-bold text-white mb-4">Domain Registration Pricing</h2>
                    <p class="text-text-light">Find the perfect domain for your website at competitive prices.</p>
                </div>
                
                {if isset($pricing) && is_array($pricing) && $pricing}
                    <div class="overflow-x-auto">
                        <table class="w-full table-auto">
                            <thead>
                                <tr class="border-b border-gray-600">
                                    <th class="text-left py-4 px-2 md:px-4 text-text-light">Extension</th>
                                    <th class="text-center py-4 px-2 md:px-4 text-text-light hidden sm:table-cell">Registration</th>
                                    <th class="text-center py-4 px-2 md:px-4 text-text-light hidden md:table-cell">Renewal</th>
                                    <th class="text-center py-4 px-2 md:px-4 text-text-light hidden lg:table-cell">Transfer</th>
                                    <th class="text-center py-4 px-2 md:px-4 text-text-light">Price</th>
                                    <th class="text-center py-4 px-2 md:px-4 text-text-light">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $pricing as $tld}
                                    <tr class="border-b border-gray-700 hover:bg-dark-bg transition-colors">
                                        <td class="py-4 px-2 md:px-4">
                                            <span class="text-lg md:text-xl font-bold text-white">
                                                .{if isset($tld.extension)}{$tld.extension}{else}com{/if}
                                            </span>
                                            {if isset($tld.description) && $tld.description}
                                                <p class="text-text-light text-xs md:text-sm hidden sm:block">{$tld.description}</p>
                                            {/if}
                                        </td>
                                        <td class="py-4 px-2 md:px-4 text-center hidden sm:table-cell">
                                            <span class="text-sm md:text-lg font-semibold text-neon-green">
                                                ${if isset($tld.register)}{$tld.register}{else}N/A{/if}
                                            </span>
                                            <p class="text-text-light text-xs hidden md:block">per year</p>
                                        </td>
                                        <td class="py-4 px-2 md:px-4 text-center hidden md:table-cell">
                                            <span class="text-sm md:text-lg font-semibold text-electric-blue">
                                                ${if isset($tld.renew)}{$tld.renew}{else}N/A{/if}
                                            </span>
                                            <p class="text-text-light text-xs">per year</p>
                                        </td>
                                        <td class="py-4 px-2 md:px-4 text-center hidden lg:table-cell">
                                            <span class="text-sm md:text-lg font-semibold text-cyber-purple">
                                                ${if isset($tld.transfer)}{$tld.transfer}{else}N/A{/if}
                                            </span>
                                            <p class="text-text-light text-xs">per year</p>
                                        </td>
                                        <td class="py-4 px-2 md:px-4 text-center sm:hidden">
                                            <div class="space-y-1">
                                                <div class="text-sm font-semibold text-neon-green">
                                                    Reg: ${if isset($tld.register)}{$tld.register}{else}N/A{/if}
                                                </div>
                                                {if isset($tld.renew)}
                                                    <div class="text-xs text-electric-blue">
                                                        Renewal: ${$tld.renew}
                                                    </div>
                                                {/if}
                                            </div>
                                        </td>
                                        <td class="py-4 px-2 md:px-4 text-center">
                                            <a href="{$WEB_ROOT}/cart.php?a=add&domain=register&query=.{if isset($tld.extension)}{$tld.extension}{else}com{/if}" 
                                               class="btn-primary btn-sm text-xs md:text-sm px-2 md:px-4">
                                                Register
                                            </a>
                                        </td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                {else}
                    <div class="text-center py-12">
                        <p class="text-text-light">Domain pricing information is not available at this time.</p>
                    </div>
                {/if}
                
                <div class="bg-dark-bg rounded-lg p-6 border border-gray-600">
                    <h3 class="text-lg font-semibold text-white mb-4">Additional Services</h3>
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                        <div class="text-center">
                            <svg class="w-12 h-12 text-neon-green mx-auto mb-3" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M2.166 4.999A11.954 11.954 0 0010 1.944 11.954 11.954 0 0017.834 5c.11.65.166 1.32.166 2.001 0 5.225-3.34 9.67-8 11.317C5.34 16.67 2 12.225 2 7c0-.682.057-1.35.166-2.001zm11.541 3.708a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                            </svg>
                            <h4 class="text-white font-semibold mb-2">Privacy Protection</h4>
                            <p class="text-text-light text-sm">Protect your personal information from public WHOIS databases.</p>
                        </div>
                        <div class="text-center">
                            <svg class="w-12 h-12 text-electric-blue mx-auto mb-3" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                                <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                            </svg>
                            <h4 class="text-white font-semibold mb-2">Email Forwarding</h4>
                            <p class="text-text-light text-sm">Forward emails from your domain to any email address.</p>
                        </div>
                        <div class="text-center">
                            <svg class="w-12 h-12 text-cyber-purple mx-auto mb-3" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M12.316 3.051a1 1 0 01.633 1.265l-4 12a1 1 0 11-1.898-.632l4-12a1 1 0 011.265-.633zM5.707 6.293a1 1 0 010 1.414L3.414 10l2.293 2.293a1 1 0 11-1.414 1.414l-3-3a1 1 0 010-1.414l3-3a1 1 0 011.414 0zm8.586 0a1 1 0 011.414 0l3 3a1 1 0 010 1.414l-3 3a1 1 0 11-1.414-1.414L16.586 10l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd"/>
                            </svg>
                            <h4 class="text-white font-semibold mb-2">DNS Management</h4>
                            <p class="text-text-light text-sm">Full control over your domain's DNS records and settings.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
