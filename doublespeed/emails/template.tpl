<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{$email_subject}</title>
    <style>
        body {
            background-color: #121212;
            color: #ffffff;
            font-family: 'Roboto', -apple-system, BlinkMacSystemFont, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #1a1a1a;
            border: 1px solid #333;
        }
        .header {
            background: linear-gradient(135deg, #1a1a1a 0%, #2d2d2d 100%);
            padding: 30px 20px;
            text-align: center;
            border-bottom: 2px solid #00ff88;
        }
        .logo {
            max-height: 60px;
            margin-bottom: 10px;
        }
        .content {
            padding: 30px 20px;
        }
        .footer {
            background-color: #0d0d0d;
            padding: 20px;
            text-align: center;
            color: #666;
            font-size: 14px;
            border-top: 1px solid #333;
        }
        .button {
            display: inline-block;
            background-color: #00ff88;
            color: #121212;
            text-decoration: none;
            padding: 12px 24px;
            border-radius: 6px;
            font-weight: bold;
            margin: 10px 0;
        }
        .button:hover {
            background-color: #00e67a;
        }
        .highlight {
            color: #00ff88;
            font-weight: bold;
        }
        .secondary-button {
            display: inline-block;
            background-color: transparent;
            color: #007bff;
            text-decoration: none;
            padding: 12px 24px;
            border: 2px solid #007bff;
            border-radius: 6px;
            font-weight: bold;
            margin: 10px 0;
        }
        .info-box {
            background-color: #2d2d2d;
            border: 1px solid #444;
            border-radius: 6px;
            padding: 20px;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            {if $company_logo}
                <img src="{$company_logo}" alt="{$company_name}" class="logo">
            {/if}
            <h1 style="color: #00ff88; margin: 0;">{$company_name}</h1>
        </div>
        
        <div class="content">
            {$email_content}
        </div>
        
        <div class="footer">
            <p>&copy; {$current_year} {$company_name}. All rights reserved.</p>
            {if $company_address}
                <p>{$company_address}</p>
            {/if}
            <p>
                This email was sent to {$client_email}. 
                <a href="{$unsubscribe_url}" style="color: #007bff;">Unsubscribe</a>
            </p>
        </div>
    </div>
</body>
</html>