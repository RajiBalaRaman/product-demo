-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 10, 2025 at 11:11 AM
-- Server version: 8.0.41-0ubuntu0.20.04.1
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravelapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_02_27_042754_create_personal_access_tokens_table', 1),
(6, '2025_02_27_064524_create_permission_tables', 3),
(9, '2025_02_28_053004_add_qr_code_to_products_table', 4),
(10, '2025_02_27_043248_create_products_table', 5),
(11, '2025_03_10_042145_add_api_token_to_users_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'API Token', '737ecd4bdb76e6e251ac3534bf160303a02aac062e5211db0901f09eb6186bbc', '[\"*\"]', NULL, NULL, '2025-02-27 00:16:01', '2025-02-27 00:16:01'),
(2, 'App\\Models\\User', 3, 'API Token', '21d15c1b84403c77a466392190d4d913296d48a681bdaae0c93b84b03dcc3b32', '[\"*\"]', NULL, NULL, '2025-02-27 00:23:36', '2025-02-27 00:23:36'),
(10, 'App\\Models\\User', 4, 'API Token', '0a5502e59aeb78715d526ed61c04b813e16d54db381be6dfce6ae9e7fbf6edc5', '[\"*\"]', '2025-02-28 01:31:25', NULL, '2025-02-27 23:54:44', '2025-02-28 01:31:25'),
(11, 'App\\Models\\User', 5, 'API Token', '1ff83ee1aa0d6492c8d1f20be6000c0aedb06491cf1022eed039665e42fe2a9f', '[\"*\"]', NULL, NULL, '2025-03-03 02:30:10', '2025-03-03 02:30:10'),
(15, 'App\\Models\\User', 6, 'API Token', 'e0f32b09c89c25f5fb0e18d3a9699831001f23b7760e5dc8166bd6b9f226dfb2', '[\"*\"]', NULL, NULL, '2025-03-03 21:59:13', '2025-03-03 21:59:13'),
(16, 'App\\Models\\User', 7, 'API Token', 'fbe31351f263091a83ad8da08fc8a4abde397152589b3084e8ab6b66f51cc754', '[\"*\"]', NULL, NULL, '2025-03-03 22:02:53', '2025-03-03 22:02:53'),
(17, 'App\\Models\\User', 8, 'API Token', 'b5df7388ad6e48b0d2ba5b275b4acdf46a9d73b7851b3c8749c1ec8d1eb91281', '[\"*\"]', NULL, NULL, '2025-03-03 22:03:59', '2025-03-03 22:03:59'),
(18, 'App\\Models\\User', 9, 'API Token', '6132b4ce506b86cdb32ed7c26882a61f088e114a2301d1dac6d037c3b3cf985a', '[\"*\"]', NULL, NULL, '2025-03-03 22:04:48', '2025-03-03 22:04:48'),
(19, 'App\\Models\\User', 10, 'API Token', 'b0755f4ae6630026a22a6794e750b37678b1fe14c92085ec06b0ffa8a8252451', '[\"*\"]', NULL, NULL, '2025-03-03 22:05:13', '2025-03-03 22:05:13'),
(20, 'App\\Models\\User', 10, 'API Token', '3f94d61185c05c3eb61057dd81da8dfdbb7563488189ac0c97db2570f95910c3', '[\"*\"]', NULL, NULL, '2025-03-03 22:20:03', '2025-03-03 22:20:03'),
(21, 'App\\Models\\User', 10, 'API Token', 'def4d37cd23a95134617fcd6b6d2a145ec59942d4183b8f5f7a9a1723b519d1e', '[\"*\"]', NULL, NULL, '2025-03-03 22:23:24', '2025-03-03 22:23:24'),
(22, 'App\\Models\\User', 10, 'API Token', '57c7bec8f9314933074c0041708884c1897af60944759b0aa7d88e5199fe3e4d', '[\"*\"]', '2025-03-03 22:54:11', NULL, '2025-03-03 22:46:20', '2025-03-03 22:54:11'),
(23, 'App\\Models\\User', 9, 'API Token', 'b1d4fb09aec5927b5e498c021e40d8d4fad241323d9a548dd4bee45b3334fd95', '[\"*\"]', '2025-03-05 00:30:20', NULL, '2025-03-03 22:54:01', '2025-03-05 00:30:20'),
(24, 'App\\Models\\User', 9, 'API Token', '4267382eaffeeebda7c01fed4889f4bf697eadfccadf8c63ea118cebcc22b359', '[\"*\"]', NULL, NULL, '2025-03-04 11:09:53', '2025-03-04 11:09:53'),
(25, 'App\\Models\\User', 9, 'API Token', '5d1aef0ed2f370cfca7d4f5e7a55fcc71bb0a2f3a0b0f2743985ab4ad9102132', '[\"*\"]', '2025-03-05 00:44:13', NULL, '2025-03-04 22:54:32', '2025-03-05 00:44:13'),
(26, 'App\\Models\\User', 9, 'API Token', '40e3276a364dd58c59ead1e4a32af7c5f9edf7246cb4b78dacc56cffdbd240a8', '[\"*\"]', NULL, NULL, '2025-03-05 00:28:38', '2025-03-05 00:28:38'),
(27, 'App\\Models\\User', 9, 'API Token', '2442d386f67a10db2fa883538c579dfe7b05d0d25ff911cda8d93f2e93446076', '[\"*\"]', NULL, NULL, '2025-03-05 00:28:40', '2025-03-05 00:28:40'),
(37, 'App\\Models\\User', 11, 'API Token', '5e641529bdd904f94452c2f64b150ab56e9a64a4432cc3726e96d3fab0f0c014', '[\"*\"]', NULL, NULL, '2025-03-09 22:47:05', '2025-03-09 22:47:05'),
(38, 'App\\Models\\User', 11, 'API Token', '16db665a7591db287741a00c4e8664d8118db90ae14708236086cb83ea55fea6', '[\"*\"]', '2025-03-09 23:55:07', NULL, '2025-03-09 22:53:21', '2025-03-09 23:55:07'),
(39, 'App\\Models\\User', 12, 'API Token', 'b61442aa57f3be354c55bd12fd6da2496cb297dfe0104cc51fd39a3534a82e0c', '[\"*\"]', '2025-03-09 23:56:00', NULL, '2025-03-09 22:57:38', '2025-03-09 23:56:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `part_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_qty` int NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `part_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serialized_status` enum('Enable','Disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Disable',
  `serial_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `part_number`, `total_qty`, `location`, `part_name`, `serialized_status`, `serial_number`, `user_id`, `created_at`, `updated_at`) VALUES
(12, 'PN0001ads', 100, 'Warehouse A', 'Engine Component', 'Enable', 'SN000sds', 11, '2025-03-06 22:56:40', '2025-03-06 22:56:40');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('ALPHQ1JWNftIkcuqMw9zQEF93utk9d5VlbtD1GQi', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2h1ZlNkOUhid1ZPelY2SVk2QVJCSTlFN1dnOEEwdUVQRWk0QUgwZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1741342766),
('cux3zD0exzUC5M6jCCLVEpL3VLuf512E56Bt7CPe', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicXhLM0g1RGNqa2tGeVhPNzc3RThNbzFydFVsdnNKZW1BOEZZZkJBTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740998897),
('JDk8DEkeFkgdHbBrU8OnsfyuKGVVkImKBIesBeyB', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2toR2l5aUg1UHI3cDdjMXdubm5PQWRpNHFPaXdVa0Fla0p5bGhyRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740993820),
('L4BC96znLOVgzHvKXf4UhuQEFxfDPEBwFzV0a6Jn', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1NzZTBiWGRRd1g4MW1FTFZRSFh2U1dkcmR1Q3hvbXRBcEJkMlpnMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1741580862),
('lJRm6Dy5VXnzoe3PFyftcnKNfCgKJQRNG9Ihuytw', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXQzYmhwVFdsclRBWDVmakIzdjFkTkk5ZEdRZUk4UjVWQUdLSk5VYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740988758),
('On3qHevZUVS4KAlyVKh5aNku7hTRIsYluYJrxPky', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEdVSUNUdE9hNFEyRDU0UU1XcDFOTUhnQTMxMlJ2ZHZ0YTlLM3ZmMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1741058724),
('Udifl3h57EcLFxkxHrExyeMvZDgPiIe4qhsjKcL3', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXdSZHJIdnZ5V1NWMlNmMndXN1NERHhXMThKc2FvZ0lJdjRLRDRsTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1741320799),
('YJe07R9WDT0yWvxrsBFAbq6LnsfROTkd4fktM3Sv', NULL, '127.0.0.1', 'PostmanRuntime/7.43.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXpUdUVhVlJaRHNycFA2T0k0TkRGSVUzYWZQR1pYa2kxQk5ZZ29QNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1741060219),
('zVO23prubfWiN4JUUPe5jRcfLuU7dYgctQOaNox8', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODk3aVQ5d3dJWm10Tk5PRWRERXY1bkJINFoyRlBkVW44MVZsWmZsZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1741106389);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` text COLLATE utf8mb4_unicode_ci,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `api_token`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 'Super admin', 'superadmin@gmail.com', NULL, '$2y$12$dbrKzpXSX2hjwECwc1c5UelmRmhkZs1UpqeUwf2PYgp9BeOQQFoFS', NULL, 'super_admin', NULL, '2025-03-03 22:03:59', '2025-03-03 22:03:59'),
(9, 'admin1', 'admin1@gmail.com', NULL, '$2y$12$elNso6bSNURk1Q8DiWXPremkcIoks6oBP.4TnNT5SEkgZ27QxP78i', NULL, 'admin', NULL, '2025-03-03 22:04:48', '2025-03-03 22:04:48'),
(10, 'admin2', 'admin2@gmail.com', NULL, '$2y$12$hDMQZtWOwUVWwGS.5/sOwu/TNxWahfJ.9pKjvAnFJjDCQiHQjUhKe', NULL, 'admin', NULL, '2025-03-03 22:05:13', '2025-03-03 22:05:13'),
(11, 'bala', 'bala@gmail.com', NULL, '$2y$12$Upd/5SJtbIOcNXGhKGe27.ks4aPvhToVYhZEwZwXEHaH2hW2pIxBG', '38|L8JzA0qCxCRGSKAqPhV31sNoTGQbEB3vToPygUMn4df42eeb', 'admin', NULL, '2025-03-05 00:29:37', '2025-03-09 22:53:21'),
(12, 'admin', 'admin@gmail.com', NULL, '$2y$12$W6czoVRwocpvqP/AUHFef.ODPjfVHbiAKC9a4asgvSF6cLCzL9FGq', '39|UJ8JAnAY5vVG86JeXTy2bpJ9RHTI1GA679PkFPUP9f9c7801', 'admin', NULL, '2025-03-09 22:57:38', '2025-03-09 22:57:38');

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
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
