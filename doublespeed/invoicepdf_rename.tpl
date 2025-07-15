<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Invoice #{$invoicenum} - {$companyname}</title>
    <style>
        body { font-family: Arial, sans-serif; color: #333; margin: 0; padding: 20px; }
        .header { text-align: center; margin-bottom: 30px; border-bottom: 2px solid #333; padding-bottom: 20px; }
        .company-info { text-align: center; margin-bottom: 20px; }
        .invoice-details { margin-bottom: 20px; }
        .client-info { margin-bottom: 20px; }
        .table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
        .table th, .table td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        .table th { background-color: #f5f5f5; font-weight: bold; }
        .total-section { text-align: right; margin-top: 20px; }
        .total { font-size: 18px; font-weight: bold; }
        .footer { margin-top: 40px; text-align: center; font-size: 12px; color: #666; }
    </style>
</head>
<body>
    <div class="header">
        <h1>{$companyname}</h1>
        <h2>INVOICE #{$invoicenum}</h2>
    </div>
    
    <div class="company-info">
        <p>{$companyaddress}</p>
        <p>Email: {$companyemail} | Phone: {$companyphone}</p>
    </div>
    
    <div class="invoice-details">
        <p><strong>Invoice Date:</strong> {$date}</p>
        <p><strong>Due Date:</strong> {$duedate}</p>
        <p><strong>Status:</strong> {$status}</p>
    </div>
    
    <div class="client-info">
        <h3>Bill To:</h3>
        <p>{$clientname}</p>
        <p>{$clientaddress}</p>
        <p>{$clientemail}</p>
    </div>
    
    {if $invoiceitems}
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
                {foreach $invoiceitems as $item}
                    <tr>
                        <td>{$item.description}</td>
                        <td>{$item.qty|default:1}</td>
                        <td>${$item.unitprice|default:$item.amount}</td>
                        <td>${$item.amount}</td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    {/if}
    
    <div class="total-section">
        {if $subtotal}<p>Subtotal: ${$subtotal}</p>{/if}
        {if $tax}<p>Tax: ${$tax}</p>{/if}
        <p class="total">Total: ${$total}</p>
    </div>
    
    <div class="footer">
        <p>Thank you for your business!</p>
        <p>Payment terms: Net 30 days</p>
    </div>
</body>
</html>
