<!-- Billing Address Form -->
<div class="bg-dark-surface rounded-xl border border-gray-700 p-6">
    <h3 class="text-xl font-semibold text-white mb-4">
        <i class="fas fa-map-marker-alt mr-2 text-electric-blue"></i>
        Billing Address
    </h3>
    
    <div class="space-y-4">
        <!-- First Name and Last Name -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
                <label for="billing_first_name" class="block text-sm font-medium text-gray-300 mb-2">
                    First Name <span class="text-red-400">*</span>
                </label>
                <input type="text" id="billing_first_name" name="billing_first_name" value="{$billing_first_name|default:$clientsdetails.firstname|default:''}"
                       class="w-full bg-dark-bg border border-gray-600 rounded-lg px-4 py-3 text-white placeholder-gray-400 focus:border-electric-blue focus:ring-1 focus:ring-electric-blue transition-colors duration-300"
                       placeholder="Enter first name" required>
            </div>
            <div>
                <label for="billing_last_name" class="block text-sm font-medium text-gray-300 mb-2">
                    Last Name <span class="text-red-400">*</span>
                </label>
                <input type="text" id="billing_last_name" name="billing_last_name" value="{$billing_last_name|default:$clientsdetails.lastname|default:''}"
                       class="w-full bg-dark-bg border border-gray-600 rounded-lg px-4 py-3 text-white placeholder-gray-400 focus:border-electric-blue focus:ring-1 focus:ring-electric-blue transition-colors duration-300"
                       placeholder="Enter last name" required>
            </div>
        </div>
        
        <!-- Company Name -->
        <div>
            <label for="billing_company" class="block text-sm font-medium text-gray-300 mb-2">
                Company Name
            </label>
            <input type="text" id="billing_company" name="billing_company" value="{$billing_company|default:$clientsdetails.companyname|default:''}"
                   class="w-full bg-dark-bg border border-gray-600 rounded-lg px-4 py-3 text-white placeholder-gray-400 focus:border-electric-blue focus:ring-1 focus:ring-electric-blue transition-colors duration-300"
                   placeholder="Enter company name (optional)">
        </div>
        
        <!-- Street Address -->
        <div>
            <label for="billing_address1" class="block text-sm font-medium text-gray-300 mb-2">
                Street Address <span class="text-red-400">*</span>
            </label>
            <input type="text" id="billing_address1" name="billing_address1" value="{$billing_address1|default:$clientsdetails.address1|default:''}"
                   class="w-full bg-dark-bg border border-gray-600 rounded-lg px-4 py-3 text-white placeholder-gray-400 focus:border-electric-blue focus:ring-1 focus:ring-electric-blue transition-colors duration-300"
                   placeholder="Enter street address" required>
        </div>
        
        <!-- Address Line 2 -->
        <div>
            <label for="billing_address2" class="block text-sm font-medium text-gray-300 mb-2">
                Address Line 2
            </label>
            <input type="text" id="billing_address2" name="billing_address2" value="{$billing_address2|default:$clientsdetails.address2|default:''}"
                   class="w-full bg-dark-bg border border-gray-600 rounded-lg px-4 py-3 text-white placeholder-gray-400 focus:border-electric-blue focus:ring-1 focus:ring-electric-blue transition-colors duration-300"
                   placeholder="Apartment, suite, etc. (optional)">
        </div>
        
        <!-- City, State, ZIP -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div>
                <label for="billing_city" class="block text-sm font-medium text-gray-300 mb-2">
                    City <span class="text-red-400">*</span>
                </label>
                <input type="text" id="billing_city" name="billing_city" value="{$billing_city|default:$clientsdetails.city|default:''}"
                       class="w-full bg-dark-bg border border-gray-600 rounded-lg px-4 py-3 text-white placeholder-gray-400 focus:border-electric-blue focus:ring-1 focus:ring-electric-blue transition-colors duration-300"
                       placeholder="Enter city" required>
            </div>
            <div>
                <label for="billing_state" class="block text-sm font-medium text-gray-300 mb-2">
                    State/Province <span class="text-red-400">*</span>
                </label>
                <input type="text" id="billing_state" name="billing_state" value="{$billing_state|default:$clientsdetails.state|default:''}"
                       class="w-full bg-dark-bg border border-gray-600 rounded-lg px-4 py-3 text-white placeholder-gray-400 focus:border-electric-blue focus:ring-1 focus:ring-electric-blue transition-colors duration-300"
                       placeholder="Enter state/province" required>
            </div>
            <div>
                <label for="billing_postcode" class="block text-sm font-medium text-gray-300 mb-2">
                    ZIP/Postal Code <span class="text-red-400">*</span>
                </label>
                <input type="text" id="billing_postcode" name="billing_postcode" value="{$billing_postcode|default:$clientsdetails.postcode|default:''}"
                       class="w-full bg-dark-bg border border-gray-600 rounded-lg px-4 py-3 text-white placeholder-gray-400 focus:border-electric-blue focus:ring-1 focus:ring-electric-blue transition-colors duration-300"
                       placeholder="Enter ZIP/postal code" required>
            </div>
        </div>
        
        <!-- Country -->
        <div>
            <label for="billing_country" class="block text-sm font-medium text-gray-300 mb-2">
                Country <span class="text-red-400">*</span>
            </label>
            <select id="billing_country" name="billing_country" 
                    class="w-full bg-dark-bg border border-gray-600 rounded-lg px-4 py-3 text-white focus:border-electric-blue focus:ring-1 focus:ring-electric-blue transition-colors duration-300" required>
                <option value="">Select Country</option>
                {foreach from=$countries item=country}
                    <option value="{$country.code}" {if $country.code == ($billing_country|default:$clientsdetails.country|default:'')}selected{/if}>
                        {$country.name}
                    </option>
                {/foreach}
            </select>
        </div>
        
        <!-- Phone Number -->
        <div>
            <label for="billing_phone" class="block text-sm font-medium text-gray-300 mb-2">
                Phone Number
            </label>
            <input type="tel" id="billing_phone" name="billing_phone" value="{$billing_phone|default:$clientsdetails.phonenumber|default:''}"
                   class="w-full bg-dark-bg border border-gray-600 rounded-lg px-4 py-3 text-white placeholder-gray-400 focus:border-electric-blue focus:ring-1 focus:ring-electric-blue transition-colors duration-300"
                   placeholder="Enter phone number">
        </div>
        
        <!-- Email -->
        <div>
            <label for="billing_email" class="block text-sm font-medium text-gray-300 mb-2">
                Email Address <span class="text-red-400">*</span>
            </label>
            <input type="email" id="billing_email" name="billing_email" value="{$billing_email|default:$clientsdetails.email|default:''}"
                   class="w-full bg-dark-bg border border-gray-600 rounded-lg px-4 py-3 text-white placeholder-gray-400 focus:border-electric-blue focus:ring-1 focus:ring-electric-blue transition-colors duration-300"
                   placeholder="Enter email address" required>
        </div>
    </div>
    
    <!-- Use as Default Option -->
    <div class="mt-6 pt-4 border-t border-gray-600">
        <label class="flex items-center space-x-3">
            <input type="checkbox" name="use_as_default_billing" value="1"
                   class="text-electric-blue bg-dark-bg border-gray-600 rounded focus:ring-electric-blue">
            <span class="text-sm text-gray-300">
                Save this as my default billing address
            </span>
        </label>
    </div>
    
    <!-- Same as Shipping Address Option -->
    {if $shipping_address_required}
        <div class="mt-3">
            <label class="flex items-center space-x-3">
                <input type="checkbox" name="same_as_shipping" value="1" id="same_as_shipping"
                       class="text-electric-blue bg-dark-bg border-gray-600 rounded focus:ring-electric-blue">
                <span class="text-sm text-gray-300">
                    Billing address is the same as shipping address
                </span>
            </label>
        </div>
    {/if}
</div>

<script>
// Auto-fill billing address if "same as shipping" is checked
document.addEventListener('DOMContentLoaded', function() {
    const sameAsShippingCheckbox = document.getElementById('same_as_shipping');
    
    if (sameAsShippingCheckbox) {
        sameAsShippingCheckbox.addEventListener('change', function() {
            if (this.checked) {
                copyShippingToBilling();
            }
        });
    }
});

function copyShippingToBilling() {
    const shippingFields = [
        'first_name', 'last_name', 'company', 'address1', 'address2',
        'city', 'state', 'postcode', 'country', 'phone', 'email'
    ];
    
    shippingFields.forEach(field => {
        const shippingElement = document.getElementById('shipping_' + field);
        const billingElement = document.getElementById('billing_' + field);
        
        if (shippingElement && billingElement && shippingElement.value) {
            billingElement.value = shippingElement.value;
        }
    });
}

function validateBillingAddress() {
    let isValid = true;
    const errors = [];
    
    const requiredFields = [
        { id: 'billing_first_name', name: 'First name' },
        { id: 'billing_last_name', name: 'Last name' },
        { id: 'billing_address1', name: 'Street address' },
        { id: 'billing_city', name: 'City' },
        { id: 'billing_state', name: 'State/Province' },
        { id: 'billing_postcode', name: 'ZIP/Postal code' },
        { id: 'billing_country', name: 'Country' },
        { id: 'billing_email', name: 'Email address' }
    ];
    
    requiredFields.forEach(field => {
        const element = document.getElementById(field.id);
        if (!element || !element.value.trim()) {
            errors.push(field.name + ' is required');
            if (element) {
                showValidationError(element, field.name + ' is required');
            }
            isValid = false;
        }
    });
    
    // Validate email format
    const emailElement = document.getElementById('billing_email');
    if (emailElement && emailElement.value.trim()) {
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(emailElement.value.trim())) {
            showValidationError(emailElement, 'Please enter a valid email address');
            errors.push('Please enter a valid email address');
            isValid = false;
        }
    }
    
    return isValid;
}
</script>