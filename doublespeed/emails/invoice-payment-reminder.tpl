{include file="$template/emails/template.tpl" email_content="
<h2 style='color: #ffffff; margin-bottom: 20px;'>Invoice #{$invoice_number} - Payment Reminder</h2>

<p>Dear {$client_firstname} {$client_lastname},</p>

<p>This is a friendly reminder that invoice <span class='highlight'>#{$invoice_number}</span> is due for payment.</p>

<div class='info-box'>
    <h3 style='color: #00ff88; margin-top: 0;'>Invoice Details</h3>
    <p><strong>Invoice Number:</strong> #{$invoice_number}</p>
    <p><strong>Due Date:</strong> {$due_date}</p>
    <p><strong>Amount Due:</strong> <span class='highlight'>{$amount_due}</span></p>
    <p><strong>Status:</strong> {$invoice_status}</p>
</div>

<h3 style='color: #ffffff;'>Services on this Invoice</h3>
<div class='info-box'>
    {foreach from=$invoice_items item=item}
    <p><strong>{$item.description}</strong><br>
    Amount: {$item.amount} | Period: {$item.period}</p>
    {/foreach}
</div>

<p>To avoid any service interruption, please pay your invoice by the due date:</p>

<p style='text-align: center;'>
    <a href='{$invoice_url}' class='button'>Pay Invoice Now</a>
</p>

<p style='text-align: center;'>
    <a href='{$client_area_url}' class='secondary-button'>View in Client Area</a>
</p>

<h3 style='color: #ffffff;'>Payment Methods</h3>
<p>We accept the following payment methods:</p>
<ul>
    <li>Credit/Debit Cards (Visa, MasterCard, American Express)</li>
    <li>PayPal</li>
    <li>Bank Transfer</li>
    <li>Cryptocurrency (Bitcoin, Ethereum)</li>
</ul>

<h3 style='color: #ffffff;'>Questions?</h3>
<p>If you have any questions about this invoice or need assistance with payment, please don't hesitate to contact our billing department:</p>
<ul>
    <li><strong>Email:</strong> <a href='mailto:{$billing_email}' style='color: #007bff;'>{$billing_email}</a></li>
    <li><strong>Support Portal:</strong> <a href='{$support_url}' style='color: #007bff;'>{$support_url}</a></li>
</ul>

<p>Thank you for your business!</p>

<p>Best regards,<br>
<strong>The {$company_name} Billing Team</strong></p>
"}