# DoubleSpeed Host WHMCS Template

A modern, dark-themed WHMCS template with cyberpunk aesthetics built exclusively with WHMCS Six theme compatible styles.

## ✨ Features

- **Dark Theme**: Sleek cyberpunk-inspired design with neon accents
- **WHMCS Six Compatible**: Built with Bootstrap-based classes and WHMCS conventions
- **Modular CSS**: Organized architecture for better maintainability
- **Responsive Design**: Mobile-first approach with touch optimizations
- **Performance Optimized**: Efficient loading and caching strategies
- **Full WHMCS Integration**: Complete compatibility with WHMCS core functionality

## 🎨 CSS Architecture

This template features a **WHMCS Six compatible CSS architecture** designed for maximum compatibility:

### WHMCS Six Compatible Modules

- **`doublespeed.css`** - Core theme styles with WHMCS legacy compatibility
- **`doublespeed-six.css`** - Bootstrap-based WHMCS Six compatible styles and components
- **`doublespeed-custom.css`** - Advanced UI enhancements and customizations  
- **`doublespeed-responsive.css`** - Progressive responsive design

### Benefits

✅ **WHMCS Compatible** - Full compatibility with WHMCS Six theme conventions  
✅ **Bootstrap Framework** - Uses standard Bootstrap classes and components  
✅ **Maintainable** - Clear separation of concerns  
✅ **Scalable** - Add new modules without conflicts  
✅ **Performance** - Load only what you need  
✅ **Future-Proof** - Compatible with WHMCS updates

## 📚 Documentation

### Quick Start
```html
<!-- CSS files loaded in header.tpl -->
<link rel="stylesheet" href="doublespeed/css/doublespeed.css">
<link rel="stylesheet" href="doublespeed/css/doublespeed-six.css">
<link rel="stylesheet" href="doublespeed/css/doublespeed-custom.css">
<link rel="stylesheet" href="doublespeed/css/doublespeed-responsive.css">
```

### Using WHMCS Six Components
```html
<!-- Standard WHMCS Six styling -->
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Hosting Plans</h3>
    </div>
    <div class="panel-body">
        <button class="btn btn-primary">Order Now</button>
    </div>
</div>
```

### Using Bootstrap Components
```html
<!-- Bootstrap grid and components -->
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="card ds-glow">
                <div class="card-header">Service Details</div>
                <div class="card-body">
                    <button class="btn btn-success btn-block">Activate</button>
                </div>
            </div>
        </div>
    </div>
</div>
```

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
npm run build-six         # WHMCS Six compatible styles
npm run build-custom      # Custom enhancements
npm run build-responsive  # Responsive adjustments
```

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

**WHMCS Six Approach** (recommended):
```css
.my-custom-panel {
  background: var(--ds-dark-surface);
  border: 1px solid var(--ds-gray-700);
  border-radius: 8px;
  padding: 20px;
}
```

**Using Bootstrap Classes**:
```html
<div class="card bg-dark border-secondary">
    <div class="card-body">
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

The template uses a streamlined build system for CSS generation:

```json
{
  "scripts": {
    "build": "npm run build-css",
    "build-core": "cat ./src/doublespeed-core.css > ./doublespeed/css/doublespeed.css",
    "build-six": "cat ./src/doublespeed-six.css > ./doublespeed/css/doublespeed-six.css",
    "build-custom": "cat ./src/doublespeed-custom.css > ./doublespeed/css/doublespeed-custom.css",
    "build-responsive": "cat ./src/doublespeed-responsive.css > ./doublespeed/css/doublespeed-responsive.css"
  }
}
```

## 🎯 WHMCS Compatibility

This template is designed to work seamlessly with:

- **WHMCS Six Theme**: Full compatibility with Six theme conventions
- **Bootstrap Framework**: Uses Bootstrap 5 classes and components
- **WHMCS JavaScript**: No conflicts with WHMCS core JavaScript
- **Order Forms**: Fully compatible with WHMCS order forms
- **Domain Search**: Complete domain checker integration
- **Shopping Cart**: Native WHMCS cart functionality
- **Client Area**: All client area pages styled consistently

## 🤝 Contributing

We welcome contributions! Please:

1. **Follow** the established CSS architecture
2. **Use** WHMCS Six and Bootstrap conventions
3. **Test** across different screen sizes
4. **Document** new components and patterns
5. **Maintain** backward compatibility with WHMCS

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

## 🆘 Support

- **Documentation**: Check the CSS files for inline documentation
- **WHMCS Compatibility**: Ensure you're using a supported WHMCS version
- **Issues**: Report bugs or request features via GitHub Issues
- **Bootstrap**: Reference Bootstrap 5 documentation for component usage

---

**Built with ❤️ for the WHMCS community - Now 100% WHMCS Six Compatible**