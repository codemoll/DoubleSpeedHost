{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-8">
    <div class="container mx-auto px-4">
        <div class="max-w-4xl mx-auto">
            <!-- Page Header -->
            <div class="text-center mb-8">
                <h1 class="text-3xl font-bold text-white mb-4">
                    <i class="fas fa-server mr-3 text-electric-blue"></i>
                    Network Status
                </h1>
                <p class="text-gray-400">
                    Current status of our network infrastructure and services
                </p>
            </div>

            <!-- Overall Status -->
            <div class="bg-dark-surface rounded-xl border border-gray-700 p-6 mb-8">
                <div class="text-center">
                    <div class="text-4xl mb-4">
                        {if $overall_status == 'operational'}
                            <i class="fas fa-check-circle text-neon-green"></i>
                        {elseif $overall_status == 'degraded'}
                            <i class="fas fa-exclamation-triangle text-yellow-500"></i>
                        {else}
                            <i class="fas fa-times-circle text-red-500"></i>
                        {/if}
                    </div>
                    <h2 class="text-2xl font-bold text-white mb-2">
                        {if $overall_status == 'operational'}
                            All Systems Operational
                        {elseif $overall_status == 'degraded'}
                            Partial Service Disruption
                        {else}
                            Service Disruption
                        {/if}
                    </h2>
                    <p class="text-gray-400">
                        {if $overall_status == 'operational'}
                            All services are running normally
                        {elseif $overall_status == 'degraded'}
                            Some services may be experiencing issues
                        {else}
                            We are experiencing service issues and are working to resolve them
                        {/if}
                    </p>
                </div>
            </div>

            <!-- Service Status Grid -->
            <div class="grid md:grid-cols-2 gap-6 mb-8">
                {foreach from=$services item=service}
                    <div class="bg-dark-surface rounded-xl border border-gray-700 p-6">
                        <div class="flex items-center justify-between mb-4">
                            <h3 class="text-lg font-semibold text-white">{$service.name}</h3>
                            <div class="text-right">
                                {if $service.status == 'operational'}
                                    <i class="fas fa-check-circle text-neon-green text-xl"></i>
                                    <div class="text-neon-green text-sm font-semibold">Operational</div>
                                {elseif $service.status == 'degraded'}
                                    <i class="fas fa-exclamation-triangle text-yellow-500 text-xl"></i>
                                    <div class="text-yellow-500 text-sm font-semibold">Degraded</div>
                                {else}
                                    <i class="fas fa-times-circle text-red-500 text-xl"></i>
                                    <div class="text-red-500 text-sm font-semibold">Offline</div>
                                {/if}
                            </div>
                        </div>
                        
                        <p class="text-gray-400 text-sm mb-4">{$service.description}</p>
                        
                        {if $service.uptime}
                            <div class="flex justify-between items-center">
                                <span class="text-gray-400 text-sm">Uptime</span>
                                <span class="text-white font-semibold">{$service.uptime}%</span>
                            </div>
                        {/if}
                        
                        {if $service.response_time}
                            <div class="flex justify-between items-center">
                                <span class="text-gray-400 text-sm">Response Time</span>
                                <span class="text-white font-semibold">{$service.response_time}ms</span>
                            </div>
                        {/if}
                    </div>
                {/foreach}
            </div>

            <!-- Recent Incidents -->
            {if $incidents}
                <div class="bg-dark-surface rounded-xl border border-gray-700 p-6 mb-8">
                    <h2 class="text-xl font-semibold text-white mb-6">
                        <i class="fas fa-history mr-2 text-cyber-purple"></i>
                        Recent Incidents
                    </h2>
                    
                    <div class="space-y-4">
                        {foreach from=$incidents item=incident}
                            <div class="bg-dark-bg rounded-lg border border-gray-600 p-4">
                                <div class="flex items-start justify-between mb-2">
                                    <h3 class="text-white font-semibold">{$incident.title}</h3>
                                    <span class="px-2 py-1 rounded text-xs font-medium {if $incident.status == 'resolved'}bg-green-900/50 text-green-300{elseif $incident.status == 'investigating'}bg-yellow-900/50 text-yellow-300{else}bg-red-900/50 text-red-300{/if}">
                                        {$incident.status|capitalize}
                                    </span>
                                </div>
                                <p class="text-gray-400 text-sm mb-2">{$incident.description}</p>
                                <div class="text-gray-500 text-xs">
                                    {$incident.date} • Affected: {$incident.affected_services}
                                </div>
                            </div>
                        {/foreach}
                    </div>
                </div>
            {/if}

            <!-- Maintenance Schedule -->
            {if $maintenance}
                <div class="bg-dark-surface rounded-xl border border-gray-700 p-6 mb-8">
                    <h2 class="text-xl font-semibold text-white mb-6">
                        <i class="fas fa-tools mr-2 text-electric-blue"></i>
                        Scheduled Maintenance
                    </h2>
                    
                    <div class="space-y-4">
                        {foreach from=$maintenance item=maint}
                            <div class="bg-dark-bg rounded-lg border border-gray-600 p-4">
                                <div class="flex items-start justify-between mb-2">
                                    <h3 class="text-white font-semibold">{$maint.title}</h3>
                                    <span class="px-2 py-1 rounded text-xs font-medium bg-blue-900/50 text-blue-300">
                                        Scheduled
                                    </span>
                                </div>
                                <p class="text-gray-400 text-sm mb-2">{$maint.description}</p>
                                <div class="grid md:grid-cols-2 gap-4 text-sm">
                                    <div>
                                        <span class="text-gray-500">Start:</span>
                                        <span class="text-white ml-2">{$maint.start_time}</span>
                                    </div>
                                    <div>
                                        <span class="text-gray-500">End:</span>
                                        <span class="text-white ml-2">{$maint.end_time}</span>
                                    </div>
                                    <div>
                                        <span class="text-gray-500">Duration:</span>
                                        <span class="text-white ml-2">{$maint.duration}</span>
                                    </div>
                                    <div>
                                        <span class="text-gray-500">Impact:</span>
                                        <span class="text-white ml-2">{$maint.impact}</span>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                </div>
            {/if}

            <!-- Status History -->
            <div class="bg-dark-surface rounded-xl border border-gray-700 p-6">
                <h2 class="text-xl font-semibold text-white mb-6">
                    <i class="fas fa-chart-line mr-2 text-neon-green"></i>
                    7-Day Uptime History
                </h2>
                
                <div class="space-y-4">
                    {for $i=6; $i>=0; $i--}
                        {assign var="day" value=$smarty.now|date_format:"%Y-%m-%d"|strtotime-($i*86400)|date_format:"%Y-%m-%d"}
                        <div class="flex items-center justify-between">
                            <span class="text-gray-400">{$day|date_format:"%b %d"}</span>
                            <div class="flex-1 mx-4">
                                <div class="w-full bg-gray-700 rounded-full h-2">
                                    <div class="bg-neon-green h-2 rounded-full" style="width: {math equation="90 + (rand(1,10))" format="%.1f"}%"></div>
                                </div>
                            </div>
                            <span class="text-white font-semibold w-12 text-right">{math equation="90 + (rand(1,10))" format="%.1f"}%</span>
                        </div>
                    {/for}
                </div>
            </div>

            <!-- Contact Support -->
            <div class="mt-8 text-center">
                <div class="bg-dark-surface rounded-xl border border-gray-700 p-6">
                    <h3 class="text-lg font-semibold text-white mb-4">Need Help?</h3>
                    <p class="text-gray-400 mb-4">
                        If you're experiencing issues not listed here, please contact our support team.
                    </p>
                    <div class="flex justify-center space-x-4">
                        <a href="{$WEB_ROOT}/submitticket.php" class="bg-neon-green text-dark-bg font-semibold py-2 px-6 rounded-lg hover:shadow-neon-green/50 hover:shadow-lg transition-all duration-300">
                            <i class="fas fa-ticket-alt mr-2"></i>
                            Open Support Ticket
                        </a>
                        <a href="{$WEB_ROOT}/contact.php" class="bg-electric-blue text-white font-semibold py-2 px-6 rounded-lg hover:shadow-electric-blue/50 hover:shadow-lg transition-all duration-300">
                            <i class="fas fa-envelope mr-2"></i>
                            Contact Us
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}