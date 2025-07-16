# WHMCS Template Debug Guide

This guide provides comprehensive instructions for enabling and using debug mode in WHMCS templates to troubleshoot issues and verify variable contents.

## Table of Contents
1. [Enabling Debug Mode](#enabling-debug-mode)
2. [Debug Output Features](#debug-output-features)
3. [Template-Specific Debug Information](#template-specific-debug-information)
4. [Common Variables Reference](#common-variables-reference)
5. [Troubleshooting Common Issues](#troubleshooting-common-issues)
6. [Best Practices](#best-practices)

## Enabling Debug Mode

### Method 1: Template Configuration (Recommended)
Add this configuration to your WHMCS admin area:

1. Go to **Setup > General Settings > General > Template**
2. Add a custom template configuration variable:
   ```
   template_debug_mode = true
   ```

### Method 2: Direct Template Modification
Add this line at the top of any template file you want to debug:
```smarty
{assign var="template_debug_mode" value=true}
```

### Method 3: URL Parameter (Development Only)
Add `?debug=1` to any WHMCS page URL to enable debug mode for that page only.

**⚠️ Important Security Note**: Never enable debug mode on production sites as it may expose sensitive information.

## Debug Output Features

When debug mode is enabled, each template will display:

### Debug Information Panel
- **Variable Status**: Shows which variables are set and their types
- **Data Counts**: Number of items in arrays
- **Sample Data**: Preview of variable contents
- **Template File**: Current template file name
- **Timestamp**: When the debug info was generated

### Example Debug Output
```
🐛 Debug Mode: Domain Pricing Template
Variable Status: pricing = Array with 15 items
Sample TLD: Extension: com, Register: $12.99, Renew: $14.99
Template File: domain-pricing.tpl
Timestamp: 2024-01-15 14:30:25
```

## Template-Specific Debug Information

### Domain Pricing Template (`domain-pricing.tpl`)
- **`$pricing`**: Array of domain pricing data
- **Sample TLD data**: First TLD with extension, register, and renew prices
- **Fallback indicators**: Shows when fallback data is being used

### Domain Checker Template (`domainchecker.tpl`)
- **`$domainextensions`**: Available domain extensions for dropdown
- **`$results`**: Domain search results
- **`$popularextensions`**: Popular domain extensions
- **`$searchterm`**: Current search query
- **`$error`**: Any error messages

### Products Template (`products.tpl`)
- **`$productgroups`**: Product categories and their contents
- **Sample group data**: First product group with name and product count
- **Product structure**: Shows how product data is organized

### Configure Product Domain Template (`configureproductdomain.tpl`)
- **`$domainoptions`**: Available domain configuration options
- **`$tlds`**: Available TLD options
- **`$selecteddomaintype`**: Currently selected domain type
- **Form data**: Current form field values

### Client Area Product Details Template (`clientareaproductdetails.tpl`)
- **`$service`**: Service/product information
- **`$status`**: Service status
- **Usage statistics**: Disk and bandwidth usage data
- **Module output**: Whether control panel output is available

## Common Variables Reference

### Universal Variables (Available in Most Templates)
- **`$WEB_ROOT`**: WHMCS installation URL
- **`$template`**: Current template name
- **`$clientsdetails`**: Client information array
- **`$companyname`**: Company name from settings

### Domain-Related Variables
- **`$pricing`**: Domain pricing data
- **`$domainextensions`**: Available TLD extensions
- **`$results`**: Domain search results
- **`$searchterm`**: Domain search query

### Product-Related Variables
- **`$productgroups`**: Product categories
- **`$products`**: Individual products
- **`$configoptions`**: Product configuration options
- **`$customfields`**: Custom form fields

### Service-Related Variables
- **`$service`**: Service details
- **`$status`**: Service status
- **`$diskusage`**, **`$bwusage`**: Usage statistics
- **`$moduleoutput`**: Control panel integration

### Error and Status Variables
- **`$error`**: Error messages
- **`$errormessage`**: Detailed error information
- **`$success`**: Success indicators

## Troubleshooting Common Issues

### Issue: Variables Not Set
**Debug Output**: `Variable: Not set`
**Solution**: 
1. Check WHMCS module configuration
2. Verify the template is being called correctly
3. Check WHMCS hooks for variable population

### Issue: Empty Arrays
**Debug Output**: `Array with 0 items`
**Solution**:
1. Check database for missing data
2. Verify WHMCS API connections
3. Review domain registrar configurations

### Issue: Incorrect Data Types
**Debug Output**: `Type: string` (when expecting array)
**Solution**:
1. Check variable assignment in hooks
2. Review template preprocessing
3. Verify WHMCS version compatibility

### Issue: Pricing Not Displaying
**Debug Output**: `Pricing Variable: Not set`
**Solutions**:
1. Configure domain pricing in WHMCS admin
2. Check domain registrar modules
3. Verify TLD configuration

## Best Practices

### Development Environment
1. **Always test on development first**: Never enable debug on production
2. **Use version control**: Track debug changes separately
3. **Document issues**: Keep a log of debug findings

### Debug Code Management
1. **Remove debug code before production**: Use conditional debug flags
2. **Use consistent debug format**: Follow the established debug panel style
3. **Log important findings**: Document variable structures for future reference

### Security Considerations
1. **Never expose sensitive data**: Avoid showing passwords, API keys, etc.
2. **Limit debug access**: Use IP restrictions if possible
3. **Clean debug output**: Remove debugging before going live

### Performance
1. **Minimal debug impact**: Keep debug code lightweight
2. **Conditional loading**: Only load debug features when needed
3. **Cache considerations**: Debug mode should not affect caching

## Advanced Debugging Techniques

### Custom Debug Functions
Add custom debug functions to your template:

```smarty
{* Custom variable dump function *}
{function name="debug_var" var=""}
    <div class="debug-var bg-gray-800 p-2 rounded text-xs">
        <strong>{$var|@key}:</strong> 
        {if is_array($var)}
            Array({count($var)})
        {else}
            {$var|truncate:50}
        {/if}
    </div>
{/function}
```

### Variable Type Checking
```smarty
{if isset($variable)}
    {if is_array($variable)}
        Array with {count($variable)} items
    {elseif is_string($variable)}
        String: {$variable|truncate:50}
    {elseif is_numeric($variable)}
        Number: {$variable}
    {else}
        Type: {gettype($variable)}
    {/if}
{else}
    Variable not set
{/if}
```

### Conditional Debug Blocks
```smarty
{if isset($template_debug_mode) && $template_debug_mode}
    {* Debug output here *}
{/if}
```

## Debug Mode Template Modifications Summary

The following templates have been enhanced with debug functionality:

1. **domain-pricing.tpl**: Debug pricing data and TLD information
2. **domainchecker.tpl**: Debug search functionality and extensions
3. **products.tpl**: Debug product groups and product data flow
4. **configureproductdomain.tpl**: Debug domain options and form validation
5. **clientareaproductdetails.tpl**: Debug service data and usage statistics

Each template includes:
- Comprehensive variable checking
- Fallback mechanisms for missing data
- Enhanced error handling
- Visual debug information panels
- Type-safe variable access

## Support and Maintenance

### Regular Debug Maintenance
1. **Review debug logs**: Check for recurring issues
2. **Update debug info**: Add new variables as WHMCS updates
3. **Clean unused debug code**: Remove obsolete debug statements

### Getting Help
1. **WHMCS Documentation**: Check official variable documentation
2. **Community Forums**: Share debug findings with community
3. **Support Tickets**: Include debug output when reporting issues

---

**Version**: 1.0  
**Last Updated**: January 2024  
**Compatible with**: WHMCS 8.0+