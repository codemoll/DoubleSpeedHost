{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg flex items-center justify-center px-4">
    <div class="max-w-lg w-full text-center">
        <div class="mb-8">
            <div class="text-6xl font-bold text-neon-green mb-4">
                {if $errortitle}
                    {if $errortitle == "404"}404{else}Error{/if}
                {else}
                    Error
                {/if}
            </div>
            <h1 class="text-2xl font-semibold text-white mb-4">
                {if $errortitle}
                    {if $errortitle == "404"}
                        Page Not Found
                    {else}
                        {$errortitle}
                    {/if}
                {else}
                    Something went wrong
                {/if}
            </h1>
            <p class="text-gray-400 mb-8">
                {if $errormessage}
                    {$errormessage}
                {else}
                    {if $errortitle == "404"}
                        The page you are looking for could not be found.
                    {else}
                        An unexpected error occurred. Please try again later.
                    {/if}
                {/if}
            </p>
        </div>
        
        <div class="space-y-4">
            <a href="{$WEB_ROOT}/index.php" class="inline-block bg-neon-green text-dark-bg font-semibold py-3 px-6 rounded-lg hover:shadow-neon-green/50 hover:shadow-lg transition-all duration-300">
                Return Home
            </a>
            
            {if isset($smarty.server.HTTP_REFERER) && $smarty.server.HTTP_REFERER}
                <a href="javascript:history.back()" class="block text-gray-400 hover:text-neon-green transition-colors duration-300">
                    Go Back
                </a>
            {/if}
        </div>
        
        {if $errortitle == "404"}
            <div class="mt-8 p-4 bg-dark-surface rounded-lg border border-gray-700">
                <h3 class="text-white font-semibold mb-2">Quick Links</h3>
                <div class="grid grid-cols-2 gap-2 text-sm">
                    <a href="{$WEB_ROOT}/clientarea.php" class="text-gray-400 hover:text-neon-green transition-colors">Client Area</a>
                    <a href="{$WEB_ROOT}/submitticket.php" class="text-gray-400 hover:text-neon-green transition-colors">Support</a>
                    <a href="{$WEB_ROOT}/knowledgebase.php" class="text-gray-400 hover:text-neon-green transition-colors">Knowledge Base</a>
                    <a href="{$WEB_ROOT}/contact.php" class="text-gray-400 hover:text-neon-green transition-colors">Contact</a>
                </div>
            </div>
        {/if}
    </div>
</div>

{include file="$template/footer.tpl"}