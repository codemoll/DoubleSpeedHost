<?php
// Prevent direct access to the js directory
// This file ensures that users cannot browse the js folder contents directly
header("HTTP/1.0 403 Forbidden");
exit("Access Denied");
?>