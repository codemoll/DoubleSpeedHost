{* OAuth/Social Login Integration Component *}
{* Based on WHMCS Six template implementation *}
{* Usage: {include file="$template/includes/linkedaccounts.tpl" linkContext="registration"} *}

{if ($linkableProviders || $hasLinkedProvidersEnabled) && $linkContext == 'linktable'}
    <div class="bg-dark-surface border border-gray-700 rounded-lg overflow-hidden">
        <div class="px-6 py-4 border-b border-gray-700 bg-gradient-to-r from-electric-blue/10 to-transparent">
            <h3 class="text-lg font-semibold text-electric-blue">
                <i class="fas fa-link mr-2"></i>
                Linked Accounts
            </h3>
        </div>
        <table id="tableLinkedAccounts" class="table display data-driven w-full"
               data-ajax-url="{$linkedAccountsUrl}"
               data-on-draw-rebind-confirmation-modal="true"
               data-lang-empty-table="No linked accounts found"
        >
            <thead>
            <tr class="text-center bg-dark-bg">
                <th class="px-6 py-3 text-left text-xs font-medium text-text-light uppercase tracking-wider">Provider</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-text-light uppercase tracking-wider">Name</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-text-light uppercase tracking-wider">Email Address</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-text-light uppercase tracking-wider">Actions</th>
            </tr>
            </thead>
            <tbody class="bg-dark-surface divide-y divide-gray-700">
            <tr>
                <td colspan="4" class="px-6 py-8 text-center text-text-light">No linked accounts found</td>
            </tr>
            </tbody>
        </table>
    </div>
{elseif $linkableProviders}

    <div id="providerLinkingMessages" class="hidden">
        <p class="providerLinkingMsg-preLink-init_failed">
            <span class="provider-name"></span> is currently unavailable
        </p>
        <p class="providerLinkingMsg-preLink-connect_error">
            <strong>Error:</strong> Unable to connect to the authentication provider
        </p>
        <p class="providerLinkingMsg-preLink-complete_sign_in">
            Please complete the sign-in process in the popup window
        </p>
        <p class="providerLinkingMsg-preLink-2fa_needed">
            Redirecting for two-factor authentication...
        </p>
        <p class="providerLinkingMsg-preLink-linking_complete">
            <strong>Success!</strong> Your account has been linked
        </p>
        <p class="providerLinkingMsg-preLink-login_to_link-signin-required">
            <strong>Link Initiated:</strong> Please complete the sign-in process to continue
        </p>
        <p class="providerLinkingMsg-preLink-login_to_link-registration-required">
            <strong>Link Initiated:</strong> Please complete the registration form below
        </p>
        <p class="providerLinkingMsg-preLink-checkout-new">
            <strong>Link Initiated:</strong> Please complete the account form below
        </p>
        <p class="providerLinkingMsg-preLink-other_user_exists">
            <strong>Error:</strong> This account is already linked to another user
        </p>
        <p class="providerLinkingMsg-preLink-already_linked">
            <strong>Error:</strong> This account is already linked to your profile
        </p>
        <p class="providerLinkingMsg-preLink-default">
            <strong>Error:</strong> Unable to connect to the authentication provider
        </p>
    </div>

    {if $linkContext == 'registration'}
        <div class="mb-6">
            <h3 class="text-lg font-orbitron font-semibold text-white mb-4 flex items-center">
                <svg class="w-5 h-5 text-neon-green mr-2" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z"/>
                </svg>
                Quick Sign Up
            </h3>
        </div>
    {elseif $linkContext == 'checkout-existing'}
        <div class="text-center mb-6">
            <div class="inline-flex items-center px-4 py-2 text-sm text-text-light bg-dark-surface border border-gray-600 rounded-lg">
                or sign in with
            </div>
        </div>
        <p class="text-sm text-center text-text-light mb-6">Save time by linking your social account</p>
    {elseif $linkContext == 'checkout-new'}
        <div class="mb-6">
            <h3 class="text-lg font-orbitron font-semibold text-white mb-4 flex items-center">
                <svg class="w-5 h-5 text-neon-green mr-2" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z"/>
                </svg>
                Quick Sign Up
            </h3>
        </div>
        <p class="text-sm text-center text-text-light mb-6">Save time by linking your social account</p>
    {elseif $linkContext == 'clientsecurity'}
        <p class="text-text-light mb-6">You may link multiple social accounts to your profile for easier access</p>
    {/if}

    <div class="providerPreLinking" data-link-context="{$linkContext}"
         data-hide-on-prelink={if in_array($linkContext, ['clientsecurity','login'])}0{else}1{/if}
         data-disable-on-prelink=0>
        <div class="social-signin-btns grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
            {foreach $linkableProviders as $provider }
                {if in_array($linkContext, ['checkout-existing'])}
                    {$provider.login_button}
                {else}
                    <div class="social-login-button">
                        {if $provider.name|lower == 'google'}
                            <a href="{$provider.link}" class="btn-social btn-google w-full flex items-center justify-center px-4 py-3 border border-gray-600 rounded-lg text-white hover:bg-red-600/10 hover:border-red-500 transition-all duration-300 group">
                                <svg class="w-5 h-5 mr-3 group-hover:scale-110 transition-transform duration-300" viewBox="0 0 24 24">
                                    <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
                                    <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
                                    <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
                                    <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
                                </svg>
                                Continue with Google
                            </a>
                        {elseif $provider.name|lower == 'facebook'}
                            <a href="{$provider.link}" class="btn-social btn-facebook w-full flex items-center justify-center px-4 py-3 border border-gray-600 rounded-lg text-white hover:bg-blue-600/10 hover:border-blue-500 transition-all duration-300 group">
                                <i class="fab fa-facebook-f text-blue-500 mr-3 text-lg group-hover:scale-110 transition-transform duration-300"></i>
                                Continue with Facebook
                            </a>
                        {elseif $provider.name|lower == 'github'}
                            <a href="{$provider.link}" class="btn-social btn-github w-full flex items-center justify-center px-4 py-3 border border-gray-600 rounded-lg text-white hover:bg-gray-600/10 hover:border-gray-500 transition-all duration-300 group">
                                <i class="fab fa-github text-gray-400 mr-3 text-lg group-hover:scale-110 transition-transform duration-300"></i>
                                Continue with GitHub
                            </a>
                        {elseif $provider.name|lower == 'twitter'}
                            <a href="{$provider.link}" class="btn-social btn-twitter w-full flex items-center justify-center px-4 py-3 border border-gray-600 rounded-lg text-white hover:bg-blue-400/10 hover:border-blue-400 transition-all duration-300 group">
                                <i class="fab fa-twitter text-blue-400 mr-3 text-lg group-hover:scale-110 transition-transform duration-300"></i>
                                Continue with Twitter
                            </a>
                        {elseif $provider.name|lower == 'linkedin'}
                            <a href="{$provider.link}" class="btn-social btn-linkedin w-full flex items-center justify-center px-4 py-3 border border-gray-600 rounded-lg text-white hover:bg-blue-700/10 hover:border-blue-600 transition-all duration-300 group">
                                <i class="fab fa-linkedin text-blue-600 mr-3 text-lg group-hover:scale-110 transition-transform duration-300"></i>
                                Continue with LinkedIn
                            </a>
                        {else}
                            <a href="{$provider.link}" class="btn-social btn-default w-full flex items-center justify-center px-4 py-3 border border-gray-600 rounded-lg text-white hover:bg-neon-green/10 hover:border-neon-green transition-all duration-300 group">
                                <i class="fas fa-user-circle text-neon-green mr-3 text-lg group-hover:scale-110 transition-transform duration-300"></i>
                                Continue with {$provider.name|capitalize}
                            </a>
                        {/if}
                    </div>
                {/if}
            {/foreach}
        </div>
        
        {if $linkContext == 'registration'}
            <div class="text-center mb-6">
                <div class="relative">
                    <div class="absolute inset-0 flex items-center">
                        <div class="w-full border-t border-gray-600"></div>
                    </div>
                    <div class="relative flex justify-center text-sm">
                        <span class="px-4 bg-dark-bg text-text-light">or register with email</span>
                    </div>
                </div>
            </div>
        {/if}
    </div>

    {if !isset($customFeedback) || !$customFeedback}
        <div class="providerLinkingFeedback mb-6"></div>
    {/if}

{/if}