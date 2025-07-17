# DoubleSpeed Host WHMCS Template

A dark, tech-inspired WHMCS template designed for modern hosting providers. Features cutting-edge design with neon accents, smooth animations, and a fully responsive layout.

## 🎨 Design Features

### Theme Colors
- **Background**: Dark gray/black (#121212, #1A1A1A)
- **Accents**: Neon green (#00FF88), Electric blue (#007BFF), Cyberpunk purple (#9B59B6)
- **Text**: White (#FFFFFF) and Light gray (#BFBFBF)
- **Effects**: Glow effects for buttons, borders, and interactive elements

### Typography
- **Headings**: Orbitron (futuristic, tech-inspired)
- **Body**: Roboto (clean, readable sans-serif)

### Visual Effects
- Animated background particles
- Glow effects on hover
- Smooth transitions and animations
- Gradient backgrounds
- Tech-inspired borders and cards

## 📋 Features

### Homepage
- **Hero Section**: Dark gradient background with animated elements
- **Features Section**: Three-column layout with glowing icons
- **Pricing Table**: Three plans with hover effects and animations
- **Testimonials**: Customer reviews with star ratings
- **Statistics**: Animated counters for key metrics

### Client Area
- **Dashboard**: Card-based layout for services, invoices, and tickets
- **Quick Actions**: Easy access to common functions
- **Status Indicators**: Color-coded service status
- **Responsive Design**: Optimized for all screen sizes

### Support System
- **FAQ Section**: Expandable panels with smooth animations
- **Contact Form**: Styled form with validation
- **Multiple Contact Methods**: Phone, email, live chat options
- **Ticket System**: Integrated support ticket management

### Authentication
- **Login Form**: Dark-themed with glow effects
- **Registration**: Multi-step form with validation
- **Password Reset**: Integrated forgot password functionality
- **Social Login**: Support for third-party authentication

## 🛠️ Technical Specifications

### Built With
- **Tailwind CSS**: Utility-first CSS framework
- **Custom CSS**: Additional styling for glow effects and animations
- **Vanilla JavaScript**: Enhanced interactivity and animations
- **Smarty Templates**: WHMCS-compatible template files

### Browser Compatibility
- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+

### Performance
- Optimized CSS (minified)
- Efficient animations (GPU-accelerated)
- Responsive images
- Clean, semantic HTML

## 📦 Installation

### Requirements
- WHMCS 8.0 or higher
- PHP 7.4 or higher
- Modern web browser

### Steps

1. **Download and Extract**
   ```bash
   # Clone or download the template files
   git clone https://github.com/codemoll/DoubleSpeedHost.git
   ```

2. **Upload Template**
   ```bash
   # Upload the 'doublespeed' folder to your WHMCS templates directory
   /path/to/whmcs/templates/doublespeed/
   ```

3. **Install Dependencies (for development)**
   ```bash
   npm install
   npm run build
   ```

4. **Activate Template**
   - Login to WHMCS Admin Area
   - Go to Setup > General Settings > General > Template
   - Select "DoubleSpeed Host" from the dropdown
   - Save Changes

5. **Configure Template**
   - Navigate to Setup > General Settings > General > Template
   - Configure template options (colors, logo, text)
   - Save your settings

## 🎛️ Configuration Options

### Template Settings
- **Primary Color**: Choose between Neon Green, Electric Blue, or Cyber Purple
- **Logo URL**: Upload your company logo
- **Hero Title/Subtitle**: Customize homepage hero section text
- **Footer Text**: Customize footer copyright text
- **Contact Information**: Set support phone and email

### Customization Files
- `template.php`: Main configuration file
- `src/input.css`: Tailwind CSS source file
- `js/theme.js`: JavaScript for interactions
- `css/style.css`: Compiled CSS (generated)

## 🎨 Customization

### Changing Colors
Edit `tailwind.config.js` to modify the color scheme:

```javascript
theme: {
  extend: {
    colors: {
      'dark-bg': '#121212',        // Main background
      'neon-green': '#00FF88',     // Primary accent
      'electric-blue': '#007BFF',  // Secondary accent
      'cyber-purple': '#9B59B6',   // Tertiary accent
    }
  }
}
```

### Adding Custom Styles
Add custom CSS to `src/input.css`:

```css
@layer components {
  .my-custom-class {
    @apply bg-dark-surface border border-neon-green rounded-lg p-4;
  }
}
```

### Modifying Templates
Template files are located in `/doublespeed/`:
- `header.tpl` - Navigation and header
- `footer.tpl` - Footer and scripts
- `homepage.tpl` - Homepage content
- `clientareahome.tpl` - Client dashboard
- `login.tpl` - Login form
- `register.tpl` - Registration form
- `supporttickets.tpl` - Support page

## 🔧 Development

### Build Process
```bash
# Install dependencies
npm install

# Development (watch mode)
npm run build-css

# Production build
npm run build
```

### File Structure
```
doublespeed/
├── css/
│   └── style.css          # Compiled CSS
├── js/
│   └── theme.js           # JavaScript functionality
├── images/
│   ├── favicon.svg        # Site favicon
│   └── logo.svg           # Company logo
├── template.php           # WHMCS configuration
├── header.tpl             # Header template
├── footer.tpl             # Footer template
├── homepage.tpl           # Homepage template
├── clientareahome.tpl     # Client dashboard
├── login.tpl              # Login form
├── register.tpl           # Registration form
└── supporttickets.tpl     # Support page
```

## 🚀 Features in Detail

### Interactive Elements
- **Hover Effects**: Buttons and cards have glow effects on hover
- **Animations**: Smooth transitions and floating elements
- **Particle Background**: Animated particle system
- **Form Validation**: Real-time form validation with visual feedback

### Responsive Design
- **Mobile-First**: Optimized for mobile devices
- **Tablet Support**: Perfect layout for tablets
- **Desktop**: Full-featured desktop experience
- **Touch-Friendly**: Large touch targets for mobile users

### Accessibility
- **WCAG Compliant**: Follows web accessibility guidelines
- **Keyboard Navigation**: Full keyboard support
- **Screen Reader Friendly**: Proper ARIA labels and semantic HTML
- **High Contrast**: Dark theme with sufficient color contrast

## 🐛 Troubleshooting

### Common Issues

**Template not appearing in WHMCS**
- Ensure the template folder is in the correct location
- Check file permissions (755 for folders, 644 for files)
- Verify template.php exists and is properly formatted

**Styles not loading**
- Run `npm run build` to regenerate CSS
- Check that style.css exists in the css/ folder
- Clear browser cache and WHMCS template cache

**JavaScript not working**
- Ensure theme.js is included in footer.tpl
- Check browser console for JavaScript errors
- Verify browser compatibility

**Responsive issues**
- Check viewport meta tag in header.tpl
- Test with browser developer tools
- Verify Tailwind CSS responsive classes

## 📞 Support

### Getting Help
- **Documentation**: Check this README for configuration help
- **Issues**: Report bugs via GitHub Issues
- **Feature Requests**: Submit enhancement requests

### Contributing
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This template is released under the MIT License. See the LICENSE file for details.

## 🙏 Credits

- **Design**: Inspired by modern tech and cyberpunk aesthetics
- **Fonts**: Google Fonts (Orbitron, Roboto)
- **Framework**: Tailwind CSS for utility-first styling
- **Icons**: SVG icons for better performance and scalability

---

**DoubleSpeed Host Template** - Bringing the future of hosting to your WHMCS installation.
