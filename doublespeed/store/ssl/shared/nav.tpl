<!-- SSL Navigation -->
<div class="flex flex-wrap justify-center gap-4 mb-12">
    <a href="{$WEB_ROOT}/store/ssl" class="ssl-nav-item {if $filename == 'index'}active{/if}">
        All SSL Certificates
    </a>
    <a href="{$WEB_ROOT}/store/ssl/dv" class="ssl-nav-item {if $filename == 'dv'}active{/if}">
        Domain Validated
    </a>
    <a href="{$WEB_ROOT}/store/ssl/ov" class="ssl-nav-item {if $filename == 'ov'}active{/if}">
        Organization Validated
    </a>
    <a href="{$WEB_ROOT}/store/ssl/ev" class="ssl-nav-item {if $filename == 'ev'}active{/if}">
        Extended Validation
    </a>
    <a href="{$WEB_ROOT}/store/ssl/wildcard" class="ssl-nav-item {if $filename == 'wildcard'}active{/if}">
        Wildcard SSL
    </a>
</div>

<style>
.ssl-nav-item {
    @apply px-4 py-2 rounded-lg border border-gray-600 text-text-light hover:border-neon-green hover:text-white transition-colors;
}
.ssl-nav-item.active {
    @apply bg-neon-green text-dark-bg border-neon-green;
}
</style>