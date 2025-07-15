{include file="$template/header.tpl"}

<div class="min-h-screen bg-dark-bg py-20 px-4 sm:px-6 lg:px-8">
    <div class="max-w-6xl mx-auto">
        <!-- Header -->
        <div class="text-center mb-12">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                </svg>
            </div>
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                Manage OX App Suite
            </h1>
            <p class="text-lg text-text-light max-w-2xl mx-auto">
                Configure and manage your OX App Suite settings, users, and features.
            </p>
        </div>

        <!-- Management Features -->
        <div class="grid md:grid-cols-2 gap-8 mb-12">
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <h3 class="text-xl font-semibold text-white mb-4">User Management</h3>
                <ul class="text-text-light space-y-2">
                    <li>• Add/Remove Users</li>
                    <li>• Set User Permissions</li>
                    <li>• Manage Storage Quotas</li>
                    <li>• Configure Access Rights</li>
                </ul>
            </div>
            
            <div class="bg-dark-surface rounded-lg border border-gray-700 p-6">
                <h3 class="text-xl font-semibold text-white mb-4">Domain Settings</h3>
                <ul class="text-text-light space-y-2">
                    <li>• Configure Email Domains</li>
                    <li>• Set Up DNS Records</li>
                    <li>• Manage SSL Certificates</li>
                    <li>• Configure Security Policies</li>
                </ul>
            </div>
        </div>

        <!-- CTA -->
        <div class="text-center">
            <a href="{$WEB_ROOT}/clientarea.php" class="btn-primary">
                Access Management Panel
            </a>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}