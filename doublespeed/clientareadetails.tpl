{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                <span class="glow-text">Account Details</span>
            </h1>
            <p class="text-text-light">
                Manage your personal information, contact details, and account preferences.
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
        
        <!-- Account Information Form -->
        <div class="card-dark">
            <h2 class="text-2xl font-semibold text-white mb-6">Personal Information</h2>
            
            <form method="post" action="{$smarty.server.PHP_SELF}" class="space-y-6">
                <input type="hidden" name="action" value="details" />
                
                {if $errormessage}
                    <div class="bg-red-900 border border-red-700 rounded-lg p-4">
                        <div class="flex">
                            <svg class="w-5 h-5 text-red-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                            </svg>
                            <div class="text-red-200 text-sm">{$errormessage}</div>
                        </div>
                    </div>
                {/if}
                
                <!-- Personal Details -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label for="firstname" class="block text-sm font-medium text-white mb-2">
                            First Name *
                        </label>
                        <input type="text" id="firstname" name="firstname" required 
                               class="input-dark w-full" 
                               value="{if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.firstname)}{$clientsdetails.firstname}{/if}">
                    </div>
                    
                    <div>
                        <label for="lastname" class="block text-sm font-medium text-white mb-2">
                            Last Name *
                        </label>
                        <input type="text" id="lastname" name="lastname" required 
                               class="input-dark w-full" 
                               value="{if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.lastname)}{$clientsdetails.lastname}{/if}">
                    </div>
                    
                    <div>
                        <label for="email" class="block text-sm font-medium text-white mb-2">
                            Email Address *
                        </label>
                        <input type="email" id="email" name="email" required 
                               class="input-dark w-full" 
                               value="{if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.email)}{$clientsdetails.email}{/if}">
                    </div>
                    
                    <div>
                        <label for="phonenumber" class="block text-sm font-medium text-white mb-2">
                            Phone Number
                        </label>
                        <input type="tel" id="phonenumber" name="phonenumber" 
                               class="input-dark w-full" 
                               value="{if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.phonenumber)}{$clientsdetails.phonenumber}{/if}">
                    </div>
                </div>
                
                <div>
                    <label for="companyname" class="block text-sm font-medium text-white mb-2">
                        Company Name
                    </label>
                    <input type="text" id="companyname" name="companyname" 
                           class="input-dark w-full" 
                           value="{if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.companyname)}{$clientsdetails.companyname}{/if}">
                </div>
                
                <!-- Address Information -->
                <div class="pt-6 border-t border-gray-700">
                    <h3 class="text-lg font-semibold text-white mb-4">Address Information</h3>
                    
                    <div class="space-y-4">
                        <div>
                            <label for="address1" class="block text-sm font-medium text-white mb-2">
                                Address Line 1 *
                            </label>
                            <input type="text" id="address1" name="address1" required 
                                   class="input-dark w-full" 
                                   value="{if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.address1)}{$clientsdetails.address1}{/if}">
                        </div>
                        
                        <div>
                            <label for="address2" class="block text-sm font-medium text-white mb-2">
                                Address Line 2
                            </label>
                            <input type="text" id="address2" name="address2" 
                                   class="input-dark w-full" 
                                   value="{if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.address2)}{$clientsdetails.address2}{/if}">
                        </div>
                        
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                            <div>
                                <label for="city" class="block text-sm font-medium text-white mb-2">
                                    City *
                                </label>
                                <input type="text" id="city" name="city" required 
                                       class="input-dark w-full" 
                                       value="{if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.city)}{$clientsdetails.city}{/if}">
                            </div>
                            
                            <div>
                                <label for="state" class="block text-sm font-medium text-white mb-2">
                                    State/Province *
                                </label>
                                <input type="text" id="state" name="state" required 
                                       class="input-dark w-full" 
                                       value="{if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.state)}{$clientsdetails.state}{/if}">
                            </div>
                            
                            <div>
                                <label for="postcode" class="block text-sm font-medium text-white mb-2">
                                    Postal Code *
                                </label>
                                <input type="text" id="postcode" name="postcode" required 
                                       class="input-dark w-full" 
                                       value="{if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.postcode)}{$clientsdetails.postcode}{/if}">
                            </div>
                        </div>
                        
                        <div>
                            <label for="country" class="block text-sm font-medium text-white mb-2">
                                Country *
                            </label>
                            <select id="country" name="country" required class="input-dark w-full">
                                <option value="">Select Country</option>
                                {if $countries}
                                    {foreach from=$countries key=code item=country}
                                        <option value="{$code}" {if isset($clientsdetails) && is_array($clientsdetails) && $clientsdetails.country == $code}selected{/if}>
                                            {$country}
                                        </option>
                                    {/foreach}
                                {else}
                                    <option value="US" {if isset($clientsdetails) && is_array($clientsdetails) && $clientsdetails.country == 'US'}selected{/if}>United States</option>
                                    <option value="CA" {if isset($clientsdetails) && is_array($clientsdetails) && $clientsdetails.country == 'CA'}selected{/if}>Canada</option>
                                    <option value="GB" {if isset($clientsdetails) && is_array($clientsdetails) && $clientsdetails.country == 'GB'}selected{/if}>United Kingdom</option>
                                    <option value="AU" {if isset($clientsdetails) && is_array($clientsdetails) && $clientsdetails.country == 'AU'}selected{/if}>Australia</option>
                                {/if}
                            </select>
                        </div>
                    </div>
                </div>
                
                <!-- Preferences -->
                <div class="pt-6 border-t border-gray-700">
                    <h3 class="text-lg font-semibold text-white mb-4">Preferences</h3>
                    
                    <div class="space-y-4">
                        <div>
                            <label for="currency" class="block text-sm font-medium text-white mb-2">
                                Preferred Currency
                            </label>
                            <select id="currency" name="currency" class="input-dark w-full">
                                {if $currencies}
                                    {foreach from=$currencies item=curr}
                                        <option value="{$curr.id}" {if isset($clientsdetails) && is_array($clientsdetails) && $clientsdetails.currency == $curr.id}selected{/if}>
                                            {$curr.code} - {$curr.description}
                                        </option>
                                    {/foreach}
                                {else}
                                    <option value="1">USD - US Dollar</option>
                                    <option value="2">EUR - Euro</option>
                                    <option value="3">GBP - British Pound</option>
                                {/if}
                            </select>
                        </div>
                        
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="flex items-center">
                                    <input type="checkbox" name="marketing" value="1" 
                                           {if isset($clientsdetails) && is_array($clientsdetails) && $clientsdetails.marketing}checked{/if}
                                           class="rounded border-gray-600 bg-dark-surface text-neon-green focus:ring-neon-green">
                                    <span class="ml-3 text-sm text-white">
                                        Receive marketing emails
                                    </span>
                                </label>
                            </div>
                            
                            <div>
                                <label class="flex items-center">
                                    <input type="checkbox" name="emailoptout" value="1" 
                                           {if isset($clientsdetails) && is_array($clientsdetails) && $clientsdetails.emailoptout}checked{/if}
                                           class="rounded border-gray-600 bg-dark-surface text-neon-green focus:ring-neon-green">
                                    <span class="ml-3 text-sm text-white">
                                        Opt out of non-essential emails
                                    </span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Tax Information -->
                {if $taxexempt}
                    <div class="pt-6 border-t border-gray-700">
                        <h3 class="text-lg font-semibold text-white mb-4">Tax Information</h3>
                        
                        <div>
                            <label for="tax_id" class="block text-sm font-medium text-white mb-2">
                                Tax ID / VAT Number
                            </label>
                            <input type="text" id="tax_id" name="tax_id" 
                                   class="input-dark w-full" 
                                   value="{if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.tax_id)}{$clientsdetails.tax_id}{/if}">
                            <p class="text-text-light text-xs mt-1">
                                Enter your tax ID or VAT number if applicable for tax exemption
                            </p>
                        </div>
                    </div>
                {/if}
                
                <!-- Submit Button -->
                <div class="pt-6">
                    <button type="submit" name="submit" class="btn-primary">
                        <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                        </svg>
                        Save Changes
                    </button>
                </div>
            </form>
        </div>
        
        <!-- Account Summary -->
        <div class="card-dark mt-8">
            <h3 class="text-xl font-semibold text-white mb-6">Account Summary</h3>
            
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div class="text-center">
                    <div class="text-2xl font-orbitron font-bold text-neon-green mb-2">
                        {if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.datecreated)}{$clientsdetails.datecreated}{else}N/A{/if}
                    </div>
                    <div class="text-text-light text-sm">Member Since</div>
                </div>
                
                <div class="text-center">
                    <div class="text-2xl font-orbitron font-bold text-electric-blue mb-2">
                        {if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.credit)}{$clientsdetails.credit}{else}$0.00{/if}
                    </div>
                    <div class="text-text-light text-sm">Account Credit</div>
                </div>
                
                <div class="text-center">
                    <div class="text-2xl font-orbitron font-bold text-cyber-purple mb-2">
                        {if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.status)}{$clientsdetails.status}{else}Active{/if}
                    </div>
                    <div class="text-text-light text-sm">Account Status</div>
                </div>
            </div>
        </div>
        
        <!-- Quick Links -->
        <div class="mt-8 grid grid-cols-1 md:grid-cols-3 gap-6">
            <div class="card-dark text-center">
                <svg class="w-12 h-12 text-neon-green mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                </svg>
                <h3 class="text-lg font-semibold text-white mb-2">Security Settings</h3>
                <p class="text-text-light text-sm mb-4">Change password and manage 2FA</p>
                <a href="{$WEB_ROOT}/clientarea.php?action=security" class="btn-outline">Manage Security</a>
            </div>
            
            <div class="card-dark text-center">
                <svg class="w-12 h-12 text-electric-blue mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M4 4a2 2 0 00-2 2v1h16V6a2 2 0 00-2-2H4z"/>
                    <path fill-rule="evenodd" d="M18 9H2v5a2 2 0 002 2h12a2 2 0 002-2V9zM4 13a1 1 0 011-1h1a1 1 0 110 2H5a1 1 0 01-1-1zm5-1a1 1 0 100 2h1a1 1 0 100-2H9z" clip-rule="evenodd"/>
                </svg>
                <h3 class="text-lg font-semibold text-white mb-2">Payment Methods</h3>
                <p class="text-text-light text-sm mb-4">Manage your payment methods</p>
                <a href="{$WEB_ROOT}/clientarea.php?action=paymentmethods" class="btn-outline">Manage Payments</a>
            </div>
            
            <div class="card-dark text-center">
                <svg class="w-12 h-12 text-cyber-purple mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                    <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                </svg>
                <h3 class="text-lg font-semibold text-white mb-2">Email Preferences</h3>
                <p class="text-text-light text-sm mb-4">Manage email notifications</p>
                <a href="{$WEB_ROOT}/clientarea.php?action=emails" class="btn-outline">Email Settings</a>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}