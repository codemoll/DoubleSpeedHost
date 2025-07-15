{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Affiliate Program</h1>
            
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
                <div class="bg-gradient-to-r from-neon-green to-electric-blue p-6 rounded-lg text-dark-bg">
                    <h2 class="text-2xl font-bold mb-2">Earn Money with Our Affiliate Program</h2>
                    <p class="text-lg">Refer customers and earn commission on every sale!</p>
                </div>
                
                {if $isaffiliate}
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                        <div class="bg-dark-bg rounded-lg p-4 border border-gray-600 text-center">
                            <h3 class="text-xl font-semibold text-white mb-2">Total Referrals</h3>
                            <p class="text-3xl font-bold text-neon-green">{$totalreferrals}</p>
                        </div>
                        <div class="bg-dark-bg rounded-lg p-4 border border-gray-600 text-center">
                            <h3 class="text-xl font-semibold text-white mb-2">Total Earnings</h3>
                            <p class="text-3xl font-bold text-electric-blue">${$totalearnings}</p>
                        </div>
                        <div class="bg-dark-bg rounded-lg p-4 border border-gray-600 text-center">
                            <h3 class="text-xl font-semibold text-white mb-2">Pending Balance</h3>
                            <p class="text-3xl font-bold text-cyber-purple">${$pendingbalance}</p>
                        </div>
                    </div>
                    
                    <div class="bg-dark-bg rounded-lg p-6 border border-gray-600">
                        <h3 class="text-lg font-semibold text-white mb-4">Your Affiliate Link</h3>
                        <div class="flex items-center space-x-4">
                            <input type="text" value="{$affiliatelink}" readonly class="input-dark flex-1" id="affiliateLink">
                            <button onclick="copyToClipboard('affiliateLink')" class="btn-primary">Copy Link</button>
                        </div>
                    </div>
                {else}
                    <div class="text-center">
                        <h3 class="text-xl font-semibold text-white mb-4">Join Our Affiliate Program</h3>
                        <p class="text-text-light mb-6">Start earning commissions by referring new customers to our services.</p>
                        <a href="{$WEB_ROOT}/affiliates.php?action=signup" class="btn-primary">
                            Sign Up Now
                        </a>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
