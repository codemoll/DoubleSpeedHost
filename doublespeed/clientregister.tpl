{if in_array('state', $optionalFields)}
    <script>
        var statesTab = 10;
        var stateNotRequired = true;
    </script>
{/if}

<script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
<script type="text/javascript" src="{$BASE_PATH_JS}/PasswordStrength.js"></script>
<script>
    window.langPasswordStrength = "{$LANG.pwstrength}";
    window.langPasswordWeak = "{$LANG.pwstrengthweak}";
    window.langPasswordModerate = "{$LANG.pwstrengthmoderate}";
    window.langPasswordStrong = "{$LANG.pwstrengthstrong}";
    jQuery(document).ready(function()
    {
        jQuery("#inputNewPassword1").keyup(registerFormPasswordStrengthFeedback);
    });
</script>

{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-6xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <div class="text-center mb-8">
                <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                    <span class="glow-text">Create Your Account</span>
                </h1>
                <p class="text-text-light">
                    Join thousands of satisfied customers and experience premium hosting services with cutting-edge technology.
                </p>
            </div>
            
            {if $registrationDisabled}
                <div class="bg-red-900 border border-red-700 rounded-lg p-4 mb-6">
                    <div class="flex">
                        <svg class="w-5 h-5 text-red-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                        </svg>
                        <div class="text-red-200 text-sm">
                            {$LANG.registerCreateAccount} <strong><a href="{$WEB_ROOT}/cart.php" class="text-red-300 underline hover:text-red-100">{$LANG.registerCreateAccountOrder}</a></strong>
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
            <div id="registration">
                <form method="post" class="using-password-strength space-y-8" action="{$smarty.server.PHP_SELF}" role="form" name="orderfrm" id="frmCheckout">
                    <input type="hidden" name="register" value="true"/>
                    {* Set captcha form context for WHMCS *}
                    {assign var="captchaForm" value="registration"}

                    <div id="containerNewUserSignup">

                        {include file="$template/includes/linkedaccounts.tpl" linkContext="registration"}
                        <!-- Personal Information Section -->
                        <div class="card-dark">
                            <h2 class="text-2xl font-orbitron font-semibold text-white mb-6 flex items-center">
                                <svg class="w-6 h-6 mr-3 text-neon-green" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"/>
                                </svg>
                                {$LANG.orderForm.personalInformation}
                            </h2>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <div>
                                    <label for="inputFirstName" class="block text-sm font-medium text-white mb-2">
                                        {$LANG.orderForm.firstName} {if !in_array('firstname', $optionalFields)}<span class="text-red-400">*</span>{/if}
                                    </label>
                                    <div class="relative">
                                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                            <i class="fas fa-user text-text-light"></i>
                                        </div>
                                        <input type="text" name="firstname" id="inputFirstName" class="input-dark w-full pl-10" 
                                               placeholder="{$LANG.orderForm.firstName}" 
                                               value="{$clientfirstname}" {if !in_array('firstname', $optionalFields)}required{/if} autofocus>
                                    </div>
                                </div>
                                <div>
                                    <label for="inputLastName" class="block text-sm font-medium text-white mb-2">
                                        {$LANG.orderForm.lastName} {if !in_array('lastname', $optionalFields)}<span class="text-red-400">*</span>{/if}
                                    </label>
                                    <div class="relative">
                                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                            <i class="fas fa-user text-text-light"></i>
                                        </div>
                                        <input type="text" name="lastname" id="inputLastName" class="input-dark w-full pl-10" 
                                               placeholder="{$LANG.orderForm.lastName}" 
                                               value="{$clientlastname}" {if !in_array('lastname', $optionalFields)}required{/if}>
                                    </div>
                                </div>
                                <div>
                                    <label for="inputEmail" class="block text-sm font-medium text-white mb-2">
                                        {$LANG.orderForm.emailAddress} <span class="text-red-400">*</span>
                                    </label>
                                    <div class="relative">
                                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                            <i class="fas fa-envelope text-text-light"></i>
                                        </div>
                                        <input type="email" name="email" id="inputEmail" class="input-dark w-full pl-10" 
                                               placeholder="{$LANG.orderForm.emailAddress}" 
                                               value="{$clientemail}" required>
                                    </div>
                                </div>
                                <div>
                                    <label for="inputPhone" class="block text-sm font-medium text-white mb-2">
                                        {$LANG.orderForm.phoneNumber} {if !in_array('phonenumber', $optionalFields)}<span class="text-red-400">*</span>{/if}
                                    </label>
                                    <div class="relative">
                                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                            <i class="fas fa-phone text-text-light"></i>
                                        </div>
                                        <input type="tel" name="phonenumber" id="inputPhone" class="input-dark w-full pl-10" 
                                               placeholder="{$LANG.orderForm.phoneNumber}" 
                                               value="{$clientphonenumber}" {if !in_array('phonenumber', $optionalFields)}required{/if}>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Billing Address Section -->
                        <div class="card-dark">
                            <h2 class="text-2xl font-orbitron font-semibold text-white mb-6 flex items-center">
                                <svg class="w-6 h-6 mr-3 text-electric-blue" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clip-rule="evenodd"/>
                                </svg>
                                {$LANG.orderForm.billingAddress}
                            </h2>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <div class="md:col-span-2">
                                    <label for="inputCompanyName" class="block text-sm font-medium text-white mb-2">
                                        {$LANG.orderForm.companyName} <span class="text-text-light">({$LANG.orderForm.optional})</span>
                                    </label>
                                    <div class="relative">
                                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                            <i class="fas fa-building text-text-light"></i>
                                        </div>
                                        <input type="text" name="companyname" id="inputCompanyName" class="input-dark w-full pl-10" 
                                               placeholder="{$LANG.orderForm.companyName} ({$LANG.orderForm.optional})" 
                                               value="{$clientcompanyname}">
                                    </div>
                                </div>
                                <div class="md:col-span-2">
                                    <label for="inputAddress1" class="block text-sm font-medium text-white mb-2">
                                        {$LANG.orderForm.streetAddress} {if !in_array('address1', $optionalFields)}<span class="text-red-400">*</span>{/if}
                                    </label>
                                    <div class="relative">
                                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                            <i class="far fa-building text-text-light"></i>
                                        </div>
                                        <input type="text" name="address1" id="inputAddress1" class="input-dark w-full pl-10" 
                                               placeholder="{$LANG.orderForm.streetAddress}" 
                                               value="{$clientaddress1}" {if !in_array('address1', $optionalFields)}required{/if}>
                                    </div>
                                </div>
                                <div class="md:col-span-2">
                                    <label for="inputAddress2" class="block text-sm font-medium text-white mb-2">
                                        {$LANG.orderForm.streetAddress2} <span class="text-text-light">({$LANG.orderForm.optional})</span>
                                    </label>
                                    <div class="relative">
                                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                            <i class="fas fa-map-marker-alt text-text-light"></i>
                                        </div>
                                        <input type="text" name="address2" id="inputAddress2" class="input-dark w-full pl-10" 
                                               placeholder="{$LANG.orderForm.streetAddress2}" 
                                               value="{$clientaddress2}">
                                    </div>
                                </div>
                                <div>
                                    <label for="inputCity" class="block text-sm font-medium text-white mb-2">
                                        {$LANG.orderForm.city} {if !in_array('city', $optionalFields)}<span class="text-red-400">*</span>{/if}
                                    </label>
                                    <div class="relative">
                                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                            <i class="far fa-building text-text-light"></i>
                                        </div>
                                        <input type="text" name="city" id="inputCity" class="input-dark w-full pl-10" 
                                               placeholder="{$LANG.orderForm.city}" 
                                               value="{$clientcity}" {if !in_array('city', $optionalFields)}required{/if}>
                                    </div>
                                </div>
                                <div>
                                    <label for="state" class="block text-sm font-medium text-white mb-2" id="inputStateIcon">
                                        {$LANG.orderForm.state} {if !in_array('state', $optionalFields)}<span class="text-red-400">*</span>{/if}
                                    </label>
                                    <div class="relative">
                                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                            <i class="fas fa-map-signs text-text-light"></i>
                                        </div>
                                        <input type="text" name="state" id="state" class="input-dark w-full pl-10" 
                                               placeholder="{$LANG.orderForm.state}" 
                                               value="{$clientstate}" {if !in_array('state', $optionalFields)}required{/if}>
                                    </div>
                                </div>
                                <div>
                                    <label for="inputPostcode" class="block text-sm font-medium text-white mb-2">
                                        {$LANG.orderForm.postcode} {if !in_array('postcode', $optionalFields)}<span class="text-red-400">*</span>{/if}
                                    </label>
                                    <div class="relative">
                                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                            <i class="fas fa-certificate text-text-light"></i>
                                        </div>
                                        <input type="text" name="postcode" id="inputPostcode" class="input-dark w-full pl-10" 
                                               placeholder="{$LANG.orderForm.postcode}" 
                                               value="{$clientpostcode}" {if !in_array('postcode', $optionalFields)}required{/if}>
                                    </div>
                                </div>
                                <div>
                                    <label for="inputCountry" class="block text-sm font-medium text-white mb-2" id="inputCountryIcon">
                                        {$LANG.orderForm.country} <span class="text-red-400">*</span>
                                    </label>
                                    <div class="relative">
                                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                            <i class="fas fa-globe text-text-light"></i>
                                        </div>
                                        <select name="country" id="inputCountry" class="input-dark w-full pl-10" required>
                                            {foreach $clientcountries as $countryCode => $countryName}
                                                <option value="{$countryCode}"{if (!$clientcountry && $countryCode eq $defaultCountry) || ($countryCode eq $clientcountry)} selected="selected"{/if}>
                                                    {$countryName}
                                                </option>
                                            {/foreach}
                                        </select>
                                    </div>
                                </div>
                                {if $showTaxIdField}
                                    <div class="md:col-span-2">
                                        <label for="inputTaxId" class="block text-sm font-medium text-white mb-2">
                                            {$taxLabel} <span class="text-text-light">({$LANG.orderForm.optional})</span>
                                        </label>
                                        <div class="relative">
                                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                                <i class="fas fa-building text-text-light"></i>
                                            </div>
                                            <input type="text" name="tax_id" id="inputTaxId" class="input-dark w-full pl-10" 
                                                   placeholder="{$taxLabel} ({$LANG.orderForm.optional})" 
                                                   value="{$clientTaxId}">
                                        </div>
                                    </div>
                                {/if}
                            </div>
                        </div>

                        <!-- Additional Information Section -->
                        {if $customfields || $currencies}
                        <div class="card-dark">
                            <h2 class="text-2xl font-orbitron font-semibold text-white mb-6 flex items-center">
                                <svg class="w-6 h-6 mr-3 text-cyber-purple" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M4 4a2 2 0 00-2 2v4a2 2 0 002 2V6h10a2 2 0 00-2-2H4zm2 6a2 2 0 012-2h8a2 2 0 012 2v4a2 2 0 01-2 2H8a2 2 0 01-2-2v-4zm6 4a2 2 0 100-4 2 2 0 000 4z" clip-rule="evenodd"/>
                                </svg>
                                {$LANG.orderadditionalrequiredinfo}
                            </h2>
                            <div class="text-sm text-text-light mb-4">
                                <i>{if isset($LANG.orderForm) && isset($LANG.orderForm.requiredField)}{$LANG.orderForm.requiredField}{else}{$LANG.orderrequiredfields}{/if}</i>
                            </div>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                {if $customfields}
                                {foreach $customfields as $customfield}
                                    <div class="{if $customfield.fieldtype eq 'textarea'}md:col-span-2{/if}">
                                        <label for="customfield{$customfield.id}" class="block text-sm font-medium text-white mb-2">
                                            {$customfield.name} {$customfield.required}
                                        </label>
                                        <div class="custom-field-input">
                                            {$customfield.input}
                                        {if $customfield.description}
                                            <span class="block text-xs text-text-light mt-1">{$customfield.description}</span>
                                        {/if}
                                        </div>
                                    </div>
                                {/foreach}
                                {/if}
                                {if $currencies}
                                <div class="{if !$customfields}md:col-span-2{/if}">
                                    <label for="inputCurrency" class="block text-sm font-medium text-white mb-2">
                                        {$LANG.orderForm.currency}
                                    </label>
                                    <div class="relative">
                                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                            <i class="far fa-money-bill-alt text-text-light"></i>
                                        </div>
                                        <select id="inputCurrency" name="currency" class="input-dark w-full pl-10">
                                            {foreach from=$currencies item=curr}
                                                <option value="{$curr.id}"{if !$smarty.post.currency && $curr.default || $smarty.post.currency eq $curr.id } selected{/if}>{$curr.code}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                </div>
                                {/if}
                            </div>
                        </div>
                        {/if}
                    </div>

                    <!-- Account Security Section -->
                    <div id="containerNewUserSecurity" {if $remote_auth_prelinked && !$securityquestions } class="hidden"{/if}>
                        <div class="card-dark">
                            <h2 class="text-2xl font-orbitron font-semibold text-white mb-6 flex items-center">
                                <svg class="w-6 h-6 mr-3 text-yellow-400" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                                </svg>
                                {$LANG.orderForm.accountSecurity}
                            </h2>
                            
                            <div id="containerPassword" class="{if $remote_auth_prelinked && $securityquestions}hidden{/if}">
                                <div id="passwdFeedback" style="display: none;" class="bg-blue-900 border border-blue-600 rounded-lg p-3 mb-6 text-center text-blue-200"></div>
                                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                    <div>
                                        <label for="inputNewPassword1" class="block text-sm font-medium text-white mb-2">
                                            {$LANG.clientareapassword} <span class="text-red-400">*</span>
                                        </label>
                                        <div class="relative">
                                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                                <i class="fas fa-lock text-text-light"></i>
                                            </div>
                                            <input type="password" name="password" id="inputNewPassword1" 
                                                   data-error-threshold="{$pwStrengthErrorThreshold}" 
                                                   data-warning-threshold="{$pwStrengthWarningThreshold}" 
                                                   class="input-dark w-full pl-10 pr-12" 
                                                   placeholder="{$LANG.clientareapassword}" 
                                                   autocomplete="off" required{if $remote_auth_prelinked} value="{$password}"{/if}>
                                            <button type="button" class="absolute inset-y-0 right-0 flex items-center pr-3" 
                                                    onclick="togglePasswordVisibility('inputNewPassword1', this)">
                                                <svg class="w-5 h-5 text-text-light" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/>
                                                </svg>
                                            </button>
                                        </div>
                                    </div>
                                    <div>
                                        <label for="inputNewPassword2" class="block text-sm font-medium text-white mb-2">
                                            {$LANG.clientareaconfirmpassword} <span class="text-red-400">*</span>
                                        </label>
                                        <div class="relative">
                                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                                <i class="fas fa-lock text-text-light"></i>
                                            </div>
                                            <input type="password" name="password2" id="inputNewPassword2" 
                                                   class="input-dark w-full pl-10 pr-12" 
                                                   placeholder="{$LANG.clientareaconfirmpassword}" 
                                                   autocomplete="off" required{if $remote_auth_prelinked} value="{$password}"{/if}>
                                            <button type="button" class="absolute inset-y-0 right-0 flex items-center pr-3" 
                                                    onclick="togglePasswordVisibility('inputNewPassword2', this)">
                                                <svg class="w-5 h-5 text-text-light" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/>
                                                </svg>
                                            </button>
                                        </div>
                                        <div class="text-xs mt-2 text-text-light">
                                            <span id="password-match"></span>
                                        </div>
                                    </div>
                                    <div class="md:col-span-2">
                                        <button type="button" class="btn-outline text-sm generate-password" data-targetfields="inputNewPassword1,inputNewPassword2">
                                            <svg class="w-4 h-4 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                                                <path fill-rule="evenodd" d="M4 2a1 1 0 011 1v2.101a7.002 7.002 0 0111.601 2.566 1 1 0 11-1.885.666A5.002 5.002 0 005.999 7H9a1 1 0 010 2H4a1 1 0 01-1-1V3a1 1 0 011-1zm.008 9.057a1 1 0 011.276.61A5.002 5.002 0 0014.001 13H11a1 1 0 110-2h5a1 1 0 011 1v5a1 1 0 11-2 0v-2.101a7.002 7.002 0 01-11.601-2.566 1 1 0 01.61-1.276z" clip-rule="evenodd"/>
                                            </svg>
                                            {$LANG.generatePassword.btnLabel}
                                        </button>
                                    </div>
                                    <div class="md:col-span-2">
                                        <div class="password-strength-meter">
                                            <div class="progress bg-gray-700 rounded-full h-2 overflow-hidden">
                                                <div class="progress-bar progress-bar-success progress-bar-striped h-full transition-all duration-500 ease-out" 
                                                     role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="passwordStrengthMeterBar">
                                                </div>
                                            </div>
                                            <p class="text-center text-sm text-text-light mt-2" id="passwordStrengthTextLabel">{$LANG.pwstrength}: {$LANG.pwstrengthenter}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            {if $securityquestions}
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-6">
                                <div class="md:col-span-2">
                                    <label for="inputSecurityQId" class="block text-sm font-medium text-white mb-2">
                                        {$LANG.clientareasecurityquestion} <span class="text-red-400">*</span>
                                    </label>
                                    <select name="securityqid" id="inputSecurityQId" class="input-dark w-full" required>
                                        <option value="">{$LANG.clientareasecurityquestion}</option>
                                        {foreach $securityquestions as $question}
                                            <option value="{$question.id}"{if $question.id eq $securityqid} selected{/if}>
                                                {$question.question}
                                            </option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="md:col-span-2">
                                    <label for="inputSecurityQAns" class="block text-sm font-medium text-white mb-2">
                                        {$LANG.clientareasecurityanswer} <span class="text-red-400">*</span>
                                    </label>
                                    <div class="relative">
                                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                            <i class="fas fa-lock text-text-light"></i>
                                        </div>
                                        <input type="password" name="securityqans" id="inputSecurityQAns" 
                                               class="input-dark w-full pl-10" 
                                               placeholder="{$LANG.clientareasecurityanswer}" 
                                               autocomplete="off" required>
                                    </div>
                                </div>
                            </div>
                            {/if}
                        </div>
                    </div>

                    <!-- Marketing Preferences -->
                    {if $showMarketingEmailOptIn}
                        <div class="card-dark">
                            <h2 class="text-2xl font-orbitron font-semibold text-white mb-6 flex items-center">
                                <svg class="w-6 h-6 mr-3 text-green-400" fill="currentColor" viewBox="0 0 20 20">
                                    <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                                    <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                                </svg>
                                {$LANG.emailMarketing.joinOurMailingList}
                            </h2>
                            <div class="space-y-4">
                                <p class="text-text-light">{$marketingEmailOptInMessage}</p>
                                <div class="flex items-center">
                                    <input type="checkbox" name="marketingoptin" value="1"{if $marketingEmailOptIn} checked{/if} 
                                           id="marketing-emails" 
                                           class="w-4 h-4 text-neon-green bg-dark-surface border-gray-600 rounded focus:ring-neon-green focus:ring-2">
                                    <label for="marketing-emails" class="ml-3 text-text-light">
                                        {$LANG.yes}, I would like to receive promotional emails about new services, special offers, and updates.
                                    </label>
                                </div>
                            </div>
                        </div>
                    {/if}

                    <!-- CAPTCHA -->
                    {include file="$template/includes/captcha.tpl"}

                    <!-- Terms and Conditions -->
                    {if $accepttos}
                        <div class="card-dark">
                            <h2 class="text-2xl font-orbitron font-semibold text-white mb-6 flex items-center">
                                <svg class="w-6 h-6 mr-3 text-orange-400" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M6 2a2 2 0 00-2 2v12a2 2 0 002 2h8a2 2 0 002-2V7.414A2 2 0 0015.414 6L12 2.586A2 2 0 0010.586 2H6zm5 6a1 1 0 10-2 0v3.586l-1.293-1.293a1 1 0 10-1.414 1.414l3 3a1 1 0 001.414 0l3-3a1 1 0 00-1.414-1.414L11 11.586V8z" clip-rule="evenodd"/>
                                </svg>
                                {$LANG.ordertos}
                            </h2>
                            <div class="space-y-4">
                                <div class="flex items-start">
                                    <input type="checkbox" name="accepttos" value="1" required id="accept-tos" 
                                           class="w-4 h-4 mt-1 text-neon-green bg-dark-surface border-gray-600 rounded focus:ring-neon-green focus:ring-2 accepttos">
                                    <label for="accept-tos" class="ml-3 text-text-light">
                                        {$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank" class="text-neon-green hover:text-electric-blue underline">{$LANG.ordertos}</a>
                                    </label>
                                </div>
                            </div>
                        </div>
                    {/if}

                    <!-- Submit Button -->
                    <div class="text-center">
                        <button type="submit" class="btn-primary text-lg px-12 py-4 shadow-xl{$captcha->getButtonClass($captchaForm)}">
                            <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-8.293l-3-3a1 1 0 00-1.414 0l-3 3a1 1 0 001.414 1.414L9 9.414V13a1 1 0 102 0V9.414l1.293 1.293a1 1 0 001.414-1.414z" clip-rule="evenodd"/>
                            </svg>
                            {$LANG.clientregistertitle}
                        </button>
                        <p class="text-text-light text-sm mt-4">
                            Already have an account? 
                            <a href="{$WEB_ROOT}/clientarea.php" class="text-neon-green hover:text-electric-blue transition-colors duration-300">
                                Sign in here
                            </a>
                        </p>
                    </div>
                </form>
            </div>
            {/if}
        </div>
    </div>
</div>

<script>
// Password visibility toggle
function togglePasswordVisibility(fieldId, button) {
    const field = document.getElementById(fieldId);
    const icon = button.querySelector('svg');
    
    if (field.type === 'password') {
        field.type = 'text';
        icon.innerHTML = `
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.878 9.878L8.464 8.464l1.414-1.414M9.878 9.878l6.364-6.364L17.656 2.1"/>
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3l18 18"/>
        `;
    } else {
        field.type = 'password';
        icon.innerHTML = `
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/>
        `;
    }
}

// Password confirmation check
document.addEventListener('DOMContentLoaded', function() {
    const confirmPasswordField = document.getElementById('inputNewPassword2');
    const passwordField = document.getElementById('inputNewPassword1');
    
    if (confirmPasswordField && passwordField) {
        confirmPasswordField.addEventListener('input', function() {
            const password = passwordField.value;
            const confirmPassword = this.value;
            const matchElement = document.getElementById('password-match');
            
            if (confirmPassword.length === 0) {
                matchElement.textContent = '';
                matchElement.className = '';
            } else if (password === confirmPassword) {
                matchElement.textContent = '✓ Passwords match';
                matchElement.className = 'text-green-400';
            } else {
                matchElement.textContent = '✗ Passwords do not match';
                matchElement.className = 'text-red-400';
            }
        });
    }
});

// Enhanced password strength indicator for WHMCS compatibility
function registerFormPasswordStrengthFeedback() {
    const password = document.getElementById('inputNewPassword1').value;
    const strengthBar = document.getElementById('passwordStrengthMeterBar');
    const strengthText = document.getElementById('passwordStrengthTextLabel');
    
    if (!strengthBar || !strengthText) return;
    
    let score = 0;
    let feedback = window.langPasswordStrength + ': ';
    
    // Calculate strength
    if (password.length >= 8) score += 20;
    if (password.match(/[a-z]/)) score += 20;
    if (password.match(/[A-Z]/)) score += 20;
    if (password.match(/[0-9]/)) score += 20;
    if (password.match(/[^a-zA-Z0-9]/)) score += 20;
    
    // Update progress bar
    strengthBar.style.width = score + '%';
    strengthBar.setAttribute('aria-valuenow', score);
    
    // Update classes and text
    strengthBar.className = 'progress-bar h-full transition-all duration-500 ease-out';
    
    if (score === 0) {
        feedback += window.langPasswordStrength || 'Enter a password';
        strengthText.className = 'text-center text-sm text-text-light mt-2';
    } else if (score <= 40) {
        feedback += window.langPasswordWeak || 'Weak';
        strengthBar.className += ' bg-red-500';
        strengthText.className = 'text-center text-sm text-red-400 mt-2';
    } else if (score <= 60) {
        feedback += window.langPasswordModerate || 'Moderate';
        strengthBar.className += ' bg-yellow-500';
        strengthText.className = 'text-center text-sm text-yellow-400 mt-2';
    } else {
        feedback += window.langPasswordStrong || 'Strong';
        strengthBar.className += ' bg-green-500';
        strengthText.className = 'text-center text-sm text-green-400 mt-2';
    }
    
    strengthText.textContent = feedback;
}

// Style custom fields to match template
document.addEventListener('DOMContentLoaded', function() {
    // Style custom field inputs to match DoubleSpeedHost theme
    const customFieldInputs = document.querySelectorAll('.custom-field-input input, .custom-field-input select, .custom-field-input textarea');
    customFieldInputs.forEach(function(input) {
        if (!input.classList.contains('input-dark')) {
            input.classList.add('input-dark', 'w-full');
        }
    });
    
    // Style checkboxes in custom fields
    const customFieldCheckboxes = document.querySelectorAll('.custom-field-input input[type="checkbox"]');
    customFieldCheckboxes.forEach(function(checkbox) {
        checkbox.classList.remove('input-dark', 'w-full');
        checkbox.classList.add('w-4', 'h-4', 'text-neon-green', 'bg-dark-surface', 'border-gray-600', 'rounded', 'focus:ring-neon-green', 'focus:ring-2');
    });
    
    // Handle WHMCS-specific field styling
    const formControls = document.querySelectorAll('.field.form-control');
    formControls.forEach(function(field) {
        field.classList.add('input-dark');
    });
    
    // Ensure proper integration with WHMCS password strength
    const passwordField = document.getElementById('inputNewPassword1');
    if (passwordField && typeof registerFormPasswordStrengthFeedback === 'function') {
        passwordField.addEventListener('keyup', registerFormPasswordStrengthFeedback);
    }
});
</script>

{include file="$template/footer.tpl"}
