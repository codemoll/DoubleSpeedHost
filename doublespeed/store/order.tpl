{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-20 px-4 sm:px-6 lg:px-8">
    <div class="max-w-6xl mx-auto">
        <!-- Header -->
        <div class="text-center mb-12">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M3 1a1 1 0 000 2h1.22l.305 1.222a.997.997 0 00.01.042l1.358 5.43-.893.892C3.74 11.846 4.632 14 6.414 14H15a1 1 0 000-2H6.414l1-1H14a1 1 0 00.894-.553l3-6A1 1 0 0017 3H6.28l-.31-1.243A1 1 0 005 1H3zM16 16.5a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0zM6.5 18a1.5 1.5 0 100-3 1.5 1.5 0 000 3z"/>
                </svg>
            </div>
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                Complete Your Order
            </h1>
            <p class="text-lg text-text-light max-w-2xl mx-auto">
                You're just one step away from getting your new service up and running.
            </p>
        </div>

        <!-- Order Content -->
        <div class="bg-dark-surface rounded-lg border border-gray-700 p-8">
            {if $orderdetails}
                <div class="space-y-6">
                    {foreach from=$orderdetails item=order}
                        <div class="border-b border-gray-700 pb-6 last:border-b-0 last:pb-0">
                            <h3 class="text-xl font-semibold text-white mb-2">{$order.product}</h3>
                            <p class="text-text-light mb-4">{$order.description}</p>
                            <div class="flex justify-between items-center">
                                <span class="text-text-light">Price:</span>
                                <span class="text-neon-green font-bold text-lg">{$order.price}</span>
                            </div>
                        </div>
                    {/foreach}
                </div>
            {else}
                <div class="text-center py-12">
                    <p class="text-text-light text-lg">Your cart is empty.</p>
                    <a href="{$WEB_ROOT}/cart.php" class="btn-primary mt-4 inline-block">
                        Browse Products
                    </a>
                </div>
            {/if}
        </div>

        <!-- Continue Button -->
        {if $orderdetails}
            <div class="text-center mt-8">
                <a href="{$WEB_ROOT}/cart.php?a=checkout" class="btn-primary">
                    Continue to Checkout
                </a>
            </div>
        {/if}
    </div>
</div>

{include file="$template/footer.tpl"}