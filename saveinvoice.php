<?php
include 'Invoice.php';
$invoice = new Invoice();
$invoice->saveInvoice($_POST);
?>