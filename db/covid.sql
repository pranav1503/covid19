-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 13, 2020 at 11:34 AM
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
) ENGINE=MyISAM AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `age`
--

INSERT INTO `age` (`id`, `age_range`, `counts`) VALUES
(109, '0-10', 38),
(110, '11-20', 96),
(111, '21-30', 242),
(112, '31-40', 295),
(113, '41-50', 203),
(114, '51-60', 181),
(115, '61-70', 119),
(116, '71-80', 36),
(117, '81-90', 7),
(118, '91-100', 2),
(119, '100+', 0),
(120, 'awaiting', 8351);

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
) ENGINE=MyISAM AUTO_INCREMENT=3888 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `state`, `district`, `confirmed`, `increased`) VALUES
(3501, 'Kerala', 'Thrissur', 13, 0),
(3502, 'Kerala', 'Alappuzha', 5, 0),
(3503, 'Kerala', 'Kasaragod', 166, 0),
(3504, 'Kerala', 'Pathanamthitta', 17, 0),
(3505, 'Kerala', 'Kannur', 71, 0),
(3506, 'Kerala', 'Ernakulam', 24, 0),
(3507, 'Kerala', 'Kottayam', 3, 0),
(3508, 'Kerala', 'Thiruvananthapuram', 14, 0),
(3509, 'Kerala', 'Idukki', 10, 0),
(3510, 'Kerala', 'Malappuram', 20, 0),
(3511, 'Kerala', 'Kozhikode', 13, 0),
(3512, 'Kerala', 'Palakkad', 7, 0),
(3513, 'Kerala', 'Wayanad', 3, 0),
(3514, 'Kerala', 'Kollam', 9, 0),
(3515, 'Delhi', 'East Delhi', 1, 0),
(3516, 'Delhi', 'South West Delhi', 3, 0),
(3517, 'Delhi', 'West Delhi', 2, 0),
(3518, 'Delhi', 'North Delhi', 3, 0),
(3519, 'Delhi', 'New Delhi', 5, 0),
(3520, 'Delhi', 'South Delhi', 26, 0),
(3521, 'Delhi', 'North East Delhi', 1, 0),
(3522, 'Delhi', 'North West Delhi', 3, 0),
(3523, 'Delhi', 'Unknown', 1110, 0),
(3524, 'Telangana', 'Hyderabad', 197, 0),
(3525, 'Telangana', 'Karimnagar', 18, 0),
(3526, 'Telangana', 'Bhadradri Kothagudem', 4, 0),
(3527, 'Telangana', 'Ranga Reddy', 34, 0),
(3528, 'Telangana', 'Medchal Malkajgiri', 23, 0),
(3529, 'Telangana', 'Unknown', 60, 0),
(3530, 'Telangana', 'Rajanna Sircilla', 1, 0),
(3531, 'Telangana', 'Khammam', 2, 0),
(3532, 'Telangana', 'Warangal Urban', 24, 0),
(3533, 'Telangana', 'Vikarabad', 8, 0),
(3534, 'Telangana', 'Suryapet', 9, 0),
(3535, 'Telangana', 'Siddipet', 1, 0),
(3536, 'Telangana', 'Sangareddy', 7, 0),
(3537, 'Telangana', 'Nizamabad', 49, 0),
(3538, 'Telangana', 'Medak', 5, 0),
(3539, 'Telangana', 'Mahabubnagar', 10, 0),
(3540, 'Telangana', 'Mahabubabad', 1, 0),
(3541, 'Telangana', 'Adilabad', 10, 0),
(3542, 'Telangana', 'Nirmal', 15, 0),
(3543, 'Telangana', 'Peddapalli', 2, 0),
(3544, 'Telangana', 'Jagitial', 2, 0),
(3545, 'Telangana', 'Jogulamba Gadwal', 19, 0),
(3546, 'Telangana', 'Nalgonda', 12, 0),
(3547, 'Telangana', 'Nagarkurnool', 2, 0),
(3548, 'Telangana', 'Mulugu', 2, 0),
(3549, 'Telangana', 'Kamareddy', 10, 0),
(3550, 'Telangana', 'Jayashankar', 2, 0),
(3551, 'Telangana', 'Jangoan', 2, 0),
(3552, 'Rajasthan', 'Italians*', 2, 0),
(3553, 'Rajasthan', 'Jaipur', 341, 0),
(3554, 'Rajasthan', 'Jhunjhunu', 31, 0),
(3555, 'Rajasthan', 'Bhilwara', 28, 0),
(3556, 'Rajasthan', 'Jodhpur', 51, 0),
(3557, 'Rajasthan', 'Pali', 2, 0),
(3558, 'Rajasthan', 'Sikar', 2, 0),
(3559, 'Rajasthan', 'Pratapgarh', 2, 0),
(3560, 'Rajasthan', 'Dungarpur', 5, 0),
(3561, 'Rajasthan', 'Churu', 14, 0),
(3562, 'Rajasthan', 'Ajmer', 5, 0),
(3563, 'Rajasthan', 'Evacuees', 50, 0),
(3564, 'Rajasthan', 'Alwar', 7, 0),
(3565, 'Rajasthan', 'Tonk', 59, 0),
(3566, 'Rajasthan', 'Dhaulpur', 1, 0),
(3567, 'Rajasthan', 'Udaipur', 4, 0),
(3568, 'Rajasthan', 'Bharatpur', 19, 10),
(3569, 'Rajasthan', 'Bikaner', 34, 0),
(3570, 'Rajasthan', 'Dausa', 8, 0),
(3571, 'Rajasthan', 'Banswara', 53, 1),
(3572, 'Rajasthan', 'Karauli', 3, 0),
(3573, 'Rajasthan', 'Nagaur', 6, 0),
(3574, 'Rajasthan', 'Jaisalmer', 29, 0),
(3575, 'Rajasthan', 'Kota', 40, 0),
(3576, 'Rajasthan', 'Jhalawar', 14, 0),
(3577, 'Rajasthan', 'Barmer', 1, 0),
(3578, 'Rajasthan', 'Hanumangarh', 2, 0),
(3579, 'Rajasthan', 'Evacuees*', 2, 0),
(3580, 'Haryana', 'Italians*', 14, 0),
(3581, 'Haryana', 'Gurugram', 32, 0),
(3582, 'Haryana', 'Faridabad', 31, 0),
(3583, 'Haryana', 'Panipat', 4, 0),
(3584, 'Haryana', 'Panchkula', 5, 0),
(3585, 'Haryana', 'Sonipat', 3, 0),
(3586, 'Haryana', 'Palwal', 29, 0),
(3587, 'Haryana', 'Ambala', 7, 0),
(3588, 'Haryana', 'Sirsa', 3, 0),
(3589, 'Haryana', 'Hisar', 2, 0),
(3590, 'Haryana', 'Rohtak', 1, 0),
(3591, 'Haryana', 'Nuh', 45, 0),
(3592, 'Haryana', 'Karnal', 6, 0),
(3593, 'Haryana', 'Bhiwani', 2, 0),
(3594, 'Haryana', 'Kaithal', 2, 0),
(3595, 'Haryana', 'Charki Dadri', 1, 0),
(3596, 'Haryana', 'Jind', 2, 0),
(3597, 'Haryana', 'Fatehabad', 1, 0),
(3598, 'Haryana', 'Kurukshetra', 2, 0),
(3599, 'Haryana', 'Yamunanagar', 3, 0),
(3600, 'Uttar Pradesh', 'Agra', 104, 0),
(3601, 'Uttar Pradesh', 'Ghaziabad', 27, 0),
(3602, 'Uttar Pradesh', 'Lucknow', 29, 0),
(3603, 'Uttar Pradesh', 'Gautam Buddha Nagar', 62, 0),
(3604, 'Uttar Pradesh', 'Kheri', 4, 0),
(3605, 'Uttar Pradesh', 'Moradabad', 2, 0),
(3606, 'Uttar Pradesh', 'Varanasi', 9, 0),
(3607, 'Uttar Pradesh', 'Kanpur Nagar', 9, 0),
(3608, 'Uttar Pradesh', 'Pilibhit', 2, 0),
(3609, 'Uttar Pradesh', 'Jaunpur', 4, 0),
(3610, 'Uttar Pradesh', 'Baghpat', 7, 0),
(3611, 'Uttar Pradesh', 'Shamli', 17, 0),
(3612, 'Uttar Pradesh', 'Meerut', 51, 0),
(3613, 'Uttar Pradesh', 'Bareilly', 6, 0),
(3614, 'Uttar Pradesh', 'Bulandshahr', 11, 0),
(3615, 'Uttar Pradesh', 'Basti', 9, 0),
(3616, 'Uttar Pradesh', 'Hardoi', 2, 0),
(3617, 'Uttar Pradesh', 'Shahjahanpur', 1, 0),
(3618, 'Uttar Pradesh', 'Firozabad', 15, 0),
(3619, 'Uttar Pradesh', 'Azamgarh', 4, 0),
(3620, 'Uttar Pradesh', 'Saharanpur', 28, 0),
(3621, 'Uttar Pradesh', 'Pratapgarh', 6, 0),
(3622, 'Uttar Pradesh', 'Hapur', 6, 0),
(3623, 'Uttar Pradesh', 'Ghazipur', 5, 0),
(3624, 'Uttar Pradesh', 'Banda', 2, 0),
(3625, 'Uttar Pradesh', 'Mahrajganj', 6, 0),
(3626, 'Uttar Pradesh', 'Hathras', 4, 0),
(3627, 'Uttar Pradesh', 'Mirzapur', 2, 0),
(3628, 'Uttar Pradesh', 'Rae Bareli', 2, 0),
(3629, 'Uttar Pradesh', 'Bara Banki', 1, 0),
(3630, 'Uttar Pradesh', 'Auraiya', 3, 0),
(3631, 'Uttar Pradesh', 'Mathura', 6, 0),
(3632, 'Uttar Pradesh', 'Budaun', 2, 0),
(3633, 'Uttar Pradesh', 'Kaushambi', 2, 0),
(3634, 'Uttar Pradesh', 'Bijnor', 1, 0),
(3635, 'Uttar Pradesh', 'Prayagraj', 1, 0),
(3636, 'Uttar Pradesh', 'Sitapur', 10, 0),
(3637, 'Uttar Pradesh', 'Muzaffarnagar', 7, 0),
(3638, 'Uttar Pradesh', 'Amroha', 7, 0),
(3639, 'Uttar Pradesh', 'Rampur', 6, 0),
(3640, 'Uttar Pradesh', 'Bhadohi', 1, 0),
(3641, 'Ladakh', 'Leh', 12, 0),
(3642, 'Ladakh', 'Kargil', 3, 0),
(3643, 'Tamil Nadu', 'Kancheepuram', 7, 0),
(3644, 'Tamil Nadu', 'Chennai', 200, 0),
(3645, 'Tamil Nadu', 'Erode', 64, 0),
(3646, 'Tamil Nadu', 'Coimbatore', 119, 0),
(3647, 'Tamil Nadu', 'Tirunelveli', 58, 0),
(3648, 'Tamil Nadu', 'Tiruppur', 61, 0),
(3649, 'Tamil Nadu', 'Madurai', 25, 0),
(3650, 'Tamil Nadu', 'Chengalpattu', 42, 0),
(3651, 'Tamil Nadu', 'Salem', 18, 0),
(3652, 'Tamil Nadu', 'Ranipet', 38, 0),
(3653, 'Tamil Nadu', 'Thanjavur', 11, 0),
(3654, 'Tamil Nadu', 'Vellore', 12, 0),
(3655, 'Tamil Nadu', 'Virudhunagar', 11, 0),
(3656, 'Tamil Nadu', 'Karur', 25, 0),
(3657, 'Tamil Nadu', 'Tiruvannamalai', 7, 0),
(3658, 'Tamil Nadu', 'Viluppuram', 27, 0),
(3659, 'Tamil Nadu', 'Namakkal', 45, 0),
(3660, 'Tamil Nadu', 'Kanniyakumari', 15, 0),
(3661, 'Tamil Nadu', 'Thoothukkudi', 24, 0),
(3662, 'Tamil Nadu', 'Theni', 41, 0),
(3663, 'Tamil Nadu', 'Dindigul', 56, 0),
(3664, 'Tamil Nadu', 'Sivaganga', 6, 0),
(3665, 'Tamil Nadu', 'Tirupathur', 16, 0),
(3666, 'Tamil Nadu', 'Thiruvarur', 13, 0),
(3667, 'Tamil Nadu', 'Ramanathapuram', 2, 0),
(3668, 'Tamil Nadu', 'Thiruvallur', 30, 0),
(3669, 'Tamil Nadu', 'Nagapattinam', 24, 0),
(3670, 'Tamil Nadu', 'Cuddalore', 19, 0),
(3671, 'Tamil Nadu', 'Kallakurichi', 3, 0),
(3672, 'Tamil Nadu', 'Perambalur', 1, 0),
(3673, 'Tamil Nadu', 'Tiruchirappalli', 43, 0),
(3674, 'Tamil Nadu', 'The Nilgiris', 9, 0),
(3675, 'Tamil Nadu', 'Ariyalur', 1, 0),
(3676, 'Tamil Nadu', 'Tenkasi', 2, 0),
(3677, 'Jammu and Kashmir', 'Jammu', 21, 0),
(3678, 'Jammu and Kashmir', 'Srinagar', 57, 0),
(3679, 'Jammu and Kashmir', 'Bandipore', 42, 0),
(3680, 'Jammu and Kashmir', 'Rajouri', 3, 0),
(3681, 'Jammu and Kashmir', 'Badgam', 11, 0),
(3682, 'Jammu and Kashmir', 'Baramula', 37, 0),
(3683, 'Jammu and Kashmir', 'Shupiyan', 14, 0),
(3684, 'Jammu and Kashmir', 'Udhampur', 19, 0),
(3685, 'Jammu and Kashmir', 'Pulwama', 3, 0),
(3686, 'Jammu and Kashmir', 'Kupwara', 23, 0),
(3687, 'Jammu and Kashmir', 'Ganderbal', 5, 0),
(3688, 'Jammu and Kashmir', 'Kulgam', 4, 0),
(3689, 'Jammu and Kashmir', 'Kishtwar', 1, 0),
(3690, 'Jammu and Kashmir', 'Samba', 4, 0),
(3691, 'Jammu and Kashmir', 'Budaun', 1, 0),
(3692, 'Karnataka', 'Bengaluru', 77, 1),
(3693, 'Karnataka', 'Kalaburagi', 13, 0),
(3694, 'Karnataka', 'Kodagu', 1, 0),
(3695, 'Karnataka', 'Mysuru', 48, 0),
(3696, 'Karnataka', 'Dharwad', 6, 4),
(3697, 'Karnataka', 'Uttara Kannada', 9, 0),
(3698, 'Karnataka', 'Dakshina Kannada', 12, 0),
(3699, 'Karnataka', 'Chikkaballapura', 9, 0),
(3700, 'Karnataka', 'Udupi', 3, 0),
(3701, 'Karnataka', 'Davanagere', 3, 0),
(3702, 'Karnataka', 'Tumakuru', 1, 0),
(3703, 'Karnataka', 'Ballari', 6, 0),
(3704, 'Karnataka', 'Bidar', 13, 2),
(3705, 'Karnataka', 'Bagalkote', 9, 1),
(3706, 'Karnataka', 'Belagavi', 17, 3),
(3707, 'Karnataka', 'Bengaluru Rural', 5, 1),
(3708, 'Karnataka', 'Gadag', 1, 0),
(3709, 'Karnataka', 'Mandya', 8, 3),
(3710, 'Karnataka', 'Vijayapura', 6, 0),
(3711, 'Maharashtra', 'Pune', 266, 3),
(3712, 'Maharashtra', 'Mumbai', 1357, 59),
(3713, 'Maharashtra', 'Nagpur', 28, 0),
(3714, 'Maharashtra', 'Ahmadnagar', 26, 0),
(3715, 'Maharashtra', 'Thane', 190, 5),
(3716, 'Maharashtra', 'Raigarh', 12, 0),
(3717, 'Maharashtra', 'Yavatmal', 4, 0),
(3718, 'Maharashtra', 'Aurangabad', 19, 0),
(3719, 'Maharashtra', 'Ratnagiri', 5, 0),
(3720, 'Maharashtra', 'Palghar', 28, 3),
(3721, 'Maharashtra', 'Sangli', 26, 0),
(3722, 'Maharashtra', 'Satara', 6, 0),
(3723, 'Maharashtra', 'Sindhudurg', 1, 0),
(3724, 'Maharashtra', 'Gondiya', 1, 0),
(3725, 'Maharashtra', 'Kolhapur', 6, 0),
(3726, 'Maharashtra', 'Other States*', 9, 0),
(3727, 'Maharashtra', 'Jalgaon', 2, 0),
(3728, 'Maharashtra', 'Buldana', 13, 0),
(3729, 'Maharashtra', 'Nashik', 30, 12),
(3730, 'Maharashtra', 'Osmanabad', 4, 0),
(3731, 'Maharashtra', 'Washim', 1, 0),
(3732, 'Maharashtra', 'Hingoli', 1, 0),
(3733, 'Maharashtra', 'Amravati', 5, 0),
(3734, 'Maharashtra', 'Latur', 8, 0),
(3735, 'Maharashtra', 'Jalna', 1, 0),
(3736, 'Maharashtra', 'Akola', 12, 0),
(3737, 'Maharashtra', 'Bid', 1, 0),
(3738, 'Maharashtra', 'Dhule', 1, 0),
(3739, 'Maharashtra', 'Solapur', 1, 0),
(3740, 'Punjab', 'Amritsar', 11, 0),
(3741, 'Punjab', 'Shahid Bhagat Singh Nagar', 19, 0),
(3742, 'Punjab', 'S.A.S. Nagar', 53, 0),
(3743, 'Punjab', 'Hoshiarpur', 7, 0),
(3744, 'Punjab', 'Jalandhar', 22, 0),
(3745, 'Punjab', 'Ludhiana', 10, 0),
(3746, 'Punjab', 'Patiala', 2, 0),
(3747, 'Punjab', 'Rupnagar', 3, 0),
(3748, 'Punjab', 'Mansa', 11, 0),
(3749, 'Punjab', 'Pathankot', 16, 0),
(3750, 'Punjab', 'Faridkot', 3, 0),
(3751, 'Punjab', 'Barnala', 2, 0),
(3752, 'Punjab', 'Fatehgarh Sahib', 2, 0),
(3753, 'Punjab', 'Kapurthala', 2, 0),
(3754, 'Punjab', 'Moga', 4, 0),
(3755, 'Punjab', 'Sri Muktsar Sahib', 1, 0),
(3756, 'Punjab', 'Sangrur', 2, 0),
(3757, 'Andhra Pradesh', 'S.P.S. Nellore', 52, 0),
(3758, 'Andhra Pradesh', 'Prakasam', 41, 0),
(3759, 'Andhra Pradesh', 'Visakhapatnam', 20, 0),
(3760, 'Andhra Pradesh', 'East Godavari', 17, 0),
(3761, 'Andhra Pradesh', 'Krishna', 36, 1),
(3762, 'Andhra Pradesh', 'Chittoor', 23, 2),
(3763, 'Andhra Pradesh', 'Guntur', 90, 8),
(3764, 'Andhra Pradesh', 'Kurnool', 84, 0),
(3765, 'Andhra Pradesh', 'Anantapur', 15, 0),
(3766, 'Andhra Pradesh', 'West Godavari', 23, 1),
(3767, 'Andhra Pradesh', 'Y.S.R.', 31, 0),
(3768, 'Uttarakhand', 'Dehradun', 18, 0),
(3769, 'Uttarakhand', 'Pauri Garhwal', 2, 0),
(3770, 'Uttarakhand', 'Udham Singh Nagar', 3, 0),
(3771, 'Uttarakhand', 'Nainital', 8, 0),
(3772, 'Uttarakhand', 'Haridwar', 3, 0),
(3773, 'Uttarakhand', 'Almora', 1, 0),
(3774, 'Odisha', 'Khordha', 41, 0),
(3775, 'Odisha', 'Bhadrak', 3, 0),
(3776, 'Odisha', 'Cuttack', 1, 0),
(3777, 'Odisha', 'Puri', 1, 0),
(3778, 'Odisha', 'Jajapur', 1, 0),
(3779, 'Odisha', 'Kalahandi', 2, 0),
(3780, 'Odisha', 'Kendrapara', 2, 0),
(3781, 'Odisha', 'Dhenkanal', 1, 0),
(3782, 'Odisha', 'Sundargarh', 2, 0),
(3783, 'Puducherry', 'Mahe', 1, 0),
(3784, 'Puducherry', 'Puducherry', 6, 0),
(3785, 'West Bengal', 'Kolkata', 11, 0),
(3786, 'West Bengal', 'North 24 Parganas', 4, 0),
(3787, 'West Bengal', 'Nadia', 5, 0),
(3788, 'West Bengal', 'Medinipur East', 3, 0),
(3789, 'West Bengal', 'Kalimpong', 1, 0),
(3790, 'West Bengal', 'Hooghly', 1, 0),
(3791, 'West Bengal', 'Howrah', 1, 0),
(3792, 'West Bengal', 'South 24 Parganas', 1, 0),
(3793, 'West Bengal', 'Unknown', 125, 18),
(3794, 'Chandigarh', 'Chandigarh', 21, 0),
(3795, 'Chhattisgarh', 'Raipur', 5, 0),
(3796, 'Chhattisgarh', 'Rajnandgaon', 1, 0),
(3797, 'Chhattisgarh', 'Bilaspur', 1, 0),
(3798, 'Chhattisgarh', 'Durg', 1, 0),
(3799, 'Chhattisgarh', 'Korba', 23, 0),
(3800, 'Gujarat', 'Rajkot', 18, 0),
(3801, 'Gujarat', 'Surat', 33, 5),
(3802, 'Gujarat', 'Ahmadabad', 295, 13),
(3803, 'Gujarat', 'Vadodara', 102, 1),
(3804, 'Gujarat', 'Gandhinagar', 15, 0),
(3805, 'Gujarat', 'Kachchh', 4, 0),
(3806, 'Gujarat', 'Mahesana', 2, 0),
(3807, 'Gujarat', 'Bhavnagar', 23, 0),
(3808, 'Gujarat', 'Porbandar', 3, 0),
(3809, 'Gujarat', 'Gir Somnath', 2, 0),
(3810, 'Gujarat', 'Panch Mahals', 1, 0),
(3811, 'Gujarat', 'Patan', 14, 0),
(3812, 'Gujarat', 'Chota Udaipur', 3, 0),
(3813, 'Gujarat', 'Jamnagar', 1, 0),
(3814, 'Gujarat', 'Morbi', 1, 0),
(3815, 'Gujarat', 'Anand', 9, 1),
(3816, 'Gujarat', 'Sabar Kantha', 1, 0),
(3817, 'Gujarat', 'Dahod', 1, 0),
(3818, 'Gujarat', 'Bharuch', 8, 0),
(3819, 'Gujarat', 'Banas Kantha', 2, 2),
(3820, 'Himachal Pradesh', 'Kangra', 4, 0),
(3821, 'Himachal Pradesh', 'Una', 14, 0),
(3822, 'Himachal Pradesh', 'Solan', 9, 0),
(3823, 'Himachal Pradesh', 'Chamba', 4, 0),
(3824, 'Himachal Pradesh', 'Sirmaur', 1, 0),
(3825, 'Madhya Pradesh', 'Jabalpur', 9, 0),
(3826, 'Madhya Pradesh', 'Bhopal', 134, 0),
(3827, 'Madhya Pradesh', 'Indore', 311, 0),
(3828, 'Madhya Pradesh', 'Ujjain', 15, 0),
(3829, 'Madhya Pradesh', 'Gwalior', 6, 0),
(3830, 'Madhya Pradesh', 'Shivpuri', 2, 0),
(3831, 'Madhya Pradesh', 'Chhindwara', 2, 0),
(3832, 'Madhya Pradesh', 'Morena', 13, 0),
(3833, 'Madhya Pradesh', 'Khargone', 14, 0),
(3834, 'Madhya Pradesh', 'Barwani', 14, 0),
(3835, 'Madhya Pradesh', 'Betul', 1, 0),
(3836, 'Madhya Pradesh', 'Vidisha', 13, 0),
(3837, 'Madhya Pradesh', 'Other Region*', 1, 0),
(3838, 'Madhya Pradesh', 'Sheopur', 2, 0),
(3839, 'Madhya Pradesh', 'Khandwa', 6, 0),
(3840, 'Madhya Pradesh', 'Dhar', 1, 0),
(3841, 'Madhya Pradesh', 'Hoshangabad', 10, 0),
(3842, 'Madhya Pradesh', 'Raisen', 1, 0),
(3843, 'Madhya Pradesh', 'Dewas', 3, 0),
(3844, 'Madhya Pradesh', 'Sagar', 1, 0),
(3845, 'Madhya Pradesh', 'Shajapur', 1, 0),
(3846, 'Madhya Pradesh', 'Ratlam', 1, 0),
(3847, 'Madhya Pradesh', 'Mandsaur', 1, 0),
(3848, 'Bihar', 'Munger', 7, 0),
(3849, 'Bihar', 'Patna', 5, 0),
(3850, 'Bihar', 'Siwan', 29, 0),
(3851, 'Bihar', 'Nalanda', 2, 0),
(3852, 'Bihar', 'Lakhisarai', 1, 0),
(3853, 'Bihar', 'Gopalganj', 3, 0),
(3854, 'Bihar', 'Gaya', 5, 0),
(3855, 'Bihar', 'Begusarai', 8, 1),
(3856, 'Bihar', 'Saran', 1, 0),
(3857, 'Bihar', 'Bhagalpur', 1, 0),
(3858, 'Bihar', 'Nawada', 3, 0),
(3859, 'Manipur', 'Imphal West', 1, 0),
(3860, 'Manipur', 'Unknown', 1, 0),
(3861, 'Mizoram', 'Aizawl', 1, 0),
(3862, 'Goa', 'North Goa', 4, 0),
(3863, 'Goa', 'Unknown', 3, 0),
(3864, 'Andaman and Nicobar Islands', 'South Andaman', 5, 0),
(3865, 'Andaman and Nicobar Islands', 'North and Middle Andaman', 1, 0),
(3866, 'Andaman and Nicobar Islands', 'Unknown', 5, 0),
(3867, 'Jharkhand', 'Ranchi', 8, 0),
(3868, 'Jharkhand', 'Hazaribagh', 2, 0),
(3869, 'Jharkhand', 'Bokaro', 8, 0),
(3870, 'Jharkhand', 'Kodarma', 1, 0),
(3871, 'Assam', 'Cachar', 2, 0),
(3872, 'Assam', 'Kamrup Metropolitan', 5, 0),
(3873, 'Assam', 'Jorhat', 8, 0),
(3874, 'Assam', 'Goalpara', 3, 0),
(3875, 'Assam', 'Nalbari', 3, 0),
(3876, 'Assam', 'South Salmara Mancachar', 1, 0),
(3877, 'Assam', 'Kamrup', 1, 0),
(3878, 'Assam', 'Morigaon', 1, 0),
(3879, 'Assam', 'Golaghat', 1, 0),
(3880, 'Assam', 'Lakhimpur', 1, 0),
(3881, 'Assam', 'Dhubri', 3, 1),
(3882, 'Assam', 'Hailakandi', 1, 0),
(3883, 'Arunachal Pradesh', 'Lohit', 1, 0),
(3884, 'Dadra and Nagar Haveli', 'Unknown', 1, 0),
(3885, 'Tripura', 'Gomati', 1, 0),
(3886, 'Tripura', 'North Tripura', 1, 0),
(3887, 'Nagaland', 'Dimapur', 1, 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `male`, `female`, `awaiting`) VALUES
(10, 1484, 583, 7503);

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
) ENGINE=MyISAM AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nationality_count`
--

INSERT INTO `nationality_count` (`id`, `nationality`, `count`) VALUES
(109, 'awaiting', 1),
(110, 'India', 1177),
(111, 'Italy', 18),
(112, 'Canada', 1),
(113, 'United Kingdom', 7),
(114, 'Phillipines', 2),
(115, 'Indonesia', 15),
(116, 'Thailand', 2),
(117, 'United States of America', 1),
(118, 'Tibet', 1),
(119, 'Malaysia', 1),
(120, 'Myanmar', 1);

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
(3, 1, 0, 0, 1, 0, '2020-02-13'),
(3, 1, 0, 0, 0, 0, '2020-02-14'),
(3, 1, 0, 0, 0, 0, '2020-02-15'),
(3, 2, 0, 0, 1, 0, '2020-02-16'),
(3, 2, 0, 0, 0, 0, '2020-02-17'),
(3, 2, 0, 0, 0, 0, '2020-02-18'),
(3, 2, 0, 0, 0, 0, '2020-02-19'),
(3, 3, 0, 0, 1, 0, '2020-02-20'),
(3, 3, 0, 0, 0, 0, '2020-02-21'),
(3, 3, 0, 0, 0, 0, '2020-02-22'),
(3, 3, 0, 0, 0, 0, '2020-02-23'),
(3, 3, 0, 0, 0, 0, '2020-02-24'),
(3, 3, 0, 0, 0, 0, '2020-02-25'),
(3, 3, 0, 0, 0, 0, '2020-02-26'),
(3, 3, 0, 0, 0, 0, '2020-02-27'),
(3, 3, 0, 0, 0, 0, '2020-02-28'),
(3, 3, 0, 0, 0, 0, '2020-02-29'),
(3, 3, 0, 0, 0, 0, '2020-03-01'),
(5, 3, 0, 2, 0, 0, '2020-03-02'),
(6, 3, 0, 1, 0, 0, '2020-03-03'),
(28, 3, 0, 22, 0, 0, '2020-03-04'),
(30, 3, 0, 2, 0, 0, '2020-03-05'),
(31, 3, 0, 1, 0, 0, '2020-03-06'),
(34, 3, 0, 3, 0, 0, '2020-03-07'),
(39, 3, 0, 5, 0, 0, '2020-03-08'),
(48, 3, 0, 9, 0, 0, '2020-03-09'),
(63, 4, 0, 15, 1, 0, '2020-03-10'),
(71, 4, 0, 8, 0, 0, '2020-03-11'),
(81, 4, 1, 10, 0, 1, '2020-03-12'),
(91, 10, 1, 10, 6, 0, '2020-03-13'),
(102, 10, 2, 11, 0, 1, '2020-03-14'),
(112, 13, 2, 10, 3, 0, '2020-03-15'),
(126, 14, 2, 14, 1, 0, '2020-03-16'),
(146, 15, 3, 20, 1, 1, '2020-03-17'),
(171, 15, 3, 25, 0, 0, '2020-03-18'),
(198, 20, 4, 27, 5, 1, '2020-03-19'),
(256, 23, 4, 58, 3, 0, '2020-03-20'),
(334, 23, 4, 78, 0, 0, '2020-03-21'),
(403, 23, 7, 69, 0, 3, '2020-03-22'),
(497, 25, 9, 94, 2, 2, '2020-03-23'),
(571, 40, 10, 74, 15, 1, '2020-03-24'),
(657, 43, 11, 86, 3, 1, '2020-03-25'),
(730, 50, 16, 73, 7, 5, '2020-03-26'),
(883, 75, 19, 153, 25, 3, '2020-03-27'),
(1019, 85, 24, 136, 10, 5, '2020-03-28'),
(1139, 102, 27, 120, 17, 3, '2020-03-29'),
(1326, 137, 43, 187, 35, 16, '2020-03-30'),
(1635, 150, 49, 309, 13, 6, '2020-03-31'),
(2059, 169, 56, 424, 19, 7, '2020-04-01'),
(2545, 191, 72, 486, 22, 16, '2020-04-02'),
(3105, 230, 86, 560, 39, 14, '2020-04-03'),
(3684, 286, 99, 579, 56, 13, '2020-04-04'),
(4289, 329, 121, 605, 43, 22, '2020-04-05'),
(4778, 394, 137, 489, 65, 16, '2020-04-06'),
(5351, 469, 164, 573, 75, 27, '2020-04-07'),
(5916, 565, 184, 565, 96, 20, '2020-04-08'),
(6729, 635, 230, 813, 70, 46, '2020-04-09'),
(7600, 786, 252, 871, 151, 22, '2020-04-10'),
(8454, 972, 292, 854, 186, 40, '2020-04-11'),
(9212, 1086, 334, 758, 114, 42, '2020-04-12'),
(9374, 1105, 338, 162, 19, 4, '2020-04-13');

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
('Maharashtra', 2064, 1697, 217, 150, 82, 0, 1, '2020-04-13 10:32:25'),
('Delhi', 1154, 1102, 28, 24, 0, 0, 0, '2020-04-12 20:35:25'),
('Tamil Nadu', 1075, 1014, 50, 11, 0, 0, 0, '2020-04-12 18:10:24'),
('Rajasthan', 815, 683, 121, 11, 11, 0, 0, '2020-04-13 09:18:41'),
('Madhya Pradesh', 562, 477, 41, 44, 0, 0, 1, '2020-04-13 16:16:24'),
('Gujarat', 538, 465, 47, 26, 22, 3, 2, '2020-04-13 13:07:42'),
('Telangana', 531, 412, 103, 16, 0, 0, 0, '2020-04-12 21:50:24'),
('Uttar Pradesh', 483, 433, 45, 5, 0, 0, 0, '2020-04-12 20:40:25'),
('Andhra Pradesh', 432, 413, 12, 7, 12, 0, 0, '2020-04-12 19:20:25'),
('Kerala', 375, 194, 179, 2, 0, 0, 0, '2020-04-12 17:35:25'),
('Karnataka', 247, 182, 59, 6, 15, 5, 0, '2020-04-13 13:07:44'),
('Jammu and Kashmir', 245, 235, 6, 4, 0, 0, 0, '2020-04-12 19:20:26'),
('Haryana', 195, 148, 44, 3, 0, 0, 0, '2020-04-12 19:35:32'),
('Punjab', 170, 135, 23, 12, 0, 0, 0, '2020-04-12 18:51:07'),
('West Bengal', 152, 116, 29, 7, 18, 10, 0, '2020-04-13 09:52:25'),
('Bihar', 65, 38, 26, 1, 1, 0, 0, '2020-04-12 19:10:26'),
('Odisha', 54, 40, 13, 1, 0, 1, 0, '2020-04-13 16:16:25'),
('Uttarakhand', 35, 30, 5, 0, 0, 0, 0, '2020-04-08 21:20:26'),
('Himachal Pradesh', 32, 18, 12, 2, 0, 0, 0, '2020-04-12 21:35:27'),
('Chhattisgarh', 31, 21, 10, 0, 0, 0, 0, '2020-04-13 03:22:26'),
('Assam', 30, 29, 0, 1, 1, 0, 0, '2020-04-10 10:20:25'),
('Chandigarh', 21, 14, 7, 0, 0, 0, 0, '2020-04-10 18:10:27'),
('Jharkhand', 19, 17, 0, 2, 0, 0, 0, '2020-04-12 21:50:26'),
('Ladakh', 15, 4, 11, 0, 0, 0, 0, '2020-04-10 11:20:26'),
('Andaman and Nicobar Islands', 11, 1, 10, 0, 0, 0, 0, '2020-03-30 11:27:27'),
('Goa', 7, 2, 5, 0, 0, 0, 0, '2020-04-11 23:26:44'),
('Puducherry', 7, 6, 1, 0, 0, 0, 0, '2020-04-10 17:50:26'),
('Manipur', 2, 1, 1, 0, 0, 0, 0, '2020-04-06 22:35:54'),
('Tripura', 2, 2, 0, 0, 0, 0, 0, '2020-04-10 20:00:27'),
('Mizoram', 1, 1, 0, 0, 0, 0, 0, '2020-03-26 07:19:29'),
('Arunachal Pradesh', 1, 1, 0, 0, 0, 0, 0, '2020-04-02 11:42:31'),
('Dadra and Nagar Haveli', 1, 1, 0, 0, 0, 0, 0, '2020-04-06 15:22:25'),
('Nagaland', 1, 1, 0, 0, 0, 0, 0, '2020-04-12 23:35:29'),
('Daman and Diu', 0, 0, 0, 0, 0, 0, 0, '2020-03-26 07:19:29'),
('Lakshadweep', 0, 0, 0, 0, 0, 0, 0, '2020-03-26 07:19:29'),
('Meghalaya', 0, 0, 0, 0, 0, 0, 0, '2020-03-26 07:19:29'),
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
(1, 9373, 7933, 1105, 335, 162, 19, 4, '2020-04-13 16:21:08');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
