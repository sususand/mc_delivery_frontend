-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2023 at 03:02 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mc_delivery`
--

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `coupon_code` varchar(6) NOT NULL,
  `coupon_amount_percent` int(3) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coupon`
--

INSERT INTO `coupon` (`coupon_code`, `coupon_amount_percent`, `status`) VALUES
('8ECQMA', 10, 1),
('8ECQMB', 15, 1),
('8ECQMC', 20, 1),
('8ECQMD', 25, 1),
('8ECQME', 30, 1),
('8ECQMF', 35, 1),
('8ECQMG', 40, 1),
('8ECQMH', 45, 1),
('8ECQMI', 50, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE `customer_order` (
  `order_number` varchar(10) NOT NULL,
  `est_date_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `amount` int(6) NOT NULL,
  `deli_charge` int(6) NOT NULL,
  `gst_inclusive` int(6) NOT NULL,
  `total_amount` int(6) NOT NULL,
  `order_date_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `order_status` int(1) NOT NULL,
  `remark` int(255) NOT NULL,
  `sub_item_id` int(50) NOT NULL,
  `order_item_qty` int(7) NOT NULL,
  `order_type` int(1) NOT NULL,
  `item_id` int(50) NOT NULL,
  `main_item_id` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(50) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `category_id` int(15) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `price` double NOT NULL,
  `image_url` varchar(255) NOT NULL DEFAULT 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `item_name`, `category_id`, `status`, `price`, `image_url`) VALUES
(12, 'Spicy Chicken McNuggets® (9pc) Upsized Meal', 15, 1, 10.9, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(13, 'Spicy Chicken McNuggets® (20pc)', 15, 1, 14.8, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(14, 'Chicken McNuggets® (20pc)', 15, 1, 14.5, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(15, 'Chicken McNuggets® (9pc) Upsized Meal', 15, 1, 10.6, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(16, '2x Value Meal: 9pc Spicy McNug & McSpicy LEVM', 15, 1, 20.95, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(17, 'Family Meal: 9pc McNug & McSpicy LEVM + ChB/McNug HM', 15, 1, 25.2, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(18, 'Jjang Jjang Chicken Meal', 15, 1, 7, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(19, '6pc McCrispy® Spicy Meal Value Bundle', 15, 1, 22.75, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(20, '6pc McCrispy® Honey Soy Value Bundle', 15, 1, 22.75, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(21, 'Honey Butter McShaker™ Fries (L)', 15, 1, 5.15, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(22, 'Lychee Oolong Frappé', 15, 1, 5.55, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(23, '6pc McCrispy® Spicy Meal Value Bundle', 16, 1, 22.75, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(24, 'Chicken McCrispy® (2pc) Spicy Extra Value Meal', 16, 1, 9.7, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(25, '6pc McCrispy® Honey Soy Value Bundle', 16, 1, 22.75, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(26, '2pc McCrispy® Honey Soy Extra Value Meal', 16, 1, 9.7, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(27, 'Box C: Spicy Chicken McNuggets® (12pc) + McWings® (8pc)', 17, 1, 16.65, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(28, 'Spicy Chicken McNuggets® (20pc)', 17, 1, 14.8, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(29, '6pc McCrispy® Spicy Meal Value Bundle', 17, 1, 22.75, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(30, 'Chicken McCrispy® Spicy (6pc)', 17, 1, 19.3, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(31, '6pc McCrispy® Honey Soy Value Bundle', 17, 1, 22.75, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(32, 'Chicken McCrispy® Honey Soy (6pc)', 17, 1, 19.3, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(33, 'Happy Sharing Box A Chicken McNuggets® (12pc) + McWings® (8pc)', 17, 1, 16.35, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(34, 'Happy Sharing Box B Chicken McNuggets® (6pc) + McWings® (4pc)', 17, 1, 10.2, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(35, 'Chicken McNuggets® (20pc)', 17, 1, 14.5, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(36, 'McWings® 4pc', 17, 1, 6.35, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(37, 'Spicy Chicken McNuggets® (9pc) Upsized Meal', 18, 1, 10.9, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(38, 'Chicken McNuggets® (9pc) Upsized Meal', 18, 1, 10.6, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(39, 'Jjang Jjang Chicken Meal', 18, 1, 7, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(40, '6pc McCrispy® Spicy Meal Value Bundle', 18, 1, 22.75, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(41, 'Chicken McCrispy® (2pc) Spicy Extra Value Meal', 18, 1, 9.7, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(42, '6pc McCrispy® Honey Soy Value Bundle', 18, 1, 22.75, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(43, '2pc McCrispy® Honey Soy Extra Value Meal', 18, 1, 9.7, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(44, 'Honey Butter McShaker™ Fries (L)', 18, 1, 5.15, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(45, 'Lychee Oolong Frappé', 18, 1, 5.55, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(46, 'Double Quarter Pounder® with Cheese Extra Value Meal', 18, 1, 11.2, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(47, 'Quarter Pounder® with Cheese Extra Value Meal', 18, 1, 9.85, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(48, 'Buttermilk Crispy Chicken Extra Value Meal', 18, 1, 10.8, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(49, 'Dbl McSpicy® Extra Value Meal', 18, 1, 10.55, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(50, 'McSpicy® Extra Value Meal', 18, 1, 8.95, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(51, 'Dbl Filet-O-Fish® Extra Value Meal', 18, 1, 9.7, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(52, 'Filet-O-Fish® Extra Value Meal', 18, 1, 7.1, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(53, 'McChicken® Extra Value Meal', 18, 1, 6.9, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(54, 'Chicken McNuggets® (6pc) Extra Value Meal ', 18, 1, 8.3, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(55, 'Big Mac® Extra Value Meal', 18, 1, 9.65, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(56, 'Double Cheeseburger Extra Value Meal', 18, 1, 7.7, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(57, 'Chicken McNuggets® (20pc)', 18, 1, 14.5, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(58, 'Happy Sharing Box A Chicken McNuggets® (12pc) + McWings® (8pc)', 18, 1, 16.35, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(59, 'Happy Sharing Box B Chicken McNuggets® (6pc) + McWings® (4pc)', 18, 1, 10.2, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(60, 'McWings® 4pc Extra Value Meal', 18, 1, 8.1, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(61, 'Grilled Chicken McWrap Extra Value Meal', 18, 1, 8.95, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(62, 'Cheeseburger', 18, 1, 3.9, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(63, 'Hamburger', 18, 1, 3, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(64, 'Honey Butter McShaker™ Fries (L)', 19, 1, 5.15, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(65, 'Box C: Spicy Chicken McNuggets® (12pc) + McWings® (8pc)', 19, 1, 16.65, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(66, 'Spicy Chicken McNuggets® (6pc) Extra Value Meal', 19, 1, 8.6, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(67, 'Spicy Chicken McNuggets® (9pc) Extra Value Meal', 19, 1, 9.8, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(68, 'Spicy Chicken McNuggets® (20pc)', 19, 1, 14.8, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(69, 'Chicken McNuggets® (6pc) Extra Value Meal ', 19, 1, 8.3, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(70, 'Chicken McNuggets® (9pc) Extra Value Meal', 19, 1, 9.5, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(71, 'Chicken McNuggets® (20pc)', 19, 1, 14.5, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(72, '6pc McCrispy® Spicy Meal Value Bundle', 19, 1, 22.75, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(73, '6pc McCrispy® Honey Soy Value Bundle', 19, 1, 22.75, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(74, 'McWings® 4pc Extra Value Meal', 19, 1, 8.1, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(75, 'McWings® 2pc', 19, 1, 3.35, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(76, 'Apple Pie', 19, 1, 1.9, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(77, 'Happy Sharing Box A Chicken McNuggets® (12pc) + McWings® (8pc)', 19, 1, 16.35, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(78, 'Happy Sharing Box B Chicken McNuggets® (6pc) + McWings® (4pc)', 19, 1, 10.2, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(79, 'French Fries (L)', 19, 1, 4.85, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(80, 'French Fries (M)', 19, 1, 4.45, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(81, 'French Fries', 19, 1, 2.6, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(82, 'Apple Slices', 19, 1, 2.1, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(83, 'Corn Cup (5oz)', 19, 1, 2.1, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(84, 'Lychee Oolong Frappé', 20, 1, 5.55, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(85, 'Caramel Frappe with Oreo Cookies (S)', 20, 1, 5.25, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(86, 'Mocha Frappe with Oreo Cookies (S)', 20, 1, 5.25, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(87, 'Caramel Frappe (S)', 20, 1, 4.75, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(88, 'Mocha Frappe (S)', 20, 1, 4.75, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(89, 'Iced MILO® (S)', 20, 1, 4, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(90, 'Jasmine Green Tea (S)', 20, 1, 4, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(91, 'Iced Lemon Tea (S)', 20, 1, 4, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(92, 'Cappuccino', 20, 1, 4.45, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(93, 'Latte (M)', 20, 1, 4.45, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(94, 'Iced Latte', 20, 1, 4.65, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(95, 'McCafé Premium Roast Coffee', 20, 1, 3.15, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(96, '100% Pure Orange Juice (Junior)', 20, 1, 4, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(97, 'Low-fat, High-Calcium Milk', 20, 1, 3.15, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(98, 'Hot Tea', 20, 1, 3.15, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(99, 'Hot MILO®', 20, 1, 3.3, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(100, 'Coca-Cola® Original Taste Less Sugar (S)', 20, 1, 3.15, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(101, 'Coca-Cola® Zero Sugar (S)', 20, 1, 3.15, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(102, 'Sprite® (S)', 20, 1, 3.15, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(103, 'Dasani®', 20, 1, 3.15, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(104, 'Family Meal: McSpicy® + Filet-O-Fish® Extra Value Meal + Cheeseburger/ 4pc McNuggets® HM)', 21, 1, 21.55, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(105, 'Cheeseburger Happy Meal®', 21, 1, 5.5, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(106, 'Chicken McNuggets® 4pc Happy Meal®', 21, 1, 5.5, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(107, 'Oreo® McFlurry®', 22, 1, 3.55, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(108, 'Mudpie McFlurry®', 22, 1, 3.95, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(109, 'Strawberry Shortcake McFlurry®', 22, 1, 3.95, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(110, 'Hot Fudge Sundae', 22, 1, 2.65, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(111, 'Strawberry Sundae', 22, 1, 2.65, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(112, 'Sausage McMuffin® with Egg Extra Value Meal', 9, 1, 6.95, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(113, 'Big Breakfast® Extra Value Meal', 9, 1, 8, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(114, 'Breakfast Deluxe Extra Value Meal', 9, 1, 9.5, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(115, 'Breakfast Wrap Sausage Extra Value Meal', 9, 1, 7.95, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(116, 'Breakfast Deluxe Extra Value Meal', 10, 1, 9.5, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(117, 'Sausage McMuffin® with Egg Extra Value Meal ', 10, 1, 6.95, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(118, 'Big Breakfast® Extra Value Meal', 10, 1, 6.95, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(119, 'Breakfast Wrap Sausage Extra Value Meal', 10, 1, 7.95, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(120, 'Egg McMuffin® Extra Value Meal', 10, 1, 6.1, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(121, 'Breakfast Wrap Chicken Ham Extra Value Meal ', 10, 1, 7.45, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(122, 'Sausage McMuffin® Extra Value Meal', 10, 1, 5.95, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(123, 'Chicken Muffin Extra Value Meal', 10, 1, 5.95, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(124, 'Chicken Muffin with Egg Extra Value Meal', 10, 1, 6.75, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(125, 'Double Filet-O-Fish® Extra Value Meal', 10, 1, 9.7, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(126, 'Filet-O-Fish® Extra Value Meal', 10, 1, 7.1, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(127, 'Hotcakes with Sausage Extra Value Meal', 10, 1, 8.5, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(128, 'Hotcakes Extra Value Meal', 10, 1, 7.95, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(129, 'Apple Slices', 11, 1, 2.1, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(130, 'Hashbrown', 11, 1, 2.85, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(131, 'Family Meal: BF Deluxe + SME EVM + HCake HM', 14, 1, 21.7, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(132, 'Breakfast Hotcakes (2pcs) Happy Meal®', 14, 1, 5.25, 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `menu_categories`
--

CREATE TABLE `menu_categories` (
  `category_id` int(15) NOT NULL,
  `menu_type` int(1) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `created_date` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `image_url` varchar(255) NOT NULL DEFAULT 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu_categories`
--

INSERT INTO `menu_categories` (`category_id`, `menu_type`, `category_name`, `created_date`, `image_url`) VALUES
(9, 0, 'Promotion Meals', '2023-06-25 08:37:31.871111', 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(10, 0, 'Breakfast & Value Meals', '2023-06-25 08:37:31.900417', 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(11, 0, 'Sides', '2023-06-25 08:37:31.920047', 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(14, 0, 'For the Family', '2023-06-25 08:37:31.975274', 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(15, 1, 'Promotion Meals', '2023-06-25 08:37:31.992996', 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(16, 1, 'Chicken McCrispy®', '2023-06-25 08:37:32.012330', 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(17, 1, 'Sharing', '2023-06-25 08:37:32.028412', 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(18, 1, 'Ala Carte & Value Meals', '2023-06-25 08:37:32.048831', 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(19, 1, 'Sides', '2023-06-25 08:37:32.067381', 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(20, 2, 'Beverages', '2023-06-25 08:37:32.087817', 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(21, 1, 'For the Family', '2023-06-25 08:37:32.105596', 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg'),
(22, 2, 'Desserts', '2023-06-25 08:37:32.124452', 'https://www.mcdelivery.com.sg/sg/static/1687482920908/assets/65/banners/landing_75676_1140x475_R3-min.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_date` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `created_date`) VALUES
(1, 'susu@gmail.com', '123456', '2023-06-25 15:02:02.215852'),
(3, 'susu1@gmail.com', '123456', '2023-06-25 15:05:21.901069');

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

CREATE TABLE `user_address` (
  `user_address_id` int(15) NOT NULL,
  `user_id` int(15) NOT NULL,
  `delivery_address` varchar(100) NOT NULL,
  `postal_code` varchar(6) NOT NULL,
  `contact_number` int(9) NOT NULL,
  `unit` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD UNIQUE KEY `coupon_code` (`coupon_code`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `menu_categories`
--
ALTER TABLE `menu_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`user_address_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `menu_categories`
--
ALTER TABLE `menu_categories`
  MODIFY `category_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_address`
--
ALTER TABLE `user_address`
  MODIFY `user_address_id` int(15) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
