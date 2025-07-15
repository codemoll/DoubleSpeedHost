<!-- SSL Certificate Item Template -->
<div class="ssl-certificate-item bg-dark-surface rounded-lg border border-gray-700 p-6 mb-6">
    <div class="flex flex-col md:flex-row md:items-center justify-between">
        <div class="flex-1 mb-4 md:mb-0">
            <h3 class="text-xl font-semibold text-white mb-2">{$certificate.name}</h3>
            <p class="text-text-light mb-3">{$certificate.description}</p>
            
            <div class="flex flex-wrap gap-2 mb-3">
                {if $certificate.features}
                    {foreach from=$certificate.features item=feature}
                        <span class="bg-neon-green bg-opacity-20 text-neon-green px-2 py-1 rounded text-sm">
                            {$feature}
                        </span>
                    {/foreach}
                {/if}
            </div>
            
            <div class="flex items-center gap-4 text-sm text-text-light">
                <span>⚡ {$certificate.issuance_time|default:"Instant"} Issuance</span>
                <span>🔒 {$certificate.encryption|default:"256-bit"} Encryption</span>
                <span>🌐 {$certificate.warranty|default:"$250,000"} Warranty</span>
            </div>
        </div>
        
        <div class="flex flex-col items-end">
            <div class="text-right mb-4">
                {if $certificate.original_price && $certificate.original_price != $certificate.price}
                    <div class="text-text-light line-through text-sm">{$certificate.original_price}</div>
                {/if}
                <div class="text-2xl font-bold text-neon-green">{$certificate.price}</div>
                <div class="text-text-light text-sm">{$certificate.billing_cycle|default:"per year"}</div>
            </div>
            
            <a href="{$WEB_ROOT}/cart.php?a=add&pid={$certificate.id}" class="btn-primary">
                Order Now
            </a>
        </div>
    </div>
</div>