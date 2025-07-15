{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Support Ticket - Custom Fields</h1>
            
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
            
            <div class="space-y-6">
                <div class="bg-blue-900 border border-blue-700 rounded-lg p-4">
                    <p class="text-blue-200 text-sm">
                        Please provide additional information to help us assist you better.
                    </p>
                </div>
                
                <form method="post" class="space-y-6">
                    {if $customfields}
                        {foreach $customfields as $field}
                            <div>
                                <label class="block text-sm font-medium text-text-light mb-2">
                                    {$field.name}
                                    {if $field.required}<span class="text-red-400">*</span>{/if}
                                </label>
                                
                                {if $field.type == 'text'}
                                    <input type="text" name="customfield[{$field.id}]" 
                                           class="input-dark w-full" 
                                           placeholder="{$field.description}"
                                           {if $field.required}required{/if}>
                                {elseif $field.type == 'textarea'}
                                    <textarea name="customfield[{$field.id}]" rows="4" 
                                              class="input-dark w-full" 
                                              placeholder="{$field.description}"
                                              {if $field.required}required{/if}></textarea>
                                {elseif $field.type == 'dropdown'}
                                    <select name="customfield[{$field.id}]" 
                                            class="input-dark w-full"
                                            {if $field.required}required{/if}>
                                        <option value="">Select an option...</option>
                                        {foreach $field.options as $option}
                                            <option value="{$option.value}">{$option.name}</option>
                                        {/foreach}
                                    </select>
                                {/if}
                                
                                {if $field.description}
                                    <p class="text-text-light text-xs mt-1">{$field.description}</p>
                                {/if}
                            </div>
                        {/foreach}
                    {/if}
                    
                    <div class="flex space-x-4">
                        <button type="button" onclick="history.back()" class="btn-outline flex-1">Back</button>
                        <button type="submit" class="btn-primary flex-1">Continue</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
