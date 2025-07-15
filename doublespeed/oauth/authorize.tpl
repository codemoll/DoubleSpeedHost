{capture name="oauth_content"}
<div class="min-h-screen flex items-center justify-center bg-dark-bg py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full space-y-8">
        <div class="text-center">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" clip-rule="evenodd"/>
                </svg>
            </div>
            <h2 class="text-3xl font-orbitron font-bold text-white">
                Authorize Application
            </h2>
            <p class="mt-2 text-sm text-text-light">
                {if $app_name}
                    <strong class="text-neon-green">{$app_name}</strong> would like to access your account
                {else}
                    A third-party application would like to access your account
                {/if}
            </p>
        </div>
        
        <div class="card-dark">
            <!-- Application Info -->
            {if $app_name || $app_description || $app_website}
                <div class="mb-6 p-4 bg-dark-surface border border-gray-700 rounded-lg">
                    <div class="flex items-start space-x-3">
                        {if $app_logo}
                            <img src="{$app_logo}" alt="{$app_name}" class="w-12 h-12 rounded-lg border border-gray-600">
                        {else}
                            <div class="w-12 h-12 bg-gradient-to-br from-electric-blue to-neon-green rounded-lg flex items-center justify-center">
                                <svg class="w-6 h-6 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                                    <path d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z"/>
                                </svg>
                            </div>
                        {/if}
                        
                        <div class="flex-1">
                            <h3 class="text-lg font-semibold text-white">
                                {$app_name|default:"Third-party Application"}
                            </h3>
                            {if $app_description}
                                <p class="text-sm text-text-light mt-1">{$app_description}</p>
                            {/if}
                            {if $app_website}
                                <a href="{$app_website}" target="_blank" class="text-xs text-neon-green hover:text-electric-blue transition-colors duration-300 mt-1 inline-block">
                                    {$app_website}
                                    <svg class="w-3 h-3 inline ml-1" fill="currentColor" viewBox="0 0 20 20">
                                        <path d="M11 3a1 1 0 100 2h2.586l-6.293 6.293a1 1 0 101.414 1.414L15 6.414V9a1 1 0 102 0V4a1 1 0 00-1-1h-5z"/>
                                        <path d="M5 5a2 2 0 00-2 2v8a2 2 0 002 2h8a2 2 0 002-2v-3a1 1 0 10-2 0v3H5V7h3a1 1 0 000-2H5z"/>
                                    </svg>
                                </a>
                            {/if}
                        </div>
                    </div>
                </div>
            {/if}
            
            <!-- Permissions -->
            {if $requested_scopes}
                <div class="mb-6">
                    <h4 class="text-sm font-medium text-white mb-3">This application will be able to:</h4>
                    <ul class="space-y-2">
                        {foreach from=$requested_scopes item=scope}
                            <li class="flex items-center text-sm text-text-light">
                                <svg class="w-4 h-4 text-neon-green mr-2 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                                </svg>
                                {if $scope == 'profile:read'}
                                    Read your profile information
                                {elseif $scope == 'email:read'}
                                    Access your email address
                                {elseif $scope == 'services:read'}
                                    View your services and products
                                {elseif $scope == 'invoices:read'}
                                    View your invoices and billing information
                                {elseif $scope == 'tickets:read'}
                                    View your support tickets
                                {elseif $scope == 'tickets:write'}
                                    Create and update support tickets
                                {else}
                                    {$scope}
                                {/if}
                            </li>
                        {/foreach}
                    </ul>
                </div>
            {/if}
            
            <!-- Authorization Form -->
            <form method="post" action="{$WEB_ROOT}/oauth/authorize.php" class="space-y-4">
                {if $csrf_token}
                    <input type="hidden" name="csrf_token" value="{$csrf_token}">
                {/if}
                {if $client_id}
                    <input type="hidden" name="client_id" value="{$client_id}">
                {/if}
                {if $redirect_uri}
                    <input type="hidden" name="redirect_uri" value="{$redirect_uri}">
                {/if}
                {if $response_type}
                    <input type="hidden" name="response_type" value="{$response_type}">
                {/if}
                {if $scope}
                    <input type="hidden" name="scope" value="{$scope}">
                {/if}
                {if $state}
                    <input type="hidden" name="state" value="{$state}">
                {/if}
                
                <div class="grid grid-cols-2 gap-3">
                    <button type="submit" name="authorize" value="deny" 
                            class="w-full py-3 px-4 border border-red-600 text-red-400 rounded-lg hover:bg-red-600 hover:text-white transition-all duration-300 font-medium">
                        Deny
                    </button>
                    <button type="submit" name="authorize" value="allow" 
                            class="btn-primary w-full font-medium">
                        Allow Access
                    </button>
                </div>
            </form>
            
            <!-- Security Notice -->
            <div class="mt-6 p-3 bg-yellow-900/30 border border-yellow-600/50 rounded-lg">
                <div class="flex items-start">
                    <svg class="w-5 h-5 text-yellow-400 mr-2 mt-0.5 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
                    </svg>
                    <div class="text-sm text-yellow-200">
                        Only grant access to applications you trust. You can revoke this authorization at any time from your account security settings.
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Additional Links -->
        <div class="text-center">
            <p class="text-sm text-text-light">
                <a href="{$WEB_ROOT}/clientarea.php" class="text-neon-green hover:text-electric-blue transition-colors duration-300">
                    ← Back to Client Area
                </a>
            </p>
        </div>
    </div>
</div>
{/capture}

{include file="$template/oauth/layout.tpl" content=$smarty.capture.oauth_content}