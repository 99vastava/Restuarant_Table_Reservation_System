-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 02, 2023 at 09:14 AM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `resturant_reservation`
--

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE IF NOT EXISTS `reservation` (
  `res_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) NOT NULL,
  `res_date` varchar(20) NOT NULL,
  `period` varchar(2) NOT NULL,
  `seats` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`res_id`),
  KEY `cust_id` (`cust_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`res_id`, `cust_id`, `res_date`, `period`, `seats`, `date`) VALUES
(13, 3, '04/09/2023 6:45 ', 'PM', 2, '2023-04-20 00:45:26'),
(14, 3, '04/20/2023 8:24 ', 'AM', 5, '2023-04-26 22:25:37'),
(17, 3, '04/19/2023 8:20 ', 'PM', 4, '2023-04-26 22:34:56'),
(18, 7, '05/25/2023 2:17 ', 'AM', 6, '2023-04-27 02:18:10');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`cust_id`);
