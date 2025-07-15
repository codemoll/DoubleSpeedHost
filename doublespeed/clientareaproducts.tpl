{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-20 px-4 sm:px-6 lg:px-8">
    <div class="max-w-7xl mx-auto">
        <!-- Header -->
        <div class="flex items-center justify-between mb-8">
            <div>
                <h1 class="text-3xl font-orbitron font-bold text-white">My Products & Services</h1>
                <p class="text-text-light">Manage your hosting products and services</p>
            </div>
            <a href="{$WEB_ROOT}/cart.php" class="btn-primary">
                Order New Services
            </a>
        </div>

        {if $products}
            <div class="space-y-6">
                {foreach from=$products item=product}
                    <div class="card-dark">
                        <div class="flex items-center justify-between mb-4">
                            <div class="flex items-center space-x-4">
                                <div class="w-12 h-12 bg-gradient-to-br from-neon-green to-electric-blue rounded-lg flex items-center justify-center">
                                    <svg class="w-6 h-6 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                                        <path d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z"/>
                                    </svg>
                                </div>
                                <div>
                                    <h3 class="text-lg font-semibold text-white">{$product.product}</h3>
                                    <p class="text-text-light">{$product.domain}</p>
                                </div>
                            </div>
                            
                            <div class="text-right">
                                <div class="flex items-center space-x-2 mb-1">
                                    <div class="w-2 h-2 rounded-full {if $product.status eq 'Active'}bg-green-500{elseif $product.status eq 'Suspended'}bg-red-500{else}bg-yellow-500{/if}"></div>
                                    <span class="text-sm font-medium {if $product.status eq 'Active'}text-green-400{elseif $product.status eq 'Suspended'}text-red-400{else}text-yellow-400{/if}">
                                        {$product.status}
                                    </span>
                                </div>
                                <p class="text-text-light text-sm">Next Due: {$product.nextduedate}</p>
                            </div>
                        </div>
                        
                        <div class="flex items-center justify-between">
                            <div class="flex items-center space-x-6">
                                <div>
                                    <p class="text-text-light text-sm">Amount</p>
                                    <p class="text-white font-semibold">{$product.amount}</p>
                                </div>
                                <div>
                                    <p class="text-text-light text-sm">Billing Cycle</p>
                                    <p class="text-white font-semibold">{$product.billingcycle}</p>
                                </div>
                                <div>
                                    <p class="text-text-light text-sm">Registration Date</p>
                                    <p class="text-white font-semibold">{$product.regdate}</p>
                                </div>
                            </div>
                            
                            <div class="flex items-center space-x-3">
                                <a href="{$WEB_ROOT}/clientarea.php?action=productdetails&id={$product.id}" class="btn-secondary">
                                    Manage
                                </a>
                                {if $product.status eq 'Active'}
                                    {if $product.serverdata.cpanelurl}
                                        <a href="{$product.serverdata.cpanelurl}" target="_blank" class="btn-primary">
                                            cPanel
                                        </a>
                                    {/if}
                                {/if}
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>
        {else}
            <!-- No Products -->
            <div class="card-dark text-center py-12">
                <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                    <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-orbitron font-semibold text-white mb-4">No Products Yet</h3>
                <p class="text-text-light mb-6">You haven't ordered any products or services yet.</p>
                <a href="{$WEB_ROOT}/cart.php" class="btn-primary">
                    Browse Our Services
                </a>
            </div>
        {/if}

        <!-- Quick Actions -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mt-8">
            <a href="{$WEB_ROOT}/clientarea.php?action=addfunds" class="card-dark hover:border-neon-green transition-colors duration-300">
                <div class="text-center p-6">
                    <svg class="w-10 h-10 text-neon-green mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M4 4a2 2 0 00-2 2v1h16V6a2 2 0 00-2-2H4zM18 9H2v5a2 2 0 002 2h12a2 2 0 002-2V9zM4 13a1 1 0 011-1h1a1 1 0 110 2H5a1 1 0 01-1-1zm5-1a1 1 0 100 2h1a1 1 0 100-2H9z"/>
                    </svg>
                    <h3 class="text-white font-medium">Add Funds</h3>
                    <p class="text-text-light text-sm mt-1">Add credit to your account</p>
                </div>
            </a>
            
            <a href="{$WEB_ROOT}/clientarea.php?action=invoices" class="card-dark hover:border-electric-blue transition-colors duration-300">
                <div class="text-center p-6">
                    <svg class="w-10 h-10 text-electric-blue mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M4 4a2 2 0 012-2h4.586A2 2 0 0112 2.586L15.414 6A2 2 0 0116 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4zm2 6a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm1 3a1 1 0 100 2h6a1 1 0 100-2H7z" clip-rule="evenodd"/>
                    </svg>
                    <h3 class="text-white font-medium">View Invoices</h3>
                    <p class="text-text-light text-sm mt-1">Manage your invoices</p>
                </div>
            </a>
            
            <a href="{$WEB_ROOT}/submitticket.php" class="card-dark hover:border-cyber-purple transition-colors duration-300">
                <div class="text-center p-6">
                    <svg class="w-10 h-10 text-cyber-purple mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-2 0c0 .993-.241 1.929-.668 2.754l-1.524-1.525a3 3 0 00-1.366-1.366l-1.525-1.524c.825-.427 1.761-.668 2.754-.668 2.21 0 4 1.79 4 4zm-6 0a2 2 0 11-4 0 2 2 0 014 0zm-6 0c0-.993.241-1.929.668-2.754L6.192 5.721A6.988 6.988 0 004 10a7 7 0 1014 0c0-1.19-.307-2.311-.845-3.279L15.63 8.246A3 3 0 0013 11.732V14a1 1 0 11-2 0v-2.268A3 3 0 019.268 10H7a1 1 0 110-2h2.268A3 3 0 0111.732 6V4a1 1 0 112 0v2.268A3 3 0 0115.732 8h.537c-.427-.825-1.04-1.562-1.792-2.123z" clip-rule="evenodd"/>
                    </svg>
                    <h3 class="text-white font-medium">Get Support</h3>
                    <p class="text-text-light text-sm mt-1">Open a support ticket</p>
                </div>
            </a>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}