{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-20 px-4 sm:px-6 lg:px-8">
    <div class="max-w-4xl mx-auto">
        <!-- Header -->
        <div class="text-center mb-12">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                    <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                </svg>
            </div>
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                Contact Us
            </h1>
            <p class="text-lg text-text-light max-w-2xl mx-auto">
                Get in touch with our team. We're here to help with any questions about our hosting services.
            </p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            <!-- Contact Form -->
            <div class="card-dark">
                <h2 class="text-xl font-orbitron font-semibold text-white mb-6">Send us a message</h2>
                
                {if $contactform}
                    {$contactform}
                {else}
                    <form method="post" action="{$smarty.server.PHP_SELF}">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                            <div>
                                <label for="name" class="block text-sm font-medium text-text-light mb-2">Name <span class="text-red-400">*</span></label>
                                <input type="text" id="name" name="name" required class="input-dark">
                            </div>
                            <div>
                                <label for="email" class="block text-sm font-medium text-text-light mb-2">Email <span class="text-red-400">*</span></label>
                                <input type="email" id="email" name="email" required class="input-dark">
                            </div>
                        </div>
                        
                        <div class="mb-6">
                            <label for="subject" class="block text-sm font-medium text-text-light mb-2">Subject <span class="text-red-400">*</span></label>
                            <input type="text" id="subject" name="subject" required class="input-dark">
                        </div>
                        
                        <div class="mb-6">
                            <label for="message" class="block text-sm font-medium text-text-light mb-2">Message <span class="text-red-400">*</span></label>
                            <textarea id="message" name="message" rows="5" required class="input-dark"></textarea>
                        </div>
                        
                        <button type="submit" class="btn-primary w-full">
                            Send Message
                        </button>
                    </form>
                {/if}
            </div>

            <!-- Contact Information -->
            <div class="space-y-6">
                <div class="card-dark">
                    <h3 class="text-lg font-orbitron font-semibold text-white mb-4">Get in Touch</h3>
                    <div class="space-y-4">
                        <div class="flex items-start space-x-3">
                            <svg class="w-5 h-5 text-neon-green mt-1" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M2 3a1 1 0 011-1h2.153a1 1 0 01.986.836l.74 4.435a1 1 0 01-.54 1.06l-1.548.773a11.037 11.037 0 006.105 6.105l.774-1.548a1 1 0 011.059-.54l4.435.74a1 1 0 01.836.986V17a1 1 0 01-1 1h-2C7.82 18 2 12.18 2 5V3z"/>
                            </svg>
                            <div>
                                <p class="text-white font-medium">Phone</p>
                                <p class="text-text-light">{if isset($templatefile) && is_array($templatefile) && isset($templatefile['Support Phone'])}{$templatefile['Support Phone']}{else}+1 (555) 123-4567{/if}</p>
                            </div>
                        </div>
                        
                        <div class="flex items-start space-x-3">
                            <svg class="w-5 h-5 text-neon-green mt-1" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                                <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                            </svg>
                            <div>
                                <p class="text-white font-medium">Email</p>
                                <p class="text-text-light">{if isset($templatefile) && is_array($templatefile) && isset($templatefile['Support Email'])}{$templatefile['Support Email']}{else}support@doublespeedhost.com{/if}</p>
                            </div>
                        </div>
                        
                        <div class="flex items-start space-x-3">
                            <svg class="w-5 h-5 text-neon-green mt-1" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-12a1 1 0 10-2 0v4a1 1 0 00.293.707l2.828 2.829a1 1 0 101.415-1.415L11 9.586V6z" clip-rule="evenodd"/>
                            </svg>
                            <div>
                                <p class="text-white font-medium">Support Hours</p>
                                <p class="text-text-light">24/7 Technical Support</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-dark">
                    <h3 class="text-lg font-orbitron font-semibold text-white mb-4">Alternative Contact</h3>
                    <div class="space-y-3">
                        <a href="{$WEB_ROOT}/submitticket.php" class="btn-secondary w-full text-center inline-block">
                            Open Support Ticket
                        </a>
                        <a href="{$WEB_ROOT}/knowledgebase.php" class="btn-outline w-full text-center inline-block">
                            Browse Knowledge Base
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}