# DoubleSpeed Host WHMCS Template

A modern, dark-themed WHMCS template with cyberpunk aesthetics and advanced CSS architecture.

## ✨ Features

- **Dark Theme**: Sleek cyberpunk-inspired design with neon accents
- **Modular CSS**: Organized architecture for better maintainability
- **Responsive Design**: Mobile-first approach with touch optimizations
- **Tailwind Integration**: Scoped utilities for modern component development
- **WHMCS Compatible**: Full compatibility with existing WHMCS systems
- **Performance Optimized**: Efficient loading and caching strategies

## 🎨 CSS Architecture

This template features a revolutionary **modular CSS architecture** that combines the best of both worlds:

### Legacy WHMCS Compatibility + Modern Development

- **`doublespeed.css`** - Core theme styles with WHMCS compatibility
- **`doublespeed-tailwind.css`** - Scoped Tailwind utilities under `.ds-tailwind`
- **`doublespeed-custom.css`** - Advanced UI enhancements and customizations  
- **`doublespeed-responsive.css`** - Progressive responsive design

### Benefits

✅ **Backward Compatible** - Existing WHMCS templates work unchanged  
✅ **Modern Development** - Use Tailwind utilities for new components  
✅ **Maintainable** - Clear separation of concerns  
✅ **Scalable** - Add new modules without conflicts  
✅ **Performance** - Load only what you need  

## 📚 Documentation

### Quick Start
```html
<!-- Basic setup - load in this order -->
<link rel="stylesheet" href="doublespeed/css/doublespeed.css">
<link rel="stylesheet" href="doublespeed/css/doublespeed-tailwind.css">
<link rel="stylesheet" href="doublespeed/css/doublespeed-custom.css">
<link rel="stylesheet" href="doublespeed/css/doublespeed-responsive.css">
```

### Using Legacy WHMCS Components
```html
<!-- Traditional WHMCS styling -->
<div class="card-dark">
    <h3>Hosting Plans</h3>
    <button class="btn-primary">Order Now</button>
</div>
```

### Using Modern Tailwind Components
```html
<!-- Scoped Tailwind utilities -->
<div class="ds-tailwind">
    <div class="ds-card ds-hover-lift">
        <h3 class="text-xl font-bold text-neon-green">Modern Card</h3>
        <button class="ds-btn-primary w-full">Get Started</button>
    </div>
</div>
```

### Complete Documentation

📖 **[CSS Architecture Guide](docs/CSS_ARCHITECTURE.md)** - Complete modular CSS documentation  
🎯 **[Live Examples](docs/examples/)** - Working examples with source code  
🔧 **[Development Guide](docs/examples/README.md)** - Implementation patterns and best practices  

## 🚀 Quick Start

### Installation

1. **Download** the template files
2. **Upload** to your WHMCS templates directory
3. **Activate** in WHMCS admin (System Settings > General > Template)
4. **Build** CSS files (optional, for customization)

### Development Setup

```bash
# Install dependencies
npm install

# Build all CSS modules
npm run build

# Watch for changes during development
npm run watch

# Build specific modules
npm run build-core        # Core WHMCS styles
npm run build-tailwind    # Scoped Tailwind utilities
npm run build-custom      # Custom enhancements
npm run build-responsive  # Responsive adjustments
```

## 🎯 Live Examples

Explore working examples that demonstrate the modular architecture:

### [Product Cards Example](docs/examples/product-cards.html)
- Legacy WHMCS pricing tables
- Modern Tailwind product grids  
- Hybrid layout combinations
- Interactive hover effects

### [Checkout Widgets Example](docs/examples/checkout-widgets.html)
- Multi-step checkout flow
- Payment method selection
- Order summary calculations
- Security indicators

### [Domain Search Example](docs/examples/domain-search.html)
- Domain availability checking
- Category-based browsing
- Bulk domain search
- Pricing tables

## 🛠️ Customization

### Modifying Colors
Edit CSS variables in `src/doublespeed-core.css`:
```css
:root {
  --ds-dark-bg: #121212;
  --ds-neon-green: #00FF88;
  --ds-electric-blue: #007BFF;
  --ds-cyber-purple: #9B59B6;
}
```

### Adding New Components

**Legacy Approach** (for WHMCS compatibility):
```css
.my-custom-component {
  background: var(--ds-dark-surface);
  border: 1px solid var(--ds-gray-700);
  border-radius: 8px;
  padding: 24px;
}
```

**Modern Approach** (scoped Tailwind):
```html
<div class="ds-tailwind">
    <div class="bg-dark-surface border border-gray-700 rounded-lg p-6">
        <!-- Custom content -->
    </div>
</div>
```

## 📱 Browser Support

- **Modern Browsers**: Full support with all modules
- **Legacy Browsers**: Graceful degradation with core CSS
- **Mobile Devices**: Optimized touch interfaces
- **Screen Readers**: Enhanced accessibility features

## 🔧 Build System

The template uses a sophisticated build system for CSS generation:

```json
{
  "scripts": {
    "build": "npm run build-css",
    "build-core": "cat ./src/doublespeed-core.css > ./doublespeed/css/doublespeed.css",
    "build-tailwind": "tailwindcss -i ./src/doublespeed-tailwind.css -o ./doublespeed/css/doublespeed-tailwind.css --minify",
    "build-custom": "cat ./src/doublespeed-custom.css > ./doublespeed/css/doublespeed-custom.css",
    "build-responsive": "cat ./src/doublespeed-responsive.css > ./doublespeed/css/doublespeed-responsive.css"
  }
}
```

## 🤝 Contributing

We welcome contributions! Please:

1. **Follow** the established CSS architecture
2. **Test** across different screen sizes
3. **Document** new components and patterns
4. **Maintain** backward compatibility with WHMCS

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

## 🆘 Support

- **Documentation**: Check the [CSS Architecture Guide](docs/CSS_ARCHITECTURE.md)
- **Examples**: Review [working examples](docs/examples/)
- **Issues**: Report bugs or request features via GitHub Issues
- **WHMCS**: Ensure you're using a supported WHMCS version

---

**Built with ❤️ for the WHMCS community**