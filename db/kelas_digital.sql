-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2022 at 07:36 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kelas_digital`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_post`
--

CREATE TABLE `t_post` (
  `id` int(11) NOT NULL,
  `post_title` varchar(64) NOT NULL,
  `post_description` varchar(500) NOT NULL,
  `arr_files` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_role`
--

CREATE TABLE `t_role` (
  `id` int(11) NOT NULL,
  `role_name` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_role`
--

INSERT INTO `t_role` (`id`, `role_name`, `created_at`, `deleted_at`) VALUES
(1, 'student', '2022-07-30 07:00:11', NULL),
(2, 'teacher', '2022-07-30 07:00:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_token`
--

CREATE TABLE `t_token` (
  `uuid` varchar(32) NOT NULL,
  `token` varchar(128) NOT NULL,
  `expired` timestamp NULL DEFAULT NULL,
  `user_name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_token`
--

INSERT INTO `t_token` (`uuid`, `token`, `expired`, `user_name`) VALUES
('abc', 'token_038740a545000146', NULL, 'anang'),
('f946ce95-5fb5-433a-878b-31cbd17f', 'token_2137a6ac94ae7d91', NULL, 'anang'),
('e8264480-20da-4e97-9d9a-c1bb437d', 'token_af303270a942eacf', NULL, 'anang');

-- --------------------------------------------------------

--
-- Table structure for table `t_user`
--

CREATE TABLE `t_user` (
  `user_name` varchar(32) NOT NULL,
  `password` varchar(128) NOT NULL,
  `name` varchar(32) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`user_name`, `password`, `name`, `role_id`) VALUES
('anang', '7e56452123e27d7b187ab803f16640cab13bb39bd60c61e22a439820a58f4701', 'Anang Hajiana', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_post`
--
ALTER TABLE `t_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_role`
--
ALTER TABLE `t_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`user_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_post`
--
ALTER TABLE `t_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_role`
--
ALTER TABLE `t_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
