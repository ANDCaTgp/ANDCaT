-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 13, 2021 at 07:36 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `andcat`
--
CREATE DATABASE IF NOT EXISTS `andcat` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `andcat`;

-- --------------------------------------------------------

--
-- Table structure for table `arp_table`
--

DROP TABLE IF EXISTS `arp_table`;
CREATE TABLE IF NOT EXISTS `arp_table` (
  `rowid` int(10) NOT NULL AUTO_INCREMENT,
  `deviceid` int(10) NOT NULL,
  `interface` varchar(30) NOT NULL,
  `mac` varchar(30) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `age` float NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `arp_table`
--

TRUNCATE TABLE `arp_table`;
-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
CREATE TABLE IF NOT EXISTS `devices` (
  `deviceid` int(10) NOT NULL AUTO_INCREMENT,
  `devicename` varchar(30) NOT NULL,
  `deviceip` varchar(30) NOT NULL,
  PRIMARY KEY (`deviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `devices`
--

TRUNCATE TABLE `devices`;
--
--
-- Table structure for table `facts`
--

DROP TABLE IF EXISTS `facts`;
CREATE TABLE IF NOT EXISTS `facts` (
  `deviceid` int(10) NOT NULL,
  `vendor` varchar(30) NOT NULL,
  `serial_number` varchar(30) NOT NULL,
  `model` varchar(30) NOT NULL,
  `hostname` varchar(30) NOT NULL,
  `os_version` varchar(30) NOT NULL,
  `uptime` int(10) NOT NULL,
  `interface_list` text NOT NULL,
  `fqdn` varchar(60) NOT NULL,
  PRIMARY KEY (`deviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `facts`
--

TRUNCATE TABLE `facts`;
-- --------------------------------------------------------

--
-- Table structure for table `get_config`
--

DROP TABLE IF EXISTS `get_config`;
CREATE TABLE IF NOT EXISTS `get_config` (
  `deviceid` int(10) NOT NULL,
  `startup` text NOT NULL,
  `running` text NOT NULL,
  `candidate` text NOT NULL,
  PRIMARY KEY (`deviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `get_config`
--

TRUNCATE TABLE `get_config`;
-- --------------------------------------------------------

--
-- Table structure for table `is_alive`
--

DROP TABLE IF EXISTS `is_alive`;
CREATE TABLE IF NOT EXISTS `is_alive` (
  `deviceid` int(10) NOT NULL,
  `is_alive` varchar(6) NOT NULL,
  PRIMARY KEY (`deviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `is_alive`
--

TRUNCATE TABLE `is_alive`;
-- --------------------------------------------------------

--
-- Table structure for table `lldp_neighbors`
--

DROP TABLE IF EXISTS `lldp_neighbors`;
CREATE TABLE IF NOT EXISTS `lldp_neighbors` (
  `rowid` int(10) NOT NULL AUTO_INCREMENT,
  `deviceid` varchar(30) NOT NULL,
  `neighbor` varchar(30) NOT NULL,
  `local_interface` varchar(30) NOT NULL,
  `neighbor_interface` varchar(30) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `lldp_neighbors`
--

TRUNCATE TABLE `lldp_neighbors`;
-- --------------------------------------------------------

--
-- Table structure for table `LoginUser`
--

DROP TABLE IF EXISTS `LoginUser`;
CREATE TABLE IF NOT EXISTS `LoginUser` (
  `ID` int(11) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `EmailAddress` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `LoginUser`
--

TRUNCATE TABLE `LoginUser`;
-- --------------------------------------------------------

--
-- Table structure for table `mac_address_table`
--

DROP TABLE IF EXISTS `mac_address_table`;
CREATE TABLE IF NOT EXISTS `mac_address_table` (
  `rowid` int(10) NOT NULL AUTO_INCREMENT,
  `deviceid` int(10) NOT NULL,
  `mac` varchar(30) NOT NULL,
  `interface` varchar(30) NOT NULL,
  `vlan` int(10) NOT NULL,
  `active` varchar(10) NOT NULL,
  `static` varchar(10) NOT NULL,
  `moves` int(10) NOT NULL,
  `last_move` float NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `mac_address_table`
--

TRUNCATE TABLE `mac_address_table`;
-- --------------------------------------------------------

--
-- Table structure for table `Persons`
--

DROP TABLE IF EXISTS `Persons`;
CREATE TABLE IF NOT EXISTS `Persons` (
  `PersonID` int(11) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `EmailAddress` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `Persons`
--

TRUNCATE TABLE `Persons`;
-- --------------------------------------------------------

--
-- Table structure for table `vlans`
--

DROP TABLE IF EXISTS `vlans`;
CREATE TABLE IF NOT EXISTS `vlans` (
  `rowid` int(10) NOT NULL AUTO_INCREMENT,
  `deviceid` int(10) NOT NULL,
  `vlan_id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `status` text NOT NULL,
  `interfaces` text NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `vlans`
--

TRUNCATE TABLE `vlans`;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
