# WHMCS Template JavaScript Features

This document describes the JavaScript features added to the DoubleSpeedHost WHMCS template to provide enhanced functionality and user experience.

## Added Files

### 1. `index.php`
Security file that prevents direct access to the js directory.

### 2. `scripts.min.js`
Core WHMCS functionality including:
- Utility functions (AJAX, form serialization, event handling)
- Form validation (email, password, required fields)
- Cart management (add/remove items)
- Modal functionality
- Domain checker integration

### 3. `twitter.js`
Twitter integration features:
- Tweet sharing functionality
- Follow button integration
- Timeline embedding
- Automatic button initialization from data attributes

### 4. `whmcs.js`
Advanced WHMCS template functionality:
- Client area enhancements (auto-refresh status, quick payments)
- Domain management (bulk checker, results display)
- Support ticket features (auto-save drafts, knowledge base search)
- Product configuration (dynamic pricing calculator)
- Utility functions (notifications, date formatting)

### 5. `theme.js` (existing)
Original theme-specific JavaScript for animations and visual effects.

## Usage Examples

### Modal Usage
```javascript
// Show a modal
WHMCS.modal.show('Modal content here', { title: 'Modal Title' });

// Hide a modal
WHMCS.modal.hide(modalElement);
```

### Twitter Integration
```html
<!-- Auto-initialized share button -->
<button data-twitter-share data-text="Check this out!" data-hashtags="hosting">Share</button>

<!-- Auto-initialized follow button -->
<button data-twitter-follow="your_username">Follow Us</button>

<!-- Timeline embedding -->
<div data-twitter-timeline="your_username" data-tweet-limit="5"></div>
```

### Domain Checking
```javascript
// Check single domain
WHMCS.domainChecker.check('example.com', ['com', 'net', 'org']);

// Bulk domain check
WHMCS.template.domains.bulkCheck(['example', 'test'], ['com', 'net']);
```

### Form Validation
```javascript
// Validate email
WHMCS.validation.email('user@example.com'); // returns true/false

// Validate password strength
WHMCS.validation.password('MyPassword123'); // returns true/false
```

### Notifications
```javascript
// Show notification
WHMCS.template.utils.notify('Success message!', 'success', 5000);
WHMCS.template.utils.notify('Error occurred!', 'error', 5000);
```

### Knowledge Base Search
```html
<!-- Auto-initialized search -->
<input type="text" data-kb-search data-kb-category="hosting" placeholder="Search...">
<div id="kb-search-results"></div>
```

### Dynamic Pricing
```javascript
// Calculate pricing based on configuration
WHMCS.template.products.calculatePrice(productId, {
    'configoption[1]': 'value1',
    'configoption[2]': 'value2'
});
```

## CSS Classes Added

The following CSS classes were added to support the new JavaScript functionality:

### Modal Classes
- `.whmcs-modal` - Modal container
- `.whmcs-modal-backdrop` - Modal backdrop
- `.whmcs-modal-content` - Modal content area
- `.whmcs-modal-header` - Modal header
- `.whmcs-modal-close` - Close button

### Domain Results
- `.domain-results` - Results container
- `.domain-result` - Individual result
- `.domain-result.available` - Available domain
- `.domain-result.unavailable` - Unavailable domain
- `.domain-name`, `.domain-status`, `.domain-price`, `.domain-action` - Result components

### Status Indicators
- `.whmcs-loading` - Loading state
- `.whmcs-error` - Error state
- `.whmcs-success` - Success state

### Notifications
- `.whmcs-notification` - Base notification
- `.notification-info`, `.notification-success`, `.notification-warning`, `.notification-error` - Notification types

### Twitter Components
- `.twitter-share-btn` - Twitter share button
- `.twitter-follow-btn` - Twitter follow button

## Auto-Initialization

Many features are automatically initialized when the DOM loads:

1. **Twitter buttons** - Elements with `data-twitter-share` or `data-twitter-follow` attributes
2. **Knowledge base search** - Forms with `data-kb-search` attribute
3. **Draft saving** - Forms with action containing "submitticket"
4. **Pricing calculators** - Forms with action containing "configureproduct"
5. **Form validation** - All forms with appropriate input types
6. **Confirmation dialogs** - Elements with `data-confirm` attribute

## Integration with Existing Template

The new JavaScript files are loaded in the following order in `footer.tpl`:

1. `scripts.min.js` - Core functionality
2. `whmcs.js` - Template-specific features
3. `twitter.js` - Twitter integration
4. `theme.js` - Visual effects and animations

This ensures proper dependency resolution and initialization order.

## Browser Compatibility

All JavaScript features are compatible with:
- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+

The code uses modern JavaScript features with fallbacks for older browsers where necessary.

## Customization

To customize or extend the functionality:

1. Edit the source files in `doublespeed/js/`
2. Modify CSS classes in `src/input.css`
3. Rebuild CSS with `npm run build`
4. Test changes with the provided test file

## Security

- All AJAX requests include CSRF protection headers
- Input validation is performed on both client and server side
- The `index.php` file prevents directory browsing
- No sensitive data is exposed in client-side code