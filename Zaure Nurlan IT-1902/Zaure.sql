-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 04, 2019 at 08:15 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Zaure`
--

-- --------------------------------------------------------

--
-- Table structure for table `Clothes`
--

CREATE TABLE `Clothes` (
  `id_clothes` int(12) NOT NULL,
  `type` varchar(25) NOT NULL,
  `model` varchar(25) NOT NULL,
  `size` varchar(5) NOT NULL,
  `amount` int(12) NOT NULL,
  `material` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Companies`
--

CREATE TABLE `Companies` (
  `id_comp` int(12) NOT NULL,
  `name` varchar(25) NOT NULL,
  `address` varchar(25) NOT NULL,
  `postalcode` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `id_customer` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `card` int(11) NOT NULL,
  `telnum` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `postalcode` int(11) NOT NULL,
  `address` int(11) NOT NULL,
  `id_manager` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Feedback`
--

CREATE TABLE `Feedback` (
  `id_feed` int(12) NOT NULL,
  `id_customer` int(12) NOT NULL,
  `feedback` varchar(25) NOT NULL,
  `id_manager` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Managers`
--

CREATE TABLE `Managers` (
  `id_manager` int(12) NOT NULL,
  `name` varchar(25) NOT NULL,
  `salary` int(12) NOT NULL,
  `working_days` int(12) NOT NULL,
  `id_comp` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `id_order` int(12) NOT NULL,
  `id_clothes` int(12) NOT NULL,
  `sum` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Shipping`
--

CREATE TABLE `Shipping` (
  `postalcode` int(12) NOT NULL,
  `Country` int(11) NOT NULL,
  `code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Clothes`
--
ALTER TABLE `Clothes`
  ADD PRIMARY KEY (`id_clothes`);

--
-- Indexes for table `Companies`
--
ALTER TABLE `Companies`
  ADD PRIMARY KEY (`id_comp`),
  ADD KEY `postalcode` (`postalcode`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`id_customer`),
  ADD KEY `id_manager` (`id_manager`),
  ADD KEY `id_order` (`id_order`);

--
-- Indexes for table `Feedback`
--
ALTER TABLE `Feedback`
  ADD PRIMARY KEY (`id_feed`),
  ADD KEY `id_manager` (`id_manager`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indexes for table `Managers`
--
ALTER TABLE `Managers`
  ADD PRIMARY KEY (`id_manager`),
  ADD KEY `id_comp` (`id_comp`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_clothes` (`id_clothes`);

--
-- Indexes for table `Shipping`
--
ALTER TABLE `Shipping`
  ADD PRIMARY KEY (`postalcode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Clothes`
--
ALTER TABLE `Clothes`
  MODIFY `id_clothes` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Companies`
--
ALTER TABLE `Companies`
  MODIFY `id_comp` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Customer`
--
ALTER TABLE `Customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Feedback`
--
ALTER TABLE `Feedback`
  MODIFY `id_feed` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Managers`
--
ALTER TABLE `Managers`
  MODIFY `id_manager` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `id_order` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Shipping`
--
ALTER TABLE `Shipping`
  MODIFY `postalcode` int(12) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Companies`
--
ALTER TABLE `Companies`
  ADD CONSTRAINT `Companies_ibfk_1` FOREIGN KEY (`postalcode`) REFERENCES `Shipping` (`postalcode`);

--
-- Constraints for table `Customer`
--
ALTER TABLE `Customer`
  ADD CONSTRAINT `Customer_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `Orders` (`id_order`),
  ADD CONSTRAINT `Customer_ibfk_2` FOREIGN KEY (`id_manager`) REFERENCES `Managers` (`id_manager`),
  ADD CONSTRAINT `Customer_ibfk_3` FOREIGN KEY (`id_order`) REFERENCES `Orders` (`id_order`),
  ADD CONSTRAINT `Customer_ibfk_4` FOREIGN KEY (`id_order`) REFERENCES `Orders` (`id_order`);

--
-- Constraints for table `Feedback`
--
ALTER TABLE `Feedback`
  ADD CONSTRAINT `Feedback_ibfk_1` FOREIGN KEY (`id_manager`) REFERENCES `Managers` (`id_manager`),
  ADD CONSTRAINT `Feedback_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `Customer` (`id_customer`);

--
-- Constraints for table `Managers`
--
ALTER TABLE `Managers`
  ADD CONSTRAINT `Managers_ibfk_1` FOREIGN KEY (`id_comp`) REFERENCES `Companies` (`id_comp`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`id_clothes`) REFERENCES `Clothes` (`id_clothes`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
