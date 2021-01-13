-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2021 at 06:37 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `matrimonial website`
--

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `CID` bigint(20) NOT NULL,
  `Country` varchar(20) DEFAULT NULL,
  `MotherTongue` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`CID`, `Country`, `MotherTongue`) VALUES
(1001, 'Bangladesh', 'Bengali'),
(1002, 'India', 'Hindi'),
(1003, 'Pakistan', 'Urdu'),
(1004, 'USA', 'English'),
(1005, 'Canada', 'English'),
(1006, 'Sri Lanka', 'Tamil'),
(1007, 'Saudi Arabia', 'Arabic'),
(1008, 'China', 'Mandarin'),
(1009, 'Singapore', 'Malay'),
(1010, 'Nepal', 'Nepali'),
(1011, 'Malaysia', 'Malay');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CUID` bigint(20) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `Occupation` varchar(30) DEFAULT NULL,
  `MobileNo` varchar(12) DEFAULT NULL,
  `Password` varchar(40) NOT NULL,
  `GID` bigint(20) NOT NULL,
  `CID` bigint(20) NOT NULL,
  `RID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CUID`, `Name`, `DateOfBirth`, `Email`, `Occupation`, `MobileNo`, `Password`, `GID`, `CID`, `RID`) VALUES
(10000, 'Mohammad Nabiluzzaman', '1995-02-11', 'mohdnabil@gmail.com', 'Engineer', '01549623548', 'nabil12345', 11, 1001, 101),
(10001, 'Bonnah Chowdhury', '1998-11-17', 'bonnahchy@gmail.com', 'Doctor', '01849654948', 'bonnah12345', 12, 1002, 101),
(10002, 'Bruce Wayne', '1992-01-23', 'bwayne@gmail.com', 'Businessman', '01956134795', 'bruce12345', 11, 1004, 103);

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `GID` bigint(20) NOT NULL,
  `Gender` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`GID`, `Gender`) VALUES
(11, 'Male'),
(12, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `religion`
--

CREATE TABLE `religion` (
  `RID` bigint(20) NOT NULL,
  `Religion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `religion`
--

INSERT INTO `religion` (`RID`, `Religion`) VALUES
(101, 'Islam'),
(102, 'Hinduism'),
(103, 'Buddhism'),
(104, 'Christianity'),
(105, 'Catholicism');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`CID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CUID`),
  ADD KEY `GID` (`GID`),
  ADD KEY `CID` (`CID`),
  ADD KEY `RID` (`RID`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`GID`);

--
-- Indexes for table `religion`
--
ALTER TABLE `religion`
  ADD PRIMARY KEY (`RID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`GID`) REFERENCES `gender` (`GID`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`CID`) REFERENCES `country` (`CID`),
  ADD CONSTRAINT `customer_ibfk_3` FOREIGN KEY (`RID`) REFERENCES `religion` (`RID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
