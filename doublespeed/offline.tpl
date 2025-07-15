{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg flex items-center justify-center px-4">
    <div class="max-w-lg w-full text-center">
        <div class="mb-8">
            <div class="text-6xl font-bold text-cyber-purple mb-4">
                <i class="fas fa-power-off"></i>
            </div>
            <h1 class="text-2xl font-semibold text-white mb-4">
                System Offline
            </h1>
            <p class="text-gray-400 mb-8">
                {if $offline_message}
                    {$offline_message}
                {else}
                    Our system is currently offline for maintenance. We apologize for the inconvenience and will be back online as soon as possible.
                {/if}
            </p>
        </div>
        
        <div class="bg-dark-surface rounded-lg border border-gray-700 p-6 mb-8">
            <div class="flex items-center justify-center mb-4">
                <div class="animate-pulse">
                    <div class="w-4 h-4 bg-red-500 rounded-full mr-2 inline-block"></div>
                    <span class="text-white font-semibold">System Status: Offline</span>
                </div>
            </div>
            
            <div class="grid grid-cols-2 gap-4 text-sm">
                <div class="text-center">
                    <div class="text-gray-400 mb-1">Web Services</div>
                    <div class="text-red-400 font-semibold">
                        <i class="fas fa-times-circle mr-1"></i>
                        Offline
                    </div>
                </div>
                <div class="text-center">
                    <div class="text-gray-400 mb-1">Client Portal</div>
                    <div class="text-red-400 font-semibold">
                        <i class="fas fa-times-circle mr-1"></i>
                        Offline
                    </div>
                </div>
            </div>
        </div>
        
        <div class="space-y-4">
            <a href="{$WEB_ROOT}/serverstatus.php" class="inline-block bg-neon-green text-dark-bg font-semibold py-3 px-6 rounded-lg hover:shadow-neon-green/50 hover:shadow-lg transition-all duration-300">
                <i class="fas fa-chart-line mr-2"></i>
                Check Server Status
            </a>
            
            <div class="text-gray-400">
                <p class="mb-2">For urgent matters, contact us:</p>
                <div class="flex justify-center space-x-4">
                    {if $support_email}
                        <a href="mailto:{$support_email}" class="text-neon-green hover:text-white transition-colors">
                            <i class="fas fa-envelope mr-1"></i>
                            Email
                        </a>
                    {/if}
                    
                    {if $support_phone}
                        <a href="tel:{$support_phone}" class="text-electric-blue hover:text-white transition-colors">
                            <i class="fas fa-phone mr-1"></i>
                            Phone
                        </a>
                    {/if}
                </div>
            </div>
        </div>
        
        <div class="mt-8 text-xs text-gray-500">
            <p>This page will automatically refresh when services are restored.</p>
        </div>
    </div>
</div>

<script>
// Auto-refresh every 30 seconds
setTimeout(function() {
    location.reload();
}, 30000);
</script>

{include file="$template/footer.tpl"}