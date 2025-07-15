{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-6xl mx-auto">
        <div class="text-center mb-12">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M3 3a1 1 0 000 2v8a2 2 0 002 2h2.586l-1.293 1.293a1 1 0 101.414 1.414L10 15.414l2.293 2.293a1 1 0 001.414-1.414L12.414 15H15a2 2 0 002-2V5a1 1 0 100-2H3zm11.707 4.707a1 1 0 00-1.414-1.414L10 9.586 8.707 8.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                </svg>
            </div>
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">Server Status</h1>
            <p class="text-xl text-text-light max-w-2xl mx-auto">
                Real-time monitoring of our infrastructure and services
            </p>
        </div>

        <!-- Overall Status -->
        <div class="card-dark mb-8">
            <div class="flex items-center justify-between">
                <div>
                    <h2 class="text-2xl font-orbitron font-bold text-white mb-2">System Status</h2>
                    <p class="text-text-light">Current operational status of all services</p>
                </div>
                <div class="text-right">
                    {if isset($overallstatus) && $overallstatus == 'online'}
                        <div class="flex items-center">
                            <div class="w-3 h-3 bg-green-400 rounded-full mr-2 animate-pulse"></div>
                            <span class="text-green-400 font-semibold">All Systems Operational</span>
                        </div>
                    {elseif isset($overallstatus) && $overallstatus == 'partial'}
                        <div class="flex items-center">
                            <div class="w-3 h-3 bg-yellow-400 rounded-full mr-2 animate-pulse"></div>
                            <span class="text-yellow-400 font-semibold">Partial Service Disruption</span>
                        </div>
                    {elseif isset($overallstatus) && $overallstatus == 'offline'}
                        <div class="flex items-center">
                            <div class="w-3 h-3 bg-red-400 rounded-full mr-2 animate-pulse"></div>
                            <span class="text-red-400 font-semibold">Service Disruption</span>
                        </div>
                    {else}
                        <div class="flex items-center">
                            <div class="w-3 h-3 bg-gray-400 rounded-full mr-2"></div>
                            <span class="text-gray-400 font-semibold">Status Unknown</span>
                        </div>
                    {/if}
                    <p class="text-xs text-text-light mt-1">Last updated: {$smarty.now|date_format:"%B %e, %Y at %I:%M %p"}</p>
                </div>
            </div>
        </div>

        <!-- Server Status List -->
        {if isset($servers) && is_array($servers) && $servers|@count > 0}
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                {foreach from=$servers item=server}
                    <div class="card-dark">
                        <div class="flex items-center justify-between mb-4">
                            <div class="flex items-center">
                                <div class="w-12 h-12 bg-gradient-to-br from-{if $server.status == 'online'}green{elseif $server.status == 'offline'}red{else}yellow{/if}-500 to-{if $server.status == 'online'}green{elseif $server.status == 'offline'}red{else}yellow{/if}-600 rounded-lg flex items-center justify-center mr-3">
                                    {if $server.status == 'online'}
                                        <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                                        </svg>
                                    {elseif $server.status == 'offline'}
                                        <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                                        </svg>
                                    {else}
                                        <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
                                        </svg>
                                    {/if}
                                </div>
                                <div>
                                    <h3 class="text-lg font-semibold text-white">{$server.name|default:"Server"}</h3>
                                    <p class="text-sm text-text-light">{$server.location|default:"Unknown Location"}</p>
                                </div>
                            </div>
                            <div class="text-right">
                                <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium {if $server.status == 'online'}bg-green-900 text-green-200{elseif $server.status == 'offline'}bg-red-900 text-red-200{else}bg-yellow-900 text-yellow-200{/if}">
                                    {if $server.status == 'online'}
                                        Online
                                    {elseif $server.status == 'offline'}
                                        Offline
                                    {else}
                                        {$server.status|default:"Unknown"}
                                    {/if}
                                </span>
                            </div>
                        </div>

                        <div class="space-y-3">
                            {if isset($server.uptime) && $server.uptime}
                                <div class="flex justify-between text-sm">
                                    <span class="text-text-light">Uptime:</span>
                                    <span class="text-white font-medium">{$server.uptime}</span>
                                </div>
                            {/if}
                            
                            {if isset($server.load) && $server.load}
                                <div class="flex justify-between text-sm">
                                    <span class="text-text-light">Load:</span>
                                    <span class="text-white font-medium">{$server.load}</span>
                                </div>
                            {/if}

                            {if isset($server.ping) && $server.ping}
                                <div class="flex justify-between text-sm">
                                    <span class="text-text-light">Response Time:</span>
                                    <span class="text-white font-medium">{$server.ping}ms</span>
                                </div>
                            {/if}

                            {if isset($server.lastchecked) && $server.lastchecked}
                                <div class="flex justify-between text-sm">
                                    <span class="text-text-light">Last Checked:</span>
                                    <span class="text-white font-medium">{$server.lastchecked|date_format:"%H:%M"}</span>
                                </div>
                            {/if}
                        </div>

                        {if isset($server.description) && $server.description}
                            <div class="mt-4 pt-4 border-t border-gray-700">
                                <p class="text-sm text-text-light">{$server.description}</p>
                            </div>
                        {/if}
                    </div>
                {/foreach}
            </div>
        {else}
            <!-- No Server Data Available -->
            <div class="card-dark">
                <div class="text-center py-12">
                    <div class="mx-auto w-16 h-16 bg-gradient-to-br from-gray-600 to-gray-700 rounded-full flex items-center justify-center mb-6">
                        <svg class="w-8 h-8 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M3 3a1 1 0 000 2v8a2 2 0 002 2h2.586l-1.293 1.293a1 1 0 101.414 1.414L10 15.414l2.293 2.293a1 1 0 001.414-1.414L12.414 15H15a2 2 0 002-2V5a1 1 0 100-2H3zm11.707 4.707a1 1 0 00-1.414-1.414L10 9.586 8.707 8.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                        </svg>
                    </div>
                    <h3 class="text-xl font-semibold text-white mb-2">No Server Data Available</h3>
                    <p class="text-text-light mb-6">
                        Server status information is currently unavailable. Our monitoring system may be undergoing maintenance.
                    </p>
                    <div class="flex flex-col sm:flex-row gap-3 justify-center">
                        <a href="{$WEB_ROOT}/serverstatus.php" class="btn-secondary">
                            <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M4 2a1 1 0 011 1v2.101a7.002 7.002 0 0111.601 2.566 1 1 0 11-1.885.666A5.002 5.002 0 005.999 7H9a1 1 0 010 2H4a1 1 0 01-1-1V3a1 1 0 011-1zm.008 9.057a1 1 0 011.276.61A5.002 5.002 0 0014.001 13H11a1 1 0 110-2h5a1 1 0 011 1v5a1 1 0 11-2 0v-2.101a7.002 7.002 0 01-11.601-2.566 1 1 0 01.61-1.276z" clip-rule="evenodd"/>
                            </svg>
                            Refresh Status
                        </a>
                        <a href="{$WEB_ROOT}/contact.php" class="btn-primary">
                            <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                                <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                            </svg>
                            Contact Support
                        </a>
                    </div>
                </div>
            </div>
        {/if}

        <!-- Service Status -->
        {if isset($services) && is_array($services) && $services|@count > 0}
            <div class="mt-8">
                <h2 class="text-2xl font-orbitron font-bold text-white mb-6">Service Status</h2>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
                    {foreach from=$services item=service}
                        <div class="bg-dark-surface border border-gray-700 rounded-lg p-4">
                            <div class="flex items-center justify-between">
                                <div class="flex items-center">
                                    <div class="w-3 h-3 rounded-full mr-3 {if $service.status == 'online'}bg-green-400{elseif $service.status == 'offline'}bg-red-400{else}bg-yellow-400{/if} {if $service.status == 'online' || $service.status == 'offline'}animate-pulse{/if}"></div>
                                    <span class="text-white font-medium text-sm">{$service.name|default:"Service"}</span>
                                </div>
                                <span class="text-xs {if $service.status == 'online'}text-green-400{elseif $service.status == 'offline'}text-red-400{else}text-yellow-400{/if}">
                                    {if $service.status == 'online'}
                                        Online
                                    {elseif $service.status == 'offline'}
                                        Offline
                                    {else}
                                        {$service.status|default:"Unknown"}
                                    {/if}
                                </span>
                            </div>
                        </div>
                    {/foreach}
                </div>
            </div>
        {/if}

        <!-- Historical Data or Additional Info -->
        <div class="mt-8 card-dark">
            <h3 class="text-lg font-semibold text-white mb-4">System Information</h3>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 text-sm">
                <div class="text-center">
                    <div class="text-2xl font-bold text-neon-green mb-1">99.9%</div>
                    <div class="text-text-light">Uptime This Month</div>
                </div>
                <div class="text-center">
                    <div class="text-2xl font-bold text-electric-blue mb-1">&lt;50ms</div>
                    <div class="text-text-light">Average Response Time</div>
                </div>
                <div class="text-center">
                    <div class="text-2xl font-bold text-cyber-purple mb-1">24/7</div>
                    <div class="text-text-light">Monitoring Coverage</div>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}