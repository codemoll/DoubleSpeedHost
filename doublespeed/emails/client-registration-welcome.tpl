{include file="$template/emails/template.tpl" email_content="
<h2 style='color: #ffffff; margin-bottom: 20px;'>Welcome to {$company_name}!</h2>

<p>Dear {$client_firstname} {$client_lastname},</p>

<p>Thank you for choosing <span class='highlight'>{$company_name}</span> for your hosting needs. Your account has been successfully created and activated.</p>

<div class='info-box'>
    <h3 style='color: #00ff88; margin-top: 0;'>Your Account Details</h3>
    <p><strong>Client ID:</strong> {$client_id}</p>
    <p><strong>Email:</strong> {$client_email}</p>
    <p><strong>Registration Date:</strong> {$registration_date}</p>
</div>

<p>You can now access your client area to manage your services, view invoices, and get support:</p>

<p style='text-align: center;'>
    <a href='{$client_area_url}' class='button'>Access Client Area</a>
</p>

<h3 style='color: #ffffff;'>Getting Started</h3>
<ul>
    <li>Log in to your client area using the link above</li>
    <li>Update your profile and contact information</li>
    <li>Browse our services and add new hosting packages</li>
    <li>Set up billing preferences and payment methods</li>
</ul>

<h3 style='color: #ffffff;'>Need Help?</h3>
<p>Our support team is available 24/7 to assist you:</p>
<ul>
    <li><strong>Support Portal:</strong> <a href='{$support_url}' style='color: #007bff;'>{$support_url}</a></li>
    <li><strong>Email:</strong> <a href='mailto:{$support_email}' style='color: #007bff;'>{$support_email}</a></li>
    {if $support_phone}
    <li><strong>Phone:</strong> {$support_phone}</li>
    {/if}
</ul>

<p>Welcome aboard, and thank you for choosing us for your hosting solutions!</p>

<p>Best regards,<br>
<strong>The {$company_name} Team</strong></p>
"}