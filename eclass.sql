-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2018 at 05:01 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eclass`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `name`, `description`) VALUES
(1, 'Komputer Sistem', 'Kursus Teknologi Komputer (Sistem) merupakan satu program latihan yang memberi pendedahan mengenai perkakasan dan juga perisian komputer serta teknik-teknik yang diperlukan untuk pemasangan, penyelenggaraan, pengesanan kerosakan, membaiki sistem dan rangkaian komputer serta merekabentuk rangkaian sistem komputer seperti Local Area Network (LAN) dan Wireless Local Area Netwaork (WLAN).'),
(2, 'Mekanik Industri', 'Kursus Teknologi Mekanik Industri merupakan satu program latihan yang memberi pendedahan mengenai kerja-kerja menggegas (bench-fitting work), fabrikasi bahan, memasang dan menyenggara mesin dan peralatan, memotong dan membentuk bahan melalui proses-proses pemesinan, menyenggara kelengkapan pneumatik, elektro-pneumatik, hidraulik dan elektro-hidraulik, serta menyenggara kelengkapan PLC.');

-- --------------------------------------------------------

--
-- Table structure for table `enroll`
--

CREATE TABLE `enroll` (
  `enroll_id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `note` int(11) NOT NULL DEFAULT '0',
  `note_datetime` varchar(128) NOT NULL,
  `quiz` int(11) NOT NULL DEFAULT '0',
  `quiz_datetime` varchar(128) NOT NULL,
  `datetime` varchar(128) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `withdraw` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enroll`
--

INSERT INTO `enroll` (`enroll_id`, `username`, `topic_id`, `note`, `note_datetime`, `quiz`, `quiz_datetime`, `datetime`, `active`, `withdraw`) VALUES
(1, 'ashahir', 3, 1, 'Monday, 16 Oct 2017 - 23:59 PM', 1, 'Wednesday, 31 Aug 2016 - 00:20 AM', 'Wednesday, 31 Aug 2016 - 00:17 AM', 1, 'Friday, 20 Jul 2018 - 22:55 PM'),
(2, 'ashahir', 7, 0, '', 0, '', 'Wednesday, 31 Aug 2016 - 00:19 AM', 0, 'Friday, 20 Jul 2018 - 22:56 PM'),
(3, 'ashahir', 4, 0, '', 0, '', 'Wednesday, 31 Aug 2016 - 00:20 AM', 0, 'Friday, 20 Jul 2018 - 22:57 PM'),
(4, 'ashahir', 8, 0, '', 0, '', 'Friday, 20 Jul 2018 - 22:54 PM', 0, 'Friday, 20 Jul 2018 - 22:56 PM'),
(5, 'ashahir', 9, 0, '', 0, '', 'Friday, 20 Jul 2018 - 22:55 PM', 0, 'Friday, 20 Jul 2018 - 22:57 PM'),
(6, 'ashahir', 10, 0, '', 0, '', 'Friday, 20 Jul 2018 - 22:55 PM', 0, 'Friday, 20 Jul 2018 - 22:57 PM');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `module_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`module_id`, `course_id`, `name`, `code`) VALUES
(1, 1, 'Aplikasi Pejabat', 'F01-01-10'),
(2, 2, 'Asas Pengukuran', 'M01-01-11');

-- --------------------------------------------------------

--
-- Table structure for table `note`
--

CREATE TABLE `note` (
  `note_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `page` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `note`
--

INSERT INTO `note` (`note_id`, `topic_id`, `page`, `title`, `content`) VALUES
(1, 3, 1, 'Title 1', 'Page 1'),
(2, 3, 2, 'Title 2', 'Page 2'),
(3, 3, 3, 'Title 3', 'Page 3'),
(4, 3, 4, 'Title 4', 'Page 4');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `quiz_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `option0` text NOT NULL,
  `option1` text NOT NULL,
  `option2` text NOT NULL,
  `option3` text NOT NULL,
  `answer` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`quiz_id`, `topic_id`, `question`, `option0`, `option1`, `option2`, `option3`, `answer`) VALUES
(3, 3, 'Siapa saya?', 'ahmad shahir', 'ahmad deedat', 'ahmad aufa', 'ahmad albab', '0'),
(4, 3, 'Berikan nama ibu negeri Malaysia?', 'Alor Setar', 'Seremban', 'Shah Alam', 'Kuala Lumpur', '3'),
(5, 3, 'Nama isteri saya', 'Rosmah', 'Rosnah', 'Rohsan', 'Rose', '1'),
(6, 3, 'Berapa anak saya?', '1', '2', '3', '4', '2'),
(7, 3, 'Berapa ana lelaki saya?', '1', '2', '3', '4', '0'),
(8, 3, 'Berapa anak perempuan saya?', '1', '2', '3', '4', '1'),
(9, 3, 'Berapa kereta saya?', '1', '2', '3', '4', '1');

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

CREATE TABLE `score` (
  `score_id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `mark` int(11) NOT NULL DEFAULT '0',
  `datetime` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `score`
--

INSERT INTO `score` (`score_id`, `username`, `topic_id`, `mark`, `datetime`) VALUES
(1, 'ashahir', 3, 43, 'Wednesday, 31 Aug 2016 - 00:18 AM'),
(2, 'ashahir', 3, 71, 'Wednesday, 31 Aug 2016 - 00:20 AM'),
(3, 'ashahir', 3, 57, 'Wednesday, 31 Aug 2016 - 00:33 AM'),
(4, 'ashahir', 3, 57, 'Wednesday, 31 Aug 2016 - 00:41 AM'),
(5, 'ashahir', 3, 0, 'Wednesday, 31 Aug 2016 - 00:52 AM'),
(6, 'ashahir', 3, 0, 'Wednesday, 31 Aug 2016 - 01:01 AM'),
(7, 'ashahir', 3, 43, 'Wednesday, 9 Nov 2016 - 22:16 PM'),
(8, 'ashahir', 3, 0, 'Wednesday, 9 Nov 2016 - 22:24 PM'),
(9, 'ashahir', 3, 0, 'Wednesday, 9 Nov 2016 - 22:33 PM'),
(10, 'ashahir', 3, 0, 'Wednesday, 9 Nov 2016 - 22:49 PM'),
(11, 'ashahir', 3, 0, 'Wednesday, 9 Nov 2016 - 22:49 PM'),
(12, 'ashahir', 3, 0, 'Tuesday, 17 Oct 2017 - 00:00 AM');

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `topic_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `le_no` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`topic_id`, `module_id`, `le_no`, `name`, `description`) VALUES
(3, 1, 1, 'Asas Terangkas', 'Asas menaip'),
(4, 1, 4, 'MS Office Word', 'Pengenalan kepada MS Office Word'),
(7, 1, 3, 'MS Office Excel', 'Pengenalan kepada MS Office Excel'),
(8, 1, 2, 'Ms Office Powerpoint', 'Pengenalan kepada MS Office Powerpoint'),
(9, 2, 1, 'Alat Pengukuran', 'Pengenalan kepada alat pengukuran'),
(10, 2, 2, 'Kaedah Pengukuran', 'Kaedah menggunakan alat pengukuran');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `pass` varchar(256) NOT NULL,
  `fullname` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `last_login` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `pass`, `fullname`, `email`, `active`, `last_login`) VALUES
(10, 'ashahir', 'e10adc3949ba59abbe56e057f20f883e', 'ahmad shahir', 'ashahir@gmail.com', 1, 'Friday, 20 Jul 2018 - 22:55 PM');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `enroll`
--
ALTER TABLE `enroll`
  ADD PRIMARY KEY (`enroll_id`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`module_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`note_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`quiz_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`score_id`),
  ADD KEY `username` (`username`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`topic_id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `enroll`
--
ALTER TABLE `enroll`
  MODIFY `enroll_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `note`
--
ALTER TABLE `note`
  MODIFY `note_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `quiz_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `score`
--
ALTER TABLE `score`
  MODIFY `score_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `topic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enroll`
--
ALTER TABLE `enroll`
  ADD CONSTRAINT `enroll_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`topic_id`),
  ADD CONSTRAINT `enroll_ibfk_2` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Constraints for table `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `module_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

--
-- Constraints for table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`topic_id`);

--
-- Constraints for table `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `score_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`topic_id`),
  ADD CONSTRAINT `score_ibfk_2` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Constraints for table `topic`
--
ALTER TABLE `topic`
  ADD CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
