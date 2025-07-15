{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Ticket Feedback</h1>
            
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
            
            <div class="text-center space-y-6">
                <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                    <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M18 13V5a2 2 0 00-2-2H4a2 2 0 00-2 2v8a2 2 0 002 2h3l3 3 3-3h3a2 2 0 002-2zM5 7a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zm1 3a1 1 0 100 2h3a1 1 0 100-2H6z" clip-rule="evenodd"/>
                    </svg>
                </div>
                
                <div>
                    <h2 class="text-2xl font-bold text-white mb-4">Rate Your Support Experience</h2>
                    <p class="text-text-light mb-6">
                        How would you rate the support you received for ticket #{$ticketnumber}?
                    </p>
                </div>
                
                <form method="post" class="space-y-6 text-left">
                    <div>
                        <label class="block text-sm font-medium text-text-light mb-4 text-center">Overall Satisfaction</label>
                        <div class="flex justify-center space-x-4">
                            {for $i=1 to 5}
                                <label class="cursor-pointer">
                                    <input type="radio" name="rating" value="{$i}" class="sr-only" required>
                                    <div class="w-12 h-12 rounded-full border-2 border-gray-600 flex items-center justify-center text-2xl hover:border-neon-green transition-colors rating-star" data-rating="{$i}">
                                        ⭐
                                    </div>
                                </label>
                            {/for}
                        </div>
                        <div class="text-center mt-2">
                            <span class="text-sm text-text-light rating-text">Click to rate</span>
                        </div>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-text-light mb-2">Additional Comments (Optional)</label>
                        <textarea name="comments" rows="4" class="input-dark w-full" 
                                  placeholder="Tell us more about your experience..."></textarea>
                    </div>
                    
                    <div>
                        <label class="flex items-center">
                            <input type="checkbox" name="contact_ok" class="mr-3">
                            <span class="text-text-light text-sm">It's okay to contact me about this feedback</span>
                        </label>
                    </div>
                    
                    <button type="submit" class="btn-primary w-full">
                        Submit Feedback
                    </button>
                    
                    <div class="text-center">
                        <a href="{$WEB_ROOT}/supporttickets.php" class="text-sm text-text-light hover:text-neon-green">
                            Skip feedback and return to tickets
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
