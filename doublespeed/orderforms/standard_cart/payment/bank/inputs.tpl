<!-- Bank Payment Input Form -->
<div class="bg-dark-surface rounded-xl border border-gray-700 p-6">
    <h3 class="text-xl font-semibold text-white mb-4">
        <i class="fas fa-university mr-2 text-cyber-purple"></i>
        Bank Transfer Details
    </h3>
    
    <div class="space-y-4">
        <!-- Bank Name -->
        <div>
            <label for="bank_name" class="block text-sm font-medium text-gray-300 mb-2">
                Bank Name <span class="text-red-400">*</span>
            </label>
            <input type="text" id="bank_name" name="bank_name" value="{$bank_name|default:''}" 
                   class="w-full bg-dark-bg border border-gray-600 rounded-lg px-4 py-3 text-white placeholder-gray-400 focus:border-cyber-purple focus:ring-1 focus:ring-cyber-purple transition-colors duration-300"
                   placeholder="Enter your bank name" required>
        </div>
        
        <!-- Account Holder Name -->
        <div>
            <label for="account_holder" class="block text-sm font-medium text-gray-300 mb-2">
                Account Holder Name <span class="text-red-400">*</span>
            </label>
            <input type="text" id="account_holder" name="account_holder" value="{$account_holder|default:''}"
                   class="w-full bg-dark-bg border border-gray-600 rounded-lg px-4 py-3 text-white placeholder-gray-400 focus:border-cyber-purple focus:ring-1 focus:ring-cyber-purple transition-colors duration-300"
                   placeholder="Enter account holder name" required>
        </div>
        
        <!-- Account Number -->
        <div>
            <label for="account_number" class="block text-sm font-medium text-gray-300 mb-2">
                Account Number <span class="text-red-400">*</span>
            </label>
            <input type="text" id="account_number" name="account_number" value="{$account_number|default:''}"
                   class="w-full bg-dark-bg border border-gray-600 rounded-lg px-4 py-3 text-white placeholder-gray-400 focus:border-cyber-purple focus:ring-1 focus:ring-cyber-purple transition-colors duration-300"
                   placeholder="Enter account number" required>
        </div>
        
        <!-- Routing Number -->
        <div>
            <label for="routing_number" class="block text-sm font-medium text-gray-300 mb-2">
                Routing Number <span class="text-red-400">*</span>
            </label>
            <input type="text" id="routing_number" name="routing_number" value="{$routing_number|default:''}"
                   class="w-full bg-dark-bg border border-gray-600 rounded-lg px-4 py-3 text-white placeholder-gray-400 focus:border-cyber-purple focus:ring-1 focus:ring-cyber-purple transition-colors duration-300"
                   placeholder="Enter routing number" required>
        </div>
        
        <!-- Bank Country -->
        <div>
            <label for="bank_country" class="block text-sm font-medium text-gray-300 mb-2">
                Bank Country <span class="text-red-400">*</span>
            </label>
            <select id="bank_country" name="bank_country" 
                    class="w-full bg-dark-bg border border-gray-600 rounded-lg px-4 py-3 text-white focus:border-cyber-purple focus:ring-1 focus:ring-cyber-purple transition-colors duration-300" required>
                <option value="">Select Country</option>
                {foreach from=$countries item=country}
                    <option value="{$country.code}" {if $country.code == $bank_country}selected{/if}>
                        {$country.name}
                    </option>
                {/foreach}
            </select>
        </div>
        
        <!-- Additional Information -->
        <div>
            <label for="bank_additional_info" class="block text-sm font-medium text-gray-300 mb-2">
                Additional Information
            </label>
            <textarea id="bank_additional_info" name="bank_additional_info" rows="3"
                      class="w-full bg-dark-bg border border-gray-600 rounded-lg px-4 py-3 text-white placeholder-gray-400 focus:border-cyber-purple focus:ring-1 focus:ring-cyber-purple transition-colors duration-300"
                      placeholder="Any additional information for the bank transfer...">{$bank_additional_info|default:''}</textarea>
        </div>
    </div>
    
    <!-- Terms Acceptance -->
    <div class="mt-6 pt-4 border-t border-gray-600">
        <label class="flex items-start space-x-3">
            <input type="checkbox" name="bank_terms_accepted" value="1" 
                   class="mt-1 text-cyber-purple bg-dark-bg border-gray-600 rounded focus:ring-cyber-purple" required>
            <span class="text-sm text-gray-300">
                I acknowledge that bank transfers may take 3-5 business days to process and understand 
                the terms and conditions for bank transfer payments.
            </span>
        </label>
    </div>
</div>