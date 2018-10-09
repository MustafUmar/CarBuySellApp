-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2018 at 06:08 AM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
