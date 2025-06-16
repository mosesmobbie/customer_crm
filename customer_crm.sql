/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for osx10.20 (arm64)
--
-- Host: localhost    Database: customer_crm
-- ------------------------------------------------------
-- Server version	11.8.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `id_number` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `status` enum('pending','active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_uuid_unique` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `customers` VALUES
(1,'0b2fdcd2-381a-3678-b381-62349e66bc05','5621790467422','1981-09-24','Rodrick','DuBuque','odamore@example.net','0533447078','pending','2025-06-15 21:52:40','2025-06-16 06:32:39',NULL),
(2,'3b321670-5fff-362b-ab2f-f48512ab4579','4171720060024','1982-07-14','Akeem','Lang','murphy87@example.org','0145261593','pending','2025-06-15 21:52:40','2025-06-15 21:52:40',NULL),
(3,'f890ff3f-a0ab-31fc-8650-8ae42edc12f1','3075768663370','1987-09-18','Hyman','Lockman','cwhite@example.net','0138377999','inactive','2025-06-15 21:52:40','2025-06-15 21:52:40',NULL),
(4,'bf638ded-2aa0-3ea5-b8f7-dac09f7a0bd7','1899286209623','1983-01-29','Delia','Goldner','jacky.kuphal@example.org','0303768767','active','2025-06-15 21:52:40','2025-06-15 21:52:40',NULL),
(5,'fd238630-0ef2-3f5d-ae90-05303bbf142c','4367865181627','1980-12-14','Francesca','Feil','jdaniel@example.org','0006171485','pending','2025-06-15 21:52:40','2025-06-15 21:52:40',NULL),
(6,'5ccc5402-57a3-3596-81ad-b1c6d37a54df','7925112207765','1994-12-06','April','Boyle','josiane72@example.com','0678785623','inactive','2025-06-15 21:52:40','2025-06-15 21:52:40',NULL),
(7,'2d7f82d3-78f9-3919-a9a3-750e49f6b2a0','3482865566168','1986-05-08','Dale','Stark','angelina25@example.net','0011168826','inactive','2025-06-15 21:52:40','2025-06-15 21:52:40',NULL),
(8,'382279bd-0c96-33c1-8419-0609f01651a1','8404960461686','1975-09-19','Jayson','Greenholt','clair81@example.org','0156664426','active','2025-06-15 21:52:40','2025-06-15 21:52:40',NULL),
(9,'4ea53045-357b-32fb-bb5d-f5ac27b3c8fb','2539543828935','1972-02-18','Miracle','Effertz','xbarton@example.org','0721515058','active','2025-06-15 21:52:40','2025-06-15 21:52:40',NULL),
(10,'734bd9af-ba91-3a70-82cd-ae593fad4238','5238244019426','1978-03-02','Pasquale','Upton','berry59@example.net','0679380390','pending','2025-06-15 21:52:40','2025-06-15 21:52:40',NULL),
(11,'33481d95-fe02-3630-9f43-3e17ab6dfa84','6813929504658','1998-03-17','Dan','Vandervort','pkulas@example.org','0691307895','active','2025-06-15 21:52:40','2025-06-15 21:52:40',NULL),
(12,'a78cd030-c802-3dc9-98e4-94a2cb8ebafa','0379148890749','1970-11-08','Joan','Murphy','landen.maggio@example.com','0393606346','inactive','2025-06-15 21:52:40','2025-06-15 21:52:40',NULL),
(13,'1d1c3f38-5877-338a-8f44-9954633afebe','3341907237020','1978-05-21','Javier','Rohan','rdaugherty@example.net','0233210049','inactive','2025-06-15 21:52:40','2025-06-15 21:52:40',NULL),
(14,'56462e86-51e1-396d-b75e-975d9e84013c','0688104561729','1983-05-18','Ben','Bogisich','vtillman@example.com','0469035198','pending','2025-06-15 21:52:40','2025-06-15 21:52:40',NULL),
(15,'c509fe29-4d29-37f9-bf4b-962207bff3f6','5341032852142','1985-07-18','Paige','Boyle','holly54@example.org','0809749567','inactive','2025-06-15 21:52:40','2025-06-15 21:52:40',NULL),
(16,'0580ad91-fd59-3f07-837f-3e5b5d659b3a','3227790998855','1980-06-13','Zoe','Hills','sophie.ledner@example.com','0745563393','pending','2025-06-15 21:52:40','2025-06-15 21:52:40',NULL),
(17,'ccd366b9-9198-3a53-994f-297b8c1656b1','1808453985398','1977-03-10','Markus','Hansen','freda.smith@example.net','0482247316','pending','2025-06-15 21:52:40','2025-06-15 21:52:40',NULL),
(18,'1f79ce48-6c0f-35e4-a12e-7db135719f0f','7977085304500','1975-10-29','Keshawn','Gutmann','pagac.sabryna@example.org','0866194115','inactive','2025-06-15 21:52:40','2025-06-15 21:52:40',NULL),
(19,'f01972cc-24a6-3961-be9e-c4d04b0487df','2204231908781','1999-08-03','Bobbie','Prosacco','vandervort.marshall@example.org','0872386659','inactive','2025-06-15 21:52:40','2025-06-15 21:52:40',NULL),
(20,'a4dfa1b6-1a12-3592-a30c-86dd8bd5bafd','7990760247430','1993-02-08','Jerry','Parker','padberg.murphy@example.net','0724053193','active','2025-06-15 21:52:40','2025-06-15 21:52:40',NULL),
(21,'739b81a9-a7c0-4eeb-be02-44745b97f321','9876543210','1991-01-01','Jane','Doe','jane@example.com','9876543210','active','2025-06-16 04:05:19','2025-06-16 04:53:24','2025-06-16 04:53:24'),
(22,'023dd732-fb88-4214-8600-9a7bd18bff36','4356345634','1991-11-21','Janey','Doe','peter@example.com','9876543210','inactive','2025-06-16 04:06:52','2025-06-16 05:01:50',NULL),
(23,'26c83e9d-dd9c-4394-a147-1f7ae8cabb79','98765464210','1991-01-01','Jane','Doe','jdfge@example.com','9876543210','inactive','2025-06-16 04:08:47','2025-06-16 04:08:47',NULL),
(24,'2c0ed27d-afce-48ac-8d42-23fabc48ba31','98765464210','1991-01-01','Jane','Doe','jdfge@example.com','9876543210','inactive','2025-06-16 04:10:34','2025-06-16 06:36:16','2025-06-16 06:36:16'),
(25,'5f9f8401-b0ce-483b-9e30-61616e04f1cd','4356345634','1991-01-01','Jane','Doe','peter@example.com','9876543210','inactive','2025-06-16 04:17:13','2025-06-16 06:36:11','2025-06-16 06:36:11'),
(26,'36242b11-633a-46af-97b1-bd0f0b770302','4356345634','1991-11-21','Janey','Doe','peter@example.com','9876543210','inactive','2025-06-16 04:19:24','2025-06-16 04:37:12','2025-06-16 04:37:12'),
(27,'24c8b075-5b0a-491f-bf7d-88036a4ddbd3','4356345634&lt;test&gt;','1991-11-21','Janey','Doe','peter@example.com','9876543210','pending','2025-06-16 05:36:05','2025-06-16 06:36:08','2025-06-16 06:36:08'),
(28,'9b0d1494-249a-493d-8fbb-7a88e3157843','4356345634&lt;test&gt;','1991-11-21','Janey','Doe','peter@example.com','9876543210','pending','2025-06-16 05:38:02','2025-06-16 06:32:48','2025-06-16 06:32:48'),
(29,'e59d296a-b0b9-430e-b669-bed328f733f6','4356345634&lt;test&gt;','1991-11-21','Janey','Doe','peter@example.com','9876543210','pending','2025-06-16 05:38:03','2025-06-16 06:30:53','2025-06-16 06:30:53'),
(30,'0b10c1b5-96c3-4756-a5ae-841121a14c6e','1234567890','1990-11-11','John','Doe','john@example.com','1234567890','active','2025-06-16 05:51:41','2025-06-16 05:54:48','2025-06-16 05:54:48'),
(31,'f211d908-86ef-4e46-8271-fa786e43ceb8','ID1234562344','2022-06-13','King','Doe','john.doeee@example.com','0533447078','active','2025-06-16 06:33:19','2025-06-16 06:36:03','2025-06-16 06:36:03'),
(32,'8d983ad4-2900-4bea-b69e-8b7dcf4914ee','45364563456','1981-09-24','Zukiswa','Maxhosa','zuki@test.com','0781887508','active','2025-06-16 06:35:40','2025-06-16 06:35:40',NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(5,'2025_06_15_220309_create_customers_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES
(1,'King Moss','moses@test.com',NULL,'$2y$10$JAMq1y//bvr8p8C1phNoj.ECQtjiM67nHcAV1CUfLiCQFFEURl5GW',NULL,'2025-06-15 20:32:25','2025-06-15 20:32:25'),
(2,'Moss Mobbie','moses.mobbie@gmail.com',NULL,'$2y$10$aq9Iz80ernzRvEZSRS96S.MwYVBPPeDu7KI8H4JDZDjPx4JevoVxa',NULL,'2025-06-15 20:33:58','2025-06-15 20:33:58');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-16 13:09:45
