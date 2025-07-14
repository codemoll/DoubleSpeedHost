<?php
/**
 * DoubleSpeed Host WHMCS Template
 * Dark tech-inspired theme for hosting provider
 */

$templatename = "DoubleSpeed Host";
$version = "1.0.0";
$description = "Dark tech-inspired WHMCS template with modern design and animations";
$author = "DoubleSpeed Host Team";
$authorurl = "https://doublespeedhost.com";

// Template configuration
$templateconfig = array(
    "Primary Color" => array(
        "type" => "dropdown",
        "options" => "Neon Green,Electric Blue,Cyber Purple",
        "default" => "Neon Green",
        "description" => "Choose the primary accent color for the template"
    ),
    "Logo URL" => array(
        "type" => "text",
        "size" => "50",
        "default" => "",
        "description" => "Enter the URL to your logo image"
    ),
    "Hero Title" => array(
        "type" => "text",
        "size" => "50",
        "default" => "DoubleSpeed Host – Fast, Reliable, and Secure Hosting",
        "description" => "Main title for the homepage hero section"
    ),
    "Hero Subtitle" => array(
        "type" => "textarea",
        "rows" => "3",
        "default" => "Experience lightning-fast hosting with cutting-edge technology and 24/7 expert support.",
        "description" => "Subtitle text for the homepage hero section"
    ),
    "Footer Text" => array(
        "type" => "textarea",
        "rows" => "2",
        "default" => "© 2024 DoubleSpeed Host. All rights reserved. Powered by cutting-edge technology.",
        "description" => "Footer copyright text"
    ),
    "Support Phone" => array(
        "type" => "text",
        "size" => "20",
        "default" => "+1 (555) 123-4567",
        "description" => "Support phone number"
    ),
    "Support Email" => array(
        "type" => "text",
        "size" => "30",
        "default" => "support@doublespeedhost.com",
        "description" => "Support email address"
    )
);

// Get primary color CSS class
function getPrimaryColor($color) {
    switch($color) {
        case 'Electric Blue':
            return 'electric-blue';
        case 'Cyber Purple':
            return 'cyber-purple';
        default:
            return 'neon-green';
    }
}

// Template variables
if (!function_exists('getTemplateVariables')) {
    function getTemplateVariables() {
        global $CONFIG;
        
        return array(
            'companyname' => $CONFIG['CompanyName'],
            'template' => Template::getInstance(),
            'charset' => $CONFIG['Charset'],
            'pagetitle' => $pagetitle ?? '',
            'filename' => $filename ?? '',
            'todaysdate' => date('Y-m-d'),
            'date_day' => date('d'),
            'date_month' => date('m'),
            'date_year' => date('Y')
        );
    }
}

?>