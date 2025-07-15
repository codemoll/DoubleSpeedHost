{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-4xl font-orbitron font-bold text-white mb-4">
                <span class="glow-text">Announcements</span>
            </h1>
            <p class="text-text-light">
                Stay updated with the latest news, service updates, and important information from our team.
            </p>
        </div>
        
        {if $announcements}
            <!-- Announcements List -->
            <div class="space-y-6">
                {foreach from=$announcements item=announcement}
                    <div class="card-dark">
                        <div class="flex items-start justify-between mb-4">
                            <div class="flex-1">
                                <h2 class="text-2xl font-semibold text-white mb-2">
                                    <a href="{$WEB_ROOT}/announcements.php?id={$announcement.id}" 
                                       class="hover:text-neon-green transition-colors duration-300">
                                        {$announcement.title}
                                    </a>
                                </h2>
                                <div class="flex items-center space-x-4 text-sm text-text-light mb-4">
                                    <div class="flex items-center space-x-2">
                                        <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"/>
                                        </svg>
                                        <span>{$announcement.date}</span>
                                    </div>
                                    <div class="flex items-center space-x-2">
                                        <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                                            <path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                        </svg>
                                        <span>Published</span>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Announcement Type Badge -->
                            <div>
                                {if $announcement.type == 'maintenance'}
                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-orange-900 text-orange-200">
                                        <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
                                        </svg>
                                        Maintenance
                                    </span>
                                {elseif $announcement.type == 'update'}
                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-blue-900 text-blue-200">
                                        <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M4 2a1 1 0 011 1v2.101a7.002 7.002 0 0111.601 2.566 1 1 0 11-1.885.666A5.002 5.002 0 005.999 7H9a1 1 0 010 2H4a1 1 0 01-1-1V3a1 1 0 011-1zm.008 9.057a1 1 0 011.276.61A5.002 5.002 0 0014.001 13H11a1 1 0 110-2h5a1 1 0 011 1v5a1 1 0 11-2 0v-2.101a7.002 7.002 0 01-11.601-2.566 1 1 0 01.61-1.276z" clip-rule="evenodd"/>
                                        </svg>
                                        Update
                                    </span>
                                {elseif $announcement.type == 'security'}
                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-red-900 text-red-200">
                                        <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                                        </svg>
                                        Security
                                    </span>
                                {elseif $announcement.type == 'feature'}
                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-green-900 text-green-200">
                                        <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M11.3 1.046A1 1 0 0112 2v5h4a1 1 0 01.82 1.573l-7 10A1 1 0 018 18v-5H4a1 1 0 01-.82-1.573l7-10a1 1 0 011.12-.38z" clip-rule="evenodd"/>
                                        </svg>
                                        New Feature
                                    </span>
                                {else}
                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-gray-900 text-gray-200">
                                        <svg class="w-4 h-4 mr-1.5" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                                        </svg>
                                        General
                                    </span>
                                {/if}
                            </div>
                        </div>
                        
                        <!-- Announcement Content -->
                        <div class="prose prose-invert max-w-none">
                            {if $announcement.summary}
                                <p class="text-text-light leading-relaxed">
                                    {$announcement.summary}
                                </p>
                                <div class="mt-4">
                                    <a href="{$WEB_ROOT}/announcements.php?id={$announcement.id}" 
                                       class="btn-outline text-sm px-4 py-2">
                                        Read Full Announcement
                                    </a>
                                </div>
                            {else}
                                <div class="text-text-light leading-relaxed">
                                    {$announcement.announcement|truncate:500:"..."}
                                </div>
                                {if $announcement.announcement|count_characters > 500}
                                    <div class="mt-4">
                                        <a href="{$WEB_ROOT}/announcements.php?id={$announcement.id}" 
                                           class="btn-outline text-sm px-4 py-2">
                                            Read More
                                        </a>
                                    </div>
                                {/if}
                            {/if}
                        </div>
                    </div>
                {/foreach}
            </div>
            
            <!-- Pagination -->
            {if $pagination}
                <div class="mt-8 flex items-center justify-center">
                    <div class="flex space-x-2">
                        {if $pagination.prev}
                            <a href="{$pagination.prev}" class="btn-outline text-sm px-3 py-2">
                                <svg class="w-4 h-4 inline mr-1" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd"/>
                                </svg>
                                Previous
                            </a>
                        {/if}
                        
                        {foreach from=$pagination.pages item=page}
                            {if $page.current}
                                <span class="btn-primary text-sm px-3 py-2">{$page.num}</span>
                            {else}
                                <a href="{$page.url}" class="btn-outline text-sm px-3 py-2">{$page.num}</a>
                            {/if}
                        {/foreach}
                        
                        {if $pagination.next}
                            <a href="{$pagination.next}" class="btn-outline text-sm px-3 py-2">
                                Next
                                <svg class="w-4 h-4 inline ml-1" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"/>
                                </svg>
                            </a>
                        {/if}
                    </div>
                </div>
            {/if}
        {else}
            <!-- No Announcements -->
            <div class="card-dark text-center py-12">
                <div class="mx-auto w-20 h-20 bg-gradient-to-br from-gray-600 to-gray-700 rounded-full flex items-center justify-center mb-6">
                    <svg class="w-10 h-10 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M18 13V5a2 2 0 00-2-2H4a2 2 0 00-2 2v8a2 2 0 002 2h3l3 3 3-3h3a2 2 0 002-2zM5 7a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zm1 3a1 1 0 100 2h3a1 1 0 100-2H6z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-white mb-2">No Announcements</h3>
                <p class="text-text-light mb-6">
                    There are no announcements at this time. Check back later for updates and news.
                </p>
                <div class="flex flex-col sm:flex-row gap-4 justify-center">
                    <a href="{$WEB_ROOT}/index.php" class="btn-primary">
                        Return to Homepage
                    </a>
                    <a href="{$WEB_ROOT}/knowledgebase.php" class="btn-outline">
                        Browse Knowledge Base
                    </a>
                </div>
            </div>
        {/if}
        
        <!-- Subscription -->
        <div class="mt-8 card-dark text-center">
            <h3 class="text-xl font-semibold text-white mb-4">Stay Updated</h3>
            <p class="text-text-light mb-6">
                Get notified about important announcements and service updates via email.
            </p>
            <div class="flex flex-col sm:flex-row gap-4 justify-center">
                <a href="{$WEB_ROOT}/clientarea.php?action=emails" class="btn-secondary">
                    Manage Email Preferences
                </a>
                <a href="{$WEB_ROOT}/serverstatus.php" class="btn-outline">
                    Check Server Status
                </a>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}