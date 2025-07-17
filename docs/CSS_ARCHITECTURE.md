# DoubleSpeed Host - Modular CSS Architecture

This document explains the new modular CSS structure for the DoubleSpeed Host WHMCS template, designed for better maintainability, compatibility, and modern development practices.

## Architecture Overview

The CSS has been refactored into four distinct modules:

### 1. Core Theme Styles (`doublespeed.css`)
**Purpose**: WHMCS-compatible base styles and legacy support
**When to use**: Always include this file - it provides the foundation for all templates

```html
<link rel="stylesheet" href="css/doublespeed.css">
```

**Contains**:
- CSS variables for consistent theming
- Legacy WHMCS component styles (buttons, forms, cards)
- Base typography and layout utilities
- Modal and alert components
- Status indicators and navigation styles

### 2. Scoped Tailwind Utilities (`doublespeed-tailwind.css`)
**Purpose**: Modern utility classes scoped under `.ds-tailwind`
**When to use**: For new components and modern layouts

```html
<link rel="stylesheet" href="css/doublespeed-tailwind.css">
```

**Important**: All Tailwind utilities are scoped under the `.ds-tailwind` class to prevent conflicts with WHMCS styles.

### 3. Custom Tweaks (`doublespeed-custom.css`)
**Purpose**: Specific customizations and advanced UI enhancements
**When to use**: For unique features and specialized components

```html
<link rel="stylesheet" href="css/doublespeed-custom.css">
```

**Contains**:
- Enhanced animations and hover effects
- Custom form elements (checkboxes, switches, file uploads)
- Advanced tooltips and dropdown enhancements
- Accessibility improvements
- Custom scrollbar styling

### 4. Responsive Adjustments (`doublespeed-responsive.css`)
**Purpose**: Progressive enhancement for different screen sizes
**When to use**: Always include for responsive design

```html
<link rel="stylesheet" href="css/doublespeed-responsive.css">
```

**Contains**:
- Mobile-first responsive breakpoints
- Touch device optimizations
- Print styles
- High contrast and reduced motion support

## Loading Order

For optimal performance and compatibility, load the CSS files in this order:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Core styles first (required) -->
    <link rel="stylesheet" href="css/doublespeed.css">
    
    <!-- Tailwind utilities (optional, for modern components) -->
    <link rel="stylesheet" href="css/doublespeed-tailwind.css">
    
    <!-- Custom enhancements (optional) -->
    <link rel="stylesheet" href="css/doublespeed-custom.css">
    
    <!-- Responsive adjustments last (recommended) -->
    <link rel="stylesheet" href="css/doublespeed-responsive.css">
</head>
<body>
    <!-- Your WHMCS content -->
</body>
</html>
```

## Usage Examples

### Legacy WHMCS Components

Use the core CSS for traditional WHMCS elements:

```html
<!-- Traditional WHMCS button -->
<button class="btn-primary">Order Now</button>

<!-- Legacy card layout -->
<div class="card-dark">
    <h3>Hosting Plan</h3>
    <p>Our premium hosting solution</p>
    <button class="btn-secondary">Learn More</button>
</div>

<!-- Standard form elements -->
<form>
    <input type="text" class="input-dark" placeholder="Domain name">
    <select class="select-dark">
        <option>Choose plan</option>
    </select>
</form>
```

### Modern Tailwind Components

For new features, use the scoped Tailwind utilities:

```html
<!-- Modern component with scoped Tailwind -->
<div class="ds-tailwind">
    <div class="ds-grid ds-grid-cols-3 gap-6">
        <div class="ds-card">
            <h3 class="text-xl font-semibold text-neon-green mb-4">Basic Plan</h3>
            <p class="text-text-light mb-6">Perfect for small websites</p>
            <button class="ds-btn-primary w-full">Select Plan</button>
        </div>
        
        <div class="ds-card">
            <h3 class="text-xl font-semibold text-neon-green mb-4">Pro Plan</h3>
            <p class="text-text-light mb-6">For growing businesses</p>
            <button class="ds-btn-primary w-full">Select Plan</button>
        </div>
        
        <div class="ds-card">
            <h3 class="text-xl font-semibold text-neon-green mb-4">Enterprise</h3>
            <p class="text-text-light mb-6">High-performance solution</p>
            <button class="ds-btn-primary w-full">Select Plan</button>
        </div>
    </div>
</div>
```

### Hybrid Layouts

Combine both systems safely:

```html
<!-- WHMCS container with modern inner components -->
<div class="container">
    <div class="row">
        <div class="col-8">
            <!-- Legacy WHMCS content -->
            <div class="card-dark">
                <h2>Domain Registration</h2>
                <form>
                    <input type="text" class="input-dark" placeholder="Search domain">
                    <button class="btn-primary">Search</button>
                </form>
            </div>
        </div>
        
        <div class="col-4">
            <!-- Modern Tailwind sidebar -->
            <div class="ds-tailwind">
                <div class="ds-card">
                    <h3 class="ds-modal-title">Quick Stats</h3>
                    <div class="space-y-4">
                        <div class="ds-flex-between">
                            <span class="text-text-light">Active Domains</span>
                            <span class="ds-badge-success">142</span>
                        </div>
                        <div class="ds-flex-between">
                            <span class="text-text-light">Pending Orders</span>
                            <span class="ds-badge-warning">7</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
```

## Component Reference

### Tailwind Scoped Classes

All Tailwind utilities are prefixed with `ds-` and scoped under `.ds-tailwind`:

#### Buttons
- `.ds-btn` - Base button styling
- `.ds-btn-primary` - Primary action button
- `.ds-btn-secondary` - Secondary action button  
- `.ds-btn-outline` - Outline style button

#### Layout
- `.ds-grid` - Grid container
- `.ds-grid-cols-1` through `.ds-grid-cols-4` - Responsive grid columns
- `.ds-flex-center` - Centered flex container
- `.ds-flex-between` - Space-between flex container
- `.ds-flex-start` - Flex start alignment

#### Cards & Containers
- `.ds-card` - Modern card component
- `.ds-modal` - Modal container
- `.ds-modal-content` - Modal content area
- `.ds-modal-header` - Modal header section

#### Forms
- `.ds-input` - Modern input styling
- `.ds-select` - Modern select dropdown

#### Status & Feedback
- `.ds-badge-success` - Success badge
- `.ds-badge-warning` - Warning badge
- `.ds-badge-danger` - Error badge
- `.ds-badge-info` - Information badge
- `.ds-alert-success` - Success alert
- `.ds-alert-danger` - Error alert
- `.ds-alert-warning` - Warning alert
- `.ds-alert-info` - Information alert

#### Effects
- `.ds-hover-glow` - Glow effect on hover
- `.ds-hover-scale` - Scale effect on hover
- `.ds-hover-lift` - Lift effect on hover
- `.ds-fade-in` - Fade in animation
- `.ds-slide-up` - Slide up animation

### Legacy WHMCS Classes

Continue using these for existing templates:

#### Buttons
- `.btn-primary` - Primary button
- `.btn-secondary` - Secondary button
- `.btn-outline` - Outline button

#### Layout
- `.container` - Main container
- `.row` - Row layout
- `.col`, `.col-6`, `.col-4`, `.col-3` - Column layouts

#### Components
- `.card-dark` - Dark themed card
- `.input-dark` - Dark themed input
- `.select-dark` - Dark themed select
- `.modal` - Modal overlay
- `.alert` - Alert message

## Best Practices

### 1. Choose the Right System

**Use Legacy CSS when**:
- Working with existing WHMCS templates
- Maintaining backward compatibility
- Building standard WHMCS components

**Use Scoped Tailwind when**:
- Creating new components
- Building modern UI elements
- Need fine-grained control over styling

### 2. Scoping Guidelines

Always wrap Tailwind utilities in the `.ds-tailwind` class:

```html
<!-- ✅ Correct -->
<div class="ds-tailwind">
    <div class="bg-dark-surface p-6 rounded-lg">
        <h3 class="text-neon-green text-xl">Title</h3>
    </div>
</div>

<!-- ❌ Incorrect - may conflict with WHMCS -->
<div class="bg-dark-surface p-6 rounded-lg">
    <h3 class="text-neon-green text-xl">Title</h3>
</div>
```

### 3. Performance Optimization

- Only load CSS modules you actually use
- Core CSS is required for basic functionality
- Consider lazy-loading custom and Tailwind CSS for enhanced features

### 4. Customization

To customize the theme:

1. **Colors**: Modify CSS variables in `doublespeed.css`
2. **Components**: Edit the source files in the `src/` directory
3. **Build**: Run `npm run build` to regenerate CSS files

## Development Workflow

### Building CSS

```bash
# Build all CSS files
npm run build

# Build specific modules
npm run build-core        # Core theme styles
npm run build-tailwind    # Scoped Tailwind utilities
npm run build-custom      # Custom enhancements
npm run build-responsive  # Responsive adjustments
npm run build-legacy      # Legacy WHMCS compatibility

# Watch for changes (development)
npm run watch
```

### File Structure

```
doublespeed/
├── css/                          # Generated CSS files
│   ├── doublespeed.css          # Core theme (8.3KB)
│   ├── doublespeed-tailwind.css # Scoped Tailwind (81KB)
│   ├── doublespeed-custom.css   # Custom enhancements (10KB)
│   ├── doublespeed-responsive.css # Responsive (11KB)
│   └── style.css                # Legacy combined file
└── src/                         # Source CSS files
    ├── doublespeed-core.css     # Core theme source
    ├── doublespeed-tailwind.css # Tailwind utilities source
    ├── doublespeed-custom.css   # Custom source
    ├── doublespeed-responsive.css # Responsive source
    └── input.css                # Legacy source
```

## Browser Support

- **Modern browsers**: Full support with all modules
- **Older browsers**: Core CSS provides graceful degradation
- **IE11**: Limited support, use core CSS only

## Migration Guide

### From Existing Templates

1. Replace single `style.css` with modular approach
2. Wrap new components in `.ds-tailwind` scope
3. Keep existing WHMCS classes unchanged
4. Test thoroughly on different screen sizes

### Adding New Features

1. Use scoped Tailwind for new components
2. Extend custom CSS for unique requirements
3. Update responsive CSS for mobile optimization
4. Document any new patterns for team consistency

## Troubleshooting

### Common Issues

**Styles not applying**:
- Check CSS load order
- Ensure `.ds-tailwind` wrapper for Tailwind utilities
- Verify CSS files are properly built

**Conflicts between systems**:
- Use specificity to override when needed
- Prefer scoped approach over global changes
- Test in isolation before combining

**Performance issues**:
- Only load required CSS modules
- Consider conditional loading for advanced features
- Use browser caching for CSS files

For additional support, refer to the WHMCS documentation or contact the development team.