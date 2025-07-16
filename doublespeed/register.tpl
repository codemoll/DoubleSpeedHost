{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-2xl mx-auto">
        <div class="text-center mb-8">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M8 9a3 3 0 100-6 3 3 0 000 6zM8 11a6 6 0 016 6H2a6 6 0 016-6zM16 7a1 1 0 10-2 0v1h-1a1 1 0 100 2h1v1a1 1 0 102 0v-1h1a1 1 0 100-2h-1V7z"/>
                </svg>
            </div>
            <h2 class="text-3xl font-orbitron font-bold text-white">
                Create your account
            </h2>
            <p class="mt-2 text-sm text-text-light">
                Already have an account?
                <a href="{$WEB_ROOT}/clientarea.php" class="font-medium text-neon-green hover:text-electric-blue transition-colors duration-300">
                    Sign in here
                </a>
            </p>
        </div>
        
        <div class="card-dark">
            <form method="post" action="{$WEB_ROOT}/register.php">
                {if $token}
                    <input type="hidden" name="token" value="{$token}">
                {/if}
                {if $errormessage}
                    <div class="bg-red-900 border border-red-700 rounded-lg p-4 mb-6">
                        <div class="flex">
                            <svg class="w-5 h-5 text-red-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                            </svg>
                            <div class="text-red-200 text-sm">
                                {$errormessage}
                            </div>
                        </div>
                    </div>
                {/if}
                
                <!-- Personal Information -->
                <div class="mb-8">
                    <h3 class="text-lg font-orbitron font-semibold text-white mb-4 flex items-center">
                        <svg class="w-5 h-5 text-neon-green mr-2" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"/>
                        </svg>
                        Personal Information
                    </h3>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label for="firstname" class="block text-sm font-medium text-text-light mb-2">
                                First Name <span class="text-red-400">*</span>
                            </label>
                            <input id="firstname" name="firstname" type="text" required 
                                   value="{if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.firstname)}{$clientsdetails.firstname}{/if}"
                                   class="input-dark w-full focus:shadow-glow-green" 
                                   placeholder="Enter your first name">
                        </div>
                        
                        <div>
                            <label for="lastname" class="block text-sm font-medium text-text-light mb-2">
                                Last Name <span class="text-red-400">*</span>
                            </label>
                            <input id="lastname" name="lastname" type="text" required 
                                   value="{if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.lastname)}{$clientsdetails.lastname}{/if}"
                                   class="input-dark w-full focus:shadow-glow-green" 
                                   placeholder="Enter your last name">
                        </div>
                        
                        <div>
                            <label for="email" class="block text-sm font-medium text-text-light mb-2">
                                Email Address <span class="text-red-400">*</span>
                            </label>
                            <input id="email" name="email" type="email" required 
                                   value="{if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.email)}{$clientsdetails.email}{/if}"
                                   class="input-dark w-full focus:shadow-glow-green" 
                                   placeholder="Enter your email address">
                        </div>
                        
                        <div>
                            <label for="phonenumber" class="block text-sm font-medium text-text-light mb-2">
                                Phone Number
                            </label>
                            <input id="phonenumber" name="phonenumber" type="tel" 
                                   value="{if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.phonenumber)}{$clientsdetails.phonenumber}{/if}"
                                   class="input-dark w-full focus:shadow-glow-green" 
                                   placeholder="Enter your phone number">
                        </div>
                    </div>
                </div>
                
                <!-- Address Information -->
                <div class="mb-8">
                    <h3 class="text-lg font-orbitron font-semibold text-white mb-4 flex items-center">
                        <svg class="w-5 h-5 text-electric-blue mr-2" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clip-rule="evenodd"/>
                        </svg>
                        Address Information
                    </h3>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div class="md:col-span-2">
                            <label for="address1" class="block text-sm font-medium text-text-light mb-2">
                                Address <span class="text-red-400">*</span>
                            </label>
                            <input id="address1" name="address1" type="text" required 
                                   value="{if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.address1)}{$clientsdetails.address1}{/if}"
                                   class="input-dark w-full focus:shadow-glow-green" 
                                   placeholder="Enter your street address">
                        </div>
                        
                        <div>
                            <label for="city" class="block text-sm font-medium text-text-light mb-2">
                                City <span class="text-red-400">*</span>
                            </label>
                            <input id="city" name="city" type="text" required 
                                   value="{if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.city)}{$clientsdetails.city}{/if}"
                                   class="input-dark w-full focus:shadow-glow-green" 
                                   placeholder="Enter your city">
                        </div>
                        
                        <div>
                            <label for="state" class="block text-sm font-medium text-text-light mb-2">
                                State/Province
                            </label>
                            <input id="state" name="state" type="text" 
                                   value="{if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.state)}{$clientsdetails.state}{/if}"
                                   class="input-dark w-full focus:shadow-glow-green" 
                                   placeholder="Enter your state/province">
                        </div>
                        
                        <div>
                            <label for="postcode" class="block text-sm font-medium text-text-light mb-2">
                                Postal Code <span class="text-red-400">*</span>
                            </label>
                            <input id="postcode" name="postcode" type="text" required 
                                   value="{if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.postcode)}{$clientsdetails.postcode}{/if}"
                                   class="input-dark w-full focus:shadow-glow-green" 
                                   placeholder="Enter your postal code">
                        </div>
                        
                        <div>
                            <label for="country" class="block text-sm font-medium text-text-light mb-2">
                                Country <span class="text-red-400">*</span>
                            </label>
                            <select id="country" name="country" required 
                                    class="input-dark w-full focus:shadow-glow-green">
                                <option value="">Select your country</option>
                                {if $countries}
                                    {foreach $countries as $countrycode => $countryname}
                                        <option value="{$countrycode}" {if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.country) && $countrycode eq $clientsdetails.country}selected{/if}>
                                            {$countryname}
                                        </option>
                                    {/foreach}
                                {else}
                                    {* Fallback comprehensive country list *}
                                    <option value="US">United States</option>
                                    <option value="CA">Canada</option>
                                    <option value="GB">United Kingdom</option>
                                    <option value="AU">Australia</option>
                                    <option value="DE">Germany</option>
                                    <option value="FR">France</option>
                                    <option value="IT">Italy</option>
                                    <option value="ES">Spain</option>
                                    <option value="NL">Netherlands</option>
                                    <option value="BE">Belgium</option>
                                    <option value="CH">Switzerland</option>
                                    <option value="AT">Austria</option>
                                    <option value="SE">Sweden</option>
                                    <option value="NO">Norway</option>
                                    <option value="DK">Denmark</option>
                                    <option value="FI">Finland</option>
                                    <option value="IE">Ireland</option>
                                    <option value="PT">Portugal</option>
                                    <option value="PL">Poland</option>
                                    <option value="CZ">Czech Republic</option>
                                    <option value="HU">Hungary</option>
                                    <option value="GR">Greece</option>
                                    <option value="JP">Japan</option>
                                    <option value="CN">China</option>
                                    <option value="IN">India</option>
                                    <option value="KR">South Korea</option>
                                    <option value="SG">Singapore</option>
                                    <option value="HK">Hong Kong</option>
                                    <option value="TW">Taiwan</option>
                                    <option value="MY">Malaysia</option>
                                    <option value="TH">Thailand</option>
                                    <option value="ID">Indonesia</option>
                                    <option value="PH">Philippines</option>
                                    <option value="VN">Vietnam</option>
                                    <option value="BR">Brazil</option>
                                    <option value="MX">Mexico</option>
                                    <option value="AR">Argentina</option>
                                    <option value="CL">Chile</option>
                                    <option value="CO">Colombia</option>
                                    <option value="PE">Peru</option>
                                    <option value="ZA">South Africa</option>
                                    <option value="EG">Egypt</option>
                                    <option value="IL">Israel</option>
                                    <option value="AE">United Arab Emirates</option>
                                    <option value="SA">Saudi Arabia</option>
                                    <option value="TR">Turkey</option>
                                    <option value="RU">Russia</option>
                                    <option value="UA">Ukraine</option>
                                    <option value="RO">Romania</option>
                                    <option value="BG">Bulgaria</option>
                                    <option value="HR">Croatia</option>
                                    <option value="SK">Slovakia</option>
                                    <option value="SI">Slovenia</option>
                                    <option value="LT">Lithuania</option>
                                    <option value="LV">Latvia</option>
                                    <option value="EE">Estonia</option>
                                    <option value="NZ">New Zealand</option>
                                {/if}
                            </select>
                        </div>
                        
                        <div>
                            <label for="currency" class="block text-sm font-medium text-text-light mb-2">
                                Currency <span class="text-red-400">*</span>
                            </label>
                            <select id="currency" name="currency" required 
                                    class="input-dark w-full focus:shadow-glow-green">
                                {if $currencies}
                                    {foreach $currencies as $currencycode => $currencyinfo}
                                        <option value="{$currencycode}" {if $currencycode eq $defaultcurrency}selected{/if}>
                                            {$currencyinfo.code} - {$currencyinfo.prefix}{if $currencyinfo.suffix}{$currencyinfo.suffix}{/if}
                                        </option>
                                    {/foreach}
                                {else}
                                    <option value="USD" selected>USD - $</option>
                                    <option value="EUR">EUR - €</option>
                                    <option value="GBP">GBP - £</option>
                                    <option value="CAD">CAD - C$</option>
                                    <option value="AUD">AUD - A$</option>
                                {/if}
                            </select>
                        </div>
                    </div>
                </div>
                
                <!-- Account Security -->
                <div class="mb-8">
                    <h3 class="text-lg font-orbitron font-semibold text-white mb-4 flex items-center">
                        <svg class="w-5 h-5 text-cyber-purple mr-2" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                        </svg>
                        Account Security
                    </h3>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label for="password" class="block text-sm font-medium text-text-light mb-2">
                                Password <span class="text-red-400">*</span>
                            </label>
                            <input id="password" name="password" type="password" required 
                                   class="input-dark w-full focus:shadow-glow-green" 
                                   placeholder="Create a strong password">
                            <p class="text-xs text-text-light mt-1">Minimum 8 characters with letters and numbers</p>
                        </div>
                        
                        <div>
                            <label for="password2" class="block text-sm font-medium text-text-light mb-2">
                                Confirm Password <span class="text-red-400">*</span>
                            </label>
                            <input id="password2" name="password2" type="password" required 
                                   class="input-dark w-full focus:shadow-glow-green" 
                                   placeholder="Confirm your password">
                        </div>
                    </div>
                </div>
                
                <!-- Security Question (if enabled) -->
                {if $securityquestions}
                    <div class="mb-8">
                        <h3 class="text-lg font-orbitron font-semibold text-white mb-4">Security Question</h3>
                        
                        <div class="space-y-4">
                            <div>
                                <label for="securityqid" class="block text-sm font-medium text-text-light mb-2">
                                    Security Question <span class="text-red-400">*</span>
                                </label>
                                <select id="securityqid" name="securityqid" required 
                                        class="input-dark w-full focus:shadow-glow-green">
                                    <option value="">Select a security question</option>
                                    {foreach $securityquestions as $question}
                                        <option value="{$question.id}">{$question.question}</option>
                                    {/foreach}
                                </select>
                            </div>
                            
                            <div>
                                <label for="securityqans" class="block text-sm font-medium text-text-light mb-2">
                                    Security Answer <span class="text-red-400">*</span>
                                </label>
                                <input id="securityqans" name="securityqans" type="text" required 
                                       class="input-dark w-full focus:shadow-glow-green" 
                                       placeholder="Enter your security answer">
                            </div>
                        </div>
                    </div>
                {/if}
                
                <!-- Terms and Conditions -->
                <div class="mb-8">
                    <div class="flex items-start">
                        <input id="accepttos" name="accepttos" type="checkbox" required 
                               class="h-4 w-4 text-neon-green bg-dark-surface border-gray-600 rounded focus:ring-neon-green focus:ring-2 mt-1">
                        <label for="accepttos" class="ml-3 block text-sm text-text-light">
                            I agree to the 
                            <a href="{$WEB_ROOT}/legal.php?page=terms-of-service" target="_blank" class="font-medium text-neon-green hover:text-electric-blue transition-colors duration-300">
                                Terms of Service
                            </a>
                            and 
                            <a href="{$WEB_ROOT}/legal.php?page=privacy-policy" target="_blank" class="font-medium text-neon-green hover:text-electric-blue transition-colors duration-300">
                                Privacy Policy
                            </a>
                            <span class="text-red-400">*</span>
                        </label>
                    </div>
                </div>
                
                <!-- Marketing Preferences -->
                <div class="mb-8">
                    <div class="flex items-start">
                        <input id="marketingoptin" name="marketingoptin" type="checkbox" 
                               class="h-4 w-4 text-neon-green bg-dark-surface border-gray-600 rounded focus:ring-neon-green focus:ring-2 mt-1">
                        <label for="marketingoptin" class="ml-3 block text-sm text-text-light">
                            I would like to receive promotional emails about new products, services, and special offers.
                        </label>
                    </div>
                </div>
                
                <!-- CAPTCHA (if enabled) -->
                {if $captcha}
                    <div class="mb-8">
                        <label class="block text-sm font-medium text-text-light mb-2">
                            Verification <span class="text-red-400">*</span>
                        </label>
                        <div class="bg-dark-bg rounded-lg p-4 border border-gray-600">
                            {$captcha}
                        </div>
                    </div>
                {/if}
                
                <div class="flex items-center justify-between">
                    <a href="{$WEB_ROOT}/clientarea.php" class="text-text-light hover:text-neon-green transition-colors duration-300">
                        ← Back to login
                    </a>
                    <button type="submit" class="btn-primary px-8">
                        <svg class="w-5 h-5 mr-2 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"/>
                        </svg>
                        Create Account
                    </button>
                </div>
            </form>
        </div>
        
        <!-- Additional Information -->
        <div class="text-center mt-8">
            <p class="text-sm text-text-light">
                Need help getting started?
                <a href="{$WEB_ROOT}/contact.php" class="font-medium text-neon-green hover:text-electric-blue transition-colors duration-300">
                    Contact our support team
                </a>
            </p>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}