{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">DNS Management</h1>
            
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
                        Manage DNS records for your domain. Changes may take up to 24 hours to propagate.
                    </p>
                </div>
                
                {if $dnsrecords}
                    <div class="overflow-x-auto">
                        <table class="w-full table-auto">
                            <thead>
                                <tr class="border-b border-gray-600">
                                    <th class="text-left py-3 px-4 text-text-light">Name</th>
                                    <th class="text-left py-3 px-4 text-text-light">Type</th>
                                    <th class="text-left py-3 px-4 text-text-light">Value</th>
                                    <th class="text-left py-3 px-4 text-text-light">TTL</th>
                                    <th class="text-left py-3 px-4 text-text-light">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $dnsrecords as $record}
                                    <tr class="border-b border-gray-700">
                                        <td class="py-3 px-4 text-white">{$record.name}</td>
                                        <td class="py-3 px-4 text-text-light">{$record.type}</td>
                                        <td class="py-3 px-4 text-text-light">{$record.value}</td>
                                        <td class="py-3 px-4 text-text-light">{$record.ttl}</td>
                                        <td class="py-3 px-4">
                                            <button class="btn-secondary btn-sm mr-2">Edit</button>
                                            <button class="btn-outline btn-sm">Delete</button>
                                        </td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                {/if}
                
                <div class="border-t border-gray-600 pt-6">
                    <h3 class="text-lg font-semibold text-white mb-4">Add New DNS Record</h3>
                    <form method="post" class="grid grid-cols-1 md:grid-cols-4 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-text-light mb-2">Name</label>
                            <input type="text" name="name" class="input-dark w-full" placeholder="@">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-text-light mb-2">Type</label>
                            <select name="type" class="input-dark w-full">
                                <option value="A">A</option>
                                <option value="CNAME">CNAME</option>
                                <option value="MX">MX</option>
                                <option value="TXT">TXT</option>
                            </select>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-text-light mb-2">Value</label>
                            <input type="text" name="value" class="input-dark w-full" placeholder="192.168.1.1">
                        </div>
                        <div class="flex items-end">
                            <button type="submit" class="btn-primary w-full">Add Record</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
