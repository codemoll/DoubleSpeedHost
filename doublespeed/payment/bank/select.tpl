<!-- Bank Payment Method Selection -->
<div class="payment-method-option" data-method="bank">
    <div class="bg-dark-bg rounded-lg border border-gray-600 p-6 hover:border-cyber-purple cursor-pointer transition-all duration-300 {if $selectedpaymentmethod == 'bank'}border-cyber-purple bg-cyber-purple/10{/if}">
        <div class="flex items-center justify-between">
            <div class="flex items-center space-x-4">
                <!-- Bank Icon -->
                <div class="w-16 h-16 bg-gradient-to-br from-cyber-purple to-electric-blue rounded-lg flex items-center justify-center">
                    <i class="fas fa-university text-2xl text-white"></i>
                </div>
                
                <!-- Bank Payment Info -->
                <div>
                    <h4 class="text-lg font-semibold text-white">Bank Transfer</h4>
                    <p class="text-gray-400 text-sm">Direct bank account transfer</p>
                    <div class="flex items-center space-x-4 mt-2 text-xs text-gray-500">
                        <span class="flex items-center">
                            <i class="fas fa-clock mr-1"></i>
                            3-5 business days
                        </span>
                        <span class="flex items-center">
                            <i class="fas fa-shield-alt mr-1"></i>
                            Secure transfer
                        </span>
                    </div>
                </div>
            </div>
            
            <!-- Selection Radio Button -->
            <div class="flex items-center">
                <input type="radio" name="paymentmethod" value="bank" id="payment_bank"
                       {if $selectedpaymentmethod == 'bank'}checked{/if}
                       class="w-5 h-5 text-cyber-purple bg-dark-bg border-gray-600 focus:ring-cyber-purple">
            </div>
        </div>
        
        <!-- Payment Method Benefits -->
        <div class="mt-4 pt-4 border-t border-gray-600">
            <div class="grid grid-cols-2 gap-4 text-sm">
                <div class="flex items-center text-gray-300">
                    <i class="fas fa-check text-cyber-purple mr-2"></i>
                    No processing fees
                </div>
                <div class="flex items-center text-gray-300">
                    <i class="fas fa-check text-cyber-purple mr-2"></i>
                    Bank-level security
                </div>
                <div class="flex items-center text-gray-300">
                    <i class="fas fa-check text-cyber-purple mr-2"></i>
                    Large amount support
                </div>
                <div class="flex items-center text-gray-300">
                    <i class="fas fa-check text-cyber-purple mr-2"></i>
                    Direct from account
                </div>
            </div>
        </div>
        
        <!-- Bank Transfer Instructions -->
        {if $selectedpaymentmethod == 'bank'}
            <div class="mt-4 p-4 bg-dark-surface rounded-lg border border-cyber-purple/30">
                <h5 class="text-sm font-semibold text-cyber-purple mb-2">
                    <i class="fas fa-info-circle mr-1"></i>
                    Bank Transfer Instructions
                </h5>
                <ul class="text-xs text-gray-400 space-y-1">
                    <li>• Processing time: 3-5 business days</li>
                    <li>• Your service will be activated after payment confirmation</li>
                    <li>• Please include your order number in the transfer reference</li>
                    <li>• Contact support if you need assistance with the transfer</li>
                </ul>
            </div>
        {/if}
    </div>
</div>