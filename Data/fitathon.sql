-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2015 at 03:26 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `appsettings`
--

CREATE TABLE `appsettings` (
  `key` varchar(100) NOT NULL,
  `value` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appsettings`
--

INSERT INTO `appsettings` (`key`, `value`) VALUES
('fitbitClientId', '229WLW'),
('fitbitClientSecret', 'c6b3dd8e2954175f8a2042ee82012785');

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE `donation` (
  `ID` int(11) NOT NULL,
  `sponsorID` int(11) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `charged` tinyint(1) NOT NULL DEFAULT '0',
  `success` tinyint(1) NOT NULL DEFAULT '0',
  `processorTrxID` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donation`
--

INSERT INTO `donation` (`ID`, `sponsorID`, `amount`, `charged`, `success`, `processorTrxID`) VALUES
(11, 4, '23', 1, 1, 'khgqgj');

-- --------------------------------------------------------

--
-- Table structure for table `fitevent`
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
  `braintreePrivateKey` varchar(255) DEFAULT NULL,
  `settled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fitevent`
--

INSERT INTO `fitevent` (`id`, `name`, `begins`, `ends`, `estimatedSteps`, `donationGoal`, `braintreeClientID`, `braintreePublicKey`, `braintreePrivateKey`, `settled`) VALUES
(1, 'Fit Event', '2016-01-01 00:00:00', '2016-01-02 00:00:00', 25000, '250', NULL, NULL, NULL, 0),
(2, 'asdf1', '2015-12-01 00:00:00', '2015-12-02 00:00:00', 15000, '150', NULL, NULL, NULL, 0),
(3, 'Test Event 3', '2016-01-15 00:00:00', '2016-01-16 00:00:00', 12000, '100', NULL, NULL, NULL, 0),
(4, 'asdfasdfasd', '2016-01-18 00:00:00', '2016-01-19 00:00:00', 545454, '12312', 'asdfasdf', '12312312312', '123123123', 0),
(5, 'Jason Wells', '2015-10-30 00:00:00', '2015-10-31 00:00:00', 15000, '200', 'asdf', 'asdf', 'asdf', 0),
(6, 'asdf fdsa', '2015-10-30 00:00:00', '2015-10-31 00:00:00', 15000, '800', 'asdf', 'fdsa', 'fdsa', 0),
(7, 'testevent 4', '2015-10-24 00:00:00', '2015-10-25 00:00:00', 15000, '200', '92jhfhs79bxhprwd', 'vhrjkq5v53gfr6hg', 'e0052decde607c0c74c79c4cddcff270', 1),
(8, 'Jason''s Event', '2015-10-25 00:00:00', '2015-10-27 00:00:00', 20000, '200', '92jhfhs79bxhprwd', 'vhrjkq5v53gfr6hg', 'e0052decde607c0c74c79c4cddcff270', 0),
(9, 'The Event', '0001-01-01 00:00:00', '0001-01-01 00:00:00', 20000, '2500', NULL, NULL, NULL, 0),
(10, ' fdsafsdfa d', '0001-01-01 00:00:00', '0001-01-01 00:00:00', 112341, '321', NULL, NULL, NULL, 0),
(11, 'asdf fdsafsd', '2015-12-31 00:00:00', '2016-01-01 00:00:00', 13213, '198', 'asdfasdfasdf', '1231231232', '5235235235', 0),
(12, 'brqbtab', '2001-01-01 00:00:00', '2001-01-01 00:00:00', 45678, '321', '92jhfhs79bxhprwd', 'vhrjkq5v53gfr6hg', 'e0052decde607c0c74c79c4cddcff270', 0),
(13, 'Troop #848 Walkathon', '2015-11-01 00:00:00', '2015-11-02 00:00:00', 20000, '250', '92jhfhs79bxhprwd', 'vhrjkq5v53gfr6hg', 'e0052decde607c0c74c79c4cddcff270', 0);

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE `participant` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `eventID` int(11) NOT NULL,
  `stepsTaken` int(11) NOT NULL DEFAULT '0',
  `averageDailySteps` int(11) DEFAULT NULL,
  `fitbitAuthCode` varchar(150) DEFAULT NULL,
  `fitbitAccessToken` varchar(500) DEFAULT NULL,
  `fitbitRefreshToken` varchar(500) DEFAULT NULL,
  `uniqueID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participant`
--

INSERT INTO `participant` (`id`, `userID`, `eventID`, `stepsTaken`, `averageDailySteps`, `fitbitAuthCode`, `fitbitAccessToken`, `fitbitRefreshToken`, `uniqueID`) VALUES
(1, 3, 3, 0, NULL, NULL, NULL, NULL, 'fab99e95-882e-48e5-8616-c99da31b3f6f'),
(2, 4, 4, 0, NULL, NULL, NULL, NULL, '4f65069d-ea00-44cc-b229-ad0414123eb6'),
(3, 7, 5, 0, NULL, NULL, NULL, NULL, 'd0bbdb8f-6432-46ed-a91b-2501bc6c73f4'),
(4, 8, 6, 0, NULL, '2e2249878074a470cdc163e5732ead7511f9858d', 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE0NDU3NDExMDYsInNjb3BlcyI6InJhY3QiLCJzdWIiOiIzUzQ3VlEiLCJhdWQiOiIyMjlXTFciLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJpYXQiOjE0NDU3Mzc1MDZ9.PF7lnK3tQTmAoqpFXRo5bxyAV9ZveXUBtjm_D84H3g0', 'f662e70f29086467843fa5d28a8957a745ef71e3623b4d6299cc0a3e973baeb7', '856192e0-2057-4511-bff3-171b408bb23d'),
(5, 9, 7, 23200, NULL, 'a004848eb5f10e682441da01c0e389f9b94691e4', 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE0NDU3NjA4NzgsInNjb3BlcyI6InJhY3QiLCJzdWIiOiIzUzQ3VlEiLCJhdWQiOiIyMjlXTFciLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJpYXQiOjE0NDU3NTcyNzh9.4TDJN_k82GQCXQ168CPI11oZd2_t0eyClYLdHrLVD_4', '1d1950cfe163237dfa82d8ad74139dd69e2abe73fc5506391bb660cb6a49ad82', 'f2a90061-8f95-4174-8639-7df49048583c'),
(6, 14, 8, 8900, NULL, '79127a1e76a8894de4a1b294a08244b65436b50f', 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE0NDU3NjU0ODcsInNjb3BlcyI6InJhY3QiLCJzdWIiOiIzUzQ3VlEiLCJhdWQiOiIyMjlXTFciLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJpYXQiOjE0NDU3NjE4ODd9.gGI2LukxaHbJEX911GXP0WqFgLXiEUuen3rFj2bTFCk', '3e7353a7f3b74eb001ebd23676a7177c06bfbcb02238515cd1992245d29bac52', '6ac2442a-eda1-4cfb-8662-fcd8627c0eb6'),
(7, 16, 9, 0, NULL, NULL, NULL, NULL, 'ee0d62b8-da72-4b01-82a9-56cf8955dd7d'),
(8, 17, 10, 0, NULL, NULL, NULL, NULL, '2c455cfd-cb2c-4543-993e-5e5274063c04'),
(9, 18, 11, 0, NULL, 'd05b1bf11d17744c9210b4132a63d83a1ff6f645', 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE0NDU3NzM4NTMsInNjb3BlcyI6InJhY3QiLCJzdWIiOiIzUzQ3VlEiLCJhdWQiOiIyMjlXTFciLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJpYXQiOjE0NDU3NzAyNTN9.8Y01CYPlO22OBCaYiWK63hjegyR8zNO1kn0wypiPlns', 'f04efbd6532fefe74d5b10897568d7bd2a6adeaaa32e3add88a9ab3ffba8d3ed', 'b4d5294a-179b-42a4-8e8d-027b06ff570d'),
(10, 19, 12, 0, NULL, '8f71e16ab943e4a328f6ff3306268e6b6d8d2119', 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE0NDU3NzQ2NjIsInNjb3BlcyI6InJhY3QiLCJzdWIiOiIzUzQ3VlEiLCJhdWQiOiIyMjlXTFciLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJpYXQiOjE0NDU3NzEwNjJ9.VYaI-EFcnAJcdeaa_cwS-4OoV7M9hB-3P_HX-Ng1qHA', '9e0c5cd98235d894016e2e402caf67e37838c0aa7e5f27838e3c42a5b1253c91', '094e6784-663b-451a-b760-1a6c2cd1b02f'),
(11, 22, 13, 0, NULL, 'd943c2d193fdb1c49178828d3aa9c5e8dfc0211e', 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE0NDU3ODQ3MTYsInNjb3BlcyI6InJhY3QiLCJzdWIiOiIzUzQ3VlEiLCJhdWQiOiIyMjlXTFciLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJpYXQiOjE0NDU3ODExMTZ9.5NGlzA5-Ch3Ub_zYDFxpBl5BFUnmqlMo2lePa6V3ZcI', 'fae343cb339ef1eda5dbf45bf85c50e2ed84a81aa484ac850cc3c9e895796d76', '3467f2a1-0528-44a1-8d7b-a30dabf70c62');

-- --------------------------------------------------------

--
-- Table structure for table `sponsor`
--

CREATE TABLE `sponsor` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `participantID` int(11) NOT NULL,
  `payMethodToken` varchar(500) DEFAULT NULL,
  `payMethodCustomerId` varchar(150) DEFAULT NULL,
  `payMethodType` varchar(100) DEFAULT NULL,
  `pledgeAmount` decimal(10,0) DEFAULT NULL,
  `pledgePerSteps` int(11) DEFAULT NULL,
  `donationMax` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sponsor`
--

INSERT INTO `sponsor` (`id`, `userID`, `participantID`, `payMethodToken`, `payMethodCustomerId`, `payMethodType`, `pledgeAmount`, `pledgePerSteps`, `donationMax`) VALUES
(1, 5, 2, 'ASDF1234', NULL, NULL, '123', 5000, '1235'),
(2, 6, 2, 'ASDF1234', NULL, NULL, '11212', 500, '432'),
(3, 10, 2, 'dstr7w', '40151955', 'PayPal Account', '5', 1000, '20'),
(4, 11, 5, 'dstr7w', '40151955', 'PayPal Account', '1', 1000, '100'),
(5, 12, 2, 'dstr7w', '40151955', 'PayPal Account', '1', 500, '124'),
(6, 15, 6, '6ym352', '27850360', 'Visa', '1', 1000, '25'),
(7, 20, 10, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 21, 10, 'jvgg7w', '10507668', 'Visa', '1', 1200, '25');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(250) NOT NULL,
  `passwordHash` varchar(250) NOT NULL,
  `passwordSalt` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `name`, `email`, `passwordHash`, `passwordSalt`) VALUES
(1, 'Jason Wells', 'jason@wells.solutions', 'asdfAsdf1', 'asdfAsdf1'),
(2, 'asdf', 'asdf@asdf1', '123123', '123123'),
(3, 'Test Person', 'test3@fakemail', 'asdf', 'asdf'),
(4, 'asdfasdf', 'a@test', 'asdf', 'asdfAsdf1'),
(5, 'asdf', 'b@test', 'asdf', 'asdfasdf'),
(6, 'vbncvnbcv', 'cvbncvnbc', 'werwer', 'werwer'),
(7, 'fitbit tester', 'fit@test', 'asdf', 'asdf'),
(8, 'fitbit tester 2', 'fit@test2', 'asdf', 'asdf'),
(9, 'event4 tester', 'test3@asdf', 'asdf', 'asdf'),
(10, 'event4 sponsor', 'test4@asdf', 'asdf', 'asdf'),
(11, 'event4 sponsor3', 'wellsjh@gmail.com', 'asdf', 'asdf'),
(12, 'tester 1', 'test5@test', 'asdf', 'asdf'),
(14, 'Jason Wells', 'jason1@wells.solutions', 'asdf', 'asdf'),
(15, 'John Doe', 'silverblaze110101@gmail.com', 'asdf', 'asdf'),
(16, 'asdfasdfasdf fdsa', 'qwerqwer!@asdfewr', 'rewqrqwer', 'rewqrqwer'),
(17, 'asdfasd fdsaafsd', 'asdf@fdsfdsafdfsf', 'aeqwe', 'aeqwe'),
(18, 'asdf fdsafdsafs', '2f23dgs@af23f2f', 'asdfasdf', 'asdfasdf'),
(19, 'asdf fdsasdfasd', 'werberqerb!@A', 'asdfasdfa', 'asdfasdfa'),
(20, 'wertwert trew', 'wertwert@wert', 'wert', 'wert'),
(21, 'asdfzxcvzxvc', 'qwer@q', 'asdf', 'fzxcvzxvc'),
(22, 'John Doe', 'jdoe436641@gmail.com', 'asdf', 'asdf');

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `fitevent`
--
ALTER TABLE `fitevent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `participant`
--
ALTER TABLE `participant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `sponsor`
--
ALTER TABLE `sponsor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
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
