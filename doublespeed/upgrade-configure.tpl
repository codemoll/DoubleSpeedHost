{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Configure Upgrade</h1>
            
            {if $errormessage}
                <div class="bg-red-900 border border-red-700 rounded-lg p-4 mb-6">
                    <div class="flex">
                        <svg class="w-5 h-5 text-red-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                        </svg>
                        <div class="text-red-200 text-sm">
                            {$errormessage}
                        </div>
                    </div>
                </div>
            {/if}
            
            <form method="post" class="space-y-6">
                <div class="bg-blue-900 border border-blue-700 rounded-lg p-4">
                    <p class="text-blue-200 text-sm">
                        Configure the options for your service upgrade. Review the changes and associated costs below.
                    </p>
                </div>
                
                {if $upgradeoptions}
                    <div class="space-y-6">
                        {foreach $upgradeoptions as $option}
                            <div class="bg-dark-bg rounded-lg p-4 border border-gray-600">
                                <h3 class="text-lg font-semibold text-white mb-3">{$option.name}</h3>
                                <p class="text-text-light text-sm mb-4">{$option.description}</p>
                                
                                {if $option.type == 'dropdown'}
                                    <select name="upgrade[{$option.id}]" class="input-dark w-full">
                                        {foreach $option.options as $suboption}
                                            <option value="{$suboption.id}" data-price="{$suboption.price}">
                                                {$suboption.name} {if $suboption.price}(+${$suboption.price}){/if}
                                            </option>
                                        {/foreach}
                                    </select>
                                {elseif $option.type == 'radio'}
                                    <div class="space-y-2">
                                        {foreach $option.options as $suboption}
                                            <label class="flex items-center">
                                                <input type="radio" name="upgrade[{$option.id}]" value="{$suboption.id}" class="mr-3">
                                                <span class="text-white">{$suboption.name}</span>
                                                {if $suboption.price}
                                                    <span class="text-neon-green ml-2">(+${$suboption.price})</span>
                                                {/if}
                                            </label>
                                        {/foreach}
                                    </div>
                                {elseif $option.type == 'quantity'}
                                    <div class="flex items-center space-x-4">
                                        <label class="text-white">Quantity:</label>
                                        <input type="number" name="upgrade[{$option.id}]" value="1" min="1" class="input-dark w-20">
                                        {if $option.price}
                                            <span class="text-neon-green">${$option.price} each</span>
                                        {/if}
                                    </div>
                                {/if}
                            </div>
                        {/foreach}
                    </div>
                {/if}
                
                <div class="bg-dark-bg rounded-lg p-6 border border-gray-600">
                    <div class="flex justify-between items-center">
                        <span class="text-lg text-white">Upgrade Cost:</span>
                        <span class="text-2xl font-bold text-neon-green" id="upgradeTotal">${$total|default:"0.00"}</span>
                    </div>
                    <p class="text-text-light text-sm mt-2">
                        This amount will be prorated and added to your next invoice.
                    </p>
                </div>
                
                <div class="flex space-x-4">
                    <button type="button" onclick="history.back()" class="btn-outline flex-1">Cancel</button>
                    <button type="submit" class="btn-primary flex-1">Proceed with Upgrade</button>
                </div>
            </form>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
