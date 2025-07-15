{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-20 px-4 sm:px-6 lg:px-8">
    <div class="max-w-4xl mx-auto text-center">
        <!-- Error Icon -->
        <div class="mx-auto w-20 h-20 bg-gradient-to-br from-red-500 to-red-600 rounded-full flex items-center justify-center mb-6">
            <svg class="w-10 h-10 text-white" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
            </svg>
        </div>

        <!-- Error Content -->
        <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
            Product Not Found
        </h1>
        <p class="text-lg text-text-light mb-8 max-w-2xl mx-auto">
            Sorry, the product or service you're looking for doesn't exist or has been discontinued.
        </p>

        <!-- Actions -->
        <div class="flex flex-col sm:flex-row gap-4 justify-center">
            <a href="{$WEB_ROOT}/" class="btn-primary">
                Return Home
            </a>
            <a href="{$WEB_ROOT}/cart.php" class="btn-outline">
                Browse Products
            </a>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}