{* Alert/Notification Component *}
{* Usage: {include file="$template/includes/alert.tpl" type="success" message="Operation completed successfully"} *}

{if $message}
    <div class="alert {if $type == 'success'}alert-success{elseif $type == 'error'}alert-danger{elseif $type == 'warning'}alert-warning{else}alert-info{/if} {if $dismissible}alert-dismissible{/if}">
        <div class="d-flex align-items-start">
            <div class="me-3">
                {if $type == 'success'}
                    <i class="fas fa-check-circle text-success" style="font-size: 1.125rem;"></i>
                {elseif $type == 'error'}
                    <i class="fas fa-exclamation-triangle text-danger" style="font-size: 1.125rem;"></i>
                {elseif $type == 'warning'}
                    <i class="fas fa-exclamation-circle text-warning" style="font-size: 1.125rem;"></i>
                {else}
                    <i class="fas fa-info-circle text-info" style="font-size: 1.125rem;"></i>
                {/if}
            </div>
            <div class="flex-grow-1">
                {if $title}
                    <h5 class="alert-heading" style="margin-bottom: 5px; font-size: 0.875rem; font-weight: 500;">
                        {$title}
                    </h5>
                {/if}
                <div style="font-size: 0.875rem; {if $title}margin-top: 5px;{/if}">
                    {$message}
                </div>
            </div>
            {if $dismissible}
                <button type="button" class="btn-close" aria-label="Close" onclick="this.closest('.alert').remove()">
                    <span aria-hidden="true"><i class="fas fa-times"></i></span>
                </button>
            {/if}
        </div>
    </div>
{/if}