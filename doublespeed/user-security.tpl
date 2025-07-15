{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Security Settings</h1>
            
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
            
            <div class="space-y-8">
                <!-- Two-Factor Authentication -->
                <div class="bg-dark-bg rounded-lg p-6 border border-gray-600">
                    <h3 class="text-xl font-semibold text-white mb-4">Two-Factor Authentication</h3>
                    <p class="text-text-light mb-4">
                        Add an extra layer of security to your account with two-factor authentication.
                    </p>
                    
                    {if $twofactorenabled}
                        <div class="flex items-center justify-between">
                            <div class="flex items-center">
                                <svg class="w-6 h-6 text-green-400 mr-3" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                                </svg>
                                <span class="text-green-400 font-semibold">Two-factor authentication is enabled</span>
                            </div>
                            <button class="btn-outline btn-sm">Disable</button>
                        </div>
                    {else}
                        <div class="flex items-center justify-between">
                            <div class="flex items-center">
                                <svg class="w-6 h-6 text-yellow-400 mr-3" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
                                </svg>
                                <span class="text-yellow-400 font-semibold">Two-factor authentication is disabled</span>
                            </div>
                            <button class="btn-primary btn-sm">Enable</button>
                        </div>
                    {/if}
                </div>
                
                <!-- Security Questions -->
                <div class="bg-dark-bg rounded-lg p-6 border border-gray-600">
                    <h3 class="text-xl font-semibold text-white mb-4">Security Questions</h3>
                    <form method="post" class="space-y-4">
                        <div>
                            <label class="block text-sm font-medium text-text-light mb-2">Security Question</label>
                            <select name="securityquestion" class="input-dark w-full">
                                <option value="">Select a question...</option>
                                <option value="1">What was the name of your first pet?</option>
                                <option value="2">What was your mother's maiden name?</option>
                                <option value="3">What city were you born in?</option>
                                <option value="4">What was the name of your first school?</option>
                            </select>
                        </div>
                        
                        <div>
                            <label class="block text-sm font-medium text-text-light mb-2">Security Answer</label>
                            <input type="password" name="securityanswer" class="input-dark w-full" 
                                   placeholder="Enter your answer">
                        </div>
                        
                        <button type="submit" class="btn-primary">Update Security Question</button>
                    </form>
                </div>
                
                <!-- Login History -->
                <div class="bg-dark-bg rounded-lg p-6 border border-gray-600">
                    <h3 class="text-xl font-semibold text-white mb-4">Recent Login Activity</h3>
                    {if $loginhistory}
                        <div class="space-y-3">
                            {foreach $loginhistory as $login}
                                <div class="flex justify-between items-center py-2 border-b border-gray-700">
                                    <div>
                                        <p class="text-white">{$login.ip}</p>
                                        <p class="text-text-light text-sm">{$login.location}</p>
                                    </div>
                                    <div class="text-right">
                                        <p class="text-text-light text-sm">{$login.date}</p>
                                        <p class="text-text-light text-xs">{$login.browser}</p>
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    {else}
                        <p class="text-text-light">No recent login activity available.</p>
                    {/if}
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
