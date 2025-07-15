{include file="$template/header.tpl"}

<div class="min-h-screen flex items-center justify-center bg-dark-bg py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full space-y-8">
        <div class="text-center">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-neon-green to-electric-blue rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-dark-bg" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                </svg>
            </div>
            <h2 class="text-3xl font-orbitron font-bold text-white">
                3D Secure Authentication
            </h2>
            <p class="mt-2 text-sm text-text-light">
                Please complete the additional security verification for your payment.
            </p>
        </div>
        
        <div class="card-dark">
            <div class="text-center mb-6">
                <div class="inline-flex items-center justify-center w-16 h-16 bg-blue-900 rounded-full mb-4">
                    <svg class="w-8 h-8 text-blue-400" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M2.166 4.999A11.954 11.954 0 0010 1.944 11.954 11.954 0 0017.834 5c.11.65.166 1.32.166 2.001 0 5.225-3.34 9.67-8 11.317C5.34 16.67 2 12.225 2 7c0-.682.057-1.35.166-2.001zm11.541 3.708a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <p class="text-text-light">
                    Your bank requires additional verification to complete this payment. This helps protect you from unauthorized transactions.
                </p>
            </div>
            
            {if $3dsecurehtml}
                <div class="bg-dark-surface border border-gray-600 rounded-lg p-4">
                    {$3dsecurehtml}
                </div>
            {/if}
            
            <div class="mt-6 text-center">
                <p class="text-xs text-text-light">
                    This verification is handled securely by your bank. We do not store any additional payment information.
                </p>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}