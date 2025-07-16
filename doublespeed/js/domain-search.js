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
        const potentialJsonElements = document.querySelectorAll('pre, code, .json-response, .alert, .error, .result, [class*="json"], [id*="json"], [class*="result"], [id*="result"]');
        
        potentialJsonElements.forEach(element => {
            const content = element.textContent || element.innerHTML;
            if (isValidJSON(content)) {
                formatJSONDisplay(element, JSON.parse(content));
            }
        });

        // Also check for text nodes that might contain JSON
        const walker = document.createTreeWalker(
            document.body,
            NodeFilter.SHOW_TEXT,
            {
                acceptNode: function(node) {
                    // Skip if parent is script, style, or already processed
                    const parent = node.parentElement;
                    if (!parent || parent.tagName === 'SCRIPT' || parent.tagName === 'STYLE' || 
                        parent.classList.contains('domain-results-formatted')) {
                        return NodeFilter.FILTER_REJECT;
                    }
                    
                    const text = node.textContent.trim();
                    if (text.length > 20 && (text.startsWith('{') || text.startsWith('['))) {
                        return NodeFilter.FILTER_ACCEPT;
                    }
                    return NodeFilter.FILTER_REJECT;
                }
            }
        );

        let textNode;
        while (textNode = walker.nextNode()) {
            const content = textNode.textContent.trim();
            if (isValidJSON(content)) {
                const wrapper = document.createElement('div');
                textNode.parentNode.insertBefore(wrapper, textNode);
                textNode.remove();
                formatJSONDisplay(wrapper, JSON.parse(content));
            }
        }

        // Enhanced mutation observer with better filtering
        const observer = new MutationObserver(function(mutations) {
            mutations.forEach(function(mutation) {
                mutation.addedNodes.forEach(function(node) {
                    if (node.nodeType === Node.ELEMENT_NODE) {
                        // Check the element itself
                        const content = node.textContent || node.innerHTML;
                        if (content && isValidJSON(content.trim())) {
                            formatJSONDisplay(node, JSON.parse(content.trim()));
                            return;
                        }

                        // Check child elements
                        const jsonElements = node.querySelectorAll('*');
                        jsonElements.forEach(child => {
                            const childContent = child.textContent || child.innerHTML;
                            if (childContent && isValidJSON(childContent.trim()) && !child.classList.contains('domain-results-formatted')) {
                                formatJSONDisplay(child, JSON.parse(childContent.trim()));
                            }
                        });
                    } else if (node.nodeType === Node.TEXT_NODE) {
                        // Handle text nodes that might contain JSON
                        const content = node.textContent.trim();
                        if (content.length > 20 && isValidJSON(content)) {
                            const wrapper = document.createElement('div');
                            node.parentNode.insertBefore(wrapper, node);
                            node.remove();
                            formatJSONDisplay(wrapper, JSON.parse(content));
                        }
                    }
                });
            });
        });

        observer.observe(document.body, { 
            childList: true, 
            subtree: true, 
            characterData: true 
        });

        // Store observer reference for cleanup
        window.domainSearchObserver = observer;
    }

    /**
     * Check if string is valid JSON
     */
    function isValidJSON(str) {
        if (typeof str !== 'string' || str.length < 2) return false;
        
        try {
            const trimmed = str.trim();
            if (!((trimmed.startsWith('{') && trimmed.endsWith('}')) || 
                  (trimmed.startsWith('[') && trimmed.endsWith(']')))) {
                return false;
            }
            
            const parsed = JSON.parse(trimmed);
            return typeof parsed === 'object' && parsed !== null;
        } catch (e) {
            return false;
        }
    }

    /**
     * Format JSON display into user-friendly domain results
     */
    function formatJSONDisplay(element, jsonData) {
        // Prevent recursive formatting
        if (element.classList.contains('domain-results-formatted')) {
            return;
        }

        let formattedHTML = '';
        let isValidDomainData = false;

        // Handle different JSON response structures
        if (jsonData.domains || jsonData.results || Array.isArray(jsonData)) {
            const domains = jsonData.domains || jsonData.results || jsonData;
            if (Array.isArray(domains)) {
                formattedHTML = createDomainResultsHTML(domains);
                isValidDomainData = true;
            }
        } else if (jsonData.domain && (jsonData.status || jsonData.available !== undefined)) {
            // Single domain result
            formattedHTML = createDomainResultsHTML([jsonData]);
            isValidDomainData = true;
        } else if (jsonData.error || jsonData.message) {
            // Error response
            formattedHTML = createErrorMessageHTML(jsonData);
            isValidDomainData = true;
        } else if (jsonData.success === false || jsonData.status === 'error') {
            // Error response with different structure
            const errorMsg = jsonData.message || jsonData.error || 'An error occurred during domain search';
            formattedHTML = createErrorMessageHTML({ error: errorMsg });
            isValidDomainData = true;
        }

        if (isValidDomainData && formattedHTML) {
            const wrapper = document.createElement('div');
            wrapper.className = 'domain-results-formatted';
            wrapper.innerHTML = formattedHTML;
            
            // Replace the element with our formatted version
            if (element.parentNode) {
                element.parentNode.replaceChild(wrapper, element);
            }
        }
    }

    /**
     * Create error message HTML
     */
    function createErrorMessageHTML(errorData) {
        const errorMessage = errorData.error || errorData.message || 'An unexpected error occurred';
        return `
            <div class="bg-red-900/20 border border-red-600/50 rounded-lg p-6 animate-pulse">
                <div class="flex items-start">
                    <svg class="w-6 h-6 text-red-400 mr-3 mt-0.5 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                    </svg>
                    <div>
                        <h3 class="text-red-300 font-semibold mb-2">Domain Search Error</h3>
                        <p class="text-red-200 text-sm">${escapeHtml(errorMessage)}</p>
                        <div class="mt-4">
                            <button onclick="searchAgain()" class="btn-outline text-sm px-4 py-2">
                                <svg class="w-4 h-4 mr-2 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"/>
                                </svg>
                                Try Again
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        `;
    }

    /**
     * Escape HTML to prevent XSS
     */
    function escapeHtml(text) {
        const div = document.createElement('div');
        div.textContent = text;
        return div.innerHTML;
    }

    /**
     * Create HTML for domain results
     */
    function createDomainResultsHTML(domains) {
        if (!Array.isArray(domains) || domains.length === 0) {
            return createNoResultsHTML();
        }

        const resultsHTML = domains.map(domain => {
            const isAvailable = domain.status === 'available' || domain.available === true || domain.status === 'Available';
            const domainName = domain.domain || domain.name || domain.domainname || domain.sld + '.' + domain.tld || 'Unknown Domain';
            const price = domain.price || domain.cost || domain.pricing?.register || '';
            const currency = domain.currency || '$';
            
            const statusIcon = isAvailable 
                ? '<svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/></svg>'
                : '<svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/></svg>';
            
            const statusText = isAvailable ? 'Available for Registration' : 'Not Available';
            const statusColor = isAvailable ? 'text-neon-green' : 'text-red-400';
            const cardClass = isAvailable ? 'available' : 'unavailable';
            
            return `
                <div class="domain-result ${cardClass} group">
                    <div class="flex flex-col lg:flex-row lg:items-center lg:justify-between p-6 gap-4">
                        <div class="flex-1 min-w-0">
                            <div class="domain-name text-xl font-semibold text-white mb-2 truncate">
                                ${escapeHtml(domainName)}
                            </div>
                            <div class="domain-status flex items-center gap-2">
                                <div class="flex items-center ${statusColor}">
                                    ${statusIcon}
                                    <span class="font-medium">${statusText}</span>
                                </div>
                            </div>
                            ${isAvailable ? `
                                <div class="text-text-light text-sm mt-1">
                                    Perfect for your website, email, and more
                                </div>
                            ` : ''}
                        </div>
                        
                        ${isAvailable ? `
                            <div class="flex flex-col sm:flex-row items-start sm:items-center gap-4 pt-4 lg:pt-0 border-t lg:border-t-0 lg:border-l border-gray-700 lg:pl-6">
                                <div class="text-center sm:text-right">
                                    ${price ? `
                                        <div class="domain-price text-2xl font-bold text-neon-green">
                                            ${price.toString().includes(currency) ? escapeHtml(price) : currency + escapeHtml(price)}
                                        </div>
                                        <div class="text-text-light text-sm">per year</div>
                                    ` : `
                                        <div class="domain-price text-lg font-bold text-white">Contact us</div>
                                        <div class="text-text-light text-sm">for pricing</div>
                                    `}
                                </div>
                                <div class="domain-action w-full sm:w-auto">
                                    <a href="${getCartUrl(domainName)}" 
                                       class="btn-primary px-6 py-3 text-center w-full sm:w-auto hover:scale-105 transition-all duration-300 group-hover:shadow-glow-green">
                                        <svg class="w-4 h-4 mr-2 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"/>
                                        </svg>
                                        Add to Cart
                                    </a>
                                </div>
                            </div>
                        ` : `
                            <div class="flex flex-col gap-2 pt-4 lg:pt-0 border-t lg:border-t-0 lg:border-l border-gray-700 lg:pl-6">
                                <div class="text-text-light text-sm">This domain is not available for registration.</div>
                                <button class="btn-outline text-sm px-4 py-2 w-full sm:w-auto" onclick="suggestAlternatives('${escapeHtml(domainName)}')">
                                    <svg class="w-4 h-4 mr-2 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.663 17h4.673M12 3v1m6.364 1.636l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z"/>
                                    </svg>
                                    Find Alternatives
                                </button>
                            </div>
                        `}
                    </div>
                </div>
            `;
        }).join('');

        return `
            <div class="overflow-auto max-w-full">
                <div class="space-y-4 min-w-0">
                    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between mb-6">
                        <h2 class="text-2xl font-orbitron font-bold text-white">Search Results</h2>
                        <div class="text-text-light text-sm mt-2 sm:mt-0">
                            Found ${domains.length} result${domains.length !== 1 ? 's' : ''}
                        </div>
                    </div>
                    ${resultsHTML}
                </div>
            </div>
        `;
    }

    /**
     * Create no results HTML
     */
    function createNoResultsHTML() {
        return `
            <div class="text-center py-12 max-w-2xl mx-auto">
                <div class="bg-blue-900/20 border border-blue-600/50 rounded-lg p-8">
                    <svg class="w-16 h-16 text-blue-400 mx-auto mb-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
                    </svg>
                    <h3 class="text-blue-300 font-orbitron font-bold text-xl mb-3">No Results Found</h3>
                    <p class="text-blue-200 mb-6">
                        We couldn't find any domain results. Please try a different search term.
                    </p>
                    <button onclick="searchAgain()" class="btn-primary px-6 py-3">
                        <svg class="w-4 h-4 mr-2 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
                        </svg>
                        Try Another Search
                    </button>
                </div>
            </div>
        `;
    }

    /**
     * Get cart URL for domain
     */
    function getCartUrl(domainName) {
        const baseUrl = window.location.origin;
        return `${baseUrl}/cart.php?a=add&domain=register&query=${encodeURIComponent(domainName)}`;
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
        
        // Cleanup mutation observer
        if (window.domainSearchObserver) {
            window.domainSearchObserver.disconnect();
        }
    });

    // Add global function to handle WHMCS AJAX responses
    window.handleDomainSearchResponse = function(response) {
        const loadingOverlay = document.querySelector('.domain-search-loading-overlay');
        if (loadingOverlay) {
            loadingOverlay.remove();
        }

        if (typeof response === 'string' && isValidJSON(response)) {
            const wrapper = document.createElement('div');
            wrapper.innerHTML = response;
            document.body.appendChild(wrapper);
            formatJSONDisplay(wrapper, JSON.parse(response));
        }
    };

    // Export functions for global access
    window.domainSearchUtils = {
        formatJSONDisplay: formatJSONDisplay,
        isValidJSON: isValidJSON,
        createDomainResultsHTML: createDomainResultsHTML,
        escapeHtml: escapeHtml
    };

})();