<?php
include 'Invoice.php';
$invoice = new Invoice();
$invoice->updateInvoice($_POST);
?>