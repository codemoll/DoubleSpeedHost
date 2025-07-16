    </main>
    
    <!-- Footer -->
    <footer id="main-footer" class="bg-dark-bg-alt border-t border-gray-800 mt-16">
        <div class="max-w-7xl mx-auto py-12 px-4 sm:px-6 lg:px-8">
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
                
                <!-- Company Info -->
                <div class="col-span-1 lg:col-span-2">
                    <div class="flex items-center space-x-3 mb-4">
                        {if isset($templatefile) && is_array($templatefile) && $templatefile.logourl}
                            <img src="{$templatefile.logourl}" alt="{$companyname}" class="h-8 w-auto">
                        {else}
                            {* Check for logo.png in images folder *}
                            <img src="{$WEB_ROOT}/templates/{$template}/images/logo.png" alt="{$companyname}" class="h-8 w-auto" 
                                 onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">
                            <div class="w-8 h-8 bg-gradient-to-br from-neon-green to-electric-blue rounded" style="display:none;"></div>
                        {/if}
                        <span class="font-orbitron font-bold text-xl glow-text">{$companyname}</span>
                    </div>
                    <p class="text-text-light text-sm mb-6 max-w-md">
                        Experience lightning-fast hosting with cutting-edge technology and 24/7 expert support. 
                        Your digital presence deserves the best infrastructure.
                    </p>
                    
                    <!-- Social Links -->
                    <div class="flex space-x-4">
                        <a href="#" class="social-link">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                                <path d="M24 4.557c-.883.392-1.832.656-2.828.775 1.017-.609 1.798-1.574 2.165-2.724-.951.564-2.005.974-3.127 1.195-.897-.957-2.178-1.555-3.594-1.555-3.179 0-5.515 2.966-4.797 6.045-4.091-.205-7.719-2.165-10.148-5.144-1.29 2.213-.669 5.108 1.523 6.574-.806-.026-1.566-.247-2.229-.616-.054 2.281 1.581 4.415 3.949 4.89-.693.188-1.452.232-2.224.084.626 1.956 2.444 3.379 4.6 3.419-2.07 1.623-4.678 2.348-7.29 2.04 2.179 1.397 4.768 2.212 7.548 2.212 9.142 0 14.307-7.721 13.995-14.646.962-.695 1.797-1.562 2.457-2.549z"/>
                            </svg>
                        </a>
                        <a href="#" class="social-link">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                                <path d="M22.46 6c-.77.35-1.6.58-2.46.69.88-.53 1.56-1.37 1.88-2.38-.83.5-1.75.85-2.72 1.05C18.37 4.5 17.26 4 16 4c-2.35 0-4.27 1.92-4.27 4.29 0 .34.04.67.11.98C8.28 9.09 5.11 7.38 3 4.79c-.37.63-.58 1.37-.58 2.15 0 1.49.75 2.81 1.91 3.56-.71 0-1.37-.2-1.95-.5v.03c0 2.08 1.48 3.82 3.44 4.21a4.22 4.22 0 0 1-1.93.07 4.28 4.28 0 0 0 4 2.98 8.521 8.521 0 0 1-5.33 1.84c-.34 0-.68-.02-1.02-.06C3.44 20.29 5.7 21 8.12 21 16 21 20.33 14.46 20.33 8.79c0-.19 0-.37-.01-.56.84-.6 1.56-1.36 2.14-2.23z"/>
                            </svg>
                        </a>
                        <a href="#" class="social-link">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                                <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/>
                            </svg>
                        </a>
                        <a href="#" class="social-link">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                                <path d="M12.017 0C5.396 0 .029 5.367.029 11.987c0 5.079 3.158 9.417 7.618 11.174-.105-.949-.199-2.403.041-3.439.219-.937 1.406-5.957 1.406-5.957s-.359-.72-.359-1.781c0-1.663.967-2.911 2.168-2.911 1.024 0 1.518.769 1.518 1.688 0 1.029-.653 2.567-.992 3.992-.285 1.193.6 2.165 1.775 2.165 2.128 0 3.768-2.245 3.768-5.487 0-2.861-2.063-4.869-5.008-4.869-3.41 0-5.409 2.562-5.409 5.199 0 1.033.394 2.143.889 2.745.097.118.112.222.085.343-.09.375-.293 1.199-.334 1.363-.053.225-.172.271-.402.165-1.495-.69-2.433-2.878-2.433-4.646 0-3.776 2.748-7.252 7.92-7.252 4.158 0 7.392 2.967 7.392 6.923 0 4.135-2.607 7.462-6.233 7.462-1.214 0-2.357-.629-2.746-1.378l-.747 2.848c-.269 1.045-1.004 2.352-1.498 3.146 1.123.345 2.306.535 3.55.535 6.624 0 11.99-5.367 11.99-11.988C24.007 5.367 18.641.001 12.017.001z"/>
                            </svg>
                        </a>
                    </div>
                </div>
                
                <!-- Quick Links -->
                <div>
                    <h3 class="text-white font-semibold font-orbitron mb-4">Quick Links</h3>
                    <ul class="space-y-2">
                        <li><a href="{$WEB_ROOT}/index.php" class="footer-link">Home</a></li>
                        <li><a href="{$WEB_ROOT}/cart.php" class="footer-link">Hosting Plans</a></li>
                        <li><a href="{$WEB_ROOT}/domainchecker.php" class="footer-link">Domain Search</a></li>
                        <li><a href="{$WEB_ROOT}/knowledgebase.php" class="footer-link">Knowledge Base</a></li>
                        <li><a href="{$WEB_ROOT}/serverstatus.php" class="footer-link">Server Status</a></li>
                        <li><a href="{$WEB_ROOT}/contact.php" class="footer-link">Contact Us</a></li>
                    </ul>
                </div>
                
                <!-- Support -->
                <div>
                    <h3 class="text-white font-semibold font-orbitron mb-4">Support</h3>
                    <ul class="space-y-2">
                        <li><a href="{$WEB_ROOT}/submitticket.php" class="footer-link">Submit Ticket</a></li>
                        <li><a href="{$WEB_ROOT}/clientarea.php" class="footer-link">Client Area</a></li>
                        <li><a href="{$WEB_ROOT}/announcements.php" class="footer-link">Announcements</a></li>
                        <li><a href="{$WEB_ROOT}/networkissues.php" class="footer-link">Network Status</a></li>
                        <li><a href="{$WEB_ROOT}/affiliates.php" class="footer-link">Affiliate Program</a></li>
                        <li><a href="{$WEB_ROOT}/pwreset.php" class="footer-link">Password Reset</a></li>
                    </ul>
                </div>
            </div>
            
            <!-- Bottom Section -->
            <div class="mt-8 pt-8 border-t border-gray-800">
                <div class="flex flex-col md:flex-row justify-between items-center">
                    <div class="text-text-light text-sm">
                        {if isset($templatefile) && is_array($templatefile) && $templatefile.footertext}
                            {$templatefile.footertext}
                        {else}
                            © {$date_year} {$companyname}. All rights reserved. Powered by cutting-edge technology.
                        {/if}
                    </div>
                    <div class="flex space-x-6 mt-4 md:mt-0">
                        <a href="{$WEB_ROOT}/legal.php?page=privacy-policy" class="footer-link-small">Privacy Policy</a>
                        <a href="{$WEB_ROOT}/legal.php?page=terms-of-service" class="footer-link-small">Terms of Service</a>
                        <a href="{$WEB_ROOT}/legal.php?page=acceptable-use-policy" class="footer-link-small">AUP</a>
                    </div>
                </div>
                
                <!-- Contact Info -->
                <div class="mt-6 pt-6 border-t border-gray-800">
                    <div class="flex flex-col md:flex-row justify-between items-center text-sm text-text-light">
                        <div class="flex flex-col md:flex-row space-y-2 md:space-y-0 md:space-x-6">
                            {if isset($templatefile) && is_array($templatefile) && $templatefile.supportphone}
                                <div class="flex items-center">
                                    <svg class="w-4 h-4 mr-2 text-neon-green" fill="currentColor" viewBox="0 0 20 20">
                                        <path d="M2 3a1 1 0 011-1h2.153a1 1 0 01.986.836l.74 4.435a1 1 0 01-.54 1.06l-1.548.773a11.037 11.037 0 006.105 6.105l.774-1.548a1 1 0 011.059-.54l4.435.74a1 1 0 01.836.986V17a1 1 0 01-1 1h-2C7.82 18 2 12.18 2 5V3z"/>
                                    </svg>
                                    <span>{$templatefile.supportphone}</span>
                                </div>
                            {/if}
                            {if isset($templatefile) && is_array($templatefile) && $templatefile.supportemail}
                                <div class="flex items-center">
                                    <svg class="w-4 h-4 mr-2 text-neon-green" fill="currentColor" viewBox="0 0 20 20">
                                        <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                                        <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                                    </svg>
                                    <span>{$templatefile.supportemail}</span>
                                </div>
                            {/if}
                        </div>
                        <div class="mt-4 md:mt-0">
                            <span class="text-neon-green">24/7 Expert Support</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    
    <!-- Back to Top Button -->
    <button id="back-to-top" class="fixed bottom-8 right-8 bg-neon-green text-dark-bg p-3 rounded-full shadow-glow-green opacity-0 transition-all duration-300 hover:scale-110 z-40">
        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 10l7-7m0 0l7 7m-7-7v18"/>
        </svg>
    </button>
    
    <style>
    /* Ensure footer appears only once on mobile and desktop */
    #main-footer:not(:first-of-type) {
        display: none !important;
    }
    
    /* Prevent footer duplication - hide any footer after the first one */
    body footer:nth-of-type(n+2) {
        display: none !important;
    }
    
    /* Additional safeguard for multiple footer elements */
    footer + footer {
        display: none !important;
    }
    
    /* Ensure navigation doesn't duplicate */
    nav:nth-of-type(n+2) {
        display: none !important;
    }
    
    .social-link {
        @apply text-text-light hover:text-neon-green transition-all duration-300 p-2 rounded-lg hover:bg-dark-surface hover:shadow-glow-green;
    }
    
    .footer-link {
        @apply text-text-light hover:text-neon-green transition-colors duration-300 text-sm;
    }
    
    .footer-link-small {
        @apply text-text-light hover:text-neon-green transition-colors duration-300 text-xs;
    }
    </style>
    
    <script>
    // Back to top functionality
    const backToTopButton = document.getElementById('back-to-top');
    
    window.addEventListener('scroll', function() {
        if (window.pageYOffset > 300) {
            backToTopButton.classList.remove('opacity-0');
            backToTopButton.classList.add('opacity-100');
        } else {
            backToTopButton.classList.add('opacity-0');
            backToTopButton.classList.remove('opacity-100');
        }
    });
    
    backToTopButton.addEventListener('click', function() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
    
    // Add smooth scroll to internal anchor links only
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            const href = this.getAttribute('href');
            if (href && href !== '#') {
                e.preventDefault();
                const target = document.querySelector(href);
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            }
        });
    });
    
    // Menu functionality is now handled by theme.js to avoid conflicts
    </script>
    
    <!-- WHMCS Template JavaScript Files -->
    <script src="{$WEB_ROOT}/templates/{$template}/js/scripts.min.js"></script>
    <script src="{$WEB_ROOT}/templates/{$template}/js/whmcs.js"></script>
    <script src="{$WEB_ROOT}/templates/{$template}/js/twitter.js"></script>
    <script src="{$WEB_ROOT}/templates/{$template}/js/theme.js"></script>
    
    <!-- Conditional Domain Search Enhancement -->
    <script>
    // Load domain search enhancements for pages that might show domain results
    (function() {
        const needsDomainScript = 
            window.location.pathname.includes('domainchecker') ||
            window.location.pathname.includes('cart') ||
            window.location.pathname.includes('order') ||
            window.location.pathname.includes('configure') ||
            document.querySelector('#domain-search-form') ||
            document.querySelector('.domain-result') ||
            document.querySelector('[id*="domain"]') ||
            document.querySelector('[class*="domain"]');
            
        if (needsDomainScript) {
            const script = document.createElement('script');
            script.src = '{$WEB_ROOT}/templates/{$template}/js/domain-search.js';
            script.async = true;
            document.head.appendChild(script);
        }
    })();
    </script>
    
    {$footeroutput}
</body>
</html>