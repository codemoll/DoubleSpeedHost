<!-- Credit Card Payment Input Form -->
<div class="bg-dark-surface rounded-xl border border-gray-700 p-6">
    <h3 class="text-xl font-semibold text-white mb-4">
        <i class="fas fa-credit-card mr-2 text-neon-green"></i>
        Credit Card Information
    </h3>
    
    <div class="space-y-4">
        <!-- Card Number -->
        <div>
            <label for="card_number" class="block text-sm font-medium text-gray-300 mb-2">
                Card Number <span class="text-red-400">*</span>
            </label>
            <div class="relative">
                <input type="text" id="card_number" name="card_number" value="{$card_number|default:''}" 
                       class="w-full bg-dark-bg border border-gray-600 rounded-lg px-4 py-3 pr-12 text-white placeholder-gray-400 focus:border-neon-green focus:ring-1 focus:ring-neon-green transition-colors duration-300"
                       placeholder="1234 5678 9012 3456" maxlength="19" required>
                <div id="card_type_icon" class="absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-400">
                    <i class="fas fa-credit-card"></i>
                </div>
            </div>
        </div>
        
        <!-- Cardholder Name -->
        <div>
            <label for="card_holder_name" class="block text-sm font-medium text-gray-300 mb-2">
                Cardholder Name <span class="text-red-400">*</span>
            </label>
            <input type="text" id="card_holder_name" name="card_holder_name" value="{$card_holder_name|default:''}"
                   class="w-full bg-dark-bg border border-gray-600 rounded-lg px-4 py-3 text-white placeholder-gray-400 focus:border-neon-green focus:ring-1 focus:ring-neon-green transition-colors duration-300"
                   placeholder="John Doe" required>
        </div>
        
        <!-- Expiry Date and CVV -->
        <div class="grid grid-cols-2 gap-4">
            <div>
                <label for="card_expiry" class="block text-sm font-medium text-gray-300 mb-2">
                    Expiry Date <span class="text-red-400">*</span>
                </label>
                <input type="text" id="card_expiry" name="card_expiry" value="{$card_expiry|default:''}"
                       class="w-full bg-dark-bg border border-gray-600 rounded-lg px-4 py-3 text-white placeholder-gray-400 focus:border-neon-green focus:ring-1 focus:ring-neon-green transition-colors duration-300"
                       placeholder="MM/YY" maxlength="5" required>
            </div>
            <div>
                <label for="card_cvv" class="block text-sm font-medium text-gray-300 mb-2">
                    CVV <span class="text-red-400">*</span>
                </label>
                <div class="relative">
                    <input type="text" id="card_cvv" name="card_cvv" value="{$card_cvv|default:''}"
                           class="w-full bg-dark-bg border border-gray-600 rounded-lg px-4 py-3 pr-10 text-white placeholder-gray-400 focus:border-neon-green focus:ring-1 focus:ring-neon-green transition-colors duration-300"
                           placeholder="123" maxlength="4" required>
                    <div class="absolute right-3 top-1/2 transform -translate-y-1/2">
                        <div class="group relative">
                            <i class="fas fa-question-circle text-gray-400 cursor-help"></i>
                            <div class="hidden group-hover:block absolute bottom-full right-0 mb-2 p-2 bg-dark-bg border border-gray-600 rounded text-xs text-gray-300 whitespace-nowrap z-10">
                                3-digit code on back of card
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Save Card Option -->
        <div class="flex items-center space-x-3 pt-2">
            <input type="checkbox" id="save_card" name="save_card" value="1"
                   class="text-neon-green bg-dark-bg border-gray-600 rounded focus:ring-neon-green">
            <label for="save_card" class="text-sm text-gray-300 cursor-pointer">
                Save this card for future payments
            </label>
        </div>
    </div>
    
    <!-- Accepted Cards -->
    <div class="mt-6 pt-4 border-t border-gray-600">
        <div class="flex items-center justify-between">
            <span class="text-sm text-gray-400">Accepted Cards:</span>
            <div class="flex space-x-2">
                <div class="w-8 h-6 bg-gradient-to-r from-blue-600 to-blue-500 rounded flex items-center justify-center">
                    <span class="text-white text-xs font-bold">VISA</span>
                </div>
                <div class="w-8 h-6 bg-gradient-to-r from-red-600 to-orange-500 rounded flex items-center justify-center">
                    <span class="text-white text-xs font-bold">MC</span>
                </div>
                <div class="w-8 h-6 bg-gradient-to-r from-blue-500 to-blue-700 rounded flex items-center justify-center">
                    <span class="text-white text-xs font-bold">AMEX</span>
                </div>
                <div class="w-8 h-6 bg-gradient-to-r from-orange-500 to-yellow-500 rounded flex items-center justify-center">
                    <span class="text-white text-xs font-bold">DISC</span>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Security Information -->
    <div class="mt-4 p-4 bg-dark-bg rounded-lg border border-neon-green/30">
        <div class="flex items-start space-x-3">
            <i class="fas fa-shield-alt text-neon-green mt-1"></i>
            <div>
                <h5 class="text-sm font-semibold text-neon-green mb-1">Secure Payment</h5>
                <p class="text-xs text-gray-400">
                    Your payment information is encrypted and secure. We use industry-standard SSL encryption 
                    to protect your data and never store your complete credit card information.
                </p>
            </div>
        </div>
    </div>
</div>