{* Generate Password Component *}
{* Usage: {include file="$template/includes/generate-password.tpl" inputId="password" strengthId="strength"} *}

{assign var="passwordInputId" value=$inputId|default:"password"}
{assign var="strengthMetterId" value=$strengthId|default:"password-strength"}
{assign var="generateButtonId" value=$generateButtonId|default:"generate-password"}

<div class="generate-password-component">
    
    {* Password Generator Button *}
    <div class="flex items-center space-x-2 mb-3">
        <button type="button" 
                id="{$generateButtonId}"
                class="px-4 py-2 bg-neon-green/20 text-neon-green border border-neon-green/30 rounded-lg hover:bg-neon-green/30 focus:outline-none focus:ring-2 focus:ring-neon-green/50 transition-all duration-200 text-sm font-medium"
                onclick="generatePassword('{$passwordInputId}', '{$strengthMetterId}')">
            <i class="fas fa-key mr-2"></i>
            {$LANG.generatepassword|default:"Generate Password"}
        </button>
        
        <div class="text-xs text-gray-400">
            {$LANG.autogenpassword|default:"Click to generate a secure password"}
        </div>
    </div>
    
    {* Password Options *}
    <div class="password-options bg-dark-surface border border-gray-700 rounded-lg p-4 mb-3" style="display: none;">
        <h4 class="text-sm font-medium text-white mb-3">
            <i class="fas fa-cog mr-2"></i>
            {$LANG.passwordoptions|default:"Password Options"}
        </h4>
        
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            {* Length *}
            <div>
                <label class="block text-xs text-gray-400 mb-1">
                    {$LANG.passwordlength|default:"Length"}
                </label>
                <input type="range" 
                       id="password-length" 
                       min="8" 
                       max="32" 
                       value="16" 
                       class="w-full h-2 bg-gray-700 rounded-lg appearance-none cursor-pointer"
                       onchange="updatePasswordLength(this.value)">
                <div class="flex justify-between text-xs text-gray-500 mt-1">
                    <span>8</span>
                    <span id="length-display" class="text-neon-green font-medium">16</span>
                    <span>32</span>
                </div>
            </div>
            
            {* Character Types *}
            <div class="space-y-2">
                <label class="flex items-center">
                    <input type="checkbox" 
                           id="include-uppercase" 
                           checked 
                           class="rounded border-gray-600 bg-gray-700 text-neon-green focus:ring-neon-green focus:ring-2">
                    <span class="ml-2 text-xs text-gray-400">
                        {$LANG.uppercaseletters|default:"Uppercase Letters (A-Z)"}
                    </span>
                </label>
                
                <label class="flex items-center">
                    <input type="checkbox" 
                           id="include-lowercase" 
                           checked 
                           class="rounded border-gray-600 bg-gray-700 text-neon-green focus:ring-neon-green focus:ring-2">
                    <span class="ml-2 text-xs text-gray-400">
                        {$LANG.lowercaseletters|default:"Lowercase Letters (a-z)"}
                    </span>
                </label>
                
                <label class="flex items-center">
                    <input type="checkbox" 
                           id="include-numbers" 
                           checked 
                           class="rounded border-gray-600 bg-gray-700 text-neon-green focus:ring-neon-green focus:ring-2">
                    <span class="ml-2 text-xs text-gray-400">
                        {$LANG.numbers|default:"Numbers (0-9)"}
                    </span>
                </label>
                
                <label class="flex items-center">
                    <input type="checkbox" 
                           id="include-symbols" 
                           checked 
                           class="rounded border-gray-600 bg-gray-700 text-neon-green focus:ring-neon-green focus:ring-2">
                    <span class="ml-2 text-xs text-gray-400">
                        {$LANG.symbols|default:"Symbols (!@#$%^&*)"}
                    </span>
                </label>
            </div>
        </div>
        
        <div class="flex justify-end mt-4 space-x-2">
            <button type="button" 
                    class="px-3 py-1 text-xs text-gray-400 hover:text-white transition-colors duration-200"
                    onclick="togglePasswordOptions()">
                {$LANG.cancel|default:"Cancel"}
            </button>
            <button type="button" 
                    class="px-4 py-2 bg-neon-green text-black rounded-lg hover:bg-neon-green/80 focus:outline-none focus:ring-2 focus:ring-neon-green/50 transition-all duration-200 text-xs font-medium"
                    onclick="generatePasswordWithOptions('{$passwordInputId}', '{$strengthMetterId}')">
                {$LANG.generatepassword|default:"Generate"}
            </button>
        </div>
    </div>
    
</div>

{* JavaScript for password generation *}
<script>
function updatePasswordLength(value) {
    document.getElementById('length-display').textContent = value;
}

function togglePasswordOptions() {
    const options = document.querySelector('.password-options');
    if (options.style.display === 'none') {
        options.style.display = 'block';
    } else {
        options.style.display = 'none';
    }
}

function generatePassword(inputId, strengthId) {
    generatePasswordWithOptions(inputId, strengthId);
}

function generatePasswordWithOptions(inputId, strengthId) {
    const length = document.getElementById('password-length') ? parseInt(document.getElementById('password-length').value) : 16;
    const includeUppercase = document.getElementById('include-uppercase') ? document.getElementById('include-uppercase').checked : true;
    const includeLowercase = document.getElementById('include-lowercase') ? document.getElementById('include-lowercase').checked : true;
    const includeNumbers = document.getElementById('include-numbers') ? document.getElementById('include-numbers').checked : true;
    const includeSymbols = document.getElementById('include-symbols') ? document.getElementById('include-symbols').checked : true;
    
    let chars = '';
    if (includeUppercase) chars += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    if (includeLowercase) chars += 'abcdefghijklmnopqrstuvwxyz';
    if (includeNumbers) chars += '0123456789';
    if (includeSymbols) chars += '!@#$%^&*()_+-=[]{}|;:,.<>?';
    
    if (chars === '') {
        alert('Please select at least one character type.');
        return;
    }
    
    let password = '';
    for (let i = 0; i < length; i++) {
        password += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    
    const passwordInput = document.getElementById(inputId);
    if (passwordInput) {
        passwordInput.value = password;
        passwordInput.dispatchEvent(new Event('input'));
        
        // Update password strength if available
        if (strengthId && typeof checkPasswordStrength === 'function') {
            checkPasswordStrength(password, strengthId);
        }
    }
    
    // Hide options panel
    const options = document.querySelector('.password-options');
    if (options) {
        options.style.display = 'none';
    }
}

// Show options when clicking the generate button
document.addEventListener('DOMContentLoaded', function() {
    const generateBtn = document.getElementById('{$generateButtonId}');
    if (generateBtn) {
        generateBtn.addEventListener('click', function() {
            togglePasswordOptions();
        });
    }
});
</script>