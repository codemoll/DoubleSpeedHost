{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-4xl mx-auto">
        <div class="text-center mb-12">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                    <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                </svg>
            </div>
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">Contact Us</h1>
            <p class="text-xl text-text-light max-w-2xl mx-auto">
                Get in touch with our support team. We're here to help you 24/7.
            </p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            <!-- Contact Form -->
            <div class="card-dark">
                <h2 class="text-2xl font-orbitron font-bold text-white mb-6">Send us a message</h2>
                
                {if $sent}
                    <div class="bg-green-900 border border-green-700 rounded-lg p-4 mb-6">
                        <div class="flex">
                            <svg class="w-5 h-5 text-green-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                            </svg>
                            <div class="text-green-200 text-sm">
                                Your message has been sent successfully. We'll get back to you soon!
                            </div>
                        </div>
                    </div>
                {/if}

                {if $errormessage}
                    <div class="bg-red-900 border border-red-700 rounded-lg p-4 mb-6">
                        <div class="flex">
                            <svg class="w-5 h-5 text-red-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                            </svg>
                            <div class="text-red-200 text-sm">
                                {$errormessage}
                            </div>
                        </div>
                    </div>
                {/if}

                {if isset($contactdetails) && is_array($contactdetails) && $contactdetails.supportform}
                    <form method="post" action="{$WEB_ROOT}/contact.php" class="space-y-6">
                        <div>
                            <label for="name" class="block text-sm font-medium text-text-light mb-2">Name *</label>
                            <input type="text" id="name" name="name" required 
                                   value="{if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.fullname)}{$clientsdetails.fullname}{/if}"
                                   class="w-full px-4 py-3 bg-dark-surface border border-gray-600 rounded-lg text-white placeholder-gray-400 focus:ring-2 focus:ring-neon-green focus:border-transparent transition-all duration-300">
                        </div>

                        <div>
                            <label for="email" class="block text-sm font-medium text-text-light mb-2">Email Address *</label>
                            <input type="email" id="email" name="email" required 
                                   value="{if isset($clientsdetails) && is_array($clientsdetails) && isset($clientsdetails.email)}{$clientsdetails.email}{/if}"
                                   class="w-full px-4 py-3 bg-dark-surface border border-gray-600 rounded-lg text-white placeholder-gray-400 focus:ring-2 focus:ring-neon-green focus:border-transparent transition-all duration-300">
                        </div>

                        <div>
                            <label for="subject" class="block text-sm font-medium text-text-light mb-2">Subject</label>
                            <input type="text" id="subject" name="subject" 
                                   class="w-full px-4 py-3 bg-dark-surface border border-gray-600 rounded-lg text-white placeholder-gray-400 focus:ring-2 focus:ring-neon-green focus:border-transparent transition-all duration-300">
                        </div>

                        <div>
                            <label for="message" class="block text-sm font-medium text-text-light mb-2">Message *</label>
                            <textarea id="message" name="message" rows="6" required 
                                      class="w-full px-4 py-3 bg-dark-surface border border-gray-600 rounded-lg text-white placeholder-gray-400 focus:ring-2 focus:ring-neon-green focus:border-transparent transition-all duration-300"
                                      placeholder="How can we help you?"></textarea>
                        </div>

                        {if $capcha}
                            <div>
                                <label class="block text-sm font-medium text-text-light mb-2">Security Verification</label>
                                {$capcha}
                            </div>
                        {/if}

                        <button type="submit" class="w-full btn-primary">
                            <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                                <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                            </svg>
                            Send Message
                        </button>
                    </form>
                {else}
                    <div class="bg-yellow-900 border border-yellow-700 rounded-lg p-4">
                        <div class="flex">
                            <svg class="w-5 h-5 text-yellow-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
                            </svg>
                            <div class="text-yellow-200 text-sm">
                                The contact form is currently unavailable. Please use the contact information on the right to reach us directly.
                            </div>
                        </div>
                    </div>
                {/if}
            </div>

            <!-- Contact Information -->
            <div class="card-dark">
                <h2 class="text-2xl font-orbitron font-bold text-white mb-6">Get in touch</h2>
                
                <div class="space-y-6">
                    {if isset($contactdetails) && is_array($contactdetails)}
                        {if $contactdetails.supportphone}
                            <div class="flex items-start">
                                <div class="flex-shrink-0">
                                    <div class="w-10 h-10 bg-gradient-to-br from-neon-green to-electric-blue rounded-lg flex items-center justify-center">
                                        <svg class="w-5 h-5 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                                            <path d="M2 3a1 1 0 011-1h2.153a1 1 0 01.986.836l.74 4.435a1 1 0 01-.54 1.06l-1.548.773a11.037 11.037 0 006.105 6.105l.774-1.548a1 1 0 011.059-.54l4.435.74a1 1 0 01.836.986V17a1 1 0 01-1 1h-2C7.82 18 2 12.18 2 5V3z"/>
                                        </svg>
                                    </div>
                                </div>
                                <div class="ml-4">
                                    <h3 class="text-lg font-medium text-white">Phone Support</h3>
                                    <p class="text-text-light">24/7 technical assistance</p>
                                    <p class="text-neon-green font-medium">{$contactdetails.supportphone}</p>
                                </div>
                            </div>
                        {/if}

                        {if $contactdetails.supportemail}
                            <div class="flex items-start">
                                <div class="flex-shrink-0">
                                    <div class="w-10 h-10 bg-gradient-to-br from-electric-blue to-cyber-purple rounded-lg flex items-center justify-center">
                                        <svg class="w-5 h-5 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                                            <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                                            <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                                        </svg>
                                    </div>
                                </div>
                                <div class="ml-4">
                                    <h3 class="text-lg font-medium text-white">Email Support</h3>
                                    <p class="text-text-light">Get help via email</p>
                                    <p class="text-neon-green font-medium">{$contactdetails.supportemail}</p>
                                </div>
                            </div>
                        {/if}

                        {if $contactdetails.supportdepartments}
                            <div class="flex items-start">
                                <div class="flex-shrink-0">
                                    <div class="w-10 h-10 bg-gradient-to-br from-cyber-purple to-neon-green rounded-lg flex items-center justify-center">
                                        <svg class="w-5 h-5 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-6-3a2 2 0 11-4 0 2 2 0 014 0zm-2 4a5 5 0 00-4.546 2.916A5.986 5.986 0 0010 16a5.986 5.986 0 004.546-2.084A5 5 0 0010 11z" clip-rule="evenodd"/>
                                        </svg>
                                    </div>
                                </div>
                                <div class="ml-4">
                                    <h3 class="text-lg font-medium text-white">Support Departments</h3>
                                    <p class="text-text-light">Choose the right department</p>
                                    <a href="{$WEB_ROOT}/submitticket.php" class="text-neon-green hover:text-electric-blue transition-colors duration-300 font-medium">Open Support Ticket</a>
                                </div>
                            </div>
                        {/if}
                    {else}
                        <div class="text-center py-8">
                            <svg class="w-12 h-12 text-gray-600 mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                                <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                            </svg>
                            <p class="text-text-light">Contact information will be displayed here when available.</p>
                        </div>
                    {/if}
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}