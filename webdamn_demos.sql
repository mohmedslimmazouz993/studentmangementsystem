-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2021 at 09:12 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webdamn_demos`
--

-- --------------------------------------------------------

--
-- Table structure for table `sms_attendance`
--

CREATE TABLE `sms_attendance` (
  `attendance_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `attendance_status` int(11) NOT NULL,
  `attendance_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_attendance`
--

INSERT INTO `sms_attendance` (`attendance_id`, `student_id`, `class_id`, `section_id`, `attendance_status`, `attendance_date`) VALUES
(1, 6, 2, 1, 1, '2019/06/22'),
(2, 5, 2, 1, 4, '2019/06/22'),
(3, 3, 2, 1, 3, '2019/06/22'),
(4, 7, 4, 4, 3, '2019/06/22');

-- --------------------------------------------------------

--
-- Table structure for table `sms_classes`
--

CREATE TABLE `sms_classes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(40) NOT NULL,
  `section` varchar(255) NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_classes`
--

INSERT INTO `sms_classes` (`id`, `name`, `section`, `teacher_id`) VALUES
(2, '3 eme LFIG', '1', 5),
(3, 'class2', '4', 3),
(4, 'class3', '2', 2);

-- --------------------------------------------------------

--
-- Table structure for table `sms_section`
--

CREATE TABLE `sms_section` (
  `section_id` int(11) NOT NULL,
  `section` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_section`
--

INSERT INTO `sms_section` (`section_id`, `section`) VALUES
(1, 'A'),
(2, 'B'),
(4, 'C');

-- --------------------------------------------------------

--
-- Table structure for table `sms_students`
--

CREATE TABLE `sms_students` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(40) NOT NULL,
  `gender` varchar(40) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `photo` varchar(40) DEFAULT NULL,
  `mobile` int(10) UNSIGNED NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `current_address` varchar(40) DEFAULT NULL,
  `permanent_address` varchar(40) DEFAULT NULL,
  `father_name` varchar(255) NOT NULL,
  `father_mobile` int(10) UNSIGNED NOT NULL,
  `father_occupation` varchar(255) NOT NULL,
  `mother_name` varchar(255) NOT NULL,
  `mother_mobile` int(10) UNSIGNED NOT NULL,
  `admission_no` int(11) NOT NULL,
  `roll_no` int(11) NOT NULL,
  `class` int(10) UNSIGNED NOT NULL,
  `section` int(11) NOT NULL,
  `stream` int(10) UNSIGNED DEFAULT NULL,
  `hostel` int(10) UNSIGNED DEFAULT NULL,
  `admission_date` varchar(255) NOT NULL,
  `category` int(10) UNSIGNED DEFAULT NULL,
  `academic_year` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_students`
--

INSERT INTO `sms_students` (`id`, `name`, `gender`, `dob`, `photo`, `mobile`, `email`, `current_address`, `permanent_address`, `father_name`, `father_mobile`, `father_occupation`, `mother_name`, `mother_mobile`, `admission_no`, `roll_no`, `class`, `section`, `stream`, `hostel`, `admission_date`, `category`, `academic_year`) VALUES
(8, 'Mohamed Slim Maazouz', 'male', '04/22/1993', '1610913146264316.jpg', 4294967295, 'mohamedselim.maazouz@gmail.com', '21 rue mohamed manacho mountfleury', NULL, 'Rached Maazouz', 0, '', 'Hayet nouisri', 0, 6, 4, 2, 1, NULL, NULL, '12/12/20', NULL, 2020),
(9, 'Lamine Ouedraogo', 'male', '04/24/1993', '161091327584194261_1446514765521755_2110', 4294967295, 'lamineoudriago@gmail.com', '21 rue mohamed manacho mountfleury', NULL, '', 0, '', '', 0, 1, 1, 2, 1, NULL, NULL, '12/12/20', NULL, 2020);

-- --------------------------------------------------------

--
-- Table structure for table `sms_subjects`
--

CREATE TABLE `sms_subjects` (
  `subject_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_subjects`
--

INSERT INTO `sms_subjects` (`subject_id`, `subject`, `type`, `code`) VALUES
(3, 'Devlopment Logiciel libre', 'Practical', 230);

-- --------------------------------------------------------

--
-- Table structure for table `sms_teacher`
--

CREATE TABLE `sms_teacher` (
  `teacher_id` int(11) NOT NULL,
  `teacher` varchar(255) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_teacher`
--

INSERT INTO `sms_teacher` (`teacher_id`, `teacher`, `subject_id`) VALUES
(5, 'Zina Nakhla', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sms_user`
--

CREATE TABLE `sms_user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `gender` enum('male','female') CHARACTER SET utf8 NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `image` varchar(250) NOT NULL,
  `type` varchar(250) NOT NULL DEFAULT 'general',
  `status` enum('active','pending','deleted','') NOT NULL DEFAULT 'pending',
  `authtoken` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_user`
--

INSERT INTO `sms_user` (`id`, `first_name`, `last_name`, `email`, `password`, `gender`, `mobile`, `designation`, `image`, `type`, `status`, `authtoken`) VALUES
(1, 'web', 'damn', 'admin@webdamn.com', '202cb962ac59075b964b07152d234b70', 'male', '123456789', 'Web developer', '', 'administrator', 'active', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sms_attendance`
--
ALTER TABLE `sms_attendance`
  ADD PRIMARY KEY (`attendance_id`);

--
-- Indexes for table `sms_classes`
--
ALTER TABLE `sms_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_section`
--
ALTER TABLE `sms_section`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `sms_students`
--
ALTER TABLE `sms_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_subjects`
--
ALTER TABLE `sms_subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `sms_teacher`
--
ALTER TABLE `sms_teacher`
  ADD PRIMARY KEY (`teacher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sms_attendance`
--
ALTER TABLE `sms_attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sms_classes`
--
ALTER TABLE `sms_classes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sms_section`
--
ALTER TABLE `sms_section`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sms_students`
--
ALTER TABLE `sms_students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sms_subjects`
--
ALTER TABLE `sms_subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sms_teacher`
--
ALTER TABLE `sms_teacher`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
