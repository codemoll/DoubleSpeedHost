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
            
            <form method="post" action="{$WEB_ROOT}/register.php" class="space-y-8" id="registration-form">
                {if $token}
                    <input type="hidden" name="token" value="{$token}">
                {/if}
                
                <!-- Personal Information Section -->
                <div class="card-dark">
                    <h2 class="text-2xl font-orbitron font-semibold text-white mb-6 flex items-center">
                        <svg class="w-6 h-6 mr-3 text-neon-green" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"/>
                        </svg>
                        Personal Information
                    </h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-sm font-medium text-white mb-2">First Name *</label>
                            <input type="text" name="firstname" required class="input-dark w-full" 
                                   placeholder="Enter your first name" 
                                   value="{if $smarty.post.firstname}{$smarty.post.firstname}{/if}">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-white mb-2">Last Name *</label>
                            <input type="text" name="lastname" required class="input-dark w-full" 
                                   placeholder="Enter your last name"
                                   value="{if $smarty.post.lastname}{$smarty.post.lastname}{/if}">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-white mb-2">Email Address *</label>
                            <input type="email" name="email" required class="input-dark w-full" 
                                   placeholder="your@email.com"
                                   value="{if $smarty.post.email}{$smarty.post.email}{/if}">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-white mb-2">Phone Number *</label>
                            <input type="tel" name="phonenumber" required class="input-dark w-full" 
                                   placeholder="+1 (555) 123-4567"
                                   value="{if $smarty.post.phonenumber}{$smarty.post.phonenumber}{/if}">
                        </div>
                    </div>
                </div>

                <!-- Billing Address Section -->
                <div class="card-dark">
                    <h2 class="text-2xl font-orbitron font-semibold text-white mb-6 flex items-center">
                        <svg class="w-6 h-6 mr-3 text-electric-blue" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clip-rule="evenodd"/>
                        </svg>
                        Billing Address
                    </h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div class="md:col-span-2">
                            <label class="block text-sm font-medium text-white mb-2">Company Name <span class="text-text-light">(Optional)</span></label>
                            <input type="text" name="companyname" class="input-dark w-full" 
                                   placeholder="Your Company Name"
                                   value="{if $smarty.post.companyname}{$smarty.post.companyname}{/if}">
                        </div>
                        <div class="md:col-span-2">
                            <label class="block text-sm font-medium text-white mb-2">Street Address *</label>
                            <input type="text" name="address1" required class="input-dark w-full" 
                                   placeholder="123 Main Street"
                                   value="{if $smarty.post.address1}{$smarty.post.address1}{/if}">
                        </div>
                        <div class="md:col-span-2">
                            <label class="block text-sm font-medium text-white mb-2">Street Address 2 <span class="text-text-light">(Optional)</span></label>
                            <input type="text" name="address2" class="input-dark w-full" 
                                   placeholder="Apartment, suite, etc."
                                   value="{if $smarty.post.address2}{$smarty.post.address2}{/if}">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-white mb-2">City *</label>
                            <input type="text" name="city" required class="input-dark w-full" 
                                   placeholder="Enter your city"
                                   value="{if $smarty.post.city}{$smarty.post.city}{/if}">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-white mb-2">State/Province *</label>
                            <input type="text" name="state" required class="input-dark w-full" 
                                   placeholder="State or Province"
                                   value="{if $smarty.post.state}{$smarty.post.state}{/if}">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-white mb-2">Postal Code *</label>
                            <input type="text" name="postcode" required class="input-dark w-full" 
                                   placeholder="ZIP/Postal Code"
                                   value="{if $smarty.post.postcode}{$smarty.post.postcode}{/if}">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-white mb-2">Country *</label>
                            <select name="country" required class="input-dark w-full">
                                <option value="">Select Country</option>
                                {if $countries}
                                    {foreach from=$countries key=code item=country}
                                        <option value="{$code}" {if $smarty.post.country == $code}selected{/if}>
                                            {$country}
                                        </option>
                                    {/foreach}
                                {else}
                                    <option value="US" {if $smarty.post.country == 'US'}selected{/if}>United States</option>
                                    <option value="CA" {if $smarty.post.country == 'CA'}selected{/if}>Canada</option>
                                    <option value="GB" {if $smarty.post.country == 'GB'}selected{/if}>United Kingdom</option>
                                    <option value="AU" {if $smarty.post.country == 'AU'}selected{/if}>Australia</option>
                                    <option value="DE" {if $smarty.post.country == 'DE'}selected{/if}>Germany</option>
                                    <option value="FR" {if $smarty.post.country == 'FR'}selected{/if}>France</option>
                                    <option value="NL" {if $smarty.post.country == 'NL'}selected{/if}>Netherlands</option>
                                {/if}
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Additional Information Section -->
                <div class="card-dark">
                    <h2 class="text-2xl font-orbitron font-semibold text-white mb-6 flex items-center">
                        <svg class="w-6 h-6 mr-3 text-cyber-purple" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M4 4a2 2 0 00-2 2v4a2 2 0 002 2V6h10a2 2 0 00-2-2H4zm2 6a2 2 0 012-2h8a2 2 0 012 2v4a2 2 0 01-2 2H8a2 2 0 01-2-2v-4zm6 4a2 2 0 100-4 2 2 0 000 4z" clip-rule="evenodd"/>
                        </svg>
                        Additional Information
                    </h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-sm font-medium text-white mb-2">Default Currency</label>
                            <select name="currency" class="input-dark w-full">
                                <option value="1" {if $smarty.post.currency == '1'}selected{/if}>USD - US Dollars</option>
                                <option value="2" {if $smarty.post.currency == '2'}selected{/if}>EUR - Euros</option>
                                <option value="3" {if $smarty.post.currency == '3'}selected{/if}>GBP - British Pounds</option>
                                <option value="4" {if $smarty.post.currency == '4'}selected{/if}>CAD - Canadian Dollars</option>
                                <option value="5" {if $smarty.post.currency == '5'}selected{/if}>AUD - Australian Dollars</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Account Security Section -->
                <div class="card-dark">
                    <h2 class="text-2xl font-orbitron font-semibold text-white mb-6 flex items-center">
                        <svg class="w-6 h-6 mr-3 text-yellow-400" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                        </svg>
                        Account Security
                    </h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-sm font-medium text-white mb-2">Password *</label>
                            <div class="relative">
                                <input type="password" name="password" required class="input-dark w-full pr-12" 
                                       placeholder="Enter a strong password" id="password-field">
                                <button type="button" class="absolute inset-y-0 right-0 flex items-center pr-3" 
                                        onclick="togglePasswordVisibility('password-field', this)">
                                    <svg class="w-5 h-5 text-text-light" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/>
                                    </svg>
                                </button>
                            </div>
                            <div class="mt-2">
                                <div class="text-xs text-text-light mb-1">Password Strength:</div>
                                <div class="flex space-x-1">
                                    <div class="h-2 bg-gray-600 rounded flex-1" id="strength-bar-1"></div>
                                    <div class="h-2 bg-gray-600 rounded flex-1" id="strength-bar-2"></div>
                                    <div class="h-2 bg-gray-600 rounded flex-1" id="strength-bar-3"></div>
                                    <div class="h-2 bg-gray-600 rounded flex-1" id="strength-bar-4"></div>
                                </div>
                                <div class="text-xs mt-1" id="strength-text">Enter a password</div>
                            </div>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-white mb-2">Confirm Password *</label>
                            <div class="relative">
                                <input type="password" name="password2" required class="input-dark w-full pr-12" 
                                       placeholder="Confirm your password" id="confirm-password-field">
                                <button type="button" class="absolute inset-y-0 right-0 flex items-center pr-3" 
                                        onclick="togglePasswordVisibility('confirm-password-field', this)">
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
                            <button type="button" class="btn-outline text-sm" onclick="generatePassword()">
                                <svg class="w-4 h-4 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M4 2a1 1 0 011 1v2.101a7.002 7.002 0 0111.601 2.566 1 1 0 11-1.885.666A5.002 5.002 0 005.999 7H9a1 1 0 010 2H4a1 1 0 01-1-1V3a1 1 0 011-1zm.008 9.057a1 1 0 011.276.61A5.002 5.002 0 0014.001 13H11a1 1 0 110-2h5a1 1 0 011 1v5a1 1 0 11-2 0v-2.101a7.002 7.002 0 01-11.601-2.566 1 1 0 01.61-1.276z" clip-rule="evenodd"/>
                                </svg>
                                Generate Secure Password
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Marketing Preferences -->
                <div class="card-dark">
                    <h2 class="text-2xl font-orbitron font-semibold text-white mb-6 flex items-center">
                        <svg class="w-6 h-6 mr-3 text-green-400" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                            <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                        </svg>
                        Mailing List Subscription
                    </h2>
                    <div class="space-y-4">
                        <div class="flex items-center">
                            <input type="checkbox" name="marketing_emails_opt_in" value="1" id="marketing-emails" 
                                   class="w-4 h-4 text-neon-green bg-dark-surface border-gray-600 rounded focus:ring-neon-green focus:ring-2">
                            <label for="marketing-emails" class="ml-3 text-text-light">
                                Yes, I would like to receive promotional emails about new services, special offers, and updates from DoubleSpeed Host.
                            </label>
                        </div>
                        <p class="text-xs text-text-light">
                            You can unsubscribe at any time. We respect your privacy and will never share your information with third parties.
                        </p>
                    </div>
                </div>

                <!-- Terms and Conditions -->
                <div class="card-dark">
                    <h2 class="text-2xl font-orbitron font-semibold text-white mb-6 flex items-center">
                        <svg class="w-6 h-6 mr-3 text-orange-400" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M6 2a2 2 0 00-2 2v12a2 2 0 002 2h8a2 2 0 002-2V7.414A2 2 0 0015.414 6L12 2.586A2 2 0 0010.586 2H6zm5 6a1 1 0 10-2 0v3.586l-1.293-1.293a1 1 0 10-1.414 1.414l3 3a1 1 0 001.414 0l3-3a1 1 0 00-1.414-1.414L11 11.586V8z" clip-rule="evenodd"/>
                        </svg>
                        Terms of Service Acceptance
                    </h2>
                    <div class="space-y-4">
                        <div class="flex items-start">
                            <input type="checkbox" name="accepttos" value="1" required id="accept-tos" 
                                   class="w-4 h-4 mt-1 text-neon-green bg-dark-surface border-gray-600 rounded focus:ring-neon-green focus:ring-2">
                            <label for="accept-tos" class="ml-3 text-text-light">
                                I have read and agree to the <a href="{$WEB_ROOT}/legal.php?page=terms-of-service" target="_blank" class="text-neon-green hover:text-electric-blue underline">Terms of Service</a> and <a href="{$WEB_ROOT}/legal.php?page=privacy-policy" target="_blank" class="text-neon-green hover:text-electric-blue underline">Privacy Policy</a>. *
                            </label>
                        </div>
                    </div>
                </div>

                {if $recaptchahtml}
                    <div class="card-dark">
                        <h2 class="text-lg font-semibold text-white mb-4">Security Verification</h2>
                        {$recaptchahtml}
                    </div>
                {/if}

                <!-- Submit Button -->
                <div class="text-center">
                    <button type="submit" class="btn-primary text-lg px-12 py-4 shadow-xl">
                        <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-8.293l-3-3a1 1 0 00-1.414 0l-3 3a1 1 0 001.414 1.414L9 9.414V13a1 1 0 102 0V9.414l1.293 1.293a1 1 0 001.414-1.414z" clip-rule="evenodd"/>
                        </svg>
                        Create My Account
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

// Password strength indicator
document.getElementById('password-field').addEventListener('input', function() {
    const password = this.value;
    const strength = calculatePasswordStrength(password);
    updatePasswordStrength(strength);
});

// Password confirmation check
document.getElementById('confirm-password-field').addEventListener('input', function() {
    const password = document.getElementById('password-field').value;
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

function calculatePasswordStrength(password) {
    let score = 0;
    if (password.length >= 8) score++;
    if (password.match(/[a-z]/)) score++;
    if (password.match(/[A-Z]/)) score++;
    if (password.match(/[0-9]/)) score++;
    if (password.match(/[^a-zA-Z0-9]/)) score++;
    return score;
}

function updatePasswordStrength(strength) {
    const bars = ['strength-bar-1', 'strength-bar-2', 'strength-bar-3', 'strength-bar-4'];
    const textElement = document.getElementById('strength-text');
    
    // Reset bars
    bars.forEach(bar => {
        document.getElementById(bar).className = 'h-2 bg-gray-600 rounded flex-1';
    });
    
    if (strength === 0) {
        textElement.textContent = 'Enter a password';
        textElement.className = 'text-xs mt-1 text-text-light';
    } else if (strength <= 2) {
        textElement.textContent = 'Weak password';
        textElement.className = 'text-xs mt-1 text-red-400';
        bars.slice(0, 1).forEach(bar => {
            document.getElementById(bar).className = 'h-2 bg-red-500 rounded flex-1';
        });
    } else if (strength === 3) {
        textElement.textContent = 'Good password';
        textElement.className = 'text-xs mt-1 text-yellow-400';
        bars.slice(0, 2).forEach(bar => {
            document.getElementById(bar).className = 'h-2 bg-yellow-500 rounded flex-1';
        });
    } else if (strength === 4) {
        textElement.textContent = 'Strong password';
        textElement.className = 'text-xs mt-1 text-green-400';
        bars.slice(0, 3).forEach(bar => {
            document.getElementById(bar).className = 'h-2 bg-green-500 rounded flex-1';
        });
    } else {
        textElement.textContent = 'Very strong password';
        textElement.className = 'text-xs mt-1 text-neon-green';
        bars.forEach(bar => {
            document.getElementById(bar).className = 'h-2 bg-neon-green rounded flex-1';
        });
    }
}

// Password generator
function generatePassword() {
    const length = 16;
    const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*";
    let password = "";
    for (let i = 0, n = charset.length; i < length; ++i) {
        password += charset.charAt(Math.floor(Math.random() * n));
    }
    
    document.getElementById('password-field').value = password;
    document.getElementById('confirm-password-field').value = password;
    
    // Trigger strength calculation
    updatePasswordStrength(calculatePasswordStrength(password));
    document.getElementById('password-match').textContent = '✓ Passwords match';
    document.getElementById('password-match').className = 'text-green-400';
}
</script>

{include file="$template/footer.tpl"}
