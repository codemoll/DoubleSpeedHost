<!-- Bank Payment Validation -->
<script>
function validateBankPayment() {
    let isValid = true;
    const errors = [];
    
    // Get form elements
    const bankName = document.getElementById('bank_name');
    const accountHolder = document.getElementById('account_holder');
    const accountNumber = document.getElementById('account_number');
    const routingNumber = document.getElementById('routing_number');
    const bankCountry = document.getElementById('bank_country');
    const termsAccepted = document.querySelector('input[name="bank_terms_accepted"]');
    
    // Clear previous error states
    clearValidationErrors('bank');
    
    // Validate bank name
    if (!bankName || !bankName.value.trim()) {
        showValidationError(bankName, 'Bank name is required');
        errors.push('Bank name is required');
        isValid = false;
    } else if (bankName.value.trim().length < 2) {
        showValidationError(bankName, 'Bank name must be at least 2 characters');
        errors.push('Bank name must be at least 2 characters');
        isValid = false;
    }
    
    // Validate account holder name
    if (!accountHolder || !accountHolder.value.trim()) {
        showValidationError(accountHolder, 'Account holder name is required');
        errors.push('Account holder name is required');
        isValid = false;
    } else if (accountHolder.value.trim().length < 2) {
        showValidationError(accountHolder, 'Account holder name must be at least 2 characters');
        errors.push('Account holder name must be at least 2 characters');
        isValid = false;
    }
    
    // Validate account number
    if (!accountNumber || !accountNumber.value.trim()) {
        showValidationError(accountNumber, 'Account number is required');
        errors.push('Account number is required');
        isValid = false;
    } else if (!/^\d{8,20}$/.test(accountNumber.value.replace(/\s/g, ''))) {
        showValidationError(accountNumber, 'Account number must be 8-20 digits');
        errors.push('Account number must be 8-20 digits');
        isValid = false;
    }
    
    // Validate routing number
    if (!routingNumber || !routingNumber.value.trim()) {
        showValidationError(routingNumber, 'Routing number is required');
        errors.push('Routing number is required');
        isValid = false;
    } else if (!/^\d{9}$/.test(routingNumber.value.replace(/\s/g, ''))) {
        showValidationError(routingNumber, 'Routing number must be 9 digits');
        errors.push('Routing number must be 9 digits');
        isValid = false;
    }
    
    // Validate bank country
    if (!bankCountry || !bankCountry.value) {
        showValidationError(bankCountry, 'Bank country is required');
        errors.push('Bank country is required');
        isValid = false;
    }
    
    // Validate terms acceptance
    if (!termsAccepted || !termsAccepted.checked) {
        showValidationError(termsAccepted, 'You must accept the bank transfer terms');
        errors.push('You must accept the bank transfer terms');
        isValid = false;
    }
    
    // Display validation summary if there are errors
    if (!isValid) {
        showValidationSummary('bank', errors);
    }
    
    return isValid;
}

function showValidationError(element, message) {
    if (!element) return;
    
    // Add error class to input
    element.classList.add('border-red-500', 'focus:border-red-500', 'focus:ring-red-500');
    element.classList.remove('border-gray-600', 'focus:border-cyber-purple', 'focus:ring-cyber-purple');
    
    // Create or update error message
    let errorElement = element.parentNode.querySelector('.validation-error');
    if (!errorElement) {
        errorElement = document.createElement('div');
        errorElement.className = 'validation-error text-red-400 text-xs mt-1';
        element.parentNode.appendChild(errorElement);
    }
    errorElement.textContent = message;
}

function clearValidationErrors(paymentMethod) {
    const container = document.querySelector(`[data-method="${paymentMethod}"]`);
    if (!container) return;
    
    // Remove error classes from inputs
    const inputs = container.querySelectorAll('input, select, textarea');
    inputs.forEach(input => {
        input.classList.remove('border-red-500', 'focus:border-red-500', 'focus:ring-red-500');
        input.classList.add('border-gray-600', 'focus:border-cyber-purple', 'focus:ring-cyber-purple');
    });
    
    // Remove error messages
    const errorElements = container.querySelectorAll('.validation-error');
    errorElements.forEach(el => el.remove());
    
    // Remove validation summary
    const summaryElement = container.querySelector('.validation-summary');
    if (summaryElement) {
        summaryElement.remove();
    }
}

function showValidationSummary(paymentMethod, errors) {
    const container = document.querySelector(`[data-method="${paymentMethod}"]`);
    if (!container) return;
    
    // Remove existing summary
    const existingSummary = container.querySelector('.validation-summary');
    if (existingSummary) {
        existingSummary.remove();
    }
    
    // Create validation summary
    const summaryDiv = document.createElement('div');
    summaryDiv.className = 'validation-summary bg-red-900/20 border border-red-700 rounded-lg p-4 mt-4';
    
    const summaryTitle = document.createElement('h6');
    summaryTitle.className = 'text-red-400 font-semibold text-sm mb-2';
    summaryTitle.innerHTML = '<i class="fas fa-exclamation-triangle mr-1"></i>Please fix the following errors:';
    summaryDiv.appendChild(summaryTitle);
    
    const errorList = document.createElement('ul');
    errorList.className = 'text-red-300 text-xs space-y-1';
    errors.forEach(error => {
        const listItem = document.createElement('li');
        listItem.textContent = '• ' + error;
        errorList.appendChild(listItem);
    });
    summaryDiv.appendChild(errorList);
    
    container.appendChild(summaryDiv);
}

// Real-time validation
document.addEventListener('DOMContentLoaded', function() {
    const bankInputs = document.querySelectorAll('#bank_name, #account_holder, #account_number, #routing_number, #bank_country');
    
    bankInputs.forEach(input => {
        input.addEventListener('blur', function() {
            // Only validate this specific field on blur
            if (this.value.trim()) {
                validateSingleBankField(this);
            }
        });
        
        input.addEventListener('input', function() {
            // Clear error state when user starts typing
            if (this.classList.contains('border-red-500')) {
                this.classList.remove('border-red-500', 'focus:border-red-500', 'focus:ring-red-500');
                this.classList.add('border-gray-600', 'focus:border-cyber-purple', 'focus:ring-cyber-purple');
                
                const errorElement = this.parentNode.querySelector('.validation-error');
                if (errorElement) {
                    errorElement.remove();
                }
            }
        });
    });
});

function validateSingleBankField(field) {
    const fieldName = field.name || field.id;
    let isValid = true;
    let errorMessage = '';
    
    switch(fieldName) {
        case 'bank_name':
            if (!field.value.trim()) {
                errorMessage = 'Bank name is required';
                isValid = false;
            } else if (field.value.trim().length < 2) {
                errorMessage = 'Bank name must be at least 2 characters';
                isValid = false;
            }
            break;
            
        case 'account_holder':
            if (!field.value.trim()) {
                errorMessage = 'Account holder name is required';
                isValid = false;
            } else if (field.value.trim().length < 2) {
                errorMessage = 'Account holder name must be at least 2 characters';
                isValid = false;
            }
            break;
            
        case 'account_number':
            if (!field.value.trim()) {
                errorMessage = 'Account number is required';
                isValid = false;
            } else if (!/^\d{8,20}$/.test(field.value.replace(/\s/g, ''))) {
                errorMessage = 'Account number must be 8-20 digits';
                isValid = false;
            }
            break;
            
        case 'routing_number':
            if (!field.value.trim()) {
                errorMessage = 'Routing number is required';
                isValid = false;
            } else if (!/^\d{9}$/.test(field.value.replace(/\s/g, ''))) {
                errorMessage = 'Routing number must be 9 digits';
                isValid = false;
            }
            break;
            
        case 'bank_country':
            if (!field.value) {
                errorMessage = 'Bank country is required';
                isValid = false;
            }
            break;
    }
    
    if (!isValid) {
        showValidationError(field, errorMessage);
    }
    
    return isValid;
}
</script>