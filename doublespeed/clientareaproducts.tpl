{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-7xl mx-auto">
        
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-3xl md:text-4xl font-orbitron font-bold text-white mb-4">
                My <span class="glow-text">Services</span>
            </h1>
            <p class="text-text-light text-lg">
                Manage all your hosting services, domains, and products from here.
            </p>
        </div>

        <!-- Quick Stats -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-neon-green mb-2">{$numactiveservices}</div>
                <div class="text-text-light text-sm">Active Services</div>
            </div>
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-electric-blue mb-2">{$numsuspendedservices}</div>
                <div class="text-text-light text-sm">Suspended</div>
            </div>
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-cyber-purple mb-2">{$numdomains}</div>
                <div class="text-text-light text-sm">Domains</div>
            </div>
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-yellow-500 mb-2">{$totalservices}</div>
                <div class="text-text-light text-sm">Total Services</div>
            </div>
        </div>

        <!-- Services List -->
        {if $services}
            <div class="space-y-6">
                {foreach $services as $service}
                    <div class="card-dark">
                        <div class="flex flex-col md:flex-row justify-between items-start md:items-center">
                            <div class="flex-1">
                                <div class="flex items-center space-x-4 mb-2">
                                    <h3 class="text-xl font-orbitron font-semibold text-white">
                                        {$service.product}
                                    </h3>
                                    <span class="status 
                                        {if $service.status eq 'Active'}bg-green-900 text-green-300 border-green-600{/if}
                                        {if $service.status eq 'Suspended'}bg-yellow-900 text-yellow-300 border-yellow-600{/if}
                                        {if $service.status eq 'Terminated'}bg-red-900 text-red-300 border-red-600{/if}
                                        {if $service.status eq 'Pending'}bg-blue-900 text-blue-300 border-blue-600{/if}
                                    ">
                                        {$service.status}
                                    </span>
                                </div>
                                {if $service.domain}
                                    <div class="text-text-light mb-2">
                                        <svg class="w-4 h-4 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M12.586 4.586a2 2 0 112.828 2.828l-3 3a2 2 0 01-2.828 0 1 1 0 00-1.414 1.414 4 4 0 005.656 0l3-3a4 4 0 00-5.656-5.656l-1.5 1.5a1 1 0 101.414 1.414l1.5-1.5zm-5 5a2 2 0 012.828 0 1 1 0 101.414-1.414 4 4 0 00-5.656 0l-3 3a4 4 0 105.656 5.656l1.5-1.5a1 1 0 10-1.414-1.414l-1.5 1.5a2 2 0 11-2.828-2.828l3-3z" clip-rule="evenodd"/>
                                        </svg>
                                        {$service.domain}
                                    </div>
                                {/if}
                                <div class="flex flex-col sm:flex-row sm:space-x-6 text-sm text-text-light">
                                    {if $service.regdate}
                                        <div>Registration: {$service.regdate}</div>
                                    {/if}
                                    {if $service.nextduedate}
                                        <div>Next Due: {$service.nextduedate}</div>
                                    {/if}
                                    {if $service.amount}
                                        <div>Amount: {$service.amount}</div>
                                    {/if}
                                </div>
                            </div>
                            
                            <div class="flex space-x-3 mt-4 md:mt-0">
                                <a href="clientarea.php?action=productdetails&id={$service.id}" class="btn-primary text-sm">
                                    Manage
                                </a>
                                {if $service.status eq 'Active'}
                                    <a href="clientarea.php?action=productdetails&id={$service.id}" class="btn-outline text-sm">
                                        View Details
                                    </a>
                                {/if}
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>
        {else}
            <div class="card-dark text-center py-12">
                <div class="w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mx-auto mb-6">
                    <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-orbitron font-semibold text-white mb-4">No Services Found</h3>
                <p class="text-text-light mb-6">You don't have any active services yet. Get started with our hosting plans!</p>
                <a href="cart.php" class="btn-primary">
                    Browse Hosting Plans
                </a>
            </div>
        {/if}
        
    </div>
</div>

{include file="$template/footer.tpl"}
