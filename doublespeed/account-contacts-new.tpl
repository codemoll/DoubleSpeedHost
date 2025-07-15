{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                <span class="glow-text">Add New Contact</span>
            </h1>
            <p class="text-text-light">
                Add a new contact to your account. This contact can be assigned permissions to manage specific aspects of your account.
            </p>
        </div>
        
        <!-- Form -->
        <form method="post" action="{$smarty.server.PHP_SELF}" class="space-y-8">
            <input type="hidden" name="action" value="contacts" />
            <input type="hidden" name="operation" value="add" />
            
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
            
            <!-- Personal Information -->
            <div class="card-dark">
                <h2 class="text-2xl font-semibold text-white mb-6">Personal Information</h2>
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label for="firstname" class="block text-sm font-medium text-white mb-2">
                            First Name *
                        </label>
                        <input type="text" id="firstname" name="firstname" required 
                               class="input-dark w-full" placeholder="Enter first name"
                               value="{if isset($smarty.post.firstname)}{$smarty.post.firstname}{/if}">
                    </div>
                    
                    <div>
                        <label for="lastname" class="block text-sm font-medium text-white mb-2">
                            Last Name *
                        </label>
                        <input type="text" id="lastname" name="lastname" required 
                               class="input-dark w-full" placeholder="Enter last name"
                               value="{if isset($smarty.post.lastname)}{$smarty.post.lastname}{/if}">
                    </div>
                    
                    <div>
                        <label for="email" class="block text-sm font-medium text-white mb-2">
                            Email Address *
                        </label>
                        <input type="email" id="email" name="email" required 
                               class="input-dark w-full" placeholder="contact@example.com"
                               value="{if isset($smarty.post.email)}{$smarty.post.email}{/if}">
                    </div>
                    
                    <div>
                        <label for="phonenumber" class="block text-sm font-medium text-white mb-2">
                            Phone Number
                        </label>
                        <input type="tel" id="phonenumber" name="phonenumber" 
                               class="input-dark w-full" placeholder="+1 (555) 123-4567"
                               value="{if isset($smarty.post.phonenumber)}{$smarty.post.phonenumber}{/if}">
                    </div>
                </div>
                
                <div class="mt-6">
                    <label for="companyname" class="block text-sm font-medium text-white mb-2">
                        Company Name
                    </label>
                    <input type="text" id="companyname" name="companyname" 
                           class="input-dark w-full" placeholder="Company name (optional)"
                           value="{if isset($smarty.post.companyname)}{$smarty.post.companyname}{/if}">
                </div>
            </div>
            
            <!-- Contact Permissions -->
            <div class="card-dark">
                <h2 class="text-2xl font-semibold text-white mb-6">Contact Permissions</h2>
                <p class="text-text-light text-sm mb-6">
                    Select what this contact should be able to access and manage on your account.
                </p>
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    
                    <!-- General Permissions -->
                    <div>
                        <h3 class="text-lg font-medium text-white mb-4">General Access</h3>
                        <div class="space-y-3">
                            <label class="flex items-center">
                                <input type="checkbox" name="permissions[]" value="profile" 
                                       class="rounded border-gray-600 bg-dark-surface text-neon-green focus:ring-neon-green">
                                <span class="ml-3 text-sm text-text-light">
                                    <span class="text-white font-medium">View Profile</span><br>
                                    Can view account details and contact information
                                </span>
                            </label>
                            
                            <label class="flex items-center">
                                <input type="checkbox" name="permissions[]" value="invoices" 
                                       class="rounded border-gray-600 bg-dark-surface text-neon-green focus:ring-neon-green">
                                <span class="ml-3 text-sm text-text-light">
                                    <span class="text-white font-medium">View Invoices</span><br>
                                    Can view and download invoices and billing history
                                </span>
                            </label>
                            
                            <label class="flex items-center">
                                <input type="checkbox" name="permissions[]" value="tickets" 
                                       class="rounded border-gray-600 bg-dark-surface text-neon-green focus:ring-neon-green">
                                <span class="ml-3 text-sm text-text-light">
                                    <span class="text-white font-medium">Support Tickets</span><br>
                                    Can create and manage support tickets
                                </span>
                            </label>
                            
                            <label class="flex items-center">
                                <input type="checkbox" name="permissions[]" value="emails" 
                                       class="rounded border-gray-600 bg-dark-surface text-neon-green focus:ring-neon-green">
                                <span class="ml-3 text-sm text-text-light">
                                    <span class="text-white font-medium">Email History</span><br>
                                    Can view account email history and notifications
                                </span>
                            </label>
                        </div>
                    </div>
                    
                    <!-- Service Permissions -->
                    <div>
                        <h3 class="text-lg font-medium text-white mb-4">Service Management</h3>
                        <div class="space-y-3">
                            <label class="flex items-center">
                                <input type="checkbox" name="permissions[]" value="products" 
                                       class="rounded border-gray-600 bg-dark-surface text-electric-blue focus:ring-electric-blue">
                                <span class="ml-3 text-sm text-text-light">
                                    <span class="text-white font-medium">Manage Products</span><br>
                                    Can view and manage hosting services
                                </span>
                            </label>
                            
                            <label class="flex items-center">
                                <input type="checkbox" name="permissions[]" value="domains" 
                                       class="rounded border-gray-600 bg-dark-surface text-electric-blue focus:ring-electric-blue">
                                <span class="ml-3 text-sm text-text-light">
                                    <span class="text-white font-medium">Manage Domains</span><br>
                                    Can manage domain registrations and DNS
                                </span>
                            </label>
                            
                            <label class="flex items-center">
                                <input type="checkbox" name="permissions[]" value="orders" 
                                       class="rounded border-gray-600 bg-dark-surface text-electric-blue focus:ring-electric-blue">
                                <span class="ml-3 text-sm text-text-light">
                                    <span class="text-white font-medium">Place Orders</span><br>
                                    Can place new orders and upgrade services
                                </span>
                            </label>
                            
                            <label class="flex items-center">
                                <input type="checkbox" name="permissions[]" value="quotes" 
                                       class="rounded border-gray-600 bg-dark-surface text-electric-blue focus:ring-electric-blue">
                                <span class="ml-3 text-sm text-text-light">
                                    <span class="text-white font-medium">View Quotes</span><br>
                                    Can view and accept quotes
                                </span>
                            </label>
                        </div>
                    </div>
                </div>
                
                <div class="mt-6 p-4 bg-dark-bg rounded-lg border border-gray-700">
                    <div class="flex">
                        <svg class="w-5 h-5 text-cyber-purple mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                        </svg>
                        <div class="text-cyber-purple text-sm">
                            <strong>Note:</strong> This contact will receive an email invitation to set up their account access. 
                            They will need to create a password to access the permitted areas.
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Notification Preferences -->
            <div class="card-dark">
                <h2 class="text-2xl font-semibold text-white mb-6">Notification Preferences</h2>
                <p class="text-text-light text-sm mb-6">
                    Choose which notifications this contact should receive.
                </p>
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div class="space-y-3">
                        <label class="flex items-center">
                            <input type="checkbox" name="notifications[]" value="billing" 
                                   class="rounded border-gray-600 bg-dark-surface text-neon-green focus:ring-neon-green">
                            <span class="ml-3 text-sm text-white">Billing notifications</span>
                        </label>
                        
                        <label class="flex items-center">
                            <input type="checkbox" name="notifications[]" value="support" 
                                   class="rounded border-gray-600 bg-dark-surface text-neon-green focus:ring-neon-green">
                            <span class="ml-3 text-sm text-white">Support ticket updates</span>
                        </label>
                    </div>
                    
                    <div class="space-y-3">
                        <label class="flex items-center">
                            <input type="checkbox" name="notifications[]" value="services" 
                                   class="rounded border-gray-600 bg-dark-surface text-neon-green focus:ring-neon-green">
                            <span class="ml-3 text-sm text-white">Service notifications</span>
                        </label>
                        
                        <label class="flex items-center">
                            <input type="checkbox" name="notifications[]" value="general" 
                                   class="rounded border-gray-600 bg-dark-surface text-neon-green focus:ring-neon-green">
                            <span class="ml-3 text-sm text-white">General announcements</span>
                        </label>
                    </div>
                </div>
            </div>
            
            <!-- Actions -->
            <div class="flex justify-between">
                <a href="{$WEB_ROOT}/clientarea.php?action=contacts" class="btn-outline">
                    <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z" clip-rule="evenodd"/>
                    </svg>
                    Back to Contacts
                </a>
                
                <button type="submit" name="submit" class="btn-primary">
                    <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z" clip-rule="evenodd"/>
                    </svg>
                    Add Contact
                </button>
            </div>
        </form>
    </div>
</div>

{include file="$template/footer.tpl"}