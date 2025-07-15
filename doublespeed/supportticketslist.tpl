{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-6xl mx-auto">
        
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                <span class="glow-text">Support Tickets</span>
            </h1>
            <p class="text-text-light">
                View and manage your support requests. Our team is here to help you 24/7.
            </p>
        </div>
        
        <!-- Ticket Stats -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-neon-green mb-2">
                    {if $ticketstats.total}{$ticketstats.total}{else}0{/if}
                </div>
                <div class="text-text-light text-sm">Total Tickets</div>
            </div>
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-orange-400 mb-2">
                    {if $ticketstats.open}{$ticketstats.open}{else}0{/if}
                </div>
                <div class="text-text-light text-sm">Open</div>
            </div>
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-electric-blue mb-2">
                    {if $ticketstats.answered}{$ticketstats.answered}{else}0{/if}
                </div>
                <div class="text-text-light text-sm">Answered</div>
            </div>
            <div class="card-dark text-center">
                <div class="text-3xl font-orbitron font-bold text-green-400 mb-2">
                    {if $ticketstats.closed}{$ticketstats.closed}{else}0{/if}
                </div>
                <div class="text-text-light text-sm">Closed</div>
            </div>
        </div>
        
        <!-- Submit New Ticket Button -->
        <div class="mb-6">
            <a href="{$WEB_ROOT}/submitticket.php" class="btn-primary">
                <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z" clip-rule="evenodd"/>
                </svg>
                Submit New Ticket
            </a>
        </div>
        
        <!-- Filter Options -->
        <div class="card-dark mb-8">
            <h2 class="text-xl font-semibold text-white mb-4">Filter Tickets</h2>
            <form method="get" action="{$smarty.server.PHP_SELF}" class="grid grid-cols-1 md:grid-cols-4 gap-4">
                <input type="hidden" name="action" value="tickets" />
                
                <div>
                    <label for="status" class="block text-sm font-medium text-white mb-2">Status</label>
                    <select id="status" name="status" class="input-dark w-full">
                        <option value="">All Status</option>
                        <option value="Open" {if $smarty.get.status == 'Open'}selected{/if}>Open</option>
                        <option value="Answered" {if $smarty.get.status == 'Answered'}selected{/if}>Answered</option>
                        <option value="Customer-Reply" {if $smarty.get.status == 'Customer-Reply'}selected{/if}>Awaiting Reply</option>
                        <option value="Closed" {if $smarty.get.status == 'Closed'}selected{/if}>Closed</option>
                    </select>
                </div>
                
                <div>
                    <label for="priority" class="block text-sm font-medium text-white mb-2">Priority</label>
                    <select id="priority" name="priority" class="input-dark w-full">
                        <option value="">All Priorities</option>
                        <option value="High" {if $smarty.get.priority == 'High'}selected{/if}>High</option>
                        <option value="Medium" {if $smarty.get.priority == 'Medium'}selected{/if}>Medium</option>
                        <option value="Low" {if $smarty.get.priority == 'Low'}selected{/if}>Low</option>
                    </select>
                </div>
                
                <div>
                    <label for="search" class="block text-sm font-medium text-white mb-2">Search</label>
                    <input type="text" id="search" name="search" 
                           class="input-dark w-full" placeholder="Ticket ID or subject"
                           value="{if $smarty.get.search}{$smarty.get.search}{/if}">
                </div>
                
                <div class="flex items-end">
                    <button type="submit" class="btn-primary w-full">
                        Apply Filters
                    </button>
                </div>
            </form>
        </div>
        
        {if $tickets}
            <!-- Tickets List -->
            <div class="space-y-4">
                {foreach from=$tickets item=ticket}
                    <div class="card-dark hover:border-electric-blue transition-colors duration-300">
                        <div class="flex items-start justify-between">
                            <div class="flex-1">
                                <div class="flex items-center space-x-4 mb-2">
                                    <h3 class="text-xl font-semibold text-white">
                                        <a href="{$WEB_ROOT}/viewticket.php?tid={$ticket.tid}&c={$ticket.c}" 
                                           class="hover:text-neon-green transition-colors duration-300">
                                            #{$ticket.tid} - {$ticket.subject}
                                        </a>
                                    </h3>
                                    
                                    <!-- Priority Badge -->
                                    {if $ticket.urgency == 'High'}
                                        <span class="inline-flex items-center px-2 py-1 rounded text-xs bg-red-900 text-red-200">
                                            🔥 High
                                        </span>
                                    {elseif $ticket.urgency == 'Medium'}
                                        <span class="inline-flex items-center px-2 py-1 rounded text-xs bg-yellow-900 text-yellow-200">
                                            ⚡ Medium
                                        </span>
                                    {else}
                                        <span class="inline-flex items-center px-2 py-1 rounded text-xs bg-green-900 text-green-200">
                                            ✅ Low
                                        </span>
                                    {/if}
                                </div>
                                
                                <div class="grid grid-cols-1 md:grid-cols-3 gap-4 text-sm mb-4">
                                    <div class="space-y-1">
                                        <div class="flex justify-between">
                                            <span class="text-text-light">Department:</span>
                                            <span class="text-white">{$ticket.department}</span>
                                        </div>
                                        <div class="flex justify-between">
                                            <span class="text-text-light">Created:</span>
                                            <span class="text-text-light">{$ticket.date}</span>
                                        </div>
                                    </div>
                                    <div class="space-y-1">
                                        <div class="flex justify-between">
                                            <span class="text-text-light">Last Reply:</span>
                                            <span class="text-text-light">{$ticket.lastreply}</span>
                                        </div>
                                        <div class="flex justify-between">
                                            <span class="text-text-light">Replies:</span>
                                            <span class="text-neon-green">{$ticket.replies}</span>
                                        </div>
                                    </div>
                                    <div class="space-y-1">
                                        {if $ticket.service}
                                            <div class="flex justify-between">
                                                <span class="text-text-light">Service:</span>
                                                <span class="text-electric-blue">{$ticket.service}</span>
                                            </div>
                                        {/if}
                                    </div>
                                </div>
                                
                                {if $ticket.message}
                                    <p class="text-text-light text-sm">
                                        {$ticket.message|strip_tags|truncate:150}
                                    </p>
                                {/if}
                            </div>
                            
                            <div class="ml-6 flex flex-col items-end space-y-3">
                                <!-- Status Badge -->
                                <div>
                                    {if $ticket.status == 'Open'}
                                        <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-orange-900 text-orange-200">
                                            <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-12a1 1 0 10-2 0v4a1 1 0 00.293.707l2.828 2.829a1 1 0 101.415-1.415L11 9.586V6z" clip-rule="evenodd"/>
                                            </svg>
                                            Open
                                        </span>
                                    {elseif $ticket.status == 'Answered'}
                                        <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-blue-900 text-blue-200">
                                            <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                                <path fill-rule="evenodd" d="M18 10c0 3.866-3.582 7-8 7a8.841 8.841 0 01-4.083-.98L2 17l1.338-3.123C2.493 12.767 2 11.434 2 10c0-3.866 3.582-7 8-7s8 3.134 8 7zM7 9H5v2h2V9zm8 0h-2v2h2V9zM9 9h2v2H9V9z" clip-rule="evenodd"/>
                                            </svg>
                                            Answered
                                        </span>
                                    {elseif $ticket.status == 'Customer-Reply'}
                                        <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-purple-900 text-purple-200">
                                            <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                                <path fill-rule="evenodd" d="M7.707 3.293a1 1 0 010 1.414L5.414 7H11a7 7 0 017 7v2a1 1 0 11-2 0v-2a5 5 0 00-5-5H5.414l2.293 2.293a1 1 0 11-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd"/>
                                            </svg>
                                            Awaiting Reply
                                        </span>
                                    {elseif $ticket.status == 'Closed'}
                                        <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-green-900 text-green-200">
                                            <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                                            </svg>
                                            Closed
                                        </span>
                                    {else}
                                        <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-gray-900 text-gray-200">
                                            {$ticket.status}
                                        </span>
                                    {/if}
                                </div>
                                
                                <!-- Action Button -->
                                <a href="{$WEB_ROOT}/viewticket.php?tid={$ticket.tid}&c={$ticket.c}" 
                                   class="btn-outline text-sm px-4 py-2">
                                    View Ticket
                                </a>
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>
            
            <!-- Pagination -->
            {if $pagination}
                <div class="mt-8 flex items-center justify-between">
                    <div class="text-text-light text-sm">
                        Showing {$pagination.start} to {$pagination.end} of {$pagination.total} tickets
                    </div>
                    <div class="flex space-x-2">
                        {if $pagination.prev}
                            <a href="{$pagination.prev}" class="btn-outline text-xs px-3 py-1">Previous</a>
                        {/if}
                        {foreach from=$pagination.pages item=page}
                            {if $page.current}
                                <span class="btn-primary text-xs px-3 py-1">{$page.num}</span>
                            {else}
                                <a href="{$page.url}" class="btn-outline text-xs px-3 py-1">{$page.num}</a>
                            {/if}
                        {/foreach}
                        {if $pagination.next}
                            <a href="{$pagination.next}" class="btn-outline text-xs px-3 py-1">Next</a>
                        {/if}
                    </div>
                </div>
            {/if}
        {else}
            <!-- No Tickets -->
            <div class="card-dark text-center py-12">
                <div class="mx-auto w-20 h-20 bg-gradient-to-br from-gray-600 to-gray-700 rounded-full flex items-center justify-center mb-6">
                    <svg class="w-10 h-10 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M18 13V5a2 2 0 00-2-2H4a2 2 0 00-2 2v8a2 2 0 002 2h3l3 3 3-3h3a2 2 0 002-2zM5 7a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zm1 3a1 1 0 100 2h3a1 1 0 100-2H6z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">No Support Tickets</h3>
                <p class="text-text-light mb-6">
                    {if $smarty.get.status || $smarty.get.priority || $smarty.get.search}
                        No tickets match your current filter criteria. Try adjusting your filters.
                    {else}
                        You don't have any support tickets yet. If you need help, feel free to submit a ticket.
                    {/if}
                </p>
                {if $smarty.get.status || $smarty.get.priority || $smarty.get.search}
                    <a href="{$WEB_ROOT}/clientarea.php?action=tickets" class="btn-primary">
                        Clear Filters
                    </a>
                {else}
                    <a href="{$WEB_ROOT}/submitticket.php" class="btn-primary">
                        Submit Your First Ticket
                    </a>
                {/if}
            </div>
        {/if}
        
        <!-- Quick Actions -->
        <div class="mt-8 grid grid-cols-1 md:grid-cols-3 gap-6">
            <div class="card-dark text-center">
                <svg class="w-12 h-12 text-neon-green mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-3a1 1 0 00-.867.5 1 1 0 11-1.731-1A3 3 0 0113 8a3.001 3.001 0 01-2 2.83V11a1 1 0 11-2 0v-1a1 1 0 011-1 1 1 0 100-2zm0 8a1 1 0 100-2 1 1 0 000 2z" clip-rule="evenodd"/>
                </svg>
                <h3 class="text-lg font-semibold text-white mb-2">Knowledge Base</h3>
                <p class="text-text-light text-sm mb-4">Find answers to common questions</p>
                <a href="{$WEB_ROOT}/knowledgebase.php" class="btn-outline">Browse Articles</a>
            </div>
            
            <div class="card-dark text-center">
                <svg class="w-12 h-12 text-electric-blue mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M18 10c0 3.866-3.582 7-8 7a8.841 8.841 0 01-4.083-.98L2 17l1.338-3.123C2.493 12.767 2 11.434 2 10c0-3.866 3.582-7 8-7s8 3.134 8 7zM7 9H5v2h2V9zm8 0h-2v2h2V9zM9 9h2v2H9V9z" clip-rule="evenodd"/>
                </svg>
                <h3 class="text-lg font-semibold text-white mb-2">Live Chat</h3>
                <p class="text-text-light text-sm mb-4">Chat with our support team instantly</p>
                <a href="#" onclick="openLiveChat()" class="btn-outline">Start Chat</a>
            </div>
            
            <div class="card-dark text-center">
                <svg class="w-12 h-12 text-cyber-purple mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M3 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"/>
                </svg>
                <h3 class="text-lg font-semibold text-white mb-2">Server Status</h3>
                <p class="text-text-light text-sm mb-4">Check our server status and uptime</p>
                <a href="{$WEB_ROOT}/serverstatus.php" class="btn-outline">View Status</a>
            </div>
        </div>
    </div>
</div>

<script>
function openLiveChat() {
    // This would typically open a live chat widget
    // For now, redirect to ticket system
    window.location.href = '{$WEB_ROOT}/submitticket.php';
}
</script>

{include file="$template/footer.tpl"}