<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Invoice #{$invoicenum}</title>
    <style>
        body { font-family: Arial, sans-serif; color: #333; }
        .header { text-align: center; margin-bottom: 30px; }
        .invoice-details { margin-bottom: 20px; }
        .table { width: 100%; border-collapse: collapse; }
        .table th, .table td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        .table th { background-color: #f5f5f5; }
        .total { text-align: right; margin-top: 20px; font-size: 18px; font-weight: bold; }
    </style>
</head>
<body>
    <div class="header">
        <h1>INVOICE</h1>
        <h2>#{$invoicenum}</h2>
    </div>
    
    <div class="invoice-details">
        <p><strong>Date:</strong> {$date}</p>
        <p><strong>Due Date:</strong> {$duedate}</p>
        <p><strong>Client:</strong> {$clientname}</p>
    </div>
    
    {if $invoiceitems}
        <table class="table">
            <thead>
                <tr>
                    <th>Description</th>
                    <th>Amount</th>
                </tr>
            </thead>
            <tbody>
                {foreach $invoiceitems as $item}
                    <tr>
                        <td>{$item.description}</td>
                        <td>${$item.amount}</td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    {/if}
    
    <div class="total">
        Total: ${$total}
    </div>
</body>
</html>
