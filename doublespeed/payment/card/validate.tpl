<!-- Credit Card Payment Validation -->
<script>
function validateCardPayment() {
    let isValid = true;
    const errors = [];
    
    // Get form elements
    const cardNumber = document.getElementById('card_number');
    const cardHolderName = document.getElementById('card_holder_name');
    const cardExpiry = document.getElementById('card_expiry');
    const cardCvv = document.getElementById('card_cvv');
    
    // Clear previous error states
    clearValidationErrors('card');
    
    // Validate card number
    if (!cardNumber || !cardNumber.value.trim()) {
        showValidationError(cardNumber, 'Card number is required');
        errors.push('Card number is required');
        isValid = false;
    } else {
        const cleanCardNumber = cardNumber.value.replace(/\s/g, '');
        if (!isValidCardNumber(cleanCardNumber)) {
            showValidationError(cardNumber, 'Please enter a valid card number');
            errors.push('Please enter a valid card number');
            isValid = false;
        }
    }
    
    // Validate cardholder name
    if (!cardHolderName || !cardHolderName.value.trim()) {
        showValidationError(cardHolderName, 'Cardholder name is required');
        errors.push('Cardholder name is required');
        isValid = false;
    } else if (cardHolderName.value.trim().length < 2) {
        showValidationError(cardHolderName, 'Cardholder name must be at least 2 characters');
        errors.push('Cardholder name must be at least 2 characters');
        isValid = false;
    }
    
    // Validate expiry date
    if (!cardExpiry || !cardExpiry.value.trim()) {
        showValidationError(cardExpiry, 'Expiry date is required');
        errors.push('Expiry date is required');
        isValid = false;
    } else if (!isValidExpiryDate(cardExpiry.value)) {
        showValidationError(cardExpiry, 'Please enter a valid expiry date (MM/YY)');
        errors.push('Please enter a valid expiry date (MM/YY)');
        isValid = false;
    } else if (isExpiredCard(cardExpiry.value)) {
        showValidationError(cardExpiry, 'Card has expired');
        errors.push('Card has expired');
        isValid = false;
    }
    
    // Validate CVV
    if (!cardCvv || !cardCvv.value.trim()) {
        showValidationError(cardCvv, 'CVV is required');
        errors.push('CVV is required');
        isValid = false;
    } else if (!isValidCvv(cardCvv.value, getCardType(cardNumber ? cardNumber.value : ''))) {
        showValidationError(cardCvv, 'Please enter a valid CVV');
        errors.push('Please enter a valid CVV');
        isValid = false;
    }
    
    // Display validation summary if there are errors
    if (!isValid) {
        showValidationSummary('card', errors);
    }
    
    return isValid;
}

function isValidCardNumber(cardNumber) {
    // Remove all spaces and check if it's only digits
    if (!/^\d+$/.test(cardNumber)) {
        return false;
    }
    
    // Check length (13-19 digits for most cards)
    if (cardNumber.length < 13 || cardNumber.length > 19) {
        return false;
    }
    
    // Luhn algorithm validation
    return luhnCheck(cardNumber);
}

function luhnCheck(cardNumber) {
    let sum = 0;
    let alternate = false;
    
    for (let i = cardNumber.length - 1; i >= 0; i--) {
        let n = parseInt(cardNumber.charAt(i), 10);
        
        if (alternate) {
            n *= 2;
            if (n > 9) {
                n = (n % 10) + 1;
            }
        }
        
        sum += n;
        alternate = !alternate;
    }
    
    return (sum % 10 === 0);
}

function isValidExpiryDate(expiry) {
    const expiryPattern = /^(0[1-9]|1[0-2])\/(\d{2})$/;
    return expiryPattern.test(expiry);
}

function isExpiredCard(expiry) {
    const [month, year] = expiry.split('/');
    const currentDate = new Date();
    const currentYear = currentDate.getFullYear() % 100; // Get last 2 digits
    const currentMonth = currentDate.getMonth() + 1; // 0-based month
    
    const cardYear = parseInt(year, 10);
    const cardMonth = parseInt(month, 10);
    
    if (cardYear < currentYear) {
        return true;
    }
    
    if (cardYear === currentYear && cardMonth < currentMonth) {
        return true;
    }
    
    return false;
}

function isValidCvv(cvv, cardType) {
    if (cardType === 'amex') {
        return /^\d{4}$/.test(cvv);
    }
    return /^\d{3}$/.test(cvv);
}

function getCardType(cardNumber) {
    const cleanNumber = cardNumber.replace(/\s/g, '');
    
    if (/^4/.test(cleanNumber)) {
        return 'visa';
    } else if (/^5[1-5]/.test(cleanNumber) || /^2[2-7]/.test(cleanNumber)) {
        return 'mastercard';
    } else if (/^3[47]/.test(cleanNumber)) {
        return 'amex';
    } else if (/^6(?:011|5)/.test(cleanNumber)) {
        return 'discover';
    }
    
    return 'unknown';
}

function updateCardTypeIcon(cardNumber) {
    const cardType = getCardType(cardNumber);
    const iconElement = document.getElementById('card_type_icon');
    
    if (!iconElement) return;
    
    switch (cardType) {
        case 'visa':
            iconElement.innerHTML = '<i class="fab fa-cc-visa text-blue-500"></i>';
            break;
        case 'mastercard':
            iconElement.innerHTML = '<i class="fab fa-cc-mastercard text-red-500"></i>';
            break;
        case 'amex':
            iconElement.innerHTML = '<i class="fab fa-cc-amex text-blue-600"></i>';
            break;
        case 'discover':
            iconElement.innerHTML = '<i class="fab fa-cc-discover text-orange-500"></i>';
            break;
        default:
            iconElement.innerHTML = '<i class="fas fa-credit-card text-gray-400"></i>';
    }
}

function formatCardNumber(input) {
    let value = input.value.replace(/\s/g, '');
    let formattedValue = '';
    
    for (let i = 0; i < value.length; i++) {
        if (i > 0 && i % 4 === 0) {
            formattedValue += ' ';
        }
        formattedValue += value[i];
    }
    
    input.value = formattedValue;
    updateCardTypeIcon(value);
}

function formatExpiryDate(input) {
    let value = input.value.replace(/\D/g, '');
    
    if (value.length >= 2) {
        value = value.substring(0, 2) + '/' + value.substring(2, 4);
    }
    
    input.value = value;
}

// Real-time validation and formatting
document.addEventListener('DOMContentLoaded', function() {
    const cardNumber = document.getElementById('card_number');
    const cardExpiry = document.getElementById('card_expiry');
    const cardCvv = document.getElementById('card_cvv');
    const cardHolderName = document.getElementById('card_holder_name');
    
    // Card number formatting and validation
    if (cardNumber) {
        cardNumber.addEventListener('input', function() {
            // Remove non-digit characters and limit length
            this.value = this.value.replace(/\D/g, '').substring(0, 19);
            formatCardNumber(this);
            
            // Clear error state when user starts typing
            clearFieldError(this);
        });
        
        cardNumber.addEventListener('blur', function() {
            if (this.value.trim()) {
                validateSingleCardField(this);
            }
        });
    }
    
    // Expiry date formatting
    if (cardExpiry) {
        cardExpiry.addEventListener('input', function() {
            formatExpiryDate(this);
            clearFieldError(this);
        });
        
        cardExpiry.addEventListener('blur', function() {
            if (this.value.trim()) {
                validateSingleCardField(this);
            }
        });
    }
    
    // CVV validation
    if (cardCvv) {
        cardCvv.addEventListener('input', function() {
            this.value = this.value.replace(/\D/g, '').substring(0, 4);
            clearFieldError(this);
        });
        
        cardCvv.addEventListener('blur', function() {
            if (this.value.trim()) {
                validateSingleCardField(this);
            }
        });
    }
    
    // Cardholder name validation
    if (cardHolderName) {
        cardHolderName.addEventListener('input', function() {
            clearFieldError(this);
        });
        
        cardHolderName.addEventListener('blur', function() {
            if (this.value.trim()) {
                validateSingleCardField(this);
            }
        });
    }
});

function validateSingleCardField(field) {
    const fieldName = field.name || field.id;
    let isValid = true;
    let errorMessage = '';
    
    switch(fieldName) {
        case 'card_number':
            if (!field.value.trim()) {
                errorMessage = 'Card number is required';
                isValid = false;
            } else {
                const cleanCardNumber = field.value.replace(/\s/g, '');
                if (!isValidCardNumber(cleanCardNumber)) {
                    errorMessage = 'Please enter a valid card number';
                    isValid = false;
                }
            }
            break;
            
        case 'card_holder_name':
            if (!field.value.trim()) {
                errorMessage = 'Cardholder name is required';
                isValid = false;
            } else if (field.value.trim().length < 2) {
                errorMessage = 'Cardholder name must be at least 2 characters';
                isValid = false;
            }
            break;
            
        case 'card_expiry':
            if (!field.value.trim()) {
                errorMessage = 'Expiry date is required';
                isValid = false;
            } else if (!isValidExpiryDate(field.value)) {
                errorMessage = 'Please enter a valid expiry date (MM/YY)';
                isValid = false;
            } else if (isExpiredCard(field.value)) {
                errorMessage = 'Card has expired';
                isValid = false;
            }
            break;
            
        case 'card_cvv':
            if (!field.value.trim()) {
                errorMessage = 'CVV is required';
                isValid = false;
            } else {
                const cardNumber = document.getElementById('card_number');
                const cardType = getCardType(cardNumber ? cardNumber.value : '');
                if (!isValidCvv(field.value, cardType)) {
                    errorMessage = 'Please enter a valid CVV';
                    isValid = false;
                }
            }
            break;
    }
    
    if (!isValid) {
        showValidationError(field, errorMessage);
    }
    
    return isValid;
}

function clearFieldError(field) {
    if (field.classList.contains('border-red-500')) {
        field.classList.remove('border-red-500', 'focus:border-red-500', 'focus:ring-red-500');
        field.classList.add('border-gray-600', 'focus:border-neon-green', 'focus:ring-neon-green');
        
        const errorElement = field.parentNode.querySelector('.validation-error');
        if (errorElement) {
            errorElement.remove();
        }
    }
}

// Use the same showValidationError, clearValidationErrors, and showValidationSummary functions from bank validation
</script>