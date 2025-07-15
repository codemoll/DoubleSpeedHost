<?php
/**
 * WHMCS Template Payment Card Directory
 * 
 * This file prevents direct access to the payment card directory
 * and redirects users to the main site.
 * 
 * @package DoubleSpeedHost
 * @version 1.0.0
 */

// Prevent direct access to payment card directory
if (!defined('WHMCS')) {
    // Redirect to main site
    header('Location: ../../../index.php');
    exit;
}

// If accessed from within WHMCS, show directory listing would not be appropriate
// so we'll just exit gracefully
exit;