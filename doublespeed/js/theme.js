/**
 * DoubleSpeed Host Template JavaScript
 * Handles interactions and animations for the dark tech theme
 */

(function() {
    'use strict';

    // Initialize when DOM is loaded
    document.addEventListener('DOMContentLoaded', function() {
        initScrollAnimations();
        initGlowEffects();
        initTooltips();
        initCounters();
        initParticleEffects();
    });

    /**
     * Initialize scroll-based animations
     */
    function initScrollAnimations() {
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver(function(entries) {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate-in');
                }
            });
        }, observerOptions);

        // Observe elements with animation classes
        document.querySelectorAll('.card-dark, .pricing-card, .btn-primary').forEach(el => {
            observer.observe(el);
        });
    }

    /**
     * Enhanced glow effects on hover
     */
    function initGlowEffects() {
        const glowElements = document.querySelectorAll('.btn-primary, .btn-secondary, .btn-outline');
        
        glowElements.forEach(element => {
            element.addEventListener('mouseenter', function() {
                this.style.transform = 'scale(1.05)';
                this.style.filter = 'brightness(1.2)';
            });
            
            element.addEventListener('mouseleave', function() {
                this.style.transform = 'scale(1)';
                this.style.filter = 'brightness(1)';
            });
        });
    }

    /**
     * Initialize tooltips
     */
    function initTooltips() {
        const tooltipElements = document.querySelectorAll('[data-tooltip]');
        
        tooltipElements.forEach(element => {
            element.addEventListener('mouseenter', function(e) {
                showTooltip(e.target, e.target.getAttribute('data-tooltip'));
            });
            
            element.addEventListener('mouseleave', function() {
                hideTooltip();
            });
        });
    }

    function showTooltip(element, text) {
        const tooltip = document.createElement('div');
        tooltip.className = 'tooltip';
        tooltip.textContent = text;
        tooltip.style.cssText = `
            position: absolute;
            background: rgba(0, 26, 26, 0.95);
            color: #00FF88;
            padding: 8px 12px;
            border-radius: 6px;
            font-size: 14px;
            border: 1px solid #00FF88;
            box-shadow: 0 0 20px rgba(0, 255, 136, 0.3);
            z-index: 1000;
            pointer-events: none;
        `;
        
        document.body.appendChild(tooltip);
        
        const rect = element.getBoundingClientRect();
        tooltip.style.left = rect.left + (rect.width / 2) - (tooltip.offsetWidth / 2) + 'px';
        tooltip.style.top = rect.top - tooltip.offsetHeight - 10 + 'px';
    }

    function hideTooltip() {
        const tooltip = document.querySelector('.tooltip');
        if (tooltip) {
            tooltip.remove();
        }
    }

    /**
     * Animated counters for statistics
     */
    function initCounters() {
        const counters = document.querySelectorAll('[data-count]');
        
        counters.forEach(counter => {
            const target = parseInt(counter.getAttribute('data-count'));
            const duration = 2000;
            const increment = target / (duration / 16);
            let current = 0;
            
            const timer = setInterval(() => {
                current += increment;
                if (current >= target) {
                    current = target;
                    clearInterval(timer);
                }
                counter.textContent = Math.floor(current);
            }, 16);
        });
    }

    /**
     * Particle effect background
     */
    function initParticleEffects() {
        const canvas = document.createElement('canvas');
        canvas.className = 'particle-canvas';
        canvas.style.cssText = `
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -1;
            opacity: 0.3;
        `;
        
        document.body.appendChild(canvas);
        
        const ctx = canvas.getContext('2d');
        let particles = [];
        
        function resizeCanvas() {
            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;
        }
        
        function createParticle() {
            return {
                x: Math.random() * canvas.width,
                y: Math.random() * canvas.height,
                vx: (Math.random() - 0.5) * 0.5,
                vy: (Math.random() - 0.5) * 0.5,
                size: Math.random() * 2 + 1,
                color: `hsl(${Math.random() * 60 + 120}, 70%, 50%)` // Green to blue spectrum
            };
        }
        
        function initParticles() {
            particles = [];
            for (let i = 0; i < 50; i++) {
                particles.push(createParticle());
            }
        }
        
        function updateParticles() {
            particles.forEach(particle => {
                particle.x += particle.vx;
                particle.y += particle.vy;
                
                if (particle.x < 0 || particle.x > canvas.width) particle.vx *= -1;
                if (particle.y < 0 || particle.y > canvas.height) particle.vy *= -1;
            });
        }
        
        function drawParticles() {
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            
            particles.forEach(particle => {
                ctx.beginPath();
                ctx.arc(particle.x, particle.y, particle.size, 0, Math.PI * 2);
                ctx.fillStyle = particle.color;
                ctx.fill();
                
                // Draw connections between nearby particles
                particles.forEach(otherParticle => {
                    const distance = Math.sqrt(
                        Math.pow(particle.x - otherParticle.x, 2) + 
                        Math.pow(particle.y - otherParticle.y, 2)
                    );
                    
                    if (distance < 100) {
                        ctx.beginPath();
                        ctx.moveTo(particle.x, particle.y);
                        ctx.lineTo(otherParticle.x, otherParticle.y);
                        ctx.strokeStyle = `rgba(0, 255, 136, ${0.1 - distance / 1000})`;
                        ctx.stroke();
                    }
                });
            });
        }
        
        function animate() {
            updateParticles();
            drawParticles();
            requestAnimationFrame(animate);
        }
        
        resizeCanvas();
        initParticles();
        animate();
        
        window.addEventListener('resize', () => {
            resizeCanvas();
            initParticles();
        });
    }

    /**
     * Smooth scrolling for anchor links - improved version
     */
    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                const href = this.getAttribute('href');
                // Only handle non-empty hash links that aren't just "#"
                if (href && href !== '#' && href.length > 1) {
                    const target = document.querySelector(href);
                    if (target) {
                        e.preventDefault();
                        target.scrollIntoView({
                            behavior: 'smooth',
                            block: 'start'
                        });
                    }
                }
            });
        });
    });

    /**
     * Form validation enhancements
     */
    const forms = document.querySelectorAll('form');
    forms.forEach(form => {
        const inputs = form.querySelectorAll('input, textarea, select');
        
        inputs.forEach(input => {
            input.addEventListener('blur', function() {
                validateField(this);
            });
            
            input.addEventListener('input', function() {
                if (this.classList.contains('error')) {
                    validateField(this);
                }
            });
        });
    });

    function validateField(field) {
        const value = field.value.trim();
        let isValid = true;
        let message = '';

        // Remove existing error styling
        field.classList.remove('error');
        const existingError = field.parentNode.querySelector('.error-message');
        if (existingError) {
            existingError.remove();
        }

        // Check if field is required and empty
        if (field.hasAttribute('required') && !value) {
            isValid = false;
            message = 'This field is required';
        }

        // Email validation
        if (field.type === 'email' && value) {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(value)) {
                isValid = false;
                message = 'Please enter a valid email address';
            }
        }

        // Password validation
        if (field.type === 'password' && value) {
            if (value.length < 8) {
                isValid = false;
                message = 'Password must be at least 8 characters long';
            }
        }

        // Show error if validation fails
        if (!isValid) {
            field.classList.add('error');
            const errorDiv = document.createElement('div');
            errorDiv.className = 'error-message text-red-400 text-sm mt-1';
            errorDiv.textContent = message;
            field.parentNode.appendChild(errorDiv);
        }

        return isValid;
    }

    /**
     * Loading states for forms
     */
    document.querySelectorAll('form').forEach(form => {
        form.addEventListener('submit', function() {
            const submitBtn = this.querySelector('button[type="submit"]');
            if (submitBtn) {
                submitBtn.disabled = true;
                submitBtn.innerHTML = `
                    <svg class="animate-spin w-5 h-5 mr-2 inline" fill="none" viewBox="0 0 24 24">
                        <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                        <path class="opacity-75" fill="currentColor" d="m4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                    </svg>
                    Processing...
                `;
            }
        });
    });

    /**
     * Enhanced menu functionality
     */
    function initMenus() {
        // Mobile menu functionality
        const mobileMenuButton = document.getElementById('mobile-menu-button');
        const mobileMenu = document.getElementById('mobile-menu');
        
        if (mobileMenuButton && mobileMenu) {
            mobileMenuButton.addEventListener('click', function(e) {
                e.preventDefault();
                e.stopPropagation();
                mobileMenu.classList.toggle('hidden');
                // Close user menu if open
                const userMenu = document.getElementById('user-menu');
                if (userMenu) {
                    userMenu.classList.add('hidden');
                }
            });
        }
        
        // User menu functionality
        const userMenuButton = document.getElementById('user-menu-button');
        const userMenu = document.getElementById('user-menu');
        
        if (userMenuButton && userMenu) {
            userMenuButton.addEventListener('click', function(e) {
                e.preventDefault();
                e.stopPropagation();
                userMenu.classList.toggle('hidden');
                // Close mobile menu if open
                if (mobileMenu) {
                    mobileMenu.classList.add('hidden');
                }
            });
        }
        
        // Close menus when clicking outside
        document.addEventListener('click', function(event) {
            if (mobileMenu && mobileMenuButton && 
                !mobileMenuButton.contains(event.target) && 
                !mobileMenu.contains(event.target)) {
                mobileMenu.classList.add('hidden');
            }
            
            if (userMenu && userMenuButton && 
                !userMenuButton.contains(event.target) && 
                !userMenu.contains(event.target)) {
                userMenu.classList.add('hidden');
            }
        });
        
        // Close menus on escape key
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                if (mobileMenu) mobileMenu.classList.add('hidden');
                if (userMenu) userMenu.classList.add('hidden');
            }
        });
    }

    // Initialize enhanced menu functionality
    document.addEventListener('DOMContentLoaded', function() {
        initMenus();
    });

})();