-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2020 at 03:05 AM
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
(1, 'application', '2020-11-20 04:39:29', '2020-11-04 04:39:35'),
(2, 'health\r\n', '2020-11-23 04:39:57', '2020-11-04 04:40:02'),
(3, 'Sci-FI', '2020-11-08 23:40:03', '2020-11-08 23:40:03');

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

-- --------------------------------------------------------

--
-- Table structure for table `love_reactants`
--

CREATE TABLE `love_reactants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `love_reactants`
--

INSERT INTO `love_reactants` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Post', '2020-11-08 00:11:39', '2020-11-08 00:11:39'),
(2, 'App\\Models\\Post', '2020-11-08 00:11:39', '2020-11-08 00:11:39'),
(3, 'App\\Models\\Post', '2020-11-08 00:11:39', '2020-11-08 00:11:39'),
(4, 'App\\Models\\Post', '2020-11-08 00:11:39', '2020-11-08 00:11:39'),
(5, 'App\\Models\\Post', '2020-11-08 00:11:39', '2020-11-08 00:11:39'),
(6, 'App\\Models\\Post', '2020-11-08 00:11:39', '2020-11-08 00:11:39'),
(7, 'App\\Models\\Post', '2020-11-08 00:11:40', '2020-11-08 00:11:40'),
(8, 'App\\Models\\Post', '2020-11-08 00:11:40', '2020-11-08 00:11:40'),
(9, 'App\\Models\\Post', '2020-11-08 00:15:41', '2020-11-08 00:15:41');

-- --------------------------------------------------------

--
-- Table structure for table `love_reactant_reaction_counters`
--

CREATE TABLE `love_reactant_reaction_counters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reactant_id` bigint(20) UNSIGNED NOT NULL,
  `reaction_type_id` bigint(20) UNSIGNED NOT NULL,
  `count` bigint(20) UNSIGNED NOT NULL,
  `weight` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `love_reactant_reaction_totals`
--

CREATE TABLE `love_reactant_reaction_totals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reactant_id` bigint(20) UNSIGNED NOT NULL,
  `count` bigint(20) UNSIGNED NOT NULL,
  `weight` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `love_reacters`
--

CREATE TABLE `love_reacters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `love_reacters`
--

INSERT INTO `love_reacters` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'App\\User', '2020-11-07 10:07:16', '2020-11-07 10:07:16'),
(2, 'App\\User', '2020-11-07 10:07:16', '2020-11-07 10:07:16'),
(3, 'App\\User', '2020-11-07 10:07:17', '2020-11-07 10:07:17');

-- --------------------------------------------------------

--
-- Table structure for table `love_reactions`
--

CREATE TABLE `love_reactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reactant_id` bigint(20) UNSIGNED NOT NULL,
  `reacter_id` bigint(20) UNSIGNED NOT NULL,
  `reaction_type_id` bigint(20) UNSIGNED NOT NULL,
  `rate` decimal(4,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `love_reaction_types`
--

CREATE TABLE `love_reaction_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mass` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `love_reaction_types`
--

INSERT INTO `love_reaction_types` (`id`, `name`, `mass`, `created_at`, `updated_at`) VALUES
(1, 'Like', 1, '2020-11-07 09:48:35', '2020-11-07 09:48:35'),
(2, 'Dislike', -1, '2020-11-07 09:48:35', '2020-11-07 09:48:35');

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
(42, '2020_10_26_042346_create_likes_table', 2),
(43, '2020_10_26_053520_create_likes_table', 3),
(44, '2020_10_26_092650_create_like_dislikes_table', 4),
(45, '2020_10_27_045406_create_likes_table', 5),
(46, '2020_10_27_053815_create_likes_table', 6),
(47, '2020_10_27_082240_create_likes_table', 7),
(61, '2014_10_12_000000_create_users_table', 8),
(62, '2014_10_12_100000_create_password_resets_table', 8),
(63, '2017_03_04_131126_create_posts_table', 8),
(64, '2017_03_04_131334_create_categories_table', 8),
(65, '2017_03_04_131558_create_tags_table', 8),
(66, '2017_03_04_131702_create_post_tag_table', 8),
(67, '2017_03_04_131909_create_comments_table', 8),
(68, '2017_03_04_133429_add_columns_to_user', 8),
(69, '2020_10_14_145921_add_image_to_posts', 8),
(70, '2020_10_19_013918_add_post_type_to_posts', 8),
(71, '2020_10_27_083022_create_likes_table', 8),
(72, '2018_07_22_000100_create_love_reacters_table', 9),
(73, '2018_07_22_001000_create_love_reactants_table', 9),
(74, '2018_07_22_001500_create_love_reaction_types_table', 9),
(75, '2018_07_22_002000_create_love_reactions_table', 9),
(76, '2018_07_25_000000_create_love_reactant_reaction_counters_table', 9),
(77, '2018_07_25_001000_create_love_reactant_reaction_totals_table', 9),
(78, '2020_11_07_153629_add_love_reacter_id_to_users_table', 10),
(79, '2020_11_08_053846_add_love_reactant_id_to_posts_table', 11);

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
  `video_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `love_reactant_id` bigint(20) UNSIGNED DEFAULT NULL
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
(1, 1, 1, '2020-11-03 23:10:34', '2020-11-03 23:10:34'),
(2, 2, 2, '2020-11-05 02:36:26', '2020-11-05 02:36:26'),
(3, 2, 3, '2020-11-05 02:36:26', '2020-11-05 02:36:26'),
(4, 3, 4, '2020-11-05 02:36:59', '2020-11-05 02:36:59'),
(5, 4, 3, '2020-11-05 02:37:23', '2020-11-05 02:37:23'),
(6, 5, 3, '2020-11-05 02:42:25', '2020-11-05 02:42:25'),
(7, 6, 3, '2020-11-05 02:55:41', '2020-11-05 02:55:41'),
(8, 7, 5, '2020-11-05 03:03:23', '2020-11-05 03:03:23'),
(9, 8, 5, '2020-11-05 03:05:43', '2020-11-05 03:05:43'),
(10, 9, 3, '2020-11-05 03:06:25', '2020-11-05 03:06:25'),
(11, 10, 5, '2020-11-08 00:15:41', '2020-11-08 00:15:41');

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
(1, 'first', '2020-11-03 23:10:34', '2020-11-03 23:10:34'),
(2, 'hv', '2020-11-05 02:36:26', '2020-11-05 02:36:26'),
(3, 'jhfyufyt', '2020-11-05 02:36:26', '2020-11-05 02:36:26'),
(4, 'mhuygh', '2020-11-05 02:36:59', '2020-11-05 02:36:59'),
(5, 'lkj', '2020-11-05 03:03:23', '2020-11-05 03:03:23');

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
  `reset_key` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `love_reacter_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `api_token`, `is_admin`, `reset_key`, `love_reacter_id`) VALUES
(2, 'pothu razu', 'pothu_mnrhcwp_razu@tfbnw.net', '$2y$10$kUX21.mFFxW.TQlYPdS4WeAo6neLRqMFGG1F5fHy5g0Rcu0TGYLcO', NULL, '2020-11-03 22:42:09', '2020-11-07 10:07:16', 'VK1qo6ZjNHCOLOyliGyrRyDeI55bKkDnxa7TIPSkZwElNHTwMM', 1, NULL, 1),
(3, 'pothu razU', 'anampothuraju@gmail.com', '$2y$10$HeTOXp4uo.nTVkrQlWta0u68OcxsoQF9G2gdPEZWbB4wRXTBdAn..', NULL, '2020-11-03 22:56:40', '2020-11-07 10:07:17', 'yXSFwjOoZiwVvTKzuIxUPLOlw8FPhtRsHLNKMP3d03eXaTV4AW', 1, NULL, 2),
(4, 'man', 'man@gmail.com', '$2y$10$ayFcv9qH4cBH.Nuj4Vg28Oj/D2pHwsD6gPThyHtYxVq1nb.Jb7yQK', NULL, '2020-11-03 23:32:10', '2020-11-07 10:07:17', 'Sa6hrXDr3VcvZWOteUdkK9ARZ48PnNGEMX5nKAgApBgntHNz1i', 0, NULL, 3);

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
-- Indexes for table `love_reactants`
--
ALTER TABLE `love_reactants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `love_reactants_type_index` (`type`);

--
-- Indexes for table `love_reactant_reaction_counters`
--
ALTER TABLE `love_reactant_reaction_counters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `love_reactant_reaction_counters_reactant_reaction_type_index` (`reactant_id`,`reaction_type_id`),
  ADD KEY `love_reactant_reaction_counters_reaction_type_id_foreign` (`reaction_type_id`);

--
-- Indexes for table `love_reactant_reaction_totals`
--
ALTER TABLE `love_reactant_reaction_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `love_reactant_reaction_totals_reactant_id_foreign` (`reactant_id`);

--
-- Indexes for table `love_reacters`
--
ALTER TABLE `love_reacters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `love_reacters_type_index` (`type`);

--
-- Indexes for table `love_reactions`
--
ALTER TABLE `love_reactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `love_reactions_reactant_id_reaction_type_id_index` (`reactant_id`,`reaction_type_id`),
  ADD KEY `love_reactions_reactant_id_reacter_id_reaction_type_id_index` (`reactant_id`,`reacter_id`,`reaction_type_id`),
  ADD KEY `love_reactions_reactant_id_reacter_id_index` (`reactant_id`,`reacter_id`),
  ADD KEY `love_reactions_reacter_id_reaction_type_id_index` (`reacter_id`,`reaction_type_id`),
  ADD KEY `love_reactions_reaction_type_id_foreign` (`reaction_type_id`);

--
-- Indexes for table `love_reaction_types`
--
ALTER TABLE `love_reaction_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `love_reaction_types_name_index` (`name`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_love_reactant_id_foreign` (`love_reactant_id`);

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
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_love_reacter_id_foreign` (`love_reacter_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `love_reactants`
--
ALTER TABLE `love_reactants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `love_reactant_reaction_counters`
--
ALTER TABLE `love_reactant_reaction_counters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `love_reactant_reaction_totals`
--
ALTER TABLE `love_reactant_reaction_totals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `love_reacters`
--
ALTER TABLE `love_reacters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `love_reactions`
--
ALTER TABLE `love_reactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `love_reaction_types`
--
ALTER TABLE `love_reaction_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `love_reactant_reaction_counters`
--
ALTER TABLE `love_reactant_reaction_counters`
  ADD CONSTRAINT `love_reactant_reaction_counters_reactant_id_foreign` FOREIGN KEY (`reactant_id`) REFERENCES `love_reactants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `love_reactant_reaction_counters_reaction_type_id_foreign` FOREIGN KEY (`reaction_type_id`) REFERENCES `love_reaction_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `love_reactant_reaction_totals`
--
ALTER TABLE `love_reactant_reaction_totals`
  ADD CONSTRAINT `love_reactant_reaction_totals_reactant_id_foreign` FOREIGN KEY (`reactant_id`) REFERENCES `love_reactants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `love_reactions`
--
ALTER TABLE `love_reactions`
  ADD CONSTRAINT `love_reactions_reactant_id_foreign` FOREIGN KEY (`reactant_id`) REFERENCES `love_reactants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `love_reactions_reacter_id_foreign` FOREIGN KEY (`reacter_id`) REFERENCES `love_reacters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `love_reactions_reaction_type_id_foreign` FOREIGN KEY (`reaction_type_id`) REFERENCES `love_reaction_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_love_reactant_id_foreign` FOREIGN KEY (`love_reactant_id`) REFERENCES `love_reactants` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_love_reacter_id_foreign` FOREIGN KEY (`love_reacter_id`) REFERENCES `love_reacters` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
