-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2026 at 07:09 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart_food_redistribution`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-jubayer.islam264477@gmail.com|127.0.0.1', 'i:1;', 1778082636),
('laravel-cache-jubayer.islam264477@gmail.com|127.0.0.1:timer', 'i:1778082636;', 1778082636);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `food_category` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `expiry_time` datetime NOT NULL,
  `location` varchar(255) NOT NULL,
  `special_instructions` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'available',
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `donor_id` bigint(20) UNSIGNED NOT NULL,
  `receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `moderated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `moderated_at` timestamp NULL DEFAULT NULL,
  `moderation_reason` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quantity_kg` decimal(8,2) NOT NULL DEFAULT 0.00,
  `image_path` varchar(255) DEFAULT NULL,
  `picked_up_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`id`, `food_category`, `quantity`, `expiry_time`, `location`, `special_instructions`, `status`, `is_hidden`, `donor_id`, `receiver_id`, `moderated_by`, `moderated_at`, `moderation_reason`, `created_at`, `updated_at`, `quantity_kg`, `image_path`, `picked_up_at`) VALUES
(1, 'Cooked Meals', '50 Servings', '2026-05-05 16:42:26', 'Downtown Central', NULL, 'completed', 0, 2, 3, NULL, NULL, NULL, '2025-11-30 10:42:26', '2026-04-30 10:42:26', 45.50, NULL, NULL),
(2, 'Cooked Meals', '50 Servings', '2026-05-05 16:42:26', 'Downtown Central', NULL, 'available', 0, 2, NULL, NULL, NULL, NULL, '2025-12-30 10:42:26', '2026-04-30 10:42:26', 62.00, NULL, NULL),
(3, 'Cooked Meals', '50 Servings', '2026-05-05 16:42:26', 'Downtown Central', NULL, 'completed', 0, 2, 3, NULL, NULL, NULL, '2026-01-30 10:42:26', '2026-04-30 10:42:26', 38.50, NULL, NULL),
(4, 'Cooked Meals', '50 Servings', '2026-05-05 16:42:26', 'Downtown Central', NULL, 'available', 0, 2, NULL, NULL, NULL, NULL, '2026-03-02 10:42:26', '2026-04-30 10:42:26', 82.00, NULL, NULL),
(5, 'Cooked Meals', '50 Servings', '2026-05-05 16:42:26', 'Downtown Central', NULL, 'completed', 0, 2, 3, NULL, NULL, NULL, '2026-03-30 10:42:26', '2026-04-30 10:42:26', 55.50, NULL, NULL),
(6, 'Bakery Items', '10', '2026-05-22 21:53:00', 'Uttara, Dhaka', 'Urgent food supply', 'claimed', 0, 2, 3, NULL, NULL, NULL, '2026-05-06 09:53:48', '2026-05-06 10:04:43', 10.00, 'donations/VpdxhwKHHgZL0T16LUq4lVrgin4nZ6iWU1npEWbU.jpg', NULL),
(7, 'Bakery Items', '5', '2026-05-20 22:03:00', 'Uttara, Dhaka', 'Lorem ispusum', 'available', 0, 2, NULL, NULL, NULL, NULL, '2026-05-06 10:03:56', '2026-05-06 10:03:56', 10.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_04_05_161344_create_donations_table', 1),
(5, '2026_04_05_162430_add_role_and_org_to_users_table', 1),
(6, '2026_04_05_162438_add_quantity_kg_to_donations_table', 1),
(7, '2026_04_05_163530_add_image_path_and_picked_up_at_to_donations_table', 1),
(8, '2026_04_05_163551_create_notifications_table', 1),
(9, '2026_04_11_000001_add_moderation_fields_to_users_and_donations', 1),
(10, '2026_04_12_000001_create_reports_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('ebb07dae-76d4-450e-b2ee-82304a7c3a74', 'App\\Notifications\\DonationClaimed', 'App\\Models\\User', 2, '{\"donation_id\":6,\"message\":\"Your donation \'Bakery Items\' has been claimed by City Charity.\",\"action_url\":\"http:\\/\\/127.0.0.1:8000\\/dashboard\"}', NULL, '2026-05-06 10:04:43', '2026-05-06 10:04:43');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'open',
  `reporter_id` bigint(20) UNSIGNED NOT NULL,
  `donation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reported_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reason` text NOT NULL,
  `resolved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `resolved_at` timestamp NULL DEFAULT NULL,
  `admin_notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('w8CGceeMkbnkL3mHJcpUTrAqbku5gCZhYUtadqpx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibExFNFFqT3lBVDVubGV4V285T2x4R1FkeGR1SU5RTFVaWm9LVWZIeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9fQ==', 1778083574);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'receiver',
  `organization_name` varchar(255) DEFAULT NULL,
  `suspended_at` timestamp NULL DEFAULT NULL,
  `suspension_reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`, `organization_name`, `suspended_at`, `suspension_reason`) VALUES
(1, 'Test User', 'test@example.com', '2026-04-30 10:42:25', '$2y$12$rUm.J9M5G5WzR24OUPipouTq2wJfuY3UrmgZIHEzEzXoE6kymSB2e', 'n0ZM5NiOIZ', '2026-04-30 10:42:25', '2026-04-30 10:42:25', 'receiver', NULL, NULL, NULL),
(2, 'Green Valley Hotel', 'donor@example.com', NULL, '$2y$12$n7gLxTz8lpnNtwFQNA7cWegNJMhzTiOvjPfh.ZiCaPXEQkkbaXrlK', NULL, '2026-04-30 10:42:25', '2026-05-06 09:51:35', 'donor', 'Green Valley Hotels Group', NULL, NULL),
(3, 'City Charity', 'receiver@example.com', NULL, '$2y$12$wP6cbG/2BEmou6CKQTx1GeioIe3ewHucxlg43LoqRI3b0U1ZKfZu2', NULL, '2026-04-30 10:42:25', '2026-05-06 10:04:19', 'receiver', 'City Hope Foundation', NULL, NULL),
(4, 'System Admin', 'admin@example.com', NULL, '$2y$12$eKujlQYM.aqd14URy3l/x.9S7K98BX52Y1PNw9A2eGGKxhGtj9ZhK', NULL, '2026-04-30 10:42:26', '2026-04-30 10:42:26', 'admin', 'EcoFeed Operations', NULL, NULL),
(5, 'Jubayer Islam', 'jubayer@gmail.com', NULL, '$2y$12$TX6HdcHwCHJY4sWmTmvvJeGEw/LrEx1QuO4OIaGUoa5b.3ZURZCue', NULL, '2026-05-04 10:18:16', '2026-05-04 10:18:16', 'donor', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `donations_donor_id_foreign` (`donor_id`),
  ADD KEY `donations_receiver_id_foreign` (`receiver_id`),
  ADD KEY `donations_moderated_by_foreign` (`moderated_by`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reports_reporter_id_foreign` (`reporter_id`),
  ADD KEY `reports_donation_id_foreign` (`donation_id`),
  ADD KEY `reports_reported_user_id_foreign` (`reported_user_id`),
  ADD KEY `reports_resolved_by_foreign` (`resolved_by`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `donations`
--
ALTER TABLE `donations`
  ADD CONSTRAINT `donations_donor_id_foreign` FOREIGN KEY (`donor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `donations_moderated_by_foreign` FOREIGN KEY (`moderated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `donations_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_donation_id_foreign` FOREIGN KEY (`donation_id`) REFERENCES `donations` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `reports_reported_user_id_foreign` FOREIGN KEY (`reported_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `reports_reporter_id_foreign` FOREIGN KEY (`reporter_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reports_resolved_by_foreign` FOREIGN KEY (`resolved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
