{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                <span class="glow-text">Server Status</span>
            </h1>
            <p class="text-text-light">
                Real-time status of our servers and services. We're committed to 99.9% uptime.
            </p>
        </div>
        
        <!-- Overall Status -->
        <div class="card-dark mb-8">
            <div class="flex items-center justify-between">
                <div>
                    <h2 class="text-2xl font-semibold text-white mb-2">Overall System Status</h2>
                    <p class="text-text-light">All systems operational</p>
                </div>
                <div class="flex items-center space-x-2">
                    <div class="w-4 h-4 bg-green-400 rounded-full animate-pulse"></div>
                    <span class="text-green-400 font-semibold">Operational</span>
                </div>
            </div>
        </div>
        
        <!-- Server List -->
        {if $servers}
            <div class="space-y-4 mb-8">
                {foreach from=$servers item=server}
                    <div class="card-dark">
                        <div class="flex items-center justify-between">
                            <div class="flex-1">
                                <h3 class="text-xl font-semibold text-white mb-2">{$server.name}</h3>
                                <div class="grid grid-cols-1 md:grid-cols-3 gap-4 text-sm">
                                    <div>
                                        <span class="text-text-light">Location:</span>
                                        <span class="text-white ml-2">{$server.location}</span>
                                    </div>
                                    <div>
                                        <span class="text-text-light">Uptime:</span>
                                        <span class="text-neon-green ml-2">{$server.uptime}</span>
                                    </div>
                                    <div>
                                        <span class="text-text-light">Load:</span>
                                        <span class="text-electric-blue ml-2">{$server.load}</span>
                                    </div>
                                </div>
                                
                                {if $server.description}
                                    <p class="text-text-light text-sm mt-2">{$server.description}</p>
                                {/if}
                            </div>
                            
                            <div class="ml-6">
                                {if $server.status == 'online'}
                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-green-900 text-green-200">
                                        <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                                        </svg>
                                        Online
                                    </span>
                                {elseif $server.status == 'maintenance'}
                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-orange-900 text-orange-200">
                                        <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
                                        </svg>
                                        Maintenance
                                    </span>
                                {else}
                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-red-900 text-red-200">
                                        <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                                        </svg>
                                        Offline
                                    </span>
                                {/if}
                            </div>
                        </div>
                        
                        <!-- Performance Metrics -->
                        {if $server.metrics}
                            <div class="mt-6 pt-6 border-t border-gray-700">
                                <h4 class="text-sm font-medium text-white mb-3">Performance Metrics:</h4>
                                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                                    {if $server.metrics.cpu}
                                        <div>
                                            <div class="flex justify-between text-sm mb-1">
                                                <span class="text-text-light">CPU Usage</span>
                                                <span class="text-white">{$server.metrics.cpu}%</span>
                                            </div>
                                            <div class="w-full bg-dark-bg rounded-full h-2">
                                                <div class="bg-{if $server.metrics.cpu > 80}red-400{elseif $server.metrics.cpu > 60}orange-400{else}neon-green{/if} h-2 rounded-full" 
                                                     style="width: {$server.metrics.cpu}%"></div>
                                            </div>
                                        </div>
                                    {/if}
                                    
                                    {if $server.metrics.memory}
                                        <div>
                                            <div class="flex justify-between text-sm mb-1">
                                                <span class="text-text-light">Memory Usage</span>
                                                <span class="text-white">{$server.metrics.memory}%</span>
                                            </div>
                                            <div class="w-full bg-dark-bg rounded-full h-2">
                                                <div class="bg-{if $server.metrics.memory > 80}red-400{elseif $server.metrics.memory > 60}orange-400{else}electric-blue{/if} h-2 rounded-full" 
                                                     style="width: {$server.metrics.memory}%"></div>
                                            </div>
                                        </div>
                                    {/if}
                                    
                                    {if $server.metrics.disk}
                                        <div>
                                            <div class="flex justify-between text-sm mb-1">
                                                <span class="text-text-light">Disk Usage</span>
                                                <span class="text-white">{$server.metrics.disk}%</span>
                                            </div>
                                            <div class="w-full bg-dark-bg rounded-full h-2">
                                                <div class="bg-{if $server.metrics.disk > 80}red-400{elseif $server.metrics.disk > 60}orange-400{else}cyber-purple{/if} h-2 rounded-full" 
                                                     style="width: {$server.metrics.disk}%"></div>
                                            </div>
                                        </div>
                                    {/if}
                                </div>
                            </div>
                        {/if}
                    </div>
                {/foreach}
            </div>
        {else}
            <div class="card-dark text-center py-12 mb-8">
                <div class="mx-auto w-20 h-20 bg-gradient-to-br from-gray-600 to-gray-700 rounded-full flex items-center justify-center mb-6">
                    <svg class="w-10 h-10 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M3 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Server Information Loading</h3>
                <p class="text-text-light">
                    Server status information is currently being retrieved. Please check back in a moment.
                </p>
            </div>
        {/if}
        
        <!-- Network Status -->
        <div class="card-dark mb-8">
            <h3 class="text-xl font-semibold text-white mb-6">Network Status</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                    <h4 class="text-lg font-medium text-white mb-4">Network Uptime</h4>
                    <div class="space-y-3">
                        <div class="flex justify-between">
                            <span class="text-text-light">Last 24 Hours:</span>
                            <span class="text-neon-green">99.98%</span>
                        </div>
                        <div class="flex justify-between">
                            <span class="text-text-light">Last 7 Days:</span>
                            <span class="text-neon-green">99.94%</span>
                        </div>
                        <div class="flex justify-between">
                            <span class="text-text-light">Last 30 Days:</span>
                            <span class="text-electric-blue">99.92%</span>
                        </div>
                        <div class="flex justify-between">
                            <span class="text-text-light">Last 90 Days:</span>
                            <span class="text-electric-blue">99.89%</span>
                        </div>
                    </div>
                </div>
                
                <div>
                    <h4 class="text-lg font-medium text-white mb-4">Response Times</h4>
                    <div class="space-y-3">
                        <div class="flex justify-between">
                            <span class="text-text-light">Average Response:</span>
                            <span class="text-neon-green">142ms</span>
                        </div>
                        <div class="flex justify-between">
                            <span class="text-text-light">Best Response:</span>
                            <span class="text-neon-green">89ms</span>
                        </div>
                        <div class="flex justify-between">
                            <span class="text-text-light">Worst Response:</span>
                            <span class="text-orange-400">2.3s</span>
                        </div>
                        <div class="flex justify-between">
                            <span class="text-text-light">Last Check:</span>
                            <span class="text-white">{$smarty.now|date_format:"%H:%M:%S"}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Scheduled Maintenance -->
        {if $maintenance}
            <div class="card-dark mb-8">
                <h3 class="text-xl font-semibold text-white mb-6">Scheduled Maintenance</h3>
                {foreach from=$maintenance item=event}
                    <div class="flex items-start space-x-4 p-4 bg-orange-900/20 border border-orange-700 rounded-lg mb-4">
                        <svg class="w-6 h-6 text-orange-400 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
                        </svg>
                        <div class="flex-1">
                            <h4 class="text-white font-medium">{$event.title}</h4>
                            <p class="text-orange-200 text-sm mt-1">{$event.description}</p>
                            <div class="text-orange-300 text-xs mt-2">
                                <span class="font-medium">Scheduled:</span> {$event.date} from {$event.start_time} to {$event.end_time}
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>
        {else}
            <div class="card-dark mb-8">
                <h3 class="text-xl font-semibold text-white mb-6">Scheduled Maintenance</h3>
                <div class="text-center py-8">
                    <svg class="w-12 h-12 text-green-400 mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                    </svg>
                    <p class="text-green-400 font-medium">No scheduled maintenance</p>
                    <p class="text-text-light text-sm mt-1">All systems are running normally</p>
                </div>
            </div>
        {/if}
        
        <!-- Recent Incidents -->
        {if $incidents}
            <div class="card-dark mb-8">
                <h3 class="text-xl font-semibold text-white mb-6">Recent Incidents</h3>
                {foreach from=$incidents item=incident}
                    <div class="border-l-4 border-{if $incident.severity == 'high'}red-400{elseif $incident.severity == 'medium'}orange-400{else}yellow-400{/if} pl-4 mb-6">
                        <h4 class="text-white font-medium">{$incident.title}</h4>
                        <p class="text-text-light text-sm mt-1">{$incident.description}</p>
                        <div class="flex items-center space-x-4 text-xs mt-2">
                            <span class="text-{if $incident.severity == 'high'}red-400{elseif $incident.severity == 'medium'}orange-400{else}yellow-400{/if}">
                                {$incident.severity|upper} SEVERITY
                            </span>
                            <span class="text-text-light">{$incident.date}</span>
                            {if $incident.resolved}
                                <span class="text-green-400">RESOLVED</span>
                            {else}
                                <span class="text-orange-400">INVESTIGATING</span>
                            {/if}
                        </div>
                    </div>
                {/foreach}
            </div>
        {/if}
        
        <!-- Subscribe to Updates -->
        <div class="card-dark text-center">
            <h3 class="text-xl font-semibold text-white mb-4">Stay Informed</h3>
            <p class="text-text-light mb-6">
                Get notified about server status updates and maintenance schedules.
            </p>
            <div class="flex flex-col sm:flex-row gap-4 justify-center">
                <a href="{$WEB_ROOT}/clientarea.php?action=emails" class="btn-primary">
                    Email Notifications
                </a>
                <a href="{$WEB_ROOT}/announcements.php" class="btn-outline">
                    View Announcements
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Auto-refresh page every 5 minutes -->
<script>
setTimeout(function() {
    window.location.reload();
}, 300000); // 5 minutes

// Live status indicator
function updateStatusIndicators() {
    const indicators = document.querySelectorAll('.animate-pulse');
    indicators.forEach(indicator => {
        if (indicator.classList.contains('bg-green-400')) {
            // Pulse effect for online status
            indicator.style.opacity = '0.5';
            setTimeout(() => {
                indicator.style.opacity = '1';
            }, 500);
        }
    });
}

// Update status every 30 seconds
setInterval(updateStatusIndicators, 30000);
</script>

{include file="$template/footer.tpl"}