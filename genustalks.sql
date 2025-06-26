-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2025 at 01:46 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `genustalks`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `answer_text` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `question_id`, `user_id`, `answer_text`, `created_at`) VALUES
(4, 4, 3, 'Aku sih biasanya', '2025-06-17 20:13:05'),
(5, 7, 1, 'Aku biasa cari di canva sihh.. kualitasnya biasanya lebih baguss..', '2025-06-18 18:37:19'),
(6, 7, 12, 'cari aja di nusput', '2025-06-20 14:07:53');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `question_id`, `created_at`) VALUES
(1, 1, 7, '2025-06-18 11:20:29'),
(4, 7, 7, '2025-06-18 13:19:01');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `tags` varchar(255) NOT NULL,
  `upvotes` int(11) DEFAULT 0,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `user_id`, `title`, `description`, `created_at`, `tags`, `upvotes`, `image`) VALUES
(3, 1, 'Tips Belajar untuk UAS', 'Gimana caranya supaya fokus belajar untuk UAS. Gak ke distract sama hal lain dan main hp terus :(', '2025-06-16 20:06:05', '#Tips #Pendidikan', 0, NULL),
(4, 1, 'Tips Mengembangkan Speaking Skill bahasa Inggris', 'Temen-temen ada gak sih masukan atau tips supaya bisa meningkatkan speaking skill bahasa Inggris.Karena sejauh ini itu merupakan salah satu tantangan utama dari belajar bahasa inggris. Terima kasih semuaa..', '2025-06-17 09:07:34', '#Tips #Pendidikan #BahasaInggris', 0, 'img_6852b4d829edf.png'),
(5, 3, 'Belajar Coding Dari Nol', 'Aku sebelumnya gak punya basic coding sama sekali sebelum masuk ke jurusan Sistem Informasi. Rasanya bener-bener awam banget didunia pemograman. Kira-kira hal apa aja yang harus dilakuin biar pelan-pelan bisa ngerti coding?', '2025-06-17 21:33:16', '#pemrograman #belajar', 0, NULL),
(7, 3, 'Tempat Cari Wallpaper Dekstop Lucu', 'Lagi suka banget eksplore wallpaper dekstop lucu. Tapi dari pinterest kadang kualitasnya kurang bagus. Ada rekomendasi web atau aplikasi buat cari wallpaper lucu dengan kualitas bagus?', '2025-06-18 13:41:27', '#Wallpaper', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `photo` varchar(255) NOT NULL,
  `foto_profil` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `email`, `password`, `created_at`, `photo`, `foto_profil`) VALUES
(1, 'Meli Meliani', 'Meli Merliani', 'melimeliani654@gmail.com', '$2y$10$VNvSl1dfiNXa/DHb6uPIeOenf7t3HdOzpdzlFjwgksQg1iwdnhCrG', '2025-06-13 21:21:23', 'uploads/684c36bbbf24c_Pink Cute Dreamy Girl Academics Affirmation Desktop Wallpaper.png', NULL),
(3, 'Siti Nurhalimah', 'Siti Nurhalimah', 'ima453@gmail.com', '$2y$10$/2NKsk4FjAh21QZaOVRlMupFd8nR0EFxpbxHaIuSjYirqaAwR2QGm', '2025-06-17 18:36:56', '', 'profil_3_1750170066.webp'),
(5, 'Syahda', 'Syahda Doang', 'syahda123@gmail.com', '$2y$10$vi67xagr4cBKNfSEz3Yx7ODZflQua2O0FocZX/qN98Oz3co8zK2ZO', '2025-06-18 20:12:27', '', NULL),
(6, 'Kania Hermalisa', 'Kakan.com', 'Kania00@gmail.com', '$2y$10$aSZTmnsQpJjz0nPTr7i3beo6Eeg6.kXGwWpptgkLH54WSBAXqf.UC', '2025-06-18 20:17:02', '', NULL),
(7, 'Agnes Jesica', 'Chikezz', 'agness_ea@gmil.com', '$2y$10$1E.whkc7WgIGXho8qx0Eh.lJJqnQhVkK.6emdTpkZ650IQWWLn77e', '2025-06-18 20:18:22', '', NULL),
(11, 'Siti Nurhalimah', 'Siti Halimah', '', '$2y$10$CSS0JyRX774nUJJjB8l18uHw9S0PZ79sJZjPBJBlx7Bjmh7kE50gG', '2025-06-20 12:05:03', '', NULL),
(12, 'Falentino', 'Bang Falentinoo', '', '$2y$10$eH83DVxU2ARauHyN8Y9uIeOAUt1/X9zjRbGBj5I3znCcP8m1GAZfS', '2025-06-20 14:05:02', '', '1750403500_Untitled design (2).png'),
(13, 'Meli Meliani', 'melimerr', '', '$2y$10$0UdYPou5FzTtPDXUxh2yCe26Ewahg8cMKHoBWTU0eTaaWAtE8eiGS', '2025-06-20 19:03:44', '', NULL),
(14, 'Karina', 'Karina Cantik', '', '$2y$10$Mt.GuHoPJyVXa7d6BPuII.YybDcazT4840vQ94Q/5qA3/TZxMZ2k.', '2025-06-20 19:22:07', '', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answer_id` (`answer_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`question_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  ADD CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
