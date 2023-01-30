-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2023 at 04:42 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecms`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `order_id` int(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `pincode` int(20) NOT NULL,
  `number` varchar(12) NOT NULL,
  `product` varchar(20) NOT NULL,
  `quantity` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`order_id`, `email`, `name`, `address`, `pincode`, `number`, `product`, `quantity`) VALUES
(43, 'test@gmail.com', 'Srivishnu MV', 'Bangalore', 6767676, '9620059789', 'Select Product', 1),
(44, 'venkatesh@gmail', 'Venkatesh', 'Bangalore', 560028, '9620059789', 'FPV Drone', 2),
(45, 'akash@gmail.in', 'Akash', 'Bangalore', 560098, '8951098880', 'FPV Drone', 1),
(46, 'akash@gmail.in', 'Akash', 'Bangalore', 560098, '8951098880', 'FPV Drone', 1),
(47, 'akash@gmail.in', 'Akash', 'Bangalore', 560098, '9620059789', 'FPV Drone', 1),
(48, 'akash@gmail.in', 'Akash', 'Bangalore', 560098, '9620059789', 'FPV Drone', 1),
(49, 'akash@gmail.in', 'Akash', 'Bangalore', 560032, '9620059789', 'Motion Sensing Robot', 2),
(50, 'akash@gmail.in', 'Akash', 'Laggere', 560028, '8951098880', 'Humanoid', 1),
(51, 'akash@gmail.in', 'Sammed', 'Bangalore', 560029, '9019995991', 'FPV Drone', 1),
(52, 'sammed@gmail.com', 'Sammed', 'Bangalore', 560089, '9019995991', 'Motion Sensing Robot', 1),
(53, 'revanth@gmail.com', 'Revanth Nayak', 'Bangalore', 560028, '8310813217', 'FPV Drone', 2),
(54, 'revanth@gmail.com', 'Revanth Nayak', 'Bangalore', 560028, '9620059789', 'FPV Drone', 2),
(55, 'revanth@gmail.com', 'Revanth Nayak', 'Bangalore', 565656, '9620059789', 'Select Product', 1),
(56, 'revanth@gmail.com', 'Revanth Nayak', 'Bangalore', 560028, '8310813217', 'FPV Drone', 1),
(57, 'revanth@gmail.com', 'Revanth Nayak', 'Bangalore', 560028, '8951098880', 'FPV Drone', 1),
(58, 'revanth@gmail.com', 'Srivishnu MV3', 'Bangalore', 676767, '9620059789', 'Humanoid', 1),
(60, 'test@gmail.com', 'Srivishnu MV', 'Bangalore', 676767, '8618363349', 'Humanoid', 1),
(61, 'test@gmail.com', 'Srivishnu', 'Chennai', 560028, '9620059789', 'Dog Robot', 1),
(62, 'test@gmail.com', 'Srivishnu MV', 'Bangalore1', 34445, '9620059789', 'Bug Robot', 1),
(63, 'test@gmail.com', 'Srivishnu MV', 'Bangalore', 560028, '9620059789', 'Crane Robot', 1),
(64, 'test@gmail.com', 'Srivishnu MV', 'Bangalore', 560028, '9620059789', 'Crane Robot', 1),
(66, 'srikanth@gmail.com', 'Srikanth', 'Bangalore', 560028, '8088890287', 'Bug Robot', 1),
(67, 'srikanth@gmail.com', 'Srivishnu MV', 'Bangalore', 560028, '9620059789', 'FPV Drone', 1),
(68, 'akashs@gmail.com', 'Akash', 'Laggere,Bangalore', 560058, '8951098880', 'Bug Robot', 1),
(69, 'akashs@gmail.com', 'Akash', 'Bangalore', 560028, '8951098880', 'Humanoid', 1),
(70, 'akashs@gmail.com', 'Srivishnu MV', 'Bangalore', 560089, '8951098880', 'Humanoid', 1),
(71, 'akashs@gmail.com', 'Srivishnu MV', 'Bangalore', 560028, '895109888', 'FPV Drone', 1),
(72, 'akashs@gmail.com', 'Srivishnu Test', 'Bangalore', 560029, '8951098880', 'FPV Drone', 1);

--
-- Triggers `cart`
--
DELIMITER $$
CREATE TRIGGER `productbooking` AFTER INSERT ON `cart` FOR EACH ROW INSERT INTO log_trigger
VALUES(null,NEW.order_id,NEW.email,NEW.name,'PRODUCT BOOKED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `productdelete` BEFORE DELETE ON `cart` FOR EACH ROW INSERT INTO log_trigger VALUES(null,OLD.order_id,OLD.email,OLD.name,'PRODUCT DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `productupdate` AFTER UPDATE ON `cart` FOR EACH ROW INSERT INTO log_trigger
VALUES(null,NEW.order_id,NEW.email,NEW.name,'PRODUCT UPDATED',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_trigger`
--

CREATE TABLE `log_trigger` (
  `tid` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log_trigger`
--

INSERT INTO `log_trigger` (`tid`, `order_id`, `email`, `name`, `action`, `timestamp`) VALUES
(1, 42, 'test@gmail.com', 'Srivishnu MV', 'PRODUCT BOOKED', '2023-01-22 19:25:01'),
(2, 42, 'test@gmail.com', 'Srivishnu_update', 'PRODUCT BOOKED', '2023-01-22 19:27:49'),
(3, 42, 'test@gmail.com', 'Srivishnu_upda', 'PRODUCT UPDATED', '2023-01-22 19:29:06'),
(4, 42, 'test@gmail.com', 'Srivishnu_upda', 'PRODUCT DELETED', '2023-01-22 19:31:22'),
(5, 43, 'test@gmail.com', 'Srivishnu MV', 'PRODUCT BOOKED', '2023-01-22 20:41:06'),
(6, 44, 'venkatesh@gmail', 'Venkatesh', 'PRODUCT BOOKED', '2023-01-22 20:44:58'),
(7, 45, 'akash@gmail.in', 'Akash', 'PRODUCT BOOKED', '2023-01-22 20:52:09'),
(8, 46, 'akash@gmail.in', 'Akash', 'PRODUCT BOOKED', '2023-01-22 20:55:17'),
(9, 47, 'akash@gmail.in', 'Akash', 'PRODUCT BOOKED', '2023-01-22 20:55:31'),
(10, 48, 'akash@gmail.in', 'Akash', 'PRODUCT BOOKED', '2023-01-22 21:04:29'),
(11, 49, 'akash@gmail.in', 'Akash', 'PRODUCT BOOKED', '2023-01-22 21:07:47'),
(12, 50, 'akash@gmail.in', 'Akash', 'PRODUCT BOOKED', '2023-01-22 21:20:20'),
(13, 51, 'akash@gmail.in', 'Sammed', 'PRODUCT BOOKED', '2023-01-22 22:29:38'),
(14, 52, 'sammed@gmail.com', 'Sammed', 'PRODUCT BOOKED', '2023-01-22 22:34:13'),
(15, 53, 'revanth@gmail.com', 'Revanth Nayak', 'PRODUCT BOOKED', '2023-01-23 00:29:54'),
(16, 54, 'revanth@gmail.com', 'Revanth Nayak', 'PRODUCT BOOKED', '2023-01-23 00:31:23'),
(17, 55, 'revanth@gmail.com', 'Revanth Nayak', 'PRODUCT BOOKED', '2023-01-23 00:32:24'),
(18, 56, 'revanth@gmail.com', 'Revanth Nayak', 'PRODUCT BOOKED', '2023-01-23 00:36:04'),
(19, 57, 'revanth@gmail.com', 'Revanth Nayak', 'PRODUCT BOOKED', '2023-01-23 00:36:33'),
(20, 58, 'revanth@gmail.com', 'Srivishnu MV3', 'PRODUCT BOOKED', '2023-01-23 00:38:31'),
(21, 59, 'revanth@gmail.com', 'Revanth Nayak', 'PRODUCT BOOKED', '2023-01-23 00:38:55'),
(22, 59, 'revanth@gmail.com', 'Revanth TN', 'PRODUCT UPDATED', '2023-01-23 00:41:16'),
(23, 59, 'revanth@gmail.com', 'Revanth TN', 'PRODUCT DELETED', '2023-01-23 00:41:22'),
(24, 60, 'test@gmail.com', 'Srivishnu MV', 'PRODUCT BOOKED', '2023-01-23 14:20:19'),
(25, 61, 'test@gmail.com', 'Srivishnu', 'PRODUCT BOOKED', '2023-01-23 18:00:49'),
(26, 62, 'test@gmail.com', 'Srivishnu MV', 'PRODUCT BOOKED', '2023-01-23 18:03:03'),
(27, 63, 'test@gmail.com', 'Srivishnu MV', 'PRODUCT BOOKED', '2023-01-23 18:04:21'),
(28, 64, 'test@gmail.com', 'Srivishnu MV', 'PRODUCT BOOKED', '2023-01-23 18:04:35'),
(29, 65, 'rohit@gmail', 'rohit', 'PRODUCT BOOKED', '2023-01-23 18:17:28'),
(30, 65, 'rohit@gmail', 'rohit', 'PRODUCT UPDATED', '2023-01-23 18:17:58'),
(31, 65, 'rohit@gmail', 'rohit', 'PRODUCT DELETED', '2023-01-23 18:18:04'),
(32, 66, 'srikanth@gmail.com', 'Srikanth', 'PRODUCT BOOKED', '2023-01-23 20:00:03'),
(33, 67, 'srikanth@gmail.com', 'Srivishnu MV', 'PRODUCT BOOKED', '2023-01-23 23:25:29'),
(34, 68, 'akashs@gmail.com', 'Akash', 'PRODUCT BOOKED', '2023-01-23 23:35:02'),
(35, 69, 'akashs@gmail.com', 'Akash', 'PRODUCT BOOKED', '2023-01-24 13:11:31'),
(36, 70, 'akashs@gmail.com', 'Srivishnu MV', 'PRODUCT BOOKED', '2023-01-24 13:46:44'),
(37, 71, 'akashs@gmail.com', 'Srivishnu MV', 'PRODUCT BOOKED', '2023-01-24 14:14:00'),
(38, 72, 'akashs@gmail.com', 'Srivishnu MV', 'PRODUCT BOOKED', '2023-01-24 14:14:37'),
(39, 72, 'akashs@gmail.com', 'Srivishnu Test', 'PRODUCT UPDATED', '2023-01-24 14:15:07');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pid` int(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `p_name` varchar(50) NOT NULL,
  `p_desc` varchar(1000) NOT NULL,
  `p_img` varchar(1000) NOT NULL,
  `price` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pid`, `email`, `p_name`, `p_desc`, `p_img`, `price`) VALUES
(6, 'akash@gmail.in', 'Robot Bug', 'A simple Robot bug which can hover and fly', 'randomimg.link', 2300),
(7, 'revanth@gmail.com', 'Robot Spider', 'A simple robot spider', 'spider.link', 2000),
(8, 'srikanth@gmail.com', 'Robot Car', 'A simple Robot bug which can hover and fly', 'randomimg.link', 1000),
(9, 'akashs@gmail.com', 'Robot Painter', 'A simple AI Based robot painter', 'robotpainter.jpg', 1300);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`, `email`) VALUES
(0, 'vishnu', 'sv@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(18, 'test2', 'test@gmail.in', 'pbkdf2:sha256:260000$yflo0kHlrFBnlr7k$07b21aa5e5179c6c52c3116e58b293bcbdee974cb58d027fedee4b80571b5893'),
(20, 'tester', 'test@gmail.com', 'pbkdf2:sha256:260000$JglnikAPc3P0iI0x$c092a6275294284ab42b23fa5e7cb3a4ea0f8e71fb5244504dd56804d6d27334'),
(21, 'Venkatesh', 'venkatesh@gmail', 'pbkdf2:sha256:260000$plcPG0TweVf6FHNZ$533c5f280e6e0f6567656e72d527adcb63f8ba9f781b98578788b5b971e261b8'),
(22, 'Akash', 'akash@gmail.in', 'pbkdf2:sha256:260000$DWGrwwcfYOzcES84$8ebcfcc55481259124a986497b3c4313d43f5b0030362c93dfbe42da609b312f'),
(23, 'sammed', 'sammed@gmail.com', 'pbkdf2:sha256:260000$gzDVK5FBPv9GwTuP$c84341dba2f06cb480d822ba72184a5f55d3ec47eb0f89010c2487f121834115'),
(24, 'revanth', 'revanth@gmail.com', 'pbkdf2:sha256:260000$J0PzxjHCiuePKD07$f25099e509309a0a42dcff68c2dfa31c3021bf3835fcba6e4d7e56f316d0441d'),
(25, 'Rohit', 'rohit@gmail.com', 'pbkdf2:sha256:260000$LJJ4E2YTfHKmV8Rh$371e819e5248d71006356ccac58628610aa71c9d2fadb2f770a2692b78b37bbf'),
(26, 'Rohit', 'rohit@gmail', 'pbkdf2:sha256:260000$1JNctOLBHrQlHmSN$82248560d5ab4dbcf940f417ac056f2366b82e49d550e639eda12c02c930a1cd'),
(27, 'Srikanth', 'srikanth@gmail.com', 'pbkdf2:sha256:260000$3qvU711BInaqosw0$2220318cea8bf89e98b55b969713accc5a072266a2f76f7eafd104ca2ca543e0'),
(28, 'Akash', 'akashs@gmail.com', 'pbkdf2:sha256:260000$zIMFOhPR5dOTwgkD$f4319da3bf96c323e431f9c66cca2a720e428790ca4181172775ddce7bb01089');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `log_trigger`
--
ALTER TABLE `log_trigger`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `order_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `log_trigger`
--
ALTER TABLE `log_trigger`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `pid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
