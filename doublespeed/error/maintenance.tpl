{include file="$template/header.tpl"}

<div class="min-h-screen flex items-center justify-center bg-dark-bg py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full space-y-8">
        <div class="text-center">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-electric-blue to-cyber-purple rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-white" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"/>
                </svg>
            </div>
            <h2 class="text-3xl font-orbitron font-bold text-white mb-4">
                Maintenance Mode
            </h2>
            <p class="text-text-light mb-8">
                We're performing scheduled maintenance to improve our services. We'll be back online shortly.
            </p>
        </div>
        
        <div class="card-dark text-center">
            <div class="bg-blue-900 border border-electric-blue rounded-lg p-4 mb-6">
                <h3 class="text-blue-200 font-semibold mb-2">
                    <svg class="w-5 h-5 inline-block mr-2" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"/>
                    </svg>
                    Scheduled Maintenance
                </h3>
                <p class="text-blue-300 text-sm">
                    {if $maintenance_message}
                        {$maintenance_message}
                    {else}
                        We're upgrading our systems to serve you better. This maintenance is scheduled to complete within the next few hours.
                    {/if}
                </p>
                {if $maintenance_end_time}
                    <div class="mt-3 text-blue-200 text-sm">
                        <strong>Expected completion:</strong> {$maintenance_end_time}
                    </div>
                {/if}
            </div>
            
            <h3 class="text-xl font-semibold text-white mb-4">What's being updated?</h3>
            <div class="space-y-4 mb-6">
                <div class="flex items-center space-x-3">
                    <svg class="w-5 h-5 text-neon-green flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                    </svg>
                    <span class="text-text-light">Security enhancements and patches</span>
                </div>
                <div class="flex items-center space-x-3">
                    <svg class="w-5 h-5 text-neon-green flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                    </svg>
                    <span class="text-text-light">Performance improvements</span>
                </div>
                <div class="flex items-center space-x-3">
                    <svg class="w-5 h-5 text-neon-green flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                    </svg>
                    <span class="text-text-light">New features and functionality</span>
                </div>
            </div>
            
            <!-- Countdown Timer (if enabled) -->
            {if $show_countdown && $maintenance_end_timestamp}
                <div class="mb-6">
                    <h4 class="text-lg font-semibold text-white mb-3">Time Remaining</h4>
                    <div id="countdown-timer" class="grid grid-cols-4 gap-2 text-center">
                        <div class="bg-dark-surface rounded-lg p-3">
                            <div id="days" class="text-2xl font-bold text-neon-green">00</div>
                            <div class="text-xs text-text-light">Days</div>
                        </div>
                        <div class="bg-dark-surface rounded-lg p-3">
                            <div id="hours" class="text-2xl font-bold text-neon-green">00</div>
                            <div class="text-xs text-text-light">Hours</div>
                        </div>
                        <div class="bg-dark-surface rounded-lg p-3">
                            <div id="minutes" class="text-2xl font-bold text-neon-green">00</div>
                            <div class="text-xs text-text-light">Min</div>
                        </div>
                        <div class="bg-dark-surface rounded-lg p-3">
                            <div id="seconds" class="text-2xl font-bold text-neon-green">00</div>
                            <div class="text-xs text-text-light">Sec</div>
                        </div>
                    </div>
                </div>
            {/if}
            
            <div class="space-y-4">
                <button onclick="location.reload()" class="btn-primary w-full block text-center">
                    <svg class="w-5 h-5 inline-block mr-2" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M4 2a1 1 0 011 1v2.101a7.002 7.002 0 0111.601 2.566 1 1 0 11-1.885.666A5.002 5.002 0 005.999 7H9a1 1 0 010 2H4a1 1 0 01-1-1V3a1 1 0 011-1zm.008 9.057a1 1 0 011.276.61A5.002 5.002 0 0014.001 13H11a1 1 0 110-2h5a1 1 0 011 1v5a1 1 0 11-2 0v-2.101a7.002 7.002 0 01-11.601-2.566 1 1 0 01.61-1.276z" clip-rule="evenodd"/>
                    </svg>
                    Check Again
                </button>
                <a href="{$WEB_ROOT}/serverstatus.php" class="btn-outline w-full block text-center">
                    <svg class="w-5 h-5 inline-block mr-2" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                    Server Status
                </a>
            </div>
            
            <div class="mt-6 text-sm text-text-light">
                <p>🔔 <strong>Stay Updated:</strong> Follow our status page for real-time maintenance progress.</p>
                <div class="mt-2 space-y-1">
                    <p>📧 {if isset($templatefile) && is_array($templatefile) && $templatefile.supportemail}Status updates: status@{$templatefile.supportemail}{else}Status updates: status@{$companyname|lower|replace:' ':''}.com{/if}</p>
                </div>
            </div>
        </div>
        
        <div class="text-center">
            <div class="text-neon-green text-sm">
                <svg class="w-4 h-4 inline-block mr-1" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                </svg>
                Thank you for your patience
            </div>
        </div>
    </div>
</div>

{if $show_countdown && $maintenance_end_timestamp}
<script>
// Countdown Timer
const maintenanceEndTime = {$maintenance_end_timestamp} * 1000; // Convert to milliseconds

function updateCountdown() {
    const now = new Date().getTime();
    const distance = maintenanceEndTime - now;
    
    if (distance < 0) {
        document.getElementById('countdown-timer').innerHTML = '<div class="col-span-4 text-neon-green">Maintenance Complete - Please refresh the page</div>';
        return;
    }
    
    const days = Math.floor(distance / (1000 * 60 * 60 * 24));
    const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
    document.getElementById('days').textContent = days.toString().padStart(2, '0');
    document.getElementById('hours').textContent = hours.toString().padStart(2, '0');
    document.getElementById('minutes').textContent = minutes.toString().padStart(2, '0');
    document.getElementById('seconds').textContent = seconds.toString().padStart(2, '0');
}

// Update the countdown every second
setInterval(updateCountdown, 1000);
updateCountdown(); // Run immediately
</script>
{/if}

{include file="$template/footer.tpl"}