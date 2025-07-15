{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Upgrade Summary</h1>
            
            {if $errormessage}
                <div class="bg-red-900 border border-red-700 rounded-lg p-4 mb-6">
                    <div class="flex">
                        <svg class="w-5 h-5 text-red-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                        </svg>
                        <div class="text-red-200 text-sm">
                            {$errormessage}
                        </div>
                    </div>
                </div>
            {/if}
            
            <div class="space-y-6">
                <div class="bg-green-900 border border-green-700 rounded-lg p-4">
                    <div class="flex">
                        <svg class="w-5 h-5 text-green-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                        </svg>
                        <div class="text-green-200 text-sm">
                            <strong>Upgrade Completed Successfully!</strong><br>
                            Your service has been upgraded and the changes are now active.
                        </div>
                    </div>
                </div>
                
                {if $upgradedetails}
                    <div class="bg-dark-bg rounded-lg p-6 border border-gray-600">
                        <h3 class="text-lg font-semibold text-white mb-4">Upgrade Details</h3>
                        
                        <div class="space-y-4">
                            <div class="flex justify-between">
                                <span class="text-text-light">Service:</span>
                                <span class="text-white">{$upgradedetails.service}</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-text-light">Upgrade Date:</span>
                                <span class="text-white">{$upgradedetails.date}</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-text-light">Previous Plan:</span>
                                <span class="text-white">{$upgradedetails.oldplan}</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-text-light">New Plan:</span>
                                <span class="text-neon-green font-semibold">{$upgradedetails.newplan}</span>
                            </div>
                            <div class="flex justify-between border-t border-gray-600 pt-4">
                                <span class="text-text-light">Upgrade Cost:</span>
                                <span class="text-neon-green font-bold">${$upgradedetails.cost}</span>
                            </div>
                        </div>
                    </div>
                {/if}
                
                {if $features}
                    <div class="bg-dark-bg rounded-lg p-6 border border-gray-600">
                        <h3 class="text-lg font-semibold text-white mb-4">New Features Available</h3>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            {foreach $features as $feature}
                                <div class="flex items-center">
                                    <svg class="w-5 h-5 text-neon-green mr-3" fill="currentColor" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                                    </svg>
                                    <span class="text-white">{$feature}</span>
                                </div>
                            {/foreach}
                        </div>
                    </div>
                {/if}
                
                <div class="space-y-4">
                    <a href="{$WEB_ROOT}/clientarea.php?action=productdetails&id={$serviceid}" 
                       class="btn-primary w-full block text-center">
                        View Service Details
                    </a>
                    <a href="{$WEB_ROOT}/clientarea.php" class="btn-outline w-full block text-center">
                        Return to Client Area
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
