-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 21, 2014 at 06:56 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `chintan_db`
--
CREATE DATABASE IF NOT EXISTS `chintan_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `chintan_db`;

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE IF NOT EXISTS `admin_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_email` varchar(50) NOT NULL,
  `psw` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`admin_email`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`id`, `admin_email`, `psw`) VALUES
(1, 'admin@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(50) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`) VALUES
(1, 'Ahmedabad'),
(2, 'Baroda'),
(3, 'Surat'),
(4, 'Rajkot'),
(5, 'Amreli');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `psw` text NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `hobby` varchar(50) NOT NULL,
  `city_id` int(11) NOT NULL,
  `image` text NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `fname`, `lname`, `email`, `psw`, `gender`, `hobby`, `city_id`, `image`, `status`) VALUES
(5, 'Brijesh', 'Rajput', 'brijesh@gmail.com', '123456', 'Male', 'Read,Write', 2, '', 'Inactive'),
(10, 'Tanmay', 'Sathwara', 'themachine@gmail.com', '123456', 'Male', 'Read,Travel', 1, '', 'Inactive'),
(9, 'Chintan', 'Makwana', 'mchintan92@gmail.com', '123456', 'Male', 'Read,Write,Travel', 1, '', 'Active'),
(11, 'Pratik', 'Khamar', 'pratik@gmail.com', '123456', 'Male', 'Read,Travel', 1, '', 'Inactive'),
(12, 'Seema', 'Damor', 'seema@gmail.com', '123456', 'Female', 'Write', 1, '', 'Active'),
(13, 'Shilpa', 'Dolai', 'shilpa@gmail.com', '123456', 'Female', 'Read,Write', 1, '', 'Inactive'),
(14, 'Sagar', 'Parmar', 'sagar@gmail.com', '123456', 'Male', 'Read,Travel', 4, '', 'Active'),
(15, 'Khushbu', 'Kadiya', 'khushbu@gmail.com', '123456', 'Female', 'Read,Travel', 5, '', 'Inactive'),
(16, 'Disha', 'Barot', 'disha@gmail.com', '123456', 'Female', 'Read,Travel', 3, '', 'Inactive'),
(17, 'Nanthakumar', 'T', 'nanthakumar2007@gmail.com', '123456', 'Male', '', 3, '', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tblbiodata`
--

CREATE TABLE IF NOT EXISTS `tblbiodata` (
  `FullName` text NOT NULL,
  `FatherName` text NOT NULL,
  `MotherName` text NOT NULL,
  `DOB` text NOT NULL,
  `Star` text NOT NULL,
  `Caste` text NOT NULL,
  `LukyNo` text NOT NULL,
  `Color` text NOT NULL,
  `Weight` text NOT NULL,
  `Height` text NOT NULL,
  `Salary` text NOT NULL,
  `Designation` text NOT NULL,
  `Occupation` text NOT NULL,
  `Complexion` text NOT NULL,
  `email` text NOT NULL,
  `ProfileImage` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbiodata`
--

INSERT INTO `tblbiodata` (`FullName`, `FatherName`, `MotherName`, `DOB`, `Star`, `Caste`, `LukyNo`, `Color`, `Weight`, `Height`, `Salary`, `Designation`, `Occupation`, `Complexion`, `email`, `ProfileImage`) VALUES
('J', 'Sd', '', '', '', '', '', '', '', '', '', '', '', '', 'sagar@gmail.com', 'sa'),
('Saas', '', '', '', '', '', '', '', '', '', '', '', '', '', 'sagar@gmail.com', ' upload/test.jpgJellyfish.jpg'),
('Raj', 'Ravi', 'Ni', '12-04-1989', 's', 'hindu', '4', 'red', '50', '5.6', '50000', 'pro', 'pondi', 'kk', 'sagar@gmail.com', ' upload/Tulips.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_like_requests`
--

CREATE TABLE IF NOT EXISTS `tbl_like_requests` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `From_Email` varchar(250) NOT NULL,
  `To_Email` varchar(250) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tbl_like_requests`
--

INSERT INTO `tbl_like_requests` (`ID`, `From_Email`, `To_Email`) VALUES
(2, 'nanthakumar2007@gmail.com', 'sagar@gmail.com'),
(3, 'nanthakumar2007@gmail.com', 'sagar@gmail.com');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
