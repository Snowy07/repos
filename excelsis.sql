-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 10, 2020 at 01:43 PM
-- Server version: 5.5.62
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `excelsis`
--

-- --------------------------------------------------------

--
-- Table structure for table `billings`
--

DROP TABLE IF EXISTS `billings`;
CREATE TABLE IF NOT EXISTS `billings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `billing_number` bigint(11) NOT NULL,
  `unit_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contract_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `start_cycle` date NOT NULL,
  `end_cycle` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`contract_number`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billings`
--

INSERT INTO `billings` (`id`, `billing_number`, `unit_id`, `contract_number`, `amount`, `start_cycle`, `end_cycle`, `created_at`, `updated_at`) VALUES
(1, 1, 'H-LGF-E', '9090', 6800.00, '0000-00-00', '0000-00-00', '2020-02-04 00:00:30', '2020-02-04 00:00:30'),
(2, 1, 'H-LGE-E', '7070', 7800.00, '0000-00-00', '0000-00-00', '2020-02-04 00:00:30', '2020-02-04 00:00:30'),
(3, 1, 'H-LGG-E', '5656', 300.00, '2020-02-01', '2020-02-29', '2020-02-09 03:38:30', '2020-02-09 03:38:30'),
(4, 2, 'H-LGE-E', '7070', 15430.00, '2020-02-01', '2020-02-29', '2020-02-09 03:38:30', '2020-02-09 03:38:30'),
(5, 2, 'H-LGG-E', '5656', 300.00, '2020-02-01', '2020-02-29', '2020-02-09 03:47:08', '2020-02-09 03:47:08'),
(6, 3, 'H-LGE-E', '7070', 15430.00, '2020-02-01', '2020-02-29', '2020-02-09 03:47:08', '2020-02-09 03:47:08');

-- --------------------------------------------------------

--
-- Table structure for table `charges`
--

DROP TABLE IF EXISTS `charges`;
CREATE TABLE IF NOT EXISTS `charges` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `unit_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contract_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `bill_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`unit_id`,`contract_no`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `charges`
--

INSERT INTO `charges` (`id`, `unit_id`, `contract_no`, `amount`, `bill_description`, `remarks`, `billing_date`, `created_at`, `updated_at`) VALUES
(5, 'H-LGE-E', '7070', 30.00, 'ISSUANCE FEE', 'ISSUED LIGHT BULB', '2020-02-01', '2020-02-04 01:40:50', '2020-02-04 01:40:50'),
(6, 'H-LGE-E', '7070', 7800.00, 'RENTAL FEE', NULL, '2020-02-07', '2020-02-06 22:45:27', '2020-02-06 22:45:27'),
(7, 'H-LGE-E', '7070', 7800.00, 'RENTAL FEE', NULL, '2020-02-01', '2020-02-07 02:00:26', '2020-02-07 02:00:26'),
(9, 'H-LGG-E', '5656', 300.00, 'ISSUANCE FEE', NULL, '2020-02-08', NULL, NULL),
(10, 'H-LGE-E', '7070', 300.00, 'ISSUANCE FEE', 'Door Knob', '2020-02-09', '2020-02-08 19:53:43', '2020-02-08 19:53:43'),
(11, 'H-LGG-E', '5656', 200.00, 'ISSUANCE FEE', 'SEALANT', '2020-02-12', '2020-02-09 19:11:20', '2020-02-09 19:11:20'),
(12, 'H-LGG-E', '5656', 200.00, 'ISSUANCE FEE', 'LIGHT BULB', '2020-02-10', '2020-02-09 19:12:59', '2020-02-09 19:12:59');

-- --------------------------------------------------------

--
-- Table structure for table `concerns`
--

DROP TABLE IF EXISTS `concerns`;
CREATE TABLE IF NOT EXISTS `concerns` (
  `concernid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `building` enum('HARVARD','PRINCETON','WHARTON') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tenant_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `concern_content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('PENDING','RESOLVED','REJECTED') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tenant_available_date` date NOT NULL,
  `tenant_available_time` time NOT NULL,
  `maintenance_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`concernid`),
  UNIQUE KEY `concernid` (`concernid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
CREATE TABLE IF NOT EXISTS `contracts` (
  `contract_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actual_checkout` datetime DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `building` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `term_period` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `check_in` date DEFAULT NULL,
  `check_out` date DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`contract_number`),
  UNIQUE KEY `contract_number` (`contract_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contracts`
--

INSERT INTO `contracts` (`contract_number`, `actual_checkout`, `name`, `email`, `mobile_number`, `country`, `building`, `unit_id`, `term_period`, `check_in`, `check_out`, `status`, `created_at`, `updated_at`) VALUES
('1045', NULL, 'Drev Asuncion', 'drev@gmail.com', '09584928571', 'United Kingdom', 'HARVARD', 'H-LGC-E', 'SHORT TERM', '2020-02-03', '2020-03-04', 'ON QUEUE', '2020-02-02 23:54:05', '2020-02-02 23:54:05'),
('1211', NULL, 'Maf Lackias', 'maf@gmail.com', '09101961789', 'Philippines', 'HARVARD', 'H-LGK-E', 'LONG TERM', '2020-02-04', '2020-08-14', 'ON QUEUE', '2020-02-03 00:29:50', '2020-02-03 00:29:50'),
('2020', NULL, 'Drev', 'drev@drev.com', '12345789600', 'Bahrain', 'HARVARD', 'H-LGB-E', 'SHORT TERM', '2020-02-02', '2020-03-05', 'ON QUEUE', '2020-02-02 03:01:23', '2020-02-02 03:01:23'),
('2021', NULL, 'Josie Peralta', 'zel@zel.com', '01234567890', 'Afghanistan', 'HARVARD', 'H-LGB-W', 'SHORT TERM', '2020-02-01', '2020-03-21', 'ON QUEUE', '2020-02-02 05:25:44', '2020-02-02 05:25:44'),
('2023', NULL, 'Michael', 'mike@mike.com', '12345678900', 'Barbados', 'HARVARD', 'H-LGA-E', 'SHORT TERM', '2020-02-02', '2020-03-07', 'ON QUEUE', '2020-02-02 05:13:03', '2020-02-02 05:13:03'),
('32167', NULL, 'zel ignacio', 'zel@zel', '12345678912', 'Afghanistan', 'HARVARD', 'H-LGC-W', 'SHORT TERM', '2020-02-03', '2020-02-27', 'ON QUEUE', '2020-02-02 23:55:38', '2020-02-02 23:55:38'),
('5656', NULL, 'Minzu Dela Cruz', 'minmin@gmail.com', '09785241652', 'Philippines', 'HARVARD', 'H-LGG-E', 'SHORT TERM', '2020-02-03', '2020-03-03', 'MOVED IN', '2020-02-02 23:56:24', '2020-02-02 23:56:24'),
('6789', NULL, 'Hazel Poe', 'hazelpoe@gmail.com', '09384758291', 'China', 'HARVARD', 'H-LGQ-E', 'LONG TERM', '2020-02-03', '2020-08-03', 'MOVED OUT', '2020-02-03 00:17:08', '2020-02-03 00:17:08'),
('7070', NULL, 'Michael', 'drev@drev.com', '12345789600', 'Afghanistan', 'HARVARD', 'H-LGE-E', 'SHORT TERM', '2020-02-04', '2020-02-04', 'MOVED IN', '2020-02-03 21:27:48', '2020-02-03 21:27:48'),
('9090', NULL, 'Grace Geneveve Bersamin', 'mike@mike.com', '01234567890', 'Afghanistan', 'HARVARD', 'H-LGF-E', 'LONG TERM', '2020-02-04', '2020-02-10', 'MOVED OUT', '2020-02-03 22:09:26', '2020-02-03 22:09:26');

-- --------------------------------------------------------

--
-- Table structure for table `cycles`
--

DROP TABLE IF EXISTS `cycles`;
CREATE TABLE IF NOT EXISTS `cycles` (
  `cycle_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`cycle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cycles`
--

INSERT INTO `cycles` (`cycle_id`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(1, '2020-02-01', '2020-02-29', 'CLOSED', '2020-02-07 01:42:23', '2020-02-07 01:42:23'),
(5, '2020-02-10', '2020-02-29', 'ACTIVE', '2020-02-09 19:12:43', '2020-02-09 19:12:43');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `username`, `password`, `mobile_no`, `email`, `role`, `status`, `created_at`, `updated_at`) VALUES
(8, 'Jeff Paswick', 'admin', '123', '09065792344', 'zenzenkeltwin@gmail.com', 'Admin', 'ACTIVE', '2020-01-30 18:28:18', '2020-02-06 18:33:55'),
(12, 'Ferdinand De Asis', 'keeper', '123', '09175057090', 'ferdzzz@gmail.com', 'Keeper', 'ACTIVE', '2020-01-30 18:57:59', '2020-02-04 20:33:44'),
(13, 'Ephraim Garcia', 'billing', '123', '09778456951', 'raigarrr@gmail.com', 'Billing', 'ACTIVE', '2020-02-03 23:32:33', '2020-02-03 23:32:33'),
(14, 'Yvonne Manuel', 'bon', '123', '099999999', '2155321@gmail.com', 'Billing', 'ACTIVE', '2020-02-04 18:06:51', '2020-02-04 18:06:51'),
(15, 'Drev Asuncion', 'leasing', '123', '09454554545', 'durebu@gmail.com', 'leasing', 'ACTIVE', '2020-02-04 18:09:20', '2020-02-04 18:09:20');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guardians`
--

DROP TABLE IF EXISTS `guardians`;
CREATE TABLE IF NOT EXISTS `guardians` (
  `guardian_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guardian_mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guardian_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guardian_rel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contract_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`guardian_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(20) DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `item_name`, `brand`, `description`, `quantity`, `price`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 'ANGLE VALVE (1/2x1/2)', 'EASY FLOW', NULL, 9, 20.00, NULL, '2020-01-14 09:40:38', '2020-01-30 01:41:58'),
(2, 'ANGLE VALVE (2-WAY 1/2x1/2)', 'EASY FLOW', NULL, 21, 30.00, NULL, '2020-01-14 09:41:12', '2020-01-30 01:41:58'),
(3, 'ANGLE VALVE (3 WAY 1/2x1/2x1/2)', 'EASY FLOW', NULL, 0, 20.00, NULL, '2020-01-14 09:41:38', '2020-01-14 09:41:38'),
(4, 'ANGLE VALVE (3 WAY 1/2x1/2x1/4)', NULL, NULL, 0, 20.00, NULL, '2020-01-14 09:43:23', '2020-01-14 09:43:23'),
(5, 'BATTERY FOR SMOKE DETECTOR', NULL, NULL, 0, 20.00, NULL, '2020-01-14 09:45:48', '2020-01-14 09:45:48'),
(6, 'BEDSHEET', NULL, NULL, 0, 20.00, NULL, '2020-01-14 09:46:16', '2020-01-14 09:46:16'),
(7, 'BEDDINGS SET', NULL, NULL, 0, 20.00, NULL, '2020-01-14 09:46:31', '2020-01-14 09:46:31'),
(8, 'BOWL', NULL, NULL, 0, 20.00, NULL, '2020-01-14 09:46:43', '2020-01-14 09:46:43'),
(9, 'COVE LIGHT T5', 'PHILIPS', '28W', 0, 20.00, NULL, '2020-01-14 09:47:30', '2020-01-14 09:47:30'),
(10, 'CIRCULAR LAMP', NULL, NULL, 0, 20.00, NULL, '2020-01-14 09:47:46', '2020-01-14 09:47:46'),
(11, 'CONCEALED HINGES (Single Over Lay - A)', 'AMERILOCK', NULL, 0, 20.00, NULL, '2020-01-14 09:49:08', '2020-01-14 09:49:08'),
(12, 'CONCEALED HINGES (Single Over Lay - A)', 'HAVA ASIA', NULL, 0, 20.00, NULL, '2020-01-14 09:49:22', '2020-01-14 09:49:22'),
(13, 'CONCEALED HINGES (Single Over Lay - C)', NULL, NULL, 0, 20.00, NULL, '2020-01-14 09:49:32', '2020-01-14 09:49:32'),
(14, 'DOOR KNOB (HARVARD - MAIN DOOR)', NULL, 'SILVER - ROUND', 0, 20.00, NULL, '2020-01-14 09:50:12', '2020-01-14 09:50:12'),
(15, 'DOOR KNOB (PRINCETON - MAIN DOOR)', NULL, 'SILVER - LEVER', 0, 20.00, NULL, '2020-01-14 09:50:34', '2020-01-14 09:50:34'),
(16, 'DOOR KNOB (WHARTON - MAIN DOOR)', NULL, 'BRONZE - LEVER', 0, 20.00, NULL, '2020-01-14 09:50:51', '2020-01-14 09:50:51'),
(17, 'DOOR KNOB (T & B DOOR)', NULL, 'KEYLESS', 0, 20.00, NULL, '2020-01-14 09:51:11', '2020-01-14 09:51:11'),
(18, 'DEAD BOLT', NULL, 'SILVER', 0, 20.00, NULL, '2020-01-14 09:51:19', '2020-01-14 09:51:19'),
(19, 'DOOR GUARD', 'YALE', NULL, 0, 20.00, NULL, '2020-01-14 09:51:35', '2020-01-14 09:51:35'),
(20, 'DOOR CHAIN', 'AMERILOCK', NULL, 0, 20.00, NULL, '2020-01-14 09:51:55', '2020-01-14 09:51:55'),
(21, 'FUSE', NULL, '10A', 0, 20.00, NULL, '2020-01-14 09:52:42', '2020-01-14 09:52:42'),
(22, 'FLEXIBLE HOSE (1/2x3/8x10)', NULL, NULL, 0, 20.00, NULL, '2020-01-14 09:53:25', '2020-01-14 09:53:25'),
(23, 'FLEXIBLE HOSE (1/2x1/8x16))', NULL, NULL, 0, 20.00, NULL, '2020-01-14 09:54:22', '2020-01-14 09:54:22'),
(24, 'FORK', NULL, NULL, 0, 20.00, NULL, '2020-01-14 09:54:31', '2020-01-14 09:54:31'),
(25, 'GLASS CUP', NULL, NULL, 0, 20.00, NULL, '2020-01-14 09:55:08', '2020-01-14 09:55:08'),
(26, 'HALOGEN LAMP', 'EUROLUX', '5W', 0, 20.00, NULL, '2020-01-14 09:55:53', '2020-01-14 09:55:53'),
(27, 'HEATER', 'JOVEN', NULL, 0, 20.00, NULL, '2020-01-14 09:56:38', '2020-01-14 09:56:38'),
(28, 'KITCHEN FAUCET (HARVARD)', NULL, NULL, 0, 20.00, NULL, '2020-01-14 09:57:38', '2020-01-14 09:57:38'),
(29, 'KITCHEN FAUCET (PRINCETON/WHARTON)', NULL, NULL, 0, 20.00, NULL, '2020-01-14 09:57:52', '2020-01-14 09:57:52'),
(30, 'LIGHT BULB', 'PHILIPS', '5W', 0, 20.00, NULL, '2020-01-14 09:58:15', '2020-01-14 09:58:15'),
(31, 'LAV FAUCET', NULL, NULL, 0, 20.00, NULL, '2020-01-14 09:58:28', '2020-01-14 09:58:28'),
(32, 'PIN LIGHT RECEPTACLE', NULL, NULL, 0, 20.00, NULL, '2020-01-14 09:59:51', '2020-01-14 09:59:51'),
(33, 'P-TRAP (REGULAR 3/4)', NULL, NULL, 0, 20.00, NULL, '2020-01-14 10:00:13', '2020-01-14 10:00:13'),
(34, 'P-TRAP (REGULAR 1 1/2)', NULL, NULL, 0, 20.00, 'NOT COMPATIBLE', '2020-01-14 10:00:41', '2020-01-14 10:00:41'),
(35, 'P-TRAP (REGULAR 1 1/4)', 'EASY FLOW', NULL, 0, 20.00, NULL, '2020-01-14 10:00:54', '2020-01-14 10:00:54'),
(36, 'P-TRAP (POP-UP)', NULL, NULL, 0, 20.00, NULL, '2020-01-14 10:00:59', '2020-01-14 10:00:59'),
(37, 'PEEP LOCK', 'AMERILOCK', NULL, 0, 20.00, NULL, '2020-01-14 10:01:20', '2020-01-14 10:01:20'),
(38, 'PILLOWS', NULL, NULL, 0, 20.00, NULL, '2020-01-14 10:01:28', '2020-01-14 10:01:28'),
(39, 'PILLOW CASE', NULL, NULL, 0, 20.00, NULL, '2020-01-14 10:01:35', '2020-01-14 10:01:35'),
(40, 'PLASTIC CUP', NULL, NULL, 0, 20.00, NULL, '2020-01-14 10:01:42', '2020-01-14 10:01:42'),
(41, 'REFRIGERATOR BULB', 'OMNI', NULL, 0, 20.00, NULL, '2020-01-14 10:02:14', '2020-01-14 10:02:14'),
(42, 'SEAT COVER (HARVARD)', NULL, 'WHITE', 0, 20.00, NULL, '2020-01-14 10:02:53', '2020-01-14 10:02:53'),
(43, 'SEAT COVER (PRINCETON & WHARTON)', NULL, 'CREAM - ELONGATED', 0, 20.00, NULL, '2020-01-14 10:03:30', '2020-01-14 10:03:30'),
(44, 'SHOWER CURTAIN HOLDER', NULL, 'RETRACTABLE', 0, 20.00, NULL, '2020-01-14 10:03:55', '2020-01-14 10:03:55'),
(45, 'SHOWER CURTAIN', NULL, NULL, 0, 20.00, NULL, '2020-01-14 10:04:01', '2020-01-14 10:04:01'),
(46, 'SEALANT', NULL, 'WHITE', 0, 20.00, NULL, '2020-01-14 10:04:13', '2020-01-14 10:04:13'),
(47, 'SEALANT', NULL, 'CLEAR', 0, 20.00, NULL, '2020-01-14 10:04:19', '2020-01-14 10:04:19'),
(48, 'SPOONS', NULL, NULL, 0, 20.00, NULL, '2020-01-14 10:04:28', '2020-01-14 10:04:28'),
(49, 'TOWEL HOLDER', NULL, NULL, 0, 20.00, NULL, '2020-01-14 10:04:57', '2020-01-14 10:04:57'),
(50, 'PLATE', NULL, NULL, 0, 20.00, NULL, '2020-01-14 10:05:22', '2020-01-14 10:05:22'),
(51, 'WALL FAUCET', NULL, NULL, 0, 20.00, NULL, '2020-01-14 10:06:30', '2020-01-14 10:06:30'),
(52, 'WC FLOATER', NULL, NULL, 0, 20.00, NULL, '2020-01-14 10:06:37', '2020-01-14 10:06:37'),
(53, 'WINDOW LOCK (RIGHT)', NULL, NULL, 0, 20.00, NULL, '2020-01-14 10:06:49', '2020-01-14 10:06:49'),
(54, 'WINDOW LOCK (LEFT)', NULL, NULL, 0, 20.00, NULL, '2020-01-14 10:06:54', '2020-01-14 10:06:54'),
(55, 'KITCHEN KNIFE', NULL, NULL, 0, 20.00, NULL, '2020-01-14 10:08:03', '2020-01-14 10:08:03'),
(58, 'Folding Bed', 'asd', '1', 20, 10.00, NULL, '2020-01-30 01:07:32', '2020-01-30 01:07:32'),
(59, 'Folding Bed', 'Higaan', 'Extra Bed', 20, 20.00, NULL, '2020-01-30 01:44:20', '2020-01-30 01:44:20'),
(60, 'Table', 'Uratex', 'Kitchen Table', 30, 30.00, NULL, '2020-01-30 01:44:20', '2020-01-30 01:44:20'),
(61, 'BULB', 'PHILIP', 'LIGHT THE GOSHEN', 80, 250.00, NULL, '2020-02-03 00:05:54', '2020-02-03 00:06:25'),
(62, 'DOORKNOB', 'PHILIP', 'SECURITY', 10, 890.00, NULL, '2020-02-03 00:05:54', '2020-02-03 00:05:54');

-- --------------------------------------------------------

--
-- Table structure for table `item_histories`
--

DROP TABLE IF EXISTS `item_histories`;
CREATE TABLE IF NOT EXISTS `item_histories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `item` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_30_034257_create_contracts_table', 2),
(5, '2019_12_30_035343_create_units_table', 3),
(6, '2020_01_05_104837_create_rental_rates_table', 4),
(7, '2020_01_05_132243_create_billings_table', 5),
(8, '2020_01_08_055942_create_billings_table', 6),
(9, '2020_01_09_062934_create_reservation_table', 7),
(10, '2020_01_11_085531_create_payments_table', 8),
(11, '2020_01_20_130148_create_employees_table', 9),
(12, '2020_01_20_132024_create_temps_table', 10),
(13, '2020_01_26_142943_create_charges_table', 11),
(14, '2020_02_02_082546_create_concerns_table', 12),
(15, '2020_02_07_053818_create_bill_cycles_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contract_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `bill_descriptions` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`contract_no`),
  UNIQUE KEY `reference_no` (`reference_no`),
  UNIQUE KEY `id` (`id`,`reference_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `reference_no`, `contract_no`, `unit_id`, `amount`, `bill_descriptions`, `remarks`, `payment_date`, `created_at`, `updated_at`) VALUES
(1, '10201', '2021', 'H-LGB-W', 8000.00, 'SPECIAL CASE', 'Advance Payment', '0000-00-00', '2020-02-02 07:06:22', '2020-02-02 07:06:22'),
(2, '102030', '9090', 'H-LGF-E', 30.00, 'ISSUANCE FEE', 'PAYMENT FOR ISSUED LIGHT BULB', '0000-00-00', '2020-02-04 00:58:42', '2020-02-04 00:58:42'),
(3, '321354987', '7070', 'H-LGE-E', 300.00, 'ISSUANCE FEE', 'Payment for doorknob', '2020-02-09', '2020-02-08 19:57:15', '2020-02-08 19:57:15'),
(4, '9798783211', '7070', 'H-LGE-E', 200.00, 'ISSUANCE PAYMENT', 'Doorknob payment', '2020-02-10', NULL, NULL),
(6, '112dqw3123', '5656', 'H-LGG-E', 200.00, 'ISSUANCE FEE', 'BULB', '2020-02-13', '2020-02-09 19:39:06', '2020-02-09 19:39:06');

-- --------------------------------------------------------

--
-- Table structure for table `rental_rates`
--

DROP TABLE IF EXISTS `rental_rates`;
CREATE TABLE IF NOT EXISTS `rental_rates` (
  `building` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `term_period` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(8,2) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `rate` (`rate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rental_rates`
--

INSERT INTO `rental_rates` (`building`, `term_period`, `rate`, `updated_at`) VALUES
('HARVARD', 'LONG TERM', 6800.00, NULL),
('PRINCETON', 'LONG TERM', 7500.00, NULL),
('HARVARD', 'SHORT TERM', 7800.00, NULL),
('PRINCETON', 'SHORT TERM', 8500.00, NULL),
('WHARTON', 'LONG TERM ', 11000.00, NULL),
('WHARTON', 'SHORT TERM', 12000.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
CREATE TABLE IF NOT EXISTS `reservations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `building` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `term_period` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`unit_id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `unit_id`, `name`, `mobile_number`, `email`, `country`, `building`, `term_period`, `check_in`, `check_out`, `status`, `created_at`, `updated_at`) VALUES
(1, 'H-LGA-E', 'Mike', '12345678900', 'mike@jericho.com', 'Poland', 'HARVARD', 'SHORT TERM', '2020-02-02', '2020-04-02', 'ACCEPTED', '2020-02-02 01:43:59', '2020-02-02 05:13:03'),
(2, 'H-LGB-E', 'Drev', '12345789600', 'drev@drev.com', 'Bahrain', 'HARVARD', 'LONG TERM', '2020-02-02', '2020-04-06', 'ACCEPTED', '2020-02-02 02:38:41', '2020-02-02 03:01:23'),
(3, 'H-LGG-E', 'Ferdinand De Asis', '09175057090', 'ferdinanddeasis12@gmail.com', 'Philippines', 'HARVARD', 'SHORT TERM', '2020-02-03', '2020-05-03', 'ACCEPTED', '2020-02-02 23:54:36', '2020-02-02 23:56:24'),
(4, 'H-LGC-W', 'zel ignacio', '12345678912', 'zel@zel', 'Afghanistan', 'HARVARD', 'SHORT TERM', '2020-02-03', '2020-02-27', 'ACCEPTED', '2020-02-02 23:54:43', '2020-02-02 23:55:38'),
(5, 'H-LGF-E', 'dev asuncion', '12345678912', 'dev@drev', 'Afghanistan', 'HARVARD', 'SHORT TERM', '2020-02-03', '2020-02-27', 'ACCEPTED', '2020-02-03 00:01:46', '2020-02-03 22:09:26'),
(6, 'H-LGK-E', 'Dana Anad', '09789546125', 'dana@gmail.com', 'Afghanistan', 'HARVARD', 'LONG TERM', '2020-02-03', '2020-06-03', 'ACCEPTED', '2020-02-03 00:02:19', '2020-02-03 00:29:50'),
(7, 'H-LGQ-E', 'Hazel Poe', '09384758291', 'hazelpoe@gmail.com', 'China', 'HARVARD', 'LONG TERM', '2020-02-03', '2020-08-03', 'ACCEPTED', '2020-02-03 00:15:24', '2020-02-03 00:17:08'),
(10, 'H-LGK-E', 'Mary Poppins', '09175057090', 'marypoppins@gmail.com', 'Dominica', 'HARVARD', 'LONG TERM', '2020-02-03', '2020-12-03', 'ACCEPTED', '2020-02-03 00:24:11', '2020-02-03 00:29:50'),
(11, 'H-LGK-E', 'Maf Lackias', '09101961789', 'maf@gmail.com', 'Philippines', 'HARVARD', 'LONG TERM', '2020-02-04', '2020-08-14', 'ACCEPTED', '2020-02-03 00:25:35', '2020-02-03 00:29:50');

-- --------------------------------------------------------

--
-- Table structure for table `temps`
--

DROP TABLE IF EXISTS `temps`;
CREATE TABLE IF NOT EXISTS `temps` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `building` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `date_generated` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bill_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`contract_number`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `temps`
--

INSERT INTO `temps` (`id`, `contract_number`, `unit_id`, `building`, `amount`, `date_generated`, `due_date`, `bill_description`, `remarks`, `created_at`, `updated_at`) VALUES
(14, '7070', 'H-LGE-E', 'HARVARD', 7800.00, '2020-02-01', '2020-02-07', 'RENTAL FEE', NULL, '2020-02-07 02:50:18', '2020-02-07 02:50:18');

-- --------------------------------------------------------

--
-- Table structure for table `unitowners`
--

DROP TABLE IF EXISTS `unitowners`;
CREATE TABLE IF NOT EXISTS `unitowners` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `building` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `unitowners`
--

INSERT INTO `unitowners` (`id`, `name`, `email`, `mobile_no`, `building`, `unit_id`, `created_at`, `updated_at`) VALUES
(1, 'Adelia Botter Reyes', NULL, NULL, 'WHARTON', 'W-2F13', '2019-11-12 23:23:50', '2019-11-12 23:23:50'),
(2, 'Lorraine Congco', NULL, NULL, 'HARVARD', 'H-3LC-W', '2019-11-12 23:24:01', '2019-11-12 23:24:01'),
(3, 'Eileen-Gambito', NULL, NULL, 'HARVARD', 'H-GLL-E', '2019-11-12 23:24:07', '2019-11-12 23:24:07'),
(4, 'Paul Edgar Inso', NULL, NULL, 'HARVARD', 'H-5LQ-E', '2019-11-12 23:24:07', '2019-11-12 23:24:07'),
(5, 'Lorylynne Aquino', NULL, NULL, 'HARVARD', 'H-GLB-E', '2019-11-12 23:24:15', '2019-11-12 23:24:15'),
(6, 'Elgier-Caguioa', NULL, NULL, 'HARVARD', 'H-GLJ-E', '2019-11-12 23:24:24', '2019-11-12 23:24:24'),
(7, 'Agnes Alabang', 'agnes.ablang@palomarhealth.org', NULL, 'HARVARD', 'H-5LQ-W', '2019-11-12 23:24:26', '2019-11-12 23:24:26'),
(8, 'Luz Karleen Dela Cruz', NULL, NULL, 'HARVARD', 'H-5LD-W', '2019-11-12 23:24:29', '2019-11-12 23:24:29'),
(9, 'Paul Edgar Inso', NULL, NULL, 'HARVARD', 'H-4LO-W', '2019-11-12 23:24:29', '2019-11-12 23:24:29'),
(10, 'Elgier-Caguioa', NULL, NULL, 'HARVARD', 'H-GLK-E', '2019-11-12 23:24:44', '2019-11-12 23:24:44'),
(11, 'Luz Lokino', NULL, NULL, 'HARVARD', 'H-LGB-W', '2019-11-12 23:24:45', '2019-11-12 23:24:45'),
(12, 'Paul Edgar Inso', NULL, NULL, 'HARVARD', 'H-5LP-E', '2019-11-12 23:24:48', '2019-11-12 23:24:48'),
(13, 'Agnes Alabang', 'agnes.ablang@palomarhealth.org', NULL, 'HARVARD', 'H-5LR-W', '2019-11-12 23:24:54', '2019-11-12 23:24:54'),
(14, 'Emmanuel-Caburian', NULL, NULL, 'HARVARD', 'H-2LI-W', '2019-11-12 23:24:59', '2019-11-12 23:24:59'),
(15, 'Lydia Cruz', NULL, NULL, 'HARVARD', 'H-3LE-E', '2019-11-12 23:25:00', '2019-11-12 23:25:00'),
(16, 'Paul Edgar Inso', NULL, NULL, 'HARVARD', 'H-2LO-W', '2019-11-12 23:25:13', '2019-11-12 23:25:13'),
(17, 'Erlinda-Cruz', NULL, NULL, 'HARVARD', 'H-6LK-E', '2019-11-12 23:25:21', '2019-11-12 23:25:21'),
(18, 'Agnes Batenga', NULL, NULL, 'HARVARD', 'H-LGK-W', '2019-11-12 23:25:22', '2019-11-12 23:25:22'),
(19, 'Perico Pineda', NULL, NULL, 'PRINCETON', 'P-5F9', '2019-11-12 23:25:28', '2019-11-12 23:25:28'),
(20, 'Ma Theresa A. Saromines', 'mariatheresa7@icloud.com', '09165111912', 'HARVARD', 'H-6LL-W', '2019-11-12 23:25:35', '2019-11-12 23:25:35'),
(21, 'Eslao-Ma.-Concepcion-V.', NULL, NULL, 'PRINCETON', 'P-GFA', '2019-11-12 23:25:45', '2019-11-12 23:25:45'),
(22, 'Ma. Emma Aguimbag', NULL, NULL, 'HARVARD', 'H-LGD-E', '2019-11-12 23:25:47', '2019-11-12 23:25:47'),
(23, 'Aida Bothe', NULL, NULL, 'HARVARD', 'H-6LH-E', '2019-11-12 23:25:50', '2019-11-12 23:25:50'),
(24, 'Rachelle Gamurot Marquez', NULL, NULL, 'HARVARD', 'H-3LK-E', '2019-11-12 23:25:50', '2019-11-12 23:25:50'),
(25, 'Ma. Luisa Bautista', NULL, NULL, 'HARVARD', 'H-UGN-E', '2019-11-12 23:25:59', '2019-11-12 23:25:59'),
(26, 'Eslao,-Ma.-Concepcion-V.', NULL, NULL, 'PRINCETON', 'P-GF2', '2019-11-12 23:26:04', '2019-11-12 23:26:04'),
(27, 'Al Bulushi', NULL, NULL, 'PRINCETON', 'P-LGFA', '2019-11-12 23:26:07', '2019-11-12 23:26:07'),
(28, 'Madalyn Aquino', NULL, NULL, 'HARVARD', 'H-4LE-W', '2019-11-12 23:26:17', '2019-11-12 23:26:17'),
(29, 'Alcid Rommel', NULL, NULL, 'HARVARD', 'H-4LR-W', '2019-11-12 23:26:25', '2019-11-12 23:26:25'),
(30, 'Estrella-Abat-Dadis', NULL, NULL, 'PRINCETON', 'P-4F10', '2019-11-12 23:26:27', '2019-11-12 23:26:27'),
(31, 'Randolf Malto', NULL, NULL, 'WHARTON', 'W-3F10', '2019-11-12 23:26:32', '2019-11-12 23:26:32'),
(32, 'Manolito Chavez', NULL, NULL, 'HARVARD', 'H-LGO-E', '2019-11-12 23:26:34', '2019-11-12 23:26:34'),
(33, 'Aldren Arellano', NULL, NULL, 'PRINCETON', 'P-GF3', '2019-11-12 23:26:44', '2019-11-12 23:26:44'),
(34, 'Evangeline-Enriquez', NULL, NULL, 'HARVARD', 'H-2LD-E', '2019-11-12 23:26:45', '2019-11-12 23:26:45'),
(35, 'Ranelda E.Sales', NULL, NULL, 'HARVARD', 'H-GLM-E', '2019-11-12 23:26:52', '2019-11-12 23:26:52'),
(36, 'Evelia-Bamba', NULL, NULL, 'HARVARD', 'H-4LF-W', '2019-11-12 23:27:00', '2019-11-12 23:27:00'),
(37, 'Alex Navarro', NULL, NULL, 'HARVARD', 'H-5LF-E', '2019-11-12 23:27:03', '2019-11-12 23:27:03'),
(38, 'Marcela Limjoco', 'jlimjoco@aol.com', NULL, 'HARVARD', 'H-6LO-W', '2019-11-12 23:27:08', '2019-11-12 23:27:08'),
(39, 'Raquel Javier', NULL, NULL, 'PRINCETON', 'P-2FB', '2019-11-12 23:27:08', '2019-11-12 23:27:08'),
(40, 'Fe-Prado', NULL, NULL, 'PRINCETON', 'P-6FE', '2019-11-12 23:27:13', '2019-11-12 23:27:13'),
(41, 'Marcos De Vera Jr.', NULL, NULL, 'HARVARD', 'H-5LN-W', '2019-11-12 23:27:22', '2019-11-12 23:27:22'),
(42, 'Alexander Galeng', NULL, NULL, 'HARVARD', 'H-4LR-E', '2019-11-12 23:27:23', '2019-11-12 23:27:23'),
(43, 'Ferdinand-Benbenen', NULL, NULL, 'PRINCETON', 'P-LGFD', '2019-11-12 23:27:26', '2019-11-12 23:27:26'),
(44, 'Raymond Oribio', NULL, NULL, 'HARVARD', 'H-5LJ-E', '2019-11-12 23:27:29', '2019-11-12 23:27:29'),
(45, 'Marcos Durante', NULL, NULL, 'HARVARD', 'H-3LI-W', '2019-11-12 23:27:37', '2019-11-12 23:27:37'),
(46, 'Florencia Cabantac', NULL, NULL, 'PRINCETON', 'P-3FC', '2019-11-12 23:27:39', '2019-11-12 23:27:39'),
(47, 'Reimond Alex Gamurot', NULL, NULL, 'HARVARD', 'H-5LC W', '2019-11-12 23:27:43', '2019-11-12 23:27:43'),
(48, 'Allan Inde', NULL, NULL, 'HARVARD', 'H-LGP-E', '2019-11-12 23:27:46', '2019-11-12 23:27:46'),
(49, 'Florencia-Cabantac', NULL, NULL, 'PRINCETON', 'P-6FD', '2019-11-12 23:27:52', '2019-11-12 23:27:52'),
(50, 'Marcos Durante', NULL, NULL, 'HARVARD', 'H-GLD-W', '2019-11-12 23:27:58', '2019-11-12 23:27:58'),
(51, 'Remedios Dela cruz', NULL, NULL, 'HARVARD', 'H-4LK-E', '2019-11-12 23:27:59', '2019-11-12 23:27:59'),
(52, 'Florencia Cabantac', NULL, NULL, 'WHARTON', 'W-GF23', '2019-11-12 23:28:06', '2019-11-12 23:28:06'),
(53, 'Alma Cantuba', NULL, NULL, 'HARVARD', 'H-LGA-E', '2019-11-12 23:28:10', '2019-11-12 23:28:10'),
(54, 'Margaret Amangyen', 'mega_amangyen@yahoo.com', '09281721758', 'HARVARD', 'H-6LM-W', '2019-11-12 23:28:16', '2019-11-12 23:28:16'),
(55, 'Renato G Reyes', NULL, NULL, 'PRINCETON', 'P-4F6', '2019-11-12 23:28:20', '2019-11-12 23:28:20'),
(56, 'Margarita Mallari', NULL, NULL, 'PRINCETON', 'P-GFE', '2019-11-12 23:28:27', '2019-11-12 23:28:27'),
(57, 'Richard Dela Pena', NULL, NULL, 'HARVARD', 'H-3LC-E', '2019-11-12 23:28:37', '2019-11-12 23:28:37'),
(58, 'Ana Lea Mingoa', NULL, NULL, 'HARVARD', 'H-LGB-E', '2019-11-12 23:28:37', '2019-11-12 23:28:37'),
(59, 'Florida Batong', NULL, NULL, 'PRINCETON', 'P-GF-J', '2019-11-12 23:28:38', '2019-11-12 23:28:38'),
(60, 'Mariam T. Mendoza', 'maiyam88@hotmail.com', '09228474939', 'HARVARD', 'H-6LA-W', '2019-11-12 23:28:51', '2019-11-12 23:28:51'),
(61, 'Rizalinda Finones', NULL, NULL, 'WHARTON', 'W-GF19', '2019-11-12 23:28:51', '2019-11-12 23:28:51'),
(62, 'Andrea Ngoddo Nanam', NULL, NULL, 'PRINCETON', 'P-2FL', '2019-11-12 23:28:55', '2019-11-12 23:28:55'),
(63, 'Maricel Arcellana', NULL, NULL, 'HARVARD', 'H-2LB-E', '2019-11-12 23:29:07', '2019-11-12 23:29:07'),
(64, 'Robert Capuyan', NULL, NULL, 'HARVARD', 'H-6LO-E', '2019-11-12 23:29:12', '2019-11-12 23:29:12'),
(65, 'Frederick Untalan', NULL, NULL, 'HARVARD', 'H-UGE-E', '2019-11-12 23:29:14', '2019-11-12 23:29:14'),
(66, 'Angel Moses Michael', NULL, NULL, 'HARVARD', 'H-2LL-W', '2019-11-12 23:29:15', '2019-11-12 23:29:15'),
(67, 'Maricor Estillore', NULL, NULL, 'HARVARD', 'H-GLI-W', '2019-11-12 23:29:22', '2019-11-12 23:29:22'),
(68, 'Gerardo Antonio Carcamo', NULL, NULL, 'WHARTON', 'W-GF22', '2019-11-12 23:29:29', '2019-11-12 23:29:29'),
(69, 'Marilou Canlas', NULL, NULL, 'PRINCETON', 'P-GF7', '2019-11-12 23:29:30', '2019-11-12 23:29:30'),
(70, 'Anna Marie Oya - an', NULL, NULL, 'PRINCETON', 'P-UGFI', '2019-11-12 23:29:30', '2019-11-12 23:29:30'),
(71, 'Roberto Soriano', NULL, NULL, 'HARVARD', 'H-2LI-E', '2019-11-12 23:29:38', '2019-11-12 23:29:38'),
(72, 'Marilou Tingcawa', NULL, NULL, 'PRINCETON', 'P-2F6', '2019-11-12 23:29:42', '2019-11-12 23:29:42'),
(73, 'Gian Carlo Melad', NULL, NULL, 'HARVARD', 'H-UGG-E', '2019-11-12 23:29:47', '2019-11-12 23:29:47'),
(74, 'Anne Yvette Briones', NULL, NULL, 'PRINCETON', 'P-5FL-5FM', '2019-11-12 23:29:53', '2019-11-12 23:29:53'),
(75, 'Rodelia Bernabe', NULL, NULL, 'PRINCETON', 'P-3F8', '2019-11-12 23:29:55', '2019-11-12 23:29:55'),
(76, 'Gina D.Cervantes', NULL, NULL, 'HARVARD', 'H-3LN-E', '2019-11-12 23:30:01', '2019-11-12 23:30:01'),
(77, 'Annie Cawi', NULL, NULL, 'WHARTON', 'W-2F3', '2019-11-12 23:30:08', '2019-11-12 23:30:08'),
(78, 'Mariz Khristine Loma', NULL, NULL, 'HARVARD', 'H-3LH-W', '2019-11-12 23:30:12', '2019-11-12 23:30:12'),
(79, 'Grace Geneveve Bersamin', NULL, NULL, 'PRINCETON', 'P-UGF4', '2019-11-12 23:30:14', '2019-11-12 23:30:14'),
(80, 'Rodrigo Yu', NULL, NULL, 'HARVARD', 'H-GLR-E', '2019-11-12 23:30:16', '2019-11-12 23:30:16'),
(81, 'Grace Geneveve Bersamin', NULL, NULL, 'PRINCETON', 'P-5F13', '2019-11-12 23:30:24', '2019-11-12 23:30:24'),
(82, 'Antonio Nito', NULL, NULL, 'HARVARD', 'H-5LM-W', '2019-11-12 23:30:27', '2019-11-12 23:30:27'),
(83, 'Marjorie Galasgas', NULL, NULL, 'WHARTON', 'W-2F27', '2019-11-12 23:30:30', '2019-11-12 23:30:30'),
(84, 'Rodrigo Yu', NULL, NULL, 'PRINCETON', 'P-6FI', '2019-11-12 23:30:32', '2019-11-12 23:30:32'),
(85, 'Hazel Pitpit', NULL, NULL, 'WHARTON', 'W-3F21', '2019-11-12 23:30:34', '2019-11-12 23:30:34'),
(86, 'Mark Jayson Reyes', NULL, NULL, 'WHARTON', 'W-6F4', '2019-11-12 23:30:40', '2019-11-12 23:30:40'),
(87, 'Arnel Trinidad', NULL, NULL, 'PRINCETON', 'P-4FE', '2019-11-12 23:30:41', '2019-11-12 23:30:41'),
(88, 'Henry Aclipen', NULL, NULL, 'WHARTON', 'W-3F12', '2019-11-12 23:30:46', '2019-11-12 23:30:46'),
(89, 'Rogelio Suclad', NULL, NULL, 'HARVARD', 'H-2LM-E', '2019-11-12 23:30:48', '2019-11-12 23:30:48'),
(90, 'Marlyn Rimando', NULL, NULL, 'WHARTON', 'W-5F29', '2019-11-12 23:30:51', '2019-11-12 23:30:51'),
(91, 'Herbert S.Abille', NULL, NULL, 'PRINCETON', 'P-GFC', '2019-11-12 23:30:57', '2019-11-12 23:30:57'),
(92, 'Mary Ann Kiog', NULL, NULL, 'PRINCETON', 'P-3F5', '2019-11-12 23:31:03', '2019-11-12 23:31:03'),
(93, 'Rogelio Villaspir', NULL, NULL, 'HARVARD', 'H-GLE-E', '2019-11-12 23:31:05', '2019-11-12 23:31:05'),
(94, 'Honorato E.Adag', NULL, NULL, 'HARVARD', 'H-LGK-E', '2019-11-12 23:31:09', '2019-11-12 23:31:09'),
(95, 'Mary Ann Kiog', NULL, NULL, 'PRINCETON', 'P-3F6', '2019-11-12 23:31:10', '2019-11-12 23:31:10'),
(96, 'Arnold Pineda', NULL, NULL, 'PRINCETON', 'P-UGF2', '2019-11-12 23:31:13', '2019-11-12 23:31:13'),
(97, 'Rolando Iban', NULL, NULL, 'HARVARD', 'H-GLO-E', '2019-11-12 23:31:24', '2019-11-12 23:31:24'),
(98, 'Arnold Rosales', NULL, NULL, 'PRINCETON', 'P-4F11', '2019-11-12 23:31:25', '2019-11-12 23:31:25'),
(99, 'Imelda Paraoan', NULL, '09229926566', 'HARVARD', 'H-6LP-W', '2019-11-12 23:31:29', '2019-11-12 23:31:29'),
(100, 'Mary Ann Limpayos', 'noemailowner11@marthaservices.com', '09285504057', 'HARVARD', 'H-6LN-E', '2019-11-12 23:31:32', '2019-11-12 23:31:32'),
(101, 'Irma Grace Eg-an', NULL, NULL, 'WHARTON', 'W-3F14', '2019-11-12 23:31:40', '2019-11-12 23:31:40'),
(102, 'Mary Ann Magtira', NULL, NULL, 'PRINCETON', 'P-GF9', '2019-11-12 23:31:41', '2019-11-12 23:31:41'),
(103, 'Romel Bagtang', NULL, NULL, 'WHARTON', 'W-4F4', '2019-11-12 23:31:42', '2019-11-12 23:31:42'),
(104, 'Arthur Diwa', NULL, NULL, 'HARVARD', 'H-GLG-E', '2019-11-12 23:31:42', '2019-11-12 23:31:42'),
(105, 'Israel Vanguardia', NULL, NULL, 'PRINCETON', 'P-2F2', '2019-11-12 23:31:52', '2019-11-12 23:31:52'),
(106, 'Mary Ann Rimorin', NULL, NULL, 'HARVARD', 'H-5LL-W', '2019-11-12 23:31:54', '2019-11-12 23:31:54'),
(107, 'Babylyn C .Lee', NULL, NULL, 'PRINCETON', 'P-6F2', '2019-11-12 23:31:56', '2019-11-12 23:31:56'),
(108, 'Romeo B.Barcibal', NULL, NULL, 'HARVARD', 'H-3LG-W', '2019-11-12 23:31:58', '2019-11-12 23:31:58'),
(109, 'Janet Y. Cabello', NULL, NULL, 'PRINCETON', 'P-4F1', '2019-11-12 23:32:01', '2019-11-12 23:32:01'),
(110, 'Mary Ann Tiwanac', NULL, NULL, 'WHARTON', 'W-6F17', '2019-11-12 23:32:02', '2019-11-12 23:32:02'),
(111, 'Mary Greal Jacildone', NULL, NULL, 'WHARTON', 'W-5F6', '2019-11-12 23:32:08', '2019-11-12 23:32:08'),
(112, 'Janet Y. Cabello', NULL, NULL, 'PRINCETON', 'P-4F2', '2019-11-12 23:32:10', '2019-11-12 23:32:10'),
(113, 'Belinda Galo', NULL, NULL, 'HARVARD', 'H-LGH-W', '2019-11-12 23:32:12', '2019-11-12 23:32:12'),
(114, 'Romeo lodia', NULL, NULL, 'WHARTON', 'W-5F1', '2019-11-12 23:32:13', '2019-11-12 23:32:13'),
(115, 'Mateo Cefarino', NULL, NULL, 'WHARTON', 'W-3F28', '2019-11-12 23:32:19', '2019-11-12 23:32:19'),
(116, 'Jayme G.Bugayong', NULL, NULL, 'WHARTON', 'W-GF29', '2019-11-12 23:32:20', '2019-11-12 23:32:20'),
(117, 'Bernie Capistrano', NULL, NULL, 'PRINCETON', 'P-3F7', '2019-11-12 23:32:26', '2019-11-12 23:32:26'),
(118, 'Romeo Romualdo Tuanquin Jr', NULL, NULL, 'HARVARD', 'H-2LH-E', '2019-11-12 23:32:28', '2019-11-12 23:32:28'),
(119, 'Mayla Baguedgued', NULL, NULL, 'HARVARD', 'H-3LE-W', '2019-11-12 23:32:37', '2019-11-12 23:32:37'),
(120, 'Rosa Dilinila', NULL, NULL, 'WHARTON', 'W-5F8', '2019-11-12 23:32:41', '2019-11-12 23:32:41'),
(121, 'Jayniwen Lapniten', 'jaynewinlapniten@yahoo.com', '09351243517', 'HARVARD', 'H-6LR E', '2019-11-12 23:32:43', '2019-11-12 23:32:43'),
(122, 'Beth Dyquiangco', NULL, NULL, 'HARVARD', 'H-5LF-W', '2019-11-12 23:32:43', '2019-11-12 23:32:43'),
(123, 'Melanie C.Raga', NULL, NULL, 'PRINCETON', 'P-4F4', '2019-11-12 23:32:45', '2019-11-12 23:32:45'),
(124, 'Jennifer Chua', NULL, NULL, 'HARVARD', 'H-LGF-E', '2019-11-12 23:32:56', '2019-11-12 23:32:56'),
(125, 'Melanie Madayag', NULL, NULL, 'HARVARD', 'H-UGK-E', '2019-11-12 23:32:58', '2019-11-12 23:32:58'),
(126, 'Rosa Signo Capuno', NULL, NULL, 'HARVARD', 'H-UGC-W', '2019-11-12 23:32:58', '2019-11-12 23:32:58'),
(127, 'Blessie Galaboc', NULL, NULL, 'HARVARD', 'H-2LA-W', '2019-11-12 23:33:00', '2019-11-12 23:33:00'),
(128, 'Melinda S.Capil', NULL, NULL, 'WHARTON', 'W-3F9', '2019-11-12 23:33:08', '2019-11-12 23:33:08'),
(129, 'Jennifer Salangsang', NULL, NULL, 'HARVARD', 'H-LGC-E', '2019-11-12 23:33:10', '2019-11-12 23:33:10'),
(130, 'Rosalinda Del Socorro', NULL, NULL, 'HARVARD', 'H-4LD-W', '2019-11-12 23:33:16', '2019-11-12 23:33:16'),
(131, 'Brigida Claro', NULL, NULL, 'PRINCETON', 'P-6FJ', '2019-11-12 23:33:17', '2019-11-12 23:33:17'),
(132, 'Jeramie Bergonia', NULL, NULL, 'WHARTON', 'W-4F7', '2019-11-12 23:33:21', '2019-11-12 23:33:21'),
(133, 'Mercidita Limjoco', NULL, NULL, 'HARVARD', 'H-2LR-E', '2019-11-12 23:33:21', '2019-11-12 23:33:21'),
(134, 'Carina Castillo', NULL, NULL, 'WHARTON', 'W-GF11', '2019-11-12 23:33:31', '2019-11-12 23:33:31'),
(135, 'Michele Apiles', NULL, NULL, 'HARVARD', 'H-LGC-W', '2019-11-12 23:33:31', '2019-11-12 23:33:31'),
(136, 'Rosalinda Rosales', NULL, NULL, 'HARVARD', 'H-LGG-W', '2019-11-12 23:33:34', '2019-11-12 23:33:34'),
(137, 'Joeland Ilumin', NULL, NULL, 'PRINCETON', 'P-UGF12', '2019-11-12 23:33:35', '2019-11-12 23:33:35'),
(138, 'Milagrita Montero', NULL, NULL, 'PRINCETON', 'P-UGFM', '2019-11-12 23:33:41', '2019-11-12 23:33:41'),
(139, 'John Lizada', NULL, NULL, 'HARVARD', 'H-GLI-E', '2019-11-12 23:33:52', '2019-11-12 23:33:52'),
(140, 'Rosario Laranang', NULL, NULL, 'HARVARD', 'H-5LA-W', '2019-11-12 23:33:53', '2019-11-12 23:33:53'),
(141, 'Carmela Bansan', NULL, NULL, 'HARVARD', 'H-UGA-W', '2019-11-12 23:33:53', '2019-11-12 23:33:53'),
(142, 'Milagros Balajadia', NULL, NULL, 'HARVARD', 'H-3LP-W', '2019-11-12 23:33:56', '2019-11-12 23:33:56'),
(143, 'Rosario Santos', NULL, NULL, 'PRINCETON', 'P-4F3', '2019-11-12 23:34:04', '2019-11-12 23:34:04'),
(144, 'Min Jyong Suk', NULL, NULL, 'PRINCETON', 'P-2LGF-B', '2019-11-12 23:34:07', '2019-11-12 23:34:07'),
(145, 'John Paul Estillore', NULL, NULL, 'HARVARD', 'H-GLH-W', '2019-11-12 23:34:10', '2019-11-12 23:34:10'),
(146, 'Carmen Shiela Halunajan', NULL, NULL, 'HARVARD', 'H-GLM-W', '2019-11-12 23:34:16', '2019-11-12 23:34:16'),
(147, 'Rosemarie Cosue', NULL, NULL, 'HARVARD', 'H-3LJ-E', '2019-11-12 23:34:20', '2019-11-12 23:34:20'),
(148, 'Min Jyong Suk', NULL, NULL, 'PRINCETON', 'P-2LGF-C', '2019-11-12 23:34:23', '2019-11-12 23:34:23'),
(149, 'Johnson Tanyee', NULL, NULL, 'HARVARD', 'H-5LJ-W', '2019-11-12 23:34:25', '2019-11-12 23:34:25'),
(150, 'Roxy Grageda', NULL, NULL, 'WHARTON', 'W-2F2', '2019-11-12 23:34:32', '2019-11-12 23:34:32'),
(151, 'Carolyn Akilith', NULL, NULL, 'HARVARD', 'H-UGL-E', '2019-11-12 23:34:33', '2019-11-12 23:34:33'),
(152, 'Joleen darth L Saley', NULL, NULL, 'WHARTON', 'W-2F6', '2019-11-12 23:34:37', '2019-11-12 23:34:37'),
(153, 'Min Jyong Suk', NULL, NULL, 'PRINCETON', 'P-2LGF-D', '2019-11-12 23:34:39', '2019-11-12 23:34:39'),
(154, 'Ruel Dayao', NULL, NULL, 'HARVARD', 'H-3LD-W', '2019-11-12 23:34:45', '2019-11-12 23:34:45'),
(155, 'Jonathan Estrada', NULL, NULL, 'WHARTON', 'W-2F12', '2019-11-12 23:34:48', '2019-11-12 23:34:48'),
(156, 'Min Jyong Suk', NULL, NULL, 'PRINCETON', 'P-GFK', '2019-11-12 23:34:49', '2019-11-12 23:34:49'),
(157, 'Carolyn Akilith', NULL, NULL, 'PRINCETON', 'P-2FI', '2019-11-12 23:34:55', '2019-11-12 23:34:55'),
(158, 'Min Jyong Suk', NULL, NULL, 'PRINCETON', 'P-3FH', '2019-11-12 23:34:56', '2019-11-12 23:34:56'),
(159, 'Jonathan Lavarias', NULL, NULL, 'HARVARD', 'H-UGG-W', '2019-11-12 23:35:00', '2019-11-12 23:35:00'),
(160, 'Russell Estabillo', NULL, NULL, 'HARVARD', 'H-UGI-E', '2019-11-12 23:35:07', '2019-11-12 23:35:07'),
(161, 'Jonathan Robles', NULL, NULL, 'HARVARD', 'H-4LC', '2019-11-12 23:35:09', '2019-11-12 23:35:09'),
(162, 'Catherine Gomez', NULL, NULL, 'HARVARD', 'H-UGQ-E', '2019-11-12 23:35:10', '2019-11-12 23:35:10'),
(163, 'Mora Manuel', NULL, NULL, 'WHARTON', 'W-4F25', '2019-11-12 23:35:12', '2019-11-12 23:35:12'),
(164, 'Myreen Reyes', NULL, NULL, 'PRINCETON', 'P-4F5', '2019-11-12 23:35:19', '2019-11-12 23:35:19'),
(165, 'Joselito Domingo', NULL, NULL, 'HARVARD', 'H-UGP-E', '2019-11-12 23:35:22', '2019-11-12 23:35:22'),
(166, 'Ryan Anthony Fernandez', NULL, NULL, 'HARVARD', 'H-4LM-E', '2019-11-12 23:35:23', '2019-11-12 23:35:23'),
(167, 'Catherine Gondales', NULL, NULL, 'HARVARD', 'H-3LP-E', '2019-11-12 23:35:28', '2019-11-12 23:35:28'),
(168, 'Josie Peralta', NULL, NULL, 'HARVARD', 'H-5LC-E', '2019-11-12 23:35:33', '2019-11-12 23:35:33'),
(169, 'Nancy Ong Co', NULL, NULL, 'HARVARD', 'H-LGG-E', '2019-11-12 23:35:34', '2019-11-12 23:35:34'),
(170, 'Catherine Gondales', NULL, NULL, 'HARVARD', 'H-LGR-E', '2019-11-12 23:35:45', '2019-11-12 23:35:45'),
(171, 'Nenita Patao', NULL, NULL, 'HARVARD', 'H-3LA-E', '2019-11-12 23:35:47', '2019-11-12 23:35:47'),
(172, 'Josie Peralta', NULL, NULL, 'HARVARD', 'H-5LD-E', '2019-11-12 23:35:53', '2019-11-12 23:35:53'),
(173, 'Sarah Ico', NULL, NULL, 'PRINCETON', 'P-6F9', '2019-11-12 23:35:54', '2019-11-12 23:35:54'),
(174, 'Charles B. Cordero', NULL, NULL, 'HARVARD', 'H-3LO-W', '2019-11-12 23:35:59', '2019-11-12 23:35:59'),
(175, 'Nerissa L. Andaya', NULL, NULL, 'HARVARD', 'H-GLP-E', '2019-11-12 23:36:01', '2019-11-12 23:36:01'),
(176, 'P-5FK', NULL, NULL, 'PRINCETON', 'P-5FK', '2019-11-12 23:36:10', '2019-11-12 23:36:10'),
(177, 'Joy Ilumin', NULL, NULL, 'HARVARD', 'H-3LF-W', '2019-11-12 23:36:11', '2019-11-12 23:36:11'),
(178, 'Charlynne Jalandoni', NULL, NULL, 'PRINCETON', 'P-6FK', '2019-11-12 23:36:11', '2019-11-12 23:36:11'),
(179, 'Nora Uco Agmata', NULL, NULL, 'PRINCETON', 'P-5F7', '2019-11-12 23:36:12', '2019-11-12 23:36:12'),
(180, 'Cherry Antonette Dumalsin', NULL, NULL, 'WHARTON', 'W-5F18', '2019-11-12 23:36:22', '2019-11-12 23:36:22'),
(181, 'Juliet Flores', NULL, NULL, 'WHARTON', 'W-2F10', '2019-11-12 23:36:23', '2019-11-12 23:36:23'),
(182, 'Normita Abellera', NULL, NULL, 'HARVARD', 'H-4LJ-E', '2019-11-12 23:36:23', '2019-11-12 23:36:23'),
(183, 'Sheila Marie Yakap', NULL, NULL, 'HARVARD', 'H-GLO-W', '2019-11-12 23:36:26', '2019-11-12 23:36:26'),
(184, 'Ofelia Albidas', NULL, NULL, 'PRINCETON', 'P-UGFJ', '2019-11-12 23:36:34', '2019-11-12 23:36:34'),
(185, 'Cherry Lou M.Reyes', NULL, NULL, 'HARVARD', 'H-UGJ-W', '2019-11-12 23:36:35', '2019-11-12 23:36:35'),
(186, 'Karla Janina S.Ocampo', NULL, NULL, 'PRINCETON', 'P-2LGF-3', '2019-11-12 23:36:36', '2019-11-12 23:36:36'),
(187, 'Shella Marie Canoza', NULL, NULL, 'HARVARD', 'H-3LQ-E', '2019-11-12 23:36:43', '2019-11-12 23:36:43'),
(188, 'Orlando Asuncion', NULL, NULL, 'PRINCETON', 'P-LGF1', '2019-11-12 23:36:44', '2019-11-12 23:36:44'),
(189, 'Chudd Petten', NULL, NULL, 'PRINCETON', 'P-3FM', '2019-11-12 23:36:48', '2019-11-12 23:36:48'),
(190, 'Kenneth R.Lu', NULL, NULL, 'WHARTON', 'W-GF10', '2019-11-12 23:36:49', '2019-11-12 23:36:49'),
(191, 'Pamela Rose Regis', NULL, NULL, 'WHARTON', 'W-6F13', '2019-11-12 23:36:51', '2019-11-12 23:36:51'),
(192, 'Cindy Chong', NULL, NULL, 'HARVARD', 'H-UGR-E', '2019-11-12 23:37:05', '2019-11-12 23:37:05'),
(193, 'Kenneth Telford', NULL, NULL, 'HARVARD', 'H-5LK-E', '2019-11-12 23:37:06', '2019-11-12 23:37:06'),
(194, 'Shirmaine Areola', NULL, NULL, 'HARVARD', 'H-5LI-W', '2019-11-12 23:37:06', '2019-11-12 23:37:06'),
(195, 'Clarissa Mendoza', NULL, NULL, 'HARVARD', 'H-4LF-E', '2019-11-12 23:37:23', '2019-11-12 23:37:23'),
(196, 'Leila Coloma Daligues', NULL, NULL, 'HARVARD', 'H-5LH-W', '2019-11-12 23:37:23', '2019-11-12 23:37:23'),
(197, 'Silva Raquel', NULL, NULL, 'HARVARD', 'H-GLR-W', '2019-11-12 23:37:27', '2019-11-12 23:37:27'),
(198, 'Leo Oasay', NULL, NULL, 'HARVARD', 'H-LGQ E', '2019-11-12 23:37:36', '2019-11-12 23:37:36'),
(199, 'Cynthia Romero', NULL, NULL, 'PRINCETON', 'P-LGFK', '2019-11-12 23:37:37', '2019-11-12 23:37:37'),
(200, 'Silverio Cepe Jr.', NULL, NULL, 'PRINCETON', 'P-5F2', '2019-11-12 23:37:41', '2019-11-12 23:37:41'),
(201, 'Pamela Rose Regis', NULL, NULL, 'WHARTON', 'W-6F14', '2019-11-12 23:37:41', '2019-11-12 23:37:41'),
(202, 'Leonardo Maloom', NULL, NULL, 'HARVARD', 'H-2LN-W', '2019-11-12 23:37:49', '2019-11-12 23:37:49'),
(203, 'Daida Sagulo', NULL, NULL, 'WHARTON', 'W-6F5', '2019-11-12 23:37:51', '2019-11-12 23:37:51'),
(204, 'Patrick Concepcion', NULL, NULL, 'HARVARD', 'H-UGB-W', '2019-11-12 23:37:53', '2019-11-12 23:37:53'),
(205, 'Silverio Cepe Jr.', NULL, NULL, 'PRINCETON', 'P-6FF', '2019-11-12 23:37:54', '2019-11-12 23:37:54'),
(206, 'Leonora Locquiao', NULL, NULL, 'HARVARD', 'H-4LO-E', '2019-11-12 23:38:01', '2019-11-12 23:38:01'),
(207, 'Paul Edgar Inso', NULL, NULL, 'HARVARD', 'H-5LN-E', '2019-11-12 23:38:05', '2019-11-12 23:38:05'),
(208, 'Sonia Calvin Cabansi', NULL, NULL, 'PRINCETON', 'P-2FE', '2019-11-12 23:38:07', '2019-11-12 23:38:07'),
(209, 'Leticia Manuel Montales', NULL, NULL, 'PRINCETON', 'P-5FJ', '2019-11-12 23:38:12', '2019-11-12 23:38:12'),
(210, 'Daniel Rivera', NULL, NULL, 'PRINCETON', 'P-2FF', '2019-11-12 23:38:15', '2019-11-12 23:38:15'),
(211, 'Paul Edgar Inso', NULL, NULL, 'HARVARD', 'H-5LO-E', '2019-11-12 23:38:16', '2019-11-12 23:38:16'),
(212, 'Sonia Calvin Cabansi', NULL, NULL, 'PRINCETON', 'P-2FJ', '2019-11-12 23:38:24', '2019-11-12 23:38:24'),
(213, 'Liana T. Domingo', NULL, NULL, 'HARVARD', 'H-4LL-E', '2019-11-12 23:38:26', '2019-11-12 23:38:26'),
(214, 'Daniel Rivera', NULL, NULL, 'PRINCETON', 'P-2FG', '2019-11-12 23:38:34', '2019-11-12 23:38:34'),
(215, 'Ligaya W. Aquino', NULL, NULL, 'PRINCETON', 'P-2F11', '2019-11-12 23:38:36', '2019-11-12 23:38:36'),
(216, 'Ted Lazo', NULL, NULL, 'HARVARD', 'H-2LE-W', '2019-11-12 23:38:38', '2019-11-12 23:38:38'),
(217, 'Lorenzo Tiu', NULL, NULL, 'PRINCETON', 'P-5FA', '2019-11-12 23:38:46', '2019-11-12 23:38:46'),
(218, 'Venus Martije', NULL, NULL, 'WHARTON', 'W-4F20', '2019-11-12 23:38:51', '2019-11-12 23:38:51'),
(219, 'Delia Bequilla', NULL, NULL, 'HARVARD', 'H-5LP-W', '2019-11-12 23:38:51', '2019-11-12 23:38:51'),
(220, 'Delia Dangcalan', NULL, NULL, 'HARVARD', 'H-UGA-E', '2019-11-12 23:39:05', '2019-11-12 23:39:05'),
(221, 'Venus Martije', NULL, NULL, 'WHARTON', 'W-4F24', '2019-11-12 23:39:07', '2019-11-12 23:39:07'),
(222, 'Vermon De Guzman', NULL, NULL, 'WHARTON', 'W-2F18', '2019-11-12 23:39:20', '2019-11-12 23:39:20'),
(223, 'Diane Cajilog', NULL, NULL, 'HARVARD', 'H-UGO-E', '2019-11-12 23:39:25', '2019-11-12 23:39:25'),
(224, 'Vilma Tiwaken', NULL, NULL, 'PRINCETON', 'P-3LGF-B', '2019-11-12 23:39:34', '2019-11-12 23:39:34'),
(225, 'Dina Aquino Quintos', NULL, NULL, 'HARVARD', 'H-GLP-W', '2019-11-12 23:39:39', '2019-11-12 23:39:39'),
(226, 'Violeta C. Lorgren', NULL, NULL, 'WHARTON', 'W-4F1', '2019-11-12 23:39:45', '2019-11-12 23:39:45'),
(227, 'Dina Dansel', NULL, NULL, 'PRINCETON', 'P-GFI', '2019-11-12 23:39:51', '2019-11-12 23:39:51'),
(228, 'Violeta King', NULL, NULL, 'WHARTON', 'W-GF1', '2019-11-12 23:39:57', '2019-11-12 23:39:57'),
(229, 'Don Lee S. Macagba', NULL, NULL, 'PRINCETON', 'P-4F13', '2019-11-12 23:40:04', '2019-11-12 23:40:04'),
(230, 'Violeta King', NULL, NULL, 'WHARTON', 'W-5F30', '2019-11-12 23:40:11', '2019-11-12 23:40:11'),
(231, 'Edgie Anamong', NULL, NULL, 'PRINCETON', 'P-2FH', '2019-11-12 23:40:14', '2019-11-12 23:40:14'),
(232, 'Virgilio Sumait', NULL, NULL, 'WHARTON', 'W-2F9', '2019-11-12 23:40:22', '2019-11-12 23:40:22'),
(233, 'Edna Dilinila', NULL, NULL, 'WHARTON', 'W-4F8', '2019-11-12 23:40:26', '2019-11-12 23:40:26'),
(234, 'Virginia Rudio', NULL, NULL, 'PRINCETON', 'P-3FE', '2019-11-12 23:40:37', '2019-11-12 23:40:37'),
(235, 'Edna Ragandap', NULL, NULL, 'HARVARD', 'H-2LP-E', '2019-11-12 23:40:41', '2019-11-12 23:40:41'),
(236, 'Edna Ragandap', NULL, NULL, 'PRINCETON', 'P-6F12', '2019-11-12 23:40:51', '2019-11-12 23:40:51'),
(237, 'Virginita Yu', NULL, NULL, 'HARVARD', 'H-UGH-E', '2019-11-12 23:40:52', '2019-11-12 23:40:52'),
(238, 'Edward Kiat-ong', NULL, NULL, 'WHARTON', 'W-GF17', '2019-11-12 23:41:01', '2019-11-12 23:41:01'),
(239, 'Winston Agcon', NULL, NULL, 'WHARTON', 'W-6F15', '2019-11-12 23:41:05', '2019-11-12 23:41:05'),
(240, 'Yurhina Sabas', NULL, NULL, 'PRINCETON', 'P-4F12', '2019-11-12 23:41:17', '2019-11-12 23:41:17'),
(241, 'Zenaida D. Mendoza', NULL, NULL, 'HARVARD', 'H-2LP-W', '2019-11-12 23:41:39', '2019-11-12 23:41:39'),
(242, 'Clarissa Mendoza', NULL, NULL, 'HARVARD', 'H-4LF-E', '2019-11-12 23:45:07', '2019-11-12 23:45:07');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
CREATE TABLE IF NOT EXISTS `units` (
  `unit_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `floor_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `building` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`unit_id`, `unit_no`, `floor_no`, `building`, `status`, `updated_at`) VALUES
('H-2LA-W', '2LA-W', '2F', 'HARVARD', 'VACANT', NULL),
('H-2LB-E', '2LB-E', '2F', 'HARVARD', 'VACANT', NULL),
('H-2LD-E', '2LD-E', '2F', 'HARVARD', 'VACANT', NULL),
('H-2LE-W', '2LE-W', '2F', 'HARVARD', 'VACANT', NULL),
('H-2LH-E', '2LH-E', '2F', 'HARVARD', 'VACANT', NULL),
('H-2LI-E', '2LI-E', '2F', 'HARVARD', 'VACANT', NULL),
('H-2LI-W', '2LI-W', '2F', 'HARVARD', 'VACANT', NULL),
('H-2LL-W', '2LL-W', '2F', 'HARVARD', 'VACANT', NULL),
('H-2LM-E', '2LM-E', '2F', 'HARVARD', 'VACANT', NULL),
('H-2LN-W', '2LN-W', '2F', 'HARVARD', 'VACANT', NULL),
('H-2LO-W', '2LO-W', '2F', 'HARVARD', 'VACANT', NULL),
('H-2LP-E', '2LP-E', '2F', 'HARVARD', 'VACANT', NULL),
('H-2LP-W', '2LP-W', '2F', 'HARVARD', 'VACANT', NULL),
('H-2LR-E', '2LR-E', '2F', 'HARVARD', 'VACANT', NULL),
('H-3LA-E', '3LA-E', '3F', 'HARVARD', 'VACANT', NULL),
('H-3LC-E', '3LC-E', '3F', 'HARVARD', 'VACANT', NULL),
('H-3LC-W', '3LC-W', '3F', 'HARVARD', 'VACANT', NULL),
('H-3LD-W', '3LD-W', '3F', 'HARVARD', 'VACANT', NULL),
('H-3LE-E', '3LE-E', '3F', 'HARVARD', 'VACANT', NULL),
('H-3LE-W', '3LE-W', '3F', 'HARVARD', 'VACANT', NULL),
('H-3LF-W', '3LF-W', '3F', 'HARVARD', 'VACANT', NULL),
('H-3LG-W', '3LG-W', '3F', 'HARVARD', 'VACANT', NULL),
('H-3LH-W', '3LH-W', '3F', 'HARVARD', 'VACANT', NULL),
('H-3LI-W', '3LI-W', '3F', 'HARVARD', 'VACANT', NULL),
('H-3LJ-E', '3LJ-E', '3F', 'HARVARD', 'VACANT', NULL),
('H-3LK-E', '3LK-E', '3F', 'HARVARD', 'VACANT', NULL),
('H-3LN-E', '3LN-E', '3F', 'HARVARD', 'VACANT', NULL),
('H-3LO-W', '3LO-W', '3F', 'HARVARD', 'VACANT', NULL),
('H-3LP-E', '3LP-E', '3F', 'HARVARD', 'VACANT', NULL),
('H-3LP-W', '3LP-W', '3F', 'HARVARD', 'VACANT', NULL),
('H-3LQ-E', '3LQ-E', '3F', 'HARVARD', 'VACANT', NULL),
('H-4LC-E', '4LC-E', '4F', 'HARVARD', 'VACANT', NULL),
('H-4LD-W', '4LD-W', '4F', 'HARVARD', 'VACANT', NULL),
('H-4LE-W', '4LE-W', '4F', 'HARVARD', 'VACANT', NULL),
('H-4LF-E', '4LF-E', '4F', 'HARVARD', 'VACANT', NULL),
('H-4LF-W', '4LF-W', '4F', 'HARVARD', 'VACANT', NULL),
('H-4LG-E', '4LG-E', '4F', 'HARVARD', 'VACANT', NULL),
('H-4LJ-E', '4LJ-E', '4F', 'HARVARD', 'VACANT', NULL),
('H-4LK-E', '4LK-E', '4F', 'HARVARD', 'VACANT', NULL),
('H-4LL-E', '4LL-E', '4F', 'HARVARD', 'VACANT', NULL),
('H-4LM-E', '4LM-E', '4F', 'HARVARD', 'VACANT', NULL),
('H-4LO-E', '4LO-E', '4F', 'HARVARD', 'VACANT', NULL),
('H-4LO-W', '4LO-W', '4F', 'HARVARD', 'VACANT', NULL),
('H-4LP-E', '4LP-E', '4F', 'HARVARD', 'VACANT', NULL),
('H-4LR-E', '4LR-E', '4F', 'HARVARD', 'VACANT', NULL),
('H-4LR-W', '4LR-W', '4F', 'HARVARD', 'VACANT', NULL),
('H-5LA-W', '5LA-W', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LB-E', '5LB-E', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LC-E', '5LC-E', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LC-W', '5LC-W', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LD-E', '5LD-E', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LD-W', '5LD-W', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LF-E', '5LF-E', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LF-W', '5LF-W', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LH-W', '5LH-W', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LI-W', '5LI-W', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LJ-E', '5LJ-E', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LJ-W', '5LJ-W', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LK-E', '5LK-E', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LK-W', '5LK-W', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LL-W', '5LL-W', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LM-E', '5LM-E', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LM-W', '5LM-W', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LN-E', '5LN-E', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LN-W', '5LN-W', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LO-E', '5LO-E', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LP-E', '5LP-E', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LP-W', '5LP-W', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LQ-E', '5LQ-E', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LQ-W', '5LQ-W', '5F', 'HARVARD', 'VACANT', NULL),
('H-5LR-W', '5LR-W', '5F', 'HARVARD', 'VACANT', NULL),
('H-6LA-W', '6LA-W', '6F', 'HARVARD', 'VACANT', NULL),
('H-6LH-E', '6LH-E', '6F', 'HARVARD', 'VACANT', NULL),
('H-6LK-E', '6LK-E', '6F', 'HARVARD', 'VACANT', NULL),
('H-6LL-W', '6LL-W', '6F', 'HARVARD', 'VACANT', NULL),
('H-6LM-W', '6LM-W', '6F', 'HARVARD', 'VACANT', NULL),
('H-6LN-E', '6LN-E', '6F', 'HARVARD', 'VACANT', NULL),
('H-6LO-E', '6LO-E', '6F', 'HARVARD', 'VACANT', NULL),
('H-6LO-W', '6LO-W', '6F', 'HARVARD', 'VACANT', NULL),
('H-6LP-W', '6LP-W', '6F', 'HARVARD', 'VACANT', NULL),
('H-6LR-E', '6LR-E', '6F', 'HARVARD', 'VACANT', NULL),
('H-GLA-E', 'GLA-E', 'GF', 'HARVARD', 'VACANT', NULL),
('H-GLB-E', 'GLB-E', 'GF', 'HARVARD', 'VACANT', NULL),
('H-GLC-E', 'GLC-E', 'GF', 'HARVARD', 'VACANT', NULL),
('H-GLD-W', 'GLD-W', 'GF', 'HARVARD', 'VACANT', NULL),
('H-GLE-E', 'GLE-E', 'GF', 'HARVARD', 'VACANT', NULL),
('H-GLG-E', 'GLG-E', 'GF', 'HARVARD', 'VACANT', NULL),
('H-GLH-W', 'GLH-W', 'GF', 'HARVARD', 'VACANT', NULL),
('H-GLI-E', 'GLI-E', 'GF', 'HARVARD', 'VACANT', NULL),
('H-GLI-W', 'GLI-W', 'GF', 'HARVARD', 'VACANT', NULL),
('H-GLJ-E', 'GLJ-E', 'GF', 'HARVARD', 'VACANT', NULL),
('H-GLK-E', 'GLK-E', 'GF', 'HARVARD', 'VACANT', NULL),
('H-GLL-E', 'GLL-E', 'GF', 'HARVARD', 'VACANT', NULL),
('H-GLM-E', 'GLM-E', 'GF', 'HARVARD', 'VACANT', NULL),
('H-GLM-W', 'GLM-W', 'GF', 'HARVARD', 'VACANT', NULL),
('H-GLO-E', 'GLO-E', 'GF', 'HARVARD', 'VACANT', NULL),
('H-GLO-W', 'GLO-W', 'GF', 'HARVARD', 'VACANT', NULL),
('H-GLP-E', 'GLP-E', 'GF', 'HARVARD', 'VACANT', NULL),
('H-GLP-W', 'GLP-W', 'GF', 'HARVARD', 'VACANT', NULL),
('H-GLR-E', 'GLR-E', 'GF', 'HARVARD', 'VACANT', NULL),
('H-GLW-W', 'GLW-W', 'GF', 'HARVARD', 'VACANT', NULL),
('H-LGA-E', 'LGA-E', 'LGF', 'HARVARD', 'MOVING OUT', '2020-02-02'),
('H-LGB-E', 'LGB-E', 'LGF', 'HARVARD', 'MOVING OUT', '2020-02-02'),
('H-LGB-W', 'LGB-W', 'LGF', 'HARVARD', 'MOVING OUT', '2020-02-02'),
('H-LGC-E', 'LGC-E', 'LGF', 'HARVARD', 'MOVING OUT', '2020-02-03'),
('H-LGC-W', 'LGC-W', 'LGF', 'HARVARD', 'MOVING OUT', '2020-02-03'),
('H-LGE-E', 'LGE-E', 'LGF', 'HARVARD', 'OCCUPIED', '2020-02-04'),
('H-LGF-E', 'LGF-E', 'LGF', 'HARVARD', 'VACANT', '2020-02-04'),
('H-LGG-E', 'LGG-E', 'LGF', 'HARVARD', 'OCCUPIED', '2020-02-03'),
('H-LGG-W', 'LGG-W', 'LGF', 'HARVARD', 'VACANT', NULL),
('H-LGH-W', 'LGH-W', 'LGF', 'HARVARD', 'VACANT', NULL),
('H-LGK-E', 'LGK-E', 'LGF', 'HARVARD', 'MOVING OUT', '2020-02-03'),
('H-LGK-W', 'LGK-W', 'LGF', 'HARVARD', 'VACANT', NULL),
('H-LGO-E', 'LGO-E', 'LGF', 'HARVARD', 'VACANT', NULL),
('H-LGP-E', 'LGP-E', 'LGF', 'HARVARD', 'VACANT', NULL),
('H-LGQ-E', 'LGQ-E', 'LGF', 'HARVARD', 'VACANT', '2020-02-03'),
('H-UGA-E', 'UGA-E', 'UGF', 'HARVARD', 'VACANT', NULL),
('H-UGA-W', 'UGA-W', 'UGF', 'HARVARD', 'VACANT', NULL),
('H-UGB-W', 'UGB-W', 'UGF', 'HARVARD', 'VACANT', NULL),
('H-UGC-W', 'UGC-W', 'UGF', 'HARVARD', 'VACANT', NULL),
('H-UGE-E', 'UGE-E', 'UGF', 'HARVARD', 'VACANT', NULL),
('H-UGF-E', 'UGF-E', 'UGF', 'HARVARD', 'VACANT', NULL),
('H-UGG-E', 'UGG-E', 'UGF', 'HARVARD', 'VACANT', NULL),
('H-UGG-W', 'UGG-W', 'UGF', 'HARVARD', 'VACANT', NULL),
('H-UGH-E', 'UGH-E', 'UGF', 'HARVARD', 'VACANT', NULL),
('H-UGI-E', 'UGI-E', 'UGF', 'HARVARD', 'VACANT', NULL),
('H-UGJ-W', 'UGJ-W', 'UGF', 'HARVARD', 'VACANT', NULL),
('H-UGK-E', 'UGK-E', 'UGF', 'HARVARD', 'VACANT', NULL),
('H-UGL-E', 'UGL-E', 'UGF', 'HARVARD', 'VACANT', NULL),
('H-UGL-W', 'UGL-W', 'UGF', 'HARVARD', 'VACANT', NULL),
('H-UGN-E', 'UGN-E', 'UGF', 'HARVARD', 'VACANT', NULL),
('H-UGO-E', 'UGO-E', 'UGF', 'HARVARD', 'VACANT', NULL),
('H-UGP-E', 'UGP-E', 'UGF', 'HARVARD', 'VACANT', NULL),
('H-UGQ-E', 'UGQ-E', 'UGF', 'HARVARD', 'VACANT', NULL),
('H-UGR-E', 'UGR-E', 'UGF', 'HARVARD', 'VACANT', NULL),
('P-2F11', '2F11', '2F', 'PRINCETON', 'VACANT', NULL),
('P-2F2', '2F2', '2F', 'PRINCETON', 'VACANT', NULL),
('P-2F6', '2F6', '2F', 'PRINCETON', 'VACANT', NULL),
('P-2FB', '2FB', '2F', 'PRINCETON', 'VACANT', NULL),
('P-2FE', '2FE', '2F', 'PRINCETON', 'VACANT', NULL),
('P-2FF', '2FF', '2F', 'PRINCETON', 'VACANT', NULL),
('P-2FG', '2FG', '2F', 'PRINCETON', 'VACANT', NULL),
('P-2FH', '2FH', '2F', 'PRINCETON', 'VACANT', NULL),
('P-2FI', '2FI', '2F', 'PRINCETON', 'VACANT', NULL),
('P-2FJ', '2FJ', '2F', 'PRINCETON', 'VACANT', NULL),
('P-2FL', '2FL', '2F', 'PRINCETON', 'VACANT', NULL),
('P-2LGF-3', '2LGF-3', '2LB', 'PRINCETON', 'VACANT', NULL),
('P-2LGF-B', '2LGF-B', '2LB', 'PRINCETON', 'VACANT', NULL),
('P-2LGF-C', '2LGF-C', '2LB', 'PRINCETON', 'VACANT', NULL),
('P-2LGF-D', '2LGF-D', '2LB', 'PRINCETON', 'VACANT', NULL),
('P-3F12', '3F12', '3F', 'PRINCETON', 'VACANT', NULL),
('P-3F5', '3F5', '3F', 'PRINCETON', 'VACANT', NULL),
('P-3F6', '3F6', '3F', 'PRINCETON', 'VACANT', NULL),
('P-3F7', '3F7', '3F', 'PRINCETON', 'VACANT', NULL),
('P-3F8', '3F8', '3F', 'PRINCETON', 'VACANT', NULL),
('P-3FC', '3FC', '3F', 'PRINCETON', 'VACANT', NULL),
('P-3FE', '3FE', '3F', 'PRINCETON', 'VACANT', NULL),
('P-3FH', '3FH', '3F', 'PRINCETON', 'VACANT', NULL),
('P-3FM', '3FM', '3F', 'PRINCETON', 'VACANT', NULL),
('P-3LGF-B', '3LGF-B', '3LB', 'PRINCETON', 'VACANT', NULL),
('P-4F1', '4F1', '4F', 'PRINCETON', 'VACANT', NULL),
('P-4F10', '4F10', '4F', 'PRINCETON', 'VACANT', NULL),
('P-4F11', '4F11', '4F', 'PRINCETON', 'VACANT', NULL),
('P-4F12', '4F12', '4F', 'PRINCETON', 'VACANT', NULL),
('P-4F13', '4F13', '4F', 'PRINCETON', 'VACANT', NULL),
('P-4F2', '4F2', '4F', 'PRINCETON', 'VACANT', NULL),
('P-4F3', '4F3', '4F', 'PRINCETON', 'VACANT', NULL),
('P-4F4', '4F4', '4F', 'PRINCETON', 'VACANT', NULL),
('P-4F5', '4F5', '4F', 'PRINCETON', 'VACANT', NULL),
('P-4F6', '4F6', '4F', 'PRINCETON', 'VACANT', NULL),
('P-4FE', '4FE', '4F', 'PRINCETON', 'VACANT', NULL),
('P-5F13', '5F13', '5F', 'PRINCETON', 'VACANT', NULL),
('P-5F2', '5F2', '5F', 'PRINCETON', 'VACANT', NULL),
('P-5F7', '5F7', '5F', 'PRINCETON', 'VACANT', NULL),
('P-5F9', '5F9', '5F', 'PRINCETON', 'VACANT', NULL),
('P-5FA', '5FA', '5F', 'PRINCETON', 'VACANT', NULL),
('P-5FJ', '5FJ', '5F', 'PRINCETON', 'VACANT', NULL),
('P-5FK', '5FK', '5F', 'PRINCETON', 'VACANT', NULL),
('P-5FL', '5FL', '5F', 'PRINCETON', 'VACANT', NULL),
('P-5FM', '5FM', '5F', 'PRINCETON', 'VACANT', NULL),
('P-6F12', '6F12', '6F', 'PRINCETON', 'VACANT', NULL),
('P-6F2', '6F2', '6F', 'PRINCETON', 'VACANT', NULL),
('P-6F9', '6F9', '6F', 'PRINCETON', 'VACANT', NULL),
('P-6FD', '6FD', '6F', 'PRINCETON', 'VACANT', NULL),
('P-6FE', '6FE', '6F', 'PRINCETON', 'VACANT', NULL),
('P-6FF', '6FF', '6F', 'PRINCETON', 'VACANT', NULL),
('P-6FI', '6FI', '6F', 'PRINCETON', 'VACANT', NULL),
('P-6FJ', '6FJ', '6F', 'PRINCETON', 'VACANT', NULL),
('P-6FK', '6FK', '6F', 'PRINCETON', 'VACANT', NULL),
('P-GF2', 'GF2', 'GF', 'PRINCETON', 'VACANT', NULL),
('P-GF3', 'GF3', 'GF', 'PRINCETON', 'VACANT', NULL),
('P-GF7', 'GF7', 'GF', 'PRINCETON', 'VACANT', NULL),
('P-GF9', 'GF9', 'GF', 'PRINCETON', 'VACANT', NULL),
('P-GFA', 'GFA', 'GF', 'PRINCETON', 'VACANT', NULL),
('P-GFC', 'GFC', 'GF', 'PRINCETON', 'VACANT', NULL),
('P-GFE', 'GFE', 'GF', 'PRINCETON', 'VACANT', NULL),
('P-GFI', 'GFI', 'GF', 'PRINCETON', 'VACANT', NULL),
('P-GFJ', 'GFJ', 'GF', 'PRINCETON', 'VACANT', NULL),
('P-GFK', 'GFK', 'GF', 'PRINCETON', 'VACANT', NULL),
('P-LGF1', 'LGF1', 'LGF', 'PRINCETON', 'VACANT', NULL),
('P-LGFA', 'LGFA', 'LGF', 'PRINCETON', 'VACANT', NULL),
('P-LGFD', 'LGFD', 'LGF', 'PRINCETON', 'VACANT', NULL),
('P-LGFK', 'LGFK', 'LGF', 'PRINCETON', 'VACANT', NULL),
('P-UGF-12', 'UGF-12', 'UGF', 'PRINCETON', 'VACANT', NULL),
('P-UGF-4', 'UGF-4', 'UGF', 'PRINCETON', 'VACANT', NULL),
('P-UGF2', 'UGF2', 'UGF', 'PRINCETON', 'VACANT', NULL),
('P-UGFI', 'UGFI', 'UGF', 'PRINCETON', 'VACANT', NULL),
('P-UGFJ', 'UGFJ', 'UGF', 'PRINCETON', 'VACANT', NULL),
('W-2F10', '2F10', '2F', 'WHARTON', 'VACANT', NULL),
('W-2F12', '2F12', '2F', 'WHARTON', 'VACANT', NULL),
('W-2F13', '2F13', '2F', 'WHARTON', 'VACANT', NULL),
('W-2F18', '2F18', '2F', 'WHARTON', 'VACANT', NULL),
('W-2F2', '2F2', '2F', 'WHARTON', 'VACANT', NULL),
('W-2F27', '2F27', '2F', 'WHARTON', 'VACANT', NULL),
('W-2F3', '2F3', '2F', 'WHARTON', 'VACANT', NULL),
('W-3F10', '3F10', '3F', 'WHARTON', 'VACANT', NULL),
('W-3F12', '3F12', '3F', 'WHARTON', 'VACANT', NULL),
('W-3F14', '3F14', '3F', 'WHARTON', 'VACANT', NULL),
('W-3F21', '3F21', '3F', 'WHARTON', 'VACANT', NULL),
('W-3F28', '3F28', '3F', 'WHARTON', 'VACANT', NULL),
('W-3F9', '3F9', '3F', 'WHARTON', 'VACANT', NULL),
('W-4F1', '4F1', '4F', 'WHARTON', 'VACANT', NULL),
('W-4F20', '4F20', '4F', 'WHARTON', 'VACANT', NULL),
('W-4F24', '4F24', '4F', 'WHARTON', 'VACANT', NULL),
('W-4F25', '4F25', '4F', 'WHARTON', 'VACANT', NULL),
('W-4F4', '4F4', '4F', 'WHARTON', 'VACANT', NULL),
('W-4F7', '4F7', '4F', 'WHARTON', 'VACANT', NULL),
('W-4F8', '4F8', '4F', 'WHARTON', 'VACANT', NULL),
('W-5F1', '5F1', '5F', 'WHARTON', 'VACANT', NULL),
('W-5F18', '5F18', '5F', 'WHARTON', 'VACANT', NULL),
('W-5F29', '5F29', '5F', 'WHARTON', 'VACANT', NULL),
('W-5F30', '5F30', '5F', 'WHARTON', 'VACANT', NULL),
('W-5F6', '5F6', '5F', 'WHARTON', 'VACANT', NULL),
('W-5F8', '5F8', '5F', 'WHARTON', 'VACANT', NULL),
('W-6F13', '6F13', '6F', 'WHARTON', 'VACANT', NULL),
('W-6F14', '6F14', '6F', 'WHARTON', 'VACANT', NULL),
('W-6F15', '6F15', '6F', 'WHARTON', 'VACANT', NULL),
('W-6F17', '6F17', '6F', 'WHARTON', 'VACANT', NULL),
('W-6F4', '6F4', '6F', 'WHARTON', 'VACANT', NULL),
('W-6F5', '6F5', '6F', 'WHARTON', 'VACANT', NULL),
('W-GF1', 'GF1', 'GF', 'WHARTON', 'VACANT', NULL),
('W-GF10', 'GF10', 'GF', 'WHARTON', 'VACANT', NULL),
('W-GF11', 'GF11', 'GF', 'WHARTON', 'VACANT', NULL),
('W-GF17', 'GF17', 'GF', 'WHARTON', 'VACANT', NULL),
('W-GF19', 'GF19', 'GF', 'WHARTON', 'VACANT', NULL),
('W-GF22', 'GF22', 'GF', 'WHARTON', 'VACANT', NULL),
('W-GF23', 'GF23', 'GF', 'WHARTON', 'VACANT', NULL),
('W-GF29', 'GF29', 'GF', 'WHARTON', 'VACANT', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `unit_items`
--

DROP TABLE IF EXISTS `unit_items`;
CREATE TABLE IF NOT EXISTS `unit_items` (
  `item_id` bigint(20) NOT NULL,
  `unit_id` varchar(191) NOT NULL,
  `qty` int(20) NOT NULL,
  PRIMARY KEY (`item_id`,`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contract_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE','') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `contract_number`, `status`, `created_at`, `updated_at`) VALUES
(1, 'mike', 'mike@mike', '123456789', 'admin', NULL, 'ACTIVE', NULL, NULL),
(2, 'jeff', 'jeff@jeff', '123456789', 'billing', NULL, 'ACTIVE', NULL, NULL),
(3, 'drev', 'drev@drev', '123', 'keeper', NULL, 'ACTIVE', NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
