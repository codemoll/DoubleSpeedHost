{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-6xl mx-auto">
        
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                <span class="glow-text">Manage Contacts</span>
            </h1>
            <p class="text-text-light">
                Add and manage additional contacts for your account. These contacts can be used for billing, technical, and administrative purposes.
            </p>
        </div>
        
        <!-- Add New Contact Button -->
        <div class="mb-6">
            <a href="{$WEB_ROOT}/clientarea.php?action=contacts&operation=add" class="btn-primary">
                <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z" clip-rule="evenodd"/>
                </svg>
                Add New Contact
            </a>
        </div>
        
        {if $contacts}
            <!-- Contacts List -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                {foreach from=$contacts item=contact}
                    <div class="card-dark">
                        <div class="flex items-start justify-between mb-4">
                            <div class="w-12 h-12 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center">
                                <span class="text-dark-bg font-bold">
                                    {if isset($contact) && is_array($contact) && !empty($contact.firstname)}{$contact.firstname|substr:0:1}{else}?{/if}{if isset($contact) && is_array($contact) && !empty($contact.lastname)}{$contact.lastname|substr:0:1}{else}?{/if}
                                </span>
                            </div>
                            <div class="flex space-x-2">
                                <a href="{$WEB_ROOT}/clientarea.php?action=contacts&operation=edit&id={if isset($contact) && is_array($contact) && !empty($contact.id)}{$contact.id}{else}0{/if}" 
                                   class="text-electric-blue hover:text-neon-green transition-colors duration-300">
                                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                        <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"/>
                                    </svg>
                                </a>
                                <a href="{$WEB_ROOT}/clientarea.php?action=contacts&operation=delete&id={if isset($contact) && is_array($contact) && !empty($contact.id)}{$contact.id}{else}0{/if}" 
                                   class="text-red-400 hover:text-red-300 transition-colors duration-300"
                                   onclick="return confirm('Are you sure you want to delete this contact?')">>
                                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z" clip-rule="evenodd"/>
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414L8.586 12l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293z" clip-rule="evenodd"/>
                                    </svg>
                                </a>
                            </div>
                        </div>
                        
                        <div class="space-y-3">
                            <div>
                                <h3 class="text-lg font-semibold text-white">
                                    {if isset($contact) && is_array($contact) && !empty($contact.firstname)}{$contact.firstname}{else}Unknown{/if} {if isset($contact) && is_array($contact) && !empty($contact.lastname)}{$contact.lastname}{else}User{/if}
                                </h3>
                                <p class="text-text-light text-sm">{if isset($contact) && is_array($contact) && !empty($contact.companyname)}{$contact.companyname}{else}No company{/if}</p>
                            </div>
                            
                            <div class="space-y-2 text-sm">
                                <div class="flex items-center space-x-2">
                                    <svg class="w-4 h-4 text-neon-green" fill="currentColor" viewBox="0 0 20 20">
                                        <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                                        <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                                    </svg>
                                    <span class="text-text-light">{if isset($contact) && is_array($contact) && !empty($contact.email)}{$contact.email}{else}No email{/if}</span>
                                </div>
                                
                                {if isset($contact) && is_array($contact) && !empty($contact.phonenumber)}
                                    <div class="flex items-center space-x-2">
                                        <svg class="w-4 h-4 text-electric-blue" fill="currentColor" viewBox="0 0 20 20">
                                            <path d="M2 3a1 1 0 011-1h2.153a1 1 0 01.986.836l.74 4.435a1 1 0 01-.54 1.06l-1.548.773a11.037 11.037 0 006.105 6.105l.774-1.548a1 1 0 011.059-.54l4.435.74a1 1 0 01.836.986V17a1 1 0 01-1 1h-2C7.82 18 2 12.18 2 5V3z"/>
                                        </svg>
                                        <span class="text-text-light">{$contact.phonenumber}</span>
                                    </div>
                                {/if}
                            </div>
                            
                            {if isset($contact) && is_array($contact) && isset($contact.permissions) && is_array($contact.permissions) && !empty($contact.permissions)}
                                <div class="mt-4">
                                    <h4 class="text-sm font-medium text-white mb-2">Permissions:</h4>
                                    <div class="flex flex-wrap gap-1">
                                        {foreach from=$contact.permissions item=permission}
                                            <span class="inline-flex items-center px-2 py-1 rounded text-xs bg-dark-bg border border-neon-green text-neon-green">
                                                {$permission|default:"Unknown"}
                                            </span>
                                        {/foreach}
                                    </div>
                                </div>
                            {/if}
                        </div>
                    </div>
                {/foreach}
            </div>
        {else}
            <!-- No Contacts -->
            <div class="card-dark text-center py-12">
                <div class="mx-auto w-20 h-20 bg-gradient-to-br from-gray-600 to-gray-700 rounded-full flex items-center justify-center mb-6">
                    <svg class="w-10 h-10 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M9 6a3 3 0 11-6 0 3 3 0 016 0zM17 6a3 3 0 11-6 0 3 3 0 016 0zM12.93 17c.046-.327.07-.66.07-1a6.97 6.97 0 00-1.5-4.33A5 5 0 0119 16v1h-6.07zM6 11a5 5 0 015 5v1H1v-1a5 5 0 015-5z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">No Additional Contacts</h3>
                <p class="text-text-light mb-6">
                    You haven't added any additional contacts yet. Add contacts to help manage your account.
                </p>
                <a href="{$WEB_ROOT}/clientarea.php?action=contacts&operation=add" class="btn-primary">
                    Add Your First Contact
                </a>
            </div>
        {/if}
        
        <!-- Information Panel -->
        <div class="mt-8 card-dark">
            <h3 class="text-xl font-semibold text-white mb-4">About Account Contacts</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 text-sm text-text-light">
                <div>
                    <h4 class="text-white font-medium mb-2">Contact Types</h4>
                    <ul class="space-y-1">
                        <li>• <span class="text-neon-green">Billing Contact</span> - Receives invoices and billing notifications</li>
                        <li>• <span class="text-electric-blue">Technical Contact</span> - Receives technical updates and service notifications</li>
                        <li>• <span class="text-cyber-purple">Administrative Contact</span> - Has account management permissions</li>
                    </ul>
                </div>
                <div>
                    <h4 class="text-white font-medium mb-2">Contact Permissions</h4>
                    <ul class="space-y-1">
                        <li>• View and download invoices</li>
                        <li>• Submit and manage support tickets</li>
                        <li>• Receive account notifications</li>
                        <li>• Access specific services (if assigned)</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}