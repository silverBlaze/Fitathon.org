-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2015 at 10:29 PM
-- Server version: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fitathon`
--
CREATE DATABASE IF NOT EXISTS `fitathon` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fitathon`;

-- --------------------------------------------------------

--
-- Table structure for table `appsettings`
--
-- Creation: Oct 24, 2015 at 08:28 PM
--

CREATE TABLE `appsettings` (
  `key` varchar(100) NOT NULL,
  `value` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--
-- Creation: Oct 24, 2015 at 08:21 PM
--

CREATE TABLE `donation` (
  `ID` int(11) NOT NULL,
  `sponsorID` int(11) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `charged` tinyint(1) NOT NULL DEFAULT '0',
  `success` tinyint(1) NOT NULL DEFAULT '0',
  `processorTrxID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fitevent`
--
-- Creation: Oct 24, 2015 at 08:13 PM
--

CREATE TABLE `fitevent` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `begins` datetime NOT NULL,
  `ends` datetime NOT NULL,
  `estimatedSteps` int(11) DEFAULT NULL,
  `donationGoal` decimal(10,0) DEFAULT NULL,
  `braintreeClientID` varchar(100) DEFAULT NULL,
  `braintreePublicKey` varchar(150) DEFAULT NULL,
  `braintreePrivateKey` int(11) DEFAULT NULL,
  `settled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--
-- Creation: Oct 24, 2015 at 08:15 PM
--

CREATE TABLE `participant` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `eventID` int(11) NOT NULL,
  `stepsTaken` int(11) NOT NULL DEFAULT '0',
  `averageDailySteps` int(11) DEFAULT NULL,
  `fitbitAuthCode` varchar(150) DEFAULT NULL,
  `fitbitAccessToken` varchar(500) NOT NULL,
  `fitbitRefreshToken` varchar(500) NOT NULL,
  `uniqueID` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sponsor`
--
-- Creation: Oct 24, 2015 at 08:22 PM
--

CREATE TABLE `sponsor` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `participantID` int(11) NOT NULL,
  `payMethodToken` varchar(500) DEFAULT NULL,
  `payMethodType` varchar(100) DEFAULT NULL,
  `pledgeAmount` decimal(10,0) DEFAULT NULL,
  `pledgePerSteps` int(11) DEFAULT NULL,
  `donationMax` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--
-- Creation: Oct 24, 2015 at 08:23 PM
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(250) NOT NULL,
  `passwordHash` varchar(250) NOT NULL,
  `passwordSalt` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appsettings`
--
ALTER TABLE `appsettings`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `donation`
--
ALTER TABLE `donation`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `donation_sponsorid` (`sponsorID`);

--
-- Indexes for table `fitevent`
--
ALTER TABLE `fitevent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `participant_userid` (`userID`),
  ADD KEY `participant_eventid` (`eventID`);

--
-- Indexes for table `sponsor`
--
ALTER TABLE `sponsor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sponsor_participantid` (`participantID`),
  ADD KEY `sponsor_userid` (`userID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `user_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `donation`
--
ALTER TABLE `donation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fitevent`
--
ALTER TABLE `fitevent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `participant`
--
ALTER TABLE `participant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sponsor`
--
ALTER TABLE `sponsor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `donation`
--
ALTER TABLE `donation`
  ADD CONSTRAINT `donation_ibfk_1` FOREIGN KEY (`sponsorID`) REFERENCES `sponsor` (`id`);

--
-- Constraints for table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `participant_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `participant_ibfk_2` FOREIGN KEY (`eventID`) REFERENCES `fitevent` (`id`);

--
-- Constraints for table `sponsor`
--
ALTER TABLE `sponsor`
  ADD CONSTRAINT `sponsor_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `sponsor_ibfk_2` FOREIGN KEY (`participantID`) REFERENCES `participant` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
