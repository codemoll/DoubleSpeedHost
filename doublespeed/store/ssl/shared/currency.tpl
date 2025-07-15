<!-- Currency Selector for SSL -->
<div class="ssl-currency-selector mb-6">
    <div class="text-center">
        <span class="text-white font-semibold mr-4">Currency:</span>
        <select id="ssl-currency" class="bg-dark-surface border border-gray-600 rounded px-3 py-2 text-white">
            <option value="USD" selected>USD ($)</option>
            <option value="EUR">EUR (€)</option>
            <option value="GBP">GBP (£)</option>
            <option value="CAD">CAD (C$)</option>
            <option value="AUD">AUD (A$)</option>
        </select>
    </div>
</div>

<script>
document.getElementById('ssl-currency').addEventListener('change', function() {
    const currency = this.value;
    // Update all price displays based on currency selection
    updateSSLPrices(currency);
});

function updateSSLPrices(currency) {
    // Exchange rates (in a real implementation, these would come from an API)
    const rates = {
        'USD': 1,
        'EUR': 0.85,
        'GBP': 0.73,
        'CAD': 1.25,
        'AUD': 1.35
    };
    
    const symbols = {
        'USD': '$',
        'EUR': '€',
        'GBP': '£',
        'CAD': 'C$',
        'AUD': 'A$'
    };
    
    const rate = rates[currency] || 1;
    const symbol = symbols[currency] || '$';
    
    // Update price displays (this would be more sophisticated in a real implementation)
    document.querySelectorAll('.ssl-price').forEach(function(element) {
        const basePrice = parseFloat(element.dataset.basePrice || element.textContent.replace(/[^\d.]/g, ''));
        const convertedPrice = (basePrice * rate).toFixed(2);
        element.textContent = symbol + convertedPrice;
    });
}