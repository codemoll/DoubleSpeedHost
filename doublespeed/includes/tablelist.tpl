{* Table List Component *}
{* Usage: {include file="$template/includes/tablelist.tpl" data=$tableData columns=$tableColumns} *}

{assign var="tableId" value=$id|default:"data-table"}
{assign var="tableClass" value=$class|default:""}
{assign var="showPagination" value=$showPagination|default:true}
{assign var="showSearch" value=$showSearch|default:true}
{assign var="showActions" value=$showActions|default:true}

<div class="table-list-component {$tableClass}">
    
    {* Table Header with Search and Actions *}
    {if $showSearch || $showActions || $title}
        <div class="bg-dark-surface border border-gray-700 rounded-t-lg px-6 py-4">
            <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between">
                <div class="flex-1">
                    {if $title}
                        <h3 class="text-lg font-semibold text-white">
                            {if $icon}<i class="{$icon} mr-2"></i>{/if}
                            {$title}
                        </h3>
                    {/if}
                    {if $description}
                        <p class="mt-1 text-sm text-gray-400">
                            {$description}
                        </p>
                    {/if}
                </div>
                
                <div class="mt-4 sm:mt-0 sm:ml-4 flex items-center space-x-3">
                    {if $showSearch}
                        <div class="relative">
                            <input type="text" 
                                   id="{$tableId}-search"
                                   placeholder="{$LANG.search|default:'Search...'}"
                                   class="w-64 px-4 py-2 pl-10 bg-dark-bg border border-gray-600 rounded-lg text-white placeholder-gray-400 focus:outline-none focus:border-neon-green focus:ring-1 focus:ring-neon-green transition-all duration-200">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center">
                                <i class="fas fa-search text-gray-400"></i>
                            </div>
                        </div>
                    {/if}
                    
                    {if $actions}
                        {$actions}
                    {/if}
                </div>
            </div>
        </div>
    {/if}
    
    {* Table *}
    <div class="overflow-hidden {if $showSearch || $showActions || $title}border-x border-gray-700{else}border border-gray-700 rounded-lg{/if}">
        <div class="overflow-x-auto">
            <table id="{$tableId}" class="min-w-full divide-y divide-gray-700">
                
                {* Table Head *}
                {if $columns}
                    <thead class="bg-gray-900/50">
                        <tr>
                            {foreach from=$columns item=column}
                                <th scope="col" 
                                    class="px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase tracking-wider {if $column.sortable}cursor-pointer hover:text-neon-green{/if}"
                                    {if $column.sortable}onclick="sortTable('{$tableId}', '{$column.key}')"{/if}>
                                    <div class="flex items-center">
                                        {$column.title}
                                        {if $column.sortable}
                                            <i class="fas fa-sort ml-1 text-xs opacity-50"></i>
                                        {/if}
                                    </div>
                                </th>
                            {/foreach}
                        </tr>
                    </thead>
                {/if}
                
                {* Table Body *}
                <tbody class="bg-dark-surface divide-y divide-gray-700">
                    {if $data}
                        {foreach from=$data item=row}
                            <tr class="hover:bg-gray-900/30 transition-colors duration-200">
                                {if $columns}
                                    {foreach from=$columns item=column}
                                        <td class="px-6 py-4 whitespace-nowrap {$column.class|default:'text-sm text-gray-300'}">
                                            {if $column.type == 'text'}
                                                {$row[$column.key]|default:'-'}
                                            {elseif $column.type == 'date'}
                                                {$row[$column.key]|date_format:"%Y-%m-%d"|default:'-'}
                                            {elseif $column.type == 'datetime'}
                                                {$row[$column.key]|date_format:"%Y-%m-%d %H:%M"|default:'-'}
                                            {elseif $column.type == 'status'}
                                                {if $row[$column.key]}
                                                    <span class="inline-flex px-2 py-1 text-xs font-medium rounded-full
                                                        {if $row[$column.key] == 'Active' || $row[$column.key] == 'active'}bg-green-900/50 text-green-400 border border-green-500
                                                        {elseif $row[$column.key] == 'Suspended' || $row[$column.key] == 'suspended'}bg-red-900/50 text-red-400 border border-red-500
                                                        {elseif $row[$column.key] == 'Pending' || $row[$column.key] == 'pending'}bg-yellow-900/50 text-yellow-400 border border-yellow-500
                                                        {else}bg-gray-900/50 text-gray-400 border border-gray-500{/if}">
                                                        {$row[$column.key]}
                                                    </span>
                                                {else}
                                                    <span class="text-gray-500">-</span>
                                                {/if}
                                            {elseif $column.type == 'currency'}
                                                <span class="font-medium text-white">
                                                    {$row[$column.key]|default:'$0.00'}
                                                </span>
                                            {elseif $column.type == 'actions'}
                                                <div class="flex items-center space-x-2">
                                                    {if $row.actions}
                                                        {$row.actions}
                                                    {else}
                                                        <button type="button" 
                                                                class="text-neon-green hover:text-neon-green/80 focus:outline-none"
                                                                title="{$LANG.view|default:'View'}">
                                                            <i class="fas fa-eye"></i>
                                                        </button>
                                                        <button type="button" 
                                                                class="text-electric-blue hover:text-electric-blue/80 focus:outline-none"
                                                                title="{$LANG.edit|default:'Edit'}">
                                                            <i class="fas fa-edit"></i>
                                                        </button>
                                                        <button type="button" 
                                                                class="text-red-400 hover:text-red-300 focus:outline-none"
                                                                title="{$LANG.delete|default:'Delete'}">
                                                            <i class="fas fa-trash"></i>
                                                        </button>
                                                    {/if}
                                                </div>
                                            {elseif $column.type == 'custom'}
                                                {$row[$column.key]|default:'-'}
                                            {else}
                                                {$row[$column.key]|default:'-'}
                                            {/if}
                                        </td>
                                    {/foreach}
                                {else}
                                    <td class="px-6 py-4 text-sm text-gray-300">
                                        {$row}
                                    </td>
                                {/if}
                            </tr>
                        {/foreach}
                    {else}
                        <tr>
                            <td colspan="{$columns|count|default:1}" class="px-6 py-12 text-center">
                                <div class="text-gray-400">
                                    <i class="fas fa-inbox text-3xl mb-3 opacity-50"></i>
                                    <p class="text-sm">
                                        {$emptyMessage|default:$LANG.nodata|default:"No data available."}
                                    </p>
                                </div>
                            </td>
                        </tr>
                    {/if}
                </tbody>
                
            </table>
        </div>
    </div>
    
    {* Pagination *}
    {if $showPagination && $pagination}
        <div class="bg-dark-surface border-x border-b border-gray-700 rounded-b-lg px-6 py-4">
            <div class="flex items-center justify-between">
                <div class="text-sm text-gray-400">
                    {$LANG.showing|default:"Showing"} 
                    <span class="font-medium text-white">{$pagination.start}</span>
                    {$LANG.to|default:"to"}
                    <span class="font-medium text-white">{$pagination.end}</span>
                    {$LANG.of|default:"of"}
                    <span class="font-medium text-white">{$pagination.total}</span>
                    {$LANG.results|default:"results"}
                </div>
                
                <div class="flex items-center space-x-2">
                    {if $pagination.prev}
                        <a href="{$pagination.prev}" 
                           class="px-3 py-1 text-sm bg-gray-700 text-gray-300 border border-gray-600 rounded hover:bg-gray-600 transition-colors duration-200">
                            {$LANG.previous|default:"Previous"}
                        </a>
                    {/if}
                    
                    {if $pagination.pages}
                        {foreach from=$pagination.pages item=page}
                            {if $page.current}
                                <span class="px-3 py-1 text-sm bg-neon-green text-black rounded font-medium">
                                    {$page.number}
                                </span>
                            {else}
                                <a href="{$page.url}" 
                                   class="px-3 py-1 text-sm bg-gray-700 text-gray-300 border border-gray-600 rounded hover:bg-gray-600 transition-colors duration-200">
                                    {$page.number}
                                </a>
                            {/if}
                        {/foreach}
                    {/if}
                    
                    {if $pagination.next}
                        <a href="{$pagination.next}" 
                           class="px-3 py-1 text-sm bg-gray-700 text-gray-300 border border-gray-600 rounded hover:bg-gray-600 transition-colors duration-200">
                            {$LANG.next|default:"Next"}
                        </a>
                    {/if}
                </div>
            </div>
        </div>
    {/if}
    
</div>

{* JavaScript for table functionality *}
<script>
function sortTable(tableId, column) {
    // Simple client-side sorting implementation
    const table = document.getElementById(tableId);
    const tbody = table.querySelector('tbody');
    const rows = Array.from(tbody.querySelectorAll('tr'));
    
    // Get column index
    const headers = table.querySelectorAll('th');
    let columnIndex = -1;
    headers.forEach((header, index) => {
        if (header.textContent.trim().toLowerCase().includes(column.toLowerCase())) {
            columnIndex = index;
        }
    });
    
    if (columnIndex === -1) return;
    
    // Sort rows
    rows.sort((a, b) => {
        const aText = a.cells[columnIndex].textContent.trim();
        const bText = b.cells[columnIndex].textContent.trim();
        return aText.localeCompare(bText);
    });
    
    // Re-append sorted rows
    rows.forEach(row => tbody.appendChild(row));
}

// Search functionality
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('{$tableId}-search');
    if (searchInput) {
        searchInput.addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            const table = document.getElementById('{$tableId}');
            const rows = table.querySelectorAll('tbody tr');
            
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                if (text.includes(searchTerm)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    }
});
</script>