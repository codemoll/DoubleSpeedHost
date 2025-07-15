{include file="$template/header.tpl"}

<div class="min-h-screen flex items-center justify-center bg-dark-bg py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full space-y-8">
        <div class="text-center">
            <div class="mx-auto w-20 h-20 bg-gradient-to-br from-red-500 to-red-700 rounded-full flex items-center justify-center mb-6">
                <svg class="w-10 h-10 text-white" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                </svg>
            </div>
            <h1 class="text-6xl font-orbitron font-bold text-white mb-4">
                403
            </h1>
            <h2 class="text-3xl font-orbitron font-bold text-white mb-4">
                Forbidden Access
            </h2>
            <p class="text-text-light mb-8">
                You don't have permission to access this resource. Please contact support if you believe this is an error.
            </p>
        </div>
        
        <div class="card-dark text-center">
            <h3 class="text-xl font-semibold text-white mb-4">Why am I seeing this?</h3>
            <div class="space-y-4 mb-6">
                <div class="flex items-center space-x-3">
                    <svg class="w-5 h-5 text-neon-green flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                    </svg>
                    <span class="text-text-light">You need special permissions to access this page</span>
                </div>
                <div class="flex items-center space-x-3">
                    <svg class="w-5 h-5 text-neon-green flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                    </svg>
                    <span class="text-text-light">Your account might not have the required access level</span>
                </div>
                <div class="flex items-center space-x-3">
                    <svg class="w-5 h-5 text-neon-green flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
                    </svg>
                    <span class="text-text-light">The content may be restricted to certain users</span>
                </div>
            </div>
            
            <div class="space-y-4">
                <a href="{$WEB_ROOT}/clientarea.php" class="btn-primary w-full block text-center">
                    <svg class="w-5 h-5 inline-block mr-2" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                    Login to Your Account
                </a>
                <a href="{$WEB_ROOT}/index.php" class="btn-outline w-full block text-center">
                    <svg class="w-5 h-5 inline-block mr-2" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"/>
                    </svg>
                    Return Home
                </a>
                <a href="{$WEB_ROOT}/submitticket.php" class="btn-secondary w-full block text-center">
                    <svg class="w-5 h-5 inline-block mr-2" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z"/>
                    </svg>
                    Contact Support
                </a>
            </div>
        </div>
        
        <div class="text-center">
            <button onclick="history.back()" class="text-neon-green hover:text-electric-blue transition-colors duration-300">
                <svg class="w-5 h-5 inline-block mr-1" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z" clip-rule="evenodd"/>
                </svg>
                Go Back
            </button>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}