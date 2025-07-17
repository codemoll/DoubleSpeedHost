    </main>
    
    <!-- Footer -->
    <footer id="main-footer" class="footer-main mt-5">
        <div class="container">
            <div class="row">
                
                <!-- Company Info -->
                <div class="col-md-6 col-lg-6 mb-4">
                    <div class="d-flex align-items-center mb-3">
                        {if isset($templatefile) && is_array($templatefile) && $templatefile.logourl}
                            <img src="{$templatefile.logourl}" alt="{$companyname}" class="footer-logo me-3">
                        {else}
                            {* Check for logo.png in images folder *}
                            <img src="{$WEB_ROOT}/templates/{$template}/images/logo.png" alt="{$companyname}" class="footer-logo me-3" 
                                 onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">
                            <div class="footer-logo-fallback me-3" style="display:none;"></div>
                        {/if}
                        <span class="footer-brand-text">{$companyname}</span>
                    </div>
                    <p class="footer-description mb-4">
                        Experience lightning-fast hosting with cutting-edge technology and 24/7 expert support. 
                        Your digital presence deserves the best infrastructure.
                    </p>
                    
                    <!-- Social Links -->
                    <div class="footer-social-links">
                        <a href="#" class="social-link me-2" title="Twitter">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="#" class="social-link me-2" title="Facebook">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="#" class="social-link me-2" title="LinkedIn">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        <a href="#" class="social-link me-2" title="Instagram">
                            <i class="fab fa-instagram"></i>
                        </a>
                    </div>
                </div>
                
                <!-- Quick Links -->
                <div class="col-md-3 col-lg-3 mb-4">
                    <h5 class="footer-heading mb-3">Quick Links</h5>
                    <ul class="list-unstyled footer-links">
                        <li class="mb-2"><a href="{$WEB_ROOT}/index.php" class="footer-link">Home</a></li>
                        <li class="mb-2"><a href="{$WEB_ROOT}/cart.php" class="footer-link">Hosting Plans</a></li>
                        <li class="mb-2"><a href="{$WEB_ROOT}/domainchecker.php" class="footer-link">Domain Search</a></li>
                        <li class="mb-2"><a href="{$WEB_ROOT}/knowledgebase.php" class="footer-link">Knowledge Base</a></li>
                        <li class="mb-2"><a href="{$WEB_ROOT}/serverstatus.php" class="footer-link">Server Status</a></li>
                        <li class="mb-2"><a href="{$WEB_ROOT}/contact.php" class="footer-link">Contact Us</a></li>
                    </ul>
                </div>
                
                <!-- Support -->
                <div class="col-md-3 col-lg-3 mb-4">
                    <h5 class="footer-heading mb-3">Support</h5>
                    <ul class="list-unstyled footer-links">
                        <li class="mb-2"><a href="{$WEB_ROOT}/submitticket.php" class="footer-link">Submit Ticket</a></li>
                        <li class="mb-2"><a href="{$WEB_ROOT}/clientarea.php" class="footer-link">Client Area</a></li>
                        <li class="mb-2"><a href="{$WEB_ROOT}/announcements.php" class="footer-link">Announcements</a></li>
                        <li class="mb-2"><a href="{$WEB_ROOT}/networkissues.php" class="footer-link">Network Status</a></li>
                        <li class="mb-2"><a href="{$WEB_ROOT}/affiliates.php" class="footer-link">Affiliate Program</a></li>
                        <li class="mb-2"><a href="{$WEB_ROOT}/pwreset.php" class="footer-link">Password Reset</a></li>
                    </ul>
                </div>
            </div>
            
            <!-- Bottom Section -->
            <div class="footer-bottom pt-4 mt-4">
                <div class="row align-items-center">
                    <div class="col-md-8 mb-3 mb-md-0">
                        <p class="footer-copyright mb-0">
                            {if isset($templatefile) && is_array($templatefile) && $templatefile.footertext}
                                {$templatefile.footertext}
                            {else}
                                © {$date_year} {$companyname}. All rights reserved. Powered by cutting-edge technology.
                            {/if}
                        </p>
                    </div>
                    <div class="col-md-4">
                        <div class="footer-legal-links text-md-end">
                            <a href="{$WEB_ROOT}/legal.php?page=privacy-policy" class="footer-link-small me-3">Privacy Policy</a>
                            <a href="{$WEB_ROOT}/legal.php?page=terms-of-service" class="footer-link-small me-3">Terms of Service</a>
                            <a href="{$WEB_ROOT}/legal.php?page=acceptable-use-policy" class="footer-link-small">AUP</a>
                        </div>
                    </div>
                </div>
                
                <!-- Contact Info -->
                <div class="footer-contact pt-4 mt-4">
                    <div class="row align-items-center">
                        <div class="col-md-8">
                            <div class="d-flex flex-column flex-md-row">
                                {if isset($templatefile) && is_array($templatefile) && $templatefile.supportphone}
                                    <div class="d-flex align-items-center me-md-4 mb-2 mb-md-0">
                                        <i class="fas fa-phone me-2 text-primary"></i>
                                        <span class="footer-contact-text">{$templatefile.supportphone}</span>
                                    </div>
                                {/if}
                                {if isset($templatefile) && is_array($templatefile) && $templatefile.supportemail}
                                    <div class="d-flex align-items-center">
                                        <i class="fas fa-envelope me-2 text-primary"></i>
                                        <span class="footer-contact-text">{$templatefile.supportemail}</span>
                                    </div>
                                {/if}
                            </div>
                        </div>
                        <div class="col-md-4 text-md-end">
                            <span class="footer-support-text">24/7 Expert Support</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    
    <!-- Back to Top Button -->
    <button id="back-to-top" class="btn btn-primary btn-floating back-to-top" title="Back to Top">
        <i class="fas fa-arrow-up"></i>
    </button>
    
    <style>
    /* Footer Styles - WHMCS Six Compatible */
    .footer-main {
        background-color: var(--ds-dark-bg-alt);
        border-top: 1px solid var(--ds-gray-700);
        padding: 3rem 0 1rem 0;
        color: var(--ds-text-light);
    }
    
    .footer-logo {
        height: 32px;
        width: auto;
    }
    
    .footer-logo-fallback {
        width: 32px;
        height: 32px;
        background: linear-gradient(135deg, var(--ds-neon-green), var(--ds-electric-blue));
        border-radius: 4px;
    }
    
    .footer-brand-text {
        font-family: 'Orbitron', monospace;
        font-weight: 700;
        font-size: 1.25rem;
        color: var(--ds-text-white);
        text-shadow: 0 0 10px rgba(0, 255, 136, 0.3);
    }
    
    .footer-description {
        color: var(--ds-text-light);
        font-size: 0.875rem;
        line-height: 1.6;
        max-width: 400px;
    }
    
    .footer-heading {
        color: var(--ds-text-white);
        font-family: 'Orbitron', monospace;
        font-weight: 600;
        font-size: 1rem;
        margin-bottom: 1rem;
    }
    
    .footer-links {
        margin: 0;
        padding: 0;
    }
    
    .footer-link {
        color: var(--ds-text-light);
        text-decoration: none;
        font-size: 0.875rem;
        transition: color 0.3s ease;
    }
    
    .footer-link:hover {
        color: var(--ds-neon-green);
        text-decoration: none;
    }
    
    .footer-link-small {
        color: var(--ds-text-light);
        text-decoration: none;
        font-size: 0.75rem;
        transition: color 0.3s ease;
    }
    
    .footer-link-small:hover {
        color: var(--ds-neon-green);
        text-decoration: none;
    }
    
    .footer-social-links {
        display: flex;
        gap: 0.5rem;
    }
    
    .social-link {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 40px;
        height: 40px;
        background-color: var(--ds-dark-surface);
        color: var(--ds-text-light);
        border-radius: 8px;
        text-decoration: none;
        transition: all 0.3s ease;
        border: 1px solid var(--ds-gray-700);
    }
    
    .social-link:hover {
        color: var(--ds-neon-green);
        background-color: rgba(0, 255, 136, 0.1);
        border-color: var(--ds-neon-green);
        box-shadow: 0 0 10px rgba(0, 255, 136, 0.3);
        text-decoration: none;
    }
    
    .footer-bottom {
        border-top: 1px solid var(--ds-gray-700);
    }
    
    .footer-contact {
        border-top: 1px solid var(--ds-gray-700);
    }
    
    .footer-copyright {
        color: var(--ds-text-light);
        font-size: 0.875rem;
    }
    
    .footer-contact-text {
        color: var(--ds-text-light);
        font-size: 0.875rem;
    }
    
    .footer-support-text {
        color: var(--ds-neon-green);
        font-weight: 600;
        font-size: 0.875rem;
    }
    
    .back-to-top {
        position: fixed;
        bottom: 2rem;
        right: 2rem;
        z-index: 1000;
        border-radius: 50%;
        width: 50px;
        height: 50px;
        opacity: 0;
        visibility: hidden;
        transition: all 0.3s ease;
    }
    
    .back-to-top.show {
        opacity: 1;
        visibility: visible;
    }
    
    .back-to-top:hover {
        transform: scale(1.1);
        box-shadow: var(--ds-glow-green);
    }
    
    /* Ensure footer appears only once */
    #main-footer:not(:first-of-type),
    body footer:nth-of-type(n+2),
    footer + footer {
        display: none !important;
    }
    
    /* Prevent navigation duplication */
    nav:nth-of-type(n+2) {
        display: none !important;
    }
    
    @media (max-width: 767.98px) {
        .footer-main {
            padding: 2rem 0 1rem 0;
        }
        
        .footer-social-links {
            justify-content: center;
            margin: 1rem 0;
        }
        
        .footer-legal-links {
            text-align: center !important;
        }
    }
    </style>
    
    <script>
    // Back to top functionality
    const backToTopButton = document.getElementById('back-to-top');
    
    function handleScroll() {
        if (window.pageYOffset > 300) {
            backToTopButton.classList.add('show');
        } else {
            backToTopButton.classList.remove('show');
        }
    }
    
    window.addEventListener('scroll', handleScroll);
    
    backToTopButton.addEventListener('click', function(e) {
        e.preventDefault();
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