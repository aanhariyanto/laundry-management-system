-- phpMyAdmin SQL Dump
-- version 4.9.10
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 21, 2022 at 10:48 AM
-- Server version: 5.7.37-0ubuntu0.18.04.1
-- PHP Version: 5.6.40-57+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `idconfig` int(11) NOT NULL,
  `key` varchar(200) DEFAULT NULL,
  `value` text,
  `created` datetime DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`idconfig`, `key`, `value`, `created`, `createdby`, `updated`, `updatedby`, `status`) VALUES
(1, 'app_name', '', NULL, NULL, NULL, '', 1),
(2, 'app_description', '', NULL, NULL, NULL, '', 1),
(3, 'app_login_title', '', NULL, NULL, NULL, '', 1),
(4, 'app_preface', '', NULL, NULL, NULL, '', 1),
(5, 'app_invoice', '', NULL, NULL, NULL, '', 1);
 
-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `idcustomer` int(11) NOT NULL,
  `idoutlet` int(11) DEFAULT NULL,
  `customer_code` varchar(200) DEFAULT NULL,
  `customer_name` varchar(200) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `outlay`
--

CREATE TABLE `outlay` (
  `idoutlay` int(11) NOT NULL,
  `idoutlet` int(11) DEFAULT NULL,
  `idoutlay_type` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `description` text,
  `datetime` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `outlay_type`
--

CREATE TABLE `outlay_type` (
  `idoutlay_type` int(11) NOT NULL,
  `outlay_type_name` varchar(200) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `outlet`
--

CREATE TABLE `outlet` (
  `idoutlet` int(11) NOT NULL,
  `outlet_code` varchar(3) DEFAULT NULL,
  `outlet_name` varchar(200) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `idproduct` int(11) NOT NULL,
  `idoutlet` int(11) DEFAULT NULL,
  `product_type` varchar(50) DEFAULT NULL COMMENT 'UNIT/KILOGRAM',
  `product_code` varchar(200) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `description` text,
  `sell_price` double DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `idrole` int(11) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `idtransaction` int(11) NOT NULL,
  `idtransaction_group` bigint(20) UNSIGNED DEFAULT NULL,
  `idproduct` int(11) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `add_cost` double DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_detail`
--

CREATE TABLE `transaction_detail` (
  `idtransaction_detail` int(11) NOT NULL,
  `idtransaction_group` bigint(20) UNSIGNED DEFAULT NULL,
  `detail_description` varchar(300) DEFAULT NULL,
  `detail_qty` double DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_group`
--

CREATE TABLE `transaction_group` (
  `idtransaction_group` bigint(20) UNSIGNED NOT NULL,
  `idoutlet` int(11) DEFAULT NULL,
  `idcustomer` int(11) DEFAULT NULL,
  `iduser` int(11) DEFAULT NULL,
  `code` varchar(200) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `grand_discount` double DEFAULT NULL,
  `grand_discount_percent` double DEFAULT NULL,
  `grand_add_cost` double DEFAULT NULL,
  `grand_tax` double DEFAULT NULL,
  `grand_tax_percent` double DEFAULT NULL,
  `grand_total_final` double DEFAULT NULL,
  `pay` varchar(50) DEFAULT NULL COMMENT 'PAID/NOT PAID YET',
  `transaction_group_status` varchar(50) DEFAULT NULL COMMENT 'NEW/PROGRESS/FINISH/ACCEPTED',
  `note` text,
  `created` datetime DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `idrole` int(11) DEFAULT NULL,
  `idoutlet` int(11) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`iduser`, `idrole`, `idoutlet`, `username`, `password`, `name`, `email`, `address`, `created`, `createdby`, `updated`, `updatedby`, `status`) VALUES
(1, NULL, NULL, 'superadmin', '5f4dcc3b5aa765d61d8327deb882cf99', 'Superadmin', 'superadmin@superadmin.com', 'Indonesia', NULL, 'system', NULL, 'system', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `iduser_role` int(11) NOT NULL,
  `idrole` int(11) DEFAULT NULL,
  `menu_name` varchar(200) DEFAULT NULL,
  `access` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`idconfig`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`idcustomer`),
  ADD KEY `FK_customer_outlet` (`idoutlet`);

--
-- Indexes for table `outlay`
--
ALTER TABLE `outlay`
  ADD PRIMARY KEY (`idoutlay`),
  ADD KEY `FK__outlay_type` (`idoutlay_type`),
  ADD KEY `FK_outlay_outlet` (`idoutlet`);

--
-- Indexes for table `outlay_type`
--
ALTER TABLE `outlay_type`
  ADD PRIMARY KEY (`idoutlay_type`);

--
-- Indexes for table `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`idoutlet`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`idproduct`),
  ADD KEY `FK_product_outlet` (`idoutlet`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`idrole`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`idtransaction`),
  ADD KEY `FK_transaction_product` (`idproduct`),
  ADD KEY `FK_transaction_transaction_group` (`idtransaction_group`);

--
-- Indexes for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD PRIMARY KEY (`idtransaction_detail`),
  ADD KEY `FK_transaction_detail_transaction_group` (`idtransaction_group`);

--
-- Indexes for table `transaction_group`
--
ALTER TABLE `transaction_group`
  ADD PRIMARY KEY (`idtransaction_group`),
  ADD KEY `FK_transaction_group_outlet` (`idoutlet`),
  ADD KEY `FK_transaction_group_customer` (`idcustomer`),
  ADD KEY `FK_transaction_group_user` (`iduser`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`),
  ADD KEY `FK_user_role` (`idrole`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`iduser_role`),
  ADD KEY `FK_user_role_role` (`idrole`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `idconfig` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `idcustomer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `outlay`
--
ALTER TABLE `outlay`
  MODIFY `idoutlay` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `outlay_type`
--
ALTER TABLE `outlay_type`
  MODIFY `idoutlay_type` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `outlet`
--
ALTER TABLE `outlet`
  MODIFY `idoutlet` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `idproduct` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `idrole` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `idtransaction` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  MODIFY `idtransaction_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_group`
--
ALTER TABLE `transaction_group`
  MODIFY `idtransaction_group` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `iduser_role` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK_customer_outlet` FOREIGN KEY (`idoutlet`) REFERENCES `outlet` (`idoutlet`);

--
-- Constraints for table `outlay`
--
ALTER TABLE `outlay`
  ADD CONSTRAINT `FK__outlay_type` FOREIGN KEY (`idoutlay_type`) REFERENCES `outlay_type` (`idoutlay_type`),
  ADD CONSTRAINT `FK_outlay_outlet` FOREIGN KEY (`idoutlet`) REFERENCES `outlet` (`idoutlet`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `FK_transaction_product` FOREIGN KEY (`idproduct`) REFERENCES `product` (`idproduct`),
  ADD CONSTRAINT `FK_transaction_transaction_group` FOREIGN KEY (`idtransaction_group`) REFERENCES `transaction_group` (`idtransaction_group`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD CONSTRAINT `FK_transaction_detail_transaction_group` FOREIGN KEY (`idtransaction_group`) REFERENCES `transaction_group` (`idtransaction_group`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction_group`
--
ALTER TABLE `transaction_group`
  ADD CONSTRAINT `FK_transaction_group_customer` FOREIGN KEY (`idcustomer`) REFERENCES `customer` (`idcustomer`),
  ADD CONSTRAINT `FK_transaction_group_outlet` FOREIGN KEY (`idoutlet`) REFERENCES `outlet` (`idoutlet`),
  ADD CONSTRAINT `FK_transaction_group_user` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
