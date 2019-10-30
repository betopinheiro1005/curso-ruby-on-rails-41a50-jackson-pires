-- --------------------------------------------------------
-- Servidor:                     localhost
-- Versão do servidor:           10.2.3-MariaDB-log - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para ror-jp-p4_development
CREATE DATABASE IF NOT EXISTS `ror-jp-p4_development` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ror-jp-p4_development`;

-- Copiando estrutura para tabela ror-jp-p4_development.active_admin_comments
CREATE TABLE IF NOT EXISTS `active_admin_comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `resource_type` varchar(255) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `author_type` varchar(255) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_active_admin_comments_on_resource_type_and_resource_id` (`resource_type`,`resource_id`),
  KEY `index_active_admin_comments_on_author_type_and_author_id` (`author_type`,`author_id`),
  KEY `index_active_admin_comments_on_namespace` (`namespace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ror-jp-p4_development.active_admin_comments: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `active_admin_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_admin_comments` ENABLE KEYS */;

-- Copiando estrutura para tabela ror-jp-p4_development.admin_users
CREATE TABLE IF NOT EXISTS `admin_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admin_users_on_email` (`email`),
  UNIQUE KEY `index_admin_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ror-jp-p4_development.admin_users: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` (`id`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `created_at`, `updated_at`) VALUES
	(1, 'admin@example.com', '$2a$11$x9g2LWE7ltB5PxYRotuvy.dcHf4AsiwylDV/Off1.FEKaJVh7ZMsy', NULL, NULL, NULL, '2019-10-30 19:17:52', '2019-10-30 19:17:52'),
	(2, 'jackson@gmail.com', '$2a$11$AbauuwPOBCDh2WenL3nqMuAURDRlXnw2oyBO6tVYgK84HUXAjxEnC', NULL, NULL, NULL, '2019-10-30 22:30:27', '2019-10-30 22:30:27');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;

-- Copiando estrutura para tabela ror-jp-p4_development.appointments
CREATE TABLE IF NOT EXISTS `appointments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `physician_id` bigint(20) DEFAULT NULL,
  `patient_id` bigint(20) DEFAULT NULL,
  `appointment_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_appointments_on_physician_id` (`physician_id`),
  KEY `index_appointments_on_patient_id` (`patient_id`),
  CONSTRAINT `fk_rails_9c57b861f7` FOREIGN KEY (`physician_id`) REFERENCES `physicians` (`id`),
  CONSTRAINT `fk_rails_c63da04ab4` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ror-jp-p4_development.appointments: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` (`id`, `physician_id`, `patient_id`, `appointment_date`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '2019-10-31 16:00:00', '2019-10-29 17:12:38', '2019-10-29 17:12:38'),
	(2, 1, 2, '2019-11-12 10:30:00', '2019-10-29 17:14:07', '2019-10-29 17:14:07'),
	(3, 1, 3, '2019-11-22 17:12:00', '2019-10-29 17:14:07', '2019-10-29 17:14:07'),
	(4, 2, 4, '2019-11-05 09:15:00', '2019-10-29 17:18:20', '2019-10-29 17:18:20'),
	(5, 2, 5, '2019-11-16 13:00:00', '2019-10-29 17:18:20', '2019-10-29 17:18:20'),
	(6, 2, 6, '2019-11-27 16:30:00', '2019-10-29 17:18:20', '2019-10-29 17:18:20'),
	(7, 3, 7, '2019-10-29 22:24:00', '2019-10-29 22:24:55', '2019-10-29 22:24:55');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;

-- Copiando estrutura para tabela ror-jp-p4_development.ar_internal_metadata
CREATE TABLE IF NOT EXISTS `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ror-jp-p4_development.ar_internal_metadata: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`) VALUES
	('environment', 'development', '2019-10-27 21:53:27', '2019-10-27 21:53:27');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;

-- Copiando estrutura para tabela ror-jp-p4_development.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ror-jp-p4_development.categories: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Copiando estrutura para tabela ror-jp-p4_development.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ror-jp-p4_development.customers: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

-- Copiando estrutura para tabela ror-jp-p4_development.patients
CREATE TABLE IF NOT EXISTS `patients` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ror-jp-p4_development.patients: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Aurélio', '2019-10-29 17:12:38', '2019-10-29 17:12:38'),
	(2, 'Marina', '2019-10-29 17:14:07', '2019-10-29 17:14:07'),
	(3, 'Francisco', '2019-10-29 17:14:07', '2019-10-29 17:14:07'),
	(4, 'Rita', '2019-10-29 17:18:20', '2019-10-29 17:18:20'),
	(5, 'Selma', '2019-10-29 17:18:20', '2019-10-29 17:18:20'),
	(6, 'Anderson', '2019-10-29 17:18:20', '2019-10-29 17:18:20'),
	(7, 'Leonardo', '2019-10-29 22:24:55', '2019-10-29 22:24:55');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;

-- Copiando estrutura para tabela ror-jp-p4_development.physicians
CREATE TABLE IF NOT EXISTS `physicians` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ror-jp-p4_development.physicians: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `physicians` DISABLE KEYS */;
INSERT INTO `physicians` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'José Ricardo', '2019-10-29 17:12:38', '2019-10-29 17:12:38'),
	(2, 'Bruno', '2019-10-29 17:18:19', '2019-10-29 17:18:19'),
	(3, 'Orlando', '2019-10-29 22:24:55', '2019-10-29 22:24:55');
/*!40000 ALTER TABLE `physicians` ENABLE KEYS */;

-- Copiando estrutura para tabela ror-jp-p4_development.schema_migrations
CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ror-jp-p4_development.schema_migrations: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` (`version`) VALUES
	('20191027215210'),
	('20191028192835'),
	('20191029131945'),
	('20191029132221'),
	('20191029162400'),
	('20191029162447'),
	('20191029163822'),
	('20191029163904'),
	('20191029163950'),
	('20191029165440'),
	('20191029165531'),
	('20191029165615'),
	('20191030171231'),
	('20191030191408'),
	('20191030191454');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;

-- Copiando estrutura para tabela ror-jp-p4_development.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ror-jp-p4_development.users: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `created_at`, `updated_at`) VALUES
	(1, 'Roberto', 'betopinheiro1005@yahoo.com.br', '2019-10-28 15:08:34', '2019-10-28 15:08:34'),
	(4, 'afdasf', 'asdfas', '2019-10-29 01:29:15', '2019-10-29 01:29:15'),
	(5, 'Roberto', 'betopinheiro1005@yahoo.com.br', '2019-10-29 01:33:56', '2019-10-29 01:33:56'),
	(6, 'Roberto', 'betopinheiro1005@yahoo.com.br', '2019-10-29 01:38:00', '2019-10-29 01:38:00'),
	(7, 'Roberto', 'betopinheiro1005@yahoo.com.br', '2019-10-29 01:44:59', '2019-10-29 01:44:59'),
	(8, 'Roberto', 'betopinheiro1005@yahoo.com.br', '2019-10-29 01:45:02', '2019-10-29 01:45:02'),
	(9, 'Roberto', 'betopinheiro1005@yahoo.com.br', '2019-10-29 01:45:16', '2019-10-29 01:45:16'),
	(10, 'Roberto', 'betopinheiro1005@yahoo.com.br', '2019-10-29 01:47:01', '2019-10-29 01:47:01'),
	(11, 'Roberto', 'betopinheiro1005@yahoo.com.br', '2019-10-29 01:52:10', '2019-10-29 01:52:10'),
	(12, 'Roberto', 'betopinheiro1005@yahoo.com.br', '2019-10-29 01:54:23', '2019-10-29 01:54:23'),
	(13, 'Roberto', 'betopinheiro1005@yahoo.com.br', '2019-10-29 01:57:56', '2019-10-29 01:57:56'),
	(14, 'Jackson', 'jackson@gmail.com', '2019-10-29 02:05:08', '2019-10-29 02:05:08'),
	(15, 'Roberto', 'betopinheiro1005@yahoo.com.br', '2019-10-29 11:15:21', '2019-10-29 11:15:21'),
	(16, 'Roberto', 'betopinheiro1005@yahoo.com.br', '2019-10-29 11:17:17', '2019-10-29 11:17:17'),
	(17, 'Roberto', 'betopinheiro1005@yahoo.com.br', '2019-10-29 11:17:57', '2019-10-29 11:17:57');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Copiando estrutura do banco de dados para ror-jp-p4_test
CREATE DATABASE IF NOT EXISTS `ror-jp-p4_test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ror-jp-p4_test`;

-- Copiando estrutura para tabela ror-jp-p4_test.ar_internal_metadata
CREATE TABLE IF NOT EXISTS `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ror-jp-p4_test.ar_internal_metadata: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`) VALUES
	('environment', 'test', '2019-10-27 22:00:16', '2019-10-27 22:00:16');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;

-- Copiando estrutura para tabela ror-jp-p4_test.schema_migrations
CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ror-jp-p4_test.schema_migrations: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` (`version`) VALUES
	('20191027215210');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;

-- Copiando estrutura para tabela ror-jp-p4_test.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ror-jp-p4_test.users: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `created_at`, `updated_at`) VALUES
	(13, 'Jackson', 'jackson@gmail.com', '2019-10-28 17:17:56', '2019-10-28 17:17:56');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
