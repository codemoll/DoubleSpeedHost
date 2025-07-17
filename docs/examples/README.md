# DoubleSpeed Host - CSS Examples

This directory contains practical examples demonstrating how to use the modular CSS architecture in real WHMCS templates.

## 📁 Example Files

### 1. Product Cards (`product-cards.html`)
**Demonstrates**: 
- Legacy WHMCS pricing cards
- Modern Tailwind scoped components
- Hybrid layouts combining both systems
- Responsive design patterns

**Key Features Shown**:
- Traditional WHMCS grid system
- Scoped Tailwind utilities (`.ds-tailwind`)
- Modern card animations and hover effects
- Account summary widgets
- Interactive buttons and badges

### 2. Checkout Widgets (`checkout-widgets.html`)
**Demonstrates**:
- Complex form layouts using legacy CSS
- Modern payment method selection
- Order summary with dynamic pricing
- Security and trust indicators
- Responsive checkout flow

**Key Features Shown**:
- Mixed legacy/modern form styling
- Scoped Tailwind for enhanced UI elements
- Interactive payment method switching
- Trust badges and security features
- Mobile-optimized checkout experience

### 3. Domain Search (`domain-search.html`)
**Demonstrates**:
- Domain search interface
- Results display with status indicators
- Category browsing
- Bulk domain search functionality
- Sidebar tools and pricing

**Key Features Shown**:
- Hero section with search form
- Domain availability results
- Category-based browsing
- Enhanced domain tools
- Interactive search functionality

## 🚀 How to Use These Examples

### Viewing the Examples

1. **Direct Browser**: Open any HTML file directly in your browser
2. **Local Server**: For best results, serve from a local web server:
   ```bash
   # Using Python 3
   python -m http.server 8000
   
   # Using Node.js (if you have http-server installed)
   npx http-server
   
   # Using PHP
   php -S localhost:8000
   ```
3. **Live Server**: Use VS Code's Live Server extension for automatic reloading

### CSS File Paths

The examples reference CSS files using relative paths:
```html
<link rel="stylesheet" href="../doublespeed/css/doublespeed.css">
<link rel="stylesheet" href="../doublespeed/css/doublespeed-tailwind.css">
<link rel="stylesheet" href="../doublespeed/css/doublespeed-custom.css">
<link rel="stylesheet" href="../doublespeed/css/doublespeed-responsive.css">
```

If you move these files, update the paths accordingly.

## 🎨 Implementation Patterns

### Pattern 1: Legacy-First Approach
Start with WHMCS legacy components and enhance specific areas:

```html
<!-- Legacy container -->
<div class="container">
    <div class="row">
        <div class="col-8">
            <!-- Legacy WHMCS content -->
            <div class="card-dark">
                <h2>Traditional Content</h2>
                <button class="btn-primary">Legacy Button</button>
            </div>
        </div>
        <div class="col-4">
            <!-- Modern Tailwind enhancement -->
            <div class="ds-tailwind">
                <div class="ds-card">
                    <h3 class="text-xl font-bold text-neon-green">Modern Widget</h3>
                    <button class="ds-btn-primary">Enhanced Button</button>
                </div>
            </div>
        </div>
    </div>
</div>
```

### Pattern 2: Modern-First Approach
Use scoped Tailwind for new components:

```html
<div class="ds-tailwind">
    <div class="ds-grid ds-grid-cols-3 gap-6">
        <div class="ds-card ds-hover-lift">
            <!-- Modern component content -->
            <h3 class="text-xl font-semibold text-neon-green">Modern Card</h3>
            <button class="ds-btn-primary w-full">Action</button>
        </div>
    </div>
</div>
```

### Pattern 3: Hybrid Enhancement
Combine both systems strategically:

```html
<!-- Legacy form structure -->
<form class="card-dark">
    <h2 class="text-white">Form Title</h2>
    
    <!-- Legacy form fields -->
    <input type="text" class="input-dark w-100" placeholder="Name">
    
    <!-- Modern enhanced results -->
    <div class="ds-tailwind mt-6">
        <div class="ds-alert-success">
            <strong>Success!</strong> Your form submission was processed.
        </div>
        
        <div class="space-y-4">
            <!-- Modern result items -->
        </div>
    </div>
</form>
```

## 🎯 Component Usage Guide

### Buttons

**Legacy Style**:
```html
<button class="btn-primary">Primary Action</button>
<button class="btn-secondary">Secondary Action</button>
<button class="btn-outline">Outline Style</button>
```

**Modern Style** (within `.ds-tailwind`):
```html
<div class="ds-tailwind">
    <button class="ds-btn-primary">Modern Primary</button>
    <button class="ds-btn-secondary">Modern Secondary</button>
    <button class="ds-btn-outline">Modern Outline</button>
</div>
```

### Cards and Containers

**Legacy Style**:
```html
<div class="card-dark">
    <h3>Card Title</h3>
    <p>Card content...</p>
</div>
```

**Modern Style**:
```html
<div class="ds-tailwind">
    <div class="ds-card ds-hover-lift">
        <h3 class="text-xl font-bold text-white">Modern Card</h3>
        <p class="text-text-light">Enhanced card with animations</p>
    </div>
</div>
```

### Status Indicators

**Legacy Style**:
```html
<div class="status status-active">Active</div>
<div class="alert alert-success">Success message</div>
```

**Modern Style**:
```html
<div class="ds-tailwind">
    <span class="ds-badge-success">Active</span>
    <div class="ds-alert-success">Modern success message</div>
</div>
```

## 📱 Responsive Considerations

All examples include responsive design patterns:

1. **Mobile-First**: Components adapt to smaller screens automatically
2. **Touch-Friendly**: Larger tap targets on mobile devices
3. **Flexible Layouts**: Grid systems that stack on mobile
4. **Optimized Typography**: Scalable text sizes across devices

### Mobile Testing

Test examples on different screen sizes:
- **Desktop**: 1920px+ (full feature set)
- **Tablet**: 768px - 1024px (adapted layouts)
- **Mobile**: 320px - 767px (stacked layouts)

## 🛠️ Customization Tips

### Color Themes
Modify CSS variables in the core file:
```css
:root {
  --ds-neon-green: #00FF88;
  --ds-electric-blue: #007BFF;
  --ds-cyber-purple: #9B59B6;
}
```

### Component Variations
Create your own component variants:
```html
<div class="ds-tailwind">
    <!-- Custom card with different accent color -->
    <div class="ds-card border-electric-blue bg-gradient-to-r from-electric-blue/10">
        <h3 class="text-electric-blue">Custom Themed Card</h3>
    </div>
</div>
```

### Animation Enhancements
Add custom animations using the provided classes:
```html
<div class="ds-tailwind">
    <div class="ds-card ds-hover-scale ds-fade-in">
        <!-- Animated card -->
    </div>
</div>
```

## 🐛 Troubleshooting

### Common Issues

1. **Styles not loading**: Check CSS file paths
2. **Tailwind not working**: Ensure `.ds-tailwind` wrapper
3. **Layout conflicts**: Verify proper nesting of legacy/modern components
4. **Mobile layout issues**: Test responsive breakpoints

### Debug Tips

1. Use browser dev tools to inspect CSS loading
2. Check for console errors
3. Validate HTML structure
4. Test with different screen sizes

## 📚 Further Reading

- [CSS Architecture Documentation](../CSS_ARCHITECTURE.md)
- [WHMCS Template Documentation](https://developers.whmcs.com/themes/)
- [Tailwind CSS Documentation](https://tailwindcss.com/docs)

## 🤝 Contributing

When creating new examples:

1. Follow the established patterns
2. Include both legacy and modern approaches
3. Add responsive considerations
4. Document key features used
5. Test across different devices

## 📞 Support

For questions about these examples or the CSS architecture:

1. Check the main documentation
2. Review existing examples for patterns
3. Test in a local environment first
4. Contact the development team for assistance