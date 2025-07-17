{include file="$template/header.tpl"}

<div class="container-fluid" style="min-height: 100vh; background-color: var(--ds-dark-bg); padding: 80px 0 40px;">
    <div class="container">
        <!-- Header -->
        <div class="text-center mb-4">
            <h1 class="ds-hero-title">Checkout</h1>
            <p class="ds-hero-subtitle">Complete your order and start your hosting journey</p>
        </div>

        {if $errormessage}
            <div class="alert alert-danger mb-4">
                <div class="d-flex">
                    <svg class="me-3 mt-1" style="width: 20px; height: 20px; color: #dc3545;" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                    </svg>
                    <div style="color: #f87171; font-size: 0.875rem;">
                        {$errormessage}
                    </div>
                </div>
            </div>
        {/if}

        <form method="post" action="{$smarty.server.PHP_SELF}">
            <div class="row">
                <!-- Main Content -->
                <div class="col-lg-8">
                    
                    <!-- Account Information -->
                    {if !$loggedin}
                        <div class="panel panel-default ds-glow">
                            <div class="panel-heading">
                                <h3 class="panel-title">Account Information</h3>
                            </div>
                            <div class="panel-body">
                                
                                <div class="form-group mb-4">
                                    <div class="d-flex">
                                        <div class="form-check me-4">
                                            <input type="radio" name="account" value="existing" class="form-check-input" onchange="toggleAccountFields('existing')">
                                            <label class="form-check-label text-white">I have an existing account</label>
                                        </div>
                                        <div class="form-check">
                                            <input type="radio" name="account" value="new" checked class="form-check-input" onchange="toggleAccountFields('new')">
                                            <label class="form-check-label text-white">Create new account</label>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Existing Account -->
                                <div id="existing-account" style="display: none;">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">Email Address</label>
                                                <input type="email" name="loginemail" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">Password</label>
                                                <input type="password" name="loginpassword" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- New Account -->
                                <div id="new-account">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">First Name <span class="text-danger">*</span></label>
                                                <input type="text" name="firstname" value="{if isset($clientsdetails.firstname)}{$clientsdetails.firstname}{/if}" required class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">Last Name <span class="text-danger">*</span></label>
                                                <input type="text" name="lastname" value="{if isset($clientsdetails.lastname)}{$clientsdetails.lastname}{/if}" required class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">Email Address <span class="text-danger">*</span></label>
                                                <input type="email" name="email" value="{if isset($clientsdetails.email)}{$clientsdetails.email}{/if}" required class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">Phone Number</label>
                                                <input type="tel" name="phonenumber" value="{if isset($clientsdetails.phonenumber)}{$clientsdetails.phonenumber}{/if}" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">Password <span class="text-danger">*</span></label>
                                                <input type="password" name="password" required class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">Confirm Password <span class="text-danger">*</span></label>
                                                <input type="password" name="password2" required class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/if}

                    <!-- Billing Information -->
                    <div class="card-dark">
                        <h2 class="text-xl font-orbitron font-semibold text-white mb-6">Billing Information</h2>
                        
                        <div class="space-y-4">
                            <div>
                                <label class="block text-sm font-medium text-text-light mb-2">Company Name</label>
                                <input type="text" name="companyname" value="{if isset($clientsdetails.companyname)}{$clientsdetails.companyname}{/if}" class="input-dark">
                            </div>
                            
                            <div>
                                <label class="block text-sm font-medium text-text-light mb-2">Address <span class="text-red-400">*</span></label>
                                <input type="text" name="address1" value="{if isset($clientsdetails.address1)}{$clientsdetails.address1}{/if}" required class="input-dark">
                            </div>
                            
                            <div>
                                <label class="block text-sm font-medium text-text-light mb-2">Address 2</label>
                                <input type="text" name="address2" value="{if isset($clientsdetails.address2)}{$clientsdetails.address2}{/if}" class="input-dark">
                            </div>
                            
                            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                                <div>
                                    <label class="block text-sm font-medium text-text-light mb-2">City <span class="text-red-400">*</span></label>
                                    <input type="text" name="city" value="{if isset($clientsdetails.city)}{$clientsdetails.city}{/if}" required class="input-dark">
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-text-light mb-2">State/Province <span class="text-red-400">*</span></label>
                                    <input type="text" name="state" value="{if isset($clientsdetails.state)}{$clientsdetails.state}{/if}" required class="input-dark">
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-text-light mb-2">ZIP/Postal Code <span class="text-red-400">*</span></label>
                                    <input type="text" name="postcode" value="{if isset($clientsdetails.postcode)}{$clientsdetails.postcode}{/if}" required class="input-dark">
                                </div>
                            </div>
                            
                            <div>
                                <label class="block text-sm font-medium text-text-light mb-2">Country <span class="text-red-400">*</span></label>
                                <select name="country" required class="select-dark">
                                    <option value="">Choose Country...</option>
                                    {if $countries}
                                        {foreach from=$countries item=country key=code}
                                            <option value="{$code}" {if isset($clientsdetails.country) && $clientsdetails.country eq $code}selected{/if}>{$country}</option>
                                        {/foreach}
                                    {else}
                                        <option value="US">United States</option>
                                        <option value="CA">Canada</option>
                                        <option value="GB">United Kingdom</option>
                                        <option value="AU">Australia</option>
                                    {/if}
                                </select>
                            </div>
                        </div>
                    </div>

                    <!-- Payment Method -->
                    <div class="card-dark">
                        <h2 class="text-xl font-orbitron font-semibold text-white mb-6">Payment Method</h2>
                        
                        {if $gateways}
                            <div class="space-y-4">
                                {foreach from=$gateways item=gateway key=key}
                                    <label class="block cursor-pointer">
                                        <div class="border border-gray-700 rounded-lg p-4 hover:border-neon-green transition-colors duration-300">
                                            <div class="flex items-center">
                                                <input type="radio" name="paymentmethod" value="{$key}" {if $gateway.selected}checked{/if} class="mr-4">
                                                <div class="flex-1">
                                                    <div class="text-white font-medium">{$gateway.name}</div>
                                                    {if $gateway.description}
                                                        <div class="text-text-light text-sm mt-1">{$gateway.description}</div>
                                                    {/if}
                                                </div>
                                                {if $gateway.logo}
                                                    <img src="{$gateway.logo}" alt="{$gateway.name}" class="h-8">
                                                {/if}
                                            </div>
                                        </div>
                                    </label>
                                {/foreach}
                            </div>
                        {else}
                            <div class="space-y-4">
                                <label class="block cursor-pointer">
                                    <div class="border border-gray-700 rounded-lg p-4 hover:border-neon-green transition-colors duration-300">
                                        <div class="flex items-center">
                                            <input type="radio" name="paymentmethod" value="paypal" checked class="mr-4">
                                            <div class="flex-1">
                                                <div class="text-white font-medium">PayPal</div>
                                                <div class="text-text-light text-sm mt-1">Pay securely with your PayPal account</div>
                                            </div>
                                        </div>
                                    </div>
                                </label>
                                
                                <label class="block cursor-pointer">
                                    <div class="border border-gray-700 rounded-lg p-4 hover:border-neon-green transition-colors duration-300">
                                        <div class="flex items-center">
                                            <input type="radio" name="paymentmethod" value="stripe" class="mr-4">
                                            <div class="flex-1">
                                                <div class="text-white font-medium">Credit Card</div>
                                                <div class="text-text-light text-sm mt-1">Visa, MasterCard, American Express</div>
                                            </div>
                                        </div>
                                    </div>
                                </label>
                            </div>
                        {/if}
                    </div>

                    <!-- Terms & Conditions -->
                    <div class="card-dark">
                        <div class="flex items-start space-x-3">
                            <input type="checkbox" name="accepttos" id="accepttos" required class="mt-1">
                            <label for="accepttos" class="text-text-light text-sm">
                                I have read and agree to the 
                                <a href="{$WEB_ROOT}/legal.php?page=terms" target="_blank" class="text-neon-green hover:text-electric-blue">Terms of Service</a>
                                and 
                                <a href="{$WEB_ROOT}/legal.php?page=privacy" target="_blank" class="text-neon-green hover:text-electric-blue">Privacy Policy</a>
                            </label>
                        </div>
                    </div>
                </div>

                <!-- Order Summary -->
                <div class="lg:col-span-1">
                    <div class="card-dark sticky top-8">
                        <h3 class="text-xl font-orbitron font-semibold text-white mb-6">Order Summary</h3>
                        
                        {if $products}
                            <div class="space-y-4 mb-6">
                                {foreach from=$products item=product}
                                    <div class="border-b border-gray-700 pb-4">
                                        <h4 class="text-white font-medium">{$product.product}</h4>
                                        {if $product.domain}
                                            <p class="text-text-light text-sm">{$product.domain}</p>
                                        {/if}
                                        <div class="flex justify-between mt-2">
                                            <span class="text-text-light text-sm">{$product.billingcycle}</span>
                                            <span class="text-white">{$product.price}</span>
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                        {/if}
                        
                        <div class="space-y-3 mb-6">
                            <div class="flex justify-between">
                                <span class="text-text-light">Subtotal:</span>
                                <span class="text-white">{if $subtotal}{$subtotal}{else}$0.00{/if}</span>
                            </div>
                            
                            {if $setupfees}
                                <div class="flex justify-between">
                                    <span class="text-text-light">Setup Fees:</span>
                                    <span class="text-white">{$setupfees}</span>
                                </div>
                            {/if}
                            
                            {if $tax}
                                <div class="flex justify-between">
                                    <span class="text-text-light">Tax:</span>
                                    <span class="text-white">{$tax}</span>
                                </div>
                            {/if}
                            
                            {if $discount}
                                <div class="flex justify-between text-green-400">
                                    <span>Discount:</span>
                                    <span>-{$discount}</span>
                                </div>
                            {/if}
                        </div>
                        
                        <div class="border-t border-gray-700 pt-4 mb-6">
                            <div class="flex justify-between text-lg">
                                <span class="text-white font-semibold">Total:</span>
                                <span class="text-neon-green font-bold">{if $total}{$total}{else}$0.00{/if}</span>
                            </div>
                            {if $recurring}
                                <div class="text-text-light text-sm mt-1">
                                    Then {$recurring} recurring
                                </div>
                            {/if}
                        </div>
                        
                        <button type="submit" name="submitorder" class="btn-primary w-full text-lg bg-gradient-to-r from-neon-green to-electric-blue">
                            Complete Order
                        </button>
                        
                        <a href="{$WEB_ROOT}/cart.php" class="btn-outline w-full text-center mt-3">
                            ← Back to Cart
                        </a>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
function toggleAccountFields(type) {
    const existingAccount = document.getElementById('existing-account');
    const newAccount = document.getElementById('new-account');
    
    if (type === 'existing') {
        existingAccount.style.display = 'block';
        newAccount.style.display = 'none';
    } else {
        existingAccount.style.display = 'none';
        newAccount.style.display = 'block';
    }
}
</script>

{include file="$template/footer.tpl"}