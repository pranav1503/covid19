-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 12, 2020 at 05:17 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `covid`
--

-- --------------------------------------------------------

--
-- Table structure for table `age`
--

DROP TABLE IF EXISTS `age`;
CREATE TABLE IF NOT EXISTS `age` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `age_range` varchar(20) NOT NULL,
  `counts` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `age`
--

INSERT INTO `age` (`id`, `age_range`, `counts`) VALUES
(1, '0-10', 37),
(2, '10-20', 92),
(3, '20-30', 241),
(4, '30-40', 290),
(5, '40-50', 202),
(6, '50-60', 179),
(7, '60-70', 118),
(8, '70-80', 35),
(9, '80-90', 7),
(10, '90-100', 2),
(11, '100+', 0),
(12, 'awaiting', 8075);

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
CREATE TABLE IF NOT EXISTS `districts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` text NOT NULL,
  `district` text NOT NULL,
  `confirmed` int(11) NOT NULL,
  `increased` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=389 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `state`, `district`, `confirmed`, `increased`) VALUES
(1, 'Kerala', 'Thrissur', 13, 0),
(2, 'Kerala', 'Alappuzha', 5, 0),
(3, 'Kerala', 'Kasaragod', 166, 0),
(4, 'Kerala', 'Pathanamthitta', 17, 1),
(5, 'Kerala', 'Kannur', 71, 1),
(6, 'Kerala', 'Ernakulam', 24, 0),
(7, 'Kerala', 'Kottayam', 3, 0),
(8, 'Kerala', 'Thiruvananthapuram', 14, 0),
(9, 'Kerala', 'Idukki', 10, 0),
(10, 'Kerala', 'Malappuram', 20, 0),
(11, 'Kerala', 'Kozhikode', 13, 0),
(12, 'Kerala', 'Palakkad', 7, 0),
(13, 'Kerala', 'Wayanad', 3, 0),
(14, 'Kerala', 'Kollam', 9, 0),
(15, 'Delhi', 'East Delhi', 1, 0),
(16, 'Delhi', 'South West Delhi', 3, 0),
(17, 'Delhi', 'West Delhi', 2, 0),
(18, 'Delhi', 'North Delhi', 3, 0),
(19, 'Delhi', 'New Delhi', 5, 0),
(20, 'Delhi', 'South Delhi', 26, 0),
(21, 'Delhi', 'North East Delhi', 1, 0),
(22, 'Delhi', 'North West Delhi', 3, 0),
(23, 'Delhi', 'Unknown', 1110, 85),
(24, 'Telangana', 'Hyderabad', 197, 0),
(25, 'Telangana', 'Karimnagar', 18, 0),
(26, 'Telangana', 'Bhadradri Kothagudem', 4, 0),
(27, 'Telangana', 'Ranga Reddy', 34, 0),
(28, 'Telangana', 'Medchal Malkajgiri', 23, 0),
(29, 'Telangana', 'Unknown', 60, 28),
(30, 'Telangana', 'Rajanna Sircilla', 1, 0),
(31, 'Telangana', 'Khammam', 2, 0),
(32, 'Telangana', 'Warangal Urban', 24, 0),
(33, 'Telangana', 'Vikarabad', 8, 0),
(34, 'Telangana', 'Suryapet', 9, 0),
(35, 'Telangana', 'Siddipet', 1, 0),
(36, 'Telangana', 'Sangareddy', 7, 0),
(37, 'Telangana', 'Nizamabad', 49, 0),
(38, 'Telangana', 'Medak', 5, 0),
(39, 'Telangana', 'Mahabubnagar', 10, 0),
(40, 'Telangana', 'Mahabubabad', 1, 0),
(41, 'Telangana', 'Adilabad', 10, 0),
(42, 'Telangana', 'Nirmal', 15, 0),
(43, 'Telangana', 'Peddapalli', 2, 0),
(44, 'Telangana', 'Jagitial', 2, 0),
(45, 'Telangana', 'Jogulamba Gadwal', 19, 0),
(46, 'Telangana', 'Nalgonda', 12, 0),
(47, 'Telangana', 'Nagarkurnool', 2, 0),
(48, 'Telangana', 'Mulugu', 2, 0),
(49, 'Telangana', 'Kamareddy', 10, 0),
(50, 'Telangana', 'Jayashankar', 2, 0),
(51, 'Telangana', 'Jangoan', 2, 0),
(52, 'Rajasthan', 'Italians*', 2, 0),
(53, 'Rajasthan', 'Jaipur', 341, 40),
(54, 'Rajasthan', 'Jhunjhunu', 31, 0),
(55, 'Rajasthan', 'Bhilwara', 28, 0),
(56, 'Rajasthan', 'Jodhpur', 51, 8),
(57, 'Rajasthan', 'Pali', 2, 0),
(58, 'Rajasthan', 'Sikar', 2, 1),
(59, 'Rajasthan', 'Pratapgarh', 2, 0),
(60, 'Rajasthan', 'Dungarpur', 5, 0),
(61, 'Rajasthan', 'Churu', 14, 3),
(62, 'Rajasthan', 'Ajmer', 5, 0),
(63, 'Rajasthan', 'Evacuees', 50, 0),
(64, 'Rajasthan', 'Alwar', 7, 0),
(65, 'Rajasthan', 'Tonk', 59, 12),
(66, 'Rajasthan', 'Dhaulpur', 1, 0),
(67, 'Rajasthan', 'Udaipur', 4, 0),
(68, 'Rajasthan', 'Bharatpur', 9, 0),
(69, 'Rajasthan', 'Bikaner', 34, 8),
(70, 'Rajasthan', 'Dausa', 8, 0),
(71, 'Rajasthan', 'Banswara', 52, 15),
(72, 'Rajasthan', 'Karauli', 3, 0),
(73, 'Rajasthan', 'Nagaur', 6, 5),
(74, 'Rajasthan', 'Jaisalmer', 29, 1),
(75, 'Rajasthan', 'Kota', 40, 7),
(76, 'Rajasthan', 'Jhalawar', 14, 0),
(77, 'Rajasthan', 'Barmer', 1, 0),
(78, 'Rajasthan', 'Hanumangarh', 2, 2),
(79, 'Rajasthan', 'Evacuees*', 2, 2),
(80, 'Haryana', 'Italians*', 14, 0),
(81, 'Haryana', 'Gurugram', 32, 0),
(82, 'Haryana', 'Faridabad', 31, 2),
(83, 'Haryana', 'Panipat', 4, 0),
(84, 'Haryana', 'Panchkula', 5, 0),
(85, 'Haryana', 'Sonipat', 3, 0),
(86, 'Haryana', 'Palwal', 29, 0),
(87, 'Haryana', 'Ambala', 7, 0),
(88, 'Haryana', 'Sirsa', 3, 0),
(89, 'Haryana', 'Hisar', 2, 0),
(90, 'Haryana', 'Rohtak', 1, 0),
(91, 'Haryana', 'Nuh', 45, 7),
(92, 'Haryana', 'Karnal', 6, 1),
(93, 'Haryana', 'Bhiwani', 2, 0),
(94, 'Haryana', 'Kaithal', 2, 0),
(95, 'Haryana', 'Charki Dadri', 1, 0),
(96, 'Haryana', 'Jind', 2, 1),
(97, 'Haryana', 'Fatehabad', 1, 0),
(98, 'Haryana', 'Kurukshetra', 2, 2),
(99, 'Haryana', 'Yamunanagar', 3, 3),
(100, 'Uttar Pradesh', 'Agra', 104, 12),
(101, 'Uttar Pradesh', 'Ghaziabad', 27, 0),
(102, 'Uttar Pradesh', 'Lucknow', 29, 0),
(103, 'Uttar Pradesh', 'Gautam Buddha Nagar', 62, 0),
(104, 'Uttar Pradesh', 'Kheri', 4, 0),
(105, 'Uttar Pradesh', 'Moradabad', 2, 1),
(106, 'Uttar Pradesh', 'Varanasi', 9, 0),
(107, 'Uttar Pradesh', 'Kanpur Nagar', 9, 0),
(108, 'Uttar Pradesh', 'Pilibhit', 2, 0),
(109, 'Uttar Pradesh', 'Jaunpur', 4, 0),
(110, 'Uttar Pradesh', 'Baghpat', 7, 2),
(111, 'Uttar Pradesh', 'Shamli', 17, 0),
(112, 'Uttar Pradesh', 'Meerut', 51, 3),
(113, 'Uttar Pradesh', 'Bareilly', 6, 0),
(114, 'Uttar Pradesh', 'Bulandshahr', 11, 0),
(115, 'Uttar Pradesh', 'Basti', 9, 0),
(116, 'Uttar Pradesh', 'Hardoi', 2, 0),
(117, 'Uttar Pradesh', 'Shahjahanpur', 1, 0),
(118, 'Uttar Pradesh', 'Firozabad', 15, 4),
(119, 'Uttar Pradesh', 'Azamgarh', 4, 0),
(120, 'Uttar Pradesh', 'Saharanpur', 28, 7),
(121, 'Uttar Pradesh', 'Pratapgarh', 6, 0),
(122, 'Uttar Pradesh', 'Hapur', 6, 0),
(123, 'Uttar Pradesh', 'Ghazipur', 5, 0),
(124, 'Uttar Pradesh', 'Banda', 2, 0),
(125, 'Uttar Pradesh', 'Mahrajganj', 6, 0),
(126, 'Uttar Pradesh', 'Hathras', 4, 0),
(127, 'Uttar Pradesh', 'Mirzapur', 2, 0),
(128, 'Uttar Pradesh', 'Rae Bareli', 2, 0),
(129, 'Uttar Pradesh', 'Bara Banki', 1, 0),
(130, 'Uttar Pradesh', 'Auraiya', 3, 0),
(131, 'Uttar Pradesh', 'Mathura', 6, 1),
(132, 'Uttar Pradesh', 'Budaun', 2, 0),
(133, 'Uttar Pradesh', 'Kaushambi', 2, 0),
(134, 'Uttar Pradesh', 'Bijnor', 1, 0),
(135, 'Uttar Pradesh', 'Prayagraj', 1, 0),
(136, 'Uttar Pradesh', 'Sitapur', 10, 0),
(137, 'Uttar Pradesh', 'Muzaffarnagar', 7, 1),
(138, 'Uttar Pradesh', 'Amroha', 7, 0),
(139, 'Uttar Pradesh', 'Rampur', 6, 0),
(140, 'Uttar Pradesh', 'Bhadohi', 1, 0),
(141, 'Ladakh', 'Leh', 12, 0),
(142, 'Ladakh', 'Kargil', 3, 0),
(143, 'Tamil Nadu', 'Kancheepuram', 7, 0),
(144, 'Tamil Nadu', 'Chennai', 200, 18),
(145, 'Tamil Nadu', 'Erode', 64, 4),
(146, 'Tamil Nadu', 'Coimbatore', 119, 22),
(147, 'Tamil Nadu', 'Tirunelveli', 58, 0),
(148, 'Tamil Nadu', 'Tiruppur', 61, 35),
(149, 'Tamil Nadu', 'Madurai', 25, 0),
(150, 'Tamil Nadu', 'Chengalpattu', 42, 2),
(151, 'Tamil Nadu', 'Salem', 18, 4),
(152, 'Tamil Nadu', 'Ranipet', 38, 2),
(153, 'Tamil Nadu', 'Thanjavur', 11, 0),
(154, 'Tamil Nadu', 'Vellore', 12, 1),
(155, 'Tamil Nadu', 'Virudhunagar', 11, 0),
(156, 'Tamil Nadu', 'Karur', 25, 3),
(157, 'Tamil Nadu', 'Tiruvannamalai', 7, 0),
(158, 'Tamil Nadu', 'Viluppuram', 27, 0),
(159, 'Tamil Nadu', 'Namakkal', 45, 4),
(160, 'Tamil Nadu', 'Kanniyakumari', 15, 0),
(161, 'Tamil Nadu', 'Thoothukkudi', 24, 0),
(162, 'Tamil Nadu', 'Theni', 41, 0),
(163, 'Tamil Nadu', 'Dindigul', 56, 1),
(164, 'Tamil Nadu', 'Sivaganga', 6, 0),
(165, 'Tamil Nadu', 'Tirupathur', 16, 0),
(166, 'Tamil Nadu', 'Thiruvarur', 13, 0),
(167, 'Tamil Nadu', 'Ramanathapuram', 2, 0),
(168, 'Tamil Nadu', 'Thiruvallur', 30, 1),
(169, 'Tamil Nadu', 'Nagapattinam', 24, 0),
(170, 'Tamil Nadu', 'Cuddalore', 19, 4),
(171, 'Tamil Nadu', 'Kallakurichi', 3, 0),
(172, 'Tamil Nadu', 'Perambalur', 1, 0),
(173, 'Tamil Nadu', 'Tiruchirappalli', 43, 4),
(174, 'Tamil Nadu', 'The Nilgiris', 9, 0),
(175, 'Tamil Nadu', 'Ariyalur', 1, 0),
(176, 'Tamil Nadu', 'Tenkasi', 2, 1),
(177, 'Jammu and Kashmir', 'Jammu', 21, 2),
(178, 'Jammu and Kashmir', 'Srinagar', 28, 1),
(179, 'Jammu and Kashmir', 'Bandipore', 44, 0),
(180, 'Jammu and Kashmir', 'Rajouri', 3, 0),
(181, 'Jammu and Kashmir', 'Badgam', 11, 0),
(182, 'Jammu and Kashmir', 'Baramula', 36, 4),
(183, 'Jammu and Kashmir', 'Shupiyan', 15, 0),
(184, 'Jammu and Kashmir', 'Unknown', 8, 2),
(185, 'Jammu and Kashmir', 'Udhampur', 18, 0),
(186, 'Jammu and Kashmir', 'Kashmir', 20, 0),
(187, 'Jammu and Kashmir', 'Pulwama', 3, 0),
(188, 'Jammu and Kashmir', 'Kupwara', 23, 8),
(189, 'Jammu and Kashmir', 'Ganderbal', 5, 3),
(190, 'Jammu and Kashmir', 'Kulgam', 4, 1),
(191, 'Jammu and Kashmir', 'Kishtwar', 1, 0),
(192, 'Jammu and Kashmir', 'Samba', 4, 1),
(193, 'Jammu and Kashmir', 'Budaun', 1, 0),
(194, 'Karnataka', 'Bengaluru', 76, 3),
(195, 'Karnataka', 'Kalaburagi', 13, 3),
(196, 'Karnataka', 'Kodagu', 1, 0),
(197, 'Karnataka', 'Mysuru', 48, 1),
(198, 'Karnataka', 'Dharwad', 2, 0),
(199, 'Karnataka', 'Uttara Kannada', 9, 0),
(200, 'Karnataka', 'Dakshina Kannada', 12, 0),
(201, 'Karnataka', 'Chikkaballapura', 9, 0),
(202, 'Karnataka', 'Udupi', 3, 0),
(203, 'Karnataka', 'Davanagere', 3, 0),
(204, 'Karnataka', 'Tumakuru', 1, 0),
(205, 'Karnataka', 'Ballari', 6, 0),
(206, 'Karnataka', 'Bidar', 11, 0),
(207, 'Karnataka', 'Bagalkote', 8, 0),
(208, 'Karnataka', 'Belagavi', 14, 4),
(209, 'Karnataka', 'Bengaluru Rural', 4, 0),
(210, 'Karnataka', 'Gadag', 1, 0),
(211, 'Karnataka', 'Mandya', 5, 0),
(212, 'Karnataka', 'Vijayapura', 6, 6),
(213, 'Maharashtra', 'Pune', 261, 4),
(214, 'Maharashtra', 'Mumbai', 1259, 113),
(215, 'Maharashtra', 'Nagpur', 25, 0),
(216, 'Maharashtra', 'Ahmadnagar', 26, 0),
(217, 'Maharashtra', 'Thane', 145, 2),
(218, 'Maharashtra', 'Raigarh', 8, 1),
(219, 'Maharashtra', 'Yavatmal', 4, 0),
(220, 'Maharashtra', 'Aurangabad', 19, 0),
(221, 'Maharashtra', 'Ratnagiri', 5, 0),
(222, 'Maharashtra', 'Palghar', 18, 0),
(223, 'Maharashtra', 'Sangli', 26, 0),
(224, 'Maharashtra', 'Satara', 6, 0),
(225, 'Maharashtra', 'Sindhudurg', 1, 0),
(226, 'Maharashtra', 'Gondiya', 1, 0),
(227, 'Maharashtra', 'Kolhapur', 6, 0),
(228, 'Maharashtra', 'Other States*', 9, 0),
(229, 'Maharashtra', 'Jalgaon', 2, 0),
(230, 'Maharashtra', 'Buldana', 13, 0),
(231, 'Maharashtra', 'Nashik', 14, 0),
(232, 'Maharashtra', 'Osmanabad', 4, 0),
(233, 'Maharashtra', 'Washim', 1, 0),
(234, 'Maharashtra', 'Hingoli', 1, 0),
(235, 'Maharashtra', 'Amravati', 4, 0),
(236, 'Maharashtra', 'Latur', 8, 0),
(237, 'Maharashtra', 'Jalna', 1, 0),
(238, 'Maharashtra', 'Akola', 12, 0),
(239, 'Maharashtra', 'Bid', 1, 0),
(240, 'Maharashtra', 'Dhule', 1, 0),
(241, 'Maharashtra', 'Unknown', 101, 101),
(242, 'Punjab', 'Amritsar', 11, 0),
(243, 'Punjab', 'Shahid Bhagat Singh Nagar', 19, 0),
(244, 'Punjab', 'S.A.S. Nagar', 53, 3),
(245, 'Punjab', 'Hoshiarpur', 7, 0),
(246, 'Punjab', 'Jalandhar', 22, 7),
(247, 'Punjab', 'Ludhiana', 10, 0),
(248, 'Punjab', 'Patiala', 2, 0),
(249, 'Punjab', 'Rupnagar', 3, 0),
(250, 'Punjab', 'Mansa', 11, 0),
(251, 'Punjab', 'Pathankot', 16, 0),
(252, 'Punjab', 'Faridkot', 3, 1),
(253, 'Punjab', 'Barnala', 2, 0),
(254, 'Punjab', 'Fatehgarh Sahib', 2, 0),
(255, 'Punjab', 'Kapurthala', 2, 1),
(256, 'Punjab', 'Moga', 4, 0),
(257, 'Punjab', 'Sri Muktsar Sahib', 1, 0),
(258, 'Punjab', 'Sangrur', 2, 0),
(259, 'Andhra Pradesh', 'S.P.S. Nellore', 52, 4),
(260, 'Andhra Pradesh', 'Prakasam', 41, 0),
(261, 'Andhra Pradesh', 'Visakhapatnam', 20, 0),
(262, 'Andhra Pradesh', 'East Godavari', 17, 0),
(263, 'Andhra Pradesh', 'Krishna', 35, 0),
(264, 'Andhra Pradesh', 'Chittoor', 21, 1),
(265, 'Andhra Pradesh', 'Guntur', 82, 7),
(266, 'Andhra Pradesh', 'Kurnool', 84, 2),
(267, 'Andhra Pradesh', 'Anantapur', 15, 0),
(268, 'Andhra Pradesh', 'West Godavari', 22, 0),
(269, 'Andhra Pradesh', 'Y.S.R.', 31, 1),
(270, 'Uttarakhand', 'Dehradun', 18, 0),
(271, 'Uttarakhand', 'Pauri Garhwal', 2, 0),
(272, 'Uttarakhand', 'Udham Singh Nagar', 3, 0),
(273, 'Uttarakhand', 'Nainital', 8, 0),
(274, 'Uttarakhand', 'Haridwar', 3, 0),
(275, 'Uttarakhand', 'Almora', 1, 0),
(276, 'Odisha', 'Khordha', 41, 0),
(277, 'Odisha', 'Bhadrak', 3, 0),
(278, 'Odisha', 'Cuttack', 1, 0),
(279, 'Odisha', 'Puri', 1, 0),
(280, 'Odisha', 'Jajapur', 1, 0),
(281, 'Odisha', 'Kalahandi', 2, 0),
(282, 'Odisha', 'Kendrapara', 2, 0),
(283, 'Odisha', 'Dhenkanal', 1, 0),
(284, 'Odisha', 'Sundargarh', 2, 0),
(285, 'Puducherry', 'Mahe', 1, 0),
(286, 'Puducherry', 'Puducherry', 6, 0),
(287, 'West Bengal', 'Kolkata', 11, 0),
(288, 'West Bengal', 'North 24 Parganas', 4, 0),
(289, 'West Bengal', 'Nadia', 5, 0),
(290, 'West Bengal', 'Medinipur East', 3, 0),
(291, 'West Bengal', 'Kalimpong', 1, 0),
(292, 'West Bengal', 'Hooghly', 1, 0),
(293, 'West Bengal', 'Howrah', 1, 0),
(294, 'West Bengal', 'South 24 Parganas', 1, 0),
(295, 'West Bengal', 'Unknown', 107, 8),
(296, 'Chandigarh', 'Chandigarh', 21, 2),
(297, 'Chhattisgarh', 'Raipur', 5, 0),
(298, 'Chhattisgarh', 'Rajnandgaon', 1, 0),
(299, 'Chhattisgarh', 'Bilaspur', 1, 0),
(300, 'Chhattisgarh', 'Durg', 1, 0),
(301, 'Chhattisgarh', 'Korba', 10, 0),
(302, 'Chhattisgarh', 'Unknown', 7, 0),
(303, 'Gujarat', 'Rajkot', 18, 0),
(304, 'Gujarat', 'Surat', 28, 0),
(305, 'Gujarat', 'Ahmadabad', 282, 39),
(306, 'Gujarat', 'Vadodara', 101, 6),
(307, 'Gujarat', 'Gandhinagar', 15, 0),
(308, 'Gujarat', 'Kachchh', 4, 0),
(309, 'Gujarat', 'Mahesana', 2, 0),
(310, 'Gujarat', 'Bhavnagar', 23, 0),
(311, 'Gujarat', 'Porbandar', 3, 0),
(312, 'Gujarat', 'Gir Somnath', 2, 0),
(313, 'Gujarat', 'Panch Mahals', 1, 0),
(314, 'Gujarat', 'Patan', 14, 0),
(315, 'Gujarat', 'Chota Udaipur', 3, 0),
(316, 'Gujarat', 'Jamnagar', 1, 0),
(317, 'Gujarat', 'Morbi', 1, 0),
(318, 'Gujarat', 'Anand', 8, 3),
(319, 'Gujarat', 'Sabar Kantha', 1, 0),
(320, 'Gujarat', 'Dahod', 1, 0),
(321, 'Gujarat', 'Bharuch', 8, 0),
(322, 'Himachal Pradesh', 'Kangra', 4, 0),
(323, 'Himachal Pradesh', 'Una', 14, 0),
(324, 'Himachal Pradesh', 'Solan', 9, 0),
(325, 'Himachal Pradesh', 'Chamba', 4, 0),
(326, 'Himachal Pradesh', 'Sirmaur', 1, 0),
(327, 'Madhya Pradesh', 'Jabalpur', 9, 0),
(328, 'Madhya Pradesh', 'Bhopal', 134, 3),
(329, 'Madhya Pradesh', 'Indore', 311, 30),
(330, 'Madhya Pradesh', 'Ujjain', 15, 0),
(331, 'Madhya Pradesh', 'Gwalior', 6, 0),
(332, 'Madhya Pradesh', 'Shivpuri', 2, 0),
(333, 'Madhya Pradesh', 'Chhindwara', 2, 0),
(334, 'Madhya Pradesh', 'Morena', 13, 0),
(335, 'Madhya Pradesh', 'Khargone', 14, 0),
(336, 'Madhya Pradesh', 'Barwani', 14, 0),
(337, 'Madhya Pradesh', 'Betul', 1, 0),
(338, 'Madhya Pradesh', 'Vidisha', 13, 0),
(339, 'Madhya Pradesh', 'Other Region*', 1, 0),
(340, 'Madhya Pradesh', 'Sheopur', 2, 0),
(341, 'Madhya Pradesh', 'Khandwa', 6, 0),
(342, 'Madhya Pradesh', 'Dhar', 1, 0),
(343, 'Madhya Pradesh', 'Hoshangabad', 10, 0),
(344, 'Madhya Pradesh', 'Raisen', 1, 0),
(345, 'Madhya Pradesh', 'Dewas', 3, 0),
(346, 'Madhya Pradesh', 'Sagar', 1, 0),
(347, 'Madhya Pradesh', 'Shajapur', 1, 0),
(348, 'Madhya Pradesh', 'Ratlam', 1, 0),
(349, 'Madhya Pradesh', 'Mandsaur', 1, 0),
(350, 'Bihar', 'Munger', 7, 0),
(351, 'Bihar', 'Patna', 5, 0),
(352, 'Bihar', 'Siwan', 29, 0),
(353, 'Bihar', 'Nalanda', 2, 0),
(354, 'Bihar', 'Lakhisarai', 1, 0),
(355, 'Bihar', 'Gopalganj', 3, 0),
(356, 'Bihar', 'Gaya', 5, 0),
(357, 'Bihar', 'Begusarai', 7, 0),
(358, 'Bihar', 'Saran', 1, 0),
(359, 'Bihar', 'Bhagalpur', 1, 0),
(360, 'Bihar', 'Nawada', 3, 0),
(361, 'Manipur', 'Imphal West', 1, 0),
(362, 'Manipur', 'Unknown', 1, 0),
(363, 'Mizoram', 'Aizawl', 1, 0),
(364, 'Goa', 'North Goa', 4, 0),
(365, 'Goa', 'Unknown', 3, 0),
(366, 'Andaman and Nicobar Islands', 'South Andaman', 5, 0),
(367, 'Andaman and Nicobar Islands', 'North and Middle Andaman', 1, 0),
(368, 'Andaman and Nicobar Islands', 'Unknown', 5, 0),
(369, 'Jharkhand', 'Ranchi', 8, 0),
(370, 'Jharkhand', 'Hazaribagh', 2, 0),
(371, 'Jharkhand', 'Bokaro', 8, 2),
(372, 'Jharkhand', 'Kodarma', 1, 0),
(373, 'Assam', 'Cachar', 2, 0),
(374, 'Assam', 'Kamrup Metropolitan', 5, 0),
(375, 'Assam', 'Jorhat', 8, 0),
(376, 'Assam', 'Goalpara', 3, 0),
(377, 'Assam', 'Nalbari', 3, 0),
(378, 'Assam', 'South Salmara Mancachar', 1, 0),
(379, 'Assam', 'Kamrup', 1, 0),
(380, 'Assam', 'Morigaon', 1, 0),
(381, 'Assam', 'Golaghat', 1, 0),
(382, 'Assam', 'Lakhimpur', 1, 0),
(383, 'Assam', 'Dhubri', 2, 0),
(384, 'Assam', 'Hailakandi', 1, 0),
(385, 'Arunachal Pradesh', 'Lohit', 1, 0),
(386, 'Dadra and Nagar Haveli', 'Unknown', 1, 0),
(387, 'Tripura', 'Gomati', 1, 0),
(388, 'Tripura', 'North Tripura', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
CREATE TABLE IF NOT EXISTS `gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `male` int(11) NOT NULL,
  `female` int(11) NOT NULL,
  `awaiting` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `male`, `female`, `awaiting`) VALUES
(1, 1460, 569, 7249);

-- --------------------------------------------------------

--
-- Table structure for table `nationality_count`
--

DROP TABLE IF EXISTS `nationality_count`;
CREATE TABLE IF NOT EXISTS `nationality_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nationality` text NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nationality_count`
--

INSERT INTO `nationality_count` (`id`, `nationality`, `count`) VALUES
(1, 'awaiting', 1),
(2, 'India', 1171),
(3, 'Italy', 18),
(4, 'Canada', 1),
(5, 'United Kingdom', 7),
(6, 'Phillipines', 2),
(7, 'Indonesia', 15),
(8, 'Thailand', 2),
(9, 'United States of America', 1),
(10, 'Tibet', 1),
(11, 'Malaysia', 1),
(12, 'Myanmar', 1);

-- --------------------------------------------------------

--
-- Table structure for table `past_data`
--

DROP TABLE IF EXISTS `past_data`;
CREATE TABLE IF NOT EXISTS `past_data` (
  `confirmed` int(11) NOT NULL,
  `recovered` int(11) NOT NULL,
  `deaths` int(11) NOT NULL,
  `iconfirmed` int(11) NOT NULL,
  `irecovered` int(11) NOT NULL,
  `ideaths` int(11) NOT NULL,
  `date_cause` date NOT NULL,
  PRIMARY KEY (`date_cause`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `past_data`
--

INSERT INTO `past_data` (`confirmed`, `recovered`, `deaths`, `iconfirmed`, `irecovered`, `ideaths`, `date_cause`) VALUES
(1, 0, 0, 1, 0, 0, '2020-01-30'),
(1, 0, 0, 0, 0, 0, '2020-01-31'),
(1, 0, 0, 0, 0, 0, '2020-02-01'),
(2, 0, 0, 1, 0, 0, '2020-02-02'),
(3, 0, 0, 1, 0, 0, '2020-02-03'),
(3, 0, 0, 0, 0, 0, '2020-02-04'),
(3, 0, 0, 0, 0, 0, '2020-02-05'),
(3, 0, 0, 0, 0, 0, '2020-02-06'),
(3, 0, 0, 0, 0, 0, '2020-02-07'),
(3, 0, 0, 0, 0, 0, '2020-02-08'),
(3, 0, 0, 0, 0, 0, '2020-02-09'),
(3, 0, 0, 0, 0, 0, '2020-02-10'),
(3, 0, 0, 0, 0, 0, '2020-02-11'),
(3, 0, 0, 0, 0, 0, '2020-02-12'),
(3, 1, 1, 0, 1, 0, '2020-02-13'),
(3, 1, 1, 0, 0, 0, '2020-02-14'),
(3, 1, 1, 0, 0, 0, '2020-02-15'),
(3, 2, 2, 0, 1, 0, '2020-02-16'),
(3, 2, 2, 0, 0, 0, '2020-02-17'),
(3, 2, 2, 0, 0, 0, '2020-02-18'),
(3, 2, 2, 0, 0, 0, '2020-02-19'),
(3, 3, 3, 0, 1, 0, '2020-02-20'),
(3, 3, 3, 0, 0, 0, '2020-02-21'),
(3, 3, 3, 0, 0, 0, '2020-02-22'),
(3, 3, 3, 0, 0, 0, '2020-02-23'),
(3, 3, 3, 0, 0, 0, '2020-02-24'),
(3, 3, 3, 0, 0, 0, '2020-02-25'),
(3, 3, 3, 0, 0, 0, '2020-02-26'),
(3, 3, 3, 0, 0, 0, '2020-02-27'),
(3, 3, 3, 0, 0, 0, '2020-02-28'),
(3, 3, 3, 0, 0, 0, '2020-02-29'),
(3, 3, 3, 0, 0, 0, '2020-03-01'),
(5, 3, 3, 2, 0, 0, '2020-03-02'),
(6, 3, 3, 1, 0, 0, '2020-03-03'),
(28, 3, 3, 22, 0, 0, '2020-03-04'),
(30, 3, 3, 2, 0, 0, '2020-03-05'),
(31, 3, 3, 1, 0, 0, '2020-03-06'),
(34, 3, 3, 3, 0, 0, '2020-03-07'),
(39, 3, 3, 5, 0, 0, '2020-03-08'),
(48, 3, 3, 9, 0, 0, '2020-03-09'),
(63, 4, 4, 15, 1, 0, '2020-03-10'),
(71, 4, 4, 8, 0, 0, '2020-03-11'),
(81, 4, 4, 10, 0, 1, '2020-03-12'),
(91, 10, 10, 10, 6, 0, '2020-03-13'),
(102, 10, 10, 11, 0, 1, '2020-03-14'),
(112, 13, 13, 10, 3, 0, '2020-03-15'),
(126, 14, 14, 14, 1, 0, '2020-03-16'),
(146, 15, 15, 20, 1, 1, '2020-03-17'),
(171, 15, 15, 25, 0, 0, '2020-03-18'),
(198, 20, 20, 27, 5, 1, '2020-03-19'),
(256, 23, 23, 58, 3, 0, '2020-03-20'),
(334, 23, 23, 78, 0, 0, '2020-03-21'),
(403, 23, 23, 69, 0, 3, '2020-03-22'),
(497, 25, 25, 94, 2, 2, '2020-03-23'),
(571, 40, 40, 74, 15, 1, '2020-03-24'),
(657, 43, 43, 86, 3, 1, '2020-03-25'),
(730, 50, 50, 73, 7, 5, '2020-03-26'),
(883, 75, 75, 153, 25, 3, '2020-03-27'),
(1019, 85, 85, 136, 10, 5, '2020-03-28'),
(1139, 102, 102, 120, 17, 3, '2020-03-29'),
(1326, 137, 137, 187, 35, 16, '2020-03-30'),
(1635, 150, 150, 309, 13, 6, '2020-03-31'),
(2059, 169, 169, 424, 19, 7, '2020-04-01'),
(2545, 191, 191, 486, 22, 16, '2020-04-02'),
(3104, 230, 230, 559, 39, 14, '2020-04-03'),
(3683, 286, 286, 579, 56, 13, '2020-04-04'),
(4288, 329, 329, 605, 43, 22, '2020-04-05'),
(4777, 394, 394, 489, 65, 16, '2020-04-06'),
(5350, 469, 469, 573, 75, 27, '2020-04-07'),
(5915, 565, 565, 565, 96, 20, '2020-04-08'),
(6728, 635, 635, 813, 70, 46, '2020-04-09'),
(7599, 786, 786, 871, 151, 22, '2020-04-10'),
(8453, 972, 972, 854, 186, 40, '2020-04-11'),
(9205, 1080, 1080, 752, 108, 40, '2020-04-12');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE IF NOT EXISTS `states` (
  `state` text NOT NULL,
  `confirmed` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `recovered` int(11) NOT NULL,
  `deaths` int(11) NOT NULL,
  `iconfirmed` int(11) NOT NULL,
  `irecovered` int(11) NOT NULL,
  `ideaths` int(11) NOT NULL,
  `last_update` datetime NOT NULL DEFAULT '2020-04-11 22:35:00',
  PRIMARY KEY (`state`(50))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`state`, `confirmed`, `active`, `recovered`, `deaths`, `iconfirmed`, `irecovered`, `ideaths`, `last_update`) VALUES
('Maharashtra', 1982, 1616, 217, 149, 221, 9, 22, '2020-04-12 21:35:24'),
('Tamil Nadu', 1075, 1014, 50, 11, 106, 6, 1, '2020-04-12 18:10:24'),
('Delhi', 1154, 1102, 28, 24, 85, 1, 5, '2020-04-12 20:35:25'),
('Telangana', 531, 412, 103, 16, 28, 7, 2, '2020-04-12 21:50:24'),
('Rajasthan', 804, 677, 116, 11, 104, 0, 2, '2020-04-12 22:35:24'),
('Kerala', 375, 194, 179, 2, 2, 36, 0, '2020-04-12 17:35:25'),
('Uttar Pradesh', 483, 433, 45, 5, 31, 0, 0, '2020-04-12 20:40:25'),
('Andhra Pradesh', 420, 401, 12, 7, 15, 2, 1, '2020-04-12 19:20:25'),
('Madhya Pradesh', 562, 478, 41, 43, 33, 3, 3, '2020-04-12 17:20:25'),
('Karnataka', 232, 172, 54, 6, 17, 15, 0, '2020-04-12 13:50:25'),
('Gujarat', 516, 448, 44, 24, 48, 0, 2, '2020-04-12 20:20:27'),
('Haryana', 195, 148, 44, 3, 16, 8, 1, '2020-04-12 19:35:32'),
('Jammu and Kashmir', 245, 235, 6, 4, 22, 0, 0, '2020-04-12 19:20:26'),
('Punjab', 170, 135, 23, 12, 12, 3, 0, '2020-04-12 18:51:07'),
('West Bengal', 134, 110, 19, 5, 8, 3, 0, '2020-04-12 14:20:26'),
('Odisha', 54, 41, 12, 1, 0, 0, 0, '2020-04-11 23:35:26'),
('Bihar', 64, 37, 26, 1, 0, 11, 0, '2020-04-12 19:10:26'),
('Uttarakhand', 35, 30, 5, 0, 0, 0, 0, '2020-04-08 21:20:26'),
('Assam', 29, 28, 0, 1, 0, 0, 0, '2020-04-10 10:20:25'),
('Chandigarh', 21, 14, 7, 0, 2, 0, 0, '2020-04-10 18:10:27'),
('Himachal Pradesh', 32, 18, 12, 2, 0, 4, 0, '2020-04-12 21:35:27'),
('Ladakh', 15, 4, 11, 0, 0, 0, 0, '2020-04-10 11:20:26'),
('Andaman and Nicobar Islands', 11, 1, 10, 0, 0, 0, 0, '2020-03-30 11:27:27'),
('Chhattisgarh', 25, 16, 9, 0, 0, 0, 0, '2020-04-12 01:10:26'),
('Goa', 7, 2, 5, 0, 0, 0, 0, '2020-04-11 23:26:44'),
('Puducherry', 7, 6, 1, 0, 0, 0, 0, '2020-04-10 17:50:26'),
('Jharkhand', 19, 17, 0, 2, 2, 0, 1, '2020-04-12 21:50:26'),
('Manipur', 2, 1, 1, 0, 0, 0, 0, '2020-04-06 22:35:54'),
('Mizoram', 1, 1, 0, 0, 0, 0, 0, '2020-03-26 07:19:29'),
('Arunachal Pradesh', 1, 1, 0, 0, 0, 0, 0, '2020-04-02 11:42:31'),
('Dadra and Nagar Haveli', 1, 1, 0, 0, 0, 0, 0, '2020-04-06 15:22:25'),
('Tripura', 2, 2, 0, 0, 0, 0, 0, '2020-04-10 20:00:27'),
('Daman and Diu', 0, 0, 0, 0, 0, 0, 0, '2020-03-26 07:19:29'),
('Lakshadweep', 0, 0, 0, 0, 0, 0, 0, '2020-03-26 07:19:29'),
('Meghalaya', 0, 0, 0, 0, 0, 0, 0, '2020-03-26 07:19:29'),
('Nagaland', 0, 0, 0, 0, 0, 0, 0, '2020-03-26 07:19:29'),
('Sikkim', 0, 0, 0, 0, 0, 0, 0, '2020-03-26 07:19:29');

-- --------------------------------------------------------

--
-- Table structure for table `total`
--

DROP TABLE IF EXISTS `total`;
CREATE TABLE IF NOT EXISTS `total` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `recovered` int(11) NOT NULL,
  `deaths` int(11) NOT NULL,
  `itotal` int(11) NOT NULL,
  `irecovered` int(11) NOT NULL,
  `ideaths` int(11) NOT NULL,
  `last_update` datetime NOT NULL DEFAULT '2020-01-01 10:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `total`
--

INSERT INTO `total` (`id`, `total`, `active`, `recovered`, `deaths`, `itotal`, `irecovered`, `ideaths`, `last_update`) VALUES
(1, 9204, 7795, 1080, 329, 752, 108, 40, '2020-04-12 22:35:24');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
