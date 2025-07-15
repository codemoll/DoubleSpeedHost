{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        
        <!-- Page Header -->
        <div class="mb-8">
            <div class="flex items-center space-x-3 mb-4">
                <a href="{$WEB_ROOT}/clientarea.php?action=invoices" 
                   class="text-neon-green hover:text-electric-blue transition-colors duration-300">
                    <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z" clip-rule="evenodd"/>
                    </svg>
                </a>
                <h1 class="text-4xl font-orbitron font-bold text-white">
                    <span class="glow-text">Invoice Details</span>
                </h1>
            </div>
            <p class="text-text-light">
                Invoice #{$invoicenum} - Generated on {$datecreated}
            </p>
        </div>
        
        <!-- Invoice Status Alert -->
        {if $status == 'Unpaid'}
            <div class="bg-orange-900 border border-orange-700 rounded-lg p-4 mb-8">
                <div class="flex">
                    <svg class="w-5 h-5 text-orange-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
                    </svg>
                    <div>
                        <div class="text-orange-200 text-sm font-medium">Payment Required</div>
                        <div class="text-orange-300 text-xs mt-1">
                            This invoice is due on {$duedate}. Please make payment to avoid service interruption.
                        </div>
                    </div>
                </div>
            </div>
        {elseif $status == 'Overdue'}
            <div class="bg-red-900 border border-red-700 rounded-lg p-4 mb-8">
                <div class="flex">
                    <svg class="w-5 h-5 text-red-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                    </svg>
                    <div>
                        <div class="text-red-200 text-sm font-medium">Payment Overdue</div>
                        <div class="text-red-300 text-xs mt-1">
                            This invoice was due on {$duedate}. Please make payment immediately to restore services.
                        </div>
                    </div>
                </div>
            </div>
        {elseif $status == 'Paid'}
            <div class="bg-green-900 border border-green-700 rounded-lg p-4 mb-8">
                <div class="flex">
                    <svg class="w-5 h-5 text-green-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                    </svg>
                    <div>
                        <div class="text-green-200 text-sm font-medium">Payment Received</div>
                        <div class="text-green-300 text-xs mt-1">
                            This invoice was paid on {$datepaid}. Thank you for your payment!
                        </div>
                    </div>
                </div>
            </div>
        {/if}
        
        <!-- Invoice Actions -->
        <div class="flex flex-wrap gap-4 mb-8">
            <a href="{$WEB_ROOT}/dl.php?type=i&id={$invoiceid}" 
               class="btn-outline">
                <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M3 17a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm3.293-7.707a1 1 0 011.414 0L9 10.586V3a1 1 0 112 0v7.586l1.293-1.293a1 1 0 111.414 1.414l-3 3a1 1 0 01-1.414 0l-3-3a1 1 0 010-1.414z" clip-rule="evenodd"/>
                </svg>
                Download PDF
            </a>
            
            <a href="#" onclick="window.print(); return false;" 
               class="btn-outline">
                <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M5 4v3H4a2 2 0 00-2 2v3a2 2 0 002 2h1v2a2 2 0 002 2h6a2 2 0 002-2v-2h1a2 2 0 002-2V9a2 2 0 00-2-2h-1V4a2 2 0 00-2-2H7a2 2 0 00-2 2zm8 0H7v3h6V4zM5 14H4v-2h1v2zm7 3H8v-2h4v2z" clip-rule="evenodd"/>
                </svg>
                Print Invoice
            </a>
            
            {if $status != 'Paid'}
                <a href="{$WEB_ROOT}/viewinvoice.php?id={$invoiceid}&paynow=true" 
                   class="btn-primary">
                    <svg class="w-5 h-5 inline mr-2" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M4 4a2 2 0 00-2 2v1h16V6a2 2 0 00-2-2H4z"/>
                        <path fill-rule="evenodd" d="M18 9H2v5a2 2 0 002 2h12a2 2 0 002-2V9zM4 13a1 1 0 011-1h1a1 1 0 110 2H5a1 1 0 01-1-1zm5-1a1 1 0 100 2h1a1 1 0 100-2H9z" clip-rule="evenodd"/>
                    </svg>
                    Pay Now
                </a>
            {/if}
        </div>
        
        <!-- Invoice Details -->
        <div class="card-dark print:shadow-none print:border-none">
            
            <!-- Invoice Header -->
            <div class="flex justify-between items-start mb-8 print:mb-6">
                <div>
                    {if isset($templatefile) && is_array($templatefile) && $templatefile.logourl}
                        <img src="{$templatefile.logourl}" alt="{$companyname}" class="h-12 w-auto mb-4">
                    {else}
                        <div class="flex items-center space-x-3 mb-4">
                            <div class="w-12 h-12 bg-gradient-to-br from-neon-green to-electric-blue rounded"></div>
                            <h2 class="text-2xl font-orbitron font-bold text-white">{$companyname}</h2>
                        </div>
                    {/if}
                    
                    <div class="text-text-light text-sm">
                        <div>{$companyaddress1}</div>
                        {if $companyaddress2}<div>{$companyaddress2}</div>{/if}
                        <div>{$companycity}, {$companystate} {$companypostcode}</div>
                        <div>{$companycountry}</div>
                    </div>
                </div>
                
                <div class="text-right">
                    <h2 class="text-3xl font-orbitron font-bold text-white mb-2">INVOICE</h2>
                    <div class="text-sm space-y-1">
                        <div class="flex justify-between">
                            <span class="text-text-light">Invoice #:</span>
                            <span class="text-white font-mono">#{$invoicenum}</span>
                        </div>
                        <div class="flex justify-between">
                            <span class="text-text-light">Date:</span>
                            <span class="text-white">{$datecreated}</span>
                        </div>
                        <div class="flex justify-between">
                            <span class="text-text-light">Due Date:</span>
                            <span class="text-{if $overdue}red-400{else}white{/if}">{$duedate}</span>
                        </div>
                        <div class="flex justify-between">
                            <span class="text-text-light">Status:</span>
                            <span class="text-{if $status == 'Paid'}green-400{elseif $status == 'Overdue'}red-400{else}orange-400{/if}">
                                {$status}
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Billing Information -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mb-8">
                <div>
                    <h3 class="text-lg font-semibold text-white mb-3">Bill To:</h3>
                    <div class="text-text-light text-sm space-y-1">
                        <div class="font-medium text-white">{$clientsdetails.firstname} {$clientsdetails.lastname}</div>
                        {if $clientsdetails.companyname}<div>{$clientsdetails.companyname}</div>{/if}
                        <div>{$clientsdetails.address1}</div>
                        {if $clientsdetails.address2}<div>{$clientsdetails.address2}</div>{/if}
                        <div>{$clientsdetails.city}, {$clientsdetails.state} {$clientsdetails.postcode}</div>
                        <div>{$clientsdetails.country}</div>
                        <div class="mt-2">{$clientsdetails.email}</div>
                    </div>
                </div>
                
                <div>
                    <h3 class="text-lg font-semibold text-white mb-3">Payment Method:</h3>
                    <div class="text-text-light text-sm">
                        {if $paymentmethod}
                            <div class="flex items-center space-x-2">
                                <svg class="w-4 h-4 text-neon-green" fill="currentColor" viewBox="0 0 20 20">
                                    <path d="M4 4a2 2 0 00-2 2v1h16V6a2 2 0 00-2-2H4z"/>
                                    <path fill-rule="evenodd" d="M18 9H2v5a2 2 0 002 2h12a2 2 0 002-2V9zM4 13a1 1 0 011-1h1a1 1 0 110 2H5a1 1 0 01-1-1zm5-1a1 1 0 100 2h1a1 1 0 100-2H9z" clip-rule="evenodd"/>
                                </svg>
                                <span>{$paymentmethod}</span>
                            </div>
                        {else}
                            <span>Not specified</span>
                        {/if}
                    </div>
                </div>
            </div>
            
            <!-- Invoice Items -->
            <div class="mb-8">
                <div class="overflow-x-auto">
                    <table class="w-full">
                        <thead>
                            <tr class="border-b border-gray-700">
                                <th class="text-left py-3 text-white font-medium">Description</th>
                                <th class="text-center py-3 text-white font-medium">Qty</th>
                                <th class="text-right py-3 text-white font-medium">Unit Price</th>
                                <th class="text-right py-3 text-white font-medium">Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$invoiceitems item=item}
                                <tr class="border-b border-gray-800">
                                    <td class="py-3">
                                        <div class="text-white">{$item.description}</div>
                                        {if $item.type}
                                            <div class="text-text-light text-xs mt-1">{$item.type}</div>
                                        {/if}
                                    </td>
                                    <td class="py-3 text-center text-text-light">{$item.qty}</td>
                                    <td class="py-3 text-right text-text-light">{$item.amount}</td>
                                    <td class="py-3 text-right text-white font-medium">{$item.total}</td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
            
            <!-- Invoice Totals -->
            <div class="flex justify-end">
                <div class="w-full max-w-sm">
                    <div class="space-y-2 text-sm">
                        <div class="flex justify-between">
                            <span class="text-text-light">Subtotal:</span>
                            <span class="text-white">{$subtotal}</span>
                        </div>
                        
                        {if $taxrate > 0}
                            <div class="flex justify-between">
                                <span class="text-text-light">Tax ({$taxrate}%):</span>
                                <span class="text-white">{$tax}</span>
                            </div>
                        {/if}
                        
                        {if $credit > 0}
                            <div class="flex justify-between">
                                <span class="text-text-light">Credit Applied:</span>
                                <span class="text-green-400">-{$credit}</span>
                            </div>
                        {/if}
                        
                        <div class="border-t border-gray-700 pt-2">
                            <div class="flex justify-between text-lg font-semibold">
                                <span class="text-white">Total:</span>
                                <span class="text-neon-green">{$total}</span>
                            </div>
                        </div>
                        
                        {if $amountpaid > 0}
                            <div class="flex justify-between">
                                <span class="text-text-light">Amount Paid:</span>
                                <span class="text-green-400">{$amountpaid}</span>
                            </div>
                        {/if}
                        
                        {if $balance > 0}
                            <div class="flex justify-between text-lg font-semibold">
                                <span class="text-white">Balance Due:</span>
                                <span class="text-orange-400">{$balance}</span>
                            </div>
                        {/if}
                    </div>
                </div>
            </div>
            
            <!-- Payment Instructions -->
            {if $status != 'Paid'}
                <div class="mt-8 pt-8 border-t border-gray-700">
                    <h3 class="text-lg font-semibold text-white mb-3">Payment Instructions</h3>
                    <div class="text-text-light text-sm">
                        <p class="mb-2">Please use one of the following methods to pay this invoice:</p>
                        <ul class="list-disc list-inside space-y-1">
                            <li>Online payment through our client portal</li>
                            <li>Credit card or PayPal payment</li>
                            <li>Bank transfer (contact support for details)</li>
                        </ul>
                        <p class="mt-4 text-xs">
                            <strong>Note:</strong> Services may be suspended if payment is not received by the due date.
                        </p>
                    </div>
                </div>
            {/if}
            
            <!-- Notes -->
            {if $notes}
                <div class="mt-8 pt-8 border-t border-gray-700">
                    <h3 class="text-lg font-semibold text-white mb-3">Notes</h3>
                    <div class="text-text-light text-sm">
                        {$notes}
                    </div>
                </div>
            {/if}
        </div>
        
        <!-- Related Transactions -->
        {if $transactions}
            <div class="card-dark mt-8">
                <h3 class="text-xl font-semibold text-white mb-6">Payment History</h3>
                <div class="overflow-x-auto">
                    <table class="w-full">
                        <thead>
                            <tr class="border-b border-gray-700">
                                <th class="text-left py-3 text-white font-medium">Date</th>
                                <th class="text-left py-3 text-white font-medium">Gateway</th>
                                <th class="text-left py-3 text-white font-medium">Transaction ID</th>
                                <th class="text-right py-3 text-white font-medium">Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$transactions item=transaction}
                                <tr class="border-b border-gray-800">
                                    <td class="py-3 text-text-light">{$transaction.date}</td>
                                    <td class="py-3 text-text-light">{$transaction.gateway}</td>
                                    <td class="py-3 text-text-light font-mono text-sm">{$transaction.transid}</td>
                                    <td class="py-3 text-right text-green-400">{$transaction.amountin}</td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
        {/if}
    </div>
</div>

<!-- Print Styles -->
<style media="print">
    body { background: white !important; }
    .card-dark { background: white !important; color: black !important; }
    .text-white { color: black !important; }
    .text-text-light { color: #666 !important; }
    .text-neon-green, .text-electric-blue, .text-cyber-purple { color: black !important; }
    .bg-gradient-to-br { background: #f0f0f0 !important; }
    .border-gray-700, .border-gray-800 { border-color: #ccc !important; }
    header, footer, .btn-primary, .btn-outline, .btn-secondary { display: none !important; }
</style>

{include file="$template/footer.tpl"}