{include file="$template/header.tpl"}

<div class="min-h-screen flex items-center justify-center bg-dark-bg py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full space-y-8">
        <div class="text-center">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-red-500 to-red-700 rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-white" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
                </svg>
            </div>
            <h2 class="text-3xl font-orbitron font-bold text-white mb-4">
                {if $error_title}{$error_title}{else}An Error Occurred{/if}
            </h2>
            <p class="text-text-light mb-8">
                {if $error_message}
                    {$error_message}
                {else}
                    Something went wrong while processing your request. Please try again or contact support if the problem persists.
                {/if}
            </p>
        </div>
        
        <div class="card-dark text-center">
            {if $error_details}
                <div class="bg-red-900 border border-red-700 rounded-lg p-4 mb-6">
                    <h3 class="text-red-200 font-semibold mb-2">Error Details:</h3>
                    <p class="text-red-300 text-sm font-mono">{$error_details}</p>
                </div>
            {/if}
            
            <h3 class="text-xl font-semibold text-white mb-4">What can you do?</h3>
            <div class="space-y-4 mb-6">
                <div class="flex items-center space-x-3">
                    <svg class="w-5 h-5 text-neon-green flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                    </svg>
                    <span class="text-text-light">Refresh the page and try again</span>
                </div>
                <div class="flex items-center space-x-3">
                    <svg class="w-5 h-5 text-neon-green flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                    </svg>
                    <span class="text-text-light">Check your internet connection</span>
                </div>
                <div class="flex items-center space-x-3">
                    <svg class="w-5 h-5 text-neon-green flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                    </svg>
                    <span class="text-text-light">Contact support if the issue continues</span>
                </div>
            </div>
            
            <div class="space-y-4">
                <button onclick="location.reload()" class="btn-primary w-full block text-center">
                    <svg class="w-5 h-5 inline-block mr-2" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M4 2a1 1 0 011 1v2.101a7.002 7.002 0 0111.601 2.566 1 1 0 11-1.885.666A5.002 5.002 0 005.999 7H9a1 1 0 010 2H4a1 1 0 01-1-1V3a1 1 0 011-1zm.008 9.057a1 1 0 011.276.61A5.002 5.002 0 0014.001 13H11a1 1 0 110-2h5a1 1 0 011 1v5a1 1 0 11-2 0v-2.101a7.002 7.002 0 01-11.601-2.566 1 1 0 01.61-1.276z" clip-rule="evenodd"/>
                    </svg>
                    Try Again
                </button>
                <a href="{$WEB_ROOT}/index.php" class="btn-outline w-full block text-center">
                    <svg class="w-5 h-5 inline-block mr-2" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"/>
                    </svg>
                    Return Home
                </a>
                <a href="{$WEB_ROOT}/clientarea.php" class="btn-outline w-full block text-center">
                    <svg class="w-5 h-5 inline-block mr-2" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z" clip-rule="evenodd"/>
                    </svg>
                    Client Area
                </a>
                <a href="{$WEB_ROOT}/submitticket.php" class="btn-secondary w-full block text-center">
                    <svg class="w-5 h-5 inline-block mr-2" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z"/>
                    </svg>
                    Contact Support
                </a>
            </div>
            
            {if $error_code || $error_timestamp}
                <div class="mt-6 text-sm text-text-light border-t border-dark-surface pt-4">
                    <p class="font-semibold mb-2">Technical Information:</p>
                    {if $error_code}
                        <p>Error Code: <span class="font-mono">{$error_code}</span></p>
                    {/if}
                    {if $error_timestamp}
                        <p>Time: <span class="font-mono">{$error_timestamp}</span></p>
                    {else}
                        <p>Time: <span class="font-mono">{date('Y-m-d H:i:s')}</span></p>
                    {/if}
                    {if $request_id}
                        <p>Request ID: <span class="font-mono">{$request_id}</span></p>
                    {/if}
                </div>
            {/if}
        </div>
        
        <div class="text-center">
            <button onclick="history.back()" class="text-neon-green hover:text-electric-blue transition-colors duration-300">
                <svg class="w-5 h-5 inline-block mr-1" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z" clip-rule="evenodd"/>
                </svg>
                Go Back
            </button>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}