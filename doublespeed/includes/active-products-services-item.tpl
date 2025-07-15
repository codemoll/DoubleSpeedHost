{* Active Products/Services Item Component *}
{* Usage: {include file="$template/includes/active-products-services-item.tpl" product=$product} *}

{if $product}
    <div class="bg-dark-surface border border-gray-700 rounded-lg p-4 hover:border-neon-green/50 transition-all duration-300 group">
        <div class="flex items-start justify-between">
            
            {* Product Info *}
            <div class="flex-1">
                <div class="flex items-center mb-2">
                    <h4 class="font-semibold text-white group-hover:text-neon-green transition-colors duration-200">
                        {$product.name|default:"Service"}
                    </h4>
                    {if $product.status}
                        <span class="ml-2 px-2 py-1 text-xs font-medium rounded-full
                            {if $product.status == 'Active'}bg-green-900/50 text-green-400 border border-green-500
                            {elseif $product.status == 'Suspended'}bg-red-900/50 text-red-400 border border-red-500
                            {elseif $product.status == 'Pending'}bg-yellow-900/50 text-yellow-400 border border-yellow-500
                            {else}bg-gray-900/50 text-gray-400 border border-gray-500{/if}">
                            {$product.status}
                        </span>
                    {/if}
                </div>
                
                {if $product.domain}
                    <p class="text-gray-400 text-sm mb-1">
                        <i class="fas fa-globe mr-1"></i>
                        {$product.domain}
                    </p>
                {/if}
                
                {if $product.regdate}
                    <p class="text-gray-500 text-xs">
                        <i class="fas fa-calendar mr-1"></i>
                        {if isset($LANG) && isset($LANG.orderregistered)}{$LANG.orderregistered}{else}Registered{/if}: {$product.regdate}
                    </p>
                {/if}
                
                {if $product.nextduedate}
                    <p class="text-gray-500 text-xs">
                        <i class="fas fa-clock mr-1"></i>
                        {if isset($LANG) && isset($LANG.clientareaproductnextduedate)}{$LANG.clientareaproductnextduedate}{else}Next Due Date{/if}: {$product.nextduedate}
                    </p>
                {/if}
            </div>
            
            {* Actions *}
            <div class="flex flex-col space-y-2 ml-4">
                {if $product.id}
                    <a href="clientareaproductdetails.php?id={$product.id}" 
                       class="px-3 py-1 text-xs font-medium bg-neon-green/20 text-neon-green border border-neon-green/30 rounded hover:bg-neon-green/30 transition-colors duration-200">
                        <i class="fas fa-cog mr-1"></i>
                        {if isset($LANG) && isset($LANG.manage)}{$LANG.manage}{else}Manage{/if}
                    </a>
                {/if}
                
                {if $product.amount && $product.status != 'Cancelled'}
                    <div class="text-right">
                        <span class="text-sm font-medium text-white">
                            {$product.amount}
                        </span>
                        {if $product.billingcycle}
                            <span class="text-xs text-gray-400 block">
                                {$product.billingcycle}
                            </span>
                        {/if}
                    </div>
                {/if}
            </div>
        </div>
        
        {* Additional Info Bar *}
        {if $product.overagesbilling || $product.suspendreason}
            <div class="mt-3 pt-3 border-t border-gray-700">
                {if $product.overagesbilling}
                    <div class="text-xs text-yellow-400">
                        <i class="fas fa-exclamation-triangle mr-1"></i>
                        {if isset($LANG) && isset($LANG.overagesbilling)}{$LANG.overagesbilling}{else}Overages Billing{/if}: {$product.overagesbilling}
                    </div>
                {/if}
                {if $product.suspendreason}
                    <div class="text-xs text-red-400 mt-1">
                        <i class="fas fa-ban mr-1"></i>
                        {if isset($LANG) && isset($LANG.suspendreason)}{$LANG.suspendreason}{else}Suspend Reason{/if}: {$product.suspendreason}
                    </div>
                {/if}
            </div>
        {/if}
    </div>
{/if}