{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Support Ticket - Step 2</h1>
            
            {if $errormessage}
                <div class="bg-red-900 border border-red-700 rounded-lg p-4 mb-6">
                    <div class="flex">
                        <svg class="w-5 h-5 text-red-400 mr-3 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                        </svg>
                        <div class="text-red-200 text-sm">
                            {$errormessage}
                        </div>
                    </div>
                </div>
            {/if}
            
            <form method="post" enctype="multipart/form-data" class="space-y-6">
                <div class="bg-blue-900 border border-blue-700 rounded-lg p-4">
                    <p class="text-blue-200 text-sm">
                        Please provide detailed information about your issue to help us assist you quickly.
                    </p>
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-text-light mb-2">Priority *</label>
                    <select name="priority" class="input-dark w-full" required>
                        <option value="">Select Priority...</option>
                        <option value="low">Low</option>
                        <option value="medium">Medium</option>
                        <option value="high">High</option>
                        <option value="urgent">Urgent</option>
                    </select>
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-text-light mb-2">Subject *</label>
                    <input type="text" name="subject" class="input-dark w-full" 
                           placeholder="Brief description of your issue" required>
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-text-light mb-2">Message *</label>
                    <textarea name="message" rows="8" class="input-dark w-full" 
                              placeholder="Please provide detailed information about your issue..." required></textarea>
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-text-light mb-2">Attachments</label>
                    <input type="file" name="attachments[]" multiple 
                           class="block w-full text-text-light border border-gray-600 rounded-lg bg-dark-surface file:mr-4 file:py-2 file:px-4 file:rounded-lg file:border-0 file:text-sm file:font-semibold file:bg-neon-green file:text-dark-bg hover:file:bg-electric-blue">
                    <p class="text-text-light text-xs mt-1">
                        You can attach screenshots or files to help explain your issue (max 5MB per file).
                    </p>
                </div>
                
                <div class="flex space-x-4">
                    <button type="button" onclick="history.back()" class="btn-outline flex-1">Back</button>
                    <button type="submit" class="btn-primary flex-1">Submit Ticket</button>
                </div>
            </form>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
