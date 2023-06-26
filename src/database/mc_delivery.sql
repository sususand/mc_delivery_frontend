-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2023 at 01:48 PM
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
-- Table structure for table `cupon`
--

CREATE TABLE `cupon` (
  `coupon_code_id` varchar(6) NOT NULL,
  `coupon_amount_percent` int(11) NOT NULL,
  `coupon_end_date` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cupon`
--

INSERT INTO `cupon` (`coupon_code_id`, `coupon_amount_percent`, `coupon_end_date`) VALUES
('8ECQMA', 10, '2023-06-25 17:41:25.877566'),
('8ECQMB', 15, '2023-06-25 17:41:25.907908'),
('8ECQMC', 20, '2023-06-25 17:41:25.924652'),
('8ECQMD', 25, '2023-06-25 17:41:25.940422'),
('8ECQME', 30, '2023-06-25 17:41:25.956126'),
('8ECQMF', 35, '2023-06-25 17:41:25.970900'),
('8ECQMG', 40, '2023-06-25 17:41:25.985492'),
('8ECQMH', 45, '2023-06-25 17:41:26.001264'),
('8ECQMI', 50, '2023-06-25 17:41:26.016608');

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
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `item_name`, `category_id`, `status`, `price`) VALUES
(12, 'Spicy Chicken McNuggets® (9pc) Upsized Meal', 15, 1, 10.9),
(13, 'Spicy Chicken McNuggets® (20pc)', 15, 1, 14.8),
(14, 'Chicken McNuggets® (20pc)', 15, 1, 14.5),
(15, 'Chicken McNuggets® (9pc) Upsized Meal', 15, 1, 10.6),
(16, '2x Value Meal: 9pc Spicy McNug & McSpicy LEVM', 15, 1, 20.95),
(17, 'Family Meal: 9pc McNug & McSpicy LEVM + ChB/McNug HM', 15, 1, 25.2),
(18, 'Jjang Jjang Chicken Meal', 15, 1, 7),
(19, '6pc McCrispy® Spicy Meal Value Bundle', 15, 1, 22.75),
(20, '6pc McCrispy® Honey Soy Value Bundle', 15, 1, 22.75),
(21, 'Honey Butter McShaker™ Fries (L)', 15, 1, 5.15),
(22, 'Lychee Oolong Frappé', 15, 1, 5.55),
(23, '6pc McCrispy® Spicy Meal Value Bundle', 16, 1, 22.75),
(24, 'Chicken McCrispy® (2pc) Spicy Extra Value Meal', 16, 1, 9.7),
(25, '6pc McCrispy® Honey Soy Value Bundle', 16, 1, 22.75),
(26, '2pc McCrispy® Honey Soy Extra Value Meal', 16, 1, 9.7),
(27, 'Box C: Spicy Chicken McNuggets® (12pc) + McWings® (8pc)', 17, 1, 16.65),
(28, 'Spicy Chicken McNuggets® (20pc)', 17, 1, 14.8),
(29, '6pc McCrispy® Spicy Meal Value Bundle', 17, 1, 22.75),
(30, 'Chicken McCrispy® Spicy (6pc)', 17, 1, 19.3),
(31, '6pc McCrispy® Honey Soy Value Bundle', 17, 1, 22.75),
(32, 'Chicken McCrispy® Honey Soy (6pc)', 17, 1, 19.3),
(33, 'Happy Sharing Box A Chicken McNuggets® (12pc) + McWings® (8pc)', 17, 1, 16.35),
(34, 'Happy Sharing Box B Chicken McNuggets® (6pc) + McWings® (4pc)', 17, 1, 10.2),
(35, 'Chicken McNuggets® (20pc)', 17, 1, 14.5),
(36, 'McWings® 4pc', 17, 1, 6.35),
(37, 'Spicy Chicken McNuggets® (9pc) Upsized Meal', 18, 1, 10.9),
(38, 'Chicken McNuggets® (9pc) Upsized Meal', 18, 1, 10.6),
(39, 'Jjang Jjang Chicken Meal', 18, 1, 7),
(40, '6pc McCrispy® Spicy Meal Value Bundle', 18, 1, 22.75),
(41, 'Chicken McCrispy® (2pc) Spicy Extra Value Meal', 18, 1, 9.7),
(42, '6pc McCrispy® Honey Soy Value Bundle', 18, 1, 22.75),
(43, '2pc McCrispy® Honey Soy Extra Value Meal', 18, 1, 9.7),
(44, 'Honey Butter McShaker™ Fries (L)', 18, 1, 5.15),
(45, 'Lychee Oolong Frappé', 18, 1, 5.55),
(46, 'Double Quarter Pounder® with Cheese Extra Value Meal', 18, 1, 11.2),
(47, 'Quarter Pounder® with Cheese Extra Value Meal', 18, 1, 9.85),
(48, 'Buttermilk Crispy Chicken Extra Value Meal', 18, 1, 10.8),
(49, 'Dbl McSpicy® Extra Value Meal', 18, 1, 10.55),
(50, 'McSpicy® Extra Value Meal', 18, 1, 8.95),
(51, 'Dbl Filet-O-Fish® Extra Value Meal', 18, 1, 9.7),
(52, 'Filet-O-Fish® Extra Value Meal', 18, 1, 7.1),
(53, 'McChicken® Extra Value Meal', 18, 1, 6.9),
(54, 'Chicken McNuggets® (6pc) Extra Value Meal ', 18, 1, 8.3),
(55, 'Big Mac® Extra Value Meal', 18, 1, 9.65),
(56, 'Double Cheeseburger Extra Value Meal', 18, 1, 7.7),
(57, 'Chicken McNuggets® (20pc)', 18, 1, 14.5),
(58, 'Happy Sharing Box A Chicken McNuggets® (12pc) + McWings® (8pc)', 18, 1, 16.35),
(59, 'Happy Sharing Box B Chicken McNuggets® (6pc) + McWings® (4pc)', 18, 1, 10.2),
(60, 'McWings® 4pc Extra Value Meal', 18, 1, 8.1),
(61, 'Grilled Chicken McWrap Extra Value Meal', 18, 1, 8.95),
(62, 'Cheeseburger', 18, 1, 3.9),
(63, 'Hamburger', 18, 1, 3),
(64, 'Honey Butter McShaker™ Fries (L)', 19, 1, 5.15),
(65, 'Box C: Spicy Chicken McNuggets® (12pc) + McWings® (8pc)', 19, 1, 16.65),
(66, 'Spicy Chicken McNuggets® (6pc) Extra Value Meal', 19, 1, 8.6),
(67, 'Spicy Chicken McNuggets® (9pc) Extra Value Meal', 19, 1, 9.8),
(68, 'Spicy Chicken McNuggets® (20pc)', 19, 1, 14.8),
(69, 'Chicken McNuggets® (6pc) Extra Value Meal ', 19, 1, 8.3),
(70, 'Chicken McNuggets® (9pc) Extra Value Meal', 19, 1, 9.5),
(71, 'Chicken McNuggets® (20pc)', 19, 1, 14.5),
(72, '6pc McCrispy® Spicy Meal Value Bundle', 19, 1, 22.75),
(73, '6pc McCrispy® Honey Soy Value Bundle', 19, 1, 22.75),
(74, 'McWings® 4pc Extra Value Meal', 19, 1, 8.1),
(75, 'McWings® 2pc', 19, 1, 3.35),
(76, 'Apple Pie', 19, 1, 1.9),
(77, 'Happy Sharing Box A Chicken McNuggets® (12pc) + McWings® (8pc)', 19, 1, 16.35),
(78, 'Happy Sharing Box B Chicken McNuggets® (6pc) + McWings® (4pc)', 19, 1, 10.2),
(79, 'French Fries (L)', 19, 1, 4.85),
(80, 'French Fries (M)', 19, 1, 4.45),
(81, 'French Fries', 19, 1, 2.6),
(82, 'Apple Slices', 19, 1, 2.1),
(83, 'Corn Cup (5oz)', 19, 1, 2.1),
(84, 'Lychee Oolong Frappé', 20, 1, 5.55),
(85, 'Caramel Frappe with Oreo Cookies (S)', 20, 1, 5.25),
(86, 'Mocha Frappe with Oreo Cookies (S)', 20, 1, 5.25),
(87, 'Caramel Frappe (S)', 20, 1, 4.75),
(88, 'Mocha Frappe (S)', 20, 1, 4.75),
(89, 'Iced MILO® (S)', 20, 1, 4),
(90, 'Jasmine Green Tea (S)', 20, 1, 4),
(91, 'Iced Lemon Tea (S)', 20, 1, 4),
(92, 'Cappuccino', 20, 1, 4.45),
(93, 'Latte (M)', 20, 1, 4.45),
(94, 'Iced Latte', 20, 1, 4.65),
(95, 'McCafé Premium Roast Coffee', 20, 1, 3.15),
(96, '100% Pure Orange Juice (Junior)', 20, 1, 4),
(97, 'Low-fat, High-Calcium Milk', 20, 1, 3.15),
(98, 'Hot Tea', 20, 1, 3.15),
(99, 'Hot MILO®', 20, 1, 3.3),
(100, 'Coca-Cola® Original Taste Less Sugar (S)', 20, 1, 3.15),
(101, 'Coca-Cola® Zero Sugar (S)', 20, 1, 3.15),
(102, 'Sprite® (S)', 20, 1, 3.15),
(103, 'Dasani®', 20, 1, 3.15),
(104, 'Family Meal: McSpicy® + Filet-O-Fish® Extra Value Meal + Cheeseburger/ 4pc McNuggets® HM)', 21, 1, 21.55),
(105, 'Cheeseburger Happy Meal®', 21, 1, 5.5),
(106, 'Chicken McNuggets® 4pc Happy Meal®', 21, 1, 5.5),
(107, 'Oreo® McFlurry®', 22, 1, 3.55),
(108, 'Mudpie McFlurry®', 22, 1, 3.95),
(109, 'Strawberry Shortcake McFlurry®', 22, 1, 3.95),
(110, 'Hot Fudge Sundae', 22, 1, 2.65),
(111, 'Strawberry Sundae', 22, 1, 2.65),
(112, 'Sausage McMuffin® with Egg Extra Value Meal', 9, 1, 6.95),
(113, 'Big Breakfast® Extra Value Meal', 9, 1, 8),
(114, 'Breakfast Deluxe Extra Value Meal', 9, 1, 9.5),
(115, 'Breakfast Wrap Sausage Extra Value Meal', 9, 1, 7.95),
(116, 'Breakfast Deluxe Extra Value Meal', 10, 1, 9.5),
(117, 'Sausage McMuffin® with Egg Extra Value Meal ', 10, 1, 6.95),
(118, 'Big Breakfast® Extra Value Meal', 10, 1, 6.95),
(119, 'Breakfast Wrap Sausage Extra Value Meal', 10, 1, 7.95),
(120, 'Egg McMuffin® Extra Value Meal', 10, 1, 6.1),
(121, 'Breakfast Wrap Chicken Ham Extra Value Meal ', 10, 1, 7.45),
(122, 'Sausage McMuffin® Extra Value Meal', 10, 1, 5.95),
(123, 'Chicken Muffin Extra Value Meal', 10, 1, 5.95),
(124, 'Chicken Muffin with Egg Extra Value Meal', 10, 1, 6.75),
(125, 'Double Filet-O-Fish® Extra Value Meal', 10, 1, 9.7),
(126, 'Filet-O-Fish® Extra Value Meal', 10, 1, 7.1),
(127, 'Hotcakes with Sausage Extra Value Meal', 10, 1, 8.5),
(128, 'Hotcakes Extra Value Meal', 10, 1, 7.95),
(129, 'Apple Slices', 11, 1, 2.1),
(130, 'Hashbrown', 11, 1, 2.85),
(131, 'Family Meal: BF Deluxe + SME EVM + HCake HM', 14, 1, 21.7),
(132, 'Breakfast Hotcakes (2pcs) Happy Meal®', 14, 1, 5.25);

-- --------------------------------------------------------

--
-- Table structure for table `menu_categories`
--

CREATE TABLE `menu_categories` (
  `category_id` int(15) NOT NULL,
  `menu_type` int(1) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `created_date` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu_categories`
--

INSERT INTO `menu_categories` (`category_id`, `menu_type`, `category_name`, `created_date`) VALUES
(9, 0, 'Promotion Meals', '2023-06-25 08:37:31.871111'),
(10, 0, 'Breakfast & Value Meals', '2023-06-25 08:37:31.900417'),
(11, 0, 'Sides', '2023-06-25 08:37:31.920047'),
(14, 0, 'For the Family', '2023-06-25 08:37:31.975274'),
(15, 1, 'Promotion Meals', '2023-06-25 08:37:31.992996'),
(16, 1, 'Chicken McCrispy®', '2023-06-25 08:37:32.012330'),
(17, 1, 'Sharing', '2023-06-25 08:37:32.028412'),
(18, 1, 'Ala Carte & Value Meals', '2023-06-25 08:37:32.048831'),
(19, 1, 'Sides', '2023-06-25 08:37:32.067381'),
(20, 2, 'Beverages', '2023-06-25 08:37:32.087817'),
(21, 1, 'For the Family', '2023-06-25 08:37:32.105596'),
(22, 2, 'Desserts', '2023-06-25 08:37:32.124452');

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

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

CREATE TABLE `user_address` (
  `user_address_id` int(15) NOT NULL,
  `user_id` int(15) NOT NULL,
  `delivery_address` varchar(100) NOT NULL,
  `postal_code` varchar(6) NOT NULL,
  `contact_number` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

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
  ADD PRIMARY KEY (`user_id`);

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
  MODIFY `user_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_address`
--
ALTER TABLE `user_address`
  MODIFY `user_address_id` int(15) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
