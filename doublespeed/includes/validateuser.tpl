{* Validate User Component *}
{* Usage: {include file="$template/includes/validateuser.tpl" type="email" message="Please verify your email"} *}

{assign var="validationType" value=$type|default:"email"}
{assign var="containerClass" value=$class|default:""}

<div class="validate-user-component {$containerClass}">
    
    {if $validationType == 'email'}
        {* Email Validation *}
        <div class="bg-yellow-900/50 border border-yellow-500 rounded-lg p-6 mb-6">
            <div class="flex items-start">
                <div class="flex-shrink-0">
                    <i class="fas fa-envelope text-yellow-400 text-2xl"></i>
                </div>
                <div class="ml-4 flex-1">
                    <h3 class="text-lg font-semibold text-yellow-100 mb-2">
                        {$LANG.emailverificationrequired|default:"Email Verification Required"}
                    </h3>
                    <p class="text-yellow-200 text-sm mb-4">
                        {$message|default:$LANG.emailverificationdesc|default:"Please verify your email address to continue. We've sent a verification link to your email."}
                    </p>
                    
                    {if $email}
                        <p class="text-yellow-300 text-sm mb-4">
                            <strong>{$LANG.emailaddress|default:"Email"}:</strong> {$email}
                        </p>
                    {/if}
                    
                    <div class="flex flex-col sm:flex-row sm:items-center space-y-2 sm:space-y-0 sm:space-x-3">
                        <button type="button" 
                                onclick="resendVerificationEmail()" 
                                class="px-4 py-2 bg-yellow-600 text-white font-medium rounded-lg hover:bg-yellow-700 focus:outline-none focus:ring-2 focus:ring-yellow-500 transition-colors duration-200">
                            <i class="fas fa-paper-plane mr-2"></i>
                            {$LANG.resendverification|default:"Resend Verification"}
                        </button>
                        
                        <a href="{$WEB_ROOT}/clientarea.php?action=details" 
                           class="px-4 py-2 bg-gray-700 text-gray-300 font-medium rounded-lg hover:bg-gray-600 transition-colors duration-200 text-center">
                            <i class="fas fa-edit mr-2"></i>
                            {$LANG.changeemail|default:"Change Email"}
                        </a>
                    </div>
                </div>
            </div>
        </div>
        
    {elseif $validationType == 'phone'}
        {* Phone Validation *}
        <div class="bg-blue-900/50 border border-blue-500 rounded-lg p-6 mb-6">
            <div class="flex items-start">
                <div class="flex-shrink-0">
                    <i class="fas fa-mobile-alt text-blue-400 text-2xl"></i>
                </div>
                <div class="ml-4 flex-1">
                    <h3 class="text-lg font-semibold text-blue-100 mb-2">
                        {$LANG.phoneverificationrequired|default:"Phone Verification Required"}
                    </h3>
                    <p class="text-blue-200 text-sm mb-4">
                        {$message|default:$LANG.phoneverificationdesc|default:"Please verify your phone number by entering the code we sent to your mobile device."}
                    </p>
                    
                    {if $phone}
                        <p class="text-blue-300 text-sm mb-4">
                            <strong>{$LANG.phonenumber|default:"Phone"}:</strong> {$phone}
                        </p>
                    {/if}
                    
                    <form method="post" class="space-y-4">
                        <div>
                            <label class="block text-sm font-medium text-blue-200 mb-2">
                                {$LANG.verificationcode|default:"Verification Code"}
                            </label>
                            <input type="text" 
                                   name="verification_code" 
                                   maxlength="6"
                                   placeholder="000000"
                                   class="w-32 px-4 py-2 bg-dark-surface border border-gray-600 rounded-lg text-white text-center font-mono tracking-widest focus:outline-none focus:border-blue-500 focus:ring-1 focus:ring-blue-500 transition-all duration-200">
                        </div>
                        
                        <div class="flex flex-col sm:flex-row sm:items-center space-y-2 sm:space-y-0 sm:space-x-3">
                            <button type="submit" 
                                    name="action" 
                                    value="verify_phone"
                                    class="px-4 py-2 bg-blue-600 text-white font-medium rounded-lg hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 transition-colors duration-200">
                                <i class="fas fa-check mr-2"></i>
                                {$LANG.verify|default:"Verify"}
                            </button>
                            
                            <button type="button" 
                                    onclick="resendPhoneCode()" 
                                    class="px-4 py-2 bg-gray-700 text-gray-300 font-medium rounded-lg hover:bg-gray-600 transition-colors duration-200">
                                <i class="fas fa-redo mr-2"></i>
                                {$LANG.resendcode|default:"Resend Code"}
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
    {elseif $validationType == 'account'}
        {* Account Activation *}
        <div class="bg-red-900/50 border border-red-500 rounded-lg p-6 mb-6">
            <div class="flex items-start">
                <div class="flex-shrink-0">
                    <i class="fas fa-user-lock text-red-400 text-2xl"></i>
                </div>
                <div class="ml-4 flex-1">
                    <h3 class="text-lg font-semibold text-red-100 mb-2">
                        {$LANG.accountpending|default:"Account Activation Required"}
                    </h3>
                    <p class="text-red-200 text-sm mb-4">
                        {$message|default:$LANG.accountactivationdesc|default:"Your account is pending activation. Please contact support or check your email for activation instructions."}
                    </p>
                    
                    <div class="flex flex-col sm:flex-row sm:items-center space-y-2 sm:space-y-0 sm:space-x-3">
                        <a href="{$WEB_ROOT}/contact.php" 
                           class="px-4 py-2 bg-red-600 text-white font-medium rounded-lg hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500 transition-colors duration-200 text-center">
                            <i class="fas fa-life-ring mr-2"></i>
                            {$LANG.contactsupport|default:"Contact Support"}
                        </a>
                        
                        <button type="button" 
                                onclick="resendActivation()" 
                                class="px-4 py-2 bg-gray-700 text-gray-300 font-medium rounded-lg hover:bg-gray-600 transition-colors duration-200">
                            <i class="fas fa-paper-plane mr-2"></i>
                            {$LANG.resendactivation|default:"Resend Activation"}
                        </button>
                    </div>
                </div>
            </div>
        </div>
        
    {elseif $validationType == 'twofa'}
        {* Two-Factor Authentication *}
        <div class="bg-purple-900/50 border border-purple-500 rounded-lg p-6 mb-6">
            <div class="flex items-start">
                <div class="flex-shrink-0">
                    <i class="fas fa-shield-alt text-purple-400 text-2xl"></i>
                </div>
                <div class="ml-4 flex-1">
                    <h3 class="text-lg font-semibold text-purple-100 mb-2">
                        {$LANG.twofaverificationrequired|default:"Two-Factor Authentication Required"}
                    </h3>
                    <p class="text-purple-200 text-sm mb-4">
                        {$message|default:$LANG.twofadesc|default:"Please enter your two-factor authentication code from your authenticator app."}
                    </p>
                    
                    <form method="post" class="space-y-4">
                        <div>
                            <label class="block text-sm font-medium text-purple-200 mb-2">
                                {$LANG.authenticationcode|default:"Authentication Code"}
                            </label>
                            <input type="text" 
                                   name="twofa_code" 
                                   maxlength="6"
                                   placeholder="000000"
                                   autocomplete="one-time-code"
                                   class="w-32 px-4 py-2 bg-dark-surface border border-gray-600 rounded-lg text-white text-center font-mono tracking-widest focus:outline-none focus:border-purple-500 focus:ring-1 focus:ring-purple-500 transition-all duration-200">
                        </div>
                        
                        <div class="flex flex-col sm:flex-row sm:items-center space-y-2 sm:space-y-0 sm:space-x-3">
                            <button type="submit" 
                                    name="action" 
                                    value="verify_twofa"
                                    class="px-4 py-2 bg-purple-600 text-white font-medium rounded-lg hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-purple-500 transition-colors duration-200">
                                <i class="fas fa-check mr-2"></i>
                                {$LANG.verify|default:"Verify"}
                            </button>
                            
                            <a href="{$WEB_ROOT}/clientarea.php?action=security" 
                               class="px-4 py-2 bg-gray-700 text-gray-300 font-medium rounded-lg hover:bg-gray-600 transition-colors duration-200 text-center">
                                <i class="fas fa-cog mr-2"></i>
                                {$LANG.managetwosfa|default:"Manage 2FA"}
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
    {else}
        {* Generic Validation *}
        <div class="bg-gray-900/50 border border-gray-500 rounded-lg p-6 mb-6">
            <div class="flex items-start">
                <div class="flex-shrink-0">
                    <i class="fas fa-exclamation-circle text-gray-400 text-2xl"></i>
                </div>
                <div class="ml-4 flex-1">
                    <h3 class="text-lg font-semibold text-gray-100 mb-2">
                        {$title|default:$LANG.validationrequired|default:"Validation Required"}
                    </h3>
                    <p class="text-gray-300 text-sm mb-4">
                        {$message|default:$LANG.validationdesc|default:"Additional validation is required to proceed."}
                    </p>
                    
                    {if $actions}
                        <div class="flex flex-col sm:flex-row sm:items-center space-y-2 sm:space-y-0 sm:space-x-3">
                            {$actions}
                        </div>
                    {/if}
                </div>
            </div>
        </div>
    {/if}
    
</div>

{* JavaScript for validation actions *}
<script>
function resendVerificationEmail() {
    // Show loading state
    const button = event.target;
    const originalText = button.innerHTML;
    button.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i>Sending...';
    button.disabled = true;
    
    // Submit request
    fetch(window.location.href, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'action=resend_email_verification'
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            button.innerHTML = '<i class="fas fa-check mr-2"></i>Sent!';
            setTimeout(() => {
                button.innerHTML = originalText;
                button.disabled = false;
            }, 3000);
        } else {
            button.innerHTML = originalText;
            button.disabled = false;
            alert(data.message || 'Failed to send verification email');
        }
    })
    .catch(() => {
        button.innerHTML = originalText;
        button.disabled = false;
        alert('Failed to send verification email');
    });
}

function resendPhoneCode() {
    const button = event.target;
    const originalText = button.innerHTML;
    button.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i>Sending...';
    button.disabled = true;
    
    fetch(window.location.href, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'action=resend_phone_code'
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            button.innerHTML = '<i class="fas fa-check mr-2"></i>Sent!';
            setTimeout(() => {
                button.innerHTML = originalText;
                button.disabled = false;
            }, 3000);
        } else {
            button.innerHTML = originalText;
            button.disabled = false;
            alert(data.message || 'Failed to send verification code');
        }
    })
    .catch(() => {
        button.innerHTML = originalText;
        button.disabled = false;
        alert('Failed to send verification code');
    });
}

function resendActivation() {
    const button = event.target;
    const originalText = button.innerHTML;
    button.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i>Sending...';
    button.disabled = true;
    
    fetch(window.location.href, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'action=resend_activation'
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            button.innerHTML = '<i class="fas fa-check mr-2"></i>Sent!';
            setTimeout(() => {
                button.innerHTML = originalText;
                button.disabled = false;
            }, 3000);
        } else {
            button.innerHTML = originalText;
            button.disabled = false;
            alert(data.message || 'Failed to send activation email');
        }
    })
    .catch(() => {
        button.innerHTML = originalText;
        button.disabled = false;
        alert('Failed to send activation email');
    });
}
</script>