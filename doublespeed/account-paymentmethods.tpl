{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-6xl mx-auto">
        
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                <span class="glow-text">Payment Methods</span>
            </h1>
            <p class="text-text-light">
                Manage your saved payment methods for automatic billing and easy checkout.
            </p>
        </div>
        
        {if $successmessage}
            <div class="bg-green-900 border border-green-700 rounded-lg p-4 mb-6">
                <div class="flex">
                    <svg class="w-5 h-5 text-green-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                    </svg>
                    <div class="text-green-200 text-sm">{$successmessage}</div>
                </div>
            </div>
        {/if}
        
        <!-- Add Payment Method Button -->
        <div class="mb-6">
            <button onclick="showAddPaymentForm()" class="btn-primary">
                <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z" clip-rule="evenodd"/>
                </svg>
                Add Payment Method
            </button>
        </div>
        
        {if $paymentmethods}
            <!-- Payment Methods List -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
                {foreach from=$paymentmethods item=method}
                    <div class="card-dark">
                        <div class="flex items-start justify-between mb-4">
                            <div class="flex items-center space-x-3">
                                {if $method.type == 'creditcard'}
                                    <div class="w-12 h-12 bg-gradient-to-br from-neon-green to-electric-blue rounded-lg flex items-center justify-center">
                                        <svg class="w-6 h-6 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                                            <path d="M4 4a2 2 0 00-2 2v1h16V6a2 2 0 00-2-2H4z"/>
                                            <path fill-rule="evenodd" d="M18 9H2v5a2 2 0 002 2h12a2 2 0 002-2V9zM4 13a1 1 0 011-1h1a1 1 0 110 2H5a1 1 0 01-1-1zm5-1a1 1 0 100 2h1a1 1 0 100-2H9z" clip-rule="evenodd"/>
                                        </svg>
                                    </div>
                                {elseif $method.type == 'paypal'}
                                    <div class="w-12 h-12 bg-gradient-to-br from-blue-500 to-blue-700 rounded-lg flex items-center justify-center">
                                        <span class="text-white font-bold text-sm">PP</span>
                                    </div>
                                {else}
                                    <div class="w-12 h-12 bg-gradient-to-br from-gray-500 to-gray-700 rounded-lg flex items-center justify-center">
                                        <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                                            <path d="M4 4a2 2 0 00-2 2v1h16V6a2 2 0 00-2-2H4z"/>
                                            <path fill-rule="evenodd" d="M18 9H2v5a2 2 0 002 2h12a2 2 0 002-2V9zM4 13a1 1 0 011-1h1a1 1 0 110 2H5a1 1 0 01-1-1zm5-1a1 1 0 100 2h1a1 1 0 100-2H9z" clip-rule="evenodd"/>
                                        </svg>
                                    </div>
                                {/if}
                                
                                <div>
                                    <h3 class="text-lg font-semibold text-white">
                                        {if $method.type == 'creditcard'}
                                            {$method.cardtype} •••• {$method.last4}
                                        {elseif $method.type == 'paypal'}
                                            PayPal
                                        {else}
                                            {$method.displayname}
                                        {/if}
                                    </h3>
                                    {if $method.expiry}
                                        <p class="text-text-light text-sm">Expires {$method.expiry}</p>
                                    {/if}
                                    {if $method.email}
                                        <p class="text-text-light text-sm">{$method.email}</p>
                                    {/if}
                                </div>
                            </div>
                            
                            <!-- Primary Badge -->
                            {if $method.primary}
                                <span class="inline-flex items-center px-2 py-1 rounded text-xs bg-neon-green text-dark-bg">
                                    Primary
                                </span>
                            {/if}
                        </div>
                        
                        <!-- Payment Method Details -->
                        <div class="space-y-2 text-sm mb-4">
                            {if $method.billing_address}
                                <div>
                                    <span class="text-text-light">Billing:</span>
                                    <div class="text-white text-xs mt-1">
                                        {$method.billing_address.name}<br>
                                        {$method.billing_address.address1}<br>
                                        {if $method.billing_address.address2}
                                            {$method.billing_address.address2}<br>
                                        {/if}
                                        {$method.billing_address.city}, {$method.billing_address.state} {$method.billing_address.postcode}
                                    </div>
                                </div>
                            {/if}
                        </div>
                        
                        <!-- Actions -->
                        <div class="flex space-x-2">
                            {if !$method.primary}
                                <button onclick="setAsPrimary('{$method.id}')" 
                                        class="btn-outline text-xs px-3 py-1 flex-1">
                                    Set as Primary
                                </button>
                            {/if}
                            
                            <button onclick="editPaymentMethod('{$method.id}')" 
                                    class="btn-secondary text-xs px-3 py-1">
                                <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                                    <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"/>
                                </svg>
                            </button>
                            
                            <button onclick="deletePaymentMethod('{$method.id}')" 
                                    class="text-red-400 hover:text-red-300 text-xs px-2 py-1">
                                <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z" clip-rule="evenodd"/>
                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                {/foreach}
            </div>
        {else}
            <!-- No Payment Methods -->
            <div class="card-dark text-center py-12 mb-8">
                <div class="mx-auto w-20 h-20 bg-gradient-to-br from-gray-600 to-gray-700 rounded-full flex items-center justify-center mb-6">
                    <svg class="w-10 h-10 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M4 4a2 2 0 00-2 2v1h16V6a2 2 0 00-2-2H4z"/>
                        <path fill-rule="evenodd" d="M18 9H2v5a2 2 0 002 2h12a2 2 0 002-2V9zM4 13a1 1 0 011-1h1a1 1 0 110 2H5a1 1 0 01-1-1zm5-1a1 1 0 100 2h1a1 1 0 100-2H9z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">No Payment Methods</h3>
                <p class="text-text-light mb-6">
                    Add a payment method to enable automatic billing and faster checkout.
                </p>
                <button onclick="showAddPaymentForm()" class="btn-primary">
                    Add Your First Payment Method
                </button>
            </div>
        {/if}
        
        <!-- Add Payment Method Form (Hidden by default) -->
        <div id="add-payment-form" class="hidden">
            <div class="card-dark">
                <h3 class="text-xl font-semibold text-white mb-6">Add Payment Method</h3>
                
                <form method="post" action="{$smarty.server.PHP_SELF}" class="space-y-6">
                    <input type="hidden" name="action" value="add" />
                    
                    <!-- Payment Type Selection -->
                    <div>
                        <label class="block text-sm font-medium text-white mb-2">Payment Type</label>
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                            <label class="cursor-pointer">
                                <input type="radio" name="payment_type" value="creditcard" checked 
                                       class="sr-only" onchange="showPaymentFields('creditcard')">
                                <div class="p-4 border-2 border-gray-700 rounded-lg hover:border-neon-green transition-colors duration-300 payment-type-option" data-type="creditcard">
                                    <div class="flex items-center space-x-3">
                                        <svg class="w-6 h-6 text-neon-green" fill="currentColor" viewBox="0 0 20 20">
                                            <path d="M4 4a2 2 0 00-2 2v1h16V6a2 2 0 00-2-2H4z"/>
                                            <path fill-rule="evenodd" d="M18 9H2v5a2 2 0 002 2h12a2 2 0 002-2V9zM4 13a1 1 0 011-1h1a1 1 0 110 2H5a1 1 0 01-1-1zm5-1a1 1 0 100 2h1a1 1 0 100-2H9z" clip-rule="evenodd"/>
                                        </svg>
                                        <span class="text-white font-medium">Credit Card</span>
                                    </div>
                                </div>
                            </label>
                            
                            <label class="cursor-pointer">
                                <input type="radio" name="payment_type" value="paypal" 
                                       class="sr-only" onchange="showPaymentFields('paypal')">
                                <div class="p-4 border-2 border-gray-700 rounded-lg hover:border-electric-blue transition-colors duration-300 payment-type-option" data-type="paypal">
                                    <div class="flex items-center space-x-3">
                                        <div class="w-6 h-6 bg-blue-500 rounded flex items-center justify-center">
                                            <span class="text-white font-bold text-xs">P</span>
                                        </div>
                                        <span class="text-white font-medium">PayPal</span>
                                    </div>
                                </div>
                            </label>
                            
                            <label class="cursor-pointer">
                                <input type="radio" name="payment_type" value="bank" 
                                       class="sr-only" onchange="showPaymentFields('bank')">
                                <div class="p-4 border-2 border-gray-700 rounded-lg hover:border-cyber-purple transition-colors duration-300 payment-type-option" data-type="bank">
                                    <div class="flex items-center space-x-3">
                                        <svg class="w-6 h-6 text-cyber-purple" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M4 4a2 2 0 00-2 2v8a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2H4zm0 2h12v8H4V6zm2 2a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm0 3a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1z" clip-rule="evenodd"/>
                                        </svg>
                                        <span class="text-white font-medium">Bank Account</span>
                                    </div>
                                </div>
                            </label>
                        </div>
                    </div>
                    
                    <!-- Credit Card Fields -->
                    <div id="creditcard-fields">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div class="md:col-span-2">
                                <label for="cc_number" class="block text-sm font-medium text-white mb-2">
                                    Card Number *
                                </label>
                                <input type="text" id="cc_number" name="cc_number" 
                                       class="input-dark w-full" placeholder="1234 5678 9012 3456"
                                       maxlength="19" pattern="[0-9\s]*">
                            </div>
                            
                            <div>
                                <label for="cc_expiry" class="block text-sm font-medium text-white mb-2">
                                    Expiry Date *
                                </label>
                                <input type="text" id="cc_expiry" name="cc_expiry" 
                                       class="input-dark w-full" placeholder="MM/YY"
                                       maxlength="5" pattern="[0-9\/]*">
                            </div>
                            
                            <div>
                                <label for="cc_cvv" class="block text-sm font-medium text-white mb-2">
                                    CVV *
                                </label>
                                <input type="text" id="cc_cvv" name="cc_cvv" 
                                       class="input-dark w-full" placeholder="123"
                                       maxlength="4" pattern="[0-9]*">
                            </div>
                            
                            <div class="md:col-span-2">
                                <label for="cc_name" class="block text-sm font-medium text-white mb-2">
                                    Cardholder Name *
                                </label>
                                <input type="text" id="cc_name" name="cc_name" 
                                       class="input-dark w-full" placeholder="John Doe">
                            </div>
                        </div>
                    </div>
                    
                    <!-- PayPal Fields -->
                    <div id="paypal-fields" class="hidden">
                        <div>
                            <label for="paypal_email" class="block text-sm font-medium text-white mb-2">
                                PayPal Email *
                            </label>
                            <input type="email" id="paypal_email" name="paypal_email" 
                                   class="input-dark w-full" placeholder="your@paypal.com">
                        </div>
                    </div>
                    
                    <!-- Bank Account Fields -->
                    <div id="bank-fields" class="hidden">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label for="bank_name" class="block text-sm font-medium text-white mb-2">
                                    Bank Name *
                                </label>
                                <input type="text" id="bank_name" name="bank_name" 
                                       class="input-dark w-full" placeholder="Your Bank">
                            </div>
                            
                            <div>
                                <label for="account_number" class="block text-sm font-medium text-white mb-2">
                                    Account Number *
                                </label>
                                <input type="text" id="account_number" name="account_number" 
                                       class="input-dark w-full" placeholder="123456789">
                            </div>
                            
                            <div>
                                <label for="routing_number" class="block text-sm font-medium text-white mb-2">
                                    Routing Number *
                                </label>
                                <input type="text" id="routing_number" name="routing_number" 
                                       class="input-dark w-full" placeholder="021000021">
                            </div>
                            
                            <div>
                                <label for="account_type" class="block text-sm font-medium text-white mb-2">
                                    Account Type *
                                </label>
                                <select id="account_type" name="account_type" class="input-dark w-full">
                                    <option value="checking">Checking</option>
                                    <option value="savings">Savings</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Set as Primary -->
                    <div>
                        <label class="flex items-center">
                            <input type="checkbox" name="set_primary" value="1" 
                                   class="rounded border-gray-600 bg-dark-surface text-neon-green focus:ring-neon-green">
                            <span class="ml-3 text-sm text-white">
                                Set as primary payment method
                            </span>
                        </label>
                    </div>
                    
                    <!-- Actions -->
                    <div class="flex justify-between">
                        <button type="button" onclick="hideAddPaymentForm()" class="btn-outline">
                            Cancel
                        </button>
                        <button type="submit" class="btn-primary">
                            Add Payment Method
                        </button>
                    </div>
                </form>
            </div>
        </div>
        
        <!-- Security Information -->
        <div class="card-dark">
            <h3 class="text-xl font-semibold text-white mb-6">Security & Privacy</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 text-sm">
                <div>
                    <h4 class="text-white font-medium mb-2">Data Protection</h4>
                    <ul class="text-text-light space-y-1">
                        <li>• All payment data is encrypted using SSL</li>
                        <li>• We never store full credit card numbers</li>
                        <li>• PCI DSS compliant payment processing</li>
                        <li>• Regular security audits and monitoring</li>
                    </ul>
                </div>
                <div>
                    <h4 class="text-white font-medium mb-2">Automatic Billing</h4>
                    <ul class="text-text-light space-y-1">
                        <li>• Charges are processed 3 days before due date</li>
                        <li>• Email notifications sent before each charge</li>
                        <li>• Failed payments result in retry attempts</li>
                        <li>• You can disable auto-billing anytime</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
function showAddPaymentForm() {
    document.getElementById('add-payment-form').classList.remove('hidden');
    document.getElementById('add-payment-form').scrollIntoView({ behavior: 'smooth' });
}

function hideAddPaymentForm() {
    document.getElementById('add-payment-form').classList.add('hidden');
}

function showPaymentFields(type) {
    // Hide all field sets
    document.getElementById('creditcard-fields').classList.add('hidden');
    document.getElementById('paypal-fields').classList.add('hidden');
    document.getElementById('bank-fields').classList.add('hidden');
    
    // Show selected field set
    document.getElementById(type + '-fields').classList.remove('hidden');
    
    // Update option styling
    document.querySelectorAll('.payment-type-option').forEach(option => {
        option.classList.remove('border-neon-green', 'border-electric-blue', 'border-cyber-purple');
        option.classList.add('border-gray-700');
    });
    
    const selectedOption = document.querySelector(`.payment-type-option[data-type="${type}"]`);
    selectedOption.classList.remove('border-gray-700');
    
    if (type === 'creditcard') selectedOption.classList.add('border-neon-green');
    else if (type === 'paypal') selectedOption.classList.add('border-electric-blue');
    else if (type === 'bank') selectedOption.classList.add('border-cyber-purple');
}

function setAsPrimary(methodId) {
    if (confirm('Set this payment method as your primary method?')) {
        window.location.href = '{$WEB_ROOT}/clientarea.php?action=paymentmethods&operation=setprimary&id=' + methodId;
    }
}

function editPaymentMethod(methodId) {
    window.location.href = '{$WEB_ROOT}/clientarea.php?action=paymentmethods&operation=edit&id=' + methodId;
}

function deletePaymentMethod(methodId) {
    if (confirm('Are you sure you want to delete this payment method? This action cannot be undone.')) {
        window.location.href = '{$WEB_ROOT}/clientarea.php?action=paymentmethods&operation=delete&id=' + methodId;
    }
}

// Format credit card number
document.getElementById('cc_number').addEventListener('input', function(e) {
    let value = e.target.value.replace(/\s/g, '').replace(/[^0-9]/gi, '');
    let formattedValue = value.match(/.{1,4}/g)?.join(' ') || value;
    if (formattedValue !== e.target.value) {
        e.target.value = formattedValue;
    }
});

// Format expiry date
document.getElementById('cc_expiry').addEventListener('input', function(e) {
    let value = e.target.value.replace(/\D/g, '');
    if (value.length >= 3) {
        value = value.substring(0, 2) + '/' + value.substring(2, 4);
    }
    e.target.value = value;
});
</script>

{include file="$template/footer.tpl"}