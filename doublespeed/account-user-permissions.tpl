{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">User Permissions</h1>
            
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
            
            <div class="space-y-6">
                <form method="post" class="space-y-6">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <h3 class="text-lg font-semibold text-white mb-4">Account Management</h3>
                            <div class="space-y-2">
                                <label class="flex items-center">
                                    <input type="checkbox" name="permissions[]" value="view_account" class="mr-3">
                                    <span class="text-text-light">View Account Information</span>
                                </label>
                                <label class="flex items-center">
                                    <input type="checkbox" name="permissions[]" value="edit_account" class="mr-3">
                                    <span class="text-text-light">Edit Account Information</span>
                                </label>
                                <label class="flex items-center">
                                    <input type="checkbox" name="permissions[]" value="manage_billing" class="mr-3">
                                    <span class="text-text-light">Manage Billing</span>
                                </label>
                            </div>
                        </div>
                        
                        <div>
                            <h3 class="text-lg font-semibold text-white mb-4">Services</h3>
                            <div class="space-y-2">
                                <label class="flex items-center">
                                    <input type="checkbox" name="permissions[]" value="view_services" class="mr-3">
                                    <span class="text-text-light">View Services</span>
                                </label>
                                <label class="flex items-center">
                                    <input type="checkbox" name="permissions[]" value="manage_services" class="mr-3">
                                    <span class="text-text-light">Manage Services</span>
                                </label>
                                <label class="flex items-center">
                                    <input type="checkbox" name="permissions[]" value="order_services" class="mr-3">
                                    <span class="text-text-light">Order New Services</span>
                                </label>
                            </div>
                        </div>
                    </div>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <h3 class="text-lg font-semibold text-white mb-4">Support</h3>
                            <div class="space-y-2">
                                <label class="flex items-center">
                                    <input type="checkbox" name="permissions[]" value="view_tickets" class="mr-3">
                                    <span class="text-text-light">View Support Tickets</span>
                                </label>
                                <label class="flex items-center">
                                    <input type="checkbox" name="permissions[]" value="create_tickets" class="mr-3">
                                    <span class="text-text-light">Create Support Tickets</span>
                                </label>
                            </div>
                        </div>
                        
                        <div>
                            <h3 class="text-lg font-semibold text-white mb-4">Domains</h3>
                            <div class="space-y-2">
                                <label class="flex items-center">
                                    <input type="checkbox" name="permissions[]" value="view_domains" class="mr-3">
                                    <span class="text-text-light">View Domains</span>
                                </label>
                                <label class="flex items-center">
                                    <input type="checkbox" name="permissions[]" value="manage_domains" class="mr-3">
                                    <span class="text-text-light">Manage Domains</span>
                                </label>
                            </div>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn-primary">Update Permissions</button>
                </form>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
