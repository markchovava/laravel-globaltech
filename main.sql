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
	(1, 1, 'Globaltech Human Capital Corporation', 'public/storage/image/app-info/20261007_oFWhF.jpg', 'Description', '+263 775 694641 / +263 242 339439', 'recruitment@globaltechhcc.co.zw <br /> info@globaltechhcc.co.zw <br /> kennedyc@globaltechhcc.co.zw <br />', '288 Herbert Chitepo Corner 7th Avenue, Harare, Zimbabwe', 'https://www.globaltechhcc.co.zw/', 'http://www.facebook.com', 'http://www.instagram.com', 'https://wa.me', 'http://www.tiktok.com', 'http://www.linkedin.com', 'http://www.x.com', '2026-10-07 07:11:33', '2026-10-15 07:15:42');

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

-- Dumping data for table laravel_globaltech.events: ~1 rows (approximately)
INSERT INTO `events` (`id`, `userId`, `name`, `desc`, `venue`, `date`, `status`, `priority`, `created_at`, `updated_at`) VALUES
	(2, 1, 'The Event', '<p class="mb-2"><span style="white-space: pre-wrap;">The event</span></p>', 'Harare', '2026-10-30', 'Upcoming', 1, '2026-10-07 15:31:46', '2026-10-15 08:42:45');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_globaltech.galleries: ~12 rows (approximately)
INSERT INTO `galleries` (`id`, `eventId`, `userId`, `image`, `created_at`, `updated_at`) VALUES
	(11, 2, 1, 'images/gallery/09fae6a1-eece-4d30-af93-df59a705e16e.jpg', '2026-10-15 08:44:05', '2026-10-15 08:44:05'),
	(12, 2, 1, 'images/gallery/688fe6a9-2f20-470e-81e6-1dfe30c44e49.jpg', '2026-10-15 08:44:05', '2026-10-15 08:44:05'),
	(13, 2, 1, 'images/gallery/9042b04a-e7e6-4734-b73e-420a5170dc55.jpg', '2026-10-15 08:44:05', '2026-10-15 08:44:05'),
	(14, 2, 1, 'images/gallery/1a61457f-33e6-49be-b682-69b349d82b3e.jpg', '2026-10-15 08:44:05', '2026-10-15 08:44:05'),
	(15, 2, 1, 'images/gallery/5f52ebfb-16c1-48af-9eb4-bbc56771b99d.jpg', '2026-10-15 08:44:05', '2026-10-15 08:44:05'),
	(16, 2, 1, 'images/gallery/3991af0c-d147-4770-b1cf-8e512c280609.jpg', '2026-10-15 08:44:05', '2026-10-15 08:44:05'),
	(17, 2, 1, 'images/gallery/5460c0cd-0f1f-4db3-86ab-aa94b2206eb3.jpg', '2026-10-15 08:44:39', '2026-10-15 08:44:39'),
	(18, 2, 1, 'images/gallery/0f862342-ea58-4050-af27-e1852610ceeb.jpg', '2026-10-15 08:44:39', '2026-10-15 08:44:39'),
	(19, 2, 1, 'images/gallery/f4311cae-4c24-4a70-8c6e-606302c58fc3.jpg', '2026-10-15 08:44:39', '2026-10-15 08:44:39'),
	(20, 2, 1, 'images/gallery/9d8ad81e-64c0-45f3-a61c-2e5bb4601b9d.jpg', '2026-10-15 08:44:39', '2026-10-15 08:44:39'),
	(21, 2, 1, 'images/gallery/40321faa-50d4-4436-aef3-dcfa29c15560.jpg', '2026-10-15 08:44:39', '2026-10-15 08:44:39'),
	(22, 2, 1, 'images/gallery/5c3d0cb4-8df4-4e32-a587-2295a9e52ce3.jpg', '2026-10-15 08:44:39', '2026-10-15 08:44:39');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_globaltech.inquiries: ~8 rows (approximately)
INSERT INTO `inquiries` (`id`, `userId`, `serviceId`, `serviceName`, `customerName`, `customerPhone`, `customerAddress`, `customerEmail`, `message`, `status`, `created_at`, `updated_at`) VALUES
	(2, 1, 8, 'TRAINING & DEVELOPMENT', 'Mark Chovava', '0782814471', '88 Piers Road, Borrowdale, Harare, Zimbabwe', 'shylockchiome@gmail.com', 'onono', 'Unread', '2026-10-08 11:54:03', '2026-10-08 11:54:03'),
	(3, 1, 8, 'TRAINING & DEVELOPMENT', 'Shylock Chiome', '0782814471', 'Chiyedza House, Corner First Street & Kwame Nkrumah Avenue, CBD, Harare', 'shylockchiome@gmail.com', 'nknkn', 'Unread', '2026-10-08 11:55:20', '2026-10-08 11:55:20'),
	(4, 1, 4, 'STRATEGY PLANNING & REVIEWS', 'Mark Chovava', '0784062773', '88 Piers Road, Borrowdale, Harare, Zimbabwe', 'samsonmutero@gmail.com', 'knklnl;', 'Unread', '2026-10-08 11:55:44', '2026-10-08 11:55:44'),
	(5, NULL, NULL, NULL, 'Mark Chovava', '0788931918', '88 Piers Road, Borrowdale, Harare, Zimbabwe', 'kkatsande81@gmail.com', 'nopp9b', NULL, '2026-10-15 10:29:41', '2026-10-15 10:29:41'),
	(6, NULL, NULL, NULL, 'Mark Chovava', '0788931918', '88 Piers Road, Borrowdale, Harare, Zimbabwe', 'kkatsande81@gmail.com', 'nopp9b', NULL, '2026-10-15 10:31:00', '2026-10-15 10:31:00'),
	(7, NULL, NULL, NULL, 'Mark Chovava', '0788931918', '88 Piers Road, Borrowdale, Harare, Zimbabwe', 'kkatsande81@gmail.com', 'nopp9b', NULL, '2026-10-15 10:31:09', '2026-10-15 10:31:09'),
	(8, NULL, NULL, NULL, 'Mark Chovava', '0788931918', '88 Piers Road, Borrowdale, Harare, Zimbabwe', 'kkatsande81@gmail.com', 'nopp9b', NULL, '2026-10-15 10:41:30', '2026-10-15 10:41:30'),
	(9, NULL, NULL, NULL, 'Mark Chovava', '0788931918', '88 Piers Road, Borrowdale, Harare, Zimbabwe', 'kkatsande81@gmail.com', 'nopp9b', NULL, '2026-10-15 10:43:17', '2026-10-15 10:43:17');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_globaltech.messages: ~2 rows (approximately)
INSERT INTO `messages` (`id`, `userId`, `priority`, `title`, `name`, `email`, `status`, `message`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, 'test', NULL, 'markchovava@gmail.com', 'Unread', 'the message', '2026-10-07 07:28:14', '2026-10-07 07:41:06'),
	(2, NULL, NULL, 'NEW MESSAGE FROM SITE', 'Mark Chovava', 'markchovava@gmail.com', NULL, 'testing', '2026-10-15 10:46:00', '2026-10-15 10:46:00');

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
	(3, 'App\\Models\\User', 1, 'markchovava@gmail.com', '060abbb85caca4bf838070a461c4768acfd9c242f511ec6f3187a71007d9ef6b', '["*"]', '2026-10-15 08:44:41', NULL, '2026-10-07 07:02:53', '2026-10-15 08:44:41');

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

-- Dumping data for table laravel_globaltech.sessions: ~69 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('0Ahcs4KwKfgJAkR0FocFXxiBhGw1OEQyKE93DJwK', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiME1JVVRsNFQ2Uk5TeVdkdHZLVzNmaWdoTE80enhzQ2hhZFFnVG8yRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792064789),
	('4GcdYgCmYzNNYaDGPYVVkWD9szk2X4HRKxkmcoyx', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQjhXbGJ1QmtvRjM0a3NodUtyZmd6dzNsSzlDUUJnZEhVM0dpUEpwViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792062129),
	('4vvfH9ieiIrNg2EFuyLIpynyW5mH6DsnHuecU5tA', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXdCSW12OUZPWmIxb1dhRk5acnFFMzBxOHVsd1pBQUN3VjZRTnpDQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nYWxsZXJ5IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1792062281),
	('5BfryL6dZWylA8FRE40GV4DcMUvCqIIoE0ERyQ8z', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidkhZMVZMU0V0Q05uNDZsRmt1ak1kVzRjWVI3S3Q3VEh3NGNGcFl1ViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792062344),
	('5JfcjitOFfKAQ2PIjX2p8qfGCcMLqv8MyOArmqqW', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnpYZkZOdnJOc29nVlg3alpmSURvb1V2cmVNMXBaMm52VktGQzFHeSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nYWxsZXJ5IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1792062377),
	('5rpOHBeZaa2N3zc5bx2lEIqYu7rgZgjdwMk1Ce3j', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmVPWFFodE9lNkdRMWVVVklQVEdrc1BSUXNoYzltUHczZHRSSmwyQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nYWxsZXJ5IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1792062890),
	('6YWmi6qKLNNGKiOEgxeR8ksSkpa89md19ypX7Dpa', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXFXS2dtZ1l1Y0wxWEVBOEpmNWl0T1JXN0hMYmgxbVkyYWhjZ3JCcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792067461),
	('7FBbKElKMMzRUXTVdZHXwjG9BFDYrpROw5WnFqGV', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibENTRzhQTEtTek1iNUtiWms5OUU5MEZtMkM2WGJleVcxd3dQOW42YSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792062376),
	('7J3vHGE6DrV6IPl3xa1CZdBvG9U59E9ZaRMBVuBB', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblpRVTlBQXNLb2ZsUjhlc1VpMFgzcXZIeklZUERab2c4eHBobEZSQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nYWxsZXJ5IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1792064790),
	('7MQkTXXkWsNc297MwjxZWjz8HGCpBH0O84GZvLqK', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicWg3aGwwUHFRbzdJQWNmS0ZGc3JPMVgxQzNmSXJBYTNHWEJXM3NJdyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792064478),
	('7W7VP0SWl1J1zgBsJSTpI7BoFPpC0KrBqCtcXSQD', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWRnbFJyRWFKekpZT2g1SUZwY1BtQXZGTzFaNkFldU5IdlBqY2pIaCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792062439),
	('8NIt51su12DkKzXB7XTRegi27YcyljjgZPZYh3dw', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib3BwcVRJVk15TWhJdzI0eWxXQXc1RFVMTVhYU1lyeWhCVklGZGJoNSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792067193),
	('AozSFShesie7oXVlcn1ZpwJcwyjWjML13p42MfRe', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVM2a01MOHo4SXR1M0pjRmFKeTNIV3o3bFlzalg4d0pURTdJSlZNRSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792062889),
	('arIbKj82pGTQwMLkREw7aYYHrT4hbO5LOLQogcuW', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDF0ZzNVd1Z0Y0RWTWZXNVpKTFZzVVhwZnJjMzNtY2s3OU5MdUtZWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792062280),
	('BGz3NJxpvmaAnnKoNujGhw7aPzvJ49KNevHl9sbC', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidlFrZ1BXbDJuZHpibnVuQ3hwaFVGU1Y3NWlYSGR3TFlpeGlxb25CNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792068364),
	('Bt9Ou1EiMt8fJp2mDKS6FDaBYnmkThOWir7A7QzW', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3c1aDh3anFsSDRSdUtnT1B2cnp5TU1hZFV0eEtPdld1RU5kVURsSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792067385),
	('CCwsaZrawfwfIhW7Ir8iWOaXAcgw8TA16DOydSiI', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjZWVkdlNFk3d3FhWFN5NkEzNGdrNW00NmxBRHZhbEN1SkdzNGQ0YSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792062155),
	('d3DFfSkCta7lvbX8rmIUvFAsENuRNlxVrqMoodtu', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGpjQW9tUXJ1aEdIU2tOQzVJeEd2U2I1U2pFVGJiYk5KVlBFVU1UdyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792067469),
	('d8ScwFhHJedXztAfJNHZc2EQa5wLokQUwXqGWxzr', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFVXWGp1Y0YwOEVzQ1ZZMm1xZFh3ckV2d1FjQ0hxdEs3eXlqclVpUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792064750),
	('dBDEiKRiLv6XaAUTbTlrbP5fpKcYQQM5S3gMiw8U', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0tlSTRRWnhBZFNCZml4R2RReG5FUlpjbUxrdkdOODhsVXl0TEFhZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792062362),
	('EtpvYqkt3HGICf59ijx93rZQLZmFq6w01vRFBBAQ', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiem5SaVBidkhRWnpsMGhjMG8wUXAzZlNnWUE5Z2VwQ3Y4c2djYWVxRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nYWxsZXJ5IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1792064751),
	('EWiKVk3knqcdH68en0eXNFh67c6ZUtJSpkSpGmj0', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2pqSFBxTll1RHE3ak1RMTMxS2hFUWpqdVBaR1cxSjlkaFNlTXkzayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792064547),
	('FeNlP6IHGsA98mkGJjwPAIbguwxYXKARWKZ6Hb46', NULL, '127.0.0.1', 'node', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibkVHS3I4Rm5LU0VjWUFXOTNGM1lwQXp0SGV2SmVKUnY3OHJRUVlCdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792067460),
	('FyOkcocjP81uCquMyDuAqkYa02dHmfjyURIf2Zm2', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaG9oNFJzZkxnb0xmdTB3OURBZGpoUnlpNEQyNnloVW4zTWhwdUZrWSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nYWxsZXJ5IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1792062344),
	('H7KQESFXROSYqoh6th9HugsRVsxmPCwUCv2PUb3W', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSlRTaVJndFNUT2JaYVpjNVZzbXAxMzZWRmVEbmozenZWRTJ4SkJ1VyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792061080),
	('HgTPV5Pz6jcHWxti1YMnYVgB4YpvgEaRfyY0cfaQ', NULL, '127.0.0.1', 'node', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMno3cWZJR2pXN3AxTUZTT0I1R2s1ZnB1QTdsaFFyOEFUYnNHckd5dCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792067469),
	('hj6crsZEwhAGGFRCToQp8du707kAapCztMLU1U70', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFY4dlpyNEZrY0hRMDFIbFNOU1VsMU1Lb1JiRE1JY0NLcHVBZDNDcyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zZXJ2aWNlLWFsbCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792065954),
	('HPLw8aA3DugVVeX5llUllgAawQ1T649xA6Y6GvrS', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXkxVjZhbHhNS2FNNFFCMzFGd3NraTJFV0x0Sk1XYUZoR0ROSHdUQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792064782),
	('izQLSd3xovAfyXfrrZdZXcN68kKTp6kk8umIL39Q', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjBQckNlWnBXampiNmN2TGJrUFlrc2wxUUhJWjdQWW5LQ3RZMDY2TCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nYWxsZXJ5IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1792062372),
	('JfaIezFkeQlQzDJ4bHzF47ui6wYM9G2kI6TViGKo', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUVnbDRTY0pJNzNPcm5aWG9ETTlEZENwZHNIRVBvbTV2VFc2ZFF0aiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nYWxsZXJ5IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1792062400),
	('jfwpuRKGWA7nJp6tCOQJDezbzLuIUuOMFyEjKV64', NULL, '127.0.0.1', 'node', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiS1pzYVRNRkVXQTkxemxmeUlpaW9XNGFMRHFhUVZWNnVJcGh1dmFkNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792067385),
	('jGHE1oFJKpDzhv2CzuQMNOrGACOdH9I60zH2fMhH', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXJkYzFFSXB1dVE2enNiY0I2N0l3WFZieVNQZzhOZGZRbzZIaU5DaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792062158),
	('kaDPbf6Kj06Yn7A6Szx1Pnw7uYEb9kxkU9LTF0Lh', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFVDRG02dFR4NVNVbE9RdGpaRktLRTdES2JFY0ZQQU0zSVVyV01SYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nYWxsZXJ5IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1792062363),
	('KASSV3TJRGvg9iDAXGKS2Pcw4T7ptC7nLDD5kdZL', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2dhcUFtc2hNMFZWd3J2b1M3TTRvU29XaUVWSEkzS29jd2VEOEFFQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nYWxsZXJ5IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1792064479),
	('KCMuRjTFfUUW1AD0Rp3aueA89e875Uj5LG5BdskO', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGswQmRyWnV4UTA3RXRqbU5VSWdRTDIzSDhPYlhiTEt6d0xzZVp0dyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792062399),
	('kg2KDAIPcpkfSGglXltrTupj3ifZm8nV4nmM0Mul', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGlaNjlkdnBSZkRUUDJhOENzSjNkbVV1RGp4cDBmbk96TkJ6bkhmViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792062371),
	('KiVD5vGXoUAK41kD8sINOKtGnmGPio5plhBu9W2Q', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUTJUYnRORUJnYjlBZGczY1NGd2ROWUhWZnl3dlpzSE1hazM1SFlqciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792067172),
	('KPL2bFCPQ7yeZPNYzYiAsPO8SAaNjgjCB6JXylxi', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmNES1pMRTBWRFlXdlVKSXlPUzBjRXpxR1FaVDlSek5takRoSDl3VCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nYWxsZXJ5IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1792064547),
	('kzmegvDX3tNAGuVhSSnRaDugHro6Tq3LhPfE1Tf2', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic01zYVBtVG9LQndCd0x2SFVkOW9aNE9wdzJGZGlrWUo0S25sVGFHSiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nYWxsZXJ5IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1792065944),
	('L6bsP1JXDzMqBwHndNDewAP9hgLJY5vg3QzRAjL7', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicU00Nkppd2IwRjVZT2dnMkNPZmkxRlE5MmpYUXN6aEZ1VTJhOGU3NSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792064511),
	('lCOttCuYIokVVkOBWLJ3N7y7VGkve07TPg72I13l', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0wxMlFuSDdrZmxXZnZveXA4OExINnVlVUhyUTNwOXlsVXN1QnVjbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zZXJ2aWNlLWFsbCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792067193),
	('LjFd4B3exRzo4aYLuZihNo0Hv32EtH5bWaclZyba', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1dhbmhRV3VTYVlsRXFJY3BHVFlzc3ltMWpoaFZyZkFNR1pwbUQ1ciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792065943),
	('Ncq7UCfiyRO9DwmicAUkvgpSoxthFcFsKoR7ZHSZ', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidUNld0RzRXJwNE5JVzdETmxnOVl1TFB2ZEVsQXRjbEthSlBkaUFEYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nYWxsZXJ5IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1792064783),
	('Ng5UcibDczfcm6bJ6F54r9BLwPNaiOXcUdRzfwob', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkF3RHFWRmRHMUY5VDFIemVDUHl1NlN6bXhGelJrZ01aczc2ekQ1ciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nYWxsZXJ5IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1792065097),
	('NKSeQ6KJDSmItlVdGjJd0sZfxQLQ7eQ3trGjX76k', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnJSVDUwenN3aVVva0VJWjB0QzBSNlMxWk56RWo5eFdLSlBkckVsZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nYWxsZXJ5IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1792062159),
	('nrV07RB1lygUUlN2qc0gTduI0A0M0z0cHmpk6x6F', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3Npd2U0TllTTE05WldmamthekdYZlBSak1kaHN2YTlWeVpUSG9HNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792062261),
	('nzkebif95aSjYuHc9rdtuAKJQ5gbiwHGjL0QjPw6', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEVKSE95MWZIQ3piUjJQbm5OM1Y2dkwyU1FOQklmNmMwVXhFdEpQTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nYWxsZXJ5IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1792062262),
	('Oc9zsPkyvK1MUZkSUjKMk3kGmL6KJvpsnIsYk8B1', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianhRTjF2WXhTMmpNUlQ4dk1sS0ZWQ3c3RlRmb3g3UzZyNEVuUVJyeiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nYWxsZXJ5IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1792062327),
	('Oo5lCQd5Ii4X00QliIRgOkCpgcxHj0qAX2YXSGA1', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXBsRmRhdkdxYjl5SzNwMlpYSmJDY2RFcllpSE1PbDdrdDBOT05NZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zZXJ2aWNlLWFsbCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792068206),
	('OQRYWJgV0qc6tWYErVMy2MMlQfMsamkIqtWT3DiR', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVU1aNzd2Q3RjWVJhaEY1SU42ZFkzbnczWmx5SFV4QVgxMHhjMnBjeiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792061417),
	('OsOIdUgk5Fs5NkfZkAWGAeaoOZk6XJMWm06w81dO', NULL, '127.0.0.1', 'node', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQkprTGc1bnNmQVE5WnR0R2hsdXJZYjdVRzlMV0hHZlpxOU1GVjRjdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792068090),
	('PIB0oljGK4n19dnhagzaUsR2YGNwG6PPIj6auljq', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUdweng1MHlOclNPS1ZJTDlId0dtWmxwYUFTdHRWTElUQkRIa013biI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792065097),
	('PzAcF4e8AltheSpW6JkMYIwYuUSnQ8YQpiddZIVl', NULL, '127.0.0.1', 'node', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoienlESnA0ZEcyN1NlWUM4ZkpadU9GN1VqN3RJU3BDVjJPUmtIYzlqQyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792068204),
	('qi7VmPJ4b3xF46zCelCdtqGrtJyikOe1MjpXkd8p', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEl2T0pwZWFENjI4c3VISXNuWkNVSTE2VnJSSVBVZGF5MVpPZ0d2QyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792068205),
	('qTiuqZK17IQBCYNOxRqxq4SPkG7Ipn1fQJqlr7DW', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiamxFY3p1SVJPYXVIVUdaQ25TbXFhTTFPRnVHY3ZEYWp2dW9MVDNSZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792062327),
	('swNQwwXKJcTRwe5NHZtYmXv4PvNzniMLQoSOSUOT', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiclFNeXBKUmc0VzgzcGVnN01OcnNaZ1VYbzE1dTNVeDBteTE2MlBQdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zZXJ2aWNlLWFsbCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792065962),
	('tO1dIWWKIBskIT2Dudivkg8T6zFkjBGEFmXkZzhr', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibGxmQW5SaDR2M2tTZHlDVnl5MWhTSjNSTGFGZVhJS1RIVTVWRUF2YSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zZXJ2aWNlLWFsbCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792067172),
	('tq5nraPdICtq6VroavzGrBdXUmnaevQE82tcL9Nf', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOVpVT2lJc3o4aFk0aGNDSkg2YlpSd3kxTGpOSXhxOEN1WWRXNmkxTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zZXJ2aWNlLWFsbCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792067461),
	('Tyb2VMbk2jRmQggw3vkn0orL8d1q8d5DRG4JdJa3', NULL, '127.0.0.1', 'node', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidVNhbXpwR0poMW52Mkg5UFpxZ05MUE9YRVJ5SmxLdTZDemNKU0dwUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792068363),
	('U4rbxCZsKYlHP97qLcV0IZrtYsEgvbx5F2CLQ8ga', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2E3N3RWckRPbnlRYk1SeEVFQmF4VmhnU1Nja3BQQ0FFNXRJV01GayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zZXJ2aWNlLWFsbCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792067470),
	('uDJ8SLlqkuVDOU5ghLe6xBhrH9lgOwNAqmD0RLM0', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWdLb2hRd2Fjb21hVmltaTBITjFVR3p0bmJodnRQWTUyenRwRXUzOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nYWxsZXJ5IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1792065980),
	('uf99BSSiVGiUsfST1hkDNSCr3gqGMdoKKll6mkEc', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUV4UFlkZTNTRmVuc3JYd3lZUlFaTm9najkzZ0FXdzlOZzNPN3RKeSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zZXJ2aWNlLWFsbCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792065992),
	('UqYojx7UGc2MwjP9JfLct5VvhIVnJU3qPIpv9y70', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWpuV2labks5SVpOM1ZKY2hoYXA1dmNqRzN1cm9VSlRXY2FGMWQycyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zZXJ2aWNlLWFsbCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792068091),
	('UuN52VytFYdlH8HxrdkS5TgdKKmSDlwNlEX7zi3n', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQjZ2U2JON3hscEM0d3ZnUWhvM3F5WEdaZmF1bXJKc0FOUUZGQUJWSiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792062058),
	('v5s4S9PtkE1j7yMo4SYtfYlebQgVVVB9OKOMvpC1', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzIya3k5SmtnR0VGZ2dBRXQ4OTRPbVM0c0t0RnVRM1UwdHU0OUNzUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nYWxsZXJ5IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1792062440),
	('ViGTAZ8ahb7Bb1XJeEpTkHTsSq7e3BudQ2CM5CSw', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzJFaUl4c2p5bjlHMFlZOFk3ekZJVXhGbEhTZ1pzdEZHc2Q5ZXBwWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792061046),
	('XhM8qXm0KWj65wlrlymSuxiEDRnTxPZDU350JzNL', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3R2dGpuS2RzV0ZxQjhKQnQ2V1FLYjh0U2VJT2trYjdHZ3Q5aDJkdCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792068090),
	('XoYIxQRrgv4vP4t4YtTb5KlIA3VfjSA8G3anMGAt', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMkN4Q2E1NEFpWVR5bWhURmZUMHBKZFZEVE5sbm9IRW5GWGlobUEydSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9nYWxsZXJ5IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1792064512),
	('zgcYt3PQP6X7Mf2Sy00ZuNxsOMFuObJDdczQ3BUT', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWxCOTJnRnJjeUhGcTAxeElsajNjWmpWWHlVeVZwa3JkaFg1aTBkdSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zZXJ2aWNlLWFsbCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792067386);

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
