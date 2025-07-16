/**
 * Enhanced Domain Search Functionality
 * Prevents JSON display, adds loading states, and improves UX
 */

(function() {
    'use strict';

    // Configuration
    const config = {
        searchForm: 'form[action*="domainchecker"]',
        resultsContainer: '#domain-search-results',
        loadingClass: 'domain-search-loading',
        errorClass: 'domain-search-error'
    };

    // Initialize when DOM is loaded
    document.addEventListener('DOMContentLoaded', function() {
        initDomainSearch();
        enhanceExistingResults();
    });

    /**
     * Initialize enhanced domain search functionality
     */
    function initDomainSearch() {
        const searchForm = document.querySelector(config.searchForm);
        if (!searchForm) return;

        // Add enhanced form submission handling
        searchForm.addEventListener('submit', function(e) {
            // Don't prevent default - let WHMCS handle the search
            // But add loading state and better UX
            showLoadingState(this);
        });

        // Enhance search input with real-time validation
        const domainInput = searchForm.querySelector('input[name="domain"]');
        if (domainInput) {
            domainInput.addEventListener('input', function() {
                validateDomainInput(this);
            });
        }
    }

    /**
     * Show loading state during search
     */
    function showLoadingState(form) {
        const submitBtn = form.querySelector('button[type="submit"]');
        if (submitBtn) {
            submitBtn.disabled = true;
            submitBtn.innerHTML = `
                <svg class="animate-spin w-5 h-5 mr-2 inline" fill="none" viewBox="0 0 24 24">
                    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                    <path class="opacity-75" fill="currentColor" d="m4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                </svg>
                Searching...
            `;
        }

        // Add loading overlay to results area
        const existingResults = document.querySelector('.domain-results, .space-y-4');
        if (existingResults) {
            const loadingOverlay = document.createElement('div');
            loadingOverlay.className = 'domain-search-loading-overlay fixed inset-0 bg-dark-bg bg-opacity-75 flex items-center justify-center z-50';
            loadingOverlay.innerHTML = `
                <div class="card-dark text-center max-w-md">
                    <div class="animate-spin w-12 h-12 mx-auto mb-4 border-4 border-neon-green border-t-transparent rounded-full"></div>
                    <h3 class="text-white font-semibold mb-2">Searching Domains</h3>
                    <p class="text-text-light">Checking availability across multiple registries...</p>
                </div>
            `;
            document.body.appendChild(loadingOverlay);
        }
    }

    /**
     * Validate domain input in real-time
     */
    function validateDomainInput(input) {
        const value = input.value.trim().toLowerCase();
        const validDomain = /^[a-zA-Z0-9]([a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?$/;
        
        // Remove existing validation classes
        input.classList.remove('border-red-500', 'border-neon-green');
        
        // Remove existing error message
        const existingError = input.parentNode.querySelector('.domain-validation-error');
        if (existingError) {
            existingError.remove();
        }

        if (value && !validDomain.test(value)) {
            input.classList.add('border-red-500');
            const errorMsg = document.createElement('div');
            errorMsg.className = 'domain-validation-error text-red-400 text-sm mt-1';
            errorMsg.textContent = 'Domain name can only contain letters, numbers, and hyphens';
            input.parentNode.appendChild(errorMsg);
        } else if (value) {
            input.classList.add('border-neon-green');
        }
    }

    /**
     * Enhance existing search results with improved styling and functionality
     */
    function enhanceExistingResults() {
        // Enhance domain result cards
        const domainResults = document.querySelectorAll('.domain-result');
        domainResults.forEach(enhanceDomainResult);

        // Handle any raw JSON that might be displayed
        interceptJSONDisplay();

        // Add suggestion functionality
        addDomainSuggestions();
    }

    /**
     * Enhance individual domain result card
     */
    function enhanceDomainResult(resultCard) {
        // Add hover effects
        resultCard.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-2px)';
            this.style.transition = 'all 0.3s ease';
        });

        resultCard.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
        });

        // Enhance "Add to Cart" buttons
        const addToCartBtn = resultCard.querySelector('.btn-primary, a[href*="cart.php"]');
        if (addToCartBtn) {
            addToCartBtn.addEventListener('click', function(e) {
                // Add confirmation and loading state
                const domainName = resultCard.querySelector('.domain-name').textContent.trim();
                const price = resultCard.querySelector('.domain-price');
                const priceText = price ? price.textContent.trim() : '';

                // Show confirmation modal instead of immediate redirect
                e.preventDefault();
                showAddToCartConfirmation(domainName, priceText, this.href);
            });
        }
    }

    /**
     * Show confirmation modal before adding domain to cart
     */
    function showAddToCartConfirmation(domainName, price, cartUrl) {
        const modal = document.createElement('div');
        modal.className = 'fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-75';
        modal.innerHTML = `
            <div class="card-dark max-w-md mx-4">
                <div class="flex justify-between items-center mb-4">
                    <h3 class="text-xl font-orbitron font-bold text-white">Add Domain to Cart</h3>
                    <button class="close-modal text-gray-400 hover:text-white text-2xl">&times;</button>
                </div>
                <div class="mb-6">
                    <div class="bg-dark-bg-alt rounded-lg p-4 mb-4">
                        <div class="flex justify-between items-center">
                            <span class="text-white font-semibold">${domainName}</span>
                            <span class="text-neon-green font-bold">${price}</span>
                        </div>
                        <div class="text-text-light text-sm mt-1">Domain Registration - 1 Year</div>
                    </div>
                    <p class="text-text-light text-sm">
                        This will add the domain to your cart. You can review and modify your order before completing the purchase.
                    </p>
                </div>
                <div class="flex space-x-3">
                    <button class="cancel-modal btn-outline flex-1">Cancel</button>
                    <a href="${cartUrl}" class="confirm-add btn-primary flex-1 text-center">Add to Cart</a>
                </div>
            </div>
        `;

        document.body.appendChild(modal);

        // Handle modal close
        modal.querySelector('.close-modal').addEventListener('click', function() {
            document.body.removeChild(modal);
        });

        modal.querySelector('.cancel-modal').addEventListener('click', function() {
            document.body.removeChild(modal);
        });

        // Close on backdrop click
        modal.addEventListener('click', function(e) {
            if (e.target === modal) {
                document.body.removeChild(modal);
            }
        });
    }

    /**
     * Intercept and format any raw JSON display
     */
    function interceptJSONDisplay() {
        // Check for JSON content in various places
        const potentialJsonElements = document.querySelectorAll('pre, code, .json-response');
        
        potentialJsonElements.forEach(element => {
            const content = element.textContent || element.innerHTML;
            if (isValidJSON(content)) {
                formatJSONDisplay(element, JSON.parse(content));
            }
        });

        // Monitor for dynamically added JSON content
        const observer = new MutationObserver(function(mutations) {
            mutations.forEach(function(mutation) {
                mutation.addedNodes.forEach(function(node) {
                    if (node.nodeType === Node.ELEMENT_NODE) {
                        const content = node.textContent || node.innerHTML;
                        if (content && isValidJSON(content)) {
                            formatJSONDisplay(node, JSON.parse(content));
                        }
                    }
                });
            });
        });

        observer.observe(document.body, { childList: true, subtree: true });
    }

    /**
     * Check if string is valid JSON
     */
    function isValidJSON(str) {
        try {
            const parsed = JSON.parse(str);
            return typeof parsed === 'object' && parsed !== null;
        } catch (e) {
            return false;
        }
    }

    /**
     * Format JSON display into user-friendly domain results
     */
    function formatJSONDisplay(element, jsonData) {
        if (jsonData.domains || jsonData.results || Array.isArray(jsonData)) {
            const domains = jsonData.domains || jsonData.results || jsonData;
            const formattedHTML = createDomainResultsHTML(domains);
            
            const wrapper = document.createElement('div');
            wrapper.className = 'domain-results-formatted';
            wrapper.innerHTML = formattedHTML;
            
            element.parentNode.replaceChild(wrapper, element);
        }
    }

    /**
     * Create HTML for domain results
     */
    function createDomainResultsHTML(domains) {
        if (!Array.isArray(domains)) return '';

        const resultsHTML = domains.map(domain => {
            const isAvailable = domain.status === 'available' || domain.available === true;
            const domainName = domain.domain || domain.name || 'Unknown Domain';
            const price = domain.price || domain.cost || '';
            
            return `
                <div class="domain-result ${isAvailable ? 'available' : 'unavailable'}">
                    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between p-4 gap-4">
                        <div class="flex-1">
                            <div class="domain-name text-lg font-semibold text-white">${domainName}</div>
                            <div class="domain-status mt-1">
                                ${isAvailable 
                                    ? '<span class="text-neon-green text-sm">✓ Available</span>'
                                    : '<span class="text-red-400 text-sm">✗ Unavailable</span>'
                                }
                            </div>
                        </div>
                        ${isAvailable ? `
                            <div class="flex flex-col sm:flex-row items-start sm:items-center gap-3">
                                ${price ? `<div class="domain-price text-lg font-bold text-white">${price}</div>` : ''}
                                <div class="domain-action">
                                    <a href="/cart.php?a=add&domain=register&query=${encodeURIComponent(domainName)}" 
                                       class="btn-primary text-sm px-4 py-2">
                                        Add to Cart
                                    </a>
                                </div>
                            </div>
                        ` : ''}
                    </div>
                </div>
            `;
        }).join('');

        return `
            <div class="space-y-4">
                <h2 class="text-2xl font-orbitron font-bold text-white mb-6">Search Results</h2>
                ${resultsHTML}
            </div>
        `;
    }

    /**
     * Add domain suggestions functionality
     */
    function addDomainSuggestions() {
        const searchForm = document.querySelector(config.searchForm);
        const domainInput = searchForm && searchForm.querySelector('input[name="domain"]');
        
        if (!domainInput) return;

        let suggestionTimeout;
        
        domainInput.addEventListener('input', function() {
            const value = this.value.trim();
            
            clearTimeout(suggestionTimeout);
            
            if (value.length >= 3) {
                suggestionTimeout = setTimeout(() => {
                    showDomainSuggestions(value, this);
                }, 500);
            } else {
                hideDomainSuggestions();
            }
        });

        // Hide suggestions when clicking outside
        document.addEventListener('click', function(e) {
            if (!e.target.closest('.domain-suggestions')) {
                hideDomainSuggestions();
            }
        });
    }

    /**
     * Show domain suggestions
     */
    function showDomainSuggestions(domain, input) {
        // Remove existing suggestions
        hideDomainSuggestions();

        const suggestions = generateDomainSuggestions(domain);
        
        if (suggestions.length === 0) return;

        const suggestionContainer = document.createElement('div');
        suggestionContainer.className = 'domain-suggestions absolute z-10 w-full mt-1 bg-dark-surface border border-gray-600 rounded-lg shadow-lg max-h-48 overflow-y-auto';
        
        suggestions.forEach(suggestion => {
            const suggestionItem = document.createElement('div');
            suggestionItem.className = 'p-3 hover:bg-gray-700 cursor-pointer text-white border-b border-gray-700 last:border-b-0';
            suggestionItem.textContent = suggestion;
            
            suggestionItem.addEventListener('click', function() {
                input.value = suggestion;
                hideDomainSuggestions();
                input.focus();
            });
            
            suggestionContainer.appendChild(suggestionItem);
        });

        // Position relative to input
        const inputContainer = input.parentNode;
        inputContainer.style.position = 'relative';
        inputContainer.appendChild(suggestionContainer);
    }

    /**
     * Hide domain suggestions
     */
    function hideDomainSuggestions() {
        const suggestions = document.querySelector('.domain-suggestions');
        if (suggestions) {
            suggestions.remove();
        }
    }

    /**
     * Generate domain suggestions based on input
     */
    function generateDomainSuggestions(domain) {
        const suggestions = [];
        const alternatives = [
            domain + 'site',
            domain + 'app',
            domain + 'web',
            domain + 'online',
            domain + 'pro',
            'my' + domain,
            'get' + domain,
            domain.replace(/s$/, '') + 's', // Add/remove 's'
        ];

        // Filter out duplicates and invalid suggestions
        alternatives.forEach(alt => {
            if (alt !== domain && alt.length <= 63 && /^[a-zA-Z0-9-]+$/.test(alt)) {
                suggestions.push(alt);
            }
        });

        return suggestions.slice(0, 5); // Limit to 5 suggestions
    }

    // Cleanup function
    window.addEventListener('beforeunload', function() {
        const loadingOverlay = document.querySelector('.domain-search-loading-overlay');
        if (loadingOverlay) {
            loadingOverlay.remove();
        }
    });

})();