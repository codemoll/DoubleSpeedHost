{include file="$template/header.tpl"}

<div class="min-h-screen flex items-center justify-center bg-dark-bg py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full space-y-8">
        <div class="text-center">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                </svg>
            </div>
            <h2 class="text-3xl font-orbitron font-bold text-white">SSL Configuration Complete</h2>
            <p class="mt-2 text-sm text-text-light">Your SSL certificate has been successfully configured</p>
        </div>
        
        <div class="card-dark">
            <div class="text-center space-y-6">
                <div class="bg-green-900 border border-green-700 rounded-lg p-4">
                    <p class="text-green-200 text-sm">
                        Your SSL certificate has been successfully configured and is now active.
                    </p>
                </div>
                
                <div class="space-y-4">
                    <a href="{$WEB_ROOT}/clientarea.php?action=productdetails&id={$productid}" class="btn-primary w-full block text-center">
                        View SSL Details
                    </a>
                    <a href="{$WEB_ROOT}/clientarea.php" class="btn-outline w-full block text-center">
                        Return to Client Area
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
