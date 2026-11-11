-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 11, 2026 at 09:13 AM
-- Server version: 5.7.24
-- PHP Version: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fitness_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','superadmin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `email`, `password`, `full_name`, `role`, `is_active`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'superadmin@fitness.hu', '$2a$10$abcdefghijklmnopqrstuuABCDEFGHIJKLMNOPQRSTUVWXYZ0123', 'Fő Adminisztrátor', 'superadmin', 1, '2026-11-09 08:15:00', '2026-11-10 08:58:23', '2026-11-10 08:58:23'),
(2, 'admin_gabor', 'gabor.admin@fitness.hu', '$2a$10$abcdefghijklmnopqrstuuABCDEFGHIJKLMNOPQRSTUVWXYZ0123', 'Horváth Gábor', 'admin', 1, '2026-11-08 14:40:00', '2026-11-10 08:58:23', '2026-11-10 08:58:23'),
(6, 'aadmin', 'aadmin@fitness.hu', '$2b$12$sZsZGM1QAI0YQB0Ogyub0u6Zw834YDbHDuNwa1RW44tZ6zGZbvAw6', 'Fő Adminisztrátor', 'superadmin', 1, '2026-11-09 08:15:00', '2026-11-10 09:50:51', '2026-11-10 09:50:51'),
(7, 'badmin', 'badmin@fitness.hu', '$2b$12$6wpzMgi.Uh6GAgd84/CNSuogS9pHdHoz8B.7z3za8.Xr3KOpTOF6G', 'Horváth Gábor', 'admin', 1, '2026-11-08 14:40:00', '2026-11-10 09:50:51', '2026-11-10 09:50:51');

-- --------------------------------------------------------

--
-- Table structure for table `exercises`
--

CREATE TABLE `exercises` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `muscle_group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `difficulty` enum('beginner','intermediate','advanced') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'beginner'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exercises`
--

INSERT INTO `exercises` (`id`, `name`, `muscle_group`, `description`, `difficulty`) VALUES
(1, 'Fekvenyomás', 'Mell', 'Fekvőpadon végzett nyomás rúddal vagy kézisúlyzóval.', 'intermediate'),
(2, 'Guggolás', 'Láb', 'Vállszéles terpeszben végzett mély guggolás.', 'beginner'),
(3, 'Felhúzás', 'Hát', 'Rúd felemelése a földről egyenes háttal.', 'advanced'),
(4, 'Húzódzkodás', 'Hát', 'Húzódzkodás a rúdon, saját testsúllyal.', 'advanced'),
(5, 'Fekvőtámasz', 'Mell', 'Klasszikus fekvőtámasz saját testsúllyal.', 'beginner'),
(6, 'Vállnyomás', 'Váll', 'Súlyzó fej fölé nyomása ülve vagy állva.', 'intermediate'),
(7, 'Bicepsz hajlítás', 'Kar', 'Kézisúlyzós bicepsz hajlítás.', 'beginner'),
(8, 'Tricepsz letolás', 'Kar', 'Tricepsz letolás csigán.', 'beginner'),
(9, 'Plank', 'Core', 'Alkartámasz, a test egyenesen tartása.', 'beginner'),
(10, 'Kitörés', 'Láb', 'Előre lépéses kitörés váltott lábbal.', 'beginner'),
(11, 'Evezés', 'Hát', 'Hajlított törzsű evezés rúddal.', 'intermediate'),
(12, 'Hasprés', 'Core', 'Hanyattfekvésből végzett hasprés.', 'beginner'),
(13, 'Futás', 'Kardió', 'Egyenletes tempójú futás.', 'beginner'),
(14, 'Ugrókötelezés', 'Kardió', 'Ugrókötelezés folyamatosan vagy intervallumokban.', 'intermediate'),
(15, 'Csípőemelés', 'Farizom', 'Hanyattfekvésből csípőemelés, súllyal vagy anélkül.', 'beginner');

-- --------------------------------------------------------

--
-- Table structure for table `exercise_logs`
--

CREATE TABLE `exercise_logs` (
  `id` int(10) NOT NULL,
  `workout_log_id` int(10) UNSIGNED NOT NULL,
  `exercise_id` int(10) UNSIGNED NOT NULL,
  `sets` tinyint(3) UNSIGNED NOT NULL,
  `reps` smallint(5) UNSIGNED NOT NULL,
  `weight` decimal(6,2) DEFAULT NULL COMMENT 'kg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exercise_logs`
--

INSERT INTO `exercise_logs` (`id`, `workout_log_id`, `exercise_id`, `sets`, `reps`, `weight`) VALUES
(1, 1, 2, 3, 15, '0.00'),
(2, 1, 5, 3, 8, '0.00'),
(3, 1, 9, 3, 30, '0.00'),
(4, 1, 10, 3, 12, '4.00'),
(5, 2, 2, 3, 15, '0.00'),
(6, 2, 5, 3, 10, '0.00'),
(7, 2, 10, 3, 12, '6.00'),
(8, 3, 1, 4, 8, '80.00'),
(9, 3, 3, 4, 6, '100.00'),
(10, 3, 6, 3, 10, '40.00'),
(11, 3, 7, 3, 12, '16.00'),
(12, 4, 5, 3, 12, '0.00'),
(13, 4, 9, 3, 40, '0.00'),
(14, 4, 12, 3, 15, '0.00'),
(15, 5, 2, 5, 5, '130.00'),
(16, 5, 3, 5, 3, '160.00'),
(17, 5, 1, 5, 5, '110.00'),
(18, 5, 4, 4, 8, '10.00'),
(19, 6, 1, 4, 8, '82.50'),
(20, 6, 3, 4, 6, '105.00'),
(21, 6, 8, 3, 12, '30.00');

-- --------------------------------------------------------

--
-- Table structure for table `progress`
--

CREATE TABLE `progress` (
  `id` int(10) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `weight` decimal(5,2) DEFAULT NULL COMMENT 'kg',
  `body_fat` decimal(4,1) DEFAULT NULL COMMENT '%',
  `recorded_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `progress`
--

INSERT INTO `progress` (`id`, `user_id`, `weight`, `body_fat`, `recorded_at`) VALUES
(1, 1, '70.00', '32.0', '2026-09-15 08:00:00'),
(2, 1, '68.50', '31.2', '2026-10-01 08:00:00'),
(3, 1, '67.80', '30.6', '2026-10-15 08:00:00'),
(4, 2, '78.50', '17.5', '2026-09-15 07:30:00'),
(5, 2, '80.00', '17.8', '2026-10-15 07:30:00'),
(6, 3, '62.50', '24.0', '2026-09-20 09:00:00'),
(7, 3, '62.00', '23.7', '2026-10-20 09:00:00'),
(8, 4, '89.00', '15.0', '2026-09-10 07:00:00'),
(9, 4, '90.50', '15.4', '2026-10-10 07:00:00'),
(10, 5, '58.50', '21.0', '2026-09-25 06:45:00'),
(11, 5, '58.00', '20.6', '2026-10-25 06:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date DEFAULT NULL,
  `profile_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `full_name`, `birth_date`, `profile_image`, `created_at`, `updated_at`, `deleted_at`, `is_deleted`) VALUES
(1, 'kovacs_anna', 'anna.kovacs@example.com', '$2b$12$e2LA5V5NjlV/PC9aIkc.8OLgxBHfZoiaV5lw19JbPv7uw4Ccj.PI2', 'Kovács Anna', '1996-03-14', 'uploads/profiles/user_1.jpg', '2026-11-10 09:50:51', '2026-11-10 09:50:51', '2026-11-10 09:50:51', 0),
(2, 'nagy_peter', 'peter.nagy@example.com', '$2b$12$sMXJRbo7lGXGHa7NDLKB/.ufHeKaYl3389yKM6y64k//zVkr4l1Ey', 'Nagy Péter', '1991-07-02', 'uploads/profiles/user_2.jpg', '2026-11-10 09:50:51', '2026-11-10 09:50:51', '2026-11-10 09:50:51', 0),
(3, 'szabo_eszter', 'eszter.szabo@example.com', '$2b$12$DT/IOUpr7gfXjc8Tn/HyceI9yTVBZzjjvXf.vvyzyYXZf2zRk2eW6', 'Szabó Eszter', '2001-11-23', NULL, '2026-11-10 09:50:51', '2026-11-10 09:50:51', '2026-11-10 09:50:51', 0),
(4, 'toth_balazs', 'balazs.toth@example.com', '$2b$12$RIUj2gZEgrTR0pIRvFhWmO0uHMGMDPQGvJwSOLOj6rVynapFTAq4G', 'Tóth Balázs', '1988-01-30', 'uploads/profiles/user_4.jpg', '2026-11-10 09:50:51', '2026-11-10 09:50:51', '2026-11-10 09:50:51', 0),
(5, 'kiss_dora', 'dora.kiss@example.com', '$2b$12$U9LtwPGkS7QDseOnzQ8WauQE4n0P4A16hA7aQn8auL/JDU1Q6b2he', 'Kiss Dóra', '1999-09-08', NULL, '2026-11-10 09:50:51', '2026-11-10 09:50:51', '2026-11-10 09:50:51', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_fitness`
--

CREATE TABLE `user_fitness` (
  `id` int(10) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `height` decimal(5,2) DEFAULT NULL COMMENT 'cm',
  `weight` decimal(5,2) DEFAULT NULL COMMENT 'kg',
  `goal` enum('weight_loss','muscle_gain','maintenance','endurance','strength') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fitness_level` enum('beginner','intermediate','advanced') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `workouts_per_week` tinyint(3) UNSIGNED DEFAULT NULL,
  `workout_duration` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'perc',
  `workout_location` enum('home','gym','outdoor') COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_fitness`
--

INSERT INTO `user_fitness` (`id`, `user_id`, `height`, `weight`, `goal`, `fitness_level`, `workouts_per_week`, `workout_duration`, `workout_location`) VALUES
(1, 1, '165.00', '68.50', 'weight_loss', 'beginner', 3, 45, 'home'),
(2, 2, '182.00', '80.00', 'muscle_gain', 'intermediate', 4, 75, 'gym'),
(3, 3, '170.00', '62.00', 'maintenance', 'beginner', 3, 40, 'home'),
(4, 4, '178.00', '90.50', 'strength', 'advanced', 5, 80, 'gym'),
(5, 5, '168.00', '58.00', 'endurance', 'intermediate', 4, 50, 'outdoor');

-- --------------------------------------------------------

--
-- Table structure for table `workout_logs`
--

CREATE TABLE `workout_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `workout_plan_id` int(10) UNSIGNED DEFAULT NULL,
  `started_at` datetime NOT NULL,
  `finished_at` datetime DEFAULT NULL,
  `duration` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'perc'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workout_logs`
--

INSERT INTO `workout_logs` (`id`, `user_id`, `workout_plan_id`, `started_at`, `finished_at`, `duration`) VALUES
(1, 1, 1, '2026-10-01 18:00:00', '2026-10-01 18:55:00', 55),
(2, 1, 1, '2026-10-04 18:10:00', '2026-10-04 19:00:00', 50),
(3, 2, 2, '2026-10-02 17:30:00', '2026-10-02 18:45:00', 75),
(4, 3, 3, '2026-10-03 08:00:00', '2026-10-03 08:40:00', 40),
(5, 4, 4, '2026-10-05 19:00:00', '2026-10-05 20:15:00', 75),
(6, 2, 2, '2026-10-06 17:30:00', '2026-10-06 18:40:00', 70);

-- --------------------------------------------------------

--
-- Table structure for table `workout_plans`
--

CREATE TABLE `workout_plans` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `goal` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workout_plans`
--

INSERT INTO `workout_plans` (`id`, `user_id`, `name`, `goal`, `created_at`, `updated_at`) VALUES
(1, 1, 'Kezdő zsírégető', 'Fogyás', '2026-11-10 09:50:51', '2026-11-10 09:50:51'),
(2, 2, 'Push-pull tömegnövelő', 'Izomtömeg növelése', '2026-11-10 09:50:51', '2026-11-10 09:50:51'),
(3, 3, 'Otthoni karbantartó', 'Formában maradás', '2026-11-10 09:50:51', '2026-11-10 09:50:51'),
(4, 4, 'Erőfejlesztő program', 'Erőnövelés', '2026-11-10 09:50:51', '2026-11-10 09:50:51'),
(5, 5, 'Állóképességi terv', 'Állóképesség javítása', '2026-11-10 09:50:51', '2026-11-10 09:50:51');

-- --------------------------------------------------------

--
-- Table structure for table `workout_plan_exercises`
--

CREATE TABLE `workout_plan_exercises` (
  `id` int(10) UNSIGNED NOT NULL,
  `workout_plan_id` int(10) UNSIGNED NOT NULL,
  `exercise_id` int(10) UNSIGNED NOT NULL,
  `sets` tinyint(3) UNSIGNED NOT NULL,
  `reps` smallint(5) UNSIGNED NOT NULL,
  `rest_seconds` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workout_plan_exercises`
--

INSERT INTO `workout_plan_exercises` (`id`, `workout_plan_id`, `exercise_id`, `sets`, `reps`, `rest_seconds`) VALUES
(1, 1, 2, 3, 15, 60),
(2, 1, 5, 3, 10, 60),
(3, 1, 9, 3, 30, 45),
(4, 1, 10, 3, 12, 60),
(5, 1, 13, 1, 20, 0),
(6, 2, 1, 4, 8, 90),
(7, 2, 3, 4, 6, 120),
(8, 2, 6, 3, 10, 90),
(9, 2, 7, 3, 12, 60),
(10, 2, 8, 3, 12, 60),
(11, 3, 5, 3, 12, 60),
(12, 3, 9, 3, 40, 45),
(13, 3, 12, 3, 15, 45),
(14, 3, 14, 3, 60, 30),
(15, 3, 15, 3, 15, 45),
(16, 4, 2, 5, 5, 150),
(17, 4, 3, 5, 3, 180),
(18, 4, 1, 5, 5, 150),
(19, 4, 4, 4, 8, 120),
(20, 5, 13, 1, 40, 0),
(21, 5, 14, 4, 90, 30),
(22, 5, 10, 3, 15, 45),
(23, 5, 12, 3, 20, 30);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_admins_username` (`username`),
  ADD UNIQUE KEY `uq_admins_email` (`email`);

--
-- Indexes for table `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_exercises_name` (`name`),
  ADD KEY `idx_exercises_muscle_group` (`muscle_group`);

--
-- Indexes for table `exercise_logs`
--
ALTER TABLE `exercise_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_exercise_logs_workout` (`workout_log_id`),
  ADD KEY `idx_exercise_logs_exercise` (`exercise_id`);

--
-- Indexes for table `progress`
--
ALTER TABLE `progress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_progress_user` (`user_id`,`recorded_at`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_users_username` (`username`),
  ADD UNIQUE KEY `uq_users_email` (`email`);

--
-- Indexes for table `user_fitness`
--
ALTER TABLE `user_fitness`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_user_fitness_user` (`user_id`);

--
-- Indexes for table `workout_logs`
--
ALTER TABLE `workout_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_workout_logs_user` (`user_id`,`started_at`),
  ADD KEY `idx_workout_logs_plan` (`workout_plan_id`);

--
-- Indexes for table `workout_plans`
--
ALTER TABLE `workout_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_workout_plans_user` (`user_id`);

--
-- Indexes for table `workout_plan_exercises`
--
ALTER TABLE `workout_plan_exercises`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wpe_plan` (`workout_plan_id`),
  ADD KEY `idx_wpe_exercise` (`exercise_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `exercises`
--
ALTER TABLE `exercises`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `exercise_logs`
--
ALTER TABLE `exercise_logs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `progress`
--
ALTER TABLE `progress`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_fitness`
--
ALTER TABLE `user_fitness`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `workout_logs`
--
ALTER TABLE `workout_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `workout_plans`
--
ALTER TABLE `workout_plans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `workout_plan_exercises`
--
ALTER TABLE `workout_plan_exercises`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exercise_logs`
--
ALTER TABLE `exercise_logs`
  ADD CONSTRAINT `fk_exercise_logs_exercise` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_exercise_logs_workout` FOREIGN KEY (`workout_log_id`) REFERENCES `workout_logs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `progress`
--
ALTER TABLE `progress`
  ADD CONSTRAINT `fk_progress_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_fitness`
--
ALTER TABLE `user_fitness`
  ADD CONSTRAINT `fk_user_fitness_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `workout_logs`
--
ALTER TABLE `workout_logs`
  ADD CONSTRAINT `fk_workout_logs_plan` FOREIGN KEY (`workout_plan_id`) REFERENCES `workout_plans` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_workout_logs_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `workout_plans`
--
ALTER TABLE `workout_plans`
  ADD CONSTRAINT `fk_workout_plans_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `workout_plan_exercises`
--
ALTER TABLE `workout_plan_exercises`
  ADD CONSTRAINT `fk_wpe_exercise` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_wpe_plan` FOREIGN KEY (`workout_plan_id`) REFERENCES `workout_plans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
