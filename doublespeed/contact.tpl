{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                <span class="glow-text">Contact Us</span>
            </h1>
            <p class="text-text-light text-lg">
                Get in touch with our expert support team. We're here to help 24/7.
            </p>
        </div>
        
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            
            <!-- Contact Form -->
            <div class="card-dark">
                <h2 class="text-2xl font-semibold text-white mb-6">Send us a Message</h2>
                
                <form method="post" action="{$smarty.server.PHP_SELF}" class="space-y-6">
                    {if $sent}
                        <div class="bg-green-900 border border-green-700 rounded-lg p-4">
                            <div class="flex">
                                <svg class="w-5 h-5 text-green-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                                </svg>
                                <div class="text-green-200 text-sm">
                                    Thank you for your message! We'll get back to you within 24 hours.
                                </div>
                            </div>
                        </div>
                    {/if}
                    
                    {if $errormessage}
                        <div class="bg-red-900 border border-red-700 rounded-lg p-4">
                            <div class="flex">
                                <svg class="w-5 h-5 text-red-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                                </svg>
                                <div class="text-red-200 text-sm">{$errormessage}</div>
                            </div>
                        </div>
                    {/if}
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label for="name" class="block text-sm font-medium text-white mb-2">Name *</label>
                            <input type="text" id="name" name="name" required 
                                   class="input-dark w-full" placeholder="Your full name"
                                   value="{if isset($smarty.post.name)}{$smarty.post.name}{/if}">
                        </div>
                        <div>
                            <label for="email" class="block text-sm font-medium text-white mb-2">Email *</label>
                            <input type="email" id="email" name="email" required 
                                   class="input-dark w-full" placeholder="your@email.com"
                                   value="{if isset($smarty.post.email)}{$smarty.post.email}{/if}">
                        </div>
                    </div>
                    
                    <div>
                        <label for="subject" class="block text-sm font-medium text-white mb-2">Subject *</label>
                        <input type="text" id="subject" name="subject" required 
                               class="input-dark w-full" placeholder="How can we help?"
                               value="{if isset($smarty.post.subject)}{$smarty.post.subject}{/if}">
                    </div>
                    
                    <div>
                        <label for="message" class="block text-sm font-medium text-white mb-2">Message *</label>
                        <textarea id="message" name="message" rows="6" required 
                                  class="input-dark w-full" placeholder="Tell us more about your inquiry...">{if isset($smarty.post.message)}{$smarty.post.message}{/if}</textarea>
                    </div>
                    
                    {if $recaptchahtml}
                        <div>{$recaptchahtml}</div>
                    {/if}
                    
                    <button type="submit" name="submit" class="btn-primary w-full">
                        Send Message
                    </button>
                </form>
            </div>
            
            <!-- Contact Information -->
            <div class="space-y-6">
                
                <!-- Support Hours -->
                <div class="card-dark">
                    <h3 class="text-xl font-semibold text-white mb-4">Support Hours</h3>
                    <div class="space-y-3">
                        <div class="flex justify-between">
                            <span class="text-text-light">Monday - Friday</span>
                            <span class="text-neon-green">24/7</span>
                        </div>
                        <div class="flex justify-between">
                            <span class="text-text-light">Saturday - Sunday</span>
                            <span class="text-neon-green">24/7</span>
                        </div>
                        <div class="text-sm text-electric-blue mt-4">
                            Emergency support available around the clock
                        </div>
                    </div>
                </div>
                
                <!-- Contact Methods -->
                <div class="card-dark">
                    <h3 class="text-xl font-semibold text-white mb-4">Get in Touch</h3>
                    <div class="space-y-4">
                        <div class="flex items-center space-x-3">
                            <svg class="w-5 h-5 text-neon-green" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                                <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                            </svg>
                            <div>
                                <div class="text-white font-medium">Email Support</div>
                                <div class="text-text-light text-sm">
                                    {if isset($templatefile) && is_array($templatefile) && $templatefile.supportemail}
                                        {$templatefile.supportemail}
                                    {else}
                                        support@{$companyname|lower|replace:' ':''}.com
                                    {/if}
                                </div>
                            </div>
                        </div>
                        
                        <div class="flex items-center space-x-3">
                            <svg class="w-5 h-5 text-electric-blue" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M2 3a1 1 0 011-1h2.153a1 1 0 01.986.836l.74 4.435a1 1 0 01-.54 1.06l-1.548.773a11.037 11.037 0 006.105 6.105l.774-1.548a1 1 0 011.059-.54l4.435.74a1 1 0 01.836.986V17a1 1 0 01-1 1h-2C7.82 18 2 12.18 2 5V3z"/>
                            </svg>
                            <div>
                                <div class="text-white font-medium">Phone Support</div>
                                <div class="text-text-light text-sm">
                                    {if isset($templatefile) && is_array($templatefile) && $templatefile.supportphone}
                                        {$templatefile.supportphone}
                                    {else}
                                        +1 (555) 123-4567
                                    {/if}
                                </div>
                            </div>
                        </div>
                        
                        <div class="flex items-center space-x-3">
                            <svg class="w-5 h-5 text-cyber-purple" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M18 10c0 3.866-3.582 7-8 7a8.841 8.841 0 01-4.083-.98L2 17l1.338-3.123C2.493 12.767 2 11.434 2 10c0-3.866 3.582-7 8-7s8 3.134 8 7zM7 9H5v2h2V9zm8 0h-2v2h2V9zM9 9h2v2H9V9z" clip-rule="evenodd"/>
                            </svg>
                            <div>
                                <div class="text-white font-medium">Live Chat</div>
                                <div class="text-text-light text-sm">Available 24/7 in client area</div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Quick Links -->
                <div class="card-dark">
                    <h3 class="text-xl font-semibold text-white mb-4">Quick Links</h3>
                    <div class="space-y-2">
                        <a href="{$WEB_ROOT}/knowledgebase.php" class="block text-neon-green hover:text-electric-blue transition-colors duration-300">
                            📚 Knowledge Base
                        </a>
                        <a href="{$WEB_ROOT}/submitticket.php" class="block text-neon-green hover:text-electric-blue transition-colors duration-300">
                            🎫 Submit Support Ticket
                        </a>
                        <a href="{$WEB_ROOT}/serverstatus.php" class="block text-neon-green hover:text-electric-blue transition-colors duration-300">
                            📊 Server Status
                        </a>
                        <a href="{$WEB_ROOT}/announcements.php" class="block text-neon-green hover:text-electric-blue transition-colors duration-300">
                            📢 Announcements
                        </a>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}