{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">User Management</h1>
            
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
                {if $users}
                    <div class="overflow-x-auto">
                        <table class="w-full table-auto">
                            <thead>
                                <tr class="border-b border-gray-600">
                                    <th class="text-left py-3 px-4 text-text-light">Name</th>
                                    <th class="text-left py-3 px-4 text-text-light">Email</th>
                                    <th class="text-left py-3 px-4 text-text-light">Role</th>
                                    <th class="text-left py-3 px-4 text-text-light">Status</th>
                                    <th class="text-left py-3 px-4 text-text-light">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $users as $user}
                                    <tr class="border-b border-gray-700">
                                        <td class="py-3 px-4 text-white">{$user.firstname} {$user.lastname}</td>
                                        <td class="py-3 px-4 text-text-light">{$user.email}</td>
                                        <td class="py-3 px-4 text-text-light">{$user.role}</td>
                                        <td class="py-3 px-4">
                                            <span class="px-2 py-1 text-xs rounded {if $user.status == 'active'}bg-green-900 text-green-200{else}bg-red-900 text-red-200{/if}">
                                                {$user.status}
                                            </span>
                                        </td>
                                        <td class="py-3 px-4">
                                            <button class="btn-secondary btn-sm mr-2">Edit</button>
                                            <button class="btn-outline btn-sm">Remove</button>
                                        </td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                {/if}
                
                <div class="border-t border-gray-600 pt-6">
                    <h3 class="text-lg font-semibold text-white mb-4">Invite New User</h3>
                    <form method="post" class="space-y-4">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="block text-sm font-medium text-text-light mb-2">Email Address</label>
                                <input type="email" name="email" class="input-dark w-full" placeholder="user@example.com">
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-text-light mb-2">Role</label>
                                <select name="role" class="input-dark w-full">
                                    <option value="user">User</option>
                                    <option value="admin">Administrator</option>
                                </select>
                            </div>
                        </div>
                        <button type="submit" class="btn-primary">Send Invitation</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
