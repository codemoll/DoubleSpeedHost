{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-7xl mx-auto">
        
        <!-- Product Header -->
        <div class="mb-8">
            <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6">
                <div>
                    <h1 class="text-3xl font-orbitron font-bold text-white mb-2">
                        {if isset($product) && $product}
                            {$product}
                        {else}
                            Service Details
                        {/if}
                    </h1>
                    <div class="flex flex-col md:flex-row md:items-center space-y-2 md:space-y-0 md:space-x-4">
                        {if isset($domain) && $domain}
                            <span class="text-text-light flex items-center">
                                <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M12.586 4.586a2 2 0 112.828 2.828l-3 3a2 2 0 01-2.828 0 1 1 0 00-1.414 1.414 4 4 0 005.656 0l3-3a4 4 0 00-5.656-5.656l-1.5 1.5a1 1 0 101.414 1.414l1.5-1.5zm-5 5a2 2 0 012.828 0 1 1 0 101.414-1.414 4 4 0 00-5.656 0l-3 3a4 4 0 105.656 5.656l1.5-1.5a1 1 0 10-1.414-1.414l-1.5 1.5a2 2 0 11-2.828-2.828l3-3z" clip-rule="evenodd"/>
                                </svg>
                                {$domain}
                            </span>
                        {/if}
                        {if isset($status) && $status}
                            <span class="status inline-flex items-center px-3 py-1 rounded-full text-sm font-medium
                                {if $status eq 'Active'}bg-green-900 text-green-300 border border-green-600{/if}
                                {if $status eq 'Suspended'}bg-yellow-900 text-yellow-300 border border-yellow-600{/if}
                                {if $status eq 'Terminated'}bg-red-900 text-red-300 border border-red-600{/if}
                                {if $status eq 'Pending'}bg-blue-900 text-blue-300 border border-blue-600{/if}
                                {if $status eq 'Cancelled'}bg-gray-700 text-gray-300 border border-gray-600{/if}
                            ">
                                {if $status eq 'Active'}
                                    <svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                                    </svg>
                                {elseif $status eq 'Suspended'}
                                    <svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
                                    </svg>
                                {elseif $status eq 'Terminated'}
                                    <svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                                    </svg>
                                {elseif $status eq 'Pending'}
                                    <svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-12a1 1 0 10-2 0v4a1 1 0 00.293.707l2.828 2.829a1 1 0 101.415-1.415L11 9.586V6z" clip-rule="evenodd"/>
                                    </svg>
                                {/if}
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
                        {if isset($regdate) && $regdate}
                            <div class="bg-dark-bg rounded-lg p-4 border border-gray-700">
                                <span class="text-text-light text-sm block mb-1">Registration Date</span>
                                <div class="text-white font-medium">{$regdate}</div>
                            </div>
                        {/if}
                        {if isset($nextduedate) && $nextduedate}
                            <div class="bg-dark-bg rounded-lg p-4 border border-gray-700">
                                <span class="text-text-light text-sm block mb-1">Next Due Date</span>
                                <div class="text-white font-medium">{$nextduedate}</div>
                            </div>
                        {/if}
                        {if isset($billingcycle) && $billingcycle}
                            <div class="bg-dark-bg rounded-lg p-4 border border-gray-700">
                                <span class="text-text-light text-sm block mb-1">Billing Cycle</span>
                                <div class="text-white font-medium">{$billingcycle}</div>
                            </div>
                        {/if}
                        {if isset($amount) && $amount}
                            <div class="bg-dark-bg rounded-lg p-4 border border-gray-700">
                                <span class="text-text-light text-sm block mb-1">Recurring Amount</span>
                                <div class="text-white font-medium text-lg">{$amount}</div>
                            </div>
                        {/if}
                        {if isset($serviceid) && $serviceid}
                            <div class="bg-dark-bg rounded-lg p-4 border border-gray-700">
                                <span class="text-text-light text-sm block mb-1">Service ID</span>
                                <div class="text-white font-medium font-mono">{$serviceid}</div>
                            </div>
                        {/if}
                        {if isset($paymentmethod) && $paymentmethod}
                            <div class="bg-dark-bg rounded-lg p-4 border border-gray-700">
                                <span class="text-text-light text-sm block mb-1">Payment Method</span>
                                <div class="text-white font-medium">{$paymentmethod}</div>
                            </div>
                        {/if}
                    </div>
                </div>

                <!-- Service Actions -->
                <div class="card-dark">
                    <h2 class="text-xl font-orbitron font-semibold text-white mb-6">Service Actions</h2>
                    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
                        {if isset($status) && $status eq 'Active'}
                            <a href="{$WEB_ROOT}/clientarea.php?action=productdetails&id={if isset($serviceid)}{$serviceid}{/if}&doaction=manage" 
                               class="btn-primary text-center">
                                <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"/>
                                </svg>
                                Manage Service
                            </a>
                        {/if}
                        <a href="{$WEB_ROOT}/supportticketsubmit.php?step=2&deptid={if isset($contactdepartment)}{$contactdepartment}{else}1{/if}" 
                           class="btn-secondary text-center">
                            <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                            </svg>
                            Get Support
                        </a>
                        {if isset($allowupgrades) && $allowupgrades}
                            <a href="{$WEB_ROOT}/upgrade.php?type=package&id={if isset($serviceid)}{$serviceid}{/if}" 
                               class="btn-outline text-center">
                                <svg class="w-5 h-5 inline mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"/>
                                </svg>
                                Upgrade Service
                            </a>
                        {/if}
                    </div>
                </div>

                <!-- Module Output -->
                {if isset($moduleoutput) && $moduleoutput}
                    <div class="card-dark">
                        <h2 class="text-xl font-orbitron font-semibold text-white mb-6">Control Panel</h2>
                        <div class="bg-dark-bg border border-gray-700 rounded-lg p-4 overflow-x-auto">
                            {$moduleoutput}
                        </div>
                    </div>
                {/if}

                <!-- Service Statistics -->
                {if isset($diskusage) || isset($bwusage) || isset($diskpercent) || isset($bwpercent)}
                    <div class="card-dark">
                        <h2 class="text-xl font-orbitron font-semibold text-white mb-6">Usage Statistics</h2>
                        <div class="space-y-6">
                            {if isset($diskusage) && isset($disklimit)}
                                <div>
                                    <div class="flex justify-between items-center mb-2">
                                        <span class="text-text-light text-sm">Disk Usage</span>
                                        <span class="text-white text-sm font-medium">
                                            {$diskusage} / {if $disklimit eq 'Unlimited'}Unlimited{else}{$disklimit}{/if}
                                        </span>
                                    </div>
                                    {if isset($diskpercent) && $disklimit neq 'Unlimited'}
                                        <div class="w-full bg-gray-700 rounded-full h-2">
                                            <div class="bg-gradient-to-r from-neon-green to-electric-blue h-2 rounded-full transition-all duration-500" 
                                                 style="width: {$diskpercent}%"></div>
                                        </div>
                                        <div class="text-xs text-text-light mt-1">{$diskpercent}% used</div>
                                    {/if}
                                </div>
                            {/if}
                            {if isset($bwusage) && isset($bwlimit)}
                                <div>
                                    <div class="flex justify-between items-center mb-2">
                                        <span class="text-text-light text-sm">Bandwidth Usage</span>
                                        <span class="text-white text-sm font-medium">
                                            {$bwusage} / {if $bwlimit eq 'Unlimited'}Unlimited{else}{$bwlimit}{/if}
                                        </span>
                                    </div>
                                    {if isset($bwpercent) && $bwlimit neq 'Unlimited'}
                                        <div class="w-full bg-gray-700 rounded-full h-2">
                                            <div class="bg-gradient-to-r from-electric-blue to-cyber-purple h-2 rounded-full transition-all duration-500" 
                                                 style="width: {$bwpercent}%"></div>
                                        </div>
                                        <div class="text-xs text-text-light mt-1">{$bwpercent}% used</div>
                                    {/if}
                                </div>
                            {/if}
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
                        <a href="{$WEB_ROOT}/clientarea.php?action=invoices" 
                           class="flex items-center text-text-light hover:text-neon-green transition-colors duration-300 p-2 rounded hover:bg-dark-bg">
                            <svg class="w-5 h-5 mr-3" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M4 4a2 2 0 00-2 2v8a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2H4zm0 2h12v8H4V6z" clip-rule="evenodd"/>
                            </svg>
                            View Invoices
                        </a>
                        <a href="{$WEB_ROOT}/supporttickets.php" 
                           class="flex items-center text-text-light hover:text-neon-green transition-colors duration-300 p-2 rounded hover:bg-dark-bg">
                            <svg class="w-5 h-5 mr-3" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                            </svg>
                            Open Support Ticket
                        </a>
                        {if isset($configoptions) && $configoptions}
                            <a href="{$WEB_ROOT}/clientarea.php?action=productdetails&id={if isset($serviceid)}{$serviceid}{/if}&modop=custom&a=configoptions" 
                               class="flex items-center text-text-light hover:text-neon-green transition-colors duration-300 p-2 rounded hover:bg-dark-bg">
                                <svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 100 4m0-4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 100 4m0-4v2m0-6V4"/>
                                </svg>
                                Configure Options
                            </a>
                        {/if}
                        <a href="{$WEB_ROOT}/downloads.php" 
                           class="flex items-center text-text-light hover:text-neon-green transition-colors duration-300 p-2 rounded hover:bg-dark-bg">
                            <svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                            </svg>
                            Downloads
                        </a>
                    </div>
                </div>

                <!-- Service Information -->
                {if isset($serviceid) || isset($orderid) || isset($productname)}
                    <div class="card-dark">
                        <h3 class="text-lg font-orbitron font-semibold text-white mb-4">Service Information</h3>
                        <div class="space-y-3 text-sm">
                            {if isset($productname) && $productname}
                                <div class="flex justify-between">
                                    <span class="text-text-light">Product:</span>
                                    <span class="text-white font-medium">{$productname}</span>
                                </div>
                            {/if}
                            {if isset($serviceid) && $serviceid}
                                <div class="flex justify-between">
                                    <span class="text-text-light">Service ID:</span>
                                    <span class="text-white font-mono">{$serviceid}</span>
                                </div>
                            {/if}
                            {if isset($orderid) && $orderid}
                                <div class="flex justify-between">
                                    <span class="text-text-light">Order ID:</span>
                                    <span class="text-white font-mono">{$orderid}</span>
                                </div>
                            {/if}
                            {if isset($server) && $server}
                                <div class="flex justify-between">
                                    <span class="text-text-light">Server:</span>
                                    <span class="text-white">{$server}</span>
                                </div>
                            {/if}
                        </div>
                    </div>
                {/if}

            </div>
        </div>
        
    </div>
</div>

{include file="$template/footer.tpl"}
