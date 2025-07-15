{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                <span class="glow-text">Submit Support Ticket</span>
            </h1>
            <p class="text-text-light">
                Need help? Submit a support ticket and our team will get back to you as soon as possible.
            </p>
        </div>
        
        {if $step == 1 || !$step}
            <!-- Step 1: Department and Subject -->
            <div class="card-dark">
                <div class="flex items-center justify-between mb-6">
                    <h2 class="text-2xl font-semibold text-white">Step 1: What can we help you with?</h2>
                    <div class="flex space-x-2">
                        <div class="w-3 h-3 bg-neon-green rounded-full"></div>
                        <div class="w-3 h-3 bg-gray-600 rounded-full"></div>
                        <div class="w-3 h-3 bg-gray-600 rounded-full"></div>
                    </div>
                </div>
                
                <form method="post" action="{$smarty.server.PHP_SELF}" class="space-y-6">
                    <input type="hidden" name="step" value="2" />
                    
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
                    
                    <div>
                        <label for="deptid" class="block text-sm font-medium text-white mb-2">
                            Department *
                        </label>
                        <select id="deptid" name="deptid" required class="input-dark w-full">
                            <option value="">Select a department</option>
                            {if $departments}
                                {foreach from=$departments item=dept}
                                    <option value="{$dept.id}" {if $smarty.post.deptid == $dept.id}selected{/if}>
                                        {$dept.name}
                                    </option>
                                {/foreach}
                            {else}
                                <option value="1">General Support</option>
                                <option value="2">Technical Support</option>
                                <option value="3">Billing Support</option>
                                <option value="4">Sales</option>
                            {/if}
                        </select>
                    </div>
                    
                    <div>
                        <label for="subject" class="block text-sm font-medium text-white mb-2">
                            Subject *
                        </label>
                        <input type="text" id="subject" name="subject" required 
                               class="input-dark w-full" placeholder="Brief description of your issue"
                               value="{if $smarty.post.subject}{$smarty.post.subject}{/if}">
                    </div>
                    
                    <div>
                        <label for="priority" class="block text-sm font-medium text-white mb-2">
                            Priority
                        </label>
                        <select id="priority" name="priority" class="input-dark w-full">
                            <option value="Low" {if $smarty.post.priority == 'Low'}selected{/if}>Low</option>
                            <option value="Medium" {if $smarty.post.priority == 'Medium' || !$smarty.post.priority}selected{/if}>Medium</option>
                            <option value="High" {if $smarty.post.priority == 'High'}selected{/if}>High</option>
                        </select>
                        <p class="text-text-light text-xs mt-1">
                            Select "High" only for urgent issues affecting live services
                        </p>
                    </div>
                    
                    {if $services}
                        <div>
                            <label for="serviceid" class="block text-sm font-medium text-white mb-2">
                                Related Service (Optional)
                            </label>
                            <select id="serviceid" name="serviceid" class="input-dark w-full">
                                <option value="">Not related to a specific service</option>
                                {foreach from=$services item=service}
                                    <option value="{$service.id}" {if $smarty.post.serviceid == $service.id}selected{/if}>
                                        {$service.productname} 
                                        {if $service.domain}({$service.domain}){/if}
                                    </option>
                                {/foreach}
                            </select>
                        </div>
                    {/if}
                    
                    <div class="flex justify-end">
                        <button type="submit" class="btn-primary">
                            Continue to Details
                            <svg class="w-5 h-5 inline ml-2" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"/>
                            </svg>
                        </button>
                    </div>
                </form>
            </div>
            
            <!-- Knowledge Base Suggestions -->
            <div class="card-dark mt-8">
                <h3 class="text-xl font-semibold text-white mb-6">Before you submit...</h3>
                <p class="text-text-light mb-4">
                    Check our knowledge base for instant answers to common questions:
                </p>
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <a href="{$WEB_ROOT}/knowledgebase.php" class="p-4 bg-dark-bg rounded border border-gray-700 hover:border-electric-blue transition-colors duration-300">
                        <div class="flex items-center space-x-3">
                            <svg class="w-6 h-6 text-neon-green" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-3a1 1 0 00-.867.5 1 1 0 11-1.731-1A3 3 0 0113 8a3.001 3.001 0 01-2 2.83V11a1 1 0 11-2 0v-1a1 1 0 011-1 1 1 0 100-2zm0 8a1 1 0 100-2 1 1 0 000 2z" clip-rule="evenodd"/>
                            </svg>
                            <div>
                                <div class="text-white font-medium">Knowledge Base</div>
                                <div class="text-text-light text-sm">Browse helpful articles</div>
                            </div>
                        </div>
                    </a>
                    
                    <a href="{$WEB_ROOT}/serverstatus.php" class="p-4 bg-dark-bg rounded border border-gray-700 hover:border-electric-blue transition-colors duration-300">
                        <div class="flex items-center space-x-3">
                            <svg class="w-6 h-6 text-electric-blue" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M3 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"/>
                            </svg>
                            <div>
                                <div class="text-white font-medium">Server Status</div>
                                <div class="text-text-light text-sm">Check for known issues</div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            
        {elseif $step == 2}
            <!-- Step 2: Message Details -->
            <div class="card-dark">
                <div class="flex items-center justify-between mb-6">
                    <h2 class="text-2xl font-semibold text-white">Step 2: Describe your issue</h2>
                    <div class="flex space-x-2">
                        <div class="w-3 h-3 bg-neon-green rounded-full"></div>
                        <div class="w-3 h-3 bg-neon-green rounded-full"></div>
                        <div class="w-3 h-3 bg-gray-600 rounded-full"></div>
                    </div>
                </div>
                
                <form method="post" action="{$smarty.server.PHP_SELF}" enctype="multipart/form-data" class="space-y-6">
                    <input type="hidden" name="step" value="3" />
                    <input type="hidden" name="deptid" value="{$deptid}" />
                    <input type="hidden" name="subject" value="{$subject}" />
                    <input type="hidden" name="priority" value="{$priority}" />
                    <input type="hidden" name="serviceid" value="{$serviceid}" />
                    
                    <!-- Ticket Summary -->
                    <div class="bg-dark-bg rounded-lg p-4 border border-gray-700">
                        <h3 class="text-lg font-semibold text-white mb-3">Ticket Summary</h3>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm">
                            <div>
                                <span class="text-text-light">Department:</span>
                                <span class="text-white ml-2">{$dept_name}</span>
                            </div>
                            <div>
                                <span class="text-text-light">Priority:</span>
                                <span class="text-{if $priority == 'High'}red-400{elseif $priority == 'Medium'}orange-400{else}green-400{/if} ml-2">{$priority}</span>
                            </div>
                            <div class="md:col-span-2">
                                <span class="text-text-light">Subject:</span>
                                <span class="text-white ml-2">{$subject}</span>
                            </div>
                        </div>
                    </div>
                    
                    <div>
                        <label for="message" class="block text-sm font-medium text-white mb-2">
                            Message *
                        </label>
                        <textarea id="message" name="message" rows="8" required 
                                  class="input-dark w-full" 
                                  placeholder="Please describe your issue in detail. Include any error messages, steps you've already tried, and any other relevant information.">{if $smarty.post.message}{$smarty.post.message}{/if}</textarea>
                        <p class="text-text-light text-xs mt-1">
                            The more details you provide, the faster we can help resolve your issue.
                        </p>
                    </div>
                    
                    <div>
                        <label for="attachments" class="block text-sm font-medium text-white mb-2">
                            Attachments
                        </label>
                        <input type="file" id="attachments" name="attachments[]" multiple 
                               class="input-dark w-full" 
                               accept=".jpg,.jpeg,.png,.gif,.pdf,.doc,.docx,.txt,.zip,.log">
                        <p class="text-text-light text-xs mt-1">
                            Upload screenshots, error logs, or other relevant files. Max 10MB per file.
                        </p>
                    </div>
                    
                    {if $customfields}
                        <div class="pt-6 border-t border-gray-700">
                            <h3 class="text-lg font-semibold text-white mb-4">Additional Information</h3>
                            <div class="space-y-4">
                                {foreach from=$customfields item=field}
                                    <div>
                                        <label for="customfield{$field.id}" class="block text-sm font-medium text-white mb-2">
                                            {$field.name} {if $field.required}*{/if}
                                        </label>
                                        {if $field.type == 'dropdown'}
                                            <select id="customfield{$field.id}" name="customfield[{$field.id}]" 
                                                    {if $field.required}required{/if} class="input-dark w-full">
                                                <option value="">Select an option</option>
                                                {foreach from=$field.options item=option}
                                                    <option value="{$option}">{$option}</option>
                                                {/foreach}
                                            </select>
                                        {elseif $field.type == 'textarea'}
                                            <textarea id="customfield{$field.id}" name="customfield[{$field.id}]" 
                                                      rows="4" {if $field.required}required{/if} 
                                                      class="input-dark w-full" 
                                                      placeholder="{$field.description}"></textarea>
                                        {else}
                                            <input type="text" id="customfield{$field.id}" name="customfield[{$field.id}]" 
                                                   {if $field.required}required{/if} 
                                                   class="input-dark w-full" 
                                                   placeholder="{$field.description}">
                                        {/if}
                                        {if $field.description}
                                            <p class="text-text-light text-xs mt-1">{$field.description}</p>
                                        {/if}
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    {/if}
                    
                    {if $recaptchahtml}
                        <div>{$recaptchahtml}</div>
                    {/if}
                    
                    <div class="flex justify-between">
                        <button type="button" onclick="history.back()" class="btn-outline">
                            <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z" clip-rule="evenodd"/>
                            </svg>
                            Back
                        </button>
                        
                        <button type="submit" class="btn-primary">
                            Submit Ticket
                            <svg class="w-5 h-5 inline ml-2" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M10.894 2.553a1 1 0 00-1.788 0l-7 14a1 1 0 001.169 1.409l5-1.429A1 1 0 009 15.571V11a1 1 0 112 0v4.571a1 1 0 00.725.962l5 1.428a1 1 0 001.17-1.408l-7-14z"/>
                            </svg>
                        </button>
                    </div>
                </form>
            </div>
            
        {elseif $step == 3 || $success}
            <!-- Step 3: Confirmation -->
            <div class="card-dark text-center">
                <div class="mx-auto w-20 h-20 bg-gradient-to-br from-green-600 to-green-700 rounded-full flex items-center justify-center mb-6">
                    <svg class="w-10 h-10 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                    </svg>
                </div>
                
                <h2 class="text-3xl font-orbitron font-bold text-white mb-4">
                    Ticket Submitted Successfully!
                </h2>
                
                <div class="bg-green-900 border border-green-700 rounded-lg p-4 mb-6">
                    <div class="text-green-200 text-sm">
                        <div class="font-medium">Ticket #{$ticketid} has been created</div>
                        <div class="mt-1">We'll respond to your ticket as soon as possible.</div>
                    </div>
                </div>
                
                <p class="text-text-light mb-8">
                    You'll receive an email confirmation at <strong>{$email}</strong> with your ticket details.
                    Our support team typically responds within 2-4 hours during business hours.
                </p>
                
                <div class="space-y-4">
                    <a href="{$WEB_ROOT}/viewticket.php?tid={$ticketid}&c={$c}" class="btn-primary">
                        <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M10 12a2 2 0 100-4 2 2 0 000 4z"/>
                            <path fill-rule="evenodd" d="M.458 10C1.732 5.943 5.522 3 10 3s8.268 2.943 9.542 7c-1.274 4.057-5.064 7-9.542 7S1.732 14.057.458 10zM14 10a4 4 0 11-8 0 4 4 0 018 0z" clip-rule="evenodd"/>
                        </svg>
                        View Ticket
                    </a>
                    
                    <div class="flex justify-center space-x-4">
                        <a href="{$WEB_ROOT}/supporttickets.php" class="btn-outline">
                            All Tickets
                        </a>
                        <a href="{$WEB_ROOT}/submitticket.php" class="btn-outline">
                            Submit Another Ticket
                        </a>
                        <a href="{$WEB_ROOT}/clientarea.php" class="btn-outline">
                            Client Area
                        </a>
                    </div>
                </div>
            </div>
        {/if}
        
        <!-- Support Information -->
        <div class="mt-8 grid grid-cols-1 md:grid-cols-3 gap-6">
            <div class="card-dark text-center">
                <svg class="w-12 h-12 text-neon-green mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-12a1 1 0 10-2 0v4a1 1 0 00.293.707l2.828 2.829a1 1 0 101.415-1.415L11 9.586V6z" clip-rule="evenodd"/>
                </svg>
                <h3 class="text-lg font-semibold text-white mb-2">Response Time</h3>
                <p class="text-text-light text-sm">
                    General: 2-4 hours<br>
                    Urgent: 30 minutes<br>
                    Emergency: 15 minutes
                </p>
            </div>
            
            <div class="card-dark text-center">
                <svg class="w-12 h-12 text-electric-blue mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-8.293l-3-3a1 1 0 00-1.414 0l-3 3a1 1 0 001.414 1.414L9 9.414V13a1 1 0 102 0V9.414l1.293 1.293a1 1 0 001.414-1.414z" clip-rule="evenodd"/>
                </svg>
                <h3 class="text-lg font-semibold text-white mb-2">24/7 Support</h3>
                <p class="text-text-light text-sm">
                    Our support team is available around the clock to help with urgent issues.
                </p>
            </div>
            
            <div class="card-dark text-center">
                <svg class="w-12 h-12 text-cyber-purple mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                </svg>
                <h3 class="text-lg font-semibold text-white mb-2">Expert Help</h3>
                <p class="text-text-light text-sm">
                    Our certified technicians are here to solve your technical challenges.
                </p>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}