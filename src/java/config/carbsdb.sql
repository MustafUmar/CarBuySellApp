-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2018 at 03:02 PM
-- Server version: 10.1.16-MariaDB
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
(5, 'Umar', 'M', 'umar@example.com', '000000');

-- --------------------------------------------------------

--
-- Table structure for table `cardetails`
--

CREATE TABLE `cardetails` (
  `id` int(11) NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `mileage` int(11) NOT NULL,
  `engine` varchar(50) NOT NULL,
  `transmission` varchar(50) NOT NULL,
  `drivetrain` varchar(20) NOT NULL,
  `fueltype` varchar(20) NOT NULL,
  `bodytype` varchar(20) NOT NULL,
  `psng_count` int(10) UNSIGNED NOT NULL,
  `interior_color` varchar(20) NOT NULL,
  `exterior_color` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Table structure for table `models`
--

CREATE TABLE `models` (
  `id` int(11) NOT NULL,
  `car_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(155) NOT NULL,
  `added_by` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL
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
(5, 'umar@example.com', '$2a$10$yXOya67orvSTVOdwd7QnquppFRm5oBD1iQz/JnJktPL3EYq9DQECW', 5, 'ROLE_ADMIN');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `cardetails`
--
ALTER TABLE `cardetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `managers`
--
ALTER TABLE `managers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `models`
--
ALTER TABLE `models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
