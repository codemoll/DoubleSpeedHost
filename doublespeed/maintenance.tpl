{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg flex items-center justify-center px-4">
    <div class="max-w-2xl w-full text-center">
        <div class="mb-8">
            <div class="text-4xl font-bold text-electric-blue mb-4">
                <i class="fas fa-tools mr-2"></i>
                Maintenance Mode
            </div>
            <h1 class="text-2xl font-semibold text-white mb-4">
                We'll be back soon!
            </h1>
            <p class="text-gray-400 mb-8 leading-relaxed">
                {if $maintenance_message}
                    {$maintenance_message}
                {else}
                    We are currently performing scheduled maintenance to improve our services. 
                    We expect to be back online shortly. Thank you for your patience.
                {/if}
            </p>
        </div>
        
        {if $estimated_time}
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6 mb-8">
                <h3 class="text-white font-semibold mb-2">
                    <i class="fas fa-clock mr-2 text-electric-blue"></i>
                    Estimated Completion
                </h3>
                <p class="text-gray-300">{$estimated_time}</p>
            </div>
        {/if}
        
        <div class="grid md:grid-cols-3 gap-6 mb-8">
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-4">
                <div class="text-neon-green text-2xl mb-2">
                    <i class="fas fa-shield-alt"></i>
                </div>
                <h4 class="text-white font-semibold mb-1">Security Updates</h4>
                <p class="text-gray-400 text-sm">Implementing latest security patches</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-4">
                <div class="text-electric-blue text-2xl mb-2">
                    <i class="fas fa-rocket"></i>
                </div>
                <h4 class="text-white font-semibold mb-1">Performance</h4>
                <p class="text-gray-400 text-sm">Optimizing server performance</p>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-4">
                <div class="text-cyber-purple text-2xl mb-2">
                    <i class="fas fa-cogs"></i>
                </div>
                <h4 class="text-white font-semibold mb-1">New Features</h4>
                <p class="text-gray-400 text-sm">Adding exciting new capabilities</p>
            </div>
        </div>
        
        <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
            <h3 class="text-white font-semibold mb-4">Need Immediate Assistance?</h3>
            <div class="flex flex-wrap justify-center gap-4">
                {if $support_email}
                    <a href="mailto:{$support_email}" class="inline-flex items-center bg-neon-green text-dark-bg font-semibold py-2 px-4 rounded-lg hover:shadow-neon-green/50 hover:shadow-lg transition-all duration-300">
                        <i class="fas fa-envelope mr-2"></i>
                        Email Support
                    </a>
                {/if}
                
                {if $support_phone}
                    <a href="tel:{$support_phone}" class="inline-flex items-center bg-electric-blue text-white font-semibold py-2 px-4 rounded-lg hover:shadow-electric-blue/50 hover:shadow-lg transition-all duration-300">
                        <i class="fas fa-phone mr-2"></i>
                        Call Support
                    </a>
                {/if}
                
                <a href="{$WEB_ROOT}/serverstatus.php" class="inline-flex items-center text-gray-400 hover:text-neon-green transition-colors duration-300">
                    <i class="fas fa-chart-line mr-2"></i>
                    Server Status
                </a>
            </div>
        </div>
        
        <div class="mt-8 text-sm text-gray-500">
            <p>Follow us for real-time updates</p>
            <div class="flex justify-center space-x-4 mt-2">
                <a href="#" class="text-gray-500 hover:text-neon-green transition-colors">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="#" class="text-gray-500 hover:text-neon-green transition-colors">
                    <i class="fab fa-facebook"></i>
                </a>
                <a href="#" class="text-gray-500 hover:text-neon-green transition-colors">
                    <i class="fab fa-discord"></i>
                </a>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}