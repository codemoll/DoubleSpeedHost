{* Service Status Badge Component *}
{if $status == 'Active'}
    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-900/50 text-green-300 border border-green-500">
        <i class="fas fa-check-circle mr-1"></i>
        Active
    </span>
{elseif $status == 'Suspended'}
    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-red-900/50 text-red-300 border border-red-500">
        <i class="fas fa-pause-circle mr-1"></i>
        Suspended
    </span>
{elseif $status == 'Pending'}
    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-yellow-900/50 text-yellow-300 border border-yellow-500">
        <i class="fas fa-clock mr-1"></i>
        Pending
    </span>
{elseif $status == 'Terminated'}
    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-gray-900/50 text-gray-300 border border-gray-500">
        <i class="fas fa-times-circle mr-1"></i>
        Terminated
    </span>
{elseif $status == 'Cancelled'}
    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-gray-900/50 text-gray-300 border border-gray-500">
        <i class="fas fa-ban mr-1"></i>
        Cancelled
    </span>
{else}
    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-gray-900/50 text-gray-300 border border-gray-500">
        <i class="fas fa-question-circle mr-1"></i>
        {$status|default:"Unknown"}
    </span>
{/if}