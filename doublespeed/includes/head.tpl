{* Head Section Component *}
{* Usage: {include file="$template/includes/head.tpl" pagetitle="Page Title" description="Page description"} *}

<meta charset="{$charset}">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

{* Page Title *}
<title>
    {if $kbarticle.title}{$kbarticle.title} - {/if}
    {if $pagetitle}{$pagetitle}{else}Welcome{/if} - {$companyname}
</title>

{* Base URL *}
{if $systemsslurl}
    <base href="{$systemsslurl}" />
{else}
    <base href="{$systemurl}" />
{/if}

{* Fonts *}
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">

{* CSS *}
<link rel="stylesheet" type="text/css" href="{$WEB_ROOT}/templates/{$template}/css/style.css" />

{* Favicon *}
<link rel="shortcut icon" href="{$WEB_ROOT}/templates/{$template}/images/favicon.ico" type="image/x-icon" />

{* Meta Tags *}
<meta name="description" content="{if $description}{$description}{else}DoubleSpeed Host - Fast, reliable, and secure hosting solutions with cutting-edge technology and 24/7 support.{/if}">
<meta name="keywords" content="web hosting, cloud hosting, dedicated servers, VPS, domain registration, SSL certificates">
<meta name="author" content="{$companyname}">

{* Open Graph *}
<meta property="og:title" content="{if $pagetitle}{$pagetitle}{else}Welcome{/if} - {$companyname}">
<meta property="og:description" content="{if $description}{$description}{else}Fast, reliable, and secure hosting solutions{/if}">
<meta property="og:type" content="website">
<meta property="og:url" content="{$systemurl}">
{if isset($templatefile) && is_array($templatefile) && $templatefile.logourl}
    <meta property="og:image" content="{$templatefile.logourl}">
{/if}

{* Twitter Card *}
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="{if $pagetitle}{$pagetitle}{else}Welcome{/if} - {$companyname}">
<meta name="twitter:description" content="{if $description}{$description}{else}Fast, reliable, and secure hosting solutions{/if}">

{* Additional Head Content *}
{$headoutput}