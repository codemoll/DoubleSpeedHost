{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">SSL Certificate Management</h1>
            
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
                {if $sslcertificates}
                    <div class="space-y-4">
                        {foreach $sslcertificates as $cert}
                            <div class="bg-dark-bg rounded-lg p-6 border border-gray-600">
                                <div class="flex justify-between items-start">
                                    <div>
                                        <h3 class="text-xl font-semibold text-white mb-2">{$cert.domain}</h3>
                                        <div class="space-y-1 text-sm text-text-light">
                                            <p><strong>Type:</strong> {$cert.type}</p>
                                            <p><strong>Issued:</strong> {$cert.issued}</p>
                                            <p><strong>Expires:</strong> {$cert.expires}</p>
                                            <p><strong>Status:</strong> 
                                                <span class="px-2 py-1 text-xs rounded {if $cert.status == 'active'}bg-green-900 text-green-200{elseif $cert.status == 'pending'}bg-yellow-900 text-yellow-200{else}bg-red-900 text-red-200{/if}">
                                                    {$cert.status|ucfirst}
                                                </span>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="space-y-2">
                                        <button class="btn-secondary btn-sm w-full">Download Certificate</button>
                                        <button class="btn-outline btn-sm w-full">Reissue</button>
                                        {if $cert.status == 'pending'}
                                            <button class="btn-primary btn-sm w-full">Complete Validation</button>
                                        {/if}
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                {else}
                    <div class="text-center py-12">
                        <svg class="w-16 h-16 text-gray-500 mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                        </svg>
                        <h3 class="text-xl font-semibold text-white mb-2">No SSL Certificates</h3>
                        <p class="text-text-light mb-6">You don't have any SSL certificates yet.</p>
                        <a href="{$WEB_ROOT}/cart.php?a=add&pid=ssl" class="btn-primary">
                            Order SSL Certificate
                        </a>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
