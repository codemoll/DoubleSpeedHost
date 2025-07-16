{* Registration form scripts for password strength and states dropdown *}
{if in_array('state', $optionalFields)}
    <script>
        var statesTab = 10;
        var stateNotRequired = true;
    </script>
{/if}

<script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
<script type="text/javascript" src="{$BASE_PATH_JS}/PasswordStrength.js"></script>
<script>
    window.langPasswordStrength = "{lang key='pwstrength'}";
    window.langPasswordWeak = "{lang key='pwstrengthweak'}";
    window.langPasswordModerate = "{lang key='pwstrengthmoderate'}";
    window.langPasswordStrong = "{lang key='pwstrengthstrong'}";
    jQuery(document).ready(function()
    {
        jQuery("#inputNewPassword1").keyup(registerFormPasswordStrengthFeedback);
    });
</script>

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

        {if $registrationDisabled}
            <div class="bg-red-900 border border-red-700 rounded-lg p-4 mb-6">
                <div class="flex">
                    <svg class="w-5 h-5 text-red-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                    </svg>
                    <div class="text-red-200 text-sm">
                        {lang key='registerCreateAccount'} <strong><a href="{$WEB_ROOT}/cart.php" class="text-red-300 hover:text-red-100 underline">{lang key='registerCreateAccountOrder'}</a></strong>
                    </div>
                </div>
            </div>
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

        {if !$registrationDisabled}
        <div class="card-dark">
            {* OAuth/Social Sign-in Integration *}
            {include file="$template/includes/linkedaccounts.tpl" linkContext="registration"}
            
            <form method="post" action="{$smarty.server.PHP_SELF}" class="using-password-strength" role="form" name="orderfrm" id="frmCheckout">
                <input type="hidden" name="register" value="true"/>
                {if $token}
                    <input type="hidden" name="token" value="{$token}">
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
                            <label for="inputFirstName" class="block text-sm font-medium text-text-light mb-2">
                                First Name <span class="text-red-400">*</span>
                            </label>
                            <input id="inputFirstName" name="firstname" type="text" {if !in_array('firstname', $optionalFields)}required{/if}
                                   value="{$clientfirstname}"
                                   class="input-dark w-full focus:shadow-glow-green" 
                                   placeholder="Enter your first name"
                                   autofocus>
                        </div>
                        
                        <div>
                            <label for="inputLastName" class="block text-sm font-medium text-text-light mb-2">
                                Last Name <span class="text-red-400">*</span>
                            </label>
                            <input id="inputLastName" name="lastname" type="text" {if !in_array('lastname', $optionalFields)}required{/if}
                                   value="{$clientlastname}"
                                   class="input-dark w-full focus:shadow-glow-green" 
                                   placeholder="Enter your last name">
                        </div>
                        
                        <div>
                            <label for="inputEmail" class="block text-sm font-medium text-text-light mb-2">
                                Email Address <span class="text-red-400">*</span>
                            </label>
                            <input id="inputEmail" name="email" type="email" required 
                                   value="{$clientemail}"
                                   class="input-dark w-full focus:shadow-glow-green" 
                                   placeholder="Enter your email address">
                        </div>
                        
                        <div>
                            <label for="inputPhone" class="block text-sm font-medium text-text-light mb-2">
                                Phone Number{if !in_array('phonenumber', $optionalFields)} <span class="text-red-400">*</span>{/if}
                            </label>
                            <input id="inputPhone" name="phonenumber" type="tel" {if !in_array('phonenumber', $optionalFields)}required{/if}
                                   value="{$clientphonenumber}"
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
                        Billing Address
                    </h3>
                    
                    <div class="grid grid-cols-1 gap-6">
                        <div>
                            <label for="inputCompanyName" class="block text-sm font-medium text-text-light mb-2">
                                Company Name {if in_array('companyname', $optionalFields)}(Optional){else}<span class="text-red-400">*</span>{/if}
                            </label>
                            <input id="inputCompanyName" name="companyname" type="text" {if !in_array('companyname', $optionalFields)}required{/if}
                                   value="{$clientcompanyname}"
                                   class="input-dark w-full focus:shadow-glow-green" 
                                   placeholder="Enter your company name (optional)">
                        </div>
                        
                        <div>
                            <label for="inputAddress1" class="block text-sm font-medium text-text-light mb-2">
                                Street Address <span class="text-red-400">*</span>
                            </label>
                            <input id="inputAddress1" name="address1" type="text" {if !in_array('address1', $optionalFields)}required{/if}
                                   value="{$clientaddress1}"
                                   class="input-dark w-full focus:shadow-glow-green" 
                                   placeholder="Enter your street address">
                        </div>
                        
                        <div>
                            <label for="inputAddress2" class="block text-sm font-medium text-text-light mb-2">
                                Street Address 2 (Optional)
                            </label>
                            <input id="inputAddress2" name="address2" type="text"
                                   value="{$clientaddress2}"
                                   class="input-dark w-full focus:shadow-glow-green" 
                                   placeholder="Apartment, suite, etc. (optional)">
                        </div>
                        
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                            <div>
                                <label for="inputCity" class="block text-sm font-medium text-text-light mb-2">
                                    City <span class="text-red-400">*</span>
                                </label>
                                <input id="inputCity" name="city" type="text" {if !in_array('city', $optionalFields)}required{/if}
                                       value="{$clientcity}"
                                       class="input-dark w-full focus:shadow-glow-green" 
                                       placeholder="Enter your city">
                            </div>
                            
                            <div>
                                <label for="state" class="block text-sm font-medium text-text-light mb-2">
                                    State/Province{if !in_array('state', $optionalFields)} <span class="text-red-400">*</span>{/if}
                                </label>
                                <input id="state" name="state" type="text" {if !in_array('state', $optionalFields)}required{/if}
                                       value="{$clientstate}"
                                       class="input-dark w-full focus:shadow-glow-green" 
                                       placeholder="Enter your state/province">
                            </div>
                            
                            <div>
                                <label for="inputPostcode" class="block text-sm font-medium text-text-light mb-2">
                                    Postal Code <span class="text-red-400">*</span>
                                </label>
                                <input id="inputPostcode" name="postcode" type="text" {if !in_array('postcode', $optionalFields)}required{/if}
                                       value="{$clientpostcode}"
                                       class="input-dark w-full focus:shadow-glow-green" 
                                       placeholder="Enter your postal code">
                            </div>
                        </div>
                        
                        <div>
                            <label for="inputCountry" class="block text-sm font-medium text-text-light mb-2">
                                Country <span class="text-red-400">*</span>
                            </label>
                            <select id="inputCountry" name="country" required 
                                    class="input-dark w-full focus:shadow-glow-green">
                                <option value="">Select your country</option>
                                {if $clientcountries}
                                    {foreach $clientcountries as $countryCode => $countryName}
                                        <option value="{$countryCode}"{if (!$clientcountry && $countryCode eq $defaultCountry) || ($countryCode eq $clientcountry)} selected{/if}>
                                            {$countryName}
                                        </option>
                                    {/foreach}
                                {else}
                                    {* Fallback comprehensive country list if WHMCS countries not available *}
                                    <option value="US"{if $clientcountry eq 'US' || (!$clientcountry && $defaultCountry eq 'US')} selected{/if}>United States</option>
                                    <option value="CA"{if $clientcountry eq 'CA'} selected{/if}>Canada</option>
                                    <option value="GB"{if $clientcountry eq 'GB'} selected{/if}>United Kingdom</option>
                                    <option value="AU"{if $clientcountry eq 'AU'} selected{/if}>Australia</option>
                                    <option value="DE"{if $clientcountry eq 'DE'} selected{/if}>Germany</option>
                                    <option value="FR"{if $clientcountry eq 'FR'} selected{/if}>France</option>
                                    <option value="IT"{if $clientcountry eq 'IT'} selected{/if}>Italy</option>
                                    <option value="ES"{if $clientcountry eq 'ES'} selected{/if}>Spain</option>
                                    <option value="NL"{if $clientcountry eq 'NL'} selected{/if}>Netherlands</option>
                                    <option value="BE"{if $clientcountry eq 'BE'} selected{/if}>Belgium</option>
                                    <option value="CH"{if $clientcountry eq 'CH'} selected{/if}>Switzerland</option>
                                    <option value="AT"{if $clientcountry eq 'AT'} selected{/if}>Austria</option>
                                    <option value="SE"{if $clientcountry eq 'SE'} selected{/if}>Sweden</option>
                                    <option value="NO"{if $clientcountry eq 'NO'} selected{/if}>Norway</option>
                                    <option value="DK"{if $clientcountry eq 'DK'} selected{/if}>Denmark</option>
                                    <option value="FI"{if $clientcountry eq 'FI'} selected{/if}>Finland</option>
                                    <option value="IE"{if $clientcountry eq 'IE'} selected{/if}>Ireland</option>
                                    <option value="PT"{if $clientcountry eq 'PT'} selected{/if}>Portugal</option>
                                    <option value="PL"{if $clientcountry eq 'PL'} selected{/if}>Poland</option>
                                    <option value="CZ"{if $clientcountry eq 'CZ'} selected{/if}>Czech Republic</option>
                                    <option value="HU"{if $clientcountry eq 'HU'} selected{/if}>Hungary</option>
                                    <option value="GR"{if $clientcountry eq 'GR'} selected{/if}>Greece</option>
                                    <option value="JP"{if $clientcountry eq 'JP'} selected{/if}>Japan</option>
                                    <option value="CN"{if $clientcountry eq 'CN'} selected{/if}>China</option>
                                    <option value="IN"{if $clientcountry eq 'IN'} selected{/if}>India</option>
                                    <option value="KR"{if $clientcountry eq 'KR'} selected{/if}>South Korea</option>
                                    <option value="SG"{if $clientcountry eq 'SG'} selected{/if}>Singapore</option>
                                    <option value="HK"{if $clientcountry eq 'HK'} selected{/if}>Hong Kong</option>
                                    <option value="TW"{if $clientcountry eq 'TW'} selected{/if}>Taiwan</option>
                                    <option value="MY"{if $clientcountry eq 'MY'} selected{/if}>Malaysia</option>
                                    <option value="TH"{if $clientcountry eq 'TH'} selected{/if}>Thailand</option>
                                    <option value="ID"{if $clientcountry eq 'ID'} selected{/if}>Indonesia</option>
                                    <option value="PH"{if $clientcountry eq 'PH'} selected{/if}>Philippines</option>
                                    <option value="VN"{if $clientcountry eq 'VN'} selected{/if}>Vietnam</option>
                                    <option value="BR"{if $clientcountry eq 'BR'} selected{/if}>Brazil</option>
                                    <option value="MX"{if $clientcountry eq 'MX'} selected{/if}>Mexico</option>
                                    <option value="AR"{if $clientcountry eq 'AR'} selected{/if}>Argentina</option>
                                    <option value="CL"{if $clientcountry eq 'CL'} selected{/if}>Chile</option>
                                    <option value="CO"{if $clientcountry eq 'CO'} selected{/if}>Colombia</option>
                                    <option value="PE"{if $clientcountry eq 'PE'} selected{/if}>Peru</option>
                                    <option value="ZA"{if $clientcountry eq 'ZA'} selected{/if}>South Africa</option>
                                    <option value="EG"{if $clientcountry eq 'EG'} selected{/if}>Egypt</option>
                                    <option value="IL"{if $clientcountry eq 'IL'} selected{/if}>Israel</option>
                                    <option value="AE"{if $clientcountry eq 'AE'} selected{/if}>United Arab Emirates</option>
                                    <option value="SA"{if $clientcountry eq 'SA'} selected{/if}>Saudi Arabia</option>
                                    <option value="TR"{if $clientcountry eq 'TR'} selected{/if}>Turkey</option>
                                    <option value="RU"{if $clientcountry eq 'RU'} selected{/if}>Russia</option>
                                    <option value="UA"{if $clientcountry eq 'UA'} selected{/if}>Ukraine</option>
                                    <option value="RO"{if $clientcountry eq 'RO'} selected{/if}>Romania</option>
                                    <option value="BG"{if $clientcountry eq 'BG'} selected{/if}>Bulgaria</option>
                                    <option value="HR"{if $clientcountry eq 'HR'} selected{/if}>Croatia</option>
                                    <option value="SK"{if $clientcountry eq 'SK'} selected{/if}>Slovakia</option>
                                    <option value="SI"{if $clientcountry eq 'SI'} selected{/if}>Slovenia</option>
                                    <option value="LT"{if $clientcountry eq 'LT'} selected{/if}>Lithuania</option>
                                    <option value="LV"{if $clientcountry eq 'LV'} selected{/if}>Latvia</option>
                                    <option value="EE"{if $clientcountry eq 'EE'} selected{/if}>Estonia</option>
                                    <option value="NZ"{if $clientcountry eq 'NZ'} selected{/if}>New Zealand</option>
                                {/if}
                            </select>
                        </div>
                        
                        {if $showTaxIdField}
                            <div>
                                <label for="inputTaxId" class="block text-sm font-medium text-text-light mb-2">
                                    {$taxLabel} (Optional)
                                </label>
                                <input id="inputTaxId" name="tax_id" type="text"
                                       value="{$clientTaxId}"
                                       class="input-dark w-full focus:shadow-glow-green" 
                                       placeholder="Enter your {$taxLabel}">
                            </div>
                        {/if}
                        
                        {* Custom Fields and Currency Selection *}
                        {if $customfields || $currencies}
                            <div class="border-t border-gray-700 pt-6">
                                <h4 class="text-md font-medium text-white mb-4">Additional Information</h4>
                                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                    {if $customfields}
                                        {foreach $customfields as $customfield}
                                            <div{if $customfield.type eq 'tickbox'} class="md:col-span-2"{/if}>
                                                <label for="customfield{$customfield.id}" class="block text-sm font-medium text-text-light mb-2">
                                                    {$customfield.name} {if $customfield.required}<span class="text-red-400">*</span>{/if}
                                                </label>
                                                <div class="control">
                                                    {$customfield.input}
                                                    {if $customfield.description}
                                                        <p class="text-xs text-text-light mt-1">{$customfield.description}</p>
                                                    {/if}
                                                </div>
                                            </div>
                                        {/foreach}
                                    {/if}
                                    
                                    {if $currencies}
                                        <div>
                                            <label for="inputCurrency" class="block text-sm font-medium text-text-light mb-2">
                                                Currency <span class="text-red-400">*</span>
                                            </label>
                                            <select id="inputCurrency" name="currency" required
                                                    class="input-dark w-full focus:shadow-glow-green">
                                                {foreach from=$currencies item=curr}
                                                    <option value="{$curr.id}"{if !$smarty.post.currency && $curr.default || $smarty.post.currency eq $curr.id } selected{/if}>
                                                        {$curr.code} - {$curr.prefix}{if $curr.suffix}{$curr.suffix}{/if}
                                                    </option>
                                                {/foreach}
                                            </select>
                                        </div>
                                    {/if}
                                </div>
                            </div>
                        {/if}
                    </div>
                </div>
                
                <!-- Account Security -->
                <div id="containerNewUserSecurity" class="mb-8"{if $remote_auth_prelinked && !$securityquestions } class="hidden"{/if}>
                    <h3 class="text-lg font-orbitron font-semibold text-white mb-4 flex items-center">
                        <svg class="w-5 h-5 text-cyber-purple mr-2" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                        </svg>
                        Account Security
                    </h3>
                    
                    <div id="containerPassword" class="space-y-6{if $remote_auth_prelinked && $securityquestions} hidden{/if}">
                        <div id="passwdFeedback" style="display: none;" class="bg-blue-900/20 border border-blue-600 rounded-lg p-4 text-center text-blue-200"></div>
                        
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label for="inputNewPassword1" class="block text-sm font-medium text-text-light mb-2">
                                    Password <span class="text-red-400">*</span>
                                </label>
                                <input id="inputNewPassword1" name="password" type="password" 
                                       data-error-threshold="{$pwStrengthErrorThreshold}" 
                                       data-warning-threshold="{$pwStrengthWarningThreshold}"
                                       class="input-dark w-full focus:shadow-glow-green" 
                                       placeholder="Create a strong password"
                                       autocomplete="new-password"
                                       {if $remote_auth_prelinked} value="{$password}"{/if}>
                                <p class="text-xs text-text-light mt-1">Minimum 8 characters with letters and numbers</p>
                            </div>
                            
                            <div>
                                <label for="inputNewPassword2" class="block text-sm font-medium text-text-light mb-2">
                                    Confirm Password <span class="text-red-400">*</span>
                                </label>
                                <input id="inputNewPassword2" name="password2" type="password" 
                                       class="input-dark w-full focus:shadow-glow-green" 
                                       placeholder="Confirm your password"
                                       autocomplete="new-password"
                                       {if $remote_auth_prelinked} value="{$password}"{/if}>
                            </div>
                        </div>
                        
                        <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
                            <button type="button" 
                                    class="btn-secondary text-sm px-4 py-2 generate-password" 
                                    data-targetfields="inputNewPassword1,inputNewPassword2">
                                <svg class="w-4 h-4 mr-2 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"/>
                                </svg>
                                Generate Secure Password
                            </button>
                            
                            <div class="password-strength-meter flex-1 md:max-w-sm">
                                <div class="bg-dark-surface rounded-full overflow-hidden">
                                    <div class="h-2 bg-gradient-to-r from-red-500 via-yellow-500 to-green-500 transition-all duration-500 ease-out" 
                                         role="progressbar" 
                                         aria-valuenow="0" 
                                         aria-valuemin="0" 
                                         aria-valuemax="100" 
                                         id="passwordStrengthMeterBar"
                                         style="width: 0%">
                                    </div>
                                </div>
                                <p class="text-xs text-center text-text-light mt-1" id="passwordStrengthTextLabel">
                                    Password Strength: Enter a password
                                </p>
                            </div>
                        </div>
                    </div>
                    
                    {if $securityquestions}
                    <div class="mt-6 space-y-4">
                        <div>
                            <label for="inputSecurityQId" class="block text-sm font-medium text-text-light mb-2">
                                Security Question <span class="text-red-400">*</span>
                            </label>
                            <select name="securityqid" id="inputSecurityQId" class="input-dark w-full focus:shadow-glow-green" required>
                                <option value="">Select a security question</option>
                                {foreach $securityquestions as $question}
                                    <option value="{$question.id}"{if $question.id eq $securityqid} selected{/if}>
                                        {$question.question}
                                    </option>
                                {/foreach}
                            </select>
                        </div>
                        
                        <div>
                            <label for="inputSecurityQAns" class="block text-sm font-medium text-text-light mb-2">
                                Security Answer <span class="text-red-400">*</span>
                            </label>
                            <input type="password" name="securityqans" id="inputSecurityQAns" 
                                   class="input-dark w-full focus:shadow-glow-green" 
                                   placeholder="Enter your security answer" 
                                   autocomplete="off"
                                   required>
                        </div>
                    </div>
                    {/if}
                </div>
                
                <!-- Marketing Email Opt-in -->
                {if $showMarketingEmailOptIn}
                <div class="mb-8">
                    <div class="bg-dark-surface border border-gray-700 rounded-lg p-6">
                        <h4 class="text-lg font-semibold text-white mb-3">
                            <svg class="w-5 h-5 text-neon-green mr-2 inline" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                                <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                            </svg>
                            Join our mailing list
                        </h4>
                        <p class="text-text-light text-sm mb-4">{$marketingEmailOptInMessage}</p>
                        <label class="flex items-center cursor-pointer">
                            <input type="checkbox" name="marketingoptin" value="1"{if $marketingEmailOptIn} checked{/if} 
                                   class="h-4 w-4 text-neon-green bg-dark-surface border-gray-600 rounded focus:ring-neon-green focus:ring-2">
                            <span class="ml-3 text-sm text-text-light">
                                I would like to receive promotional emails about new products, services, and special offers.
                            </span>
                        </label>
                    </div>
                </div>
                {/if}

                <!-- CAPTCHA -->
                {include file="$template/includes/captcha.tpl"}

                <!-- Terms of Service -->
                {if $accepttos}
                <div class="mb-8">
                    <div class="bg-red-900/20 border border-red-700 rounded-lg p-6">
                        <div class="flex items-start">
                            <svg class="w-6 h-6 text-red-400 mr-3 mt-0.5 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
                            </svg>
                            <div class="flex-1">
                                <h3 class="text-lg font-semibold text-red-300 mb-3">Terms of Service</h3>
                                <label class="flex items-start cursor-pointer">
                                    <input type="checkbox" name="accepttos" class="accepttos h-4 w-4 text-red-500 bg-dark-surface border-gray-600 rounded focus:ring-red-500 focus:ring-2 mt-1" required>
                                    <span class="ml-3 text-sm text-red-200">
                                        I agree to the <a href="{$tosurl}" target="_blank" class="text-red-300 hover:text-red-100 underline">Terms of Service</a>
                                        {if $privacyurl} and <a href="{$privacyurl}" target="_blank" class="text-red-300 hover:text-red-100 underline">Privacy Policy</a>{/if}
                                        <span class="text-red-400">*</span>
                                    </span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                {/if}

                <div class="flex items-center justify-between pt-6">
                    <a href="{$WEB_ROOT}/clientarea.php" class="text-text-light hover:text-neon-green transition-colors duration-300">
                        ← Back to login
                    </a>
                    <button type="submit" class="btn-primary px-8{$captcha->getButtonClass($captchaForm)}">
                        <svg class="w-5 h-5 mr-2 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"/>
                        </svg>
                        Create Account
                    </button>
                </div>
            </form>
        </div>
        {/if}
        
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