-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 02, 2023 at 04:49 PM
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
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(50) NOT NULL,
  `cust_email` varchar(50) NOT NULL,
  `cust_password` varchar(15) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`cust_id`, `cust_name`, `cust_email`, `cust_password`, `date`) VALUES
(3, 'Srishti Srivastava', 'srivastavasrishti333@gmail.com', '121', '2023-04-18 02:05:35'),
(5, 'Mansi Srivastava', 'm@gmail.com', '223', '2023-04-18 02:12:12'),
(6, 'Atul Sharma', 'atul@gmail.com', '331', '2023-04-18 17:13:47'),
(7, 'Priya Singh', 'priya@gmail.com', 'priya3', '2023-04-27 02:17:19'),
(9, 'Manu Srivastava', 'manu34@gmail.com', 'manu22', '2023-05-02 20:12:27'),
(10, 'Manu Srivastava', 'manu33@gmail.com', 'manu22', '2023-05-02 20:14:44'),
(11, 'Manu Srivastava', 'manu33@gmail.com', 'manu22', '2023-05-02 20:16:13'),
(12, 'SIRISH TIWARI', 'sirish14@gmail.com', 'sirish14', '2023-05-02 20:24:29'),
(13, 'Deepika Singh', 'deepika23@gmail.com', 'deep22', '2023-05-02 20:30:42');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`res_id`, `cust_id`, `res_date`, `period`, `seats`, `date`) VALUES
(13, 3, '04/09/2023 6:45 ', 'PM', 2, '2023-04-20 00:45:26'),
(14, 3, '04/20/2023 8:24 ', 'AM', 5, '2023-04-26 22:25:37'),
(17, 3, '04/19/2023 8:20 ', 'PM', 4, '2023-04-26 22:34:56'),
(18, 7, '05/25/2023 2:17 ', 'AM', 6, '2023-04-27 02:18:10'),
(20, 12, '05/03/2023 8:30 ', 'PM', 6, '2023-05-02 20:25:43'),
(22, 13, '05/03/2023 8:30 ', 'PM', 1, '2023-05-02 20:31:59');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`cust_id`);
