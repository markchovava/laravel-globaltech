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

-- Dumping structure for table laravel_zenith_space.app_infos
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_zenith_space.app_infos: ~0 rows (approximately)

-- Dumping structure for table laravel_zenith_space.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_zenith_space.cache: ~0 rows (approximately)

-- Dumping structure for table laravel_zenith_space.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_zenith_space.cache_locks: ~0 rows (approximately)

-- Dumping structure for table laravel_zenith_space.failed_jobs
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

-- Dumping data for table laravel_zenith_space.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table laravel_zenith_space.jobs
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

-- Dumping data for table laravel_zenith_space.jobs: ~0 rows (approximately)

-- Dumping structure for table laravel_zenith_space.job_batches
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

-- Dumping data for table laravel_zenith_space.job_batches: ~0 rows (approximately)

-- Dumping structure for table laravel_zenith_space.messages
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_zenith_space.messages: ~0 rows (approximately)

-- Dumping structure for table laravel_zenith_space.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_zenith_space.migrations: ~0 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2025_03_19_081444_create_personal_access_tokens_table', 1),
	(5, '2025_05_14_130306_create_app_infos_table', 1),
	(6, '2026_03_10_074156_create_messages_table', 1);

-- Dumping structure for table laravel_zenith_space.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_zenith_space.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table laravel_zenith_space.personal_access_tokens
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_zenith_space.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table laravel_zenith_space.sessions
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

-- Dumping data for table laravel_zenith_space.sessions: ~47 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('01bAse8iHMWyh7zRPQC3lN7IgekTniyRPNDaYe9h', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianVtUGZ5ZXYzRVRxRXB3Vk1kUjdqZUZseEs5ZzNwNlA3bXp2a1RwSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166368),
	('0U6nBCwtXBGLVCih1g03ZwAbbFT3hBTbpCc0AnbF', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUUF1YTZYNG5rTXRubXNBeFBkNnNZUmY0aUE5YWtJakdWY1BKckZuUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166368),
	('0ZOXJZ7clxyvqSYCSZVcaVoT5rHJqOQpRGJ9xl3k', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmxDQWdkcDQyUE9yejVIQ0ZyZlU0Um04Sk9qRkNPS3didWJxTDZvdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166902),
	('13W27XqGflkToYs5SPGnBjq3ZLuXNPX7cmatZ1Wg', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUw2VzVHaHRmRTFSNmkyRmJtUnR5UUhWZG5VM2MxWFVtM0VpbnNjdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166901),
	('19Gedvpjw78FD4NJ3lra1CUgrSkmqcYeDe46RTz3', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZERyWnNOMG1hTktreFh2VHlzeXQ4N2N2czFtWnRDenRSOWFSYkZTUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166808),
	('29g4y7cQ19DBZeLpSon3yx72Of9rU9F2ZfDUTg2L', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1FETE5BNzVmZGdGZzJXbVAyWWx1eGlIUjRsbTV2NmJXS2VQemIyYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166376),
	('3EDraJin6hsfQ2O0e7O1Hl95xqSRZGlB1SqlkH1R', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTklwNEpEckVNYnJHUnZ2R0xQM0toc3gzTnNyMzUwdUtQU2x6NXJSTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166861),
	('5Rh6teEs1hLSu97srNq5wcK657StLlclzONkNRSH', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOVplbGdvN2p5djRpM3R2bjRKRnhQb1htR3NzRm8ybWNxRkFqVHY1MyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166655),
	('6j2MO4k8eJpH9GaFr2zkvWRIfGvHHsNlA60gWO2W', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXpucTJBalRjMzhTeDE3Q2kwVjFvdVBuekE2OXZGM0J6VlZOcHRUNCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785167201),
	('6vgW4ZSpjnkcIVn9MUs01LdjTMwRboBT4kExU61r', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzZMeW95TWVjWXBta0N1VTA0aUJCYUlmVmFLcE14ZHIzUVoyakl2OSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785165672),
	('7nDFe8jE1nL9pCIc34OKsrNvbrTUT7SGh2E8SsDM', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoick9BYmZ1NWZaTnlGZW0wZzBLeG5jQ251RHh4TlJIMmtRNU5kbzdqeSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166789),
	('7shpHspQEeyMi1dP729o9FcgnwyuMcC7Fz3NqrPx', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTFCTHpmblN5TVZjVGRlTUxwWUd6RWpCNW9QTzRJMlpCVE93WHNZUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785165894),
	('8QesPMji1YvdghyTvm4zrfs1mU7TEBByiZnrIXi6', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3ZNa29wQWE4azhFRGRySVdQVEZuQ0Z4Q05ReEdMY1RaVFdNajBPdCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785167202),
	('8vNMBQM1QwKR2oLSuGJORE5GOG7PLES9LZplNh9Z', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaklKYmtrOVFSazdqOU0yZHFDZEhQVU5hazZHNUZkenhPSmlMUGtoTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166861),
	('9a2fKlswZaqxF9fWCioyrCC7GKfioLRJb3QuhunE', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1Rod2xwU1ZKOUg1Rmp6VmdwN2pwUHBEVzZvYkRTbDhoek5EWjhVYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785167223),
	('Dhb86A6XXyPbBiM4yvs0dMtjoNxBpfwjZcpPKiy4', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3VlOENCMzl6VDhiMWtsZHlnV1N2T2VWNnA0cnVxN2c3cXN6Vmh0RiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166916),
	('e61RIajYwAQhMzQjrBtESzWw50gMpPXyowI3uR0p', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY1BZQjVlMldXV2ZtbFZXUjJxa3V6T21rNWlBZWdmUlVGSm42YW40ZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166993),
	('etqRNTh4TVmjcapsEM1OHbVll9zG6Q2nP4jAadtz', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieU5hemYxNGQwdjRQRE5XRkI5WEtVRDRhNXZlOUdjbWFLZ2E4UkZRbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166347),
	('garr4ih7usYuQ3bjQNToqyyp6qKYvIQL8eAuVsKa', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1VFS2VhaUVQbGRtdThMVVBHRmFaWG9ka3NtVnZPNHdtSWZNM2tvWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166895),
	('geuuIfvXhANulby0ufuVuEBva2kZ1zN7b1JX7d8K', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmxrZWVOOWFXRzFvREgzMlRFMjJEamNuVWlNbEZnMzZkREpmcUh0aSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166656),
	('gRJwVnC6su5QQHdiDqjAWpB2hX1W8HR9pOaRV1O7', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUFJRjFJUktJMExVRGJLU2VVdXZhOE83bFpYems0ZGtGVEt1T01EZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785167095),
	('grSPpGRtCenLXkPYv0LONMFa7Pal8UfzGj8O4W59', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUxlNU4wUVAxZ2x5SWQzVEh1QTFKdXhLN1hsN3NRd2liTm9WemxuSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166961),
	('GT1gtSPLx96rBp1v7ykWcxwW8DRQJcdm4Hiqqu7j', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYldWbkdUWk16ZHFrSVRKY1hmbEdOZWhCVlo0bEg5dUI2aGRXSGRHeCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166883),
	('H4e8ucNpccmVdiE4AQDZoiLLxYYyoMIwa3Sv95H5', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWtHV09PTVlDOHFLZFNLc2ZRMkNHMW1FVDlkeWJaYU1LN3J0aUg0MiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166871),
	('jRAkt8uyvlndtvkDVdtE8wQhj2O2ZnYy04XxzPsk', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicTZSVlNLcUxjV0pKUG02anRNRkhZWjJDUXFHOERvcVZzS3lXRzlBayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785165680),
	('JrKsNKlysovAZyYKYK8jauZRtpyuuJapI48ZkFJY', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDBUbzVCMXZDd1l1alQ4UDZQcXNtOW5sR2Q0WGVJbjQySTJhUFJPdyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166870),
	('kqeE9oYBhxbTfKcttlk4grnGY913mi2xkDQSuraM', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGI3MEtPZTVWZmZNSXB6eGFJdTRxZGRRMjF4b1czMTNMTHZiTVpRYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785165672),
	('m75sKvb6BxLJUqOKQtLpi9JMJ2CGVromQ4ezfDfC', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZDN0c000djQ5ZUhEaXVZZ0VvZHNFbXVCakhnNzFVYkVuSnBtYmFvUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166657),
	('MO0cgQUoagwBVd5ygwh6FVoIvai9HTXqLXmVOAtZ', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU3UzSVJVU2tGRjVZWjBVQUp3c3lpQk1WWER6RUlIWmxLYUdSeEpPZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166891),
	('n2xOjXQt7638DMmvK3IAvm9CN4fR8pjuomMudTVk', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTFsUUVsaktCQndIWE4wVk1OeUlUT0xGeEpSbmtPUnptamJBeVdaMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785167200),
	('NLHbr1wcl52pszQS5ztGCAx2qztHSc7PZDXSwo7S', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXhZQ1YwZHFHRDFsbk1Jd3RUcGJDalNKZ3pNOTlOSVM5VWZ2SlFjcyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166789),
	('nrIej8gBSGl8K473ksffragUfi2YYBkzIVhnGwKT', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid21GYmNITHp4M2RZYm15c09PczM0ZllQVkJxS3JPSFA3ZmZ0V0FJeCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785165681),
	('OEtmzK0LTKIBD9j2aPhWKiYIbbx8iJnmUqLMwtZN', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFFTQ2I1bW53M0VMVGkyNzdObHBzeU42RWFZVkxiaXo2QWNmSzhUSCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785167203),
	('oo47kwC4WI5rdrjmPlTFtTSFYRrHqS76i8XdejnD', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXk1YjFxZFJ3S3NTb0NuYm1vdFhyc1NQalFxRlo1bnU1NGhmYlpnMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785167119),
	('P3QsTftoobGTPz7heQjzUNUdeT9iQBy2Cedkxtcu', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmZGd09jQjN4SmNraENCZTZkWjZpUFMyMUFtb1d6bUFBVmNLNUZjbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785167201),
	('pS5ikAgFFYVXKB1aZrFzNylyKA3XfXBfhuUgIdhg', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblNSZURPdGRZbWxvV1B2dWRzNEx2YUFGTm9VWDNxYldPdnVjS3U3NiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166376),
	('pWTsOo9AoqQDSNdM5fgHZpmKw2zGfq3EVIdCTShr', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUc1SDJWNE5nZFJUVmVFWjA5OHYxeU1xcDdvMzVjUHFUNHY0cXVYTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166825),
	('QbHvtrEdG4OqiaPlj3bt4PBp1IsSInelNXoEMEVR', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWJJZU55MHNWa3ZtN3VlSGkwcDl5NFhiQ0RReFFlOTBZVU9XNGVGTiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166657),
	('RIuy2nQ6esFomJgvR2uo8tN3tUJncnGcwgmcsEhH', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODhRdHY5Zm1yMEVhUHlLU2ZRd0VkdnhBRlNaVGpFQ1BrYk1qd3huWSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166658),
	('tGNt9pCuHi1cxv2od2yCQd9FY6FemaVlf3JRbyA8', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFJLVXF4MG9NT213RzA4S3U0S0V0NmhZeUZROUh0SjhOYjFESFlVaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785167149),
	('tTDqmE1eHLzqbFuIhRDHpWaEWobSc5o5xsYZHRMS', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVW9uS1RlSmhCdUV2WmhjZ05qcGdOcTdyZzNlUGhGaXRXenBOTDc2dSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785167150),
	('uBAyx2jrJ3WavTMkhKeJxRzWiaEi2hDC2pTES8h0', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzd1VnNJWURhaEphYjlMUUpQVjdISXNqVmk0STBMMkdiS1FxVzY3TCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166414),
	('UElkGWKgfK332n2nF7K2Y0gdLFhZZlxWH8g0JB5m', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVjA2aDJ6MU1SOTUxaUcxWWNRSFpSQUtORFZ4RnA3NTUxanpSaG5ERSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785167223),
	('vvjqrhEAWQgBDY2wViWHefQuCX0SfIy50DizF1Vh', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0hXSEwzQTFuajM4Q2xlT1V5OHRXWXlHdG1zUjlQc1NVa0VBV1Y3cSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166809),
	('vyqpUMl3DUBhnOEcZFYYzNSOSsTnBY4F4jZ3P5Y5', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXVyb1dGQXN0UUxMWkNMRnRNV1QzWlJUU2U3eTNkR2tFT3k2RUVTeiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785167122),
	('XBFqpwrcbJPAYy0FbK5TmT1a2wlmibZfEGKwTqsJ', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVhrYTlEZ0ZNdGFzT2xvV0RFeFdLSEt5MVFOU2xVcFpmcHFQbXNseiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166414),
	('zy9mxuE40Kx4YoWSvhAI545ZdTcB8hABYWjUtQ7a', NULL, '127.0.0.1', 'node', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWlM4ZVVWR0JmTDRQZ0Z0WEdtS1dTaUt0aTlxdkdXbzhDSG56MHE3ViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAtaW5mbyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1785166961);

-- Dumping structure for table laravel_zenith_space.users
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_zenith_space.users: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
