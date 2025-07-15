<!-- Credit Card Payment Method Selection -->
<div class="payment-method-option" data-method="card">
    <div class="bg-dark-bg rounded-lg border border-gray-600 p-6 hover:border-neon-green cursor-pointer transition-all duration-300 {if $selectedpaymentmethod == 'card' || $selectedpaymentmethod == 'creditcard'}border-neon-green bg-neon-green/10{/if}">
        <div class="flex items-center justify-between">
            <div class="flex items-center space-x-4">
                <!-- Credit Card Icon -->
                <div class="w-16 h-16 bg-gradient-to-br from-neon-green to-electric-blue rounded-lg flex items-center justify-center">
                    <i class="fas fa-credit-card text-2xl text-white"></i>
                </div>
                
                <!-- Credit Card Payment Info -->
                <div>
                    <h4 class="text-lg font-semibold text-white">Credit/Debit Card</h4>
                    <p class="text-gray-400 text-sm">Secure card payment processing</p>
                    <div class="flex items-center space-x-4 mt-2 text-xs text-gray-500">
                        <span class="flex items-center">
                            <i class="fas fa-bolt mr-1"></i>
                            Instant
                        </span>
                        <span class="flex items-center">
                            <i class="fas fa-shield-alt mr-1"></i>
                            SSL Secured
                        </span>
                        <span class="flex items-center">
                            <i class="fas fa-lock mr-1"></i>
                            PCI Compliant
                        </span>
                    </div>
                </div>
            </div>
            
            <!-- Selection Radio Button -->
            <div class="flex items-center">
                <input type="radio" name="paymentmethod" value="creditcard" id="payment_card"
                       {if $selectedpaymentmethod == 'card' || $selectedpaymentmethod == 'creditcard'}checked{/if}
                       class="w-5 h-5 text-neon-green bg-dark-bg border-gray-600 focus:ring-neon-green">
            </div>
        </div>
        
        <!-- Accepted Cards -->
        <div class="mt-4 pt-4 border-t border-gray-600">
            <div class="flex items-center justify-between">
                <span class="text-sm text-gray-400">Accepted Cards:</span>
                <div class="flex space-x-2">
                    <div class="w-10 h-7 bg-gradient-to-r from-blue-600 to-blue-500 rounded flex items-center justify-center shadow-lg">
                        <span class="text-white text-xs font-bold">VISA</span>
                    </div>
                    <div class="w-10 h-7 bg-gradient-to-r from-red-600 to-orange-500 rounded flex items-center justify-center shadow-lg">
                        <span class="text-white text-xs font-bold">MC</span>
                    </div>
                    <div class="w-10 h-7 bg-gradient-to-r from-blue-500 to-blue-700 rounded flex items-center justify-center shadow-lg">
                        <span class="text-white text-xs font-bold">AMEX</span>
                    </div>
                    <div class="w-10 h-7 bg-gradient-to-r from-orange-500 to-yellow-500 rounded flex items-center justify-center shadow-lg">
                        <span class="text-white text-xs font-bold">DISC</span>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Payment Method Benefits -->
        <div class="mt-4 pt-4 border-t border-gray-600">
            <div class="grid grid-cols-2 gap-4 text-sm">
                <div class="flex items-center text-gray-300">
                    <i class="fas fa-check text-neon-green mr-2"></i>
                    Instant activation
                </div>
                <div class="flex items-center text-gray-300">
                    <i class="fas fa-check text-neon-green mr-2"></i>
                    Secure processing
                </div>
                <div class="flex items-center text-gray-300">
                    <i class="fas fa-check text-neon-green mr-2"></i>
                    Auto-renewal support
                </div>
                <div class="flex items-center text-gray-300">
                    <i class="fas fa-check text-neon-green mr-2"></i>
                    Save for future use
                </div>
            </div>
        </div>
        
        <!-- Security Features -->
        {if $selectedpaymentmethod == 'card' || $selectedpaymentmethod == 'creditcard'}
            <div class="mt-4 p-4 bg-dark-surface rounded-lg border border-neon-green/30">
                <h5 class="text-sm font-semibold text-neon-green mb-2">
                    <i class="fas fa-shield-alt mr-1"></i>
                    Security Features
                </h5>
                <ul class="text-xs text-gray-400 space-y-1">
                    <li>• 256-bit SSL encryption for all transactions</li>
                    <li>• PCI DSS Level 1 compliant payment processing</li>
                    <li>• Fraud detection and prevention systems</li>
                    <li>• Your card details are never stored on our servers</li>
                </ul>
            </div>
        {/if}
        
        <!-- Saved Cards (if available) -->
        {if $savedcards && ($selectedpaymentmethod == 'card' || $selectedpaymentmethod == 'creditcard')}
            <div class="mt-4 p-4 bg-dark-surface rounded-lg border border-gray-600">
                <h5 class="text-sm font-semibold text-white mb-3">
                    <i class="fas fa-bookmark mr-1"></i>
                    Saved Cards
                </h5>
                <div class="space-y-2">
                    {foreach from=$savedcards item=savedcard}
                        <label class="flex items-center justify-between p-3 bg-dark-bg rounded border border-gray-600 hover:border-neon-green cursor-pointer transition-colors">
                            <div class="flex items-center space-x-3">
                                <input type="radio" name="saved_card_id" value="{$savedcard.id}" 
                                       class="text-neon-green bg-dark-bg border-gray-600 focus:ring-neon-green">
                                <div>
                                    <div class="text-white text-sm">•••• •••• •••• {$savedcard.last4}</div>
                                    <div class="text-gray-400 text-xs">{$savedcard.type} • Expires {$savedcard.expiry}</div>
                                </div>
                            </div>
                            <div class="text-xs text-gray-500">
                                {if $savedcard.default}
                                    <span class="bg-neon-green text-dark-bg px-2 py-1 rounded-full font-semibold">DEFAULT</span>
                                {/if}
                            </div>
                        </label>
                    {/foreach}
                    <label class="flex items-center p-3 bg-dark-bg rounded border border-gray-600 hover:border-neon-green cursor-pointer transition-colors">
                        <input type="radio" name="saved_card_id" value="new" checked
                               class="text-neon-green bg-dark-bg border-gray-600 focus:ring-neon-green mr-3">
                        <span class="text-white text-sm">Use a new card</span>
                    </label>
                </div>
            </div>
        {/if}
    </div>
</div>