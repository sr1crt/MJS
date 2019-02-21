-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2019 at 03:23 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mjs`
--
CREATE DATABASE IF NOT EXISTS `mjs` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mjs`;

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

DROP TABLE IF EXISTS `commissions`;
CREATE TABLE IF NOT EXISTS `commissions` (
  `Commission_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_ID` int(11) NOT NULL,
  `Craftsman_ID` int(11) NOT NULL,
  `Commission_details` text NOT NULL,
  `Commission_quote` decimal(10,0) NOT NULL,
  `Commission_status` varchar(10) NOT NULL,
  PRIMARY KEY (`Commission_ID`),
  KEY `Customer_ID` (`Customer_ID`,`Craftsman_ID`),
  KEY `Craftsman_ID` (`Craftsman_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craftsmen`
--

DROP TABLE IF EXISTS `craftsmen`;
CREATE TABLE IF NOT EXISTS `craftsmen` (
  `Craftsman_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Craftsman_name` text NOT NULL,
  `Case_size` text NOT NULL,
  `Case_fee` decimal(10,0) NOT NULL,
  PRIMARY KEY (`Craftsman_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `Customer_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` text NOT NULL,
  `Address_FL` text NOT NULL,
  `Phone` text NOT NULL,
  `Email` text NOT NULL,
  `Password` text NOT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `Invoice_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_ID` int(11) NOT NULL,
  `Craftsman_ID` int(11) NOT NULL,
  `Currency` text NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  `GBP_conv` decimal(10,0) NOT NULL,
  `Tax_receipt_ID` int(11) NOT NULL,
  PRIMARY KEY (`Invoice_ID`),
  KEY `Customer_ID` (`Customer_ID`,`Craftsman_ID`),
  KEY `Craftsman_ID` (`Craftsman_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `Stock_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Item_name` text NOT NULL,
  `Item_category` text NOT NULL,
  `Photo_ID` int(11) NOT NULL,
  `Craftsman_ID` int(11) NOT NULL,
  PRIMARY KEY (`Stock_ID`),
  KEY `Craftsman_ID` (`Craftsman_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commissions`
--
ALTER TABLE `commissions`
  ADD CONSTRAINT `commissions_ibfk_2` FOREIGN KEY (`Craftsman_ID`) REFERENCES `craftsmen` (`Craftsman_ID`),
  ADD CONSTRAINT `commissions_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`Customer_ID`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`Craftsman_ID`) REFERENCES `craftsmen` (`Craftsman_ID`),
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`Customer_ID`);

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`Craftsman_ID`) REFERENCES `craftsmen` (`Craftsman_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
