{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-7xl mx-auto">
        
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-3xl md:text-4xl font-orbitron font-bold text-white mb-4">
                <span class="glow-text">Support</span> Center
            </h1>
            <p class="text-text-light text-lg">
                Get help from our expert support team. We're here 24/7 to assist you.
            </p>
        </div>
        
        <!-- Quick Actions -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-12">
            <a href="{$WEB_ROOT}/submitticket.php" class="card-dark group text-center hover:scale-105 transition-transform duration-300">
                <div class="w-16 h-16 bg-gradient-to-br from-neon-green to-electric-blue rounded-lg flex items-center justify-center mx-auto mb-4 group-hover:scale-110 transition-transform duration-300">
                    <svg class="w-8 h-8 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-xl font-orbitron font-semibold text-white mb-2">Submit Ticket</h3>
                <p class="text-text-light">Get personalized help from our technical experts</p>
            </a>
            
            <a href="{$WEB_ROOT}/knowledgebase.php" class="card-dark group text-center hover:scale-105 transition-transform duration-300">
                <div class="w-16 h-16 bg-gradient-to-br from-electric-blue to-cyber-purple rounded-lg flex items-center justify-center mx-auto mb-4 group-hover:scale-110 transition-transform duration-300">
                    <svg class="w-8 h-8 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-orbitron font-semibold text-white mb-2">Knowledge Base</h3>
                <p class="text-text-light">Find answers to common questions instantly</p>
            </a>
            
            <a href="{$WEB_ROOT}/serverstatus.php" class="card-dark group text-center hover:scale-105 transition-transform duration-300">
                <div class="w-16 h-16 bg-gradient-to-br from-cyber-purple to-neon-green rounded-lg flex items-center justify-center mx-auto mb-4 group-hover:scale-110 transition-transform duration-300">
                    <svg class="w-8 h-8 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M3 3a1 1 0 000 2v8a2 2 0 002 2h2.586l-1.293 1.293a1 1 0 101.414 1.414L10 15.414l2.293 2.293a1 1 0 001.414-1.414L12.414 15H15a2 2 0 002-2V5a1 1 0 100-2H3zm11.707 4.707a1 1 0 00-1.414-1.414L10 9.586 8.707 8.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-xl font-orbitron font-semibold text-white mb-2">Server Status</h3>
                <p class="text-text-light">Check real-time server performance and uptime</p>
            </a>
        </div>
        
        <!-- FAQ Section -->
        <section class="mb-12">
            <div class="text-center mb-8">
                <h2 class="text-3xl font-orbitron font-bold text-white mb-4">
                    Frequently Asked <span class="glow-text">Questions</span>
                </h2>
                <p class="text-text-light text-lg">
                    Quick answers to the most common questions
                </p>
            </div>
            
            <div class="max-w-4xl mx-auto space-y-4">
                <!-- FAQ Item 1 -->
                <div class="card-dark">
                    <button class="faq-toggle w-full text-left flex items-center justify-between p-6" data-target="faq-1">
                        <h3 class="text-lg font-semibold text-white">How do I get started with hosting?</h3>
                        <svg class="w-6 h-6 text-neon-green transform transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>
                        </svg>
                    </button>
                    <div id="faq-1" class="faq-content hidden px-6 pb-6">
                        <p class="text-text-light">
                            Getting started is easy! Choose a hosting plan that fits your needs, complete the checkout process, 
                            and you'll receive your login credentials via email. Our team will help you migrate your existing 
                            website or set up a new one.
                        </p>
                    </div>
                </div>
                
                <!-- FAQ Item 2 -->
                <div class="card-dark">
                    <button class="faq-toggle w-full text-left flex items-center justify-between p-6" data-target="faq-2">
                        <h3 class="text-lg font-semibold text-white">What is your uptime guarantee?</h3>
                        <svg class="w-6 h-6 text-neon-green transform transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>
                        </svg>
                    </button>
                    <div id="faq-2" class="faq-content hidden px-6 pb-6">
                        <p class="text-text-light">
                            We guarantee 99.9% uptime for all our hosting services. If we fail to meet this guarantee, 
                            you'll receive service credits. Our redundant infrastructure and 24/7 monitoring ensure 
                            maximum reliability for your website.
                        </p>
                    </div>
                </div>
                
                <!-- FAQ Item 3 -->
                <div class="card-dark">
                    <button class="faq-toggle w-full text-left flex items-center justify-between p-6" data-target="faq-3">
                        <h3 class="text-lg font-semibold text-white">Do you offer website migration?</h3>
                        <svg class="w-6 h-6 text-neon-green transform transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>
                        </svg>
                    </button>
                    <div id="faq-3" class="faq-content hidden px-6 pb-6">
                        <p class="text-text-light">
                            Yes! We offer free website migration for all new customers. Our technical team will handle 
                            the entire migration process, ensuring zero downtime and no data loss. Simply provide us 
                            with your current hosting details and we'll take care of the rest.
                        </p>
                    </div>
                </div>
                
                <!-- FAQ Item 4 -->
                <div class="card-dark">
                    <button class="faq-toggle w-full text-left flex items-center justify-between p-6" data-target="faq-4">
                        <h3 class="text-lg font-semibold text-white">What payment methods do you accept?</h3>
                        <svg class="w-6 h-6 text-neon-green transform transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>
                        </svg>
                    </button>
                    <div id="faq-4" class="faq-content hidden px-6 pb-6">
                        <p class="text-text-light">
                            We accept all major credit cards (Visa, MasterCard, American Express), PayPal, bank transfers, 
                            and cryptocurrency payments. All transactions are secured with SSL encryption and we never 
                            store your payment information on our servers.
                        </p>
                    </div>
                </div>
                
                <!-- FAQ Item 5 -->
                <div class="card-dark">
                    <button class="faq-toggle w-full text-left flex items-center justify-between p-6" data-target="faq-5">
                        <h3 class="text-lg font-semibold text-white">How can I contact support?</h3>
                        <svg class="w-6 h-6 text-neon-green transform transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>
                        </svg>
                    </button>
                    <div id="faq-5" class="faq-content hidden px-6 pb-6">
                        <p class="text-text-light">
                            Our support team is available 24/7 through multiple channels: submit a support ticket through 
                            your client area, use our live chat feature, call us directly, or send an email. We typically 
                            respond to tickets within 30 minutes.
                        </p>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Contact Form Section -->
        <section class="mb-12">
            <div class="max-w-4xl mx-auto">
                <div class="text-center mb-8">
                    <h2 class="text-3xl font-orbitron font-bold text-white mb-4">
                        Still Need <span class="glow-text">Help?</span>
                    </h2>
                    <p class="text-text-light text-lg">
                        Send us a message and we'll get back to you as soon as possible
                    </p>
                </div>
                
                <div class="card-dark">
                    <form method="post" action="{$WEB_ROOT}/contact.php" class="space-y-6">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label for="name" class="block text-sm font-medium text-text-light mb-2">
                                    Name <span class="text-red-400">*</span>
                                </label>
                                <input id="name" name="name" type="text" required 
                                       class="input-dark w-full focus:shadow-glow-green" 
                                       placeholder="Enter your full name">
                            </div>
                            
                            <div>
                                <label for="email" class="block text-sm font-medium text-text-light mb-2">
                                    Email <span class="text-red-400">*</span>
                                </label>
                                <input id="email" name="email" type="email" required 
                                       class="input-dark w-full focus:shadow-glow-green" 
                                       placeholder="Enter your email address">
                            </div>
                        </div>
                        
                        <div>
                            <label for="subject" class="block text-sm font-medium text-text-light mb-2">
                                Subject <span class="text-red-400">*</span>
                            </label>
                            <input id="subject" name="subject" type="text" required 
                                   class="input-dark w-full focus:shadow-glow-green" 
                                   placeholder="What can we help you with?">
                        </div>
                        
                        <div>
                            <label for="message" class="block text-sm font-medium text-text-light mb-2">
                                Message <span class="text-red-400">*</span>
                            </label>
                            <textarea id="message" name="message" rows="6" required 
                                      class="input-dark w-full focus:shadow-glow-green" 
                                      placeholder="Please describe your question or issue in detail..."></textarea>
                        </div>
                        
                        <div class="flex items-center justify-between">
                            <p class="text-sm text-text-light">
                                Response time: <span class="text-neon-green font-medium">Usually within 30 minutes</span>
                            </p>
                            <button type="submit" class="btn-primary px-8">
                                <svg class="w-5 h-5 mr-2 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"/>
                                </svg>
                                Send Message
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        
        <!-- Contact Info -->
        <section>
            <div class="bg-dark-bg-alt rounded-lg p-8">
                <div class="text-center mb-8">
                    <h2 class="text-2xl font-orbitron font-bold text-white mb-4">
                        Get In <span class="glow-text">Touch</span>
                    </h2>
                    <p class="text-text-light">
                        Multiple ways to reach our support team
                    </p>
                </div>
                
                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                    <div class="text-center">
                        <div class="w-12 h-12 bg-gradient-to-br from-neon-green to-electric-blue rounded-lg flex items-center justify-center mx-auto mb-4">
                            <svg class="w-6 h-6 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M2 3a1 1 0 011-1h2.153a1 1 0 01.986.836l.74 4.435a1 1 0 01-.54 1.06l-1.548.773a11.037 11.037 0 006.105 6.105l.774-1.548a1 1 0 011.059-.54l4.435.74a1 1 0 01.836.986V17a1 1 0 01-1 1h-2C7.82 18 2 12.18 2 5V3z"/>
                            </svg>
                        </div>
                        <h3 class="text-white font-semibold mb-2">Phone Support</h3>
                        <p class="text-text-light text-sm mb-2">Available 24/7</p>
                        <p class="text-neon-green font-medium">+1 (555) 123-4567</p>
                    </div>
                    
                    <div class="text-center">
                        <div class="w-12 h-12 bg-gradient-to-br from-electric-blue to-cyber-purple rounded-lg flex items-center justify-center mx-auto mb-4">
                            <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                                <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                            </svg>
                        </div>
                        <h3 class="text-white font-semibold mb-2">Email Support</h3>
                        <p class="text-text-light text-sm mb-2">Response within 30 minutes</p>
                        <p class="text-electric-blue font-medium">support@doublespeedhost.com</p>
                    </div>
                    
                    <div class="text-center">
                        <div class="w-12 h-12 bg-gradient-to-br from-cyber-purple to-neon-green rounded-lg flex items-center justify-center mx-auto mb-4">
                            <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M18 10c0 3.866-3.582 7-8 7a8.841 8.841 0 01-4.083-.98L2 17l1.338-3.123C2.493 12.767 2 11.434 2 10c0-3.866 3.582-7 8-7s8 3.134 8 7zM7 9H5v2h2V9zm8 0h-2v2h2V9zM9 9h2v2H9V9z" clip-rule="evenodd"/>
                            </svg>
                        </div>
                        <h3 class="text-white font-semibold mb-2">Live Chat</h3>
                        <p class="text-text-light text-sm mb-2">Instant help available</p>
                        <button class="text-cyber-purple font-medium hover:text-neon-green transition-colors duration-300">
                            Start Chat
                        </button>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

<script>
// FAQ Toggle Functionality
document.addEventListener('DOMContentLoaded', function() {
    const faqToggles = document.querySelectorAll('.faq-toggle');
    
    faqToggles.forEach(toggle => {
        toggle.addEventListener('click', function() {
            const targetId = this.getAttribute('data-target');
            const content = document.getElementById(targetId);
            const icon = this.querySelector('svg');
            
            // Close all other FAQ items
            faqToggles.forEach(otherToggle => {
                if (otherToggle !== this) {
                    const otherId = otherToggle.getAttribute('data-target');
                    const otherContent = document.getElementById(otherId);
                    const otherIcon = otherToggle.querySelector('svg');
                    
                    otherContent.classList.add('hidden');
                    otherIcon.classList.remove('rotate-180');
                }
            });
            
            // Toggle current FAQ item
            if (content.classList.contains('hidden')) {
                content.classList.remove('hidden');
                icon.classList.add('rotate-180');
            } else {
                content.classList.add('hidden');
                icon.classList.remove('rotate-180');
            }
        });
    });
});
</script>

{include file="$template/footer.tpl"}