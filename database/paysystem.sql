-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2021 at 06:31 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `paysystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` int(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `delete_status` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `branch`, `address`, `delete_status`) VALUES
(1, 'Swindon Branch', '1788 Traction Street', '0'),
(2, 'Bristol Bedminster', '4705 School Street', '0'),
(3, 'Kingswood School', '3386 Rebecca Street', '0'),
(4, 'Marion Cross School', '22 Church St, Norwich', '0'),
(5, 'Birmingham', '22nd St S, Birmingham', '0');

-- --------------------------------------------------------

--
-- Table structure for table `fees_transaction`
--

CREATE TABLE `fees_transaction` (
  `id` int(255) NOT NULL,
  `stdid` varchar(255) NOT NULL,
  `paid` int(255) NOT NULL,
  `submitdate` datetime NOT NULL,
  `transcation_remark` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fees_transaction`
--

INSERT INTO `fees_transaction` (`id`, `stdid`, `paid`, `submitdate`, `transcation_remark`) VALUES
(1, '1', 1000, '2017-11-01 10:02:00', ''),
(2, '2', 1500, '2017-10-05 05:30:06', ''),
(3, '3', 900, '2017-04-13 06:23:00', ''),
(4, '3', 1000, '2018-04-01 01:57:00', ''),
(5, '4', 500, '2018-07-02 11:26:00', ''),
(6, '5', 1500, '2018-06-02 12:00:00', ''),
(7, '6', 200, '2018-07-05 04:11:00', ''),
(8, '7', 200, '2018-03-02 08:17:00', ''),
(9, '8', 5000, '2017-01-03 06:00:00', ''),
(10, '9', 2500, '2018-03-02 06:30:00', ''),
(11, '3', 100, '2021-10-01 03:15:00', ''),
(12, '8', 100, '2021-10-20 02:56:00', ''),
(13, '8', 100, '2021-10-30 13:46:05', ''),
(14, '8', 100, '2021-10-30 02:04:13', ''),
(23, '8', 200, '2021-10-30 02:05:12', ''),
(24, '8', 100, '2021-11-06 12:50:18', ''),
(25, '10', 3000, '2021-11-06 00:00:00', ''),
(26, '10', 1000, '2021-11-06 01:16:48', ''),
(27, '8', 100, '2021-11-06 02:22:20', ''),
(28, '8', 100, '2021-11-08 08:00:53', ''),
(29, '8', 100, '2021-11-10 04:36:24', '');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(255) NOT NULL,
  `emailid` varchar(255) NOT NULL,
  `sname` varchar(255) NOT NULL,
  `joindate` datetime NOT NULL,
  `contact` varchar(255) NOT NULL,
  `fees` int(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `balance` int(255) NOT NULL,
  `delete_status` enum('0','1') NOT NULL DEFAULT '0',
  `about` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `emailid`, `sname`, `joindate`, `contact`, `fees`, `branch`, `balance`, `delete_status`, `about`) VALUES
(1, 'PaigeDoherty@gmail.com', 'Paige Doherty', '2017-11-01 00:00:00', '07785383', 1000, '3', 0, '1', ''),
(2, 'CharlesMiles@gmail.com', 'Charles Miles', '2017-10-05 00:00:00', '07748278', 1500, '1', 0, '1', ''),
(3, 'johndoe@pokse.com', 'John Doe', '2017-04-13 00:00:00', '9874545454', 2500, '3', 500, '0', ''),
(4, 'fsef@gmail.com', 'Tony Jr', '2018-07-02 00:00:00', '7854885214', 2500, '3', 2000, '0', ''),
(5, 'fsbsefef@gmail.com', 'Christine', '2018-06-02 00:00:00', '5454578965', 3660, '1', 2160, '0', ''),
(6, 'mjuiku@gmail.com', 'Harry Den', '2018-07-03 00:00:00', '8467067344', 4500, '4', 4300, '0', ''),
(7, 'kktut5y@gmail.com', 'Emma Gadot', '2018-03-02 00:00:00', '3545458520', 2200, '3', 2000, '0', ''),
(8, 'uu5hh@gmail.com', 'Isabella', '2017-01-03 00:00:00', '8525874545', 20000, '2', 14100, '0', ''),
(9, 'hyftr@gmail.com', 'James Wan', '2018-03-02 00:00:00', '2565452102', 6500, '1', 4000, '0', ''),
(10, 'ben117367@gmail.com', 'Ben', '2021-11-06 00:00:00', '44525745', 15000, '5', 11000, '0', '');

-- --------------------------------------------------------

--
-- Table structure for table `student_users`
--

CREATE TABLE `student_users` (
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email_id` varchar(30) NOT NULL,
  `mobile_number` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_users`
--

INSERT INTO `student_users` (`username`, `password`, `email_id`, `mobile_number`) VALUES
('Paige Doherty', 'Paige Doherty', 'PaigeDoherty@gmail.com', '07785383'),
('Charles Miles', 'Charles Miles', 'CharlesMiles@gmail.com', '07748278'),
('John Doe', 'John Doe', 'johndoe@pokse.com', '9874545454'),
('Tony Jr', 'Tony Jr', 'fsef@gmail.com', '7854885214'),
('Christine', 'Christine', 'fsbsefef@gmail.com', '5454578965'),
('Harry Den', 'Harry Den', 'mjuiku@gmail.com', '8467067344'),
('Emma Gadot', 'Emma Gadot', 'kktut5y@gmail.com', '3545458520'),
('Isabella', 'Isabella', 'uu5hh@gmail.com', '8525874545'),
('James Wan', 'James Wan', 'hyftr@gmail.com', '2565452102'),
('Ben', 'Ben', 'ben117367@gmail.com', '44525745');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `emailid` varchar(255) NOT NULL,
  `lastlogin` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `name`, `emailid`, `lastlogin`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'Lewa', 'lewa@gmail.com', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees_transaction`
--
ALTER TABLE `fees_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fees_transaction`
--
ALTER TABLE `fees_transaction`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
