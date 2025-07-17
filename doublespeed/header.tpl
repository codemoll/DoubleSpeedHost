<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="{$charset}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{if isset($kbarticle) && is_array($kbarticle) && !empty($kbarticle.title)}{$kbarticle.title} - {/if}{$pagetitle|default:"Page"} - {$companyname|default:"DoubleSpeed Host"}</title>
    
    {if $systemsslurl}
        <base href="{$systemsslurl}" />
    {else}
        <base href="{$systemurl}" />
    {/if}
    
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    
    <!-- CSS - WHMCS Six Compatible Modular Styles -->
    <link rel="stylesheet" type="text/css" href="{$WEB_ROOT}/templates/{$template}/css/doublespeed.css" />
    <link rel="stylesheet" type="text/css" href="{$WEB_ROOT}/templates/{$template}/css/doublespeed-six.css" />
    <link rel="stylesheet" type="text/css" href="{$WEB_ROOT}/templates/{$template}/css/doublespeed-custom.css" />
    <link rel="stylesheet" type="text/css" href="{$WEB_ROOT}/templates/{$template}/css/doublespeed-responsive.css" />
    
    <!-- Favicon -->
    <link rel="shortcut icon" href="{$WEB_ROOT}/templates/{$template}/images/favicon.ico" type="image/x-icon" />
    
    <!-- Meta Tags -->
    <meta name="description" content="DoubleSpeed Host - Fast, reliable, and secure hosting solutions with cutting-edge technology and 24/7 support.">
    <meta name="keywords" content="web hosting, cloud hosting, dedicated servers, VPS, domain registration, SSL certificates">
    <meta name="author" content="DoubleSpeed Host">
    
    <!-- Open Graph -->
    <meta property="og:title" content="{$pagetitle} - {$companyname}">
    <meta property="og:description" content="Fast, reliable, and secure hosting solutions">
    <meta property="og:type" content="website">
    <meta property="og:url" content="{$systemurl}">
    
    {$headoutput}
</head>

<body class="bg-dark">
    {if isset($templatefile) && is_array($templatefile) && (!isset($templatefile.shownavbar) || $templatefile.shownavbar !== false)}
        {include file="$template/includes/navbar.tpl"}
    {/if}
    
    <main class="main-content {if isset($templatefile) && is_array($templatefile) && (!isset($templatefile.shownavbar) || $templatefile.shownavbar !== false)}pt-5{/if}">

        
