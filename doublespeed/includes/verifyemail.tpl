{* Email Verification Component *}
{* Usage: {include file="$template/includes/verifyemail.tpl" email="user@example.com" type="verification" dismissible=true} *}

{assign var="verificationType" value=$type|default:"verification"}
{assign var="userEmail" value=$email|default:$clientsdetails.email}

{if $userEmail && ($showVerification || $emailverification)}
    <div class="mb-6">
        <div class="bg-yellow-900/50 border border-yellow-500 rounded-lg p-4">
            <div class="flex items-start">
                <div class="flex-shrink-0">
                    <i class="fas fa-envelope text-yellow-400 text-lg"></i>
                </div>
                <div class="ml-3 flex-1">
                    <h3 class="text-sm font-medium text-yellow-100">
                        {if $verificationType == "verification"}
                            Email Verification Required
                        {elseif $verificationType == "pending"}
                            Email Verification Pending
                        {elseif $verificationType == "expired"}
                            Email Verification Expired
                        {else}
                            Email Verification
                        {/if}
                    </h3>
                    <div class="text-sm text-yellow-200 mt-1">
                        {if $verificationType == "verification"}
                            Please verify your email address <strong>{$userEmail}</strong> to complete your account setup and access all features.
                        {elseif $verificationType == "pending"}
                            We've sent a verification email to <strong>{$userEmail}</strong>. Please check your inbox and click the verification link.
                        {elseif $verificationType == "expired"}
                            Your email verification link has expired. Please request a new verification email.
                        {else}
                            {if $message}
                                {$message}
                            {else}
                                Please verify your email address <strong>{$userEmail}</strong>.
                            {/if}
                        {/if}
                    </div>
                    
                    {* Action Buttons *}
                    <div class="mt-4 flex flex-wrap gap-3">
                        {if $verificationType == "verification" || $verificationType == "expired"}
                            <button type="button" onclick="resendVerificationEmail()" class="inline-flex items-center px-3 py-2 border border-yellow-500 text-sm leading-4 font-medium rounded-md text-yellow-100 bg-yellow-900/30 hover:bg-yellow-800/30 focus:outline-none focus:ring-2 focus:ring-yellow-500 transition-colors duration-200">
                                <i class="fas fa-paper-plane mr-2"></i>
                                {if $verificationType == "expired"}Resend Verification Email{else}Send Verification Email{/if}
                            </button>
                        {/if}
                        
                        {if $verificationType == "pending"}
                            <button type="button" onclick="resendVerificationEmail()" class="inline-flex items-center px-3 py-2 border border-yellow-500 text-sm leading-4 font-medium rounded-md text-yellow-100 bg-yellow-900/30 hover:bg-yellow-800/30 focus:outline-none focus:ring-2 focus:ring-yellow-500 transition-colors duration-200">
                                <i class="fas fa-redo mr-2"></i>
                                Resend Email
                            </button>
                        {/if}
                        
                        <a href="{$WEB_ROOT}/clientarea.php?action=details" class="inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md text-yellow-900 bg-yellow-400 hover:bg-yellow-300 focus:outline-none focus:ring-2 focus:ring-yellow-500 transition-colors duration-200">
                            <i class="fas fa-user-edit mr-2"></i>
                            Update Email
                        </a>
                    </div>
                    
                    {* Help Text *}
                    <div class="mt-3 text-xs text-yellow-300">
                        <p>
                            <i class="fas fa-info-circle mr-1"></i>
                            Can't find the email? Check your spam folder or add our domain to your safe sender list.
                        </p>
                    </div>
                </div>
                
                {* Dismiss Button *}
                {if $dismissible}
                    <div class="ml-auto pl-3">
                        <button type="button" class="inline-flex rounded-md p-1.5 text-yellow-400 hover:bg-yellow-800 focus:outline-none transition-colors duration-200" onclick="this.parentElement.parentElement.parentElement.remove()">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                {/if}
            </div>
        </div>
    </div>
{/if}

{* Success state for verified email *}
{if $emailVerified}
    <div class="mb-6">
        <div class="bg-green-900/50 border border-green-500 rounded-lg p-4">
            <div class="flex items-center">
                <div class="flex-shrink-0">
                    <i class="fas fa-check-circle text-green-400 text-lg"></i>
                </div>
                <div class="ml-3">
                    <h3 class="text-sm font-medium text-green-100">
                        Email Verified Successfully
                    </h3>
                    <div class="text-sm text-green-200 mt-1">
                        Your email address <strong>{$userEmail}</strong> has been verified. You now have full access to all account features.
                    </div>
                </div>
            </div>
        </div>
    </div>
{/if}

{* JavaScript for email verification functionality *}
<script>
function resendVerificationEmail() {
    // Show loading state
    const button = event.target.closest('button');
    const originalText = button.innerHTML;
    button.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i>Sending...';
    button.disabled = true;
    
    // Make AJAX request to resend verification email
    fetch('{$WEB_ROOT}/includes/verifyemail.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-Requested-With': 'XMLHttpRequest'
        },
        body: JSON.stringify({
            action: 'resend',
            email: '{$userEmail}'
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // Show success message
            button.innerHTML = '<i class="fas fa-check mr-2"></i>Email Sent!';
            button.classList.remove('border-yellow-500', 'text-yellow-100', 'bg-yellow-900/30', 'hover:bg-yellow-800/30');
            button.classList.add('border-green-500', 'text-green-100', 'bg-green-900/30');
            
            // Reset button after 3 seconds
            setTimeout(() => {
                button.innerHTML = originalText;
                button.disabled = false;
                button.classList.remove('border-green-500', 'text-green-100', 'bg-green-900/30');
                button.classList.add('border-yellow-500', 'text-yellow-100', 'bg-yellow-900/30', 'hover:bg-yellow-800/30');
            }, 3000);
        } else {
            // Show error state
            button.innerHTML = '<i class="fas fa-exclamation-triangle mr-2"></i>Error - Try Again';
            button.classList.remove('border-yellow-500', 'text-yellow-100', 'bg-yellow-900/30');
            button.classList.add('border-red-500', 'text-red-100', 'bg-red-900/30');
            
            // Reset button after 3 seconds
            setTimeout(() => {
                button.innerHTML = originalText;
                button.disabled = false;
                button.classList.remove('border-red-500', 'text-red-100', 'bg-red-900/30');
                button.classList.add('border-yellow-500', 'text-yellow-100', 'bg-yellow-900/30', 'hover:bg-yellow-800/30');
            }, 3000);
        }
    })
    .catch(error => {
        console.error('Error:', error);
        button.innerHTML = originalText;
        button.disabled = false;
    });
}
</script>