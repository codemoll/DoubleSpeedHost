{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-7xl mx-auto">
        
        <!-- Product Header -->
        <div class="mb-8">
            <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6">
                <div>
                    <h1 class="text-3xl font-orbitron font-bold text-white mb-2">
                        {if $product}
                            {$product}
                        {else}
                            Service Details
                        {/if}
                    </h1>
                    <div class="flex items-center space-x-4">
                        {if $domain}
                            <span class="text-text-light">
                                <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M12.586 4.586a2 2 0 112.828 2.828l-3 3a2 2 0 01-2.828 0 1 1 0 00-1.414 1.414 4 4 0 005.656 0l3-3a4 4 0 00-5.656-5.656l-1.5 1.5a1 1 0 101.414 1.414l1.5-1.5zm-5 5a2 2 0 012.828 0 1 1 0 101.414-1.414 4 4 0 00-5.656 0l-3 3a4 4 0 105.656 5.656l1.5-1.5a1 1 0 10-1.414-1.414l-1.5 1.5a2 2 0 11-2.828-2.828l3-3z" clip-rule="evenodd"/>
                                </svg>
                                {$domain}
                            </span>
                        {/if}
                        {if $status}
                            <span class="status 
                                {if $status eq 'Active'}bg-green-900 text-green-300 border-green-600{/if}
                                {if $status eq 'Suspended'}bg-yellow-900 text-yellow-300 border-yellow-600{/if}
                                {if $status eq 'Terminated'}bg-red-900 text-red-300 border-red-600{/if}
                                {if $status eq 'Pending'}bg-blue-900 text-blue-300 border-blue-600{/if}
                            ">
                                {$status}
                            </span>
                        {/if}
                    </div>
                </div>
            </div>
        </div>

        <!-- Service Information Cards -->
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            
            <!-- Main Content -->
            <div class="lg:col-span-2 space-y-8">
                
                <!-- Service Overview -->
                <div class="card-dark">
                    <h2 class="text-xl font-orbitron font-semibold text-white mb-6">Service Overview</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        {if $regdate}
                            <div>
                                <span class="text-text-light text-sm">Registration Date</span>
                                <div class="text-white font-medium">{$regdate}</div>
                            </div>
                        {/if}
                        {if $nextduedate}
                            <div>
                                <span class="text-text-light text-sm">Next Due Date</span>
                                <div class="text-white font-medium">{$nextduedate}</div>
                            </div>
                        {/if}
                        {if $billingcycle}
                            <div>
                                <span class="text-text-light text-sm">Billing Cycle</span>
                                <div class="text-white font-medium">{$billingcycle}</div>
                            </div>
                        {/if}
                        {if $amount}
                            <div>
                                <span class="text-text-light text-sm">Recurring Amount</span>
                                <div class="text-white font-medium">{$amount}</div>
                            </div>
                        {/if}
                    </div>
                </div>

                <!-- Module Output -->
                {if $moduleoutput}
                    <div class="card-dark">
                        <h2 class="text-xl font-orbitron font-semibold text-white mb-6">Control Panel</h2>
                        <div class="bg-dark-bg border border-gray-700 rounded-lg p-4">
                            {$moduleoutput}
                        </div>
                    </div>
                {/if}
                
            </div>
            
            <!-- Sidebar -->
            <div class="space-y-6">
                
                <!-- Quick Actions -->
                <div class="card-dark">
                    <h3 class="text-lg font-orbitron font-semibold text-white mb-4">Quick Actions</h3>
                    <div class="space-y-3">
                        <a href="clientarea.php?action=invoices" class="flex items-center text-text-light hover:text-neon-green transition-colors duration-300">
                            <svg class="w-5 h-5 mr-3" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M4 4a2 2 0 00-2 2v8a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2H4zm0 2h12v8H4V6z" clip-rule="evenodd"/>
                            </svg>
                            View Invoices
                        </a>
                        <a href="supporttickets.php" class="flex items-center text-text-light hover:text-neon-green transition-colors duration-300">
                            <svg class="w-5 h-5 mr-3" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                            </svg>
                            Open Support Ticket
                        </a>
                    </div>
                </div>

            </div>
        </div>
        
    </div>
</div>

{include file="$template/footer.tpl"}
