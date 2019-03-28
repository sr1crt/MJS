-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2019 at 03:29 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

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
CREATE TABLE `commissions` (
  `Commision_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Craftsman_ID` int(11) NOT NULL,
  `Commission_details` varchar(255) NOT NULL,
  `Commission_quote` decimal(10,0) NOT NULL,
  `Commission_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `craftsmen`
--

DROP TABLE IF EXISTS `craftsmen`;
CREATE TABLE `craftsmen` (
  `Craftsman_ID` int(11) NOT NULL,
  `Craftsman_name` varchar(255) NOT NULL,
  `Case_size` varchar(255) NOT NULL,
  `Case_fee` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `Customer_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Address_FL` varchar(255) NOT NULL,
  `Phone` varchar(11) NOT NULL,
  `Email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE `invoices` (
  `Invoice_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Craftsman_ID` int(11) NOT NULL,
  `Currency` varchar(255) NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  `GBP_Conv.` decimal(10,0) NOT NULL,
  `Tax_receipt_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `Stock_ID` int(11) NOT NULL,
  `Item_name` varchar(255) NOT NULL,
  `Item_category` varchar(255) NOT NULL,
  `Photo_ID` int(11) NOT NULL,
  `Craftsman_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
CREATE TABLE `user_details` (
  `User_ID` int(11) NOT NULL,
  `User_Type` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` varchar(11) NOT NULL,
  `Order_history` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login` (
  `User_ID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`Commision_ID`),
  ADD UNIQUE KEY `Cust_FK_Comm` (`Customer_ID`),
  ADD UNIQUE KEY `Craft_FK_Comm` (`Craftsman_ID`);

--
-- Indexes for table `craftsmen`
--
ALTER TABLE `craftsmen`
  ADD PRIMARY KEY (`Craftsman_ID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`Invoice_ID`),
  ADD UNIQUE KEY `Craft_FK` (`Craftsman_ID`),
  ADD UNIQUE KEY `Cust_FK` (`Customer_ID`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`Stock_ID`),
  ADD UNIQUE KEY `Craft_FK_STK` (`Craftsman_ID`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `Cust_User` (`User_ID`),
  ADD UNIQUE KEY `ID_from_login` (`User_ID`),
  ADD KEY `Craft_User` (`User_ID`) USING BTREE;

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`User_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `Commision_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craftsmen`
--
ALTER TABLE `craftsmen`
  MODIFY `Craftsman_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `Customer_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `Invoice_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `Stock_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_login`
--
ALTER TABLE `user_login`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commissions`
--
ALTER TABLE `commissions`
  ADD CONSTRAINT `commissions_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`Customer_ID`),
  ADD CONSTRAINT `commissions_ibfk_2` FOREIGN KEY (`Craftsman_ID`) REFERENCES `craftsmen` (`Craftsman_ID`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`Customer_ID`),
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`Craftsman_ID`) REFERENCES `craftsmen` (`Craftsman_ID`);

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`Craftsman_ID`) REFERENCES `craftsmen` (`Craftsman_ID`);

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user_login` (`User_ID`);

--
-- Constraints for table `user_login`
--
ALTER TABLE `user_login`
  ADD CONSTRAINT `user_login_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `customers` (`Customer_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
