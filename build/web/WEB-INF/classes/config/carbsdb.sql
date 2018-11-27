-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2018 at 01:41 AM
-- Server version: 10.3.8-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carbsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `cust_id` int(10) UNSIGNED DEFAULT NULL,
  `street` text NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `other_details` text DEFAULT NULL,
  `prev_owner` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `cust_id`, `street`, `city`, `state`, `country`, `other_details`, `prev_owner`) VALUES
(8, 1, 'Zone4', 'Abuja', 'FCT', 'Nigeria', '', 0),
(9, 1, 'Kawo', 'Kaduna', 'Kaduna', 'Nigeria', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `firstname`, `lastname`, `email`, `phone`) VALUES
(10, 'Umar', 'M', 'umar@example.com', '000000');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `address` varchar(225) NOT NULL,
  `city` varchar(80) DEFAULT NULL,
  `country` varchar(80) DEFAULT NULL,
  `geoloc` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `address`, `city`, `country`, `geoloc`) VALUES
(1, 'EastSide', 'Lagos', NULL, NULL, NULL),
(2, 'Southern', 'PH', NULL, NULL, NULL),
(7, 'Western', 'Uk', NULL, NULL, NULL),
(10, 'Skyline', 'Cotonou', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cardetails`
--

CREATE TABLE `cardetails` (
  `id` int(11) NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `branch_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(225) NOT NULL,
  `year` varchar(6) NOT NULL,
  `mileage` bigint(11) NOT NULL,
  `engine` varchar(50) NOT NULL,
  `transmission` varchar(50) NOT NULL,
  `drivetrain` varchar(20) NOT NULL,
  `fueltype` varchar(20) NOT NULL,
  `cartype` varchar(20) NOT NULL,
  `psng_count` int(10) UNSIGNED NOT NULL,
  `interior_color` varchar(100) NOT NULL,
  `exterior_color` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(15) NOT NULL,
  `neworused` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cardetails`
--

INSERT INTO `cardetails` (`id`, `model_id`, `branch_id`, `name`, `year`, `mileage`, `engine`, `transmission`, `drivetrain`, `fueltype`, `cartype`, `psng_count`, `interior_color`, `exterior_color`, `price`, `status`, `neworused`) VALUES
(2, 38, 10, '4.2 Spyder quattro', '2014', 7492, '4.2L V8 32V GDI DOHC', '7-shift automatic', 'AWD', 'Gasoline', 'Supercar', 2, 'Titanium Gray', 'Brilliant Red', 32400000, 'approved', 'new'),
(3, 38, 10, '5.2 quattro', '2010', 35503, '5.2L V10 40V GDI DOHC', '6-shift automatic', 'AWD', 'Gasoline', 'Supercar', 2, 'Luxor Beige', 'Blue Metallic', 27358200, 'approved', 'used'),
(4, 38, 10, 'V10', '2017', 17602, 'Premium Unleaded V-10 5.2 L/318', '7-shift manual', 'AWD', 'Gasoline', 'Supercar', 2, 'Black', 'Ara Blue Crystal Effect', 44999640, 'approved', 'new'),
(5, 49, 10, '4.0T Plus quattro', '2017', 17322, '4.0L V8 32V GDI DOHC Twin Turbo', '8-shift automatic', 'AWD', 'Gasoline', 'Sedan', 4, 'Black / Arras Red', 'Glacier White Metallic', 32328000, 'approved', 'new'),
(6, 60, 10, 'M235 i', '2014', 6137, '3.0L I6 24V GDI DOHC Turbo', '8-shift automatic', 'RWD', 'Gasoline', 'Sedan', 4, 'Black', 'Mineral Gray Metallic', 9716400, 'approved', 'used'),
(7, 60, 10, 'M5 Base', '2018', 236, '4.4L V8 32V GDI DOHC Twin Turbo', '8-shift automatic', 'AWD', 'Gasoline', 'Sedan', 4, 'Smoke White / Black', 'Alpine White', 45531000, 'approved', 'new'),
(8, 60, 10, 'M5 Base', '2015', 62627, 'Twin Turbo Premium Unleaded V-8 4.4 L/268', '7-shift automatic', 'RWD', 'Gasoline', 'Sedan', 4, 'Black', 'Monte Carlo Blue Metallic', 16194600, 'approved', 'used'),
(9, 67, 10, 'Italia', '2014', 1543, 'Premium Unleaded V-8 4.5 L/275', '7-shift manual', 'RWD', 'Gasoline', 'Supercar', 2, 'Nero', ' Bianco Avus', 82076400, 'approved', 'new'),
(10, 84, 10, 'FF', '2015', 12307, 'Premium Unleaded V-12 6.3 L/382', '7-shift manual', 'RWD', 'Gasoline', 'Supercar', 2, 'Nero', 'Nero Daytona Metallic', 63716400, 'approved', 'used'),
(11, 87, 10, 'EX-L', '2016', 13363, '2.4L 4 Cyl', '5-shift automatic', 'FWD', 'Gasoline', 'Sedan', 4, 'Black', 'Crystal Black Pearl', 7722000, 'approved', 'used'),
(12, 88, 10, 'LX', '2016', 23400, '2.0L I4 16V MPFI DOHC', 'Automatic CVT', 'FWD', 'Gasoline', 'Sedan', 4, 'Black', 'Silver', 5364000, 'approved', 'used'),
(13, 171, 10, 'LX', '2017', 6178, '2.4L I4 16V GDI DOHC', 'Automatic CVT', 'AWD', 'Gasoline', 'SUV', 4, 'Gray', 'Gunmetal Metallic', 7776000, 'approved', 'used'),
(14, 107, 10, 'C 43 Base 4MATIC', '2017', 13356, '3.0L V6 24V GDI DOHC Twin Turbo', '9-shift automatic', 'AWD', 'Gasoline', 'Sedan', 4, 'Black', 'Black', 17208000, 'approved', 'used'),
(15, 125, 10, 'S 550 4MATIC', '2016', 14328, '4.7L Biturbo V8 Engine', '8-shift automatic', 'AWD', 'Gasoline', 'Sedan', 4, 'Black', 'Iridium Silver Metallic', 28728000, 'approved', 'used'),
(16, 135, 10, 'SE', '2015', 35698, '2.5L I4 16V MPFI DOHC', '6-shift automatic', 'FWD', 'Gasoline', 'Sedan', 4, 'Black', 'Predawn Gray Mica', 6113880, 'approved', 'used'),
(17, 137, 10, 'S Plus', '2015', 83573, '4 Cylinder', '5-shift manual', 'FWD', 'Gasoline', 'Sedan', 4, 'Black', 'Alpine White', 3940920, 'approved', 'used'),
(18, 135, 10, 'LE', '2017', 14642, '2.5L I4 16V PDI DOHC', '8-shift automatic', 'FWD', 'Gasoline', 'Sedan', 4, 'Black', 'Celestial Silver Metallic', 6767640, 'approved', 'used');

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `make` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `make`) VALUES
(1, 'Abarth'),
(2, 'Alfa Romeo'),
(3, 'Aston martin'),
(4, 'Audi'),
(5, 'Bentley'),
(6, 'BMW'),
(7, 'Bugatti'),
(8, 'Cadillac'),
(9, 'Chevrolet'),
(10, 'Chrysler'),
(11, 'Citroen'),
(12, 'Corvette'),
(13, 'Dacia'),
(14, 'Daewoo'),
(15, 'Daihatsu'),
(16, 'Daimler'),
(17, 'Datsun'),
(18, 'Dodge'),
(19, 'DS'),
(20, 'Ferrari'),
(21, 'Fiat'),
(22, 'Ford'),
(23, 'FSO'),
(24, 'Honda'),
(25, 'Hummer'),
(26, 'Hyundai'),
(27, 'Infiniti'),
(28, 'Innocenti'),
(29, 'Jaguar'),
(30, 'Jeep'),
(31, 'Kia'),
(32, 'Lamborghini'),
(33, 'Lancia'),
(34, 'Land Rover'),
(35, 'Landwind'),
(36, 'Lexus'),
(37, 'Lincoln'),
(38, 'Lotus'),
(39, 'Marcos'),
(40, 'Maserati'),
(41, 'Maybach'),
(42, 'Mazda'),
(43, 'McLaren'),
(44, 'Mega'),
(45, 'Mercedes'),
(46, 'Mercury'),
(47, 'MG'),
(48, 'Mini'),
(49, 'Mitsubishi'),
(50, 'Morgan'),
(51, 'Morris'),
(52, 'Nissan'),
(53, 'Noble'),
(54, 'Opel'),
(55, 'Peugeot'),
(56, 'PGO'),
(57, 'Pontiac'),
(58, 'Porche'),
(59, 'Renault'),
(60, 'Rolls-Royce'),
(61, 'Rover'),
(62, 'Saab'),
(63, 'Seat'),
(64, 'Skoda'),
(65, 'Smart'),
(66, 'Spectre'),
(67, 'Subaru'),
(68, 'Suzuki'),
(69, 'Talbot'),
(70, 'Tesla'),
(71, 'Think'),
(72, 'Toyota'),
(73, 'Triumph'),
(74, 'TVR'),
(75, 'Volkswagen'),
(76, 'Volvo'),
(77, 'Yugo');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `firstname` varchar(155) NOT NULL,
  `lastname` varchar(155) NOT NULL,
  `phone_num` varchar(155) NOT NULL,
  `email` varchar(155) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `firstname`, `lastname`, `phone_num`, `email`, `password`) VALUES
(1, 'Fill', 'Up', '111222', 'fill@example.com', '$2a$10$Ueufu0U9oDAwVv1nZeTH7.sUUi79nYV3jr1MrnHWZPCMUftLYrT9q');

-- --------------------------------------------------------

--
-- Table structure for table `customer_orders`
--

CREATE TABLE `customer_orders` (
  `id` int(11) NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `cardet_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_orders`
--

INSERT INTO `customer_orders` (`id`, `order_id`, `cardet_id`) VALUES
(41, 21, 2),
(42, 21, 6),
(43, 22, 11);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `firstname` varchar(155) NOT NULL,
  `lastname` varchar(155) NOT NULL,
  `email` varchar(155) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `mgr_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `managers`
--

CREATE TABLE `managers` (
  `id` int(11) NOT NULL,
  `branch_id` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(155) NOT NULL,
  `lastname` varchar(155) NOT NULL,
  `email` varchar(155) NOT NULL,
  `phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `managers`
--

INSERT INTO `managers` (`id`, `branch_id`, `firstname`, `lastname`, `email`, `phone`) VALUES
(2, 7, 'Abba', 'Tete', 'abba@example.com', '111222'),
(3, 10, 'Mustapha', 'Umar', 'um@example.com', '111111');

-- --------------------------------------------------------

--
-- Table structure for table `models`
--

CREATE TABLE `models` (
  `id` int(11) NOT NULL,
  `carid` int(10) UNSIGNED NOT NULL,
  `name` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `models`
--

INSERT INTO `models` (`id`, `carid`, `name`) VALUES
(15, 2, '164'),
(16, 2, '4C'),
(17, 2, '4C Spider'),
(18, 2, '8c Competizione'),
(19, 2, '8c Spider'),
(20, 2, 'Guilia'),
(21, 2, 'Spider'),
(22, 2, 'Stelvio'),
(23, 3, 'DB7'),
(24, 3, 'DB9'),
(25, 3, 'Vantage'),
(26, 3, 'Vanquish'),
(27, 4, 'A3'),
(28, 4, 'A4'),
(29, 4, 'A5'),
(30, 4, 'A6'),
(31, 4, 'A7'),
(32, 4, 'A8'),
(33, 4, 'Q3'),
(34, 4, 'Q5'),
(35, 4, 'Q7'),
(36, 4, 'Q8'),
(37, 4, 'Quattro'),
(38, 4, 'R8'),
(39, 4, 'RS 3'),
(40, 4, 'RS 4'),
(41, 4, 'RS 5'),
(42, 4, 'RS 6'),
(43, 4, 'RS 7'),
(44, 4, 'S3'),
(45, 4, 'S4'),
(46, 4, 'S5'),
(47, 4, 'S6'),
(48, 4, 'S7'),
(49, 4, 'S8'),
(50, 4, 'TT'),
(51, 4, 'TT RS'),
(52, 6, '1-series'),
(53, 6, '2-series'),
(54, 6, '3-series'),
(55, 6, '4-series'),
(56, 6, '5-series'),
(57, 6, '6-series'),
(58, 6, '7-series'),
(59, 6, '8-series'),
(60, 6, 'M-series'),
(61, 6, 'X-series'),
(62, 20, '348'),
(63, 20, '360 Modena'),
(64, 20, '360 Spider'),
(65, 20, '456 GT'),
(66, 20, '456 M'),
(67, 20, '458 Italia'),
(68, 20, '458 Spider'),
(69, 20, '488 Spider'),
(70, 20, '512 M'),
(71, 20, '512 TR'),
(72, 20, '550'),
(73, 20, '575 M'),
(74, 20, '599'),
(75, 20, '612 Scaglietti'),
(76, 20, 'California'),
(77, 20, 'Challenge Stradale'),
(78, 20, 'Enzo'),
(79, 20, 'F12berlinetta'),
(80, 20, 'F355'),
(81, 20, 'F40'),
(82, 20, 'F430'),
(83, 20, 'F50'),
(84, 20, 'FF'),
(85, 20, 'Mondial'),
(86, 20, 'Testarossa'),
(87, 24, 'Accord'),
(88, 24, 'Civic'),
(89, 24, 'Crosstaur'),
(90, 24, 'Element'),
(91, 24, 'Odyssey'),
(92, 24, 'Pilot'),
(93, 24, 'Prelude'),
(94, 36, 'ES'),
(95, 36, 'GS'),
(96, 36, 'GX'),
(97, 36, 'IS'),
(98, 36, 'LC'),
(99, 36, 'LFA'),
(100, 36, 'LS'),
(101, 36, 'LX'),
(102, 36, 'NX'),
(103, 36, 'RC'),
(104, 36, 'RX'),
(105, 36, 'SC'),
(106, 45, '190'),
(107, 45, 'AMG'),
(108, 45, 'B-Class'),
(109, 45, 'C'),
(110, 45, 'CL-Class'),
(111, 45, 'CLA'),
(112, 45, 'CLK'),
(113, 45, 'CLS'),
(114, 45, 'E'),
(115, 45, 'G'),
(116, 45, 'GL'),
(117, 45, 'GLA'),
(118, 45, 'GLC'),
(119, 45, 'GLE'),
(120, 45, 'GLK'),
(121, 45, 'GLS'),
(122, 45, 'M-Class'),
(123, 45, 'Maybach'),
(124, 45, 'R-Class'),
(125, 45, 'S'),
(126, 45, 'SL'),
(127, 45, 'SLC'),
(128, 45, 'SLK'),
(129, 45, 'SLR'),
(130, 45, 'SLS'),
(131, 45, 'Sprinter'),
(132, 72, '4Runner'),
(133, 72, '86'),
(134, 72, 'Avalon'),
(135, 72, 'Camry'),
(136, 72, 'Celica'),
(137, 72, 'Corolla'),
(138, 72, 'Cressida'),
(139, 72, 'Highlander'),
(140, 72, 'Land Cruzer'),
(141, 72, 'Matrix'),
(142, 72, 'Mirai'),
(143, 72, 'MR2'),
(144, 72, 'Pickup'),
(145, 72, 'Previa'),
(146, 72, 'Prius'),
(147, 72, 'RAV4'),
(148, 72, 'Sequioa'),
(149, 72, 'Sienna'),
(150, 72, 'Tacoma'),
(151, 72, 'Tundra'),
(152, 72, 'Venza'),
(153, 72, 'Yaris'),
(154, 75, 'Atlas'),
(155, 75, 'Beetle'),
(156, 75, 'Cabrio'),
(157, 75, 'CC'),
(158, 75, 'Corado'),
(159, 75, 'Eurovan'),
(160, 75, 'Fox'),
(161, 75, 'GLI'),
(162, 75, 'Golf'),
(163, 75, 'Golf GTI'),
(164, 75, 'GTI'),
(165, 75, 'Jetta'),
(166, 75, 'Passat'),
(167, 75, 'Phaeton'),
(168, 75, 'R32'),
(169, 75, 'Tiguan'),
(170, 75, 'Touareg'),
(171, 24, 'CR-V');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_number` varchar(265) NOT NULL,
  `cust_id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(10) UNSIGNED NOT NULL,
  `order_status` varchar(12) NOT NULL,
  `totalprice` decimal(12,2) NOT NULL,
  `date_order` datetime NOT NULL,
  `cancel_reason` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `cust_id`, `payment_id`, `order_status`, `totalprice`, `date_order`, `cancel_reason`) VALUES
(21, '69364349764', 1, 21, 'CANCELED', '42116400.00', '2018-11-25 19:09:24', 'Found a better deal.'),
(22, '75052719201', 1, 22, 'PENDING', '7722000.00', '2018-11-27 00:30:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_delivery`
--

CREATE TABLE `order_delivery` (
  `id` int(11) NOT NULL,
  `order_id` int(11) UNSIGNED NOT NULL,
  `address_id` int(10) UNSIGNED NOT NULL,
  `delivery_man` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(12) NOT NULL,
  `begin_date` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `date_delivered` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_delivery`
--

INSERT INTO `order_delivery` (`id`, `order_id`, `address_id`, `delivery_man`, `status`, `begin_date`, `duration`, `date_delivered`) VALUES
(18, 21, 8, NULL, 'PENDING', NULL, 0, NULL),
(19, 22, 8, NULL, 'PENDING', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `charge_id` varchar(100) NOT NULL,
  `service` varchar(100) NOT NULL,
  `status` varchar(15) NOT NULL,
  `amount` decimal(14,2) NOT NULL,
  `paymentDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `customer_id`, `charge_id`, `service`, `status`, `amount`, `paymentDate`) VALUES
(21, 1, '6b0805ce13fd', 'psp1', 'PAID', '42116400.00', '2018-11-25 19:09:47'),
(22, 1, '32f67af6a928', 'psp1', 'PAID', '7722000.00', '2018-11-27 00:31:25');

-- --------------------------------------------------------

--
-- Table structure for table `soldcars`
--

CREATE TABLE `soldcars` (
  `id` int(11) NOT NULL,
  `make_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `branch_id` int(10) UNSIGNED NOT NULL,
  `carname` varchar(250) NOT NULL,
  `caryear` varchar(6) NOT NULL,
  `mileage` bigint(20) NOT NULL,
  `engine` varchar(100) NOT NULL,
  `transmission` varchar(100) NOT NULL,
  `drivetrain` varchar(50) NOT NULL,
  `fueltype` varchar(20) NOT NULL,
  `cartype` varchar(50) NOT NULL,
  `psng_count` int(11) NOT NULL,
  `interior_color` varchar(100) NOT NULL,
  `exterior_color` varchar(100) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `status` varchar(20) NOT NULL,
  `neworused` varchar(8) NOT NULL,
  `buyer_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(155) NOT NULL,
  `password` varchar(255) NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `role` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `userid`, `role`) VALUES
(11, 'umar@example.com', '$2a$10$QuED3aSlRDFGuJRB.Hw02uVjWS63.hhvWZe8PTVDc0./pyuL4A6DS', 10, 'ROLE_ADMIN'),
(12, 'abba@example.com', '$2a$10$bUG5iZ6kVEdCuovV1ViaYuknymjP0JZUbiNVSiHel/oTd.hZbxGTu', 2, 'ROLE_MANAGER'),
(13, 'um@example.com', '$2a$10$p.IFC9cKCnCpeqM/vydScORYNXNysIWidTxs4E8NWsHvvgxZmB/ca', 3, 'ROLE_MANAGER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cardetails`
--
ALTER TABLE `cardetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_orders`
--
ALTER TABLE `customer_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `managers`
--
ALTER TABLE `managers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`);

--
-- Indexes for table `order_delivery`
--
ALTER TABLE `order_delivery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `charge_id` (`charge_id`);

--
-- Indexes for table `soldcars`
--
ALTER TABLE `soldcars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `cardetails`
--
ALTER TABLE `cardetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `customer_orders`
--
ALTER TABLE `customer_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `managers`
--
ALTER TABLE `managers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `models`
--
ALTER TABLE `models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `order_delivery`
--
ALTER TABLE `order_delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `soldcars`
--
ALTER TABLE `soldcars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
