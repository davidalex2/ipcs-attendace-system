-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2024 at 11:20 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ipcs_att`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `c_id` int(2) NOT NULL,
  `c_name` varchar(255) NOT NULL,
  `fee` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dep_tbl`
--

CREATE TABLE `dep_tbl` (
  `dep_id` int(11) NOT NULL,
  `dep_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dep_tbl`
--

INSERT INTO `dep_tbl` (`dep_id`, `dep_name`) VALUES
(1, 'CRE'),
(2, 'EMM'),
(3, 'IT'),
(4, 'PC'),
(5, 'BMS');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `u_id` int(11) NOT NULL,
  `uname` varchar(60) NOT NULL,
  `pass` varchar(10) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`u_id`, `uname`, `pass`, `role_id`, `created_at`) VALUES
(1, 'dev.admin', 'Admin@123', 1, '0000-00-00 00:00:00'),
(2, 'david', 'da', 2, '2024-10-03 15:18:52');

-- --------------------------------------------------------

--
-- Table structure for table `more_detail`
--

CREATE TABLE `more_detail` (
  `d_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `pay_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pay_tbl`
--

CREATE TABLE `pay_tbl` (
  `p_id` int(11) NOT NULL,
  `fee_d` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `position_tbl`
--

CREATE TABLE `position_tbl` (
  `position_id` int(11) NOT NULL,
  `position` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `position_tbl`
--

INSERT INTO `position_tbl` (`position_id`, `position`) VALUES
(1, 'junior'),
(2, 'senior');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `r_id` int(1) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`r_id`, `status`) VALUES
(1, 'admin'),
(4, 'bm'),
(2, 'employee'),
(3, 'student');

-- --------------------------------------------------------

--
-- Table structure for table `staff_tbl`
--

CREATE TABLE `staff_tbl` (
  `u_id` int(11) NOT NULL,
  `s_name` varchar(50) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `mobile` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `c_address` varchar(100) NOT NULL,
  `p_address` varchar(100) NOT NULL,
  `position_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`c_id`),
  ADD UNIQUE KEY `c_name` (`c_name`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `dep_tbl`
--
ALTER TABLE `dep_tbl`
  ADD PRIMARY KEY (`dep_id`),
  ADD KEY `dep_id` (`dep_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`u_id`),
  ADD UNIQUE KEY `uname` (`uname`),
  ADD UNIQUE KEY `role_id` (`role_id`),
  ADD KEY `u_id` (`u_id`);

--
-- Indexes for table `more_detail`
--
ALTER TABLE `more_detail`
  ADD KEY `d_id` (`d_id`,`c_id`,`pay_id`),
  ADD KEY `c_id` (`c_id`),
  ADD KEY `pay_id` (`pay_id`);

--
-- Indexes for table `pay_tbl`
--
ALTER TABLE `pay_tbl`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `position_tbl`
--
ALTER TABLE `position_tbl`
  ADD PRIMARY KEY (`position_id`),
  ADD KEY `position_id` (`position_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`r_id`),
  ADD UNIQUE KEY `status` (`status`),
  ADD KEY `r_id` (`r_id`);

--
-- Indexes for table `staff_tbl`
--
ALTER TABLE `staff_tbl`
  ADD KEY `u_id` (`u_id`,`dep_id`,`role_id`,`position_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `position_id` (`position_id`),
  ADD KEY `dep_id` (`dep_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `c_id` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dep_tbl`
--
ALTER TABLE `dep_tbl`
  MODIFY `dep_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pay_tbl`
--
ALTER TABLE `pay_tbl`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `position_tbl`
--
ALTER TABLE `position_tbl`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `r_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`r_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `more_detail`
--
ALTER TABLE `more_detail`
  ADD CONSTRAINT `more_detail_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `login` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `more_detail_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `course` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `more_detail_ibfk_3` FOREIGN KEY (`pay_id`) REFERENCES `pay_tbl` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff_tbl`
--
ALTER TABLE `staff_tbl`
  ADD CONSTRAINT `staff_tbl_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `login` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_tbl_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`r_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_tbl_ibfk_3` FOREIGN KEY (`position_id`) REFERENCES `position_tbl` (`position_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_tbl_ibfk_4` FOREIGN KEY (`dep_id`) REFERENCES `dep_tbl` (`dep_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
