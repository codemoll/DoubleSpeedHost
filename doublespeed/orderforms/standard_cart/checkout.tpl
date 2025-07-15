{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-8">
    <div class="container mx-auto px-4">
        <div class="max-w-6xl mx-auto">
            <!-- Order Progress -->
            <div class="mb-8">
                <div class="flex items-center justify-center space-x-4 mb-6">
                    <div class="flex items-center {if $step == 1 || $step == 2 || $step == 3 || $step == 4}text-neon-green{else}text-gray-400{/if}">
                        <div class="w-8 h-8 rounded-full border-2 {if $step == 1 || $step == 2 || $step == 3 || $step == 4}border-neon-green bg-neon-green text-dark-bg{else}border-gray-400{/if} flex items-center justify-center font-bold text-sm">1</div>
                        <span class="ml-2 font-semibold">Configure</span>
                    </div>
                    <div class="w-12 h-0.5 {if $step == 2 || $step == 3 || $step == 4}bg-neon-green{else}bg-gray-400{/if}"></div>
                    
                    <div class="flex items-center {if $step == 2 || $step == 3 || $step == 4}text-neon-green{else}text-gray-400{/if}">
                        <div class="w-8 h-8 rounded-full border-2 {if $step == 2 || $step == 3 || $step == 4}border-neon-green bg-neon-green text-dark-bg{else}border-gray-400{/if} flex items-center justify-center font-bold text-sm">2</div>
                        <span class="ml-2 font-semibold">Review</span>
                    </div>
                    <div class="w-12 h-0.5 {if $step == 3 || $step == 4}bg-neon-green{else}bg-gray-400{/if}"></div>
                    
                    <div class="flex items-center {if $step == 3 || $step == 4}text-neon-green{else}text-gray-400{/if}">
                        <div class="w-8 h-8 rounded-full border-2 {if $step == 3 || $step == 4}border-neon-green bg-neon-green text-dark-bg{else}border-gray-400{/if} flex items-center justify-center font-bold text-sm">3</div>
                        <span class="ml-2 font-semibold">Checkout</span>
                    </div>
                    <div class="w-12 h-0.5 {if $step == 4}bg-neon-green{else}bg-gray-400{/if}"></div>
                    
                    <div class="flex items-center {if $step == 4}text-neon-green{else}text-gray-400{/if}">
                        <div class="w-8 h-8 rounded-full border-2 {if $step == 4}border-neon-green bg-neon-green text-dark-bg{else}border-gray-400{/if} flex items-center justify-center font-bold text-sm">4</div>
                        <span class="ml-2 font-semibold">Complete</span>
                    </div>
                </div>
            </div>

            <div class="grid lg:grid-cols-3 gap-8">
                <!-- Main Content -->
                <div class="lg:col-span-2">
                    {if $step == 1}
                        <!-- Step 1: Product Configuration -->
                        <div class="bg-dark-surface rounded-xl border border-gray-700 p-6">
                            <h2 class="text-2xl font-bold text-white mb-6">
                                <i class="fas fa-cogs mr-2 text-neon-green"></i>
                                Configure Your Service
                            </h2>
                            
                            {if $products}
                                <div class="grid md:grid-cols-2 gap-6">
                                    {foreach from=$products item=product}
                                        <div class="bg-dark-bg rounded-lg border border-gray-600 p-6 hover:border-neon-green transition-colors duration-300">
                                            <h3 class="text-xl font-semibold text-white mb-2">{$product.name}</h3>
                                            <p class="text-gray-400 mb-4">{$product.description}</p>
                                            
                                            <div class="space-y-3 mb-4">
                                                {foreach from=$product.features item=feature}
                                                    <div class="flex items-center text-sm">
                                                        <i class="fas fa-check text-neon-green mr-2"></i>
                                                        <span class="text-gray-300">{$feature}</span>
                                                    </div>
                                                {/foreach}
                                            </div>
                                            
                                            <div class="border-t border-gray-600 pt-4">
                                                <div class="text-2xl font-bold text-neon-green mb-2">{$product.price}</div>
                                                <a href="{$WEB_ROOT}/cart.php?a=add&pid={$product.id}" class="block w-full bg-neon-green text-dark-bg font-semibold py-2 px-4 rounded-lg text-center hover:shadow-neon-green/50 hover:shadow-lg transition-all duration-300">
                                                    Select Plan
                                                </a>
                                            </div>
                                        </div>
                                    {/foreach}
                                </div>
                            {/if}
                        </div>
                        
                    {elseif $step == 2}
                        <!-- Step 2: Review & Customize -->
                        <form action="{$WEB_ROOT}/cart.php" method="post">
                            <div class="bg-dark-surface rounded-xl border border-gray-700 p-6">
                                <h2 class="text-2xl font-bold text-white mb-6">
                                    <i class="fas fa-edit mr-2 text-electric-blue"></i>
                                    Review & Customize
                                </h2>
                                
                                {if $billingcycles}
                                    <div class="mb-6">
                                        <h3 class="text-lg font-semibold text-white mb-3">Billing Cycle</h3>
                                        <div class="grid md:grid-cols-4 gap-3">
                                            {foreach from=$billingcycles item=cycle}
                                                <label class="block">
                                                    <div class="bg-dark-bg rounded-lg border border-gray-600 p-3 hover:border-electric-blue cursor-pointer transition-colors duration-300 {if $cycle.selected}border-electric-blue bg-electric-blue/10{/if}">
                                                        <input type="radio" name="billingcycle" value="{$cycle.cycle}" {if $cycle.selected}checked{/if} class="sr-only">
                                                        <div class="text-center">
                                                            <div class="text-white font-semibold">{$cycle.name}</div>
                                                            <div class="text-electric-blue font-bold">{$cycle.price}</div>
                                                        </div>
                                                    </div>
                                                </label>
                                            {/foreach}
                                        </div>
                                    </div>
                                {/if}
                                
                                {if $addons}
                                    <div class="mb-6">
                                        <h3 class="text-lg font-semibold text-white mb-3">Available Add-ons</h3>
                                        <div class="space-y-3">
                                            {foreach from=$addons item=addon}
                                                <label class="flex items-center justify-between bg-dark-bg rounded-lg border border-gray-600 p-4 hover:border-cyber-purple cursor-pointer transition-colors duration-300">
                                                    <div class="flex items-center">
                                                        <input type="checkbox" name="addons[]" value="{$addon.id}" class="text-cyber-purple bg-dark-bg border-gray-600 rounded focus:ring-cyber-purple mr-3">
                                                        <div>
                                                            <div class="text-white font-semibold">{$addon.name}</div>
                                                            <div class="text-gray-400 text-sm">{$addon.description}</div>
                                                        </div>
                                                    </div>
                                                    <div class="text-cyber-purple font-bold">{$addon.price}</div>
                                                </label>
                                            {/foreach}
                                        </div>
                                    </div>
                                {/if}
                                
                                <div class="text-center">
                                    <button type="submit" class="bg-electric-blue text-white font-semibold py-3 px-8 rounded-lg hover:shadow-electric-blue/50 hover:shadow-lg transition-all duration-300">
                                        Continue to Checkout
                                    </button>
                                </div>
                            </div>
                        </form>
                        
                    {elseif $step == 3}
                        <!-- Step 3: Checkout -->
                        <form action="{$WEB_ROOT}/cart.php" method="post" id="checkout-form">
                            <input type="hidden" name="a" value="checkout">
                            
                            <!-- Payment Method Selection -->
                            <div class="bg-dark-surface rounded-xl border border-gray-700 p-6 mb-6">
                                <h2 class="text-2xl font-bold text-white mb-6">
                                    <i class="fas fa-credit-card mr-2 text-cyber-purple"></i>
                                    Payment Method
                                </h2>
                                
                                <div class="space-y-4">
                                    <!-- Credit Card Payment Option -->
                                    {include file="$template/orderforms/standard_cart/payment/card/select.tpl"}
                                    
                                    <!-- Bank Transfer Payment Option -->
                                    {include file="$template/orderforms/standard_cart/payment/bank/select.tpl"}
                                </div>
                            </div>
                            
                            <!-- Payment Details Form (Dynamic based on selected method) -->
                            <div id="payment-details-container">
                                <!-- Credit Card Form (shown by default) -->
                                <div id="card-payment-form" class="payment-form {if $selectedpaymentmethod != 'creditcard' && $selectedpaymentmethod != 'card'}hidden{/if}">
                                    {include file="$template/orderforms/standard_cart/payment/card/inputs.tpl"}
                                </div>
                                
                                <!-- Bank Transfer Form -->
                                <div id="bank-payment-form" class="payment-form {if $selectedpaymentmethod != 'bank'}hidden{/if}">
                                    {include file="$template/orderforms/standard_cart/payment/bank/inputs.tpl"}
                                </div>
                            </div>
                            
                            <!-- Billing Address -->
                            <div class="mb-6">
                                {include file="$template/orderforms/standard_cart/payment/billing-address.tpl"}
                            </div>
                            
                            <!-- Terms and Conditions -->
                            <div class="bg-dark-surface rounded-xl border border-gray-700 p-6 mb-6">
                                <h3 class="text-lg font-semibold text-white mb-4">
                                    <i class="fas fa-file-contract mr-2 text-electric-blue"></i>
                                    Terms and Conditions
                                </h3>
                                
                                <div class="space-y-4">
                                    <label class="flex items-start space-x-3">
                                        <input type="checkbox" name="agree_terms" value="1" required
                                               class="mt-1 text-neon-green bg-dark-bg border-gray-600 rounded focus:ring-neon-green">
                                        <span class="text-sm text-gray-300">
                                            I have read and agree to the 
                                            <a href="{$WEB_ROOT}/legal.php?page=terms" target="_blank" class="text-neon-green hover:text-electric-blue transition-colors underline">
                                                Terms of Service
                                            </a>
                                            and 
                                            <a href="{$WEB_ROOT}/legal.php?page=privacy" target="_blank" class="text-neon-green hover:text-electric-blue transition-colors underline">
                                                Privacy Policy
                                            </a>
                                            <span class="text-red-400">*</span>
                                        </span>
                                    </label>
                                    
                                    <label class="flex items-start space-x-3">
                                        <input type="checkbox" name="agree_newsletter" value="1"
                                               class="mt-1 text-electric-blue bg-dark-bg border-gray-600 rounded focus:ring-electric-blue">
                                        <span class="text-sm text-gray-300">
                                            I would like to receive promotional emails about new services and offers
                                        </span>
                                    </label>
                                </div>
                            </div>
                            
                            <!-- Submit Button -->
                            <div class="text-center">
                                <button type="submit" class="bg-cyber-purple text-white font-bold py-4 px-12 rounded-lg text-lg hover:shadow-cyber-purple/50 hover:shadow-lg transition-all duration-300 relative overflow-hidden group">
                                    <span class="relative z-10">
                                        <i class="fas fa-lock mr-2"></i>
                                        Complete Order
                                    </span>
                                    <div class="absolute inset-0 bg-gradient-to-r from-cyber-purple to-electric-blue transform scale-x-0 group-hover:scale-x-100 transition-transform duration-300 origin-left"></div>
                                </button>
                            </div>
                        </form>
                        
                    {else}
                        <!-- Step 4: Order Complete -->
                        <div class="bg-dark-surface rounded-xl border border-gray-700 p-6 text-center">
                            <div class="text-6xl text-neon-green mb-4">
                                <i class="fas fa-check-circle"></i>
                            </div>
                            <h2 class="text-2xl font-bold text-white mb-4">Order Complete!</h2>
                            <p class="text-gray-400 mb-6">Thank you for your order. You will receive a confirmation email shortly.</p>
                            <a href="{$WEB_ROOT}/clientarea.php" class="bg-neon-green text-dark-bg font-semibold py-3 px-8 rounded-lg hover:shadow-neon-green/50 hover:shadow-lg transition-all duration-300">
                                Go to Client Area
                            </a>
                        </div>
                    {/if}
                </div>

                <!-- Order Summary Sidebar -->
                <div class="lg:col-span-1">
                    {include file="$template/orderforms/standard_cart/payment/invoice-summary.tpl"}
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Payment Method JavaScript -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Payment method selection handling
    const paymentMethodRadios = document.querySelectorAll('input[name="paymentmethod"]');
    const paymentForms = document.querySelectorAll('.payment-form');
    
    paymentMethodRadios.forEach(radio => {
        radio.addEventListener('change', function() {
            // Hide all payment forms
            paymentForms.forEach(form => {
                form.classList.add('hidden');
            });
            
            // Show the selected payment form
            const selectedMethod = this.value;
            const formId = selectedMethod === 'creditcard' ? 'card-payment-form' : selectedMethod + '-payment-form';
            const selectedForm = document.getElementById(formId);
            
            if (selectedForm) {
                selectedForm.classList.remove('hidden');
            }
            
            // Update the visual selection of payment method options
            document.querySelectorAll('.payment-method-option').forEach(option => {
                const optionBorder = option.querySelector('div');
                optionBorder.classList.remove('border-neon-green', 'bg-neon-green/10', 'border-cyber-purple', 'bg-cyber-purple/10');
                optionBorder.classList.add('border-gray-600');
            });
            
            // Highlight selected option
            const selectedOption = this.closest('.payment-method-option');
            if (selectedOption) {
                const optionBorder = selectedOption.querySelector('div');
                optionBorder.classList.remove('border-gray-600');
                if (selectedMethod === 'creditcard') {
                    optionBorder.classList.add('border-neon-green', 'bg-neon-green/10');
                } else if (selectedMethod === 'bank') {
                    optionBorder.classList.add('border-cyber-purple', 'bg-cyber-purple/10');
                }
            }
        });
    });
    
    // Form validation on submit
    const checkoutForm = document.getElementById('checkout-form');
    if (checkoutForm) {
        checkoutForm.addEventListener('submit', function(e) {
            const selectedPaymentMethod = document.querySelector('input[name="paymentmethod"]:checked');
            
            if (!selectedPaymentMethod) {
                e.preventDefault();
                alert('Please select a payment method');
                return false;
            }
            
            let isValid = true;
            
            // Validate billing address
            if (!validateBillingAddress()) {
                isValid = false;
            }
            
            // Validate payment method specific fields
            if (selectedPaymentMethod.value === 'creditcard') {
                if (!validateCardPayment()) {
                    isValid = false;
                }
            } else if (selectedPaymentMethod.value === 'bank') {
                if (!validateBankPayment()) {
                    isValid = false;
                }
            }
            
            // Check terms agreement
            const termsCheckbox = document.querySelector('input[name="agree_terms"]');
            if (!termsCheckbox || !termsCheckbox.checked) {
                isValid = false;
                alert('You must agree to the Terms of Service to continue');
            }
            
            if (!isValid) {
                e.preventDefault();
                return false;
            }
        });
    }
    
    // Initialize with default payment method
    const defaultPaymentMethod = document.querySelector('input[name="paymentmethod"]:checked');
    if (defaultPaymentMethod) {
        defaultPaymentMethod.dispatchEvent(new Event('change'));
    }
});
</script>

<!-- Include payment validation scripts -->
{include file="$template/orderforms/standard_cart/payment/card/validate.tpl"}
{include file="$template/orderforms/standard_cart/payment/bank/validate.tpl"}

{include file="$template/footer.tpl"}