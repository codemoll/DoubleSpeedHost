<!-- Invoice Summary -->
<div class="bg-dark-surface rounded-xl border border-gray-700 p-6 sticky top-8">
    <h3 class="text-xl font-semibold text-white mb-4">
        <i class="fas fa-receipt mr-2 text-neon-green"></i>
        Order Summary
    </h3>
    
    {if $cartitems}
        <!-- Cart Items -->
        <div class="space-y-4 mb-6">
            {foreach from=$cartitems item=item}
                <div class="border-b border-gray-600 pb-4 last:border-b-0 last:pb-0">
                    <!-- Product Name -->
                    <div class="flex justify-between items-start mb-2">
                        <div class="flex-1 pr-4">
                            <h4 class="text-white font-semibold">{$item.name}</h4>
                            {if $item.productinfo}
                                <p class="text-gray-400 text-sm mt-1">{$item.productinfo}</p>
                            {/if}
                            {if $item.domain}
                                <p class="text-electric-blue text-sm mt-1">
                                    <i class="fas fa-globe mr-1"></i>
                                    {$item.domain}
                                </p>
                            {/if}
                        </div>
                        <div class="text-right">
                            <div class="text-neon-green font-bold">{$item.price}</div>
                            {if $item.billingcycle && $item.billingcycle != 'onetime'}
                                <div class="text-gray-400 text-xs">/{$item.billingcycle}</div>
                            {/if}
                        </div>
                    </div>
                    
                    <!-- Product Configuration -->
                    {if $item.configoptions}
                        <div class="space-y-1 mb-2">
                            {foreach from=$item.configoptions item=configoption}
                                <div class="flex justify-between text-sm">
                                    <span class="text-gray-400">{$configoption.name}:</span>
                                    <span class="text-gray-300">{$configoption.option}</span>
                                </div>
                            {/foreach}
                        </div>
                    {/if}
                    
                    <!-- Add-ons -->
                    {if $item.addons}
                        <div class="space-y-1 mb-2">
                            {foreach from=$item.addons item=addon}
                                <div class="flex justify-between text-sm">
                                    <span class="text-gray-400">
                                        <i class="fas fa-plus mr-1"></i>
                                        {$addon.name}
                                    </span>
                                    <span class="text-cyber-purple font-medium">{$addon.price}</span>
                                </div>
                            {/foreach}
                        </div>
                    {/if}
                    
                    <!-- Discount Applied -->
                    {if $item.discount}
                        <div class="flex justify-between text-sm">
                            <span class="text-green-400">
                                <i class="fas fa-tag mr-1"></i>
                                {$item.discount.description}
                            </span>
                            <span class="text-green-400 font-medium">-{$item.discount.amount}</span>
                        </div>
                    {/if}
                </div>
            {/foreach}
        </div>
        
        <!-- Promo Code Section -->
        {if !$promoapplied}
            <div class="mb-6 p-4 bg-dark-bg rounded-lg border border-gray-600">
                <h5 class="text-sm font-semibold text-white mb-2">
                    <i class="fas fa-tag mr-1"></i>
                    Promotional Code
                </h5>
                <div class="flex space-x-2">
                    <input type="text" name="promocode" id="promocode" value="{$promocode|default:''}"
                           class="flex-1 bg-dark-surface border border-gray-600 rounded px-3 py-2 text-white text-sm placeholder-gray-400 focus:border-neon-green focus:ring-1 focus:ring-neon-green transition-colors duration-300"
                           placeholder="Enter promo code">
                    <button type="button" onclick="applyPromoCode()" 
                            class="bg-neon-green text-dark-bg px-4 py-2 rounded font-semibold text-sm hover:shadow-neon-green/50 hover:shadow-lg transition-all duration-300">
                        Apply
                    </button>
                </div>
            </div>
        {else}
            <div class="mb-6 p-4 bg-green-900/20 rounded-lg border border-green-700">
                <div class="flex items-center justify-between">
                    <div>
                        <h5 class="text-sm font-semibold text-green-400">
                            <i class="fas fa-check-circle mr-1"></i>
                            Promo Code Applied
                        </h5>
                        <p class="text-green-300 text-xs">{$promoname}</p>
                    </div>
                    <button type="button" onclick="removePromoCode()" 
                            class="text-red-400 hover:text-red-300 transition-colors">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
            </div>
        {/if}
        
        <!-- Summary Calculations -->
        <div class="space-y-3 mb-6">
            <!-- Subtotal -->
            <div class="flex justify-between items-center text-sm">
                <span class="text-gray-400">Subtotal:</span>
                <span class="text-white font-medium">{$subtotal}</span>
            </div>
            
            <!-- Discount -->
            {if $discount > 0}
                <div class="flex justify-between items-center text-sm">
                    <span class="text-green-400">Discount:</span>
                    <span class="text-green-400 font-medium">-{$discount}</span>
                </div>
            {/if}
            
            <!-- Tax -->
            {if $tax > 0}
                <div class="flex justify-between items-center text-sm">
                    <span class="text-gray-400">Tax ({$taxname}):</span>
                    <span class="text-white font-medium">{$tax}</span>
                </div>
            {/if}
            
            <!-- Setup Fees -->
            {if $setupfees > 0}
                <div class="flex justify-between items-center text-sm">
                    <span class="text-gray-400">Setup Fees:</span>
                    <span class="text-white font-medium">{$setupfees}</span>
                </div>
            {/if}
            
            <!-- Recurring Amount (if applicable) -->
            {if $recurringamount && $recurringamount != $total}
                <div class="flex justify-between items-center text-sm border-t border-gray-600 pt-3">
                    <span class="text-gray-400">First Payment:</span>
                    <span class="text-electric-blue font-semibold">{$total}</span>
                </div>
                <div class="flex justify-between items-center text-sm">
                    <span class="text-gray-400">Recurring:</span>
                    <span class="text-white font-medium">{$recurringamount}</span>
                </div>
            {/if}
        </div>
        
        <!-- Total -->
        <div class="border-t border-gray-500 pt-4">
            <div class="flex justify-between items-center">
                <span class="text-lg font-bold text-white">Total:</span>
                <div class="text-right">
                    <span class="text-2xl font-bold text-neon-green">{$total}</span>
                    {if $billingcycle && $billingcycle != 'onetime'}
                        <div class="text-gray-400 text-sm">
                            {if $billingcycle == 'monthly'}per month{/if}
                            {if $billingcycle == 'quarterly'}per quarter{/if}
                            {if $billingcycle == 'semiannually'}every 6 months{/if}
                            {if $billingcycle == 'annually'}per year{/if}
                            {if $billingcycle == 'biennially'}every 2 years{/if}
                            {if $billingcycle == 'triennially'}every 3 years{/if}
                        </div>
                    {/if}
                </div>
            </div>
        </div>
        
        <!-- Payment Schedule -->
        {if $recurringamount && $billingcycle != 'onetime'}
            <div class="mt-4 p-3 bg-dark-bg rounded-lg border border-gray-600">
                <h5 class="text-sm font-semibold text-white mb-2">
                    <i class="fas fa-calendar-alt mr-1"></i>
                    Payment Schedule
                </h5>
                <div class="text-xs text-gray-400">
                    Today: <span class="text-white">{$total}</span><br>
                    Next billing: <span class="text-white">{$recurringamount}</span> on <span class="text-electric-blue">{$nextbillingdate}</span>
                </div>
            </div>
        {/if}
        
        <!-- Security Badge -->
        <div class="mt-6 pt-4 border-t border-gray-600">
            <div class="flex items-center justify-center space-x-3 text-xs text-gray-400">
                <div class="flex items-center">
                    <i class="fas fa-shield-alt text-neon-green mr-1"></i>
                    SSL Secured
                </div>
                <div class="flex items-center">
                    <i class="fas fa-lock text-neon-green mr-1"></i>
                    Encrypted
                </div>
                <div class="flex items-center">
                    <i class="fas fa-certificate text-neon-green mr-1"></i>
                    PCI Compliant
                </div>
            </div>
        </div>
        
    {else}
        <!-- Empty Cart -->
        <div class="text-center py-8">
            <div class="text-6xl text-gray-600 mb-4">
                <i class="fas fa-shopping-cart"></i>
            </div>
            <h4 class="text-lg font-semibold text-gray-400 mb-2">Your cart is empty</h4>
            <p class="text-gray-500 text-sm mb-6">Add some services to get started</p>
            <a href="{$WEB_ROOT}/cart.php" class="bg-neon-green text-dark-bg font-semibold py-2 px-6 rounded-lg hover:shadow-neon-green/50 hover:shadow-lg transition-all duration-300">
                Browse Services
            </a>
        </div>
    {/if}
</div>

<script>
function applyPromoCode() {
    const promoCode = document.getElementById('promocode').value.trim();
    
    if (!promoCode) {
        showNotification('Please enter a promotional code', 'error');
        return;
    }
    
    // Show loading state
    const button = event.target;
    const originalText = button.textContent;
    button.textContent = 'Applying...';
    button.disabled = true;
    
    // Submit form with promo code
    const form = document.createElement('form');
    form.method = 'POST';
    form.action = window.location.href;
    
    const promoInput = document.createElement('input');
    promoInput.type = 'hidden';
    promoInput.name = 'promocode';
    promoInput.value = promoCode;
    
    const actionInput = document.createElement('input');
    actionInput.type = 'hidden';
    actionInput.name = 'a';
    actionInput.value = 'applypromocde';
    
    form.appendChild(promoInput);
    form.appendChild(actionInput);
    document.body.appendChild(form);
    form.submit();
}

function removePromoCode() {
    if (confirm('Are you sure you want to remove the promotional code?')) {
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = window.location.href;
        
        const actionInput = document.createElement('input');
        actionInput.type = 'hidden';
        actionInput.name = 'a';
        actionInput.value = 'removepromo';
        
        form.appendChild(actionInput);
        document.body.appendChild(form);
        form.submit();
    }
}

function showNotification(message, type = 'info') {
    // Create notification element
    const notification = document.createElement('div');
    notification.className = `fixed top-4 right-4 z-50 p-4 rounded-lg border max-w-sm transform translate-x-full opacity-0 transition-all duration-300`;
    
    if (type === 'error') {
        notification.classList.add('bg-red-900', 'border-red-700', 'text-red-200');
    } else if (type === 'success') {
        notification.classList.add('bg-green-900', 'border-green-700', 'text-green-200');
    } else {
        notification.classList.add('bg-dark-surface', 'border-gray-600', 'text-gray-200');
    }
    
    notification.innerHTML = `
        <div class="flex items-center justify-between">
            <span class="text-sm">${message}</span>
            <button onclick="this.parentElement.parentElement.remove()" class="ml-3 text-gray-400 hover:text-white">
                <i class="fas fa-times"></i>
            </button>
        </div>
    `;
    
    document.body.appendChild(notification);
    
    // Animate in
    setTimeout(() => {
        notification.classList.remove('translate-x-full', 'opacity-0');
    }, 100);
    
    // Auto remove after 5 seconds
    setTimeout(() => {
        if (notification.parentElement) {
            notification.classList.add('translate-x-full', 'opacity-0');
            setTimeout(() => {
                if (notification.parentElement) {
                    notification.remove();
                }
            }, 300);
        }
    }, 5000);
}
</script>