-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2024 at 02:24 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `freitag`
--

-- --------------------------------------------------------

--
-- Table structure for table `extra`
--

CREATE TABLE `extra` (
  `name` varchar(50) NOT NULL,
  `preis` int(11) NOT NULL,
  `id_extra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `extra`
--

INSERT INTO `extra` (`name`, `preis`, `id_extra`) VALUES
('grafik', 89, 1),
('ssd', 99, 2);

-- --------------------------------------------------------

--
-- Table structure for table `hersteller`
--

CREATE TABLE `hersteller` (
  `id_hersteller` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hersteller`
--

INSERT INTO `hersteller` (`id_hersteller`, `name`) VALUES
(1, 'nvdia');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `id_model` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `prozessor` varchar(50) NOT NULL,
  `ram` int(11) NOT NULL,
  `speicher` int(11) NOT NULL,
  `preis` int(11) NOT NULL,
  `bild` varchar(50) DEFAULT NULL,
  `beschreibung` varchar(500) DEFAULT NULL,
  `shortdesc` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`id_model`, `name`, `prozessor`, `ram`, `speicher`, `preis`, `bild`, `beschreibung`, `shortdesc`) VALUES
(1, 'Home Basis', 'i3', 8, 500, 498, 'bild1.jpg', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et e', 'Lorem ipsum dolor sit amet, consetetur sadipscing '),
(2, 'Home Pro', 'i5', 8, 500, 599, 'bild2.jpg', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et e', 'Lorem ipsum dolor sit amet, consetetur sadipscing '),
(3, 'Home Chief', 'i7', 16, 500, 799, 'bild3.jpg', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et e', 'Lorem ipsum dolor sit amet, consetetur sadipscing ');

-- --------------------------------------------------------

--
-- Table structure for table `reseller`
--

CREATE TABLE `reseller` (
  `id_reseller` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reseller`
--

INSERT INTO `reseller` (`id_reseller`, `name`) VALUES
(1, 'mediamarkt'),
(2, 'saturn'),
(3, 'gamepro'),
(4, 'homesweet');

-- --------------------------------------------------------

--
-- Table structure for table `verkauf`
--

CREATE TABLE `verkauf` (
  `id_transaction` int(11) NOT NULL,
  `id_hersteller` int(11) NOT NULL,
  `id_reseller` int(11) NOT NULL,
  `id_model` int(11) NOT NULL,
  `id_extra` int(11) DEFAULT NULL,
  `datum` date NOT NULL,
  `anzal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `verkauf`
--

INSERT INTO `verkauf` (`id_transaction`, `id_hersteller`, `id_reseller`, `id_model`, `id_extra`, `datum`, `anzal`) VALUES
(2, 1, 1, 1, NULL, '2024-03-08', 5),
(3, 1, 2, 1, NULL, '2024-03-08', 2),
(4, 1, 1, 3, NULL, '2024-03-08', 8),
(5, 1, 3, 2, NULL, '2024-03-08', 10),
(6, 1, 4, 1, NULL, '2024-03-08', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `extra`
--
ALTER TABLE `extra`
  ADD PRIMARY KEY (`id_extra`);

--
-- Indexes for table `hersteller`
--
ALTER TABLE `hersteller`
  ADD PRIMARY KEY (`id_hersteller`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`id_model`);

--
-- Indexes for table `reseller`
--
ALTER TABLE `reseller`
  ADD PRIMARY KEY (`id_reseller`);

--
-- Indexes for table `verkauf`
--
ALTER TABLE `verkauf`
  ADD PRIMARY KEY (`id_transaction`),
  ADD KEY `id_hersteller` (`id_hersteller`),
  ADD KEY `id_reseller` (`id_reseller`),
  ADD KEY `id_model` (`id_model`),
  ADD KEY `verkauf_ibfk_4` (`id_extra`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `extra`
--
ALTER TABLE `extra`
  MODIFY `id_extra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hersteller`
--
ALTER TABLE `hersteller`
  MODIFY `id_hersteller` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `model`
--
ALTER TABLE `model`
  MODIFY `id_model` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `reseller`
--
ALTER TABLE `reseller`
  MODIFY `id_reseller` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `verkauf`
--
ALTER TABLE `verkauf`
  MODIFY `id_transaction` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `verkauf`
--
ALTER TABLE `verkauf`
  ADD CONSTRAINT `verkauf_ibfk_1` FOREIGN KEY (`id_hersteller`) REFERENCES `hersteller` (`id_hersteller`),
  ADD CONSTRAINT `verkauf_ibfk_2` FOREIGN KEY (`id_reseller`) REFERENCES `reseller` (`id_reseller`),
  ADD CONSTRAINT `verkauf_ibfk_3` FOREIGN KEY (`id_model`) REFERENCES `model` (`id_model`),
  ADD CONSTRAINT `verkauf_ibfk_4` FOREIGN KEY (`id_extra`) REFERENCES `extra` (`id_extra`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
