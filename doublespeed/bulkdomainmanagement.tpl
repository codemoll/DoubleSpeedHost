{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Bulk Domain Management</h1>
            
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
                <div class="bg-blue-900 border border-blue-700 rounded-lg p-4">
                    <p class="text-blue-200 text-sm">
                        Manage multiple domains at once. Select domains and choose an action to perform.
                    </p>
                </div>
                
                <form method="post" class="space-y-6">
                    <div class="overflow-x-auto">
                        <table class="w-full table-auto">
                            <thead>
                                <tr class="border-b border-gray-600">
                                    <th class="text-left py-3 px-4">
                                        <input type="checkbox" id="selectAll" class="mr-2">
                                        <label for="selectAll" class="text-text-light">Select All</label>
                                    </th>
                                    <th class="text-left py-3 px-4 text-text-light">Domain</th>
                                    <th class="text-left py-3 px-4 text-text-light">Status</th>
                                    <th class="text-left py-3 px-4 text-text-light">Expiry Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $domains as $domain}
                                    <tr class="border-b border-gray-700">
                                        <td class="py-3 px-4">
                                            <input type="checkbox" name="domains[]" value="{$domain.id}" class="domain-checkbox">
                                        </td>
                                        <td class="py-3 px-4 text-white">{$domain.name}</td>
                                        <td class="py-3 px-4">
                                            <span class="px-2 py-1 text-xs rounded {if $domain.status == 'active'}bg-green-900 text-green-200{else}bg-red-900 text-red-200{/if}">
                                                {$domain.status}
                                            </span>
                                        </td>
                                        <td class="py-3 px-4 text-text-light">{$domain.expiry}</td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="flex items-center space-x-4">
                        <select name="action" class="input-dark">
                            <option value="">Select Action...</option>
                            <option value="renew">Renew Selected</option>
                            <option value="transfer">Transfer Selected</option>
                            <option value="update_nameservers">Update Nameservers</option>
                            <option value="update_contacts">Update Contacts</option>
                        </select>
                        <button type="submit" class="btn-primary">Execute Action</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
