-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table laravel_globaltech.app_infos
CREATE TABLE IF NOT EXISTS `app_infos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` mediumint DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tiktok` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_globaltech.app_infos: ~1 rows (approximately)
INSERT INTO `app_infos` (`id`, `userId`, `name`, `image`, `description`, `phone`, `email`, `address`, `website`, `facebook`, `instagram`, `whatsapp`, `tiktok`, `linkedin`, `twitter`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Mark Chovava', 'public/storage/image/app-info/20261007_oFWhF.jpg', 'Description', '0788931918', 'kkatsande81@gmail.com', '88 Piers Road, Borrowdale, Harare, Zimbabwe', 'fldesigners.co.zw', 'http://www.co.com', 'Instagram', 'https://wa.me', 'TikTok:', 'LinkedIn', 'Twitter', '2026-10-07 07:11:33', '2026-10-07 07:18:41');

-- Dumping structure for table laravel_globaltech.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_globaltech.cache: ~0 rows (approximately)

-- Dumping structure for table laravel_globaltech.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_globaltech.cache_locks: ~0 rows (approximately)

-- Dumping structure for table laravel_globaltech.events
CREATE TABLE IF NOT EXISTS `events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` bigint DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `venue` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_globaltech.events: ~2 rows (approximately)
INSERT INTO `events` (`id`, `userId`, `name`, `desc`, `venue`, `date`, `status`, `priority`, `created_at`, `updated_at`) VALUES
	(2, 1, 'Own One', '<p class="mb-2"><span style="white-space: pre-wrap;">TEST it out</span></p>', 'gug', '2026-10-22', 'Completed', 4, '2026-10-07 15:31:46', '2026-10-07 15:31:46');

-- Dumping structure for table laravel_globaltech.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_globaltech.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table laravel_globaltech.galleries
CREATE TABLE IF NOT EXISTS `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `eventId` bigint DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_globaltech.galleries: ~0 rows (approximately)

-- Dumping structure for table laravel_globaltech.inquiries
CREATE TABLE IF NOT EXISTS `inquiries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` bigint DEFAULT NULL,
  `serviceId` bigint DEFAULT NULL,
  `serviceName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customerName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customerPhone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customerAddress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customerEmail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_globaltech.inquiries: ~2 rows (approximately)
INSERT INTO `inquiries` (`id`, `userId`, `serviceId`, `serviceName`, `customerName`, `customerPhone`, `customerAddress`, `customerEmail`, `message`, `status`, `created_at`, `updated_at`) VALUES
	(2, 1, 8, 'TRAINING & DEVELOPMENT', 'Mark Chovava', '0782814471', '88 Piers Road, Borrowdale, Harare, Zimbabwe', 'shylockchiome@gmail.com', 'onono', 'Unread', '2026-10-08 11:54:03', '2026-10-08 11:54:03'),
	(3, 1, 8, 'TRAINING & DEVELOPMENT', 'Shylock Chiome', '0782814471', 'Chiyedza House, Corner First Street & Kwame Nkrumah Avenue, CBD, Harare', 'shylockchiome@gmail.com', 'nknkn', 'Unread', '2026-10-08 11:55:20', '2026-10-08 11:55:20'),
	(4, 1, 4, 'STRATEGY PLANNING & REVIEWS', 'Mark Chovava', '0784062773', '88 Piers Road, Borrowdale, Harare, Zimbabwe', 'samsonmutero@gmail.com', 'knklnl;', 'Unread', '2026-10-08 11:55:44', '2026-10-08 11:55:44');

-- Dumping structure for table laravel_globaltech.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_globaltech.jobs: ~0 rows (approximately)

-- Dumping structure for table laravel_globaltech.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_globaltech.job_batches: ~0 rows (approximately)

-- Dumping structure for table laravel_globaltech.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` bigint DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_globaltech.messages: ~1 rows (approximately)
INSERT INTO `messages` (`id`, `userId`, `priority`, `title`, `name`, `email`, `status`, `message`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, 'test', NULL, 'markchovava@gmail.com', 'Unread', 'the message', '2026-10-07 07:28:14', '2026-10-07 07:41:06');

-- Dumping structure for table laravel_globaltech.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_globaltech.migrations: ~0 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2025_03_19_081444_create_personal_access_tokens_table', 1),
	(5, '2025_05_14_130306_create_app_infos_table', 1),
	(6, '2026_03_10_074156_create_messages_table', 1),
	(7, '2026_09_11_112924_create_events_table', 1),
	(8, '2026_10_06_110633_create_inquiries_table', 1),
	(9, '2026_10_06_110642_create_galleries_table', 1),
	(10, '2026_10_06_110650_create_services_table', 1);

-- Dumping structure for table laravel_globaltech.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_globaltech.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table laravel_globaltech.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_globaltech.personal_access_tokens: ~1 rows (approximately)
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
	(3, 'App\\Models\\User', 1, 'markchovava@gmail.com', '060abbb85caca4bf838070a461c4768acfd9c242f511ec6f3187a71007d9ef6b', '["*"]', '2026-10-08 11:56:21', NULL, '2026-10-07 07:02:53', '2026-10-08 11:56:21');

-- Dumping structure for table laravel_globaltech.services
CREATE TABLE IF NOT EXISTS `services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` bigint DEFAULT NULL,
  `priority` mediumint DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_globaltech.services: ~9 rows (approximately)
INSERT INTO `services` (`id`, `userId`, `priority`, `image`, `name`, `desc`, `created_at`, `updated_at`) VALUES
	(3, 1, 2, 'storage/images/service/dca41852-86c6-4347-a328-18a5851b12cf.png', 'RECRUITMENT & SELECTION', '<p class="mb-2"><span style="white-space: pre-wrap;">End-to-end recruitment solutions. Headhunting and candidate sourcing. Assessment, interviewing &amp; selection. Onboarding and probation support.</span></p>', '2026-10-07 13:29:22', '2026-10-08 10:15:47'),
	(4, 1, 1, 'storage/images/service/70f3ccde-dd35-45e7-a821-d8d873de406d.png', 'STRATEGY PLANNING & REVIEWS', '<p class="mb-2"><span style="white-space: pre-wrap;">Facilitate strategic planning sessions with leadership teams. Set goals, KPIs and targets. Support strategy implementation and performance reviews</span></p>', '2026-10-07 13:39:17', '2026-10-08 10:12:43'),
	(5, 1, 3, 'storage/images/service/23efa514-0bd3-4451-8ff6-9a8cc66f704d.jpg', 'PERFORMANCE MANAGEMENT SYSTEMS', '<p class="mb-2"><span style="white-space: pre-wrap;">Develop performance frameworks and KPIs. Implement Balanced Scorecard and appraisal systems. Drive accountability and improve productivity</span></p>', '2026-10-08 10:17:38', '2026-10-08 10:17:38'),
	(6, 1, 4, 'storage/images/service/8fa66608-782b-4240-940e-d25434ce1bbc.jpg', 'JOB EVALUATION & SALARY STRUCTURING', '<p class="mb-2"><span style="white-space: pre-wrap;">Job analysis and profiling.Job evaluation using recognized methodologies (Paterson, Hay). Salary benchmarking and pay structure development</span></p>', '2026-10-08 10:18:37', '2026-10-08 10:18:37'),
	(7, 1, 4, 'storage/images/service/760c68a4-abe8-4f3b-87d7-7d127fe9e576.jpg', 'SURVEYS & RESEARCH', '<p class="mb-2"><span style="white-space: pre-wrap;">Employee engagement &amp; satisfaction surveys. Salary &amp; benefits benchmarking. Stakeholder and customer satisfaction surveys</span></p>', '2026-10-08 10:19:46', '2026-10-08 10:19:46'),
	(8, 1, 5, 'storage/images/service/9d427494-94d4-4519-812a-33c336067814.jpg', 'TRAINING & DEVELOPMENT', '<p class="mb-2"><span style="white-space: pre-wrap;">Customized training programs. Leadership and team development. Works Council and Workers Committee training.</span></p>', '2026-10-08 10:20:58', '2026-10-08 10:20:58'),
	(9, 1, 7, 'storage/images/service/b95d2932-ba69-4d7c-be14-2bf3971b38fd.jpg', 'ORGANISATION DESIGN & RESTRUCTURING', '<p class="mb-2"><span style="white-space: pre-wrap;">Organisational design and alignment. Restructuring and right-sizing. Workforce optimization and change management.</span></p>', '2026-10-08 10:22:18', '2026-10-08 10:22:18'),
	(10, 1, 7, 'storage/images/service/e7236e1b-bb97-4f98-973f-c75d5e0d95a2.jpg', 'POLICY & PROCEDURE FORMULATION', '<p class="mb-2"><span style="white-space: pre-wrap;">Develop HR and organisational policies. Operational procedures and governance frameworks. Ensure compliance and consistency.</span></p>', '2026-10-08 10:25:04', '2026-10-08 10:25:04'),
	(11, 1, 8, 'storage/images/service/3b886df2-4de4-47dc-b8ca-7f91c9d5bed3.jpg', 'TRAINING & CAPACITY DEVELOPMENT', '<p class="mb-2"><span style="white-space: pre-wrap;">HR strategy and advisory support. Employee relations and conflict resolution. Grievance handling and disciplinary processes.</span></p>', '2026-10-08 10:26:19', '2026-10-08 10:26:42');

-- Dumping structure for table laravel_globaltech.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_globaltech.sessions: ~6 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('CFrEdXKMElLNTNTeTBEMCDcwRQCs3ySOGiRxvKSe', NULL, '127.0.0.1', 'node', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWTV2bkZlN29ka2xkdzFWckVUV2F0VmFBQnY2QXpLSkczV1JxeTQ4VCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1791363671),
	('F6BDquRUpctezCwjg9jaojpI4fJuLCg6tQ15OY9f', NULL, '127.0.0.1', 'node', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiY2pNY0c1eGxHamE0NFJ6aW51Umplb2V1aUlqa29CVVJ5VXBNTk5wVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1791363392),
	('k5lfCLspBI8AZIMG9fOfLtSF8tnTUNJNnwJp5PyH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGVQcHQzbDd5OGswSVI3TjNYZE9kSTEwR2ZNb29tQ2JyZVJ5ZjUyeiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1791363040),
	('khzl98foMmOLDbaDSh3QN3eE6RRshm7VNf7J55RQ', NULL, '127.0.0.1', 'node', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRDRhTmM0Ukd3TzFSYXB0emJjTzlaUHgzNmhLY1JWa3JjMEJNVnFLSCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1791363773),
	('ssQhrAGFqEj576kgn5gwf2j23zRke4ZThO99K6e2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUFLT056SzRCR2RZS3Z0bzJWallCWlp6bFlDZXJwTkFRVmZ4TDgxdSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1791364201),
	('TVEQxlBNjm5WkADvmHV4Usp3F957qjKz5UKUHfp9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieERFR2Jvc0dKbGljaU1CbHIwc0Qyem51dDJ6TXZnd3RqTnZJd1BubyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1791363953),
	('x5qKIAjsmuXHkaLpcRfTCHKiGGiaXQFgVVp9nBkC', NULL, '127.0.0.1', 'node', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNzhDVDd3YTRHRDRyN2JJakI3a0JTalZyMDhoV3dhZG1GR2NaY0hHcSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1791363405);

-- Dumping structure for table laravel_globaltech.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isAdmin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roleLevel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_globaltech.users: ~1 rows (approximately)
INSERT INTO `users` (`id`, `name`, `isAdmin`, `roleLevel`, `email`, `phone`, `address`, `email_verified_at`, `code`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Mark', 'No', '1', 'markchovava@gmail.com', '0782210021', '6 Maruta Mbare National, Beatrice Cottages, Mbare', NULL, '12345678', '$2y$12$NHArDsqiPcC3qleMUK5Zhes2KBthc3uVkWONn1va46uiXbqqCKBOW', NULL, '2026-10-07 06:56:32', '2026-10-07 07:19:25'),
	(2, 'Kudakwashe Katsande', 'Yes', '1', 'kkatsande81@gmail.com', '0788931918', '31152 Unit G Extension, Seke, Chitungwiza', NULL, 'XBvnjPzn', '$2y$12$zyXFdhMsmGj98.38TVNnmOIRa9FzmAPcg3dZ0mDWTDaiPxkTv.4se', NULL, '2026-10-07 07:23:03', '2026-10-07 07:23:03');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
