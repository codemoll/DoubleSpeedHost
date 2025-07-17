{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        
        <!-- Page Header -->
        <div class="mb-8">
            <div class="flex items-center space-x-3 mb-4">
                <a href="{$WEB_ROOT}/supporttickets.php" 
                   class="text-neon-green hover:text-electric-blue transition-colors duration-300">
                    <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z" clip-rule="evenodd"/>
                    </svg>
                </a>
                <h1 class="text-4xl font-orbitron font-bold text-white">
                    <span class="glow-text">View Ticket</span>
                </h1>
            </div>
            <p class="text-text-light">
                Ticket #{if isset($ticket) && is_array($ticket) && isset($ticket.tid)}{$ticket.tid}{else}Unknown{/if} - {if isset($ticket) && is_array($ticket) && isset($ticket.subject)}{$ticket.subject}{else}No Subject{/if}
            </p>
        </div>
        
        <!-- Ticket Header -->
        <div class="card-dark mb-8">
            <div class="flex flex-col lg:flex-row lg:items-center lg:justify-between">
                <div class="mb-6 lg:mb-0">
                    <h2 class="text-2xl font-semibold text-white mb-4">{if isset($ticket) && is_array($ticket) && isset($ticket.subject)}{$ticket.subject}{else}Support Ticket{/if}</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm">
                        <div class="space-y-2">
                            <div class="flex justify-between">
                                <span class="text-text-light">Ticket ID:</span>
                                <span class="text-electric-blue font-mono">#{if isset($ticket) && is_array($ticket) && isset($ticket.tid)}{$ticket.tid}{else}Unknown{/if}</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-text-light">Department:</span>
                                <span class="text-white">{if isset($ticket) && is_array($ticket) && isset($ticket.department)}{$ticket.department}{else}General{/if}</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-text-light">Priority:</span>
                                <span class="text-{if isset($ticket) && is_array($ticket) && isset($ticket.urgency) && $ticket.urgency == 'High'}red-400{elseif isset($ticket) && is_array($ticket) && isset($ticket.urgency) && $ticket.urgency == 'Medium'}yellow-400{else}green-400{/if}">
                                    {if isset($ticket) && is_array($ticket) && isset($ticket.urgency)}{$ticket.urgency}{else}Normal{/if}
                                </span>
                            </div>
                        </div>
                        <div class="space-y-2">
                            <div class="flex justify-between">
                                <span class="text-text-light">Status:</span>
                                <span class="text-{if isset($ticket) && is_array($ticket) && isset($ticket.status) && $ticket.status == 'Open'}orange-400{elseif isset($ticket) && is_array($ticket) && isset($ticket.status) && $ticket.status == 'Answered'}blue-400{elseif isset($ticket) && is_array($ticket) && isset($ticket.status) && $ticket.status == 'Closed'}green-400{else}purple-400{/if}">
                                    {if isset($ticket) && is_array($ticket) && isset($ticket.status)}{$ticket.status}{else}Unknown{/if}
                                </span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-text-light">Created:</span>
                                <span class="text-white">{if isset($ticket) && is_array($ticket) && isset($ticket.date)}{$ticket.date}{else}Unknown{/if}</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-text-light">Last Reply:</span>
                                <span class="text-white">{if isset($ticket) && is_array($ticket) && isset($ticket.lastreply)}{$ticket.lastreply}{else}No replies{/if}</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Action Buttons -->
                <div class="flex flex-col space-y-3 lg:ml-6">
                    {if $ticket.status != 'Closed'}
                        <form method="post" action="{$smarty.server.PHP_SELF}" class="inline-block">
                            <input type="hidden" name="tid" value="{$ticket.tid}">
                            <input type="hidden" name="c" value="{$ticket.c}">
                            <button type="submit" name="closeticket" 
                                    onclick="return confirm('Are you sure you want to close this ticket?')"
                                    class="btn-outline w-full">
                                Close Ticket
                            </button>
                        </form>
                    {/if}
                    
                    {if $ticket.service}
                        <a href="{$WEB_ROOT}/clientarea.php?action=productdetails&id={$ticket.service.id}" 
                           class="btn-secondary text-center">
                            View Service
                        </a>
                    {/if}
                </div>
            </div>
            
            {if $ticket.service}
                <div class="mt-6 pt-6 border-t border-gray-700">
                    <h4 class="text-sm font-medium text-white mb-2">Related Service:</h4>
                    <div class="text-sm text-text-light">
                        {$ticket.service.productname} - {$ticket.service.domain}
                    </div>
                </div>
            {/if}
        </div>
        
        <!-- Ticket Messages -->
        <div class="space-y-6">
            {foreach from=$ticket.replies item=reply}
                <div class="card-dark {if $reply.admin}border-l-4 border-electric-blue{else}border-l-4 border-neon-green{/if}">
                    <div class="flex items-start justify-between mb-4">
                        <div class="flex items-center space-x-3">
                            <div class="w-10 h-10 bg-gradient-to-br {if $reply.admin}from-electric-blue to-cyber-purple{else}from-neon-green to-electric-blue{/if} rounded-full flex items-center justify-center">
                                {if $reply.admin}
                                    <svg class="w-5 h-5 text-white" fill="currentColor" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M18 13V5a2 2 0 00-2-2H4a2 2 0 00-2 2v8a2 2 0 002 2h3l3 3 3-3h3a2 2 0 002-2zM5 7a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zm1 3a1 1 0 100 2h3a1 1 0 100-2H6z" clip-rule="evenodd"/>
                                    </svg>
                                {else}
                                    <span class="text-dark-bg font-bold text-sm">
                                        {if $reply.name}{$reply.name|substr:0:1}{else}U{/if}
                                    </span>
                                {/if}
                            </div>
                            <div>
                                <div class="font-semibold text-white">
                                    {if $reply.admin}
                                        Support Team {if $reply.name}({$reply.name}){/if}
                                    {else}
                                        {if $reply.name}{$reply.name}{else}You{/if}
                                    {/if}
                                </div>
                                <div class="text-text-light text-sm">{$reply.date}</div>
                            </div>
                        </div>
                        
                        {if $reply.admin}
                            <span class="inline-flex items-center px-2 py-1 rounded text-xs bg-electric-blue text-white">
                                Staff Reply
                            </span>
                        {else}
                            <span class="inline-flex items-center px-2 py-1 rounded text-xs bg-neon-green text-dark-bg">
                                Your Message
                            </span>
                        {/if}
                    </div>
                    
                    <div class="prose prose-invert max-w-none">
                        {$reply.message}
                    </div>
                    
                    {if $reply.attachments}
                        <div class="mt-4 pt-4 border-t border-gray-700">
                            <h5 class="text-sm font-medium text-white mb-2">Attachments:</h5>
                            <div class="space-y-2">
                                {foreach from=$reply.attachments item=attachment}
                                    <div class="flex items-center space-x-3 p-2 bg-dark-bg rounded border border-gray-700">
                                        <svg class="w-5 h-5 text-neon-green" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M8 4a3 3 0 00-3 3v4a5 5 0 0010 0V7a1 1 0 112 0v4a7 7 0 11-14 0V7a5 5 0 0110 0v4a3 3 0 11-6 0V7a1 1 0 012 0v4a1 1 0 102 0V7a3 3 0 00-3-3z" clip-rule="evenodd"/>
                                        </svg>
                                        <div class="flex-1">
                                            <div class="text-white text-sm">{$attachment.filename}</div>
                                            <div class="text-text-light text-xs">{$attachment.size}</div>
                                        </div>
                                        <a href="{$attachment.downloadurl}" 
                                           class="btn-outline text-xs px-3 py-1">
                                            Download
                                        </a>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    {/if}
                </div>
            {/foreach}
        </div>
        
        <!-- Reply Form -->
        {if $ticket.status != 'Closed'}
            <div class="card-dark mt-8">
                <h3 class="text-xl font-semibold text-white mb-6">Add Reply</h3>
                
                <form method="post" action="{$smarty.server.PHP_SELF}" enctype="multipart/form-data" class="space-y-6">
                    <input type="hidden" name="tid" value="{$ticket.tid}">
                    <input type="hidden" name="c" value="{$ticket.c}">
                    
                    <div>
                        <label for="message" class="block text-sm font-medium text-white mb-2">
                            Your Reply *
                        </label>
                        <textarea id="message" 
                                  name="message" 
                                  rows="8" 
                                  required 
                                  class="input-dark w-full" 
                                  placeholder="Enter your reply..."></textarea>
                    </div>
                    
                    <div>
                        <label for="attachments" class="block text-sm font-medium text-white mb-2">
                            Attachments
                        </label>
                        <input type="file" 
                               id="attachments" 
                               name="attachments[]" 
                               multiple 
                               class="input-dark w-full"
                               accept=".jpg,.jpeg,.png,.gif,.pdf,.doc,.docx,.txt,.zip">
                        <p class="text-text-light text-xs mt-1">
                            Max file size: 10MB per file. Allowed formats: Images, PDF, Documents, Archives
                        </p>
                    </div>
                    
                    <div class="flex items-center space-x-4">
                        <button type="submit" name="replyticket" class="btn-primary">
                            <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M10.894 2.553a1 1 0 00-1.788 0l-7 14a1 1 0 001.169 1.409l5-1.429A1 1 0 009 15.571V11a1 1 0 112 0v4.571a1 1 0 00.725.962l5 1.428a1 1 0 001.17-1.408l-7-14z"/>
                            </svg>
                            Send Reply
                        </button>
                        
                        {if $ticket.status == 'Answered'}
                            <div class="text-sm text-electric-blue">
                                💡 Our team has responded! Please check the messages above.
                            </div>
                        {/if}
                    </div>
                </form>
            </div>
        {else}
            <!-- Closed Ticket Notice -->
            <div class="card-dark mt-8 text-center">
                <div class="mx-auto w-16 h-16 bg-gradient-to-br from-green-600 to-green-700 rounded-full flex items-center justify-center mb-4">
                    <svg class="w-8 h-8 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">Ticket Closed</h3>
                <p class="text-text-light mb-6">
                    This ticket has been closed. If you need further assistance, please submit a new ticket.
                </p>
                <a href="{$WEB_ROOT}/submitticket.php" class="btn-primary">
                    Submit New Ticket
                </a>
            </div>
        {/if}
        
        <!-- Ticket Rating -->
        {if $ticket.status == 'Closed' && !$ticket.rated}
            <div class="card-dark mt-8">
                <h3 class="text-xl font-semibold text-white mb-6">Rate Our Support</h3>
                <p class="text-text-light mb-6">
                    How would you rate the support you received for this ticket?
                </p>
                
                <form method="post" action="{$smarty.server.PHP_SELF}" class="space-y-6">
                    <input type="hidden" name="tid" value="{$ticket.tid}">
                    <input type="hidden" name="c" value="{$ticket.c}">
                    
                    <div class="flex items-center justify-center space-x-4">
                        {for $i=1 to 5}
                            <label class="cursor-pointer">
                                <input type="radio" name="rating" value="{$i}" class="sr-only" required>
                                <svg class="w-8 h-8 text-gray-400 hover:text-yellow-400 transition-colors duration-300 rating-star" 
                                     fill="currentColor" viewBox="0 0 20 20" data-rating="{$i}">
                                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                                </svg>
                            </label>
                        {/for}
                    </div>
                    
                    <div>
                        <label for="feedback" class="block text-sm font-medium text-white mb-2">
                            Additional Feedback (Optional)
                        </label>
                        <textarea id="feedback" 
                                  name="feedback" 
                                  rows="4" 
                                  class="input-dark w-full" 
                                  placeholder="Tell us how we can improve our support..."></textarea>
                    </div>
                    
                    <div class="text-center">
                        <button type="submit" name="rateticket" class="btn-primary">
                            Submit Rating
                        </button>
                    </div>
                </form>
            </div>
        {/if}
    </div>
</div>

<script>
// Star rating interaction
document.addEventListener('DOMContentLoaded', function() {
    const stars = document.querySelectorAll('.rating-star');
    
    stars.forEach(star => {
        star.addEventListener('mouseenter', function() {
            const rating = parseInt(this.dataset.rating);
            highlightStars(rating);
        });
        
        star.addEventListener('click', function() {
            const rating = parseInt(this.dataset.rating);
            const radio = this.previousElementSibling;
            radio.checked = true;
            highlightStars(rating);
        });
    });
    
    // Reset on mouse leave
    const ratingContainer = document.querySelector('.rating-container');
    if (ratingContainer) {
        ratingContainer.addEventListener('mouseleave', function() {
            const checkedRadio = document.querySelector('input[name="rating"]:checked');
            if (checkedRadio) {
                highlightStars(parseInt(checkedRadio.value));
            } else {
                highlightStars(0);
            }
        });
    }
    
    function highlightStars(rating) {
        stars.forEach((star, index) => {
            if (index < rating) {
                star.classList.remove('text-gray-400');
                star.classList.add('text-yellow-400');
            } else {
                star.classList.remove('text-yellow-400');
                star.classList.add('text-gray-400');
            }
        });
    }
});
</script>

{include file="$template/footer.tpl"}