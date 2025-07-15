{* Loading Spinner Component *}
<div class="flex items-center justify-center p-8 {$class|default:''}">
    <div class="relative">
        <div class="w-12 h-12 border-4 border-gray-600 border-t-neon-green rounded-full animate-spin"></div>
        <div class="absolute inset-0 w-12 h-12 border-4 border-transparent border-b-electric-blue rounded-full animate-spin" style="animation-direction: reverse; animation-duration: 1.5s;"></div>
    </div>
    {if $text}
        <span class="ml-3 text-gray-400">{$text}</span>
    {/if}
</div>