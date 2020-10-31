-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2020 at 07:53 AM
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
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'science', '2020-10-18 21:22:25', '2020-10-18 21:22:25'),
(2, 'tech & feed', '2020-10-18 21:22:54', '2020-10-18 21:22:54'),
(3, 'agriculture', '2020-10-18 21:23:04', '2020-10-18 21:23:04'),
(4, 'games', '2020-10-18 21:23:12', '2020-10-18 21:23:12');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`) VALUES
(16, 1, 82, 'sw', '2020-10-29 15:38:39', '2020-10-29 15:38:39'),
(17, 1, 82, 'w', '2020-10-29 15:44:29', '2020-10-29 15:44:29');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `like` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `created_at`, `updated_at`, `user_id`, `post_id`, `like`) VALUES
(162, '2020-10-29 10:25:45', '2020-10-29 10:25:45', 2, 82, 1),
(163, '2020-10-29 20:20:13', '2020-10-29 20:20:16', 1, 82, 0);

-- --------------------------------------------------------

--
-- Table structure for table `like_dislikes`
--

CREATE TABLE `like_dislikes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `like` smallint(6) NOT NULL DEFAULT 0,
  `dislike` smallint(6) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `like_dislikes`
--

INSERT INTO `like_dislikes` (`id`, `post_id`, `like`, `dislike`, `created_at`, `updated_at`) VALUES
(1, 76, 1, 0, '2020-10-26 05:08:49', '2020-10-26 05:08:49'),
(2, 76, 0, 1, '2020-10-26 05:09:04', '2020-10-26 05:09:04'),
(3, 76, 1, 0, '2020-10-26 05:10:16', '2020-10-26 05:10:16'),
(4, 76, 0, 1, '2020-10-26 05:10:19', '2020-10-26 05:10:19'),
(5, 76, 1, 0, '2020-10-26 05:10:33', '2020-10-26 05:10:33'),
(6, 76, 0, 1, '2020-10-26 05:10:38', '2020-10-26 05:10:38'),
(7, 76, 1, 0, '2020-10-26 05:10:42', '2020-10-26 05:10:42'),
(8, 76, 0, 1, '2020-10-26 05:10:44', '2020-10-26 05:10:44'),
(9, 76, 1, 0, '2020-10-26 05:24:35', '2020-10-26 05:24:35'),
(10, 76, 0, 1, '2020-10-26 05:24:37', '2020-10-26 05:24:37'),
(11, 76, 1, 0, '2020-10-26 05:25:21', '2020-10-26 05:25:21'),
(12, 76, 0, 1, '2020-10-26 05:25:22', '2020-10-26 05:25:22'),
(13, 76, 1, 0, '2020-10-26 05:25:41', '2020-10-26 05:25:41'),
(14, 76, 1, 0, '2020-10-26 05:25:53', '2020-10-26 05:25:53'),
(15, 76, 1, 0, '2020-10-26 05:25:54', '2020-10-26 05:25:54'),
(16, 76, 1, 0, '2020-10-26 05:25:55', '2020-10-26 05:25:55'),
(17, 76, 1, 0, '2020-10-26 05:26:02', '2020-10-26 05:26:02'),
(18, 76, 1, 0, '2020-10-26 05:26:03', '2020-10-26 05:26:03'),
(19, 76, 0, 1, '2020-10-26 05:26:05', '2020-10-26 05:26:05'),
(20, 76, 0, 1, '2020-10-26 05:26:05', '2020-10-26 05:26:05'),
(21, 76, 1, 0, '2020-10-26 05:26:29', '2020-10-26 05:26:29'),
(22, 76, 0, 1, '2020-10-26 05:26:30', '2020-10-26 05:26:30'),
(23, 76, 1, 0, '2020-10-26 05:27:06', '2020-10-26 05:27:06'),
(24, 76, 0, 1, '2020-10-26 05:28:32', '2020-10-26 05:28:32'),
(25, 76, 1, 0, '2020-10-26 05:31:20', '2020-10-26 05:31:20'),
(26, 76, 1, 0, '2020-10-26 05:32:08', '2020-10-26 05:32:08'),
(27, 76, 1, 0, '2020-10-26 05:32:26', '2020-10-26 05:32:26'),
(28, 76, 1, 0, '2020-10-26 05:32:32', '2020-10-26 05:32:32'),
(29, 76, 1, 0, '2020-10-26 05:37:54', '2020-10-26 05:37:54'),
(30, 76, 1, 0, '2020-10-26 05:39:12', '2020-10-26 05:39:12'),
(31, 76, 1, 0, '2020-10-26 05:40:44', '2020-10-26 05:40:44'),
(32, 76, 1, 0, '2020-10-26 05:42:20', '2020-10-26 05:42:20'),
(33, 76, 0, 1, '2020-10-26 05:42:22', '2020-10-26 05:42:22'),
(34, 76, 1, 0, '2020-10-26 05:43:01', '2020-10-26 05:43:01'),
(35, 76, 0, 1, '2020-10-26 05:43:03', '2020-10-26 05:43:03'),
(36, 76, 1, 0, '2020-10-26 05:43:17', '2020-10-26 05:43:17'),
(37, 76, 1, 0, '2020-10-26 05:59:08', '2020-10-26 05:59:08'),
(38, 76, 0, 1, '2020-10-26 05:59:12', '2020-10-26 05:59:12'),
(39, 76, 1, 0, '2020-10-26 06:02:10', '2020-10-26 06:02:10'),
(40, 76, 1, 0, '2020-10-26 06:02:17', '2020-10-26 06:02:17'),
(41, 76, 1, 0, '2020-10-26 06:05:16', '2020-10-26 06:05:16'),
(42, 76, 1, 0, '2020-10-26 06:05:24', '2020-10-26 06:05:24'),
(43, 76, 1, 0, '2020-10-26 06:05:30', '2020-10-26 06:05:30'),
(44, 77, 26, 0, '2020-10-26 06:11:04', '2020-10-26 06:11:04'),
(45, 77, 0, 13, '2020-10-26 06:11:11', '2020-10-26 06:11:11');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(31, '2014_10_12_000000_create_users_table', 1),
(32, '2014_10_12_100000_create_password_resets_table', 1),
(33, '2017_03_04_131126_create_posts_table', 1),
(34, '2017_03_04_131334_create_categories_table', 1),
(35, '2017_03_04_131558_create_tags_table', 1),
(36, '2017_03_04_131702_create_post_tag_table', 1),
(37, '2017_03_04_131909_create_comments_table', 1),
(38, '2017_03_04_133429_add_columns_to_user', 1),
(39, '2020_10_14_145921_add_image_to_posts', 1),
(40, '2020_10_19_013918_add_post_type_to_posts', 1),
(42, '2020_10_26_042346_create_likes_table', 2),
(43, '2020_10_26_053520_create_likes_table', 3),
(44, '2020_10_26_092650_create_like_dislikes_table', 4),
(45, '2020_10_27_045406_create_likes_table', 5),
(46, '2020_10_27_053815_create_likes_table', 6),
(47, '2020_10_27_082240_create_likes_table', 7),
(48, '2020_10_27_083022_create_likes_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `post_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2020-10-18 21:26:45', '2020-10-18 21:26:45'),
(5, 11, 1, '2020-10-18 21:41:12', '2020-10-18 21:41:12'),
(10, 16, 1, '2020-10-19 04:28:47', '2020-10-19 04:28:47'),
(11, 17, 1, '2020-10-19 04:29:09', '2020-10-19 04:29:09'),
(12, 18, 1, '2020-10-19 04:32:02', '2020-10-19 04:32:02'),
(13, 19, 1, '2020-10-19 04:32:23', '2020-10-19 04:32:23'),
(14, 20, 1, '2020-10-19 20:54:59', '2020-10-19 20:54:59'),
(15, 21, 1, '2020-10-21 01:02:52', '2020-10-21 01:02:52'),
(24, 30, 2, '2020-10-21 01:54:46', '2020-10-21 01:54:46'),
(25, 31, 3, '2020-10-21 01:55:49', '2020-10-21 01:55:49'),
(26, 32, 1, '2020-10-21 02:42:17', '2020-10-21 02:42:17'),
(27, 33, 1, '2020-10-21 02:42:46', '2020-10-21 02:42:46'),
(28, 33, 3, '2020-10-21 02:42:46', '2020-10-21 02:42:46'),
(29, 34, 3, '2020-10-21 02:43:36', '2020-10-21 02:43:36'),
(30, 35, 2, '2020-10-21 02:45:44', '2020-10-21 02:45:44'),
(31, 36, 2, '2020-10-21 02:46:12', '2020-10-21 02:46:12'),
(32, 36, 3, '2020-10-21 02:46:12', '2020-10-21 02:46:12'),
(33, 37, 1, '2020-10-21 02:46:58', '2020-10-21 02:46:58'),
(34, 37, 2, '2020-10-21 02:46:58', '2020-10-21 02:46:58'),
(35, 37, 3, '2020-10-21 02:46:58', '2020-10-21 02:46:58'),
(36, 38, 1, '2020-10-21 02:48:05', '2020-10-21 02:48:05'),
(37, 38, 3, '2020-10-21 02:48:05', '2020-10-21 02:48:05'),
(38, 39, 2, '2020-10-21 02:48:35', '2020-10-21 02:48:35'),
(39, 40, 2, '2020-10-21 02:53:02', '2020-10-21 02:53:02'),
(40, 41, 2, '2020-10-21 03:51:16', '2020-10-21 03:51:16'),
(43, 44, 2, '2020-10-21 20:18:58', '2020-10-21 20:18:58'),
(44, 45, 4, '2020-10-21 20:30:59', '2020-10-21 20:30:59'),
(45, 46, 2, '2020-10-21 20:31:26', '2020-10-21 20:31:26'),
(46, 47, 3, '2020-10-21 21:00:18', '2020-10-21 21:00:18'),
(47, 48, 2, '2020-10-21 21:01:46', '2020-10-21 21:01:46'),
(48, 49, 2, '2020-10-22 00:01:53', '2020-10-22 00:01:53'),
(49, 50, 3, '2020-10-22 00:57:33', '2020-10-22 00:57:33'),
(50, 51, 3, '2020-10-22 00:58:20', '2020-10-22 00:58:20'),
(51, 52, 3, '2020-10-22 01:31:19', '2020-10-22 01:31:19'),
(52, 53, 3, '2020-10-22 01:44:26', '2020-10-22 01:44:26'),
(53, 54, 2, '2020-10-22 01:57:46', '2020-10-22 01:57:46'),
(55, 56, 2, '2020-10-22 01:59:56', '2020-10-22 01:59:56'),
(56, 57, 2, '2020-10-22 02:01:32', '2020-10-22 02:01:32'),
(57, 58, 2, '2020-10-22 03:12:04', '2020-10-22 03:12:04'),
(58, 58, 3, '2020-10-22 03:12:04', '2020-10-22 03:12:04'),
(59, 59, 3, '2020-10-22 03:12:55', '2020-10-22 03:12:55'),
(60, 60, 3, '2020-10-22 03:13:21', '2020-10-22 03:13:21'),
(61, 61, 3, '2020-10-22 03:13:49', '2020-10-22 03:13:49'),
(62, 62, 4, '2020-10-22 09:22:37', '2020-10-22 09:22:37'),
(63, 63, 3, '2020-10-22 09:43:00', '2020-10-22 09:43:00'),
(64, 64, 3, '2020-10-22 10:05:26', '2020-10-22 10:05:26'),
(65, 65, 3, '2020-10-22 10:08:40', '2020-10-22 10:08:40'),
(66, 66, 3, '2020-10-22 10:21:30', '2020-10-22 10:21:30'),
(67, 67, 2, '2020-10-22 10:23:01', '2020-10-22 10:23:01'),
(68, 68, 3, '2020-10-22 10:40:28', '2020-10-22 10:40:28'),
(69, 69, 3, '2020-10-22 19:44:35', '2020-10-22 19:44:35'),
(70, 70, 3, '2020-10-22 19:54:52', '2020-10-22 19:54:52'),
(71, 71, 2, '2020-10-22 19:56:13', '2020-10-22 19:56:13'),
(72, 71, 3, '2020-10-22 19:56:13', '2020-10-22 19:56:13'),
(73, 72, 3, '2020-10-22 20:25:20', '2020-10-22 20:25:20'),
(74, 73, 2, '2020-10-22 20:42:06', '2020-10-22 20:42:06'),
(75, 74, 3, '2020-10-22 20:59:20', '2020-10-22 20:59:20'),
(76, 75, 3, '2020-10-22 20:59:57', '2020-10-22 20:59:57'),
(81, 80, 3, '2020-10-27 03:13:48', '2020-10-27 03:13:48'),
(83, 82, 2, '2020-10-28 09:17:54', '2020-10-28 09:17:54'),
(85, 84, 2, '2020-10-29 20:24:12', '2020-10-29 20:24:12'),
(86, 85, 3, '2020-10-29 20:27:09', '2020-10-29 20:27:09'),
(87, 86, 3, '2020-10-29 20:28:26', '2020-10-29 20:28:26'),
(88, 87, 3, '2020-10-29 20:31:33', '2020-10-29 20:31:33'),
(89, 90, 2, '2020-10-29 20:35:50', '2020-10-29 20:35:50'),
(90, 90, 3, '2020-10-29 20:35:50', '2020-10-29 20:35:50'),
(92, 94, 3, '2020-10-29 20:43:47', '2020-10-29 20:43:47'),
(93, 96, 3, '2020-10-29 20:44:39', '2020-10-29 20:44:39'),
(94, 98, 3, '2020-10-29 20:49:17', '2020-10-29 20:49:17'),
(96, 100, 3, '2020-10-29 20:52:44', '2020-10-29 20:52:44'),
(97, 101, 3, '2020-10-29 20:53:06', '2020-10-29 20:53:06'),
(98, 102, 3, '2020-10-29 21:20:04', '2020-10-29 21:20:04'),
(99, 103, 3, '2020-10-29 21:47:30', '2020-10-29 21:47:30'),
(100, 104, 3, '2020-10-29 21:48:11', '2020-10-29 21:48:11'),
(101, 105, 3, '2020-10-29 22:45:13', '2020-10-29 22:45:13'),
(102, 106, 3, '2020-10-29 22:51:42', '2020-10-29 22:51:42'),
(103, 107, 1, '2020-10-29 23:39:24', '2020-10-29 23:39:24'),
(104, 108, 3, '2020-10-29 23:43:35', '2020-10-29 23:43:35'),
(105, 109, 3, '2020-10-29 23:43:35', '2020-10-29 23:43:35');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'tag1', '2020-10-18 21:26:45', '2020-10-18 21:26:45'),
(2, 'image', '2020-10-21 01:54:46', '2020-10-21 01:54:46'),
(3, 'video', '2020-10-21 01:55:49', '2020-10-21 01:55:49'),
(4, 's', '2020-10-21 20:30:59', '2020-10-21 20:30:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `api_token` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `reset_key` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `api_token`, `is_admin`, `reset_key`) VALUES
(1, 'Annam Pothu Raju', 'anampothuraju@gmail.com', '$2y$10$8mm3BhsXpfotS4rEtfyW/eWebs6kOCGqmtYrpXzwVw.N9V/DyN5gu', NULL, '2020-10-18 21:18:59', '2020-10-18 21:18:59', 'BCBKjNiD4GYvurBwizyy98cxHt3FbqCD6kuVbQ9p2ntAJLNNq4', 1, NULL),
(2, 'MAN', 'aravind@gmail.com', '$2y$10$lfKSm76hIgCmq68ZRKICmO727oGGSleR5Dhaaiy4MvwiiHWdDNJEm', NULL, '2020-10-21 01:29:06', '2020-10-21 01:29:06', 'Gq9Shw5ULBPpHXaCjSKtEdIutv3iMZDqXEMgx17HRwAZkzeo05', 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `like_dislikes`
--
ALTER TABLE `like_dislikes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `like_dislikes`
--
ALTER TABLE `like_dislikes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
