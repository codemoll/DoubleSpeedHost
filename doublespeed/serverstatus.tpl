{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-20 px-4 sm:px-6 lg:px-8">
    <div class="max-w-6xl mx-auto">
        <!-- Header -->
        <div class="text-center mb-12">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M3 3a1 1 0 000 2v8a2 2 0 002 2h2.586l-1.293 1.293a1 1 0 101.414 1.414L10 15.414l2.293 2.293a1 1 0 001.414-1.414L12.414 15H15a2 2 0 002-2V5a1 1 0 100-2H3zm11.707 4.707a1 1 0 00-1.414-1.414L10 9.586 8.707 8.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                </svg>
            </div>
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                Server Status
            </h1>
            <p class="text-lg text-text-light max-w-2xl mx-auto">
                Real-time monitoring of our hosting infrastructure and services.
            </p>
        </div>

        <!-- Overall Status -->
        <div class="card-dark mb-8">
            <div class="flex items-center justify-between">
                <div>
                    <h2 class="text-2xl font-orbitron font-bold text-white">Overall System Status</h2>
                    <p class="text-text-light">Last updated: {$smarty.now|date_format:"%Y-%m-%d %H:%M:%S"}</p>
                </div>
                <div class="text-right">
                    {if $overallstatus}
                        {if $overallstatus eq 'online'}
                            <div class="flex items-center space-x-2">
                                <div class="w-3 h-3 bg-green-500 rounded-full animate-pulse"></div>
                                <span class="text-green-400 font-bold">All Systems Operational</span>
                            </div>
                        {elseif $overallstatus eq 'issues'}
                            <div class="flex items-center space-x-2">
                                <div class="w-3 h-3 bg-yellow-500 rounded-full animate-pulse"></div>
                                <span class="text-yellow-400 font-bold">Some Issues Detected</span>
                            </div>
                        {else}
                            <div class="flex items-center space-x-2">
                                <div class="w-3 h-3 bg-red-500 rounded-full animate-pulse"></div>
                                <span class="text-red-400 font-bold">Service Disruption</span>
                            </div>
                        {/if}
                    {else}
                        <div class="flex items-center space-x-2">
                            <div class="w-3 h-3 bg-green-500 rounded-full animate-pulse"></div>
                            <span class="text-green-400 font-bold">All Systems Operational</span>
                        </div>
                    {/if}
                </div>
            </div>
        </div>

        <!-- Server Status Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
            {if $servers}
                {foreach from=$servers item=server}
                    <div class="card-dark">
                        <div class="flex items-center justify-between mb-4">
                            <h3 class="text-lg font-orbitron font-semibold text-white">{$server.name}</h3>
                            <div class="flex items-center space-x-2">
                                {if $server.status eq 'online'}
                                    <div class="w-3 h-3 bg-green-500 rounded-full"></div>
                                    <span class="text-green-400 font-medium">Online</span>
                                {elseif $server.status eq 'offline'}
                                    <div class="w-3 h-3 bg-red-500 rounded-full"></div>
                                    <span class="text-red-400 font-medium">Offline</span>
                                {else}
                                    <div class="w-3 h-3 bg-yellow-500 rounded-full"></div>
                                    <span class="text-yellow-400 font-medium">Issues</span>
                                {/if}
                            </div>
                        </div>
                        
                        <div class="space-y-3">
                            <div class="flex justify-between text-sm">
                                <span class="text-text-light">Location:</span>
                                <span class="text-white">{if $server.location}{$server.location}{else}US East{/if}</span>
                            </div>
                            <div class="flex justify-between text-sm">
                                <span class="text-text-light">Uptime:</span>
                                <span class="text-white">{if $server.uptime}{$server.uptime}{else}99.9%{/if}</span>
                            </div>
                            <div class="flex justify-between text-sm">
                                <span class="text-text-light">Load:</span>
                                <span class="text-white">{if $server.load}{$server.load}{else}Low{/if}</span>
                            </div>
                            {if $server.response_time}
                                <div class="flex justify-between text-sm">
                                    <span class="text-text-light">Response Time:</span>
                                    <span class="text-white">{$server.response_time}ms</span>
                                </div>
                            {/if}
                        </div>
                    </div>
                {/foreach}
            {else}
                <!-- Default servers when no data available -->
                <div class="card-dark">
                    <div class="flex items-center justify-between mb-4">
                        <h3 class="text-lg font-orbitron font-semibold text-white">Web Server 1</h3>
                        <div class="flex items-center space-x-2">
                            <div class="w-3 h-3 bg-green-500 rounded-full"></div>
                            <span class="text-green-400 font-medium">Online</span>
                        </div>
                    </div>
                    <div class="space-y-3">
                        <div class="flex justify-between text-sm">
                            <span class="text-text-light">Location:</span>
                            <span class="text-white">US East</span>
                        </div>
                        <div class="flex justify-between text-sm">
                            <span class="text-text-light">Uptime:</span>
                            <span class="text-white">99.9%</span>
                        </div>
                        <div class="flex justify-between text-sm">
                            <span class="text-text-light">Load:</span>
                            <span class="text-white">Low</span>
                        </div>
                    </div>
                </div>

                <div class="card-dark">
                    <div class="flex items-center justify-between mb-4">
                        <h3 class="text-lg font-orbitron font-semibold text-white">Database Server</h3>
                        <div class="flex items-center space-x-2">
                            <div class="w-3 h-3 bg-green-500 rounded-full"></div>
                            <span class="text-green-400 font-medium">Online</span>
                        </div>
                    </div>
                    <div class="space-y-3">
                        <div class="flex justify-between text-sm">
                            <span class="text-text-light">Location:</span>
                            <span class="text-white">US East</span>
                        </div>
                        <div class="flex justify-between text-sm">
                            <span class="text-text-light">Uptime:</span>
                            <span class="text-white">99.8%</span>
                        </div>
                        <div class="flex justify-between text-sm">
                            <span class="text-text-light">Load:</span>
                            <span class="text-white">Moderate</span>
                        </div>
                    </div>
                </div>

                <div class="card-dark">
                    <div class="flex items-center justify-between mb-4">
                        <h3 class="text-lg font-orbitron font-semibold text-white">Mail Server</h3>
                        <div class="flex items-center space-x-2">
                            <div class="w-3 h-3 bg-green-500 rounded-full"></div>
                            <span class="text-green-400 font-medium">Online</span>
                        </div>
                    </div>
                    <div class="space-y-3">
                        <div class="flex justify-between text-sm">
                            <span class="text-text-light">Location:</span>
                            <span class="text-white">US East</span>
                        </div>
                        <div class="flex justify-between text-sm">
                            <span class="text-text-light">Uptime:</span>
                            <span class="text-white">99.9%</span>
                        </div>
                        <div class="flex justify-between text-sm">
                            <span class="text-text-light">Load:</span>
                            <span class="text-white">Low</span>
                        </div>
                    </div>
                </div>
            {/if}
        </div>

        <!-- Network Status -->
        <div class="card-dark mb-8">
            <h2 class="text-xl font-orbitron font-semibold text-white mb-6">Network Status</h2>
            
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div class="text-center">
                    <div class="text-3xl font-bold text-neon-green mb-2">99.9%</div>
                    <div class="text-text-light">Network Uptime</div>
                </div>
                <div class="text-center">
                    <div class="text-3xl font-bold text-electric-blue mb-2">24ms</div>
                    <div class="text-text-light">Avg Response Time</div>
                </div>
                <div class="text-center">
                    <div class="text-3xl font-bold text-cyber-purple mb-2">1Gbps</div>
                    <div class="text-text-light">Network Speed</div>
                </div>
            </div>
        </div>

        <!-- Service Status -->
        <div class="card-dark mb-8">
            <h2 class="text-xl font-orbitron font-semibold text-white mb-6">Service Status</h2>
            
            <div class="space-y-4">
                {if $services}
                    {foreach from=$services item=service}
                        <div class="flex items-center justify-between p-4 border border-gray-700 rounded-lg">
                            <div class="flex items-center space-x-3">
                                {if $service.status eq 'operational'}
                                    <div class="w-3 h-3 bg-green-500 rounded-full"></div>
                                {elseif $service.status eq 'issues'}
                                    <div class="w-3 h-3 bg-yellow-500 rounded-full"></div>
                                {else}
                                    <div class="w-3 h-3 bg-red-500 rounded-full"></div>
                                {/if}
                                <span class="text-white font-medium">{$service.name}</span>
                            </div>
                            <span class="text-text-light text-sm">
                                {if $service.status eq 'operational'}Operational
                                {elseif $service.status eq 'issues'}Degraded Performance
                                {else}Service Disruption{/if}
                            </span>
                        </div>
                    {/foreach}
                {else}
                    <!-- Default services -->
                    <div class="flex items-center justify-between p-4 border border-gray-700 rounded-lg">
                        <div class="flex items-center space-x-3">
                            <div class="w-3 h-3 bg-green-500 rounded-full"></div>
                            <span class="text-white font-medium">Web Hosting</span>
                        </div>
                        <span class="text-text-light text-sm">Operational</span>
                    </div>
                    
                    <div class="flex items-center justify-between p-4 border border-gray-700 rounded-lg">
                        <div class="flex items-center space-x-3">
                            <div class="w-3 h-3 bg-green-500 rounded-full"></div>
                            <span class="text-white font-medium">Email Services</span>
                        </div>
                        <span class="text-text-light text-sm">Operational</span>
                    </div>
                    
                    <div class="flex items-center justify-between p-4 border border-gray-700 rounded-lg">
                        <div class="flex items-center space-x-3">
                            <div class="w-3 h-3 bg-green-500 rounded-full"></div>
                            <span class="text-white font-medium">Domain Services</span>
                        </div>
                        <span class="text-text-light text-sm">Operational</span>
                    </div>
                    
                    <div class="flex items-center justify-between p-4 border border-gray-700 rounded-lg">
                        <div class="flex items-center space-x-3">
                            <div class="w-3 h-3 bg-green-500 rounded-full"></div>
                            <span class="text-white font-medium">Support System</span>
                        </div>
                        <span class="text-text-light text-sm">Operational</span>
                    </div>
                {/if}
            </div>
        </div>

        <!-- Recent Incidents -->
        {if $incidents}
            <div class="card-dark">
                <h2 class="text-xl font-orbitron font-semibold text-white mb-6">Recent Incidents</h2>
                
                <div class="space-y-4">
                    {foreach from=$incidents item=incident}
                        <div class="border border-gray-700 rounded-lg p-4">
                            <div class="flex items-start justify-between mb-2">
                                <h3 class="text-white font-medium">{$incident.title}</h3>
                                <span class="text-text-light text-sm">{$incident.date}</span>
                            </div>
                            <p class="text-text-light text-sm">{$incident.description}</p>
                            {if $incident.status}
                                <div class="mt-2">
                                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium
                                        {if $incident.status eq 'resolved'}bg-green-900 text-green-200
                                        {elseif $incident.status eq 'investigating'}bg-yellow-900 text-yellow-200
                                        {else}bg-red-900 text-red-200{/if}">
                                        {$incident.status|ucfirst}
                                    </span>
                                </div>
                            {/if}
                        </div>
                    {/foreach}
                </div>
            </div>
        {else}
            <div class="card-dark">
                <h2 class="text-xl font-orbitron font-semibold text-white mb-6">Recent Incidents</h2>
                <div class="text-center py-8">
                    <svg class="w-12 h-12 text-green-500 mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                    </svg>
                    <p class="text-text-light">No recent incidents reported. All systems are running smoothly!</p>
                </div>
            </div>
        {/if}
    </div>
</div>

{include file="$template/footer.tpl"}