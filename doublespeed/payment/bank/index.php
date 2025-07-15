<?php
/**
 * WHMCS Template Payment Bank Directory
 * 
 * This file prevents direct access to the payment bank directory
 * and redirects users to the main site.
 * 
 * @package DoubleSpeedHost
 * @version 1.0.0
 */

// Prevent direct access to payment bank directory
if (!defined('WHMCS')) {
    // Redirect to main site
    header('Location: ../../../index.php');
    exit;
}

// If accessed from within WHMCS, show directory listing would not be appropriate
// so we'll just exit gracefully
exit;