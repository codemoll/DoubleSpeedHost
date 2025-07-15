{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                <span class="glow-text">Account Security</span>
            </h1>
            <p class="text-text-light">
                Manage your account security settings, change your password, and set up two-factor authentication.
            </p>
        </div>
        
        {if $successmessage}
            <div class="bg-green-900 border border-green-700 rounded-lg p-4 mb-6">
                <div class="flex">
                    <svg class="w-5 h-5 text-green-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                    </svg>
                    <div class="text-green-200 text-sm">{$successmessage}</div>
                </div>
            </div>
        {/if}
        
        <!-- Password Change -->
        <div class="card-dark mb-8">
            <h2 class="text-2xl font-semibold text-white mb-6">Change Password</h2>
            
            <form method="post" action="{$smarty.server.PHP_SELF}" class="space-y-6">
                <input type="hidden" name="action" value="security" />
                <input type="hidden" name="operation" value="changepassword" />
                
                {if $pwderror}
                    <div class="bg-red-900 border border-red-700 rounded-lg p-4">
                        <div class="flex">
                            <svg class="w-5 h-5 text-red-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                            </svg>
                            <div class="text-red-200 text-sm">{$pwderror}</div>
                        </div>
                    </div>
                {/if}
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label for="currentpw" class="block text-sm font-medium text-white mb-2">
                            Current Password *
                        </label>
                        <input type="password" id="currentpw" name="currentpw" required 
                               class="input-dark w-full" placeholder="Enter current password">
                    </div>
                    
                    <div>
                        <label for="newpw" class="block text-sm font-medium text-white mb-2">
                            New Password *
                        </label>
                        <input type="password" id="newpw" name="newpw" required 
                               class="input-dark w-full" placeholder="Enter new password">
                    </div>
                    
                    <div class="md:col-span-2">
                        <label for="confirmpw" class="block text-sm font-medium text-white mb-2">
                            Confirm New Password *
                        </label>
                        <input type="password" id="confirmpw" name="confirmpw" required 
                               class="input-dark w-full" placeholder="Confirm new password">
                    </div>
                </div>
                
                <button type="submit" name="submit" class="btn-primary">
                    Update Password
                </button>
            </form>
            
            <!-- Password Requirements -->
            <div class="mt-6 p-4 bg-dark-bg rounded-lg border border-gray-700">
                <h4 class="text-white font-medium mb-2">Password Requirements:</h4>
                <ul class="text-text-light text-sm space-y-1">
                    <li>• Minimum 8 characters long</li>
                    <li>• At least one uppercase letter</li>
                    <li>• At least one lowercase letter</li>
                    <li>• At least one number</li>
                    <li>• At least one special character</li>
                </ul>
            </div>
        </div>
        
        <!-- Two-Factor Authentication -->
        <div class="card-dark mb-8">
            <div class="flex items-center justify-between mb-6">
                <div>
                    <h2 class="text-2xl font-semibold text-white">Two-Factor Authentication</h2>
                    <p class="text-text-light text-sm mt-1">
                        Add an extra layer of security to your account
                    </p>
                </div>
                <div class="flex items-center">
                    {if $twofaenabled}
                        <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-green-900 text-green-200">
                            <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                            </svg>
                            Enabled
                        </span>
                    {else}
                        <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-red-900 text-red-200">
                            <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                            </svg>
                            Disabled
                        </span>
                    {/if}
                </div>
            </div>
            
            {if $twofaenabled}
                <div class="space-y-4">
                    <p class="text-text-light">
                        Two-factor authentication is currently enabled on your account. 
                        You'll be prompted to enter a verification code when signing in.
                    </p>
                    
                    <div class="flex space-x-4">
                        <a href="{$WEB_ROOT}/clientarea.php?action=security&operation=disable2fa" class="btn-outline">
                            Disable 2FA
                        </a>
                        <a href="{$WEB_ROOT}/clientarea.php?action=security&operation=backupcodes" class="btn-secondary">
                            View Backup Codes
                        </a>
                    </div>
                </div>
            {else}
                <div class="space-y-4">
                    <p class="text-text-light">
                        Two-factor authentication adds an extra layer of security to your account. 
                        When enabled, you'll need to enter a code from your mobile device to sign in.
                    </p>
                    
                    <a href="{$WEB_ROOT}/clientarea.php?action=security&operation=enable2fa" class="btn-primary">
                        Enable Two-Factor Authentication
                    </a>
                </div>
            {/if}
        </div>
        
        <!-- Login History -->
        <div class="card-dark mb-8">
            <h2 class="text-2xl font-semibold text-white mb-6">Recent Login Activity</h2>
            
            {if $loginhistory}
                <div class="overflow-x-auto">
                    <table class="w-full">
                        <thead>
                            <tr class="border-b border-gray-700">
                                <th class="text-left py-3 text-white font-medium">Date & Time</th>
                                <th class="text-left py-3 text-white font-medium">IP Address</th>
                                <th class="text-left py-3 text-white font-medium">Location</th>
                                <th class="text-left py-3 text-white font-medium">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$loginhistory item=login}
                                <tr class="border-b border-gray-800">
                                    <td class="py-3 text-text-light">{$login.datetime}</td>
                                    <td class="py-3 text-text-light font-mono">{$login.ip}</td>
                                    <td class="py-3 text-text-light">{$login.location}</td>
                                    <td class="py-3">
                                        {if $login.success}
                                            <span class="inline-flex items-center px-2 py-1 rounded text-xs bg-green-900 text-green-200">
                                                Success
                                            </span>
                                        {else}
                                            <span class="inline-flex items-center px-2 py-1 rounded text-xs bg-red-900 text-red-200">
                                                Failed
                                            </span>
                                        {/if}
                                    </td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            {else}
                <p class="text-text-light">No recent login activity to display.</p>
            {/if}
        </div>
        
        <!-- API Access -->
        <div class="card-dark">
            <h2 class="text-2xl font-semibold text-white mb-6">API Access</h2>
            <p class="text-text-light mb-6">
                Generate API credentials to integrate with third-party applications and services.
            </p>
            
            {if $apikeys}
                <div class="space-y-4 mb-6">
                    {foreach from=$apikeys item=key}
                        <div class="flex items-center justify-between p-4 bg-dark-bg rounded-lg border border-gray-700">
                            <div>
                                <div class="text-white font-medium">{$key.name}</div>
                                <div class="text-text-light text-sm">Created: {$key.created}</div>
                                <div class="text-text-light text-sm">Last used: {$key.lastused|default:"Never"}</div>
                            </div>
                            <div class="flex space-x-2">
                                <button class="text-electric-blue hover:text-neon-green transition-colors duration-300">
                                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                        <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"/>
                                    </svg>
                                </button>
                                <button class="text-red-400 hover:text-red-300 transition-colors duration-300">
                                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z" clip-rule="evenodd"/>
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414L8.586 12l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293z" clip-rule="evenodd"/>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    {/foreach}
                </div>
            {/if}
            
            <a href="{$WEB_ROOT}/clientarea.php?action=security&operation=createapi" class="btn-secondary">
                Generate New API Key
            </a>
        </div>
        
    </div>
</div>

{include file="$template/footer.tpl"}