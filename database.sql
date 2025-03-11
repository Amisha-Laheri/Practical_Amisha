-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2025 at 10:43 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employee_management`
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
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `salary` text NOT NULL,
  `department` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `phone`, `salary`, `department`, `created_at`, `updated_at`) VALUES
(2, 'Employee 2', 'employee2@example.com', '1234567824', 'eyJpdiI6IjBLVXpvd25YR0hEVjhRZjN5d3RONHc9PSIsInZhbHVlIjoiTzJRVVRFNFMySW9qdlpiSTRpYWV1akNhamJLZFRDYkxYQ20rSjl4aTk1ZXM4OEt5TzVuM3dsR3RlNG1lclYzcmtpdTlyVEYxNXc2RzdvMXY1bXoxYmZ3aUg3UlJ6VE1BVUl6VVdRdkhGZlJLQUFJR1JuWUhhR1F1dXRJYXlsZHhoWVBPWkVaU3RTaTdFOTR6bEZ1UjBCTHVsVG8wcUt2enpKSXZ1Y0VPbUtuQ3BKR0Q0NjVzU042QldOT2dZRXRZM2FCUHZES01BUU54eUZPeElXMkZnck13Y29OZGR5VDRBZ3dRTHYvNmZlRlRkNHlvV2pqejBCOEF4Z1dpOWNDcXhBSG9TNlVLRWxaTFlmc29XdlRZZmc9PSIsIm1hYyI6IjVjZDhkMDQwMjUwMzMyM2UyMzgxMzIxMjQwOTBlNDUxMzA0ZGM1MTkxMGY1N2QwYzkxMGRjMDhmNDE5NmRlMWQiLCJ0YWciOiIifQ==', 'Department 2', '2025-03-11 03:00:37', '2025-03-11 03:42:53'),
(3, 'Employee 3', 'employee3@example.com', '123456783', 'eyJpdiI6IlE5MkNJOHA0SVFaZmVPbTdOWWZvQUE9PSIsInZhbHVlIjoieWJCMkFFdHhIV2o0OWFrdXR4YzdoYm81UkxhM0xVUUJxeFladWtVbWxPZjdyK01rUWFsYmFGMk54NGZ5ZEdzWE9wUC9jMUZWNVpobEJtUG9rZjk0MHFxeWRTaTZHY0VNckZwdW15OGExQm15WHM4SU1hcSsySFZ0Uml3aG1jZlE4ZkVqbFpjZkJETjNaQjBGSUwvUHFKMWt0SlpuQ2ZFSFlYNnU1dlFESE0zWCt3S2ZKeHAybUlRT1I0OFNYOG0xNmZOa0R5c2xFTWphNElHd0tlQysrOEExQVZTdC9Mdkw0QWFMcEMrck14SENEb2VYMUJlT1ova0RjODd0L3RGdmNweUpCZTliVzBrZVl6cmk2OXZMekE9PSIsIm1hYyI6ImZhYjI2ZDU2ZDI2M2Y3NTU4ZDc5M2EwM2Y1MDJkYTk5Njk4NWNlNjgyMTg4N2QxMWUxMTg2NDRlMWYwYmE4ZTMiLCJ0YWciOiIifQ==', 'Department 3', '2025-03-11 03:00:38', '2025-03-11 03:00:38'),
(4, 'Employee 4', 'employee4@example.com', '123456784', 'eyJpdiI6IlNIRThnaXlYSkg5NTVSNVlSNUpxSlE9PSIsInZhbHVlIjoiL3l3eHdEUlVMN2tFRzd4OGprWlVHTjY1Y0ZhYlJYRDcwUHJGVzB1dW0yS1dKNjVIVGhFS1kzaGdLcG5kcDluV25QR1l3dzBCK1J1NDlwbTlnd2hGaGVVUHFGakwwSlBKak9GaDAxazEzTm1SSHhFN0RXUE1QRUtSOUdXYWZFaGRYRTlwdXBycHA4RGU2TDBnYlJWV3h1Nkp1NkZXL0srRVljd0tVanRkdUtSU29LeHJ6WURGWEJKRStmN3BibjEyYTFadG9KRUpMSVBxS1hsVWllSFIyaWJYK01nWGhlbFlITmZvb25mVzJaQndXOVV1OS9LL0xhRkxoOHBheEFBT2tGWGEwRHlvSE5sVVlXUzhGQmc3UHc9PSIsIm1hYyI6IjNlMjU1MmExNmY5MGZlMzQ2NjNiOGM3NmVmNTVlMDFhN2IxM2I2NzI3ZmM2ZDE4ZjkyMDgzZTA4ZTA5MDg2MTUiLCJ0YWciOiIifQ==', 'Department 4', '2025-03-11 03:00:38', '2025-03-11 03:00:38'),
(5, 'Employee 5', 'employee5@example.com', '123456785', 'eyJpdiI6Ik45MzAzaERCUjJ3eVJTK3k3dkM1QVE9PSIsInZhbHVlIjoieFFSSEdZWW4zTmlUVVNraTkvZjBUWmd4ejNqaWgxWk1CZm1ZUTF6U2ZEeUlCdzJjSHBOZWd0YmkvV0x0d1BXUDN6c1ZWeWQweGl0bHMzRnU1TUJlSHlEOWZyaytHbkFvTnEzQUY3cUZVblN2ZHB4YjlEZlhpc01MWDlodmxxNnFhVzM2VGtYaUJETzB2ZWI3UUFvK3VwdTRLWkUvUk5kMjR6N3l6clh4SVBQV1VFQUhaYm95c1ZjR3YwRy9oalNZTjZTR1MzRGRQUXpwc1RWUTZUYlk2NmcxK1VDemMzaGFvc2VEQ2M3VGN3VTJ0TUJBaUhkdUpDNytNZ1FCSXBxdGFXbTZYTStzUFF4WFA1U1Mza1dqMFE9PSIsIm1hYyI6IjZkNmQ2NTk3Y2ZiOTZlMmVjYWE3N2JlZTJjMzQ3ZjUzMGNiMzNiMmNhMDliZmI3YWJlM2U2NDQwMTcxYzZhMzQiLCJ0YWciOiIifQ==', 'Department 5', '2025-03-11 03:00:38', '2025-03-11 03:00:38'),
(6, 'Employee 1', 'employee1@example.com', '123456781', 'eyJpdiI6IktkYlVheUFHU0d0ek8rUkVKdUk4QVE9PSIsInZhbHVlIjoid1pGdWZGY0g1eE1WSUFWb3A2R2ErVHByZ3cyK3hsZ3RsWFIyb0FuNC93K0lzWjhITkRsY0F0ZTVtZ1IrNzgxMVVUdmFBdWlQTzVRNXdNdEx0dzUzWWVCeEhrMW1tWnlObHJnOFg5aGxuUU1oZFYyTnpYWDdDOVArR2N3KzRpa1RmL3ZtZWVJbUkwRkdublh1ZlNNTXM1d3JhazF1OXZQZitlN1d5KzJFM2xGL1I4RDVJWm1Tbjk2cmd6TzZJRkZVOURmTThUenZ5ejR3OG9qbWRpWitTdFBTVjlJditzWDExazcvRDdSb3JLcGJhTzNNMm4xNEhJT09QWEljOW1VMS91ZmhTNDFiZlZESXBWZ0N1YkJLZlE9PSIsIm1hYyI6IjY5ZTExYzdiNjZjNWU2OGRlNDBkYjhhNWU2NDRhZThkNzkyYTZiZDMxNDkwNzMwZjlkMWQ1MjM3YjVmMzI3NjgiLCJ0YWciOiIifQ==', 'Department 11', '2025-03-11 03:30:40', '2025-03-11 03:40:56');

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
(4, '0001_01_01_000000_create_users_table', 1),
(5, '0001_01_01_000001_create_cache_table', 1),
(6, '0001_01_01_000002_create_jobs_table', 1),
(8, '2025_03_11_063518_create_personal_access_tokens_table', 2),
(10, '2025_03_11_055850_create_employees_table', 3);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
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
('d7dhoBwqwNuWgbu6he4ZbGwhDRYGwBGqd26xOSQH', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZjVLUWFjOGtmdENPaG5OWjlla3lNTkxvUHlNWFE4eXYyV3dhcVJtVyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', 1741677390),
('fyhldl0imitnY5osA3BVVQviY4TmINjWna37MLq2', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibkdBOEpKZXpUblp4REdNcWxmMU41ektxcE5CNTlaRnp0MEFZY3ZmeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9lbXBsb3llZXM/cGFnZT0xIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1741685611),
('h5A3vIuMPB9QZLH2a1ILTN6UqPOOd7ULDDQpdVSA', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaXJEejUwbGJTbFh3UWdWS0NNNFppR2hIWEh3dmhNRldUa0pyb1pONyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czozOiJ1cmwiO2E6MDp7fX0=', 1741682482),
('sIuUgm9z9aSS43W5u9M6yspxOcZF5e82RLN9etTH', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiczdseUUxZmRWcVRoTHFTZlRJeTNDN0hyRExGYVlNWktUWjJhVzdnOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1741677371),
('wECJItkoBq7dIPrwG0bwM5LQz798If2bo3m07ZfF', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoickp2czNCY01WMWRHcFgzNUpnV1hOMThMVEZ0MjVjM0U1RTI1TzJGbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9lbXBsb3llZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1741678550);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('Admin','Employee') NOT NULL DEFAULT 'Employee',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@example.com', 'Admin', NULL, '$2y$12$h0KkPxrPOOEGlQf5LJAwj.F4BUrMW8J2AfmZ5pmqYRdm0.B/eWWde', NULL, '2025-03-11 03:00:37', '2025-03-11 03:00:37'),
(2, 'Employee 1', 'employee1@example.com', 'Employee', NULL, '$2y$12$ViUcMeh5Ya0SbZ5Xs/I8eOb7ub9ZyEJvd1nq4GqcN/BwOW4tSyVYa', NULL, '2025-03-11 03:00:37', '2025-03-11 03:00:37'),
(3, 'Employee 2', 'employee2@example.com', 'Employee', NULL, '$2y$12$9aPPER9OtxsnOfbrTr2ZWe46H6GxkPhIH.HDFUpDo1ZHHWQa/sRAK', NULL, '2025-03-11 03:00:37', '2025-03-11 03:00:37'),
(4, 'Employee 3', 'employee3@example.com', 'Employee', NULL, '$2y$12$EEXnpettaIHhM6TqGWn9U.28MzCO0Arty2KT9OH4SsMKqTUngX/DG', NULL, '2025-03-11 03:00:38', '2025-03-11 03:00:38'),
(5, 'Employee 4', 'employee4@example.com', 'Employee', NULL, '$2y$12$xn8aYFOVbZniO6Narv9k/OacF1pkdW0h6iLfgcekT7aq6oBnQdMPy', NULL, '2025-03-11 03:00:38', '2025-03-11 03:00:38'),
(6, 'Employee 5', 'employee5@example.com', 'Employee', NULL, '$2y$12$E5ikNE1aQxK.l6ImXllSIOejGW4Ym/E/Iq7Ih6tVALSbVVf.kl.2e', NULL, '2025-03-11 03:00:38', '2025-03-11 03:00:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_email_unique` (`email`);

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
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
