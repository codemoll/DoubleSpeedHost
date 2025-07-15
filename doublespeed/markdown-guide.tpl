{include file="$template/header.tpl"}

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <div class="bg-dark-surface rounded-lg shadow-xl border border-gray-700 p-6">
            <h1 class="text-3xl font-orbitron font-bold text-white mb-6">Markdown Guide</h1>
            
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
            
            <div class="space-y-8">
                <div class="bg-blue-900 border border-blue-700 rounded-lg p-4">
                    <p class="text-blue-200 text-sm">
                        Markdown is a lightweight markup language that allows you to format text using simple syntax.
                    </p>
                </div>
                
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
                    <div>
                        <h3 class="text-xl font-semibold text-white mb-4">Headers</h3>
                        <div class="bg-dark-bg rounded-lg p-4 border border-gray-600">
                            <code class="text-neon-green block mb-2"># H1 Header</code>
                            <code class="text-neon-green block mb-2">## H2 Header</code>
                            <code class="text-neon-green block">### H3 Header</code>
                        </div>
                    </div>
                    
                    <div>
                        <h3 class="text-xl font-semibold text-white mb-4">Text Formatting</h3>
                        <div class="bg-dark-bg rounded-lg p-4 border border-gray-600">
                            <code class="text-neon-green block mb-2">**Bold text**</code>
                            <code class="text-neon-green block mb-2">*Italic text*</code>
                            <code class="text-neon-green block">~~Strikethrough~~</code>
                        </div>
                    </div>
                    
                    <div>
                        <h3 class="text-xl font-semibold text-white mb-4">Lists</h3>
                        <div class="bg-dark-bg rounded-lg p-4 border border-gray-600">
                            <code class="text-neon-green block mb-2">- Unordered list item</code>
                            <code class="text-neon-green block mb-2">- Another item</code>
                            <code class="text-neon-green block mb-4">  - Nested item</code>
                            <code class="text-neon-green block mb-2">1. Ordered list item</code>
                            <code class="text-neon-green block">2. Second item</code>
                        </div>
                    </div>
                    
                    <div>
                        <h3 class="text-xl font-semibold text-white mb-4">Links and Images</h3>
                        <div class="bg-dark-bg rounded-lg p-4 border border-gray-600">
                            <code class="text-neon-green block mb-2">[Link text](https://example.com)</code>
                            <code class="text-neon-green block">![Alt text](image.png)</code>
                        </div>
                    </div>
                    
                    <div>
                        <h3 class="text-xl font-semibold text-white mb-4">Code</h3>
                        <div class="bg-dark-bg rounded-lg p-4 border border-gray-600">
                            <code class="text-neon-green block mb-2">`Inline code`</code>
                            <code class="text-neon-green block">```</code>
                            <code class="text-neon-green block">Code block</code>
                            <code class="text-neon-green block">```</code>
                        </div>
                    </div>
                    
                    <div>
                        <h3 class="text-xl font-semibold text-white mb-4">Tables</h3>
                        <div class="bg-dark-bg rounded-lg p-4 border border-gray-600">
                            <code class="text-neon-green block mb-1">| Header 1 | Header 2 |</code>
                            <code class="text-neon-green block mb-1">|----------|----------|</code>
                            <code class="text-neon-green block">| Cell 1   | Cell 2   |</code>
                        </div>
                    </div>
                </div>
                
                <div>
                    <h3 class="text-xl font-semibold text-white mb-4">Blockquotes</h3>
                    <div class="bg-dark-bg rounded-lg p-4 border border-gray-600">
                        <code class="text-neon-green block mb-2">> This is a blockquote</code>
                        <code class="text-neon-green block">> It can span multiple lines</code>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}
