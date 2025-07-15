<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Quote #{$quotenum}</title>
    <style>
        body { font-family: Arial, sans-serif; color: #333; margin: 0; padding: 20px; }
        .header { text-align: center; margin-bottom: 30px; border-bottom: 2px solid #333; padding-bottom: 20px; }
        .quote-details { margin-bottom: 20px; }
        .table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
        .table th, .table td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        .table th { background-color: #f5f5f5; font-weight: bold; }
        .total { text-align: right; margin-top: 20px; font-size: 18px; font-weight: bold; }
        .footer { margin-top: 40px; text-align: center; font-size: 12px; color: #666; }
    </style>
</head>
<body>
    <div class="header">
        <h1>{$companyname}</h1>
        <h2>QUOTE #{$quotenum}</h2>
    </div>
    
    <div class="quote-details">
        <p><strong>Quote Date:</strong> {$date}</p>
        <p><strong>Valid Until:</strong> {$validuntil}</p>
        <p><strong>Client:</strong> {$clientname}</p>
        <p><strong>Subject:</strong> {$subject}</p>
    </div>
    
    {if $quoteitems}
        <table class="table">
            <thead>
                <tr>
                    <th>Description</th>
                    <th>Quantity</th>
                    <th>Unit Price</th>
                    <th>Amount</th>
                </tr>
            </thead>
            <tbody>
                {foreach $quoteitems as $item}
                    <tr>
                        <td>{$item.description}</td>
                        <td>{$item.qty}</td>
                        <td>${$item.unitprice}</td>
                        <td>${$item.amount}</td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    {/if}
    
    <div class="total">
        Total: ${$total}
    </div>
    
    <div class="footer">
        <p>This quote is valid until {$validuntil}</p>
        <p>Thank you for considering our services!</p>
    </div>
</body>
</html>
