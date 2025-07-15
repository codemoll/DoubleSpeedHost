/**
 * WHMCS Template Specific JavaScript
 * Additional functionality and enhancements for WHMCS templates
 */

(function(window, document) {
    'use strict';
    
    // WHMCS template namespace
    window.WHMCS = window.WHMCS || {};
    window.WHMCS.template = window.WHMCS.template || {};
    
    // Configuration
    var config = {
        ajaxTimeout: 30000,
        retryAttempts: 3,
        loadingClass: 'whmcs-loading',
        errorClass: 'whmcs-error',
        successClass: 'whmcs-success'
    };
    
    // Client area enhancements
    WHMCS.template.clientArea = {
        
        // Auto-refresh service status
        refreshStatus: function(serviceId, interval) {
            interval = interval || 30000; // 30 seconds default
            
            var refresh = function() {
                WHMCS.utils.ajax({
                    url: 'clientarea.php',
                    method: 'POST',
                    data: 'action=getstatus&serviceid=' + encodeURIComponent(serviceId),
                    success: function(response) {
                        try {
                            var data = JSON.parse(response);
                            var statusElement = document.querySelector('[data-service-status="' + serviceId + '"]');
                            if (statusElement && data.status) {
                                statusElement.innerHTML = data.status;
                                statusElement.className = 'status status-' + data.status.toLowerCase();
                            }
                        } catch (e) {
                            console.error('Failed to parse status response');
                        }
                    }
                });
            };
            
            // Initial refresh
            refresh();
            
            // Set up interval
            return setInterval(refresh, interval);
        },
        
        // Quick invoice payment
        quickPay: function(invoiceId, amount) {
            var modal = WHMCS.modal.show(
                '<div class="payment-form">' +
                    '<p>Quick payment for Invoice #' + invoiceId + '</p>' +
                    '<p>Amount: $' + amount + '</p>' +
                    '<button onclick="WHMCS.template.clientArea.processPayment(' + invoiceId + ')" class="btn btn-primary">Pay Now</button>' +
                '</div>',
                { title: 'Quick Payment' }
            );
        },
        
        // Process payment
        processPayment: function(invoiceId) {
            var payButton = document.querySelector('.payment-form button');
            if (payButton) {
                payButton.disabled = true;
                payButton.innerHTML = 'Processing...';
            }
            
            WHMCS.utils.ajax({
                url: 'viewinvoice.php',
                method: 'POST',
                data: 'id=' + invoiceId + '&action=pay',
                success: function(response) {
                    // Redirect to payment gateway or show success
                    window.location.href = 'viewinvoice.php?id=' + invoiceId;
                },
                error: function() {
                    alert('Payment processing failed. Please try again.');
                    if (payButton) {
                        payButton.disabled = false;
                        payButton.innerHTML = 'Pay Now';
                    }
                }
            });
        }
    };
    
    // Domain management enhancements
    WHMCS.template.domains = {
        
        // Bulk domain checker
        bulkCheck: function(domains, tlds) {
            if (!domains || domains.length === 0) {
                return;
            }
            
            var resultsContainer = document.querySelector('#domain-results') || document.body;
            resultsContainer.innerHTML = '<div class="' + config.loadingClass + '">Checking domains...</div>';
            
            var data = 'action=bulkcheck&domains=' + encodeURIComponent(domains.join(','));
            if (tlds && tlds.length > 0) {
                data += '&tlds=' + encodeURIComponent(tlds.join(','));
            }
            
            WHMCS.utils.ajax({
                url: 'domainchecker.php',
                method: 'POST',
                data: data,
                success: function(response) {
                    try {
                        var results = JSON.parse(response);
                        WHMCS.template.domains.displayResults(results, resultsContainer);
                    } catch (e) {
                        resultsContainer.innerHTML = '<div class="' + config.errorClass + '">Failed to parse domain check results</div>';
                    }
                },
                error: function() {
                    resultsContainer.innerHTML = '<div class="' + config.errorClass + '">Domain check failed. Please try again.</div>';
                }
            });
        },
        
        // Display domain results
        displayResults: function(results, container) {
            var html = '<div class="domain-results">';
            
            if (results && results.length > 0) {
                results.forEach(function(result) {
                    var statusClass = result.available ? 'available' : 'unavailable';
                    var statusText = result.available ? 'Available' : 'Unavailable';
                    var actionButton = result.available ? 
                        '<button onclick="WHMCS.template.domains.addToCart(\'' + result.domain + '\')" class="btn btn-sm btn-primary">Add to Cart</button>' : 
                        '<button class="btn btn-sm btn-secondary" disabled>Not Available</button>';
                    
                    html += '<div class="domain-result ' + statusClass + '">' +
                        '<span class="domain-name">' + result.domain + '</span>' +
                        '<span class="domain-status">' + statusText + '</span>' +
                        '<span class="domain-price">$' + (result.price || '0.00') + '</span>' +
                        '<span class="domain-action">' + actionButton + '</span>' +
                    '</div>';
                });
            } else {
                html += '<div class="no-results">No domain results found.</div>';
            }
            
            html += '</div>';
            container.innerHTML = html;
        },
        
        // Add domain to cart
        addToCart: function(domain) {
            WHMCS.utils.ajax({
                url: 'cart.php',
                method: 'POST',
                data: 'action=add&domain=' + encodeURIComponent(domain),
                success: function() {
                    // Show success message or update cart
                    alert('Domain added to cart successfully!');
                    // Update cart count if element exists
                    var cartCount = document.querySelector('.cart-count');
                    if (cartCount) {
                        var currentCount = parseInt(cartCount.textContent) || 0;
                        cartCount.textContent = currentCount + 1;
                    }
                },
                error: function() {
                    alert('Failed to add domain to cart. Please try again.');
                }
            });
        }
    };
    
    // Support ticket enhancements
    WHMCS.template.support = {
        
        // Auto-save draft tickets
        autoSaveDraft: function(formElement, interval) {
            interval = interval || 60000; // 1 minute default
            
            var saveTimer;
            var isDirty = false;
            
            // Watch for changes
            var inputs = formElement.querySelectorAll('input, textarea, select');
            for (var i = 0; i < inputs.length; i++) {
                inputs[i].addEventListener('input', function() {
                    isDirty = true;
                    
                    // Clear existing timer
                    if (saveTimer) {
                        clearTimeout(saveTimer);
                    }
                    
                    // Set new timer
                    saveTimer = setTimeout(function() {
                        if (isDirty) {
                            WHMCS.template.support.saveDraft(formElement);
                            isDirty = false;
                        }
                    }, interval);
                });
            }
        },
        
        // Save draft ticket
        saveDraft: function(formElement) {
            var formData = WHMCS.utils.serializeForm(formElement);
            
            WHMCS.utils.ajax({
                url: 'submitticket.php',
                method: 'POST',
                data: 'action=savedraft&' + formData,
                success: function() {
                    // Show saved indicator
                    var indicator = document.querySelector('#draft-saved');
                    if (!indicator) {
                        indicator = document.createElement('div');
                        indicator.id = 'draft-saved';
                        indicator.className = 'draft-saved-indicator';
                        formElement.appendChild(indicator);
                    }
                    indicator.textContent = 'Draft saved at ' + new Date().toLocaleTimeString();
                    indicator.style.display = 'block';
                    
                    setTimeout(function() {
                        indicator.style.display = 'none';
                    }, 3000);
                }
            });
        },
        
        // Knowledge base search
        searchKB: function(query, category) {
            if (!query || query.length < 3) {
                return;
            }
            
            var resultsContainer = document.querySelector('#kb-search-results');
            if (!resultsContainer) {
                return;
            }
            
            resultsContainer.innerHTML = '<div class="' + config.loadingClass + '">Searching...</div>';
            
            var data = 'action=search&query=' + encodeURIComponent(query);
            if (category) {
                data += '&category=' + encodeURIComponent(category);
            }
            
            WHMCS.utils.ajax({
                url: 'knowledgebase.php',
                method: 'POST',
                data: data,
                success: function(response) {
                    try {
                        var results = JSON.parse(response);
                        WHMCS.template.support.displayKBResults(results, resultsContainer);
                    } catch (e) {
                        resultsContainer.innerHTML = '<div class="' + config.errorClass + '">Search failed</div>';
                    }
                },
                error: function() {
                    resultsContainer.innerHTML = '<div class="' + config.errorClass + '">Search failed</div>';
                }
            });
        },
        
        // Display knowledge base results
        displayKBResults: function(results, container) {
            var html = '';
            
            if (results && results.length > 0) {
                html += '<div class="kb-search-results">';
                results.forEach(function(article) {
                    html += '<div class="kb-result">' +
                        '<h4><a href="knowledgebase.php?action=displayarticle&id=' + article.id + '">' + article.title + '</a></h4>' +
                        '<p>' + (article.excerpt || '') + '</p>' +
                        '<small>Category: ' + (article.category || 'General') + '</small>' +
                    '</div>';
                });
                html += '</div>';
            } else {
                html = '<div class="no-results">No articles found matching your search.</div>';
            }
            
            container.innerHTML = html;
        }
    };
    
    // Product configuration enhancements
    WHMCS.template.products = {
        
        // Dynamic pricing calculator
        calculatePrice: function(productId, configOptions) {
            var data = 'action=calculateprice&pid=' + encodeURIComponent(productId);
            
            if (configOptions) {
                for (var key in configOptions) {
                    if (configOptions.hasOwnProperty(key)) {
                        data += '&configoption[' + encodeURIComponent(key) + ']=' + encodeURIComponent(configOptions[key]);
                    }
                }
            }
            
            WHMCS.utils.ajax({
                url: 'configureproduct.php',
                method: 'POST',
                data: data,
                success: function(response) {
                    try {
                        var pricing = JSON.parse(response);
                        WHMCS.template.products.updatePricing(pricing);
                    } catch (e) {
                        console.error('Failed to parse pricing response');
                    }
                }
            });
        },
        
        // Update pricing display
        updatePricing: function(pricing) {
            if (!pricing) return;
            
            // Update main price
            var priceElement = document.querySelector('.product-price');
            if (priceElement && pricing.total) {
                priceElement.textContent = '$' + pricing.total;
            }
            
            // Update setup fee
            var setupElement = document.querySelector('.setup-fee');
            if (setupElement && pricing.setup) {
                setupElement.textContent = '$' + pricing.setup;
                setupElement.style.display = pricing.setup > 0 ? 'block' : 'none';
            }
            
            // Update recurring price
            var recurringElement = document.querySelector('.recurring-price');
            if (recurringElement && pricing.recurring) {
                recurringElement.textContent = '$' + pricing.recurring + '/' + (pricing.cycle || 'month');
            }
        }
    };
    
    // Utility functions for template
    WHMCS.template.utils = {
        
        // Format currency
        formatCurrency: function(amount, currency) {
            currency = currency || '$';
            return currency + parseFloat(amount).toFixed(2);
        },
        
        // Format date
        formatDate: function(dateString, format) {
            var date = new Date(dateString);
            format = format || 'MM/DD/YYYY';
            
            var month = String(date.getMonth() + 1).padStart(2, '0');
            var day = String(date.getDate()).padStart(2, '0');
            var year = date.getFullYear();
            
            return format
                .replace('MM', month)
                .replace('DD', day)
                .replace('YYYY', year);
        },
        
        // Debounce function calls
        debounce: function(func, wait) {
            var timeout;
            return function executedFunction() {
                var later = function() {
                    clearTimeout(timeout);
                    func.apply(this, arguments);
                };
                clearTimeout(timeout);
                timeout = setTimeout(later, wait);
            };
        },
        
        // Show notification
        notify: function(message, type, duration) {
            type = type || 'info';
            duration = duration || 5000;
            
            var notification = document.createElement('div');
            notification.className = 'whmcs-notification notification-' + type;
            notification.innerHTML = message;
            
            // Add to page
            document.body.appendChild(notification);
            
            // Auto-remove
            setTimeout(function() {
                if (notification.parentNode) {
                    notification.parentNode.removeChild(notification);
                }
            }, duration);
            
            return notification;
        }
    };
    
    // Initialize template enhancements
    function initTemplateEnhancements() {
        // Auto-initialize search forms
        var searchForms = document.querySelectorAll('[data-kb-search]');
        for (var i = 0; i < searchForms.length; i++) {
            var form = searchForms[i];
            var searchInput = form.querySelector('input[type="text"], input[type="search"]');
            
            if (searchInput) {
                var debouncedSearch = WHMCS.template.utils.debounce(function() {
                    var query = this.value;
                    var category = form.getAttribute('data-kb-category');
                    WHMCS.template.support.searchKB(query, category);
                }, 500);
                
                searchInput.addEventListener('input', debouncedSearch);
            }
        }
        
        // Auto-initialize draft saving for ticket forms
        var ticketForms = document.querySelectorAll('form[action*="submitticket"]');
        for (var j = 0; j < ticketForms.length; j++) {
            WHMCS.template.support.autoSaveDraft(ticketForms[j]);
        }
        
        // Auto-initialize pricing calculators
        var configForms = document.querySelectorAll('form[action*="configureproduct"]');
        for (var k = 0; k < configForms.length; k++) {
            var configForm = configForms[k];
            var inputs = configForm.querySelectorAll('select, input[type="radio"], input[type="checkbox"]');
            
            for (var l = 0; l < inputs.length; l++) {
                inputs[l].addEventListener('change', function() {
                    var productId = configForm.querySelector('[name="pid"]');
                    if (productId) {
                        // Collect config options
                        var configOptions = {};
                        var optionInputs = configForm.querySelectorAll('[name^="configoption"]');
                        for (var m = 0; m < optionInputs.length; m++) {
                            var input = optionInputs[m];
                            if (input.type === 'radio' || input.type === 'checkbox') {
                                if (input.checked) {
                                    configOptions[input.name] = input.value;
                                }
                            } else {
                                configOptions[input.name] = input.value;
                            }
                        }
                        
                        WHMCS.template.products.calculatePrice(productId.value, configOptions);
                    }
                });
            }
        }
    }
    
    // Initialize when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initTemplateEnhancements);
    } else {
        initTemplateEnhancements();
    }
    
    // Export for global access
    window.WHMCS.template = WHMCS.template;
    
})(window, document);