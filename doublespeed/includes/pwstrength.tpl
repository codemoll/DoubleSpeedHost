{* Password Strength Meter Component *}
{* Usage: {include file="$template/includes/pwstrength.tpl" inputId="password" showRequirements=true} *}

{assign var="passwordInputId" value=$inputId|default:"password"}
{assign var="strengthId" value=$strengthId|default:"password-strength"}
{assign var="showReqs" value=$showRequirements|default:true}

<div class="password-strength-component mt-2">
    
    {* Strength Meter *}
    <div class="password-strength-meter mb-3">
        <div class="flex items-center justify-between mb-1">
            <span class="text-xs text-gray-400">
                {$LANG.passwordstrength|default:"Password Strength"}
            </span>
            <span id="{$strengthId}-label" class="text-xs font-medium text-gray-400">
                {$LANG.weak|default:"Weak"}
            </span>
        </div>
        
        <div class="w-full bg-gray-700 rounded-full h-2 overflow-hidden">
            <div id="{$strengthId}-bar" 
                 class="h-full bg-red-500 transition-all duration-300 rounded-full" 
                 style="width: 0%"></div>
        </div>
    </div>
    
    {* Password Requirements *}
    {if $showReqs}
        <div class="password-requirements space-y-1">
            <div class="text-xs text-gray-400 mb-2">
                {$LANG.passwordrequirements|default:"Password Requirements"}:
            </div>
            
            <div class="space-y-1">
                <div id="req-length" class="requirement flex items-center text-xs">
                    <i class="fas fa-times text-red-400 mr-2 w-3"></i>
                    <span class="text-gray-400">
                        {$LANG.minlength|default:"At least 8 characters"}
                    </span>
                </div>
                
                <div id="req-uppercase" class="requirement flex items-center text-xs">
                    <i class="fas fa-times text-red-400 mr-2 w-3"></i>
                    <span class="text-gray-400">
                        {$LANG.uppercase|default:"One uppercase letter"}
                    </span>
                </div>
                
                <div id="req-lowercase" class="requirement flex items-center text-xs">
                    <i class="fas fa-times text-red-400 mr-2 w-3"></i>
                    <span class="text-gray-400">
                        {$LANG.lowercase|default:"One lowercase letter"}
                    </span>
                </div>
                
                <div id="req-number" class="requirement flex items-center text-xs">
                    <i class="fas fa-times text-red-400 mr-2 w-3"></i>
                    <span class="text-gray-400">
                        {$LANG.number|default:"One number"}
                    </span>
                </div>
                
                <div id="req-special" class="requirement flex items-center text-xs">
                    <i class="fas fa-times text-red-400 mr-2 w-3"></i>
                    <span class="text-gray-400">
                        {$LANG.specialchar|default:"One special character"}
                    </span>
                </div>
            </div>
        </div>
    {/if}
    
</div>

{* JavaScript for password strength checking *}
<script>
function checkPasswordStrength(password, strengthId) {
    const strengthBar = document.getElementById(strengthId + '-bar');
    const strengthLabel = document.getElementById(strengthId + '-label');
    
    if (!strengthBar || !strengthLabel) return;
    
    let score = 0;
    let feedback = '';
    let color = '';
    
    // Length check
    if (password.length >= 8) score += 1;
    if (password.length >= 12) score += 1;
    
    // Character variety checks
    if (/[a-z]/.test(password)) score += 1;
    if (/[A-Z]/.test(password)) score += 1;
    if (/[0-9]/.test(password)) score += 1;
    if (/[^A-Za-z0-9]/.test(password)) score += 1;
    
    // Determine strength level
    if (score < 2) {
        feedback = '{$LANG.veryweak|default:"Very Weak"}';
        color = 'bg-red-500';
    } else if (score < 3) {
        feedback = '{$LANG.weak|default:"Weak"}';
        color = 'bg-red-400';
    } else if (score < 4) {
        feedback = '{$LANG.fair|default:"Fair"}';
        color = 'bg-yellow-500';
    } else if (score < 6) {
        feedback = '{$LANG.good|default:"Good"}';
        color = 'bg-green-500';
    } else {
        feedback = '{$LANG.strong|default:"Strong"}';
        color = 'bg-green-400';
    }
    
    // Update UI
    const percentage = Math.min((score / 6) * 100, 100);
    strengthBar.style.width = percentage + '%';
    strengthBar.className = 'h-full transition-all duration-300 rounded-full ' + color;
    strengthLabel.textContent = feedback;
    strengthLabel.className = 'text-xs font-medium ' + (score >= 4 ? 'text-green-400' : score >= 3 ? 'text-yellow-400' : 'text-red-400');
    
    // Update requirements if visible
    updateRequirements(password);
}

function updateRequirements(password) {
    const requirements = [
        { id: 'req-length', test: password.length >= 8 },
        { id: 'req-uppercase', test: /[A-Z]/.test(password) },
        { id: 'req-lowercase', test: /[a-z]/.test(password) },
        { id: 'req-number', test: /[0-9]/.test(password) },
        { id: 'req-special', test: /[^A-Za-z0-9]/.test(password) }
    ];
    
    requirements.forEach(req => {
        const element = document.getElementById(req.id);
        if (element) {
            const icon = element.querySelector('i');
            const text = element.querySelector('span');
            
            if (req.test) {
                icon.className = 'fas fa-check text-green-400 mr-2 w-3';
                text.className = 'text-green-400';
            } else {
                icon.className = 'fas fa-times text-red-400 mr-2 w-3';
                text.className = 'text-gray-400';
            }
        }
    });
}

// Attach event listener to password input
document.addEventListener('DOMContentLoaded', function() {
    const passwordInput = document.getElementById('{$passwordInputId}');
    if (passwordInput) {
        passwordInput.addEventListener('input', function() {
            checkPasswordStrength(this.value, '{$strengthId}');
        });
        
        // Initial check
        if (passwordInput.value) {
            checkPasswordStrength(passwordInput.value, '{$strengthId}');
        }
    }
});

// Make function globally available
window.checkPasswordStrength = checkPasswordStrength;
</script>

{* CSS for password strength animations *}
<style>
.requirement i {
    transition: all 0.2s ease;
}

.requirement span {
    transition: color 0.2s ease;
}

.password-strength-meter .h-full {
    transition: width 0.3s ease, background-color 0.3s ease;
}
</style>