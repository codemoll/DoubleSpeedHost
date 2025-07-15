{capture name="oauth_content"}
<div class="min-h-screen flex items-center justify-center bg-dark-bg py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full space-y-8">
        <div class="text-center">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                {if $success}
                    <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                    </svg>
                {else}
                    <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M4 2a1 1 0 011 1v2.101a7.002 7.002 0 0111.601 2.566 1 1 0 11-1.885.666A5.002 5.002 0 005.999 7H9a1 1 0 010 2H4a1 1 0 01-1-1V3a1 1 0 011-1zm.008 9.057a1 1 0 011.276.61A5.002 5.002 0 0014.001 13H11a1 1 0 110-2h5a1 1 0 011 1v5a1 1 0 11-2 0v-2.101a7.002 7.002 0 01-11.601-2.566 1 1 0 01.61-1.276z" clip-rule="evenodd"/>
                    </svg>
                {/if}
            </div>
            
            {if $success}
                <h2 class="text-3xl font-orbitron font-bold text-white">
                    Authorization Successful
                </h2>
                <p class="mt-2 text-sm text-text-light">
                    {if $app_name}
                        You have successfully granted access to <strong class="text-neon-green">{$app_name}</strong>
                    {else}
                        Authorization completed successfully
                    {/if}
                </p>
            {else}
                <h2 class="text-3xl font-orbitron font-bold text-white">
                    Redirecting...
                </h2>
                <p class="mt-2 text-sm text-text-light">
                    {if $app_name}
                        Redirecting you back to <strong class="text-neon-green">{$app_name}</strong>
                    {else}
                        Redirecting you back to the application
                    {/if}
                </p>
            {/if}
        </div>
        
        <div class="card-dark">
            {if $success}
                <!-- Success Message -->
                <div class="text-center space-y-4">
                    <div class="bg-green-900/30 border border-green-600/50 rounded-lg p-4">
                        <div class="flex items-center justify-center">
                            <svg class="w-5 h-5 text-green-400 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-green-200 text-sm font-medium">
                                Authorization granted successfully
                            </span>
                        </div>
                    </div>
                    
                    {if $redirect_uri}
                        <p class="text-text-light text-sm">
                            You will be redirected automatically in <span id="countdown" class="text-neon-green font-mono">5</span> seconds.
                        </p>
                        
                        <a href="{$redirect_uri}" 
                           class="btn-primary inline-block">
                            Continue to Application
                        </a>
                    {else}
                        <a href="{$WEB_ROOT}/clientarea.php" 
                           class="btn-primary inline-block">
                            Return to Client Area
                        </a>
                    {/if}
                </div>
                
            {elseif $error}
                <!-- Error Message -->
                <div class="text-center space-y-4">
                    <div class="bg-red-900/30 border border-red-600/50 rounded-lg p-4">
                        <div class="flex items-start">
                            <svg class="w-5 h-5 text-red-400 mr-3 mt-0.5 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                            </svg>
                            <div class="text-left">
                                <div class="text-red-200 text-sm font-medium">
                                    Authorization Failed
                                </div>
                                <div class="text-red-300 text-xs mt-1">
                                    {if $error_description}
                                        {$error_description}
                                    {elseif $error == 'access_denied'}
                                        You denied access to the application.
                                    {elseif $error == 'invalid_request'}
                                        The authorization request was invalid.
                                    {elseif $error == 'invalid_client'}
                                        The application is not authorized.
                                    {elseif $error == 'invalid_scope'}
                                        The requested permissions are invalid.
                                    {elseif $error == 'server_error'}
                                        An internal server error occurred.
                                    {else}
                                        An error occurred during authorization: {$error}
                                    {/if}
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="space-y-2">
                        <a href="{$WEB_ROOT}/clientarea.php" 
                           class="btn-primary inline-block">
                            Return to Client Area
                        </a>
                        
                        {if $retry_url}
                            <a href="{$retry_url}" 
                               class="block text-neon-green hover:text-electric-blue transition-colors duration-300 text-sm">
                                Try Again
                            </a>
                        {/if}
                    </div>
                </div>
                
            {else}
                <!-- Loading/Redirecting -->
                <div class="text-center space-y-4">
                    <div class="flex justify-center">
                        <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-neon-green"></div>
                    </div>
                    
                    <p class="text-text-light text-sm">
                        {if $redirect_uri}
                            Redirecting you back to the application...
                        {else}
                            Processing your request...
                        {/if}
                    </p>
                    
                    {if $redirect_uri}
                        <p class="text-text-light text-xs">
                            If you are not redirected automatically, 
                            <a href="{$redirect_uri}" class="text-neon-green hover:text-electric-blue transition-colors duration-300">
                                click here
                            </a>
                        </p>
                    {/if}
                </div>
            {/if}
        </div>
        
        <!-- Security Info -->
        <div class="text-center">
            <div class="inline-flex items-center space-x-2 text-sm text-text-light">
                <svg class="w-4 h-4 text-neon-green" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                </svg>
                <span>Secure OAuth redirect</span>
            </div>
        </div>
    </div>
</div>

{if $success && $redirect_uri}
    <script>
    // Countdown timer for automatic redirect
    let countdown = 5;
    const countdownElement = document.getElementById('countdown');
    
    const timer = setInterval(function() {
        countdown--;
        if (countdownElement) {
            countdownElement.textContent = countdown;
        }
        
        if (countdown <= 0) {
            clearInterval(timer);
            window.location.href = '{$redirect_uri}';
        }
    }, 1000);
    </script>
{elseif $redirect_uri && !$error}
    <script>
    // Immediate redirect for processing state
    setTimeout(function() {
        window.location.href = '{$redirect_uri}';
    }, 2000);
    </script>
{/if}
{/capture}

{include file="$template/oauth/layout.tpl" content=$smarty.capture.oauth_content}