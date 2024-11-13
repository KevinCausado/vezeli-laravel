-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: laravel
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `address_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_address_id` int unsigned DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL COMMENT 'null if guest checkout',
  `cart_id` int unsigned DEFAULT NULL COMMENT 'only for cart_addresses',
  `order_id` int unsigned DEFAULT NULL COMMENT 'only for order_addresses',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'only for customer_addresses',
  `use_for_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_customer_id_foreign` (`customer_id`),
  KEY `addresses_cart_id_foreign` (`cart_id`),
  KEY `addresses_order_id_foreign` (`order_id`),
  KEY `addresses_parent_address_id_foreign` (`parent_address_id`),
  CONSTRAINT `addresses_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_parent_address_id_foreign` FOREIGN KEY (`parent_address_id`) REFERENCES `addresses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'customer',NULL,2,NULL,NULL,'Ragnar','Causado',NULL,'FAke 1','Cra 41G No. 113-125 , Torre 22 Apto 504, Gorrión, A. del Rio','Barranquilla','Atlantico','CO','080020','ragnargladiatore@gmail.com','3152089391',NULL,0,0,NULL,'2024-11-02 19:22:15','2024-11-02 19:22:15');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_password_resets`
--

DROP TABLE IF EXISTS `admin_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_password_resets`
--

LOCK TABLES `admin_password_resets` WRITE;
/*!40000 ALTER TABLE `admin_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int unsigned NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  UNIQUE KEY `admins_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Martha Baron','marthabaron1078@gmail.com','$2y$10$PXD3F3qz3NmZjIpXzEI6Y.x/uTQBr2PwN0I5DZu4WanORc25IZzsG','w3AZ4p5FX5JS2XU36oQndLU39nsX0WREpQXa5caM1EqMObCME5XQxjbAfFms72R6Ar3Ywquir9srnNxU',1,1,NULL,NULL,'2024-11-02 12:48:21','2024-11-09 13:45:21');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_families`
--

DROP TABLE IF EXISTS `attribute_families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_families` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_families`
--

LOCK TABLES `attribute_families` WRITE;
/*!40000 ALTER TABLE `attribute_families` DISABLE KEYS */;
INSERT INTO `attribute_families` VALUES (1,'default','Predeterminado',0,1);
/*!40000 ALTER TABLE `attribute_families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_group_mappings`
--

DROP TABLE IF EXISTS `attribute_group_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_group_mappings` (
  `attribute_id` int unsigned NOT NULL,
  `attribute_group_id` int unsigned NOT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`attribute_id`,`attribute_group_id`),
  KEY `attribute_group_mappings_attribute_group_id_foreign` (`attribute_group_id`),
  CONSTRAINT `attribute_group_mappings_attribute_group_id_foreign` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_group_mappings_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_group_mappings`
--

LOCK TABLES `attribute_group_mappings` WRITE;
/*!40000 ALTER TABLE `attribute_group_mappings` DISABLE KEYS */;
INSERT INTO `attribute_group_mappings` VALUES (1,1,1),(2,1,3),(3,1,4),(4,1,5),(5,6,1),(6,6,2),(7,6,3),(8,6,4),(9,2,1),(10,2,2),(11,4,1),(12,4,2),(13,4,3),(14,4,4),(15,4,5),(16,3,1),(17,3,2),(18,3,3),(19,5,1),(20,5,2),(22,5,4),(23,1,6),(25,1,8),(26,6,5),(27,1,2),(28,7,1);
/*!40000 ALTER TABLE `attribute_group_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_groups`
--

DROP TABLE IF EXISTS `attribute_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_family_id` int unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column` int NOT NULL DEFAULT '1',
  `position` int NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_groups_attribute_family_id_name_unique` (`attribute_family_id`,`name`),
  CONSTRAINT `attribute_groups_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_groups`
--

LOCK TABLES `attribute_groups` WRITE;
/*!40000 ALTER TABLE `attribute_groups` DISABLE KEYS */;
INSERT INTO `attribute_groups` VALUES (1,'general',1,'General',1,1,0),(2,'description',1,'Descripción',1,2,0),(3,'meta_description',1,'Meta Descripción',1,3,0),(4,'price',1,'Precio',2,1,0),(5,'shipping',1,'Envío',2,2,0),(6,'settings',1,'Configuraciones',2,3,0),(7,'inventories',1,'Inventarios',2,4,0);
/*!40000 ALTER TABLE `attribute_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_option_translations`
--

DROP TABLE IF EXISTS `attribute_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_option_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `attribute_option_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_option_translations_attribute_option_id_locale_unique` (`attribute_option_id`,`locale`),
  CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_option_translations`
--

LOCK TABLES `attribute_option_translations` WRITE;
/*!40000 ALTER TABLE `attribute_option_translations` DISABLE KEYS */;
INSERT INTO `attribute_option_translations` VALUES (1,1,'es','Rojo'),(2,2,'es','Verde'),(3,3,'es','Amarillo'),(4,4,'es','Negro'),(5,5,'es','Blanco');
/*!40000 ALTER TABLE `attribute_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_options`
--

DROP TABLE IF EXISTS `attribute_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int unsigned NOT NULL,
  `admin_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  `swatch_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_options_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_options`
--

LOCK TABLES `attribute_options` WRITE;
/*!40000 ALTER TABLE `attribute_options` DISABLE KEYS */;
INSERT INTO `attribute_options` VALUES (1,23,'Rojo',1,NULL),(2,23,'Verde',2,NULL),(3,23,'Amarillo',3,NULL),(4,23,'Negro',4,NULL),(5,23,'Blanco',5,NULL);
/*!40000 ALTER TABLE `attribute_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_translations`
--

DROP TABLE IF EXISTS `attribute_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`),
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_translations`
--

LOCK TABLES `attribute_translations` WRITE;
/*!40000 ALTER TABLE `attribute_translations` DISABLE KEYS */;
INSERT INTO `attribute_translations` VALUES (1,1,'es','SKU'),(2,2,'es','Nombre'),(3,3,'es','Clave de URL'),(4,4,'es','Categoría de Impuestos'),(5,5,'es','Nuevo'),(6,6,'es','Destacado'),(7,7,'es','Visible Individualmente'),(8,8,'es','Estado'),(9,9,'es','Descripción Corta'),(10,10,'es','Descripción'),(11,11,'es','Precio'),(12,12,'es','Costo'),(13,13,'es','Precio Especial'),(14,14,'es','Precio Especial Desde'),(15,15,'es','Precio Especial Hasta'),(16,16,'es','Meta Título'),(17,17,'es','Meta Palabras Clave'),(18,18,'es','Meta Descripción'),(19,19,'es','Longitud'),(20,20,'es','Ancho'),(22,22,'es','Peso'),(23,23,'es','Color'),(25,25,'es','Marca'),(26,26,'es','Compra de Invitado'),(27,27,'es','Número de Producto'),(28,28,'es','Gestionar Stock');
/*!40000 ALTER TABLE `attribute_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `swatch_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regex` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_unique` tinyint(1) NOT NULL DEFAULT '0',
  `is_filterable` tinyint(1) NOT NULL DEFAULT '0',
  `is_comparable` tinyint(1) NOT NULL DEFAULT '0',
  `is_configurable` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_on_front` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_locale` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_channel` tinyint(1) NOT NULL DEFAULT '0',
  `default_value` int DEFAULT NULL,
  `enable_wysiwyg` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'sku','SKU','text',NULL,NULL,NULL,1,1,1,0,0,0,0,0,0,0,NULL,0,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(2,'name','Nombre','text',NULL,NULL,NULL,3,1,0,0,1,0,0,0,1,0,NULL,0,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(3,'url_key','Clave de URL','text',NULL,NULL,NULL,4,1,1,0,0,0,0,0,1,0,NULL,0,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(4,'tax_category_id','Categoría de Impuestos','select',NULL,NULL,NULL,5,0,0,0,0,0,0,0,0,1,NULL,0,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(5,'new','Nuevo','boolean',NULL,NULL,NULL,6,0,0,0,0,0,0,0,0,0,NULL,0,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(6,'featured','Destacado','boolean',NULL,NULL,NULL,7,0,0,0,0,0,0,0,0,0,NULL,0,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(7,'visible_individually','Visible Individualmente','boolean',NULL,NULL,NULL,9,1,0,0,0,0,0,0,0,0,NULL,0,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(8,'status','Estado','boolean',NULL,NULL,NULL,10,1,0,0,0,0,0,0,0,1,NULL,0,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(9,'short_description','Descripción Corta','textarea',NULL,NULL,NULL,11,1,0,0,0,0,0,0,1,0,NULL,1,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(10,'description','Descripción','textarea',NULL,NULL,NULL,12,1,0,0,1,0,0,0,1,0,NULL,1,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(11,'price','Precio','price',NULL,'decimal',NULL,13,1,0,1,1,0,0,0,0,0,NULL,0,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(12,'cost','Costo','price',NULL,'decimal',NULL,14,0,0,0,0,0,1,0,0,0,NULL,0,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(13,'special_price','Precio Especial','price',NULL,'decimal',NULL,15,0,0,0,0,0,0,0,0,0,NULL,0,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(14,'special_price_from','Precio Especial Desde','date',NULL,NULL,NULL,16,0,0,0,0,0,0,0,0,1,NULL,0,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(15,'special_price_to','Precio Especial Hasta','date',NULL,NULL,NULL,17,0,0,0,0,0,0,0,0,1,NULL,0,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(16,'meta_title','Meta Título','textarea',NULL,NULL,NULL,18,0,0,0,0,0,0,0,1,0,NULL,0,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(17,'meta_keywords','Meta Palabras Clave','textarea',NULL,NULL,NULL,20,0,0,0,0,0,0,0,1,0,NULL,0,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(18,'meta_description','Meta Descripción','textarea',NULL,NULL,NULL,21,0,0,0,0,0,1,0,1,0,NULL,0,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(19,'length','Longitud','text',NULL,'decimal',NULL,22,0,0,0,0,0,1,0,0,0,NULL,0,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(20,'width','Ancho','text',NULL,'decimal',NULL,23,0,0,0,0,0,1,0,0,0,NULL,0,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(22,'weight','Peso','text',NULL,'decimal',NULL,25,1,0,0,0,0,0,0,0,0,NULL,0,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(23,'color','Color','select',NULL,NULL,NULL,26,0,0,1,0,1,1,0,0,0,NULL,0,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(25,'brand','Marca','select',NULL,NULL,NULL,28,0,0,1,0,0,1,1,0,0,NULL,0,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(26,'guest_checkout','Compra de Invitado','boolean',NULL,NULL,NULL,8,1,0,0,0,0,0,0,0,0,NULL,0,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(27,'product_number','Número de Producto','text',NULL,NULL,NULL,2,0,1,0,0,0,0,0,0,0,NULL,0,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(28,'manage_stock','Gestionar Stock','boolean',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,1,1,0,'2024-11-02 12:48:20','2024-11-02 12:48:20');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `items_count` int DEFAULT NULL,
  `items_qty` decimal(12,4) DEFAULT NULL,
  `exchange_rate` decimal(12,4) DEFAULT NULL,
  `global_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `tax_total` decimal(12,4) DEFAULT '0.0000',
  `base_tax_total` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `checkout_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_customer_id_foreign` (`customer_id`),
  KEY `cart_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item_inventories`
--

DROP TABLE IF EXISTS `cart_item_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int unsigned NOT NULL DEFAULT '0',
  `inventory_source_id` int unsigned DEFAULT NULL,
  `cart_item_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item_inventories`
--

LOCK TABLES `cart_item_inventories` WRITE;
/*!40000 ALTER TABLE `cart_item_inventories` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_item_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL DEFAULT '0',
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `custom_price` decimal(12,4) DEFAULT NULL,
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `applied_tax_rate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `cart_id` int unsigned NOT NULL,
  `tax_category_id` int unsigned DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_parent_id_foreign` (`parent_id`),
  KEY `cart_items_product_id_foreign` (`product_id`),
  KEY `cart_items_cart_id_foreign` (`cart_id`),
  KEY `cart_items_tax_category_id_foreign` (`tax_category_id`),
  CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `cart_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_payment`
--

DROP TABLE IF EXISTS `cart_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_payment_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_payment_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_payment`
--

LOCK TABLES `cart_payment` WRITE;
/*!40000 ALTER TABLE `cart_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_channels`
--

DROP TABLE IF EXISTS `cart_rule_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_channels` (
  `cart_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`channel_id`),
  KEY `cart_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_rule_channels_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_channels`
--

LOCK TABLES `cart_rule_channels` WRITE;
/*!40000 ALTER TABLE `cart_rule_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_coupon_usage`
--

DROP TABLE IF EXISTS `cart_rule_coupon_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_coupon_usage` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `times_used` int NOT NULL DEFAULT '0',
  `cart_rule_coupon_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` (`cart_rule_coupon_id`),
  KEY `cart_rule_coupon_usage_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` FOREIGN KEY (`cart_rule_coupon_id`) REFERENCES `cart_rule_coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_coupon_usage_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_coupon_usage`
--

LOCK TABLES `cart_rule_coupon_usage` WRITE;
/*!40000 ALTER TABLE `cart_rule_coupon_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_coupon_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_coupons`
--

DROP TABLE IF EXISTS `cart_rule_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_coupons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usage_limit` int unsigned NOT NULL DEFAULT '0',
  `usage_per_customer` int unsigned NOT NULL DEFAULT '0',
  `times_used` int unsigned NOT NULL DEFAULT '0',
  `type` int unsigned NOT NULL DEFAULT '0',
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `expired_at` date DEFAULT NULL,
  `cart_rule_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupons_cart_rule_id_foreign` (`cart_rule_id`),
  CONSTRAINT `cart_rule_coupons_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_coupons`
--

LOCK TABLES `cart_rule_coupons` WRITE;
/*!40000 ALTER TABLE `cart_rule_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_customer_groups`
--

DROP TABLE IF EXISTS `cart_rule_customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_customer_groups` (
  `cart_rule_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`customer_group_id`),
  KEY `cart_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `cart_rule_customer_groups_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_customer_groups`
--

LOCK TABLES `cart_rule_customer_groups` WRITE;
/*!40000 ALTER TABLE `cart_rule_customer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_customers`
--

DROP TABLE IF EXISTS `cart_rule_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `times_used` bigint unsigned NOT NULL DEFAULT '0',
  `customer_id` int unsigned NOT NULL,
  `cart_rule_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_customers_cart_rule_id_foreign` (`cart_rule_id`),
  KEY `cart_rule_customers_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_customers_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_customers`
--

LOCK TABLES `cart_rule_customers` WRITE;
/*!40000 ALTER TABLE `cart_rule_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_translations`
--

DROP TABLE IF EXISTS `cart_rule_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `cart_rule_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_rule_translations_cart_rule_id_locale_unique` (`cart_rule_id`,`locale`),
  CONSTRAINT `cart_rule_translations_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_translations`
--

LOCK TABLES `cart_rule_translations` WRITE;
/*!40000 ALTER TABLE `cart_rule_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rules`
--

DROP TABLE IF EXISTS `cart_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `coupon_type` int NOT NULL DEFAULT '1',
  `use_auto_generation` tinyint(1) NOT NULL DEFAULT '0',
  `usage_per_customer` int NOT NULL DEFAULT '0',
  `uses_per_coupon` int NOT NULL DEFAULT '0',
  `times_used` int unsigned NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `uses_attribute_conditions` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_quantity` int NOT NULL DEFAULT '1',
  `discount_step` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `apply_to_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rules`
--

LOCK TABLES `cart_rules` WRITE;
/*!40000 ALTER TABLE `cart_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_shipping_rates`
--

DROP TABLE IF EXISTS `cart_shipping_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_shipping_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `carrier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT '0',
  `base_price` double DEFAULT '0',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_percent` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `applied_tax_rate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_calculate_tax` tinyint(1) NOT NULL DEFAULT '1',
  `cart_address_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_shipping_rates_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_shipping_rates_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_shipping_rates`
--

LOCK TABLES `cart_shipping_rates` WRITE;
/*!40000 ALTER TABLE `cart_shipping_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_shipping_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_channels`
--

DROP TABLE IF EXISTS `catalog_rule_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rule_channels` (
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`channel_id`),
  KEY `catalog_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_channels_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_channels`
--

LOCK TABLES `catalog_rule_channels` WRITE;
/*!40000 ALTER TABLE `catalog_rule_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_customer_groups`
--

DROP TABLE IF EXISTS `catalog_rule_customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rule_customer_groups` (
  `catalog_rule_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`customer_group_id`),
  KEY `catalog_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `catalog_rule_customer_groups_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_customer_groups`
--

LOCK TABLES `catalog_rule_customer_groups` WRITE;
/*!40000 ALTER TABLE `catalog_rule_customer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_product_prices`
--

DROP TABLE IF EXISTS `catalog_rule_product_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rule_product_prices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `rule_date` date NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_product_prices_product_id_foreign` (`product_id`),
  KEY `catalog_rule_product_prices_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_product_prices_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_product_prices_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_product_prices_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_product_prices`
--

LOCK TABLES `catalog_rule_product_prices` WRITE;
/*!40000 ALTER TABLE `catalog_rule_product_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_product_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_products`
--

DROP TABLE IF EXISTS `catalog_rule_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rule_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_products_product_id_foreign` (`product_id`),
  KEY `catalog_rule_products_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_products_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_products_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_products_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_products`
--

LOCK TABLES `catalog_rule_products` WRITE;
/*!40000 ALTER TABLE `catalog_rule_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rules`
--

DROP TABLE IF EXISTS `catalog_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` date DEFAULT NULL,
  `ends_till` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rules`
--

LOCK TABLES `catalog_rules` WRITE;
/*!40000 ALTER TABLE `catalog_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `position` int NOT NULL DEFAULT '0',
  `logo_path` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `display_mode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'products_and_description',
  `_lft` int unsigned NOT NULL DEFAULT '0',
  `_rgt` int unsigned NOT NULL DEFAULT '0',
  `parent_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `banner_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,1,NULL,1,'products_and_description',1,24,NULL,NULL,NULL,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(2,1,'category/2/BwV375UE2OWqBrxwVNlggXDX5vKVZuS0OqHyZaeK.webp',1,'products_and_description',14,19,1,NULL,NULL,'2024-11-02 15:27:42','2024-11-02 19:01:08'),(3,2,'category/3/8WZN2rWnJqv3zHnulk6JGErHpSZ66BMOhc2AU6xT.webp',1,'products_and_description',15,16,2,NULL,NULL,'2024-11-02 15:36:08','2024-11-02 19:01:08'),(4,3,NULL,1,'products_and_description',17,18,2,NULL,NULL,'2024-11-02 16:21:26','2024-11-02 19:01:08'),(5,2,NULL,1,'products_and_description',20,21,1,NULL,NULL,'2024-11-02 19:14:42','2024-11-02 19:14:42'),(6,2,NULL,1,'products_and_description',22,23,1,NULL,NULL,'2024-11-12 23:45:52','2024-11-12 23:49:16');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_filterable_attributes`
--

DROP TABLE IF EXISTS `category_filterable_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_filterable_attributes` (
  `category_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  KEY `category_filterable_attributes_category_id_foreign` (`category_id`),
  KEY `category_filterable_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `category_filterable_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_filterable_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_filterable_attributes`
--

LOCK TABLES `category_filterable_attributes` WRITE;
/*!40000 ALTER TABLE `category_filterable_attributes` DISABLE KEYS */;
INSERT INTO `category_filterable_attributes` VALUES (2,11),(2,25),(3,11),(3,25),(4,11),(4,25),(5,11),(5,25),(6,11);
/*!40000 ALTER TABLE `category_filterable_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_translations`
--

DROP TABLE IF EXISTS `category_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_path` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `locale_id` int unsigned DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_translations_category_id_slug_locale_unique` (`category_id`,`slug`,`locale`),
  KEY `category_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_translations`
--

LOCK TABLES `category_translations` WRITE;
/*!40000 ALTER TABLE `category_translations` DISABLE KEYS */;
INSERT INTO `category_translations` VALUES (1,1,'Raíz','root','','Descripción de la Categoría Raíz','','','',NULL,'es'),(2,2,'Perfumes','perfumes','','<p>Fragancias</p>','','','',1,'es'),(3,3,'Hombre','hombre','','<p>Perfumes para Hombres</p>','','','',1,'es'),(4,4,'Mujer','mujer','','<p>Perfumes para mujer</p>','','','',1,'es'),(5,5,'Cuidado Personal','cuidado-personal','','<p>Cuidado Personal</p>','','','',1,'es'),(6,6,'Maquillaje','maquillaje','','<p>Maquillaje</p>','','','',1,'es');
/*!40000 ALTER TABLE `category_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_currencies`
--

DROP TABLE IF EXISTS `channel_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_currencies` (
  `channel_id` int unsigned NOT NULL,
  `currency_id` int unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`currency_id`),
  KEY `channel_currencies_currency_id_foreign` (`currency_id`),
  CONSTRAINT `channel_currencies_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_currencies`
--

LOCK TABLES `channel_currencies` WRITE;
/*!40000 ALTER TABLE `channel_currencies` DISABLE KEYS */;
INSERT INTO `channel_currencies` VALUES (1,1);
/*!40000 ALTER TABLE `channel_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_inventory_sources`
--

DROP TABLE IF EXISTS `channel_inventory_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_inventory_sources` (
  `channel_id` int unsigned NOT NULL,
  `inventory_source_id` int unsigned NOT NULL,
  UNIQUE KEY `channel_inventory_sources_channel_id_inventory_source_id_unique` (`channel_id`,`inventory_source_id`),
  KEY `channel_inventory_sources_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `channel_inventory_sources_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_inventory_sources_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_inventory_sources`
--

LOCK TABLES `channel_inventory_sources` WRITE;
/*!40000 ALTER TABLE `channel_inventory_sources` DISABLE KEYS */;
INSERT INTO `channel_inventory_sources` VALUES (1,1);
/*!40000 ALTER TABLE `channel_inventory_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_locales`
--

DROP TABLE IF EXISTS `channel_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_locales` (
  `channel_id` int unsigned NOT NULL,
  `locale_id` int unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`locale_id`),
  KEY `channel_locales_locale_id_foreign` (`locale_id`),
  CONSTRAINT `channel_locales_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_locales`
--

LOCK TABLES `channel_locales` WRITE;
/*!40000 ALTER TABLE `channel_locales` DISABLE KEYS */;
INSERT INTO `channel_locales` VALUES (1,1);
/*!40000 ALTER TABLE `channel_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_translations`
--

DROP TABLE IF EXISTS `channel_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `maintenance_mode_text` text COLLATE utf8mb4_unicode_ci,
  `home_seo` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_translations_channel_id_locale_unique` (`channel_id`,`locale`),
  KEY `channel_translations_locale_index` (`locale`),
  CONSTRAINT `channel_translations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_translations`
--

LOCK TABLES `channel_translations` WRITE;
/*!40000 ALTER TABLE `channel_translations` DISABLE KEYS */;
INSERT INTO `channel_translations` VALUES (1,1,'es','Predeterminado',NULL,NULL,'{\"meta_title\": \"Tienda de Demostración\", \"meta_keywords\": \"Palabras Clave de Meta de la Tienda de Demostración\", \"meta_description\": \"Descripción de Meta de la Tienda de Demostración\"}',NULL,NULL);
/*!40000 ALTER TABLE `channel_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hostname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_seo` json DEFAULT NULL,
  `is_maintenance_on` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_ips` text COLLATE utf8mb4_unicode_ci,
  `root_category_id` int unsigned DEFAULT NULL,
  `default_locale_id` int unsigned NOT NULL,
  `base_currency_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channels_root_category_id_foreign` (`root_category_id`),
  KEY `channels_default_locale_id_foreign` (`default_locale_id`),
  KEY `channels_base_currency_id_foreign` (`base_currency_id`),
  CONSTRAINT `channels_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `channels_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `locales` (`id`),
  CONSTRAINT `channels_root_category_id_foreign` FOREIGN KEY (`root_category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` VALUES (1,'default',NULL,'default','http://localhost',NULL,NULL,NULL,0,NULL,1,1,1,'2024-11-02 12:48:20','2024-11-02 12:48:20');
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_channels`
--

DROP TABLE IF EXISTS `cms_page_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_page_channels` (
  `cms_page_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  UNIQUE KEY `cms_page_channels_cms_page_id_channel_id_unique` (`cms_page_id`,`channel_id`),
  KEY `cms_page_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cms_page_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms_page_channels_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_channels`
--

LOCK TABLES `cms_page_channels` WRITE;
/*!40000 ALTER TABLE `cms_page_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_page_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_translations`
--

DROP TABLE IF EXISTS `cms_page_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_page_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `page_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_content` longtext COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cms_page_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_page_translations_cms_page_id_url_key_locale_unique` (`cms_page_id`,`url_key`,`locale`),
  CONSTRAINT `cms_page_translations_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_translations`
--

LOCK TABLES `cms_page_translations` WRITE;
/*!40000 ALTER TABLE `cms_page_translations` DISABLE KEYS */;
INSERT INTO `cms_page_translations` VALUES (1,'Acerca de Nosotros','about-us','<div class=\"static-container\"><div class=\"mb-5\">Contenido de la Página Acerca de Nosotros</div></div>','about us','','aboutus','es',1),(2,'Política de Retorno','return-policy','<div class=\"static-container\"><div class=\"mb-5\">Contenido de la Página Política de Retorno</div></div>','return policy','','return, policy','es',2),(3,'Política de Devolución','refund-policy','<div class=\"static-container\"><div class=\"mb-5\">Contenido de la Página Política de Devolución</div></div>','Refund policy','','refund, policy','es',3),(4,'Términos y Condiciones','terms-conditions','<div class=\"static-container\"><div class=\"mb-5\">Contenido de la Página Términos y Condiciones</div></div>','Terms & Conditions','','term, conditions','es',4),(5,'Términos de Uso','terms-of-use','<div class=\"static-container\"><div class=\"mb-5\">Contenido de la Página Términos de Uso</div></div>','Terms of use','','term, use','es',5),(6,'Servicio al Cliente','customer-service','<div class=\"static-container\"><div class=\"mb-5\">Contenido de la Página Servicio al Cliente</div></div>','Customer Service','','customer, service','es',7),(7,'Novedades','whats-new','<div class=\"static-container\"><div class=\"mb-5\">Contenido de la Página Novedades</div></div>','What\'s New','','new','es',8),(8,'Política de Pago','payment-policy','<div class=\"static-container\"><div class=\"mb-5\">Contenido de la Página Política de Pago</div></div>','Payment Policy','','payment, policy','es',9),(9,'Política de Envío','shipping-policy','<div class=\"static-container\"><div class=\"mb-5\">Contenido de la Página Política de Envío</div></div>','Shipping Policy','','shipping, policy','es',10),(10,'Política de Privacidad','privacy-policy','<div class=\"static-container\"><div class=\"mb-5\">Contenido de la Página Política de Privacidad</div></div>','Privacy Policy','','privacy, policy','es',11);
/*!40000 ALTER TABLE `cms_page_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pages`
--

DROP TABLE IF EXISTS `cms_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `layout` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pages`
--

LOCK TABLES `cms_pages` WRITE;
/*!40000 ALTER TABLE `cms_pages` DISABLE KEYS */;
INSERT INTO `cms_pages` VALUES (1,NULL,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(2,NULL,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(3,NULL,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(4,NULL,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(5,NULL,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(6,NULL,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(7,NULL,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(8,NULL,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(9,NULL,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(10,NULL,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(11,NULL,'2024-11-02 12:48:20','2024-11-02 12:48:20');
/*!40000 ALTER TABLE `cms_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compare_items`
--

DROP TABLE IF EXISTS `compare_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compare_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `compare_items_product_id_foreign` (`product_id`),
  KEY `compare_items_customer_id_foreign` (`customer_id`),
  CONSTRAINT `compare_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `compare_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compare_items`
--

LOCK TABLES `compare_items` WRITE;
/*!40000 ALTER TABLE `compare_items` DISABLE KEYS */;
INSERT INTO `compare_items` VALUES (1,3,2,'2024-11-02 19:30:22','2024-11-02 19:30:22'),(2,2,2,'2024-11-02 19:30:27','2024-11-02 19:30:27');
/*!40000 ALTER TABLE `compare_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_config`
--

DROP TABLE IF EXISTS `core_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_config`
--

LOCK TABLES `core_config` WRITE;
/*!40000 ALTER TABLE `core_config` DISABLE KEYS */;
INSERT INTO `core_config` VALUES (1,'sales.checkout.shopping_cart.allow_guest_checkout','1',NULL,NULL,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(2,'emails.general.notifications.emails.general.notifications.verification','1',NULL,NULL,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(3,'emails.general.notifications.emails.general.notifications.registration','1',NULL,NULL,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(4,'emails.general.notifications.emails.general.notifications.customer','1',NULL,NULL,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(5,'emails.general.notifications.emails.general.notifications.new_order','1',NULL,NULL,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(6,'emails.general.notifications.emails.general.notifications.new_admin','1',NULL,NULL,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(7,'emails.general.notifications.emails.general.notifications.new_invoice','1',NULL,NULL,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(8,'emails.general.notifications.emails.general.notifications.new_refund','1',NULL,NULL,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(9,'emails.general.notifications.emails.general.notifications.new_shipment','1',NULL,NULL,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(10,'emails.general.notifications.emails.general.notifications.new_inventory_source','1',NULL,NULL,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(11,'emails.general.notifications.emails.general.notifications.cancel_order','1',NULL,NULL,'2024-11-02 12:48:20','2024-11-02 12:48:20'),(12,'customer.settings.social_login.enable_facebook','1','default',NULL,'2024-11-02 12:48:21','2024-11-02 12:48:21'),(13,'customer.settings.social_login.enable_twitter','1','default',NULL,'2024-11-02 12:48:21','2024-11-02 12:48:21'),(14,'customer.settings.social_login.enable_google','1','default',NULL,'2024-11-02 12:48:21','2024-11-02 12:48:21'),(15,'customer.settings.social_login.enable_linkedin','1','default',NULL,'2024-11-02 12:48:21','2024-11-02 12:48:21'),(16,'customer.settings.social_login.enable_github','1','default',NULL,'2024-11-02 12:48:21','2024-11-02 12:48:21'),(17,'catalog.rich_snippets.products.enable','0',NULL,NULL,'2024-11-02 19:08:37','2024-11-02 19:08:37'),(18,'catalog.rich_snippets.products.show_sku','0',NULL,NULL,'2024-11-02 19:08:38','2024-11-02 19:08:38'),(19,'catalog.rich_snippets.products.show_weight','0',NULL,NULL,'2024-11-02 19:08:38','2024-11-02 19:08:38'),(20,'catalog.rich_snippets.products.show_categories','1',NULL,NULL,'2024-11-02 19:08:38','2024-11-02 19:08:38'),(21,'catalog.rich_snippets.products.show_images','0',NULL,NULL,'2024-11-02 19:08:38','2024-11-02 19:08:38'),(22,'catalog.rich_snippets.products.show_reviews','0',NULL,NULL,'2024-11-02 19:08:38','2024-11-02 19:08:38'),(23,'catalog.rich_snippets.products.show_ratings','0',NULL,NULL,'2024-11-02 19:08:38','2024-11-02 19:08:38'),(24,'catalog.rich_snippets.products.show_offers','0',NULL,NULL,'2024-11-02 19:08:38','2024-11-02 19:08:38'),(25,'catalog.rich_snippets.categories.enable','1',NULL,NULL,'2024-11-02 19:08:38','2024-11-02 19:08:38'),(26,'catalog.rich_snippets.categories.show_search_input_field','0',NULL,NULL,'2024-11-02 19:08:38','2024-11-02 19:08:38');
/*!40000 ALTER TABLE `core_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AF','Afghanistan'),(2,'AX','Åland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua & Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AC','Ascension Island'),(15,'AU','Australia'),(16,'AT','Austria'),(17,'AZ','Azerbaijan'),(18,'BS','Bahamas'),(19,'BH','Bahrain'),(20,'BD','Bangladesh'),(21,'BB','Barbados'),(22,'BY','Belarus'),(23,'BE','Belgium'),(24,'BZ','Belize'),(25,'BJ','Benin'),(26,'BM','Bermuda'),(27,'BT','Bhutan'),(28,'BO','Bolivia'),(29,'BA','Bosnia & Herzegovina'),(30,'BW','Botswana'),(31,'BR','Brazil'),(32,'IO','British Indian Ocean Territory'),(33,'VG','British Virgin Islands'),(34,'BN','Brunei'),(35,'BG','Bulgaria'),(36,'BF','Burkina Faso'),(37,'BI','Burundi'),(38,'KH','Cambodia'),(39,'CM','Cameroon'),(40,'CA','Canada'),(41,'IC','Canary Islands'),(42,'CV','Cape Verde'),(43,'BQ','Caribbean Netherlands'),(44,'KY','Cayman Islands'),(45,'CF','Central African Republic'),(46,'EA','Ceuta & Melilla'),(47,'TD','Chad'),(48,'CL','Chile'),(49,'CN','China'),(50,'CX','Christmas Island'),(51,'CC','Cocos (Keeling) Islands'),(52,'CO','Colombia'),(53,'KM','Comoros'),(54,'CG','Congo - Brazzaville'),(55,'CD','Congo - Kinshasa'),(56,'CK','Cook Islands'),(57,'CR','Costa Rica'),(58,'CI','Côte d’Ivoire'),(59,'HR','Croatia'),(60,'CU','Cuba'),(61,'CW','Curaçao'),(62,'CY','Cyprus'),(63,'CZ','Czechia'),(64,'DK','Denmark'),(65,'DG','Diego Garcia'),(66,'DJ','Djibouti'),(67,'DM','Dominica'),(68,'DO','Dominican Republic'),(69,'EC','Ecuador'),(70,'EG','Egypt'),(71,'SV','El Salvador'),(72,'GQ','Equatorial Guinea'),(73,'ER','Eritrea'),(74,'EE','Estonia'),(75,'ET','Ethiopia'),(76,'EZ','Eurozone'),(77,'FK','Falkland Islands'),(78,'FO','Faroe Islands'),(79,'FJ','Fiji'),(80,'FI','Finland'),(81,'FR','France'),(82,'GF','French Guiana'),(83,'PF','French Polynesia'),(84,'TF','French Southern Territories'),(85,'GA','Gabon'),(86,'GM','Gambia'),(87,'GE','Georgia'),(88,'DE','Germany'),(89,'GH','Ghana'),(90,'GI','Gibraltar'),(91,'GR','Greece'),(92,'GL','Greenland'),(93,'GD','Grenada'),(94,'GP','Guadeloupe'),(95,'GU','Guam'),(96,'GT','Guatemala'),(97,'GG','Guernsey'),(98,'GN','Guinea'),(99,'GW','Guinea-Bissau'),(100,'GY','Guyana'),(101,'HT','Haiti'),(102,'HN','Honduras'),(103,'HK','Hong Kong SAR China'),(104,'HU','Hungary'),(105,'IS','Iceland'),(106,'IN','India'),(107,'ID','Indonesia'),(108,'IR','Iran'),(109,'IQ','Iraq'),(110,'IE','Ireland'),(111,'IM','Isle of Man'),(112,'IL','Israel'),(113,'IT','Italy'),(114,'JM','Jamaica'),(115,'JP','Japan'),(116,'JE','Jersey'),(117,'JO','Jordan'),(118,'KZ','Kazakhstan'),(119,'KE','Kenya'),(120,'KI','Kiribati'),(121,'XK','Kosovo'),(122,'KW','Kuwait'),(123,'KG','Kyrgyzstan'),(124,'LA','Laos'),(125,'LV','Latvia'),(126,'LB','Lebanon'),(127,'LS','Lesotho'),(128,'LR','Liberia'),(129,'LY','Libya'),(130,'LI','Liechtenstein'),(131,'LT','Lithuania'),(132,'LU','Luxembourg'),(133,'MO','Macau SAR China'),(134,'MK','Macedonia'),(135,'MG','Madagascar'),(136,'MW','Malawi'),(137,'MY','Malaysia'),(138,'MV','Maldives'),(139,'ML','Mali'),(140,'MT','Malta'),(141,'MH','Marshall Islands'),(142,'MQ','Martinique'),(143,'MR','Mauritania'),(144,'MU','Mauritius'),(145,'YT','Mayotte'),(146,'MX','Mexico'),(147,'FM','Micronesia'),(148,'MD','Moldova'),(149,'MC','Monaco'),(150,'MN','Mongolia'),(151,'ME','Montenegro'),(152,'MS','Montserrat'),(153,'MA','Morocco'),(154,'MZ','Mozambique'),(155,'MM','Myanmar (Burma)'),(156,'NA','Namibia'),(157,'NR','Nauru'),(158,'NP','Nepal'),(159,'NL','Netherlands'),(160,'NC','New Caledonia'),(161,'NZ','New Zealand'),(162,'NI','Nicaragua'),(163,'NE','Niger'),(164,'NG','Nigeria'),(165,'NU','Niue'),(166,'NF','Norfolk Island'),(167,'KP','North Korea'),(168,'MP','Northern Mariana Islands'),(169,'NO','Norway'),(170,'OM','Oman'),(171,'PK','Pakistan'),(172,'PW','Palau'),(173,'PS','Palestinian Territories'),(174,'PA','Panama'),(175,'PG','Papua New Guinea'),(176,'PY','Paraguay'),(177,'PE','Peru'),(178,'PH','Philippines'),(179,'PN','Pitcairn Islands'),(180,'PL','Poland'),(181,'PT','Portugal'),(182,'PR','Puerto Rico'),(183,'QA','Qatar'),(184,'RE','Réunion'),(185,'RO','Romania'),(186,'RU','Russia'),(187,'RW','Rwanda'),(188,'WS','Samoa'),(189,'SM','San Marino'),(190,'ST','São Tomé & Príncipe'),(191,'SA','Saudi Arabia'),(192,'SN','Senegal'),(193,'RS','Serbia'),(194,'SC','Seychelles'),(195,'SL','Sierra Leone'),(196,'SG','Singapore'),(197,'SX','Sint Maarten'),(198,'SK','Slovakia'),(199,'SI','Slovenia'),(200,'SB','Solomon Islands'),(201,'SO','Somalia'),(202,'ZA','South Africa'),(203,'GS','South Georgia & South Sandwich Islands'),(204,'KR','South Korea'),(205,'SS','South Sudan'),(206,'ES','Spain'),(207,'LK','Sri Lanka'),(208,'BL','St. Barthélemy'),(209,'SH','St. Helena'),(210,'KN','St. Kitts & Nevis'),(211,'LC','St. Lucia'),(212,'MF','St. Martin'),(213,'PM','St. Pierre & Miquelon'),(214,'VC','St. Vincent & Grenadines'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard & Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TL','Timor-Leste'),(227,'TG','Togo'),(228,'TK','Tokelau'),(229,'TO','Tonga'),(230,'TT','Trinidad & Tobago'),(231,'TA','Tristan da Cunha'),(232,'TN','Tunisia'),(233,'TR','Turkey'),(234,'TM','Turkmenistan'),(235,'TC','Turks & Caicos Islands'),(236,'TV','Tuvalu'),(237,'UM','U.S. Outlying Islands'),(238,'VI','U.S. Virgin Islands'),(239,'UG','Uganda'),(240,'UA','Ukraine'),(241,'AE','United Arab Emirates'),(242,'GB','United Kingdom'),(243,'UN','United Nations'),(244,'US','United States'),(245,'UY','Uruguay'),(246,'UZ','Uzbekistan'),(247,'VU','Vanuatu'),(248,'VA','Vatican City'),(249,'VE','Venezuela'),(250,'VN','Vietnam'),(251,'WF','Wallis & Futuna'),(252,'EH','Western Sahara'),(253,'YE','Yemen'),(254,'ZM','Zambia'),(255,'ZW','Zimbabwe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_state_translations`
--

DROP TABLE IF EXISTS `country_state_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_state_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_state_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_name` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `country_state_translations_country_state_id_foreign` (`country_state_id`),
  CONSTRAINT `country_state_translations_country_state_id_foreign` FOREIGN KEY (`country_state_id`) REFERENCES `country_states` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_state_translations`
--

LOCK TABLES `country_state_translations` WRITE;
/*!40000 ALTER TABLE `country_state_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_state_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_states`
--

DROP TABLE IF EXISTS `country_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_states` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int unsigned DEFAULT NULL,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_states_country_id_foreign` (`country_id`),
  CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_states`
--

LOCK TABLES `country_states` WRITE;
/*!40000 ALTER TABLE `country_states` DISABLE KEYS */;
INSERT INTO `country_states` VALUES (1,244,'US','AL','Alabama'),(2,244,'US','AK','Alaska'),(3,244,'US','AS','American Samoa'),(4,244,'US','AZ','Arizona'),(5,244,'US','AR','Arkansas'),(6,244,'US','AE','Armed Forces Africa'),(7,244,'US','AA','Armed Forces Americas'),(8,244,'US','AE','Armed Forces Canada'),(9,244,'US','AE','Armed Forces Europe'),(10,244,'US','AE','Armed Forces Middle East'),(11,244,'US','AP','Armed Forces Pacific'),(12,244,'US','CA','California'),(13,244,'US','CO','Colorado'),(14,244,'US','CT','Connecticut'),(15,244,'US','DE','Delaware'),(16,244,'US','DC','District of Columbia'),(17,244,'US','FM','Federated States Of Micronesia'),(18,244,'US','FL','Florida'),(19,244,'US','GA','Georgia'),(20,244,'US','GU','Guam'),(21,244,'US','HI','Hawaii'),(22,244,'US','ID','Idaho'),(23,244,'US','IL','Illinois'),(24,244,'US','IN','Indiana'),(25,244,'US','IA','Iowa'),(26,244,'US','KS','Kansas'),(27,244,'US','KY','Kentucky'),(28,244,'US','LA','Louisiana'),(29,244,'US','ME','Maine'),(30,244,'US','MH','Marshall Islands'),(31,244,'US','MD','Maryland'),(32,244,'US','MA','Massachusetts'),(33,244,'US','MI','Michigan'),(34,244,'US','MN','Minnesota'),(35,244,'US','MS','Mississippi'),(36,244,'US','MO','Missouri'),(37,244,'US','MT','Montana'),(38,244,'US','NE','Nebraska'),(39,244,'US','NV','Nevada'),(40,244,'US','NH','New Hampshire'),(41,244,'US','NJ','New Jersey'),(42,244,'US','NM','New Mexico'),(43,244,'US','NY','New York'),(44,244,'US','NC','North Carolina'),(45,244,'US','ND','North Dakota'),(46,244,'US','MP','Northern Mariana Islands'),(47,244,'US','OH','Ohio'),(48,244,'US','OK','Oklahoma'),(49,244,'US','OR','Oregon'),(50,244,'US','PW','Palau'),(51,244,'US','PA','Pennsylvania'),(52,244,'US','PR','Puerto Rico'),(53,244,'US','RI','Rhode Island'),(54,244,'US','SC','South Carolina'),(55,244,'US','SD','South Dakota'),(56,244,'US','TN','Tennessee'),(57,244,'US','TX','Texas'),(58,244,'US','UT','Utah'),(59,244,'US','VT','Vermont'),(60,244,'US','VI','Virgin Islands'),(61,244,'US','VA','Virginia'),(62,244,'US','WA','Washington'),(63,244,'US','WV','West Virginia'),(64,244,'US','WI','Wisconsin'),(65,244,'US','WY','Wyoming'),(66,40,'CA','AB','Alberta'),(67,40,'CA','BC','British Columbia'),(68,40,'CA','MB','Manitoba'),(69,40,'CA','NL','Newfoundland and Labrador'),(70,40,'CA','NB','New Brunswick'),(71,40,'CA','NS','Nova Scotia'),(72,40,'CA','NT','Northwest Territories'),(73,40,'CA','NU','Nunavut'),(74,40,'CA','ON','Ontario'),(75,40,'CA','PE','Prince Edward Island'),(76,40,'CA','QC','Quebec'),(77,40,'CA','SK','Saskatchewan'),(78,40,'CA','YT','Yukon Territory'),(79,88,'DE','NDS','Niedersachsen'),(80,88,'DE','BAW','Baden-Württemberg'),(81,88,'DE','BAY','Bayern'),(82,88,'DE','BER','Berlin'),(83,88,'DE','BRG','Brandenburg'),(84,88,'DE','BRE','Bremen'),(85,88,'DE','HAM','Hamburg'),(86,88,'DE','HES','Hessen'),(87,88,'DE','MEC','Mecklenburg-Vorpommern'),(88,88,'DE','NRW','Nordrhein-Westfalen'),(89,88,'DE','RHE','Rheinland-Pfalz'),(90,88,'DE','SAR','Saarland'),(91,88,'DE','SAS','Sachsen'),(92,88,'DE','SAC','Sachsen-Anhalt'),(93,88,'DE','SCN','Schleswig-Holstein'),(94,88,'DE','THE','Thüringen'),(95,16,'AT','WI','Wien'),(96,16,'AT','NO','Niederösterreich'),(97,16,'AT','OO','Oberösterreich'),(98,16,'AT','SB','Salzburg'),(99,16,'AT','KN','Kärnten'),(100,16,'AT','ST','Steiermark'),(101,16,'AT','TI','Tirol'),(102,16,'AT','BL','Burgenland'),(103,16,'AT','VB','Vorarlberg'),(104,220,'CH','AG','Aargau'),(105,220,'CH','AI','Appenzell Innerrhoden'),(106,220,'CH','AR','Appenzell Ausserrhoden'),(107,220,'CH','BE','Bern'),(108,220,'CH','BL','Basel-Landschaft'),(109,220,'CH','BS','Basel-Stadt'),(110,220,'CH','FR','Freiburg'),(111,220,'CH','GE','Genf'),(112,220,'CH','GL','Glarus'),(113,220,'CH','GR','Graubünden'),(114,220,'CH','JU','Jura'),(115,220,'CH','LU','Luzern'),(116,220,'CH','NE','Neuenburg'),(117,220,'CH','NW','Nidwalden'),(118,220,'CH','OW','Obwalden'),(119,220,'CH','SG','St. Gallen'),(120,220,'CH','SH','Schaffhausen'),(121,220,'CH','SO','Solothurn'),(122,220,'CH','SZ','Schwyz'),(123,220,'CH','TG','Thurgau'),(124,220,'CH','TI','Tessin'),(125,220,'CH','UR','Uri'),(126,220,'CH','VD','Waadt'),(127,220,'CH','VS','Wallis'),(128,220,'CH','ZG','Zug'),(129,220,'CH','ZH','Zürich'),(130,206,'ES','A Coruсa','A Coruña'),(131,206,'ES','Alava','Alava'),(132,206,'ES','Albacete','Albacete'),(133,206,'ES','Alicante','Alicante'),(134,206,'ES','Almeria','Almeria'),(135,206,'ES','Asturias','Asturias'),(136,206,'ES','Avila','Avila'),(137,206,'ES','Badajoz','Badajoz'),(138,206,'ES','Baleares','Baleares'),(139,206,'ES','Barcelona','Barcelona'),(140,206,'ES','Burgos','Burgos'),(141,206,'ES','Caceres','Caceres'),(142,206,'ES','Cadiz','Cadiz'),(143,206,'ES','Cantabria','Cantabria'),(144,206,'ES','Castellon','Castellon'),(145,206,'ES','Ceuta','Ceuta'),(146,206,'ES','Ciudad Real','Ciudad Real'),(147,206,'ES','Cordoba','Cordoba'),(148,206,'ES','Cuenca','Cuenca'),(149,206,'ES','Girona','Girona'),(150,206,'ES','Granada','Granada'),(151,206,'ES','Guadalajara','Guadalajara'),(152,206,'ES','Guipuzcoa','Guipuzcoa'),(153,206,'ES','Huelva','Huelva'),(154,206,'ES','Huesca','Huesca'),(155,206,'ES','Jaen','Jaen'),(156,206,'ES','La Rioja','La Rioja'),(157,206,'ES','Las Palmas','Las Palmas'),(158,206,'ES','Leon','Leon'),(159,206,'ES','Lleida','Lleida'),(160,206,'ES','Lugo','Lugo'),(161,206,'ES','Madrid','Madrid'),(162,206,'ES','Malaga','Malaga'),(163,206,'ES','Melilla','Melilla'),(164,206,'ES','Murcia','Murcia'),(165,206,'ES','Navarra','Navarra'),(166,206,'ES','Ourense','Ourense'),(167,206,'ES','Palencia','Palencia'),(168,206,'ES','Pontevedra','Pontevedra'),(169,206,'ES','Salamanca','Salamanca'),(170,206,'ES','Santa Cruz de Tenerife','Santa Cruz de Tenerife'),(171,206,'ES','Segovia','Segovia'),(172,206,'ES','Sevilla','Sevilla'),(173,206,'ES','Soria','Soria'),(174,206,'ES','Tarragona','Tarragona'),(175,206,'ES','Teruel','Teruel'),(176,206,'ES','Toledo','Toledo'),(177,206,'ES','Valencia','Valencia'),(178,206,'ES','Valladolid','Valladolid'),(179,206,'ES','Vizcaya','Vizcaya'),(180,206,'ES','Zamora','Zamora'),(181,206,'ES','Zaragoza','Zaragoza'),(182,81,'FR','1','Ain'),(183,81,'FR','2','Aisne'),(184,81,'FR','3','Allier'),(185,81,'FR','4','Alpes-de-Haute-Provence'),(186,81,'FR','5','Hautes-Alpes'),(187,81,'FR','6','Alpes-Maritimes'),(188,81,'FR','7','Ardèche'),(189,81,'FR','8','Ardennes'),(190,81,'FR','9','Ariège'),(191,81,'FR','10','Aube'),(192,81,'FR','11','Aude'),(193,81,'FR','12','Aveyron'),(194,81,'FR','13','Bouches-du-Rhône'),(195,81,'FR','14','Calvados'),(196,81,'FR','15','Cantal'),(197,81,'FR','16','Charente'),(198,81,'FR','17','Charente-Maritime'),(199,81,'FR','18','Cher'),(200,81,'FR','19','Corrèze'),(201,81,'FR','2A','Corse-du-Sud'),(202,81,'FR','2B','Haute-Corse'),(203,81,'FR','21','Côte-d\'Or'),(204,81,'FR','22','Côtes-d\'Armor'),(205,81,'FR','23','Creuse'),(206,81,'FR','24','Dordogne'),(207,81,'FR','25','Doubs'),(208,81,'FR','26','Drôme'),(209,81,'FR','27','Eure'),(210,81,'FR','28','Eure-et-Loir'),(211,81,'FR','29','Finistère'),(212,81,'FR','30','Gard'),(213,81,'FR','31','Haute-Garonne'),(214,81,'FR','32','Gers'),(215,81,'FR','33','Gironde'),(216,81,'FR','34','Hérault'),(217,81,'FR','35','Ille-et-Vilaine'),(218,81,'FR','36','Indre'),(219,81,'FR','37','Indre-et-Loire'),(220,81,'FR','38','Isère'),(221,81,'FR','39','Jura'),(222,81,'FR','40','Landes'),(223,81,'FR','41','Loir-et-Cher'),(224,81,'FR','42','Loire'),(225,81,'FR','43','Haute-Loire'),(226,81,'FR','44','Loire-Atlantique'),(227,81,'FR','45','Loiret'),(228,81,'FR','46','Lot'),(229,81,'FR','47','Lot-et-Garonne'),(230,81,'FR','48','Lozère'),(231,81,'FR','49','Maine-et-Loire'),(232,81,'FR','50','Manche'),(233,81,'FR','51','Marne'),(234,81,'FR','52','Haute-Marne'),(235,81,'FR','53','Mayenne'),(236,81,'FR','54','Meurthe-et-Moselle'),(237,81,'FR','55','Meuse'),(238,81,'FR','56','Morbihan'),(239,81,'FR','57','Moselle'),(240,81,'FR','58','Nièvre'),(241,81,'FR','59','Nord'),(242,81,'FR','60','Oise'),(243,81,'FR','61','Orne'),(244,81,'FR','62','Pas-de-Calais'),(245,81,'FR','63','Puy-de-Dôme'),(246,81,'FR','64','Pyrénées-Atlantiques'),(247,81,'FR','65','Hautes-Pyrénées'),(248,81,'FR','66','Pyrénées-Orientales'),(249,81,'FR','67','Bas-Rhin'),(250,81,'FR','68','Haut-Rhin'),(251,81,'FR','69','Rhône'),(252,81,'FR','70','Haute-Saône'),(253,81,'FR','71','Saône-et-Loire'),(254,81,'FR','72','Sarthe'),(255,81,'FR','73','Savoie'),(256,81,'FR','74','Haute-Savoie'),(257,81,'FR','75','Paris'),(258,81,'FR','76','Seine-Maritime'),(259,81,'FR','77','Seine-et-Marne'),(260,81,'FR','78','Yvelines'),(261,81,'FR','79','Deux-Sèvres'),(262,81,'FR','80','Somme'),(263,81,'FR','81','Tarn'),(264,81,'FR','82','Tarn-et-Garonne'),(265,81,'FR','83','Var'),(266,81,'FR','84','Vaucluse'),(267,81,'FR','85','Vendée'),(268,81,'FR','86','Vienne'),(269,81,'FR','87','Haute-Vienne'),(270,81,'FR','88','Vosges'),(271,81,'FR','89','Yonne'),(272,81,'FR','90','Territoire-de-Belfort'),(273,81,'FR','91','Essonne'),(274,81,'FR','92','Hauts-de-Seine'),(275,81,'FR','93','Seine-Saint-Denis'),(276,81,'FR','94','Val-de-Marne'),(277,81,'FR','95','Val-d\'Oise'),(278,185,'RO','AB','Alba'),(279,185,'RO','AR','Arad'),(280,185,'RO','AG','Argeş'),(281,185,'RO','BC','Bacău'),(282,185,'RO','BH','Bihor'),(283,185,'RO','BN','Bistriţa-Năsăud'),(284,185,'RO','BT','Botoşani'),(285,185,'RO','BV','Braşov'),(286,185,'RO','BR','Brăila'),(287,185,'RO','B','Bucureşti'),(288,185,'RO','BZ','Buzău'),(289,185,'RO','CS','Caraş-Severin'),(290,185,'RO','CL','Călăraşi'),(291,185,'RO','CJ','Cluj'),(292,185,'RO','CT','Constanţa'),(293,185,'RO','CV','Covasna'),(294,185,'RO','DB','Dâmboviţa'),(295,185,'RO','DJ','Dolj'),(296,185,'RO','GL','Galaţi'),(297,185,'RO','GR','Giurgiu'),(298,185,'RO','GJ','Gorj'),(299,185,'RO','HR','Harghita'),(300,185,'RO','HD','Hunedoara'),(301,185,'RO','IL','Ialomiţa'),(302,185,'RO','IS','Iaşi'),(303,185,'RO','IF','Ilfov'),(304,185,'RO','MM','Maramureş'),(305,185,'RO','MH','Mehedinţi'),(306,185,'RO','MS','Mureş'),(307,185,'RO','NT','Neamţ'),(308,185,'RO','OT','Olt'),(309,185,'RO','PH','Prahova'),(310,185,'RO','SM','Satu-Mare'),(311,185,'RO','SJ','Sălaj'),(312,185,'RO','SB','Sibiu'),(313,185,'RO','SV','Suceava'),(314,185,'RO','TR','Teleorman'),(315,185,'RO','TM','Timiş'),(316,185,'RO','TL','Tulcea'),(317,185,'RO','VS','Vaslui'),(318,185,'RO','VL','Vâlcea'),(319,185,'RO','VN','Vrancea'),(320,80,'FI','Lappi','Lappi'),(321,80,'FI','Pohjois-Pohjanmaa','Pohjois-Pohjanmaa'),(322,80,'FI','Kainuu','Kainuu'),(323,80,'FI','Pohjois-Karjala','Pohjois-Karjala'),(324,80,'FI','Pohjois-Savo','Pohjois-Savo'),(325,80,'FI','Etelä-Savo','Etelä-Savo'),(326,80,'FI','Etelä-Pohjanmaa','Etelä-Pohjanmaa'),(327,80,'FI','Pohjanmaa','Pohjanmaa'),(328,80,'FI','Pirkanmaa','Pirkanmaa'),(329,80,'FI','Satakunta','Satakunta'),(330,80,'FI','Keski-Pohjanmaa','Keski-Pohjanmaa'),(331,80,'FI','Keski-Suomi','Keski-Suomi'),(332,80,'FI','Varsinais-Suomi','Varsinais-Suomi'),(333,80,'FI','Etelä-Karjala','Etelä-Karjala'),(334,80,'FI','Päijät-Häme','Päijät-Häme'),(335,80,'FI','Kanta-Häme','Kanta-Häme'),(336,80,'FI','Uusimaa','Uusimaa'),(337,80,'FI','Itä-Uusimaa','Itä-Uusimaa'),(338,80,'FI','Kymenlaakso','Kymenlaakso'),(339,80,'FI','Ahvenanmaa','Ahvenanmaa'),(340,74,'EE','EE-37','Harjumaa'),(341,74,'EE','EE-39','Hiiumaa'),(342,74,'EE','EE-44','Ida-Virumaa'),(343,74,'EE','EE-49','Jõgevamaa'),(344,74,'EE','EE-51','Järvamaa'),(345,74,'EE','EE-57','Läänemaa'),(346,74,'EE','EE-59','Lääne-Virumaa'),(347,74,'EE','EE-65','Põlvamaa'),(348,74,'EE','EE-67','Pärnumaa'),(349,74,'EE','EE-70','Raplamaa'),(350,74,'EE','EE-74','Saaremaa'),(351,74,'EE','EE-78','Tartumaa'),(352,74,'EE','EE-82','Valgamaa'),(353,74,'EE','EE-84','Viljandimaa'),(354,74,'EE','EE-86','Võrumaa'),(355,125,'LV','LV-DGV','Daugavpils'),(356,125,'LV','LV-JEL','Jelgava'),(357,125,'LV','Jēkabpils','Jēkabpils'),(358,125,'LV','LV-JUR','Jūrmala'),(359,125,'LV','LV-LPX','Liepāja'),(360,125,'LV','LV-LE','Liepājas novads'),(361,125,'LV','LV-REZ','Rēzekne'),(362,125,'LV','LV-RIX','Rīga'),(363,125,'LV','LV-RI','Rīgas novads'),(364,125,'LV','Valmiera','Valmiera'),(365,125,'LV','LV-VEN','Ventspils'),(366,125,'LV','Aglonas novads','Aglonas novads'),(367,125,'LV','LV-AI','Aizkraukles novads'),(368,125,'LV','Aizputes novads','Aizputes novads'),(369,125,'LV','Aknīstes novads','Aknīstes novads'),(370,125,'LV','Alojas novads','Alojas novads'),(371,125,'LV','Alsungas novads','Alsungas novads'),(372,125,'LV','LV-AL','Alūksnes novads'),(373,125,'LV','Amatas novads','Amatas novads'),(374,125,'LV','Apes novads','Apes novads'),(375,125,'LV','Auces novads','Auces novads'),(376,125,'LV','Babītes novads','Babītes novads'),(377,125,'LV','Baldones novads','Baldones novads'),(378,125,'LV','Baltinavas novads','Baltinavas novads'),(379,125,'LV','LV-BL','Balvu novads'),(380,125,'LV','LV-BU','Bauskas novads'),(381,125,'LV','Beverīnas novads','Beverīnas novads'),(382,125,'LV','Brocēnu novads','Brocēnu novads'),(383,125,'LV','Burtnieku novads','Burtnieku novads'),(384,125,'LV','Carnikavas novads','Carnikavas novads'),(385,125,'LV','Cesvaines novads','Cesvaines novads'),(386,125,'LV','Ciblas novads','Ciblas novads'),(387,125,'LV','LV-CE','Cēsu novads'),(388,125,'LV','Dagdas novads','Dagdas novads'),(389,125,'LV','LV-DA','Daugavpils novads'),(390,125,'LV','LV-DO','Dobeles novads'),(391,125,'LV','Dundagas novads','Dundagas novads'),(392,125,'LV','Durbes novads','Durbes novads'),(393,125,'LV','Engures novads','Engures novads'),(394,125,'LV','Garkalnes novads','Garkalnes novads'),(395,125,'LV','Grobiņas novads','Grobiņas novads'),(396,125,'LV','LV-GU','Gulbenes novads'),(397,125,'LV','Iecavas novads','Iecavas novads'),(398,125,'LV','Ikšķiles novads','Ikšķiles novads'),(399,125,'LV','Ilūkstes novads','Ilūkstes novads'),(400,125,'LV','Inčukalna novads','Inčukalna novads'),(401,125,'LV','Jaunjelgavas novads','Jaunjelgavas novads'),(402,125,'LV','Jaunpiebalgas novads','Jaunpiebalgas novads'),(403,125,'LV','Jaunpils novads','Jaunpils novads'),(404,125,'LV','LV-JL','Jelgavas novads'),(405,125,'LV','LV-JK','Jēkabpils novads'),(406,125,'LV','Kandavas novads','Kandavas novads'),(407,125,'LV','Kokneses novads','Kokneses novads'),(408,125,'LV','Krimuldas novads','Krimuldas novads'),(409,125,'LV','Krustpils novads','Krustpils novads'),(410,125,'LV','LV-KR','Krāslavas novads'),(411,125,'LV','LV-KU','Kuldīgas novads'),(412,125,'LV','Kārsavas novads','Kārsavas novads'),(413,125,'LV','Lielvārdes novads','Lielvārdes novads'),(414,125,'LV','LV-LM','Limbažu novads'),(415,125,'LV','Lubānas novads','Lubānas novads'),(416,125,'LV','LV-LU','Ludzas novads'),(417,125,'LV','Līgatnes novads','Līgatnes novads'),(418,125,'LV','Līvānu novads','Līvānu novads'),(419,125,'LV','LV-MA','Madonas novads'),(420,125,'LV','Mazsalacas novads','Mazsalacas novads'),(421,125,'LV','Mālpils novads','Mālpils novads'),(422,125,'LV','Mārupes novads','Mārupes novads'),(423,125,'LV','Naukšēnu novads','Naukšēnu novads'),(424,125,'LV','Neretas novads','Neretas novads'),(425,125,'LV','Nīcas novads','Nīcas novads'),(426,125,'LV','LV-OG','Ogres novads'),(427,125,'LV','Olaines novads','Olaines novads'),(428,125,'LV','Ozolnieku novads','Ozolnieku novads'),(429,125,'LV','LV-PR','Preiļu novads'),(430,125,'LV','Priekules novads','Priekules novads'),(431,125,'LV','Priekuļu novads','Priekuļu novads'),(432,125,'LV','Pārgaujas novads','Pārgaujas novads'),(433,125,'LV','Pāvilostas novads','Pāvilostas novads'),(434,125,'LV','Pļaviņu novads','Pļaviņu novads'),(435,125,'LV','Raunas novads','Raunas novads'),(436,125,'LV','Riebiņu novads','Riebiņu novads'),(437,125,'LV','Rojas novads','Rojas novads'),(438,125,'LV','Ropažu novads','Ropažu novads'),(439,125,'LV','Rucavas novads','Rucavas novads'),(440,125,'LV','Rugāju novads','Rugāju novads'),(441,125,'LV','Rundāles novads','Rundāles novads'),(442,125,'LV','LV-RE','Rēzeknes novads'),(443,125,'LV','Rūjienas novads','Rūjienas novads'),(444,125,'LV','Salacgrīvas novads','Salacgrīvas novads'),(445,125,'LV','Salas novads','Salas novads'),(446,125,'LV','Salaspils novads','Salaspils novads'),(447,125,'LV','LV-SA','Saldus novads'),(448,125,'LV','Saulkrastu novads','Saulkrastu novads'),(449,125,'LV','Siguldas novads','Siguldas novads'),(450,125,'LV','Skrundas novads','Skrundas novads'),(451,125,'LV','Skrīveru novads','Skrīveru novads'),(452,125,'LV','Smiltenes novads','Smiltenes novads'),(453,125,'LV','Stopiņu novads','Stopiņu novads'),(454,125,'LV','Strenču novads','Strenču novads'),(455,125,'LV','Sējas novads','Sējas novads'),(456,125,'LV','LV-TA','Talsu novads'),(457,125,'LV','LV-TU','Tukuma novads'),(458,125,'LV','Tērvetes novads','Tērvetes novads'),(459,125,'LV','Vaiņodes novads','Vaiņodes novads'),(460,125,'LV','LV-VK','Valkas novads'),(461,125,'LV','LV-VM','Valmieras novads'),(462,125,'LV','Varakļānu novads','Varakļānu novads'),(463,125,'LV','Vecpiebalgas novads','Vecpiebalgas novads'),(464,125,'LV','Vecumnieku novads','Vecumnieku novads'),(465,125,'LV','LV-VE','Ventspils novads'),(466,125,'LV','Viesītes novads','Viesītes novads'),(467,125,'LV','Viļakas novads','Viļakas novads'),(468,125,'LV','Viļānu novads','Viļānu novads'),(469,125,'LV','Vārkavas novads','Vārkavas novads'),(470,125,'LV','Zilupes novads','Zilupes novads'),(471,125,'LV','Ādažu novads','Ādažu novads'),(472,125,'LV','Ērgļu novads','Ērgļu novads'),(473,125,'LV','Ķeguma novads','Ķeguma novads'),(474,125,'LV','Ķekavas novads','Ķekavas novads'),(475,131,'LT','LT-AL','Alytaus Apskritis'),(476,131,'LT','LT-KU','Kauno Apskritis'),(477,131,'LT','LT-KL','Klaipėdos Apskritis'),(478,131,'LT','LT-MR','Marijampolės Apskritis'),(479,131,'LT','LT-PN','Panevėžio Apskritis'),(480,131,'LT','LT-SA','Šiaulių Apskritis'),(481,131,'LT','LT-TA','Tauragės Apskritis'),(482,131,'LT','LT-TE','Telšių Apskritis'),(483,131,'LT','LT-UT','Utenos Apskritis'),(484,131,'LT','LT-VL','Vilniaus Apskritis'),(485,31,'BR','AC','Acre'),(486,31,'BR','AL','Alagoas'),(487,31,'BR','AP','Amapá'),(488,31,'BR','AM','Amazonas'),(489,31,'BR','BA','Bahia'),(490,31,'BR','CE','Ceará'),(491,31,'BR','ES','Espírito Santo'),(492,31,'BR','GO','Goiás'),(493,31,'BR','MA','Maranhão'),(494,31,'BR','MT','Mato Grosso'),(495,31,'BR','MS','Mato Grosso do Sul'),(496,31,'BR','MG','Minas Gerais'),(497,31,'BR','PA','Pará'),(498,31,'BR','PB','Paraíba'),(499,31,'BR','PR','Paraná'),(500,31,'BR','PE','Pernambuco'),(501,31,'BR','PI','Piauí'),(502,31,'BR','RJ','Rio de Janeiro'),(503,31,'BR','RN','Rio Grande do Norte'),(504,31,'BR','RS','Rio Grande do Sul'),(505,31,'BR','RO','Rondônia'),(506,31,'BR','RR','Roraima'),(507,31,'BR','SC','Santa Catarina'),(508,31,'BR','SP','São Paulo'),(509,31,'BR','SE','Sergipe'),(510,31,'BR','TO','Tocantins'),(511,31,'BR','DF','Distrito Federal'),(512,59,'HR','HR-01','Zagrebačka županija'),(513,59,'HR','HR-02','Krapinsko-zagorska županija'),(514,59,'HR','HR-03','Sisačko-moslavačka županija'),(515,59,'HR','HR-04','Karlovačka županija'),(516,59,'HR','HR-05','Varaždinska županija'),(517,59,'HR','HR-06','Koprivničko-križevačka županija'),(518,59,'HR','HR-07','Bjelovarsko-bilogorska županija'),(519,59,'HR','HR-08','Primorsko-goranska županija'),(520,59,'HR','HR-09','Ličko-senjska županija'),(521,59,'HR','HR-10','Virovitičko-podravska županija'),(522,59,'HR','HR-11','Požeško-slavonska županija'),(523,59,'HR','HR-12','Brodsko-posavska županija'),(524,59,'HR','HR-13','Zadarska županija'),(525,59,'HR','HR-14','Osječko-baranjska županija'),(526,59,'HR','HR-15','Šibensko-kninska županija'),(527,59,'HR','HR-16','Vukovarsko-srijemska županija'),(528,59,'HR','HR-17','Splitsko-dalmatinska županija'),(529,59,'HR','HR-18','Istarska županija'),(530,59,'HR','HR-19','Dubrovačko-neretvanska županija'),(531,59,'HR','HR-20','Međimurska županija'),(532,59,'HR','HR-21','Grad Zagreb'),(533,106,'IN','AN','Andaman and Nicobar Islands'),(534,106,'IN','AP','Andhra Pradesh'),(535,106,'IN','AR','Arunachal Pradesh'),(536,106,'IN','AS','Assam'),(537,106,'IN','BR','Bihar'),(538,106,'IN','CH','Chandigarh'),(539,106,'IN','CT','Chhattisgarh'),(540,106,'IN','DN','Dadra and Nagar Haveli'),(541,106,'IN','DD','Daman and Diu'),(542,106,'IN','DL','Delhi'),(543,106,'IN','GA','Goa'),(544,106,'IN','GJ','Gujarat'),(545,106,'IN','HR','Haryana'),(546,106,'IN','HP','Himachal Pradesh'),(547,106,'IN','JK','Jammu and Kashmir'),(548,106,'IN','JH','Jharkhand'),(549,106,'IN','KA','Karnataka'),(550,106,'IN','KL','Kerala'),(551,106,'IN','LD','Lakshadweep'),(552,106,'IN','MP','Madhya Pradesh'),(553,106,'IN','MH','Maharashtra'),(554,106,'IN','MN','Manipur'),(555,106,'IN','ML','Meghalaya'),(556,106,'IN','MZ','Mizoram'),(557,106,'IN','NL','Nagaland'),(558,106,'IN','OR','Odisha'),(559,106,'IN','PY','Puducherry'),(560,106,'IN','PB','Punjab'),(561,106,'IN','RJ','Rajasthan'),(562,106,'IN','SK','Sikkim'),(563,106,'IN','TN','Tamil Nadu'),(564,106,'IN','TG','Telangana'),(565,106,'IN','TR','Tripura'),(566,106,'IN','UP','Uttar Pradesh'),(567,106,'IN','UT','Uttarakhand'),(568,106,'IN','WB','West Bengal'),(569,176,'PY','PY-16','Alto Paraguay'),(570,176,'PY','PY-10','Alto Paraná'),(571,176,'PY','PY-13','Amambay'),(572,176,'PY','PY-ASU','Asunción'),(573,176,'PY','PY-19','Boquerón'),(574,176,'PY','PY-5','Caaguazú'),(575,176,'PY','PY-6','Caazapá'),(576,176,'PY','PY-14','Canindeyú'),(577,176,'PY','PY-11','Central'),(578,176,'PY','PY-1','Concepción'),(579,176,'PY','PY-3','Cordillera'),(580,176,'PY','PY-4','Guairá'),(581,176,'PY','PY-7','Itapúa'),(582,176,'PY','PY-8','Misiones'),(583,176,'PY','PY-9','Paraguarí'),(584,176,'PY','PY-15','Presidente Hayes'),(585,176,'PY','PY-2','San Pedro'),(586,176,'PY','PY-12','Ñeembucú');
/*!40000 ALTER TABLE `country_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_translations`
--

DROP TABLE IF EXISTS `country_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `country_translations_country_id_foreign` (`country_id`),
  CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_translations`
--

LOCK TABLES `country_translations` WRITE;
/*!40000 ALTER TABLE `country_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimal` int unsigned NOT NULL DEFAULT '2',
  `group_separator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ',',
  `decimal_separator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '.',
  `currency_position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'COP','Peso Colombiano','$',2,',','.','',NULL,'2024-11-02 19:06:03');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_exchange_rates`
--

DROP TABLE IF EXISTS `currency_exchange_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_exchange_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(24,12) NOT NULL,
  `target_currency` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_exchange_rates_target_currency_unique` (`target_currency`),
  CONSTRAINT `currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_exchange_rates`
--

LOCK TABLES `currency_exchange_rates` WRITE;
/*!40000 ALTER TABLE `currency_exchange_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_exchange_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_groups`
--

DROP TABLE IF EXISTS `customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_groups_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_groups`
--

LOCK TABLES `customer_groups` WRITE;
/*!40000 ALTER TABLE `customer_groups` DISABLE KEYS */;
INSERT INTO `customer_groups` VALUES (1,'guest','Invitado',0,NULL,NULL),(2,'general','General',0,NULL,NULL),(3,'wholesale','Mayorista',0,NULL,NULL);
/*!40000 ALTER TABLE `customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_notes`
--

DROP TABLE IF EXISTS `customer_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_notes_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_notes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_notes`
--

LOCK TABLES `customer_notes` WRITE;
/*!40000 ALTER TABLE `customer_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_password_resets`
--

DROP TABLE IF EXISTS `customer_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `customer_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_password_resets`
--

LOCK TABLES `customer_password_resets` WRITE;
/*!40000 ALTER TABLE `customer_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_social_accounts`
--

DROP TABLE IF EXISTS `customer_social_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_social_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `provider_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_social_accounts_provider_id_unique` (`provider_id`),
  KEY `customer_social_accounts_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_social_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_social_accounts`
--

LOCK TABLES `customer_social_accounts` WRITE;
/*!40000 ALTER TABLE `customer_social_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_social_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `subscribed_to_news_letter` tinyint(1) NOT NULL DEFAULT '0',
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `is_suspended` tinyint unsigned NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`),
  UNIQUE KEY `customers_phone_unique` (`phone`),
  UNIQUE KEY `customers_api_token_unique` (`api_token`),
  KEY `customers_customer_group_id_foreign` (`customer_group_id`),
  KEY `customers_channel_id_foreign` (`channel_id`),
  CONSTRAINT `customers_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Loraine','Causado',NULL,NULL,'lorainecausado@gmail.com',NULL,NULL,1,'$2y$10$DuqAeAc18JDpKLYzGnWuYesyniW/1Mmcv0kpfOsmBxa.XafyVYM7K','NXt0pBYsoa1phzfdvT7vVFV0F83nCtzumtEjPM0Glq6ph3HuovCzmDzeNsqjuQdo7Y8ysxMMxwQxm9gF',1,1,0,1,0,'164830c2100463bac3a43ebb2d1f8b9b',NULL,'2024-11-02 15:58:10','2024-11-02 15:58:10'),(2,'Kevin','Causado','Male',NULL,'kevincausado@gmail.com','3152089391','0',1,'$2y$10$CifdziQJc5TuYlWhvprAkuD4KQMnUL62Kr9AIbnSrcfEmj2D/rEQ2','iEpfyKzi0HwD8WsnAyoEcL7mv1T0CtwiKia0i0mBOYt7VKCVYQvqIMxDeNMGAZayZBMWaY7uQUZZjYW4',1,1,0,1,0,'45590b36592b55cdc9eefca126b2cf97',NULL,'2024-11-02 19:05:25','2024-11-08 23:46:53');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datagrid_saved_filters`
--

DROP TABLE IF EXISTS `datagrid_saved_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datagrid_saved_filters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `src` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `datagrid_saved_filters_user_id_name_src_unique` (`user_id`,`name`,`src`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datagrid_saved_filters`
--

LOCK TABLES `datagrid_saved_filters` WRITE;
/*!40000 ALTER TABLE `datagrid_saved_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `datagrid_saved_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_purchased`
--

DROP TABLE IF EXISTS `downloadable_link_purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloadable_link_purchased` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `download_bought` int NOT NULL DEFAULT '0',
  `download_used` int NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `order_item_id` int unsigned NOT NULL,
  `download_canceled` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `downloadable_link_purchased_customer_id_foreign` (`customer_id`),
  KEY `downloadable_link_purchased_order_id_foreign` (`order_id`),
  KEY `downloadable_link_purchased_order_item_id_foreign` (`order_item_id`),
  CONSTRAINT `downloadable_link_purchased_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_purchased`
--

LOCK TABLES `downloadable_link_purchased` WRITE;
/*!40000 ALTER TABLE `downloadable_link_purchased` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_purchased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_batches`
--

DROP TABLE IF EXISTS `import_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_batches` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `data` json NOT NULL,
  `summary` json DEFAULT NULL,
  `import_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `import_batches_import_id_foreign` (`import_id`),
  CONSTRAINT `import_batches_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_batches`
--

LOCK TABLES `import_batches` WRITE;
/*!40000 ALTER TABLE `import_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `process_in_queue` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation_strategy` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_errors` int NOT NULL DEFAULT '0',
  `processed_rows_count` int NOT NULL DEFAULT '0',
  `invalid_rows_count` int NOT NULL DEFAULT '0',
  `errors_count` int NOT NULL DEFAULT '0',
  `errors` json DEFAULT NULL,
  `field_separator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images_directory_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `error_file_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` json DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_sources`
--

DROP TABLE IF EXISTS `inventory_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_sources` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_sources_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_sources`
--

LOCK TABLES `inventory_sources` WRITE;
/*!40000 ALTER TABLE `inventory_sources` DISABLE KEYS */;
INSERT INTO `inventory_sources` VALUES (1,'default','Predeterminado',NULL,'Predeterminado','warehouse@example.com','1234567899',NULL,'US','MI','Detroit','12th Street','48127',0,NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `inventory_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_items`
--

DROP TABLE IF EXISTS `invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `invoice_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_items`
--

LOCK TABLES `invoice_items` WRITE;
/*!40000 ALTER TABLE `invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `order_id` int unsigned DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reminders` int NOT NULL DEFAULT '0',
  `next_reminder_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_order_id_foreign` (`order_id`),
  CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales`
--

DROP TABLE IF EXISTS `locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `logo_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locales_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales`
--

LOCK TABLES `locales` WRITE;
/*!40000 ALTER TABLE `locales` DISABLE KEYS */;
INSERT INTO `locales` VALUES (1,'es','Español','ltr','locales/eHJqfpaB7wZMk6F0uViYYlfvFtuMatUHtqQgIUkv.png',NULL,NULL);
/*!40000 ALTER TABLE `locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_campaigns`
--

DROP TABLE IF EXISTS `marketing_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_campaigns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spooling` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `marketing_template_id` int unsigned DEFAULT NULL,
  `marketing_event_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketing_campaigns_channel_id_foreign` (`channel_id`),
  KEY `marketing_campaigns_customer_group_id_foreign` (`customer_group_id`),
  KEY `marketing_campaigns_marketing_template_id_foreign` (`marketing_template_id`),
  KEY `marketing_campaigns_marketing_event_id_foreign` (`marketing_event_id`),
  CONSTRAINT `marketing_campaigns_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_event_id_foreign` FOREIGN KEY (`marketing_event_id`) REFERENCES `marketing_events` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_template_id_foreign` FOREIGN KEY (`marketing_template_id`) REFERENCES `marketing_templates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_campaigns`
--

LOCK TABLES `marketing_campaigns` WRITE;
/*!40000 ALTER TABLE `marketing_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketing_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_events`
--

DROP TABLE IF EXISTS `marketing_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_events`
--

LOCK TABLES `marketing_events` WRITE;
/*!40000 ALTER TABLE `marketing_events` DISABLE KEYS */;
INSERT INTO `marketing_events` VALUES (1,'Birthday','Birthday',NULL,NULL,NULL);
/*!40000 ALTER TABLE `marketing_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_templates`
--

DROP TABLE IF EXISTS `marketing_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_templates`
--

LOCK TABLES `marketing_templates` WRITE;
/*!40000 ALTER TABLE `marketing_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketing_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_admin_password_resets_table',1),(3,'2014_10_12_100000_create_password_resets_table',1),(4,'2018_06_12_111907_create_admins_table',1),(5,'2018_06_13_055341_create_roles_table',1),(6,'2018_07_05_130148_create_attributes_table',1),(7,'2018_07_05_132854_create_attribute_translations_table',1),(8,'2018_07_05_135150_create_attribute_families_table',1),(9,'2018_07_05_135152_create_attribute_groups_table',1),(10,'2018_07_05_140832_create_attribute_options_table',1),(11,'2018_07_05_140856_create_attribute_option_translations_table',1),(12,'2018_07_05_142820_create_categories_table',1),(13,'2018_07_10_055143_create_locales_table',1),(14,'2018_07_20_054426_create_countries_table',1),(15,'2018_07_20_054502_create_currencies_table',1),(16,'2018_07_20_054542_create_currency_exchange_rates_table',1),(17,'2018_07_20_064849_create_channels_table',1),(18,'2018_07_21_142836_create_category_translations_table',1),(19,'2018_07_23_110040_create_inventory_sources_table',1),(20,'2018_07_24_082635_create_customer_groups_table',1),(21,'2018_07_24_082930_create_customers_table',1),(22,'2018_07_27_065727_create_products_table',1),(23,'2018_07_27_070011_create_product_attribute_values_table',1),(24,'2018_07_27_092623_create_product_reviews_table',1),(25,'2018_07_27_113941_create_product_images_table',1),(26,'2018_07_27_113956_create_product_inventories_table',1),(27,'2018_08_30_064755_create_tax_categories_table',1),(28,'2018_08_30_065042_create_tax_rates_table',1),(29,'2018_08_30_065840_create_tax_mappings_table',1),(30,'2018_09_05_150444_create_cart_table',1),(31,'2018_09_05_150915_create_cart_items_table',1),(32,'2018_09_11_064045_customer_password_resets',1),(33,'2018_09_19_093453_create_cart_payment',1),(34,'2018_09_19_093508_create_cart_shipping_rates_table',1),(35,'2018_09_20_060658_create_core_config_table',1),(36,'2018_09_27_113154_create_orders_table',1),(37,'2018_09_27_113207_create_order_items_table',1),(38,'2018_09_27_115022_create_shipments_table',1),(39,'2018_09_27_115029_create_shipment_items_table',1),(40,'2018_09_27_115135_create_invoices_table',1),(41,'2018_09_27_115144_create_invoice_items_table',1),(42,'2018_10_01_095504_create_order_payment_table',1),(43,'2018_10_03_025230_create_wishlist_table',1),(44,'2018_10_12_101803_create_country_translations_table',1),(45,'2018_10_12_101913_create_country_states_table',1),(46,'2018_10_12_101923_create_country_state_translations_table',1),(47,'2018_11_16_173504_create_subscribers_list_table',1),(48,'2018_11_21_144411_create_cart_item_inventories_table',1),(49,'2018_12_06_185202_create_product_flat_table',1),(50,'2018_12_24_123812_create_channel_inventory_sources_table',1),(51,'2018_12_26_165327_create_product_ordered_inventories_table',1),(52,'2019_05_13_024321_create_cart_rules_table',1),(53,'2019_05_13_024322_create_cart_rule_channels_table',1),(54,'2019_05_13_024323_create_cart_rule_customer_groups_table',1),(55,'2019_05_13_024324_create_cart_rule_translations_table',1),(56,'2019_05_13_024325_create_cart_rule_customers_table',1),(57,'2019_05_13_024326_create_cart_rule_coupons_table',1),(58,'2019_05_13_024327_create_cart_rule_coupon_usage_table',1),(59,'2019_06_17_180258_create_product_downloadable_samples_table',1),(60,'2019_06_17_180314_create_product_downloadable_sample_translations_table',1),(61,'2019_06_17_180325_create_product_downloadable_links_table',1),(62,'2019_06_17_180346_create_product_downloadable_link_translations_table',1),(63,'2019_06_21_202249_create_downloadable_link_purchased_table',1),(64,'2019_07_30_153530_create_cms_pages_table',1),(65,'2019_07_31_143339_create_category_filterable_attributes_table',1),(66,'2019_08_02_105320_create_product_grouped_products_table',1),(67,'2019_08_20_170510_create_product_bundle_options_table',1),(68,'2019_08_20_170520_create_product_bundle_option_translations_table',1),(69,'2019_08_20_170528_create_product_bundle_option_products_table',1),(70,'2019_09_11_184511_create_refunds_table',1),(71,'2019_09_11_184519_create_refund_items_table',1),(72,'2019_12_03_184613_create_catalog_rules_table',1),(73,'2019_12_03_184651_create_catalog_rule_channels_table',1),(74,'2019_12_03_184732_create_catalog_rule_customer_groups_table',1),(75,'2019_12_06_101110_create_catalog_rule_products_table',1),(76,'2019_12_06_110507_create_catalog_rule_product_prices_table',1),(77,'2019_12_14_000001_create_personal_access_tokens_table',1),(78,'2020_01_14_191854_create_cms_page_translations_table',1),(79,'2020_01_15_130209_create_cms_page_channels_table',1),(80,'2020_04_16_185147_add_table_addresses',1),(81,'2020_05_06_171638_create_order_comments_table',1),(82,'2020_05_21_171500_create_product_customer_group_prices_table',1),(83,'2020_06_25_162154_create_customer_social_accounts_table',1),(84,'2020_11_19_112228_create_product_videos_table',1),(85,'2020_11_26_141455_create_marketing_templates_table',1),(86,'2020_11_26_150534_create_marketing_events_table',1),(87,'2020_11_26_150644_create_marketing_campaigns_table',1),(88,'2020_12_21_000200_create_channel_translations_table',1),(89,'2020_12_27_121950_create_jobs_table',1),(90,'2021_03_11_212124_create_order_transactions_table',1),(91,'2021_04_07_132010_create_product_review_images_table',1),(92,'2021_12_15_104544_notifications',1),(93,'2022_03_15_160510_create_failed_jobs_table',1),(94,'2022_04_01_094622_create_sitemaps_table',1),(95,'2022_10_03_144232_create_product_price_indices_table',1),(96,'2022_10_04_144444_create_job_batches_table',1),(97,'2022_10_08_134150_create_product_inventory_indices_table',1),(98,'2023_05_26_213105_create_wishlist_items_table',1),(99,'2023_05_26_213120_create_compare_items_table',1),(100,'2023_06_27_163529_rename_product_review_images_to_product_review_attachments',1),(101,'2023_07_06_140013_add_logo_path_column_to_locales',1),(102,'2023_07_10_184256_create_theme_customizations_table',1),(103,'2023_07_12_181722_remove_home_page_and_footer_content_column_from_channel_translations_table',1),(104,'2023_07_20_185324_add_column_column_in_attribute_groups_table',1),(105,'2023_07_25_145943_add_regex_column_in_attributes_table',1),(106,'2023_07_25_165945_drop_notes_column_from_customers_table',1),(107,'2023_07_25_171058_create_customer_notes_table',1),(108,'2023_07_31_125232_rename_image_and_category_banner_columns_from_categories_table',1),(109,'2023_09_15_170053_create_theme_customization_translations_table',1),(110,'2023_09_20_102031_add_default_value_column_in_attributes_table',1),(111,'2023_09_20_102635_add_inventories_group_in_attribute_groups_table',1),(112,'2023_09_26_155709_add_columns_to_currencies',1),(113,'2023_10_05_163612_create_visits_table',1),(114,'2023_10_12_090446_add_tax_category_id_column_in_order_items_table',1),(115,'2023_11_08_054614_add_code_column_in_attribute_groups_table',1),(116,'2023_11_08_140116_create_search_terms_table',1),(117,'2023_11_09_162805_create_url_rewrites_table',1),(118,'2023_11_17_150401_create_search_synonyms_table',1),(119,'2023_12_11_054614_add_channel_id_column_in_product_price_indices_table',1),(120,'2024_01_11_154640_create_imports_table',1),(121,'2024_01_11_154741_create_import_batches_table',1),(122,'2024_01_19_170350_add_unique_id_column_in_product_attribute_values_table',1),(123,'2024_01_19_170350_add_unique_id_column_in_product_customer_group_prices_table',1),(124,'2024_01_22_170814_add_unique_index_in_mapping_tables',1),(125,'2024_02_26_153000_add_columns_to_addresses_table',1),(126,'2024_03_07_193421_rename_address1_column_in_addresses_table',1),(127,'2024_04_16_144400_add_cart_id_column_in_cart_shipping_rates_table',1),(128,'2024_04_19_102939_add_incl_tax_columns_in_orders_table',1),(129,'2024_04_19_135405_add_incl_tax_columns_in_cart_items_table',1),(130,'2024_04_19_144641_add_incl_tax_columns_in_order_items_table',1),(131,'2024_04_23_133154_add_incl_tax_columns_in_cart_table',1),(132,'2024_04_23_150945_add_incl_tax_columns_in_cart_shipping_rates_table',1),(133,'2024_04_24_102939_add_incl_tax_columns_in_invoices_table',1),(134,'2024_04_24_102939_add_incl_tax_columns_in_refunds_table',1),(135,'2024_04_24_144641_add_incl_tax_columns_in_invoice_items_table',1),(136,'2024_04_24_144641_add_incl_tax_columns_in_refund_items_table',1),(137,'2024_04_24_144641_add_incl_tax_columns_in_shipment_items_table',1),(138,'2024_05_10_152848_create_saved_filters_table',1),(139,'2024_06_03_174128_create_product_channels_table',1),(140,'2024_06_04_130527_add_channel_id_column_in_customers_table',1),(141,'2024_06_04_134403_add_channel_id_column_in_visits_table',1),(142,'2024_06_13_184426_add_theme_column_into_theme_customizations_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_order_id_foreign` (`order_id`),
  CONSTRAINT `notifications_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_comments`
--

DROP TABLE IF EXISTS `order_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_comments_order_id_foreign` (`order_id`),
  CONSTRAINT `order_comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_comments`
--

LOCK TABLES `order_comments` WRITE;
/*!40000 ALTER TABLE `order_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT '0.0000',
  `total_weight` decimal(12,4) DEFAULT '0.0000',
  `qty_ordered` int DEFAULT '0',
  `qty_shipped` int DEFAULT '0',
  `qty_invoiced` int DEFAULT '0',
  `qty_canceled` int DEFAULT '0',
  `qty_refunded` int DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `tax_category_id` int unsigned DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_parent_id_foreign` (`parent_id`),
  KEY `order_items_tax_category_id_foreign` (`tax_category_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_payment`
--

DROP TABLE IF EXISTS `order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned DEFAULT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_payment_order_id_foreign` (`order_id`),
  CONSTRAINT `order_payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_payment`
--

LOCK TABLES `order_payment` WRITE;
/*!40000 ALTER TABLE `order_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_transactions`
--

DROP TABLE IF EXISTS `order_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_transactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(12,4) DEFAULT '0.0000',
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  `invoice_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_transactions_order_id_foreign` (`order_id`),
  CONSTRAINT `order_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_transactions`
--

LOCK TABLES `order_transactions` WRITE;
/*!40000 ALTER TABLE `order_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `total_item_count` int DEFAULT NULL,
  `total_qty_ordered` int DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_tax_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `customer_id` int unsigned DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `channel_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_increment_id_unique` (`increment_id`),
  KEY `orders_customer_id_foreign` (`customer_id`),
  KEY `orders_channel_id_foreign` (`channel_id`),
  CONSTRAINT `orders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute_values`
--

DROP TABLE IF EXISTS `product_attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_attribute_values` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_value` text COLLATE utf8mb4_unicode_ci,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int DEFAULT NULL,
  `float_value` decimal(12,4) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` json DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  `unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chanel_locale_attribute_value_index_unique` (`channel`,`locale`,`attribute_id`,`product_id`),
  UNIQUE KEY `product_attribute_values_unique_id_unique` (`unique_id`),
  KEY `product_attribute_values_product_id_foreign` (`product_id`),
  KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute_values`
--

LOCK TABLES `product_attribute_values` WRITE;
/*!40000 ALTER TABLE `product_attribute_values` DISABLE KEYS */;
INSERT INTO `product_attribute_values` VALUES (1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1,5,'1|5'),(2,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,6,'1|6'),(3,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1,7,'1|7'),(4,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,1,8,'default|1|8'),(5,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,26,'1|26'),(6,'es',NULL,'<p>Perfume dorsay para hombre</p>',NULL,NULL,NULL,NULL,NULL,NULL,1,9,'es|1|9'),(7,'es',NULL,'<p>Perfume dorsay para hombre</p>',NULL,NULL,NULL,NULL,NULL,NULL,1,10,'es|1|10'),(8,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1,19,'1|19'),(9,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1,20,'1|20'),(11,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,1,22,'1|22'),(12,NULL,NULL,'DORSAY',NULL,NULL,NULL,NULL,NULL,NULL,1,1,'1|1'),(13,'es',NULL,'Dorsay',NULL,NULL,NULL,NULL,NULL,NULL,1,2,'es|1|2'),(14,'es',NULL,'dorsay',NULL,NULL,NULL,NULL,NULL,NULL,1,3,'es|1|3'),(15,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,1,23,'1|23'),(16,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1,27,'1|27'),(17,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,1,28,'default|1|28'),(18,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1,16,'es|1|16'),(19,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1,17,'es|1|17'),(20,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1,18,'es|1|18'),(21,NULL,NULL,NULL,NULL,NULL,40000.0000,NULL,NULL,NULL,1,11,'1|11'),(22,NULL,NULL,NULL,NULL,NULL,40000.0000,NULL,NULL,NULL,1,12,'1|12'),(23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,13,'1|13'),(24,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,14,'default|1|14'),(25,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,15,'default|1|15'),(26,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,3,5,'3|5'),(27,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,3,6,'3|6'),(28,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,3,7,'3|7'),(29,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,3,8,'default|3|8'),(30,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,3,26,'3|26'),(31,'es',NULL,'<p>Perfume nitro para hombre edici&oacute;n limitada</p>',NULL,NULL,NULL,NULL,NULL,NULL,3,9,'es|3|9'),(32,'es',NULL,'<p>Perfume nitro para hombre edici&oacute;n limitada</p>',NULL,NULL,NULL,NULL,NULL,NULL,3,10,'es|3|10'),(33,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,3,19,'3|19'),(34,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,3,20,'3|20'),(36,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,3,22,'3|22'),(37,NULL,NULL,'NITRO',NULL,NULL,NULL,NULL,NULL,NULL,3,1,'3|1'),(38,'es',NULL,'Nitro Edición Limitada',NULL,NULL,NULL,NULL,NULL,NULL,3,2,'es|3|2'),(39,'es',NULL,'nitro-edicion-limitada',NULL,NULL,NULL,NULL,NULL,NULL,3,3,'es|3|3'),(40,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,3,23,'3|23'),(41,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,3,27,'3|27'),(42,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,3,28,'default|3|28'),(43,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,3,16,'es|3|16'),(44,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,3,17,'es|3|17'),(45,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,3,18,'es|3|18'),(46,NULL,NULL,NULL,NULL,NULL,50000.0000,NULL,NULL,NULL,3,11,'3|11'),(47,NULL,NULL,NULL,NULL,NULL,40000.0000,NULL,NULL,NULL,3,12,'3|12'),(48,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,13,'3|13'),(49,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,14,'default|3|14'),(50,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,15,'default|3|15'),(51,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2,5,'2|5'),(52,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2,6,'2|6'),(53,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2,7,'2|7'),(54,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,2,8,'default|2|8'),(55,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,2,26,'2|26'),(56,'es',NULL,'<p>Colonia Fresca con aroma a hierbas arom&aacute;ticas y naranja de la l&iacute;nea Ag&uacute;. F&oacute;rmulas seguras y puras con extractos 100% de origen natural de la Colecci&oacute;n de Amor, tu l&iacute;nea cl&aacute;sica de siempre.</p>',NULL,NULL,NULL,NULL,NULL,NULL,2,9,'es|2|9'),(57,'es',NULL,'<p>Colonia Fresca con aroma a hierbas arom&aacute;ticas y naranja de la l&iacute;nea Ag&uacute;. F&oacute;rmulas seguras y puras con extractos 100% de origen natural de la Colecci&oacute;n de Amor, tu l&iacute;nea cl&aacute;sica de siempre.</p>',NULL,NULL,NULL,NULL,NULL,NULL,2,10,'es|2|10'),(58,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,2,19,'2|19'),(59,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,2,20,'2|20'),(61,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,2,22,'2|22'),(62,NULL,NULL,'AGU',NULL,NULL,NULL,NULL,NULL,NULL,2,1,'2|1'),(63,'es',NULL,'Colonia Agú Fresca',NULL,NULL,NULL,NULL,NULL,NULL,2,2,'es|2|2'),(64,'es',NULL,'colonia-agu-fresca',NULL,NULL,NULL,NULL,NULL,NULL,2,3,'es|2|3'),(65,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,2,27,'2|27'),(66,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,2,28,'default|2|28'),(67,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,2,16,'es|2|16'),(68,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,2,17,'es|2|17'),(69,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,2,18,'es|2|18'),(70,NULL,NULL,NULL,NULL,NULL,40000.0000,NULL,NULL,NULL,2,11,'2|11'),(71,NULL,NULL,NULL,NULL,NULL,30000.0000,NULL,NULL,NULL,2,12,'2|12'),(72,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,13,'2|13'),(73,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,14,'default|2|14'),(74,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,15,'default|2|15'),(75,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,4,5,'4|5'),(76,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,4,6,'4|6'),(77,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,4,7,'4|7'),(78,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,4,8,'default|4|8'),(79,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,4,26,'4|26'),(80,'es',NULL,'<p>&bull; Crema corporal humectante que suaviza y revitaliza la piel. &bull; Es de r&aacute;pida absorci&oacute;n y tiene textura ligera. &bull; Libre de sulfatos. - Extracto de Durazno: Reconocido por su efecto nutritivo y suavizante que deja un aspecto saludable y suave en la piel. - Extracto de Coco: Reconocido por su alta cantidad de aceites y nutrientes con propiedades hidratantes y de protecci&oacute;n a la piel. *Prueba Instrumental de hidrataci&oacute;n, 2022, Brasil.</p>',NULL,NULL,NULL,NULL,NULL,NULL,4,9,'es|4|9'),(81,'es',NULL,'<p>&bull; Crema corporal humectante que suaviza y revitaliza la piel. &bull; Es de r&aacute;pida absorci&oacute;n y tiene textura ligera. &bull; Libre de sulfatos. - Extracto de Durazno: Reconocido por su efecto nutritivo y suavizante que deja un aspecto saludable y suave en la piel. - Extracto de Coco: Reconocido por su alta cantidad de aceites y nutrientes con propiedades hidratantes y de protecci&oacute;n a la piel. *Prueba Instrumental de hidrataci&oacute;n, 2022, Brasil.</p>',NULL,NULL,NULL,NULL,NULL,NULL,4,10,'es|4|10'),(82,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,4,19,'4|19'),(83,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,4,20,'4|20'),(84,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,4,22,'4|22'),(85,NULL,NULL,'CREMA-HUMECTANTE-DURAZNO-Y-COCO',NULL,NULL,NULL,NULL,NULL,NULL,4,1,'4|1'),(86,'es',NULL,'Crema Humectante Corporal Durazno & Coco Natural Care',NULL,NULL,NULL,NULL,NULL,NULL,4,2,'es|4|2'),(87,'es',NULL,'crema-humectante-corporal-durazno-coco-natural-care',NULL,NULL,NULL,NULL,NULL,NULL,4,3,'es|4|3'),(88,NULL,NULL,'4',NULL,NULL,NULL,NULL,NULL,NULL,4,27,'4|27'),(89,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,4,28,'default|4|28'),(90,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,4,16,'es|4|16'),(91,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,4,17,'es|4|17'),(92,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,4,18,'es|4|18'),(93,NULL,NULL,NULL,NULL,NULL,20000.0000,NULL,NULL,NULL,4,11,'4|11'),(94,NULL,NULL,NULL,NULL,NULL,20000.0000,NULL,NULL,NULL,4,12,'4|12'),(95,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,13,'4|13'),(96,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,14,'default|4|14'),(97,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,15,'default|4|15'),(98,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,5,5,'5|5'),(99,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,5,6,'5|6'),(100,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,5,7,'5|7'),(101,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,5,8,'default|5|8'),(102,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,5,26,'5|26'),(103,'es',NULL,'<p>Las cejas son el marco del rostro, y con el Delineador de Cejas Perfectas Brow Pen de CyPlay, podr&aacute;s dise&ntilde;ar y rellenar tus cejas pelo a pelo con facilidad. Su punta retr&aacute;ctil es ideal para lograr cejas naturales y definidas en solo 2 pasos: &iexcl;Dise&ntilde;a y Rellena! &bull; Punta retr&aacute;ctil para un dise&ntilde;o y relleno preciso de las cejas. &bull; Ideal para un look natural en tus cejas. &bull; Cejas perfectas en dos simples pasos: Dise&ntilde;a y Rellena. Cantidad: 0.23 g / 0.008 oz. NSOC00579-22EC</p>',NULL,NULL,NULL,NULL,NULL,NULL,5,9,'es|5|9'),(104,'es',NULL,'<p>Las cejas son el marco del rostro, y con el Delineador de Cejas Perfectas Brow Pen de CyPlay, podr&aacute;s dise&ntilde;ar y rellenar tus cejas pelo a pelo con facilidad. Su punta retr&aacute;ctil es ideal para lograr cejas naturales y definidas en solo 2 pasos: &iexcl;Dise&ntilde;a y Rellena! &bull; Punta retr&aacute;ctil para un dise&ntilde;o y relleno preciso de las cejas. &bull; Ideal para un look natural en tus cejas. &bull; Cejas perfectas en dos simples pasos: Dise&ntilde;a y Rellena. Cantidad: 0.23 g / 0.008 oz. NSOC00579-22EC</p>',NULL,NULL,NULL,NULL,NULL,NULL,5,10,'es|5|10'),(105,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,5,19,'5|19'),(106,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,5,20,'5|20'),(107,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,5,22,'5|22'),(108,NULL,NULL,'DELINEADOR-PARA-CEJAS-BROWN-PEN',NULL,NULL,NULL,NULL,NULL,NULL,5,1,'5|1'),(109,'es',NULL,'Delineador de Cejas Brow Pen CyPlay',NULL,NULL,NULL,NULL,NULL,NULL,5,2,'es|5|2'),(110,'es',NULL,'delineador-de-cejas-brow-pen-cyplay',NULL,NULL,NULL,NULL,NULL,NULL,5,3,'es|5|3'),(111,NULL,NULL,'5',NULL,NULL,NULL,NULL,NULL,NULL,5,27,'5|27'),(112,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,5,28,'default|5|28'),(113,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,5,16,'es|5|16'),(114,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,5,17,'es|5|17'),(115,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,5,18,'es|5|18'),(116,NULL,NULL,NULL,NULL,NULL,10000.0000,NULL,NULL,NULL,5,11,'5|11'),(117,NULL,NULL,NULL,NULL,NULL,10000.0000,NULL,NULL,NULL,5,12,'5|12'),(118,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,13,'5|13'),(119,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,14,'default|5|14'),(120,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,15,'default|5|15'),(121,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,6,5,'6|5'),(122,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,6,6,'6|6'),(123,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,6,7,'6|7'),(124,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,6,8,'default|6|8'),(125,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,6,26,'6|26'),(126,'es',NULL,'<p>M&aacute;scara gel para cejas semi-permanente. Define, rellena y fija &iexcl;hasta por 48 horas!* Cejas perfectas todos los d&iacute;as gracias a su cepillo de alta precisi&oacute;n para todos los tipos de cejas. Capacidad: 4.3g /.14 oz NSOC19739-23CO</p>',NULL,NULL,NULL,NULL,NULL,NULL,6,9,'es|6|9'),(127,'es',NULL,'<p>M&aacute;scara gel para cejas semi-permanente. Define, rellena y fija &iexcl;hasta por 48 horas!* Cejas perfectas todos los d&iacute;as gracias a su cepillo de alta precisi&oacute;n para todos los tipos de cejas. Capacidad: 4.3g /.14 oz NSOC19739-23CO</p>',NULL,NULL,NULL,NULL,NULL,NULL,6,10,'es|6|10'),(128,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,6,19,'6|19'),(129,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,6,20,'6|20'),(130,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,6,22,'6|22'),(131,NULL,NULL,'MASCARA-TINT-BROWN-PRO',NULL,NULL,NULL,NULL,NULL,NULL,6,1,'6|1'),(132,'es',NULL,'Máscara en Gel para Cejas Tint Brow PRO',NULL,NULL,NULL,NULL,NULL,NULL,6,2,'es|6|2'),(133,'es',NULL,'mascara-en-gel-para-cejas-tint-brow-pro',NULL,NULL,NULL,NULL,NULL,NULL,6,3,'es|6|3'),(134,NULL,NULL,'6',NULL,NULL,NULL,NULL,NULL,NULL,6,27,'6|27'),(135,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,6,28,'default|6|28'),(136,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,6,16,'es|6|16'),(137,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,6,17,'es|6|17'),(138,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,6,18,'es|6|18'),(139,NULL,NULL,NULL,NULL,NULL,10000.0000,NULL,NULL,NULL,6,11,'6|11'),(140,NULL,NULL,NULL,NULL,NULL,10000.0000,NULL,NULL,NULL,6,12,'6|12'),(141,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,13,'6|13'),(142,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,14,'default|6|14'),(143,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,15,'default|6|15'),(144,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,7,5,'7|5'),(145,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,7,6,'7|6'),(146,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,7,7,'7|7'),(147,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,7,8,'default|7|8'),(148,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,7,26,'7|26'),(149,'es',NULL,'<p>Labial mate COLORFIX 24H. 24 horas de color* y suavidad, 100% mate &iexcl;sin retoques! . El labial #1 de &eacute;sika**. Su deliciosa sensaci&oacute;n y textura cremosa te dan comodidad todo el d&iacute;a. Capacidad: 2g /.07 oz NSOC04912-21CO.</p>',NULL,NULL,NULL,NULL,NULL,NULL,7,9,'es|7|9'),(150,'es',NULL,'<p>Labial mate COLORFIX 24H. 24 horas de color* y suavidad, 100% mate &iexcl;sin retoques! . El labial #1 de &eacute;sika**. Su deliciosa sensaci&oacute;n y textura cremosa te dan comodidad todo el d&iacute;a. Capacidad: 2g /.07 oz NSOC04912-21CO.</p>',NULL,NULL,NULL,NULL,NULL,NULL,7,10,'es|7|10'),(151,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,7,19,'7|19'),(152,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,7,20,'7|20'),(153,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,7,22,'7|22'),(154,NULL,NULL,'COLOR-FIX-24H',NULL,NULL,NULL,NULL,NULL,NULL,7,1,'7|1'),(155,'es',NULL,'Labial COLORFIX 24H',NULL,NULL,NULL,NULL,NULL,NULL,7,2,'es|7|2'),(156,'es',NULL,'labial-colorfix-24h',NULL,NULL,NULL,NULL,NULL,NULL,7,3,'es|7|3'),(157,NULL,NULL,'7',NULL,NULL,NULL,NULL,NULL,NULL,7,27,'7|27'),(158,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,7,28,'default|7|28'),(159,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,7,16,'es|7|16'),(160,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,7,17,'es|7|17'),(161,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,7,18,'es|7|18'),(162,NULL,NULL,NULL,NULL,NULL,5000.0000,NULL,NULL,NULL,7,11,'7|11'),(163,NULL,NULL,NULL,NULL,NULL,5000.0000,NULL,NULL,NULL,7,12,'7|12'),(164,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,13,'7|13'),(165,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,14,'default|7|14'),(166,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,15,'default|7|15'),(167,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,8,5,'8|5'),(168,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,8,6,'8|6'),(169,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,8,7,'8|7'),(170,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,8,8,'default|8|8'),(171,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,8,26,'8|26'),(172,'es',NULL,'<p>&iexcl;Magnetic Lash de Studio Look te da una mirada con poder MAGN&Eacute;TICO! Su tecnolog&iacute;a revolucionaria Smart Magnet con esferas magn&eacute;ticas(*) te brinda mirada magn&eacute;tica: 7 veces m&aacute;s largo, 6 veces m&aacute;s volumen y 5 m&aacute;s rizadas &iexcl;hasta por 24 horas(**)! Y cuenta con Vitamina B5 y aceite de arg&aacute;n que hidratan y fortalecen tus pesta&ntilde;as, desde la ra&iacute;z a la punta, dej&aacute;ndolas suaves y ligeras.</p>',NULL,NULL,NULL,NULL,NULL,NULL,8,9,'es|8|9'),(173,'es',NULL,'<p>&iexcl;Magnetic Lash de Studio Look te da una mirada con poder MAGN&Eacute;TICO! Su tecnolog&iacute;a revolucionaria Smart Magnet con esferas magn&eacute;ticas(*) te brinda mirada magn&eacute;tica: 7 veces m&aacute;s largo, 6 veces m&aacute;s volumen y 5 m&aacute;s rizadas &iexcl;hasta por 24 horas(**)! Y cuenta con Vitamina B5 y aceite de arg&aacute;n que hidratan y fortalecen tus pesta&ntilde;as, desde la ra&iacute;z a la punta, dej&aacute;ndolas suaves y ligeras.</p>',NULL,NULL,NULL,NULL,NULL,NULL,8,10,'es|8|10'),(174,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,8,19,'8|19'),(175,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,8,20,'8|20'),(176,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,8,22,'8|22'),(177,NULL,NULL,'MAGNETIC-SLASH',NULL,NULL,NULL,NULL,NULL,NULL,8,1,'8|1'),(178,'es',NULL,'Máscara de Pestañas Magnetic Lash Studio Look',NULL,NULL,NULL,NULL,NULL,NULL,8,2,'es|8|2'),(179,'es',NULL,'mascara-de-pestanas-magnetic-lash-studio-look',NULL,NULL,NULL,NULL,NULL,NULL,8,3,'es|8|3'),(180,NULL,NULL,'8',NULL,NULL,NULL,NULL,NULL,NULL,8,27,'8|27'),(181,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,8,28,'default|8|28'),(182,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,8,16,'es|8|16'),(183,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,8,17,'es|8|17'),(184,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,8,18,'es|8|18'),(185,NULL,NULL,NULL,NULL,NULL,7000.0000,NULL,NULL,NULL,8,11,'8|11'),(186,NULL,NULL,NULL,NULL,NULL,7000.0000,NULL,NULL,NULL,8,12,'8|12'),(187,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,13,'8|13'),(188,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,14,'default|8|14'),(189,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,15,'default|8|15'),(190,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,9,5,'9|5'),(191,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,9,6,'9|6'),(192,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,9,7,'9|7'),(193,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,9,8,'default|9|8'),(194,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,9,26,'9|26'),(195,'es',NULL,'<p>M&aacute;scara de pesta&ntilde;as Mega Full Size a prueba de agua. Logra unas pesta&ntilde;as con un LARGO INSUPERABLE Y M&Aacute;XIMO VOLUMEN: Hasta 10X m&aacute;s largo*. Mega Full Size es la #1 de &eacute;sika**. Tonos: negro, negro - marr&oacute;n y azul. Capacidad: 8 g. NSOC03233-20CO</p>',NULL,NULL,NULL,NULL,NULL,NULL,9,9,'es|9|9'),(196,'es',NULL,'<p>M&aacute;scara de pesta&ntilde;as Mega Full Size a prueba de agua. Logra unas pesta&ntilde;as con un LARGO INSUPERABLE Y M&Aacute;XIMO VOLUMEN: Hasta 10X m&aacute;s largo*. Mega Full Size es la #1 de &eacute;sika**. Tonos: negro, negro - marr&oacute;n y azul. Capacidad: 8 g. NSOC03233-20CO</p>',NULL,NULL,NULL,NULL,NULL,NULL,9,10,'es|9|10'),(197,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,9,19,'9|19'),(198,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,9,20,'9|20'),(199,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,9,22,'9|22'),(200,NULL,NULL,'MASCARA-EFECTO-LARGO',NULL,NULL,NULL,NULL,NULL,NULL,9,1,'9|1'),(201,'es',NULL,'Mega Full Size Máscara de Pestañas a Prueba de Agua',NULL,NULL,NULL,NULL,NULL,NULL,9,2,'es|9|2'),(202,'es',NULL,'mega-full-size-mascara-de-pestanas-a-prueba-de-agua',NULL,NULL,NULL,NULL,NULL,NULL,9,3,'es|9|3'),(203,NULL,NULL,'9',NULL,NULL,NULL,NULL,NULL,NULL,9,27,'9|27'),(204,NULL,'default',NULL,1,NULL,NULL,NULL,NULL,NULL,9,28,'default|9|28'),(205,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,9,16,'es|9|16'),(206,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,9,17,'es|9|17'),(207,'es',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,9,18,'es|9|18'),(208,NULL,NULL,NULL,NULL,NULL,6000.0000,NULL,NULL,NULL,9,11,'9|11'),(209,NULL,NULL,NULL,NULL,NULL,6000.0000,NULL,NULL,NULL,9,12,'9|12'),(210,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,13,'9|13'),(211,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,14,'default|9|14'),(212,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,15,'default|9|15');
/*!40000 ALTER TABLE `product_attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_option_products`
--

DROP TABLE IF EXISTS `product_bundle_option_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_bundle_option_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `product_bundle_option_id` int unsigned NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bundle_option_products_product_id_bundle_option_id_unique` (`product_id`,`product_bundle_option_id`),
  KEY `product_bundle_option_products_product_bundle_option_id_foreign` (`product_bundle_option_id`),
  CONSTRAINT `product_bundle_option_products_product_bundle_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_bundle_option_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_option_products`
--

LOCK TABLES `product_bundle_option_products` WRITE;
/*!40000 ALTER TABLE `product_bundle_option_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_option_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_option_translations`
--

DROP TABLE IF EXISTS `product_bundle_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_bundle_option_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_bundle_option_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_bundle_option_translations_option_id_locale_unique` (`product_bundle_option_id`,`locale`),
  UNIQUE KEY `bundle_option_translations_locale_label_bundle_option_id_unique` (`locale`,`label`,`product_bundle_option_id`),
  CONSTRAINT `product_bundle_option_translations_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_option_translations`
--

LOCK TABLES `product_bundle_option_translations` WRITE;
/*!40000 ALTER TABLE `product_bundle_option_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_options`
--

DROP TABLE IF EXISTS `product_bundle_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_bundle_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_bundle_options_product_id_foreign` (`product_id`),
  CONSTRAINT `product_bundle_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_options`
--

LOCK TABLES `product_bundle_options` WRITE;
/*!40000 ALTER TABLE `product_bundle_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `product_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  UNIQUE KEY `product_categories_product_id_category_id_unique` (`product_id`,`category_id`),
  KEY `product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (1,2),(3,2),(1,3),(3,3),(2,5),(4,5),(5,6),(6,6),(8,6),(9,6);
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_channels`
--

DROP TABLE IF EXISTS `product_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_channels` (
  `product_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  UNIQUE KEY `product_channels_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_channels_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_channels`
--

LOCK TABLES `product_channels` WRITE;
/*!40000 ALTER TABLE `product_channels` DISABLE KEYS */;
INSERT INTO `product_channels` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1);
/*!40000 ALTER TABLE `product_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_cross_sells`
--

DROP TABLE IF EXISTS `product_cross_sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_cross_sells` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  UNIQUE KEY `product_cross_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_cross_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_cross_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_cross_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_cross_sells`
--

LOCK TABLES `product_cross_sells` WRITE;
/*!40000 ALTER TABLE `product_cross_sells` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_cross_sells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_customer_group_prices`
--

DROP TABLE IF EXISTS `product_customer_group_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_customer_group_prices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `value_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_customer_group_prices_unique_id_unique` (`unique_id`),
  KEY `product_customer_group_prices_product_id_foreign` (`product_id`),
  KEY `product_customer_group_prices_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `product_customer_group_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_customer_group_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_customer_group_prices`
--

LOCK TABLES `product_customer_group_prices` WRITE;
/*!40000 ALTER TABLE `product_customer_group_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_customer_group_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_link_translations`
--

DROP TABLE IF EXISTS `product_downloadable_link_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_downloadable_link_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_downloadable_link_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `link_translations_link_id_foreign` (`product_downloadable_link_id`),
  CONSTRAINT `link_translations_link_id_foreign` FOREIGN KEY (`product_downloadable_link_id`) REFERENCES `product_downloadable_links` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_link_translations`
--

LOCK TABLES `product_downloadable_link_translations` WRITE;
/*!40000 ALTER TABLE `product_downloadable_link_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_link_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_links`
--

DROP TABLE IF EXISTS `product_downloadable_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_downloadable_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sample_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `downloads` int NOT NULL DEFAULT '0',
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_links_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_links_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_links`
--

LOCK TABLES `product_downloadable_links` WRITE;
/*!40000 ALTER TABLE `product_downloadable_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_sample_translations`
--

DROP TABLE IF EXISTS `product_downloadable_sample_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_downloadable_sample_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_downloadable_sample_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `sample_translations_sample_id_foreign` (`product_downloadable_sample_id`),
  CONSTRAINT `sample_translations_sample_id_foreign` FOREIGN KEY (`product_downloadable_sample_id`) REFERENCES `product_downloadable_samples` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_sample_translations`
--

LOCK TABLES `product_downloadable_sample_translations` WRITE;
/*!40000 ALTER TABLE `product_downloadable_sample_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_sample_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_samples`
--

DROP TABLE IF EXISTS `product_downloadable_samples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_downloadable_samples` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_samples_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_samples_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_samples`
--

LOCK TABLES `product_downloadable_samples` WRITE;
/*!40000 ALTER TABLE `product_downloadable_samples` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_samples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_flat`
--

DROP TABLE IF EXISTS `product_flat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_flat` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `url_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(12,4) DEFAULT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` date DEFAULT NULL,
  `special_price_to` date DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_family_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `visible_individually` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_flat_unique_index` (`product_id`,`channel`,`locale`),
  KEY `product_flat_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `product_flat_parent_id_foreign` (`parent_id`),
  CONSTRAINT `product_flat_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `product_flat_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_flat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_flat`
--

LOCK TABLES `product_flat` WRITE;
/*!40000 ALTER TABLE `product_flat` DISABLE KEYS */;
INSERT INTO `product_flat` VALUES (1,'DORSAY','simple','','Dorsay','<p>Perfume dorsay para hombre</p>','<p>Perfume dorsay para hombre</p>','dorsay',1,0,1,'','','',40000.0000,NULL,NULL,NULL,0.0000,'2024-11-02 10:41:00','es','default',1,1,'2024-11-12 19:01:51',NULL,1),(2,'AGU','simple','','Colonia Agú Fresca','<p>Colonia Fresca con aroma a hierbas arom&aacute;ticas y naranja de la l&iacute;nea Ag&uacute;. F&oacute;rmulas seguras y puras con extractos 100% de origen natural de la Colecci&oacute;n de Amor, tu l&iacute;nea cl&aacute;sica de siempre.</p>','<p>Colonia Fresca con aroma a hierbas arom&aacute;ticas y naranja de la l&iacute;nea Ag&uacute;. F&oacute;rmulas seguras y puras con extractos 100% de origen natural de la Colecci&oacute;n de Amor, tu l&iacute;nea cl&aacute;sica de siempre.</p>','colonia-agu-fresca',1,1,1,'','','',40000.0000,NULL,NULL,NULL,0.0000,'2024-11-02 10:51:58','es','default',1,2,'2024-11-12 18:18:59',NULL,1),(3,'NITRO','simple','','Nitro Edición Limitada','<p>Perfume nitro para hombre edici&oacute;n limitada</p>','<p>Perfume nitro para hombre edici&oacute;n limitada</p>','nitro-edicion-limitada',1,0,1,'','','',50000.0000,NULL,NULL,NULL,0.0000,'2024-11-02 10:55:19','es','default',1,3,'2024-11-12 19:02:02',NULL,1),(4,'CREMA-HUMECTANTE-DURAZNO-Y-COCO','simple','4','Crema Humectante Corporal Durazno & Coco Natural Care','<p>&bull; Crema corporal humectante que suaviza y revitaliza la piel. &bull; Es de r&aacute;pida absorci&oacute;n y tiene textura ligera. &bull; Libre de sulfatos. - Extracto de Durazno: Reconocido por su efecto nutritivo y suavizante que deja un aspecto saludable y suave en la piel. - Extracto de Coco: Reconocido por su alta cantidad de aceites y nutrientes con propiedades hidratantes y de protecci&oacute;n a la piel. *Prueba Instrumental de hidrataci&oacute;n, 2022, Brasil.</p>','<p>&bull; Crema corporal humectante que suaviza y revitaliza la piel. &bull; Es de r&aacute;pida absorci&oacute;n y tiene textura ligera. &bull; Libre de sulfatos. - Extracto de Durazno: Reconocido por su efecto nutritivo y suavizante que deja un aspecto saludable y suave en la piel. - Extracto de Coco: Reconocido por su alta cantidad de aceites y nutrientes con propiedades hidratantes y de protecci&oacute;n a la piel. *Prueba Instrumental de hidrataci&oacute;n, 2022, Brasil.</p>','crema-humectante-corporal-durazno-coco-natural-care',1,1,1,'','','',20000.0000,NULL,NULL,NULL,0.0000,'2024-11-12 18:32:20','es','default',1,4,'2024-11-12 18:35:21',NULL,1),(5,'DELINEADOR-PARA-CEJAS-BROWN-PEN','simple','5','Delineador de Cejas Brow Pen CyPlay','<p>Las cejas son el marco del rostro, y con el Delineador de Cejas Perfectas Brow Pen de CyPlay, podr&aacute;s dise&ntilde;ar y rellenar tus cejas pelo a pelo con facilidad. Su punta retr&aacute;ctil es ideal para lograr cejas naturales y definidas en solo 2 pasos: &iexcl;Dise&ntilde;a y Rellena! &bull; Punta retr&aacute;ctil para un dise&ntilde;o y relleno preciso de las cejas. &bull; Ideal para un look natural en tus cejas. &bull; Cejas perfectas en dos simples pasos: Dise&ntilde;a y Rellena. Cantidad: 0.23 g / 0.008 oz. NSOC00579-22EC</p>','<p>Las cejas son el marco del rostro, y con el Delineador de Cejas Perfectas Brow Pen de CyPlay, podr&aacute;s dise&ntilde;ar y rellenar tus cejas pelo a pelo con facilidad. Su punta retr&aacute;ctil es ideal para lograr cejas naturales y definidas en solo 2 pasos: &iexcl;Dise&ntilde;a y Rellena! &bull; Punta retr&aacute;ctil para un dise&ntilde;o y relleno preciso de las cejas. &bull; Ideal para un look natural en tus cejas. &bull; Cejas perfectas en dos simples pasos: Dise&ntilde;a y Rellena. Cantidad: 0.23 g / 0.008 oz. NSOC00579-22EC</p>','delineador-de-cejas-brow-pen-cyplay',1,1,1,'','','',10000.0000,NULL,NULL,NULL,0.0000,'2024-11-12 18:37:56','es','default',1,5,'2024-11-12 18:49:35',NULL,1),(6,'MASCARA-TINT-BROWN-PRO','simple','6','Máscara en Gel para Cejas Tint Brow PRO','<p>M&aacute;scara gel para cejas semi-permanente. Define, rellena y fija &iexcl;hasta por 48 horas!* Cejas perfectas todos los d&iacute;as gracias a su cepillo de alta precisi&oacute;n para todos los tipos de cejas. Capacidad: 4.3g /.14 oz NSOC19739-23CO</p>','<p>M&aacute;scara gel para cejas semi-permanente. Define, rellena y fija &iexcl;hasta por 48 horas!* Cejas perfectas todos los d&iacute;as gracias a su cepillo de alta precisi&oacute;n para todos los tipos de cejas. Capacidad: 4.3g /.14 oz NSOC19739-23CO</p>','mascara-en-gel-para-cejas-tint-brow-pro',1,1,1,'','','',10000.0000,NULL,NULL,NULL,0.0000,'2024-11-12 18:41:26','es','default',1,6,'2024-11-12 18:49:28',NULL,1),(7,'COLOR-FIX-24H','simple','7','Labial COLORFIX 24H','<p>Labial mate COLORFIX 24H. 24 horas de color* y suavidad, 100% mate &iexcl;sin retoques! . El labial #1 de &eacute;sika**. Su deliciosa sensaci&oacute;n y textura cremosa te dan comodidad todo el d&iacute;a. Capacidad: 2g /.07 oz NSOC04912-21CO.</p>','<p>Labial mate COLORFIX 24H. 24 horas de color* y suavidad, 100% mate &iexcl;sin retoques! . El labial #1 de &eacute;sika**. Su deliciosa sensaci&oacute;n y textura cremosa te dan comodidad todo el d&iacute;a. Capacidad: 2g /.07 oz NSOC04912-21CO.</p>','labial-colorfix-24h',1,1,1,'','','',5000.0000,NULL,NULL,NULL,0.0000,'2024-11-12 18:50:14','es','default',1,7,'2024-11-12 18:52:01',NULL,1),(8,'MAGNETIC-SLASH','simple','8','Máscara de Pestañas Magnetic Lash Studio Look','<p>&iexcl;Magnetic Lash de Studio Look te da una mirada con poder MAGN&Eacute;TICO! Su tecnolog&iacute;a revolucionaria Smart Magnet con esferas magn&eacute;ticas(*) te brinda mirada magn&eacute;tica: 7 veces m&aacute;s largo, 6 veces m&aacute;s volumen y 5 m&aacute;s rizadas &iexcl;hasta por 24 horas(**)! Y cuenta con Vitamina B5 y aceite de arg&aacute;n que hidratan y fortalecen tus pesta&ntilde;as, desde la ra&iacute;z a la punta, dej&aacute;ndolas suaves y ligeras.</p>','<p>&iexcl;Magnetic Lash de Studio Look te da una mirada con poder MAGN&Eacute;TICO! Su tecnolog&iacute;a revolucionaria Smart Magnet con esferas magn&eacute;ticas(*) te brinda mirada magn&eacute;tica: 7 veces m&aacute;s largo, 6 veces m&aacute;s volumen y 5 m&aacute;s rizadas &iexcl;hasta por 24 horas(**)! Y cuenta con Vitamina B5 y aceite de arg&aacute;n que hidratan y fortalecen tus pesta&ntilde;as, desde la ra&iacute;z a la punta, dej&aacute;ndolas suaves y ligeras.</p>','mascara-de-pestanas-magnetic-lash-studio-look',1,1,1,'','','',7000.0000,NULL,NULL,NULL,0.0000,'2024-11-12 18:54:24','es','default',1,8,'2024-11-12 18:55:33',NULL,1),(9,'MASCARA-EFECTO-LARGO','simple','9','Mega Full Size Máscara de Pestañas a Prueba de Agua','<p>M&aacute;scara de pesta&ntilde;as Mega Full Size a prueba de agua. Logra unas pesta&ntilde;as con un LARGO INSUPERABLE Y M&Aacute;XIMO VOLUMEN: Hasta 10X m&aacute;s largo*. Mega Full Size es la #1 de &eacute;sika**. Tonos: negro, negro - marr&oacute;n y azul. Capacidad: 8 g. NSOC03233-20CO</p>','<p>M&aacute;scara de pesta&ntilde;as Mega Full Size a prueba de agua. Logra unas pesta&ntilde;as con un LARGO INSUPERABLE Y M&Aacute;XIMO VOLUMEN: Hasta 10X m&aacute;s largo*. Mega Full Size es la #1 de &eacute;sika**. Tonos: negro, negro - marr&oacute;n y azul. Capacidad: 8 g. NSOC03233-20CO</p>','mega-full-size-mascara-de-pestanas-a-prueba-de-agua',1,1,1,'','','',6000.0000,NULL,NULL,NULL,0.0000,'2024-11-12 18:56:48','es','default',1,9,'2024-11-12 18:59:37',NULL,1);
/*!40000 ALTER TABLE `product_flat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_grouped_products`
--

DROP TABLE IF EXISTS `product_grouped_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_grouped_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `associated_product_id` int unsigned NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_grouped_products_product_id_associated_product_id_unique` (`product_id`,`associated_product_id`),
  KEY `product_grouped_products_associated_product_id_foreign` (`associated_product_id`),
  CONSTRAINT `product_grouped_products_associated_product_id_foreign` FOREIGN KEY (`associated_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_grouped_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_grouped_products`
--

LOCK TABLES `product_grouped_products` WRITE;
/*!40000 ALTER TABLE `product_grouped_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_grouped_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int unsigned NOT NULL,
  `position` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (5,'images','product/3/ux2oCGWWYaOdvKTnaga4yHniE3Pw1gHLasJ5noA6.webp',3,1),(6,'images','product/2/qZpaPLVmdUex53lTAm7HC0xTrqDB1bKv7ATXvhja.webp',2,1),(16,'images','product/1/l5dBctJpf2ipjx1S4XSA5Mc2kEyAXK8weja8kplI.webp',1,1),(17,'images','product/4/MS65ZQB3ks8aWYiDXRtUC8MIM8hCSpFAj4FZJSMy.webp',4,1),(18,'images','product/5/GITocQpo50HZH4FDsTsUWBpiDn16zY8yPHqcltCm.webp',5,1),(19,'images','product/6/k4BzKn0LuPpbnjR0htNUjCH8sPnI8GHLFBlJEtha.webp',6,1),(20,'images','product/7/jqM5YOgkX6ITIIXFMHm82kgspD2G2j0mLrM6tjpJ.webp',7,1),(21,'images','product/8/StbeyE3bOqGCkYBenlAulzWhjWJQDdyR3czNMLFt.webp',8,1),(22,'images','product/9/YrrSXRlIUULPE0yrDbWerHmhXW71lGvdPcVOjpBT.webp',9,1);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_inventories`
--

DROP TABLE IF EXISTS `product_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `vendor_id` int NOT NULL DEFAULT '0',
  `inventory_source_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_source_vendor_index_unique` (`product_id`,`inventory_source_id`,`vendor_id`),
  KEY `product_inventories_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `product_inventories_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventories`
--

LOCK TABLES `product_inventories` WRITE;
/*!40000 ALTER TABLE `product_inventories` DISABLE KEYS */;
INSERT INTO `product_inventories` VALUES (1,3,1,0,1),(2,3,3,0,1),(3,3,2,0,1),(4,0,4,0,1),(5,0,5,0,1),(6,0,6,0,1),(7,0,7,0,1),(8,0,8,0,1),(9,0,9,0,1);
/*!40000 ALTER TABLE `product_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_inventory_indices`
--

DROP TABLE IF EXISTS `product_inventory_indices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_inventory_indices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_inventory_indices_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_inventory_indices_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_inventory_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventory_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventory_indices`
--

LOCK TABLES `product_inventory_indices` WRITE;
/*!40000 ALTER TABLE `product_inventory_indices` DISABLE KEYS */;
INSERT INTO `product_inventory_indices` VALUES (1,2,1,1,NULL,'2024-11-06 01:12:28'),(2,3,3,1,NULL,NULL),(3,3,2,1,NULL,'2024-11-02 19:22:38'),(4,0,4,1,NULL,NULL),(5,0,5,1,NULL,NULL),(6,0,6,1,NULL,NULL),(7,0,7,1,NULL,NULL),(8,0,8,1,NULL,NULL),(9,0,9,1,NULL,NULL);
/*!40000 ALTER TABLE `product_inventory_indices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_ordered_inventories`
--

DROP TABLE IF EXISTS `product_ordered_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_ordered_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_ordered_inventories_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_ordered_inventories_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_ordered_inventories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_ordered_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_ordered_inventories`
--

LOCK TABLES `product_ordered_inventories` WRITE;
/*!40000 ALTER TABLE `product_ordered_inventories` DISABLE KEYS */;
INSERT INTO `product_ordered_inventories` VALUES (1,0,2,1),(2,1,1,1);
/*!40000 ALTER TABLE `product_ordered_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_price_indices`
--

DROP TABLE IF EXISTS `product_price_indices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_price_indices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned NOT NULL DEFAULT '1',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `regular_min_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `regular_max_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `price_indices_product_id_customer_group_id_channel_id_unique` (`product_id`,`customer_group_id`,`channel_id`),
  KEY `product_price_indices_channel_id_foreign` (`channel_id`),
  KEY `product_price_indices_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `product_price_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_price_indices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_price_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_price_indices`
--

LOCK TABLES `product_price_indices` WRITE;
/*!40000 ALTER TABLE `product_price_indices` DISABLE KEYS */;
INSERT INTO `product_price_indices` VALUES (1,1,1,1,40000.0000,40000.0000,40000.0000,40000.0000,NULL,'2024-11-08 23:37:39'),(2,1,2,1,40000.0000,40000.0000,40000.0000,40000.0000,NULL,'2024-11-08 23:37:39'),(3,1,3,1,40000.0000,40000.0000,40000.0000,40000.0000,NULL,'2024-11-08 23:37:39'),(4,3,1,1,50000.0000,50000.0000,50000.0000,50000.0000,NULL,NULL),(5,3,2,1,50000.0000,50000.0000,50000.0000,50000.0000,NULL,NULL),(6,3,3,1,50000.0000,50000.0000,50000.0000,50000.0000,NULL,NULL),(7,2,1,1,40000.0000,40000.0000,40000.0000,40000.0000,NULL,NULL),(8,2,2,1,40000.0000,40000.0000,40000.0000,40000.0000,NULL,NULL),(9,2,3,1,40000.0000,40000.0000,40000.0000,40000.0000,NULL,NULL),(10,4,1,1,20000.0000,20000.0000,20000.0000,20000.0000,NULL,NULL),(11,4,2,1,20000.0000,20000.0000,20000.0000,20000.0000,NULL,NULL),(12,4,3,1,20000.0000,20000.0000,20000.0000,20000.0000,NULL,NULL),(13,5,1,1,10000.0000,10000.0000,10000.0000,10000.0000,NULL,NULL),(14,5,2,1,10000.0000,10000.0000,10000.0000,10000.0000,NULL,NULL),(15,5,3,1,10000.0000,10000.0000,10000.0000,10000.0000,NULL,NULL),(16,6,1,1,10000.0000,10000.0000,10000.0000,10000.0000,NULL,NULL),(17,6,2,1,10000.0000,10000.0000,10000.0000,10000.0000,NULL,NULL),(18,6,3,1,10000.0000,10000.0000,10000.0000,10000.0000,NULL,NULL),(19,7,1,1,5000.0000,5000.0000,5000.0000,5000.0000,NULL,NULL),(20,7,2,1,5000.0000,5000.0000,5000.0000,5000.0000,NULL,NULL),(21,7,3,1,5000.0000,5000.0000,5000.0000,5000.0000,NULL,NULL),(22,8,1,1,7000.0000,7000.0000,7000.0000,7000.0000,NULL,NULL),(23,8,2,1,7000.0000,7000.0000,7000.0000,7000.0000,NULL,NULL),(24,8,3,1,7000.0000,7000.0000,7000.0000,7000.0000,NULL,NULL),(25,9,1,1,6000.0000,6000.0000,6000.0000,6000.0000,NULL,NULL),(26,9,2,1,6000.0000,6000.0000,6000.0000,6000.0000,NULL,NULL),(27,9,3,1,6000.0000,6000.0000,6000.0000,6000.0000,NULL,NULL);
/*!40000 ALTER TABLE `product_price_indices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_relations`
--

DROP TABLE IF EXISTS `product_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_relations` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  UNIQUE KEY `product_relations_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_relations_child_id_foreign` (`child_id`),
  CONSTRAINT `product_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_relations`
--

LOCK TABLES `product_relations` WRITE;
/*!40000 ALTER TABLE `product_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_review_attachments`
--

DROP TABLE IF EXISTS `product_review_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_review_attachments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `review_id` int unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'image',
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_review_images_review_id_foreign` (`review_id`),
  CONSTRAINT `product_review_images_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_review_attachments`
--

LOCK TABLES `product_review_attachments` WRITE;
/*!40000 ALTER TABLE `product_review_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_review_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_reviews_product_id_foreign` (`product_id`),
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reviews`
--

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_super_attributes`
--

DROP TABLE IF EXISTS `product_super_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_super_attributes` (
  `product_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  UNIQUE KEY `product_super_attributes_product_id_attribute_id_unique` (`product_id`,`attribute_id`),
  KEY `product_super_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_super_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `product_super_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_super_attributes`
--

LOCK TABLES `product_super_attributes` WRITE;
/*!40000 ALTER TABLE `product_super_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_super_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_up_sells`
--

DROP TABLE IF EXISTS `product_up_sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_up_sells` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  UNIQUE KEY `product_up_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_up_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_up_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_up_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_up_sells`
--

LOCK TABLES `product_up_sells` WRITE;
/*!40000 ALTER TABLE `product_up_sells` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_up_sells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_videos`
--

DROP TABLE IF EXISTS `product_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_videos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_videos_product_id_foreign` (`product_id`),
  CONSTRAINT `product_videos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_videos`
--

LOCK TABLES `product_videos` WRITE;
/*!40000 ALTER TABLE `product_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `attribute_family_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  KEY `products_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `products_parent_id_foreign` (`parent_id`),
  CONSTRAINT `products_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'DORSAY','simple',NULL,1,NULL,'2024-11-02 15:41:00','2024-11-12 23:19:11'),(2,'AGU','simple',NULL,1,NULL,'2024-11-02 15:51:58','2024-11-12 23:18:59'),(3,'NITRO','simple',NULL,1,NULL,'2024-11-02 15:55:19','2024-11-12 23:18:47'),(4,'CREMA-HUMECTANTE-DURAZNO-Y-COCO','simple',NULL,1,NULL,'2024-11-12 23:32:20','2024-11-12 23:32:20'),(5,'DELINEADOR-PARA-CEJAS-BROWN-PEN','simple',NULL,1,NULL,'2024-11-12 23:37:56','2024-11-12 23:37:56'),(6,'MASCARA-TINT-BROWN-PRO','simple',NULL,1,NULL,'2024-11-12 23:41:26','2024-11-12 23:41:26'),(7,'COLOR-FIX-24H','simple',NULL,1,NULL,'2024-11-12 23:50:14','2024-11-12 23:50:14'),(8,'MAGNETIC-SLASH','simple',NULL,1,NULL,'2024-11-12 23:54:24','2024-11-12 23:54:24'),(9,'MASCARA-EFECTO-LARGO','simple',NULL,1,NULL,'2024-11-12 23:56:48','2024-11-12 23:56:48');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_items`
--

DROP TABLE IF EXISTS `refund_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refund_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `refund_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_items_parent_id_foreign` (`parent_id`),
  KEY `refund_items_order_item_id_foreign` (`order_item_id`),
  KEY `refund_items_refund_id_foreign` (`refund_id`),
  CONSTRAINT `refund_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `refund_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_items`
--

LOCK TABLES `refund_items` WRITE;
/*!40000 ALTER TABLE `refund_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refunds`
--

DROP TABLE IF EXISTS `refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refunds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `order_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refunds_order_id_foreign` (`order_id`),
  CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refunds`
--

LOCK TABLES `refunds` WRITE;
/*!40000 ALTER TABLE `refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador','Los usuarios con este rol tendrán acceso a todo','all',NULL,NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_synonyms`
--

DROP TABLE IF EXISTS `search_synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_synonyms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_synonyms`
--

LOCK TABLES `search_synonyms` WRITE;
/*!40000 ALTER TABLE `search_synonyms` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_terms`
--

DROP TABLE IF EXISTS `search_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_terms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `results` int NOT NULL DEFAULT '0',
  `uses` int NOT NULL DEFAULT '0',
  `redirect_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_in_suggested_terms` tinyint(1) NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `search_terms_channel_id_foreign` (`channel_id`),
  CONSTRAINT `search_terms_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_terms`
--

LOCK TABLES `search_terms` WRITE;
/*!40000 ALTER TABLE `search_terms` DISABLE KEYS */;
INSERT INTO `search_terms` VALUES (1,'dors',1,1,NULL,0,'es',1,'2024-11-02 15:47:43','2024-11-02 15:47:43'),(2,'hombre',0,1,NULL,0,'es',1,'2024-11-02 15:59:51','2024-11-02 15:59:51'),(3,'perfume',0,1,NULL,0,'es',1,'2024-11-02 16:00:01','2024-11-02 16:00:01'),(4,'dorsay',1,1,NULL,0,'es',1,'2024-11-02 16:00:08','2024-11-02 16:00:08'),(5,'colonia',1,1,NULL,0,'es',1,'2024-11-02 21:48:12','2024-11-02 21:48:12');
/*!40000 ALTER TABLE `search_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment_items`
--

DROP TABLE IF EXISTS `shipment_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `base_price` decimal(12,4) DEFAULT '0.0000',
  `total` decimal(12,4) DEFAULT '0.0000',
  `base_total` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `shipment_id` int unsigned NOT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipment_items_shipment_id_foreign` (`shipment_id`),
  CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment_items`
--

LOCK TABLES `shipment_items` WRITE;
/*!40000 ALTER TABLE `shipment_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipment_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipments`
--

DROP TABLE IF EXISTS `shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` int DEFAULT NULL,
  `total_weight` int DEFAULT NULL,
  `carrier_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `track_number` text COLLATE utf8mb4_unicode_ci,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `customer_id` int unsigned DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned NOT NULL,
  `order_address_id` int unsigned DEFAULT NULL,
  `inventory_source_id` int unsigned DEFAULT NULL,
  `inventory_source_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipments_order_id_foreign` (`order_id`),
  KEY `shipments_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `shipments_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE SET NULL,
  CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitemaps`
--

DROP TABLE IF EXISTS `sitemaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitemaps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `generated_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitemaps`
--

LOCK TABLES `sitemaps` WRITE;
/*!40000 ALTER TABLE `sitemaps` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitemaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers_list`
--

DROP TABLE IF EXISTS `subscribers_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribers_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscribers_list_customer_id_foreign` (`customer_id`),
  KEY `subscribers_list_channel_id_foreign` (`channel_id`),
  CONSTRAINT `subscribers_list_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribers_list_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers_list`
--

LOCK TABLES `subscribers_list` WRITE;
/*!40000 ALTER TABLE `subscribers_list` DISABLE KEYS */;
INSERT INTO `subscribers_list` VALUES (1,'developerkevin32412@gmail.com',1,'67268113585de',NULL,1,'2024-11-02 19:44:19','2024-11-02 19:44:19');
/*!40000 ALTER TABLE `subscribers_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_categories`
--

DROP TABLE IF EXISTS `tax_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_categories_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_categories`
--

LOCK TABLES `tax_categories` WRITE;
/*!40000 ALTER TABLE `tax_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_categories_tax_rates`
--

DROP TABLE IF EXISTS `tax_categories_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_categories_tax_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tax_category_id` int unsigned NOT NULL,
  `tax_rate_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_map_index_unique` (`tax_category_id`,`tax_rate_id`),
  KEY `tax_categories_tax_rates_tax_rate_id_foreign` (`tax_rate_id`),
  CONSTRAINT `tax_categories_tax_rates_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tax_categories_tax_rates_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_categories_tax_rates`
--

LOCK TABLES `tax_categories_tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_categories_tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_categories_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_zip` tinyint(1) NOT NULL DEFAULT '0',
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_rates_identifier_unique` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rates`
--

LOCK TABLES `tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_customization_translations`
--

DROP TABLE IF EXISTS `theme_customization_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme_customization_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `theme_customization_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` json NOT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_customization_translations_theme_customization_id_foreign` (`theme_customization_id`),
  CONSTRAINT `theme_customization_translations_theme_customization_id_foreign` FOREIGN KEY (`theme_customization_id`) REFERENCES `theme_customizations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_customization_translations`
--

LOCK TABLES `theme_customization_translations` WRITE;
/*!40000 ALTER TABLE `theme_customization_translations` DISABLE KEYS */;
INSERT INTO `theme_customization_translations` VALUES (1,1,'es','{\"images\": [{\"link\": \"\", \"image\": \"storage/theme/1/f6ZWxqQOhFGKWoB2Qh2wcyQ06WjSzxo9STwF63p6.webp\", \"title\": \"Perfumes\"}]}'),(2,2,'es','{\"css\": \".home-offer h1 {display: block;font-weight: 500;text-align: center;font-size: 22px;font-family: DM Serif Display;background-color: #E8EDFE;padding-top: 20px;padding-bottom: 20px;}@media (max-width:768px){.home-offer h1 {font-size:18px;padding-top: 10px;padding-bottom: 10px;}@media (max-width:525px) {.home-offer h1 {font-size:14px;padding-top: 6px;padding-bottom: 6px;}}\", \"html\": \"<div class=\\\"home-offer\\\"><h1>¡Hasta un 40% DE DESCUENTO en tu primer pedido COMPRA AHORA!</h1></div>\"}'),(3,3,'es','{\"filters\": {\"sort\": \"asc\", \"limit\": \"2\", \"parent_id\": \"1\"}}'),(4,4,'es','{\"title\": \"Productos\", \"filters\": {\"new\": \"1\", \"sort\": \"created_at-desc\", \"limit\": \"12\"}}'),(5,5,'es','{\"css\": \".top-collection-container {overflow: hidden;}.top-collection-header {padding-left: 15px;padding-right: 15px;text-align: center;font-size: 70px;line-height: 90px;color: #060C3B;margin-top: 80px;}.top-collection-header h2 {max-width: 595px;margin-left: auto;margin-right: auto;font-family: DM Serif Display;}.top-collection-grid {display: flex;flex-wrap: wrap;gap: 32px;justify-content: center;margin-top: 60px;width: 100%;margin-right: auto;margin-left: auto;padding-right: 90px;padding-left: 90px;}.top-collection-card {position: relative;background: #f9fafb;overflow:hidden;border-radius:20px;}.top-collection-card img {border-radius: 16px;max-width: 100%;text-indent:-9999px;transition: transform 300ms ease;transform: scale(1);}.top-collection-card:hover img {transform: scale(1.05);transition: all 300ms ease;}.top-collection-card h3 {color: #060C3B;font-size: 30px;font-family: DM Serif Display;transform: translateX(-50%);width: max-content;left: 50%;bottom: 30px;position: absolute;margin: 0;font-weight: inherit;}@media not all and (min-width: 525px) {.top-collection-header {margin-top: 28px;font-size: 20px;line-height: 1.5;}.top-collection-grid {gap: 10px}}@media not all and (min-width: 768px) {.top-collection-header {margin-top: 30px;font-size: 28px;line-height: 3;}.top-collection-header h2 {line-height:2; margin-bottom:20px;} .top-collection-grid {gap: 14px}} @media not all and (min-width: 1024px) {.top-collection-grid {padding-left: 30px;padding-right: 30px;}}@media (max-width: 768px) {.top-collection-grid { row-gap:15px; column-gap:0px;justify-content: space-between;margin-top: 0px;} .top-collection-card{width:48%} .top-collection-card img {width:100%;} .top-collection-card h3 {font-size:24px; bottom: 16px;}}@media (max-width:520px) { .top-collection-grid{padding-left: 15px;padding-right: 15px;} .top-collection-card h3 {font-size:18px; bottom: 10px;}}\", \"html\": \"<div class=\\\"top-collection-container\\\"><div class=\\\"top-collection-header\\\"><h2>¡El juego con nuestras nuevas adiciones!</h2></div><div class=\\\"top-collection-grid container\\\"><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/RtTpZSKOYycHZ44YXiCNODA77zuh9f9M2aAtjYNj.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"¡El juego con nuestras nuevas adiciones!\\\"><h3>Nuestras Colecciones</h3></div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/i6BXelQrXsZnVYkZWuQtFUcnRGPyd8O612GHtqWU.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"¡El juego con nuestras nuevas adiciones!\\\"><h3>Nuestras Colecciones</h3></div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/5Ju62hsTlITMOKSDIR7t7SWM1oN1ATVqgiE5AClY.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"¡El juego con nuestras nuevas adiciones!\\\"><h3>Nuestras Colecciones</h3></div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/6JDvOTJ12z1rFc4cEYFIRiUO6Y7MYON3OwkAvWGO.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"¡El juego con nuestras nuevas adiciones!\\\"><h3>Nuestras Colecciones</h3></div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/TeIIwTSnQla8RN5ThLGqbQjQaWjXTWpoMsD2k6YR.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"¡El juego con nuestras nuevas adiciones!\\\"><h3>Nuestras Colecciones</h3></div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/bva2lhNTMxrhrt1pPUBMAjNvtHDTYHotpKNBxYGx.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"¡El juego con nuestras nuevas adiciones!\\\"><h3>Nuestras Colecciones</h3></div></div></div>\"}'),(6,6,'es','{\"css\": \".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}} @media (max-width:768px){.inline-col-wrapper .inline-col-image-wrapper img {width:100%;} .inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:28px !important;line-height:normal !important}} @media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:20px !important;} .inline-col-description{font-size:16px} .inline-col-wrapper{grid-gap:10px}}\", \"html\": \"<div class=\\\"section-gap bold-collections container\\\"> <div class=\\\"inline-col-wrapper\\\"> <div class=\\\"inline-col-image-wrapper\\\"> <img src=\\\"\\\" data-src=\\\"storage/theme/6/FrP2IAG2UvDy0Sf0pw50WIHtUmF09XCW0feM7gbR.webp\\\" class=\\\"lazy\\\" width=\\\"632\\\" height=\\\"510\\\" alt=\\\"¡Prepárate para nuestras nuevas Colecciones Audaces!\\\"> </div> <div class=\\\"inline-col-content-wrapper\\\"> <h2 class=\\\"inline-col-title\\\"> ¡Prepárate para nuestras nuevas Colecciones Audaces! </h2> <p class=\\\"inline-col-description\\\">¡Presentamos Nuestras Nuevas Colecciones Audaces! Eleva tu estilo con diseños atrevidos y declaraciones vibrantes. Explora patrones llamativos y colores audaces que redefinen tu armario. ¡Prepárate para abrazar lo extraordinario!</p> <button class=\\\"primary-button max-md:rounded-lg max-md:px-4 max-md:py-2.5 max-md:text-sm\\\">Ver Colecciones</button> </div> </div> </div>\"}'),(7,7,'es','{\"title\": \"Productos Destacados\", \"filters\": {\"sort\": \"name-asc\", \"limit\": \"12\", \"featured\": \"1\"}}'),(8,8,'es','{\"css\": \".section-game {overflow: hidden;}.section-title,.section-title h2{font-weight:400;font-family:DM Serif Display}.section-title{margin-top:80px;padding-left:15px;padding-right:15px;text-align:center;line-height:90px}.section-title h2{font-size:70px;color:#060c3b;max-width:595px;margin:auto}.collection-card-wrapper{display:flex;flex-wrap:wrap;justify-content:center;gap:30px}.collection-card-wrapper .single-collection-card{position:relative}.collection-card-wrapper .single-collection-card img{border-radius:16px;background-color:#f5f5f5;max-width:100%;height:auto;text-indent:-9999px}.collection-card-wrapper .single-collection-card .overlay-text{font-size:50px;font-weight:400;max-width:234px;font-style:italic;color:#060c3b;font-family:DM Serif Display;position:absolute;bottom:30px;left:30px;margin:0}@media (max-width:1024px){.section-title{padding:0 30px}}@media (max-width:991px){.collection-card-wrapper{flex-wrap:wrap}}@media (max-width:768px) {.collection-card-wrapper .single-collection-card .overlay-text{font-size:32px; bottom:20px}.section-title{margin-top:32px}.section-title h2{font-size:28px;line-height:normal}} @media (max-width:525px){.collection-card-wrapper .single-collection-card .overlay-text{font-size:18px; bottom:10px} .section-title{margin-top:28px}.section-title h2{font-size:20px;} .collection-card-wrapper{gap:10px; 15px; row-gap:15px; column-gap:0px;justify-content: space-between;margin-top: 15px;} .collection-card-wrapper .single-collection-card {width:48%;}}\", \"html\": \"<div class=\\\"section-game\\\"><div class=\\\"section-title\\\"> <h2>¡El juego con nuestras nuevas adiciones!</h2> </div> <div class=\\\"section-gap container\\\"> <div class=\\\"collection-card-wrapper\\\"> <div class=\\\"single-collection-card\\\"> <img src=\\\"\\\" data-src=\\\"storage/theme/8/VS2lnY6tYr1eBYWWL25aZ5xuOu80ctvrGjPLggLs.webp\\\" class=\\\"lazy\\\" width=\\\"615\\\" height=\\\"600\\\" alt=\\\"¡El juego con nuestras nuevas adiciones!\\\"> <h3 class=\\\"overlay-text\\\">Nuestras Colecciones</h3> </div> <div class=\\\"single-collection-card\\\"> <img src=\\\"\\\" data-src=\\\"storage/theme/8/der2S4IGGs74j4smsFYu2TQ9skKWnQT0rgJt320q.webp\\\" class=\\\"lazy\\\" width=\\\"615\\\" height=\\\"600\\\" alt=\\\"¡El juego con nuestras nuevas adiciones!\\\"> <h3 class=\\\"overlay-text\\\"> Nuestras Colecciones </h3> </div> </div> </div> </div>\"}'),(9,9,'es','{\"title\": \"Todos los Productos\", \"filters\": {\"sort\": \"name-asc\", \"limit\": \"12\"}}'),(10,10,'es','{\"css\": \".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}}@media (max-width:768px) {.inline-col-wrapper .inline-col-image-wrapper img {max-width:100%;}.inline-col-wrapper .inline-col-content-wrapper{max-width:100%;justify-content:center; text-align:center} .section-gap{padding:0 30px; gap:20px;margin-top:24px} .bold-collections{margin-top:32px;}} @media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper{gap:10px} .inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:20px;line-height:normal} .section-gap{padding:0 15px; gap:15px;margin-top:10px} .bold-collections{margin-top:28px;}  .inline-col-description{font-size:16px !important} .inline-col-wrapper{grid-gap:15px}\", \"html\": \"<div class=\\\"section-gap bold-collections container\\\"> <div class=\\\"inline-col-wrapper direction-rtl\\\"> <div class=\\\"inline-col-image-wrapper\\\"> <img src=\\\"\\\" data-src=\\\"storage/theme/10/MHXEJBZnlxwnEoRcMJpwA0KtOGRRC2NdauEgMEnK.webp\\\" class=\\\"lazy\\\" width=\\\"632\\\" height=\\\"510\\\" alt=\\\"¡Prepárate para nuestras nuevas Colecciones Audaces!\\\"> </div> <div class=\\\"inline-col-content-wrapper direction-ltr\\\"> <h2 class=\\\"inline-col-title\\\"> ¡Prepárate para nuestras nuevas Colecciones Audaces! </h2> <p class=\\\"inline-col-description\\\">¡Presentamos Nuestras Nuevas Colecciones Audaces! Eleva tu estilo con diseños atrevidos y declaraciones vibrantes. Explora patrones llamativos y colores audaces que redefinen tu armario. ¡Prepárate para abrazar lo extraordinario!</p> <button class=\\\"primary-button max-md:rounded-lg max-md:px-4 max-md:py-2.5 max-md:text-sm\\\">Ver Colecciones</button> </div> </div> </div>\"}'),(11,11,'es','{\"column_1\": [{\"url\": \"http://localhost/page/about-us\", \"title\": \"Acerca de Nosotros\", \"sort_order\": \"1\"}, {\"url\": \"http://localhost/contact-us\", \"title\": \"Contáctenos\", \"sort_order\": \"2\"}, {\"url\": \"http://localhost/page/customer-service\", \"title\": \"Servicio al Cliente\", \"sort_order\": \"3\"}, {\"url\": \"http://localhost/page/whats-new\", \"title\": \"Novedades\", \"sort_order\": \"4\"}, {\"url\": \"http://localhost/page/terms-of-use\", \"title\": \"Términos de Uso\", \"sort_order\": \"5\"}, {\"url\": \"http://localhost/page/terms-conditions\", \"title\": \"Términos y Condiciones\", \"sort_order\": \"6\"}], \"column_2\": [{\"url\": \"http://localhost/page/privacy-policy\", \"title\": \"Política de Privacidad\", \"sort_order\": \"1\"}, {\"url\": \"http://localhost/page/payment-policy\", \"title\": \"Política de Pago\", \"sort_order\": \"2\"}, {\"url\": \"http://localhost/page/shipping-policy\", \"title\": \"Política de Envío\", \"sort_order\": \"3\"}, {\"url\": \"http://localhost/page/refund-policy\", \"title\": \"Política de Devolución\", \"sort_order\": \"4\"}, {\"url\": \"http://localhost/page/return-policy\", \"title\": \"Política de Retorno\", \"sort_order\": \"5\"}]}'),(12,12,'es','{\"services\": [{\"title\": \"Envío gratuito\", \"description\": \"Envío gratuito en todos los pedidos\", \"service_icon\": \"icon-truck\"}, {\"title\": \"Reemplazo de producto\", \"description\": \"¡Reemplazo de producto sencillo disponible!\", \"service_icon\": \"icon-product\"}, {\"title\": \"Soporte 24/7\", \"description\": \"Soporte dedicado 24/7 por chat y correo electrónico\", \"service_icon\": \"icon-support\"}]}');
/*!40000 ALTER TABLE `theme_customization_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_customizations`
--

DROP TABLE IF EXISTS `theme_customizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme_customizations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `theme_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_customizations_channel_id_foreign` (`channel_id`),
  CONSTRAINT `theme_customizations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_customizations`
--

LOCK TABLES `theme_customizations` WRITE;
/*!40000 ALTER TABLE `theme_customizations` DISABLE KEYS */;
INSERT INTO `theme_customizations` VALUES (1,'default','image_carousel','Carrusel de Imágenes',1,0,1,'2024-11-02 12:48:21','2024-11-02 18:53:51'),(2,'default','static_content','Información de Oferta',2,0,1,'2024-11-02 12:48:21','2024-11-02 16:05:14'),(3,'default','category_carousel','Colecciones de Categorías',3,0,1,'2024-11-02 12:48:21','2024-11-02 19:04:07'),(4,'default','product_carousel','Productos',4,1,1,'2024-11-02 12:48:21','2024-11-02 19:03:07'),(5,'default','static_content','Mejores Colecciones',5,0,1,'2024-11-02 12:48:21','2024-11-02 16:02:36'),(6,'default','static_content','Colecciones Audaces',6,0,1,'2024-11-02 12:48:21','2024-11-02 16:02:28'),(7,'default','product_carousel','Colecciones Destacadas',7,0,1,'2024-11-02 12:48:21','2024-11-02 18:55:53'),(8,'default','static_content','Contenedor de Juegos',8,0,1,'2024-11-02 12:48:21','2024-11-02 16:02:01'),(9,'default','product_carousel','Todos los Productos',9,0,1,'2024-11-02 12:48:21','2024-11-02 18:56:15'),(10,'default','static_content','Colecciones Audaces',10,0,1,'2024-11-02 12:48:21','2024-11-02 16:01:39'),(11,'default','footer_links','Enlaces del Pie de Página',11,0,1,'2024-11-02 12:48:21','2024-11-02 20:37:16'),(12,'default','services_content','Contenido de Servicios',12,1,1,'2024-11-02 12:48:21','2024-11-02 19:47:19');
/*!40000 ALTER TABLE `theme_customizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_rewrites`
--

DROP TABLE IF EXISTS `url_rewrites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `url_rewrites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_rewrites`
--

LOCK TABLES `url_rewrites` WRITE;
/*!40000 ALTER TABLE `url_rewrites` DISABLE KEYS */;
INSERT INTO `url_rewrites` VALUES (1,'category','fragancias','perfumes','301','es','2024-11-02 15:28:15','2024-11-02 15:28:15'),(2,'product','copia-de-dorsay','nitro-edicion-limitada','301','es','2024-11-02 18:37:31','2024-11-02 18:37:31');
/*!40000 ALTER TABLE `url_rewrites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request` mediumtext COLLATE utf8mb4_unicode_ci,
  `url` mediumtext COLLATE utf8mb4_unicode_ci,
  `referer` mediumtext COLLATE utf8mb4_unicode_ci,
  `languages` text COLLATE utf8mb4_unicode_ci,
  `useragent` text COLLATE utf8mb4_unicode_ci,
  `headers` text COLLATE utf8mb4_unicode_ci,
  `device` text COLLATE utf8mb4_unicode_ci,
  `platform` text COLLATE utf8mb4_unicode_ci,
  `browser` text COLLATE utf8mb4_unicode_ci,
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitable_id` bigint unsigned DEFAULT NULL,
  `visitor_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitor_id` bigint unsigned DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `visits_visitable_type_visitable_id_index` (`visitable_type`,`visitable_id`),
  KEY `visits_visitor_type_visitor_id_index` (`visitor_type`,`visitor_id`),
  KEY `visits_channel_id_foreign` (`channel_id`),
  CONSTRAINT `visits_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES (1,'GET','[]','http://127.0.0.1:8000',NULL,'[\"es-us\",\"es-419\",\"es\"]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImxEcnJmcmpxaHNTM2dOUmd6Y2psMVE9PSIsInZhbHVlIjoiNk10dkMvT252bGdiVnJ3L2VGVGRKUTg1clZueU92TzhZUHNlekt2ejdzT3gvN2hSUkg0Y3NvSE1SZlhiSnkwekdNZlZ5ekJPZDNDckhmaXZnY3B1U0xpQ1lMNjlJNm1yLzBFd2k0dUswQzFybVV2dlhFTkJhcHNnR0pQRjJTcVUiLCJtYWMiOiI3OWZkNmY0ZmIwZDNhYzFiMGYwZWU4Y2M2YmE1NmFhYWM3MzcyOWMwZmQ3Njg5OWQ2YTczY2U1ZGQ4NmExOTUzIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Im93U3VRMmN4YkRWTFJML3FZd0NVbHc9PSIsInZhbHVlIjoibndCazFXWlhUeWJNd0J3SU52bDRRbmVsTkl0R2RQMlFwNlRicldRMnFRRExoMnZiTzc4V3VJMHpOeVpVb0k4ZksyZzQ0T1JBVXZjdXpQZGR3YTEwZ1RNK1dPb0g2RllyK3c1ZUR0SGpTcG1yVDRlUEV2amZEblZZakFLWHBFVHMiLCJtYWMiOiJlNTFmOTY0MDllOTJkYmY4ZjU1NTMyNWMzYmY0NDNjYjE2NjlmYTI5NzQxMTkyYmUzY2ZmMzczNGY1NmEwNDFkIiwidGFnIjoiIn0%3D\"]}','WebKit','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-02 14:27:47','2024-11-02 14:27:47'),(2,'GET','[]','http://127.0.0.1:8000/storage/theme/1/cKIJRBKYbJDYtwYknx95ZBRjf5KiD8bKBKUxDmZU.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlEzUmhiaTdLNjRaL0xZelcySGR1Smc9PSIsInZhbHVlIjoiSlRJQkJtK08zcU5BREtOY1NETGdabEprUkkwNGVuYjJWQWtERjNCQlNSbnp2WlNoS25nNUhUZGcraExwN0xTZzlrRVYyTHE5TDJaT0Q2UC94S1lLSFJ1cGJ2RzNTUUxNQ2EyMXgvT3R2K0tqWWNJVGViUnVTRUM4Z2YraWFNR0QiLCJtYWMiOiJjODIyNzM0NjQ2ODUxZTUwMzNjMDgxZDBiYTZkMGE4NjE3YjY2OTU0ODliMzY1OTU2MTEyMzgyZDkxNDc5MmMwIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IllxdFp3djVtR1pDNytGUXUzR3hSbVE9PSIsInZhbHVlIjoialNPZnJlTkRDQUZmV0k5SFdkQWlFZ1A0eWY4WEJKQXhqMGRQRDNaUFk4N2hOeUtCQ2UxUFk0Q21uejhkSHl2b3hFN2FteWdWTnVYU2ZKb0dobFBUZDRzdEo4MU1LYmJVR1lsOEdOMmtxbDk4a0xlZFFDTUVPQnNLVHNhM0RBNXIiLCJtYWMiOiJjMmY0ZjczYTU3MDkyYTBiMDdmYjc5ZGVhYzZjM2FkMDM1MTY1MTIxOWU2OTEwZmJlODBjMzVkZWUzYzdiNzViIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-02 15:14:19','2024-11-02 15:14:19'),(3,'GET','[]','http://127.0.0.1:8000/storage/theme/1/6INTNuzjVM3ToJT0UNV2RyEUQLTJl8avHbH1ptIr.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlEzUmhiaTdLNjRaL0xZelcySGR1Smc9PSIsInZhbHVlIjoiSlRJQkJtK08zcU5BREtOY1NETGdabEprUkkwNGVuYjJWQWtERjNCQlNSbnp2WlNoS25nNUhUZGcraExwN0xTZzlrRVYyTHE5TDJaT0Q2UC94S1lLSFJ1cGJ2RzNTUUxNQ2EyMXgvT3R2K0tqWWNJVGViUnVTRUM4Z2YraWFNR0QiLCJtYWMiOiJjODIyNzM0NjQ2ODUxZTUwMzNjMDgxZDBiYTZkMGE4NjE3YjY2OTU0ODliMzY1OTU2MTEyMzgyZDkxNDc5MmMwIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IllxdFp3djVtR1pDNytGUXUzR3hSbVE9PSIsInZhbHVlIjoialNPZnJlTkRDQUZmV0k5SFdkQWlFZ1A0eWY4WEJKQXhqMGRQRDNaUFk4N2hOeUtCQ2UxUFk0Q21uejhkSHl2b3hFN2FteWdWTnVYU2ZKb0dobFBUZDRzdEo4MU1LYmJVR1lsOEdOMmtxbDk4a0xlZFFDTUVPQnNLVHNhM0RBNXIiLCJtYWMiOiJjMmY0ZjczYTU3MDkyYTBiMDdmYjc5ZGVhYzZjM2FkMDM1MTY1MTIxOWU2OTEwZmJlODBjMzVkZWUzYzdiNzViIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-02 15:14:20','2024-11-02 15:14:20'),(4,'GET','[]','http://127.0.0.1:8000/storage/theme/1/7u8CAJSJEbo2ZntyZ0YesuX4sY0hcYO7bFDrtAXs.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlEzUmhiaTdLNjRaL0xZelcySGR1Smc9PSIsInZhbHVlIjoiSlRJQkJtK08zcU5BREtOY1NETGdabEprUkkwNGVuYjJWQWtERjNCQlNSbnp2WlNoS25nNUhUZGcraExwN0xTZzlrRVYyTHE5TDJaT0Q2UC94S1lLSFJ1cGJ2RzNTUUxNQ2EyMXgvT3R2K0tqWWNJVGViUnVTRUM4Z2YraWFNR0QiLCJtYWMiOiJjODIyNzM0NjQ2ODUxZTUwMzNjMDgxZDBiYTZkMGE4NjE3YjY2OTU0ODliMzY1OTU2MTEyMzgyZDkxNDc5MmMwIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IllxdFp3djVtR1pDNytGUXUzR3hSbVE9PSIsInZhbHVlIjoialNPZnJlTkRDQUZmV0k5SFdkQWlFZ1A0eWY4WEJKQXhqMGRQRDNaUFk4N2hOeUtCQ2UxUFk0Q21uejhkSHl2b3hFN2FteWdWTnVYU2ZKb0dobFBUZDRzdEo4MU1LYmJVR1lsOEdOMmtxbDk4a0xlZFFDTUVPQnNLVHNhM0RBNXIiLCJtYWMiOiJjMmY0ZjczYTU3MDkyYTBiMDdmYjc5ZGVhYzZjM2FkMDM1MTY1MTIxOWU2OTEwZmJlODBjMzVkZWUzYzdiNzViIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-02 15:14:20','2024-11-02 15:14:20'),(5,'GET','[]','http://127.0.0.1:8000/storage/theme/1/CMu5HkMstUHOGxjwT00ILTG0z1GnOLd8wpWVO5Nq.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlEzUmhiaTdLNjRaL0xZelcySGR1Smc9PSIsInZhbHVlIjoiSlRJQkJtK08zcU5BREtOY1NETGdabEprUkkwNGVuYjJWQWtERjNCQlNSbnp2WlNoS25nNUhUZGcraExwN0xTZzlrRVYyTHE5TDJaT0Q2UC94S1lLSFJ1cGJ2RzNTUUxNQ2EyMXgvT3R2K0tqWWNJVGViUnVTRUM4Z2YraWFNR0QiLCJtYWMiOiJjODIyNzM0NjQ2ODUxZTUwMzNjMDgxZDBiYTZkMGE4NjE3YjY2OTU0ODliMzY1OTU2MTEyMzgyZDkxNDc5MmMwIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IllxdFp3djVtR1pDNytGUXUzR3hSbVE9PSIsInZhbHVlIjoialNPZnJlTkRDQUZmV0k5SFdkQWlFZ1A0eWY4WEJKQXhqMGRQRDNaUFk4N2hOeUtCQ2UxUFk0Q21uejhkSHl2b3hFN2FteWdWTnVYU2ZKb0dobFBUZDRzdEo4MU1LYmJVR1lsOEdOMmtxbDk4a0xlZFFDTUVPQnNLVHNhM0RBNXIiLCJtYWMiOiJjMmY0ZjczYTU3MDkyYTBiMDdmYjc5ZGVhYzZjM2FkMDM1MTY1MTIxOWU2OTEwZmJlODBjMzVkZWUzYzdiNzViIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-02 15:14:20','2024-11-02 15:14:20'),(6,'GET','[]','http://127.0.0.1:8000/storage/theme/5/RtTpZSKOYycHZ44YXiCNODA77zuh9f9M2aAtjYNj.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IjlCditRVlFJa0x6Z29pV3Exc0p5SVE9PSIsInZhbHVlIjoiaGR6VkFZL3NISG4vZzZmVjhEY3NrNHo5aHJVQnBKaTZoMnI5NFE4UlFqK29YSnpCS3gwaFE0WXkxTXRxVFppem1UbGo2L21waVU1MU5QcEhPVGZwdWFjUDE2Z1BrS0xqemNmQ2w3UFVHS2Ztb3NjNWYzT0MyZVJDc3lSZlpKZUciLCJtYWMiOiI3OWY5YjQ5NTUyZjRjNzhjYmQyYzVmMDFlNDhmZjBhYWU5Yzg4ZmVhZTBmZjViNGUxMjZlMjUxZDRmNGZlNjViIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IjVFOG5JZUlTRk1FeGFIejg1Y3QxVGc9PSIsInZhbHVlIjoiVC9vTEJvSTdZUFM1TUtGczZqTWxSY0h0Wll0SmkvRGpSeEM5SDZEdkU3bXlQNFY4YWE0SmU5NHV4YTQ2Y2FoQjJrdVA2d3A2VmVleEZxeDNBd0VWT0JKLzA2ODNBR3ZBOEhSRks4dG80TEcrWFFjdktqZUFUNmpvVlgyNVkxMSsiLCJtYWMiOiJiYTUxNzY3ZTU1YjEzMjBkMWRjMTUxMjkwYWI3ZjYzMjU3NmI2ZDZmYjk0ZTNkMDUzZWU4YjJhMThiOTJiOGFkIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-02 15:46:51','2024-11-02 15:46:51'),(7,'GET','[]','http://127.0.0.1:8000/storage/theme/5/i6BXelQrXsZnVYkZWuQtFUcnRGPyd8O612GHtqWU.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IjlCditRVlFJa0x6Z29pV3Exc0p5SVE9PSIsInZhbHVlIjoiaGR6VkFZL3NISG4vZzZmVjhEY3NrNHo5aHJVQnBKaTZoMnI5NFE4UlFqK29YSnpCS3gwaFE0WXkxTXRxVFppem1UbGo2L21waVU1MU5QcEhPVGZwdWFjUDE2Z1BrS0xqemNmQ2w3UFVHS2Ztb3NjNWYzT0MyZVJDc3lSZlpKZUciLCJtYWMiOiI3OWY5YjQ5NTUyZjRjNzhjYmQyYzVmMDFlNDhmZjBhYWU5Yzg4ZmVhZTBmZjViNGUxMjZlMjUxZDRmNGZlNjViIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IjVFOG5JZUlTRk1FeGFIejg1Y3QxVGc9PSIsInZhbHVlIjoiVC9vTEJvSTdZUFM1TUtGczZqTWxSY0h0Wll0SmkvRGpSeEM5SDZEdkU3bXlQNFY4YWE0SmU5NHV4YTQ2Y2FoQjJrdVA2d3A2VmVleEZxeDNBd0VWT0JKLzA2ODNBR3ZBOEhSRks4dG80TEcrWFFjdktqZUFUNmpvVlgyNVkxMSsiLCJtYWMiOiJiYTUxNzY3ZTU1YjEzMjBkMWRjMTUxMjkwYWI3ZjYzMjU3NmI2ZDZmYjk0ZTNkMDUzZWU4YjJhMThiOTJiOGFkIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-02 15:46:51','2024-11-02 15:46:51'),(8,'GET','[]','http://127.0.0.1:8000/storage/theme/5/5Ju62hsTlITMOKSDIR7t7SWM1oN1ATVqgiE5AClY.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6InI5TTRJb2YxL29xVjlvaUpqN2Jla2c9PSIsInZhbHVlIjoiNHNvREJMdytJNmVFTWVUdGRkSHZhYWJGbG1sVGNzUHYzTjIrdkpXSjZNM2k1Y0QrV3F0V3BTQVNmNUZGN0hzblFMQlF1aXhBenlpYktreTAwMkFyT2FUeXBRUmdldXFKbEZBQUtwbzVJTjJBa0hBUFFxVm9HRVVadHZJYnp2ajMiLCJtYWMiOiJjZGRjMDBmNWQyMzQyZTIyMjgwZmExZjU5Njk2MzEwNzE4MWFlZGIzZTJiYjVjN2I2MWE2MDBhYTU5OGIxMjZiIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlhVQmtZcmtHQXl4bThEdzBJcEVCRWc9PSIsInZhbHVlIjoibFNCNVBQYVUwUEJneUROQlhUaFA0d3pYbDF2bGM0MGgyUDRxVnhreGtTanpxcVppTDV3WG9ncDZGNGgrMkhYNDBRTHEvRlJ4ZVl2TVdVYXVOYUhKdE5KV2R0MnNvbnhwV1BLWkVRZkI1RXg5aC91N0loaEpzbVhMUjNkM0Z0NGQiLCJtYWMiOiJkMDkzMTU5YjEyZTNhYTFhMTFlMGVmZDAzNGIwYWExZmYyY2JhOTliNDdmMDk2ZDc2YzI4MmY4ZTdlNDZiZGZjIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-02 15:46:52','2024-11-02 15:46:52'),(9,'GET','[]','http://127.0.0.1:8000/storage/theme/5/6JDvOTJ12z1rFc4cEYFIRiUO6Y7MYON3OwkAvWGO.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6InI5TTRJb2YxL29xVjlvaUpqN2Jla2c9PSIsInZhbHVlIjoiNHNvREJMdytJNmVFTWVUdGRkSHZhYWJGbG1sVGNzUHYzTjIrdkpXSjZNM2k1Y0QrV3F0V3BTQVNmNUZGN0hzblFMQlF1aXhBenlpYktreTAwMkFyT2FUeXBRUmdldXFKbEZBQUtwbzVJTjJBa0hBUFFxVm9HRVVadHZJYnp2ajMiLCJtYWMiOiJjZGRjMDBmNWQyMzQyZTIyMjgwZmExZjU5Njk2MzEwNzE4MWFlZGIzZTJiYjVjN2I2MWE2MDBhYTU5OGIxMjZiIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlhVQmtZcmtHQXl4bThEdzBJcEVCRWc9PSIsInZhbHVlIjoibFNCNVBQYVUwUEJneUROQlhUaFA0d3pYbDF2bGM0MGgyUDRxVnhreGtTanpxcVppTDV3WG9ncDZGNGgrMkhYNDBRTHEvRlJ4ZVl2TVdVYXVOYUhKdE5KV2R0MnNvbnhwV1BLWkVRZkI1RXg5aC91N0loaEpzbVhMUjNkM0Z0NGQiLCJtYWMiOiJkMDkzMTU5YjEyZTNhYTFhMTFlMGVmZDAzNGIwYWExZmYyY2JhOTliNDdmMDk2ZDc2YzI4MmY4ZTdlNDZiZGZjIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-02 15:46:52','2024-11-02 15:46:52'),(10,'GET','[]','http://127.0.0.1:8000/storage/theme/5/TeIIwTSnQla8RN5ThLGqbQjQaWjXTWpoMsD2k6YR.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IjNkRUhhSGo1clBMbFJTdTRHUEpMQWc9PSIsInZhbHVlIjoiMHZUandkRmpySER1ZmFaRkk4eWl3cGE3QTRuSVFGWGpnWWNuSERCT0MxaTE4cnJKT1dYajZiQlRHcEVwUHhYcDVmc1F0cHJ0QjFLR3JrN1JTVzF6ZTFWdzVZZkRUVFk4SlFJTnhsSHg2eUpsTFhObVZjUHZRQU4zSktxUzRHYmwiLCJtYWMiOiI4MDFjZTk0ZTRiNDllNWY3OTM5NDhiNDVmMDQ5Mjk1OTQ4NWUyYmQxZmM0NTIzOTA5NDVjN2Y0NmUyNWQ1NGM0IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImF1U3lJRmQyWmxIbUYreG02cGRrbWc9PSIsInZhbHVlIjoiVVpaNld6OG9KZmgvQ0hQaU0rcUxSMStsUnVTcGVQbyttb0xnKzR6QlFXOWMwOGJnMEtGblVFZVlJVGNoWnZKaFU3dnM1V0xxZk9VQ0xXUUhzNW1VMENXWVdVNnZWb2hPcm9tSTl1akdDYjZGQmcvSjI3TFZaZjFoUHBDOHZ1OU0iLCJtYWMiOiJhNzE2MWYyZGY5ZmQzNmEzYWE1NTFkN2NlNDRiODcxOTM3NjIyMzFlY2QzZDg4YTVjNTEyZGQyNzFiZWVlMDA1IiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-02 15:46:52','2024-11-02 15:46:52'),(11,'GET','[]','http://127.0.0.1:8000/storage/theme/5/bva2lhNTMxrhrt1pPUBMAjNvtHDTYHotpKNBxYGx.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IjNkRUhhSGo1clBMbFJTdTRHUEpMQWc9PSIsInZhbHVlIjoiMHZUandkRmpySER1ZmFaRkk4eWl3cGE3QTRuSVFGWGpnWWNuSERCT0MxaTE4cnJKT1dYajZiQlRHcEVwUHhYcDVmc1F0cHJ0QjFLR3JrN1JTVzF6ZTFWdzVZZkRUVFk4SlFJTnhsSHg2eUpsTFhObVZjUHZRQU4zSktxUzRHYmwiLCJtYWMiOiI4MDFjZTk0ZTRiNDllNWY3OTM5NDhiNDVmMDQ5Mjk1OTQ4NWUyYmQxZmM0NTIzOTA5NDVjN2Y0NmUyNWQ1NGM0IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImF1U3lJRmQyWmxIbUYreG02cGRrbWc9PSIsInZhbHVlIjoiVVpaNld6OG9KZmgvQ0hQaU0rcUxSMStsUnVTcGVQbyttb0xnKzR6QlFXOWMwOGJnMEtGblVFZVlJVGNoWnZKaFU3dnM1V0xxZk9VQ0xXUUhzNW1VMENXWVdVNnZWb2hPcm9tSTl1akdDYjZGQmcvSjI3TFZaZjFoUHBDOHZ1OU0iLCJtYWMiOiJhNzE2MWYyZGY5ZmQzNmEzYWE1NTFkN2NlNDRiODcxOTM3NjIyMzFlY2QzZDg4YTVjNTEyZGQyNzFiZWVlMDA1IiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-02 15:46:52','2024-11-02 15:46:52'),(12,'GET','[]','http://127.0.0.1:8000/storage/theme/6/FrP2IAG2UvDy0Sf0pw50WIHtUmF09XCW0feM7gbR.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImR3eHp0OTZhazlNeTR0WjFwY2htRXc9PSIsInZhbHVlIjoiNm80d0dVejJZM0tpNmFlQkxNODdIS0NKamRkdVRiTy95OG83Qk1qbTNFTEg2TzJXMmJxMFlheWtwY1JoU3FpMEhGY0ZIMDh1NWNacldBRVJJKytjdzQyTy9WamtXOVVpaDhDK3lHM1JDNVpyL285aCtIcnJzLzJKY1dIYWVUQUYiLCJtYWMiOiIwMTNhMzY5ZjM1NjgyNmY4OGVjYmMyNmQ0MTkzNzMwN2VmNzUxNjNjMGFmYzE1YTUxN2VhMzliNzU3YzA2Yzk5IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IldTb1hwVkVXM3BtNTYvN1N4MlBYanc9PSIsInZhbHVlIjoieDlRaVA2emxyWE9jQTkwY1ZyMGh3ZFpoWFU5MjZiYWpXdmZleFNwaWtBdVpTTE1HakZIVG9adXI1V29SZVZ2UzMrdElBUUtJMFdHVXNSbmFjTDN3dUVMaGdyY3BSUmFaTjZBVlNERVNDYXBHVVpBWGkxb09mME1McnlVYW1nNVIiLCJtYWMiOiJmMDdmMWMwMWU0YTliZGRlZDRjMTg0MmJhMDdiMjk3MTM4ZDI1Nzc1MmNiNjIxNWUwZDMyZThlOGM1ZjJjZjE0IiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-02 15:46:53','2024-11-02 15:46:53'),(13,'GET','[]','http://127.0.0.1:8000/storage/theme/8/VS2lnY6tYr1eBYWWL25aZ5xuOu80ctvrGjPLggLs.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImFUTEZIWUtZRGtOek5mdFJJUnJxWUE9PSIsInZhbHVlIjoid1cwVU9taHdyWVdQNkNsa3FqVk5HcUJpYVhxd3UreHlXNTRWajE0dW0vbVRhYnREWHFyRUNURG4vSTZ5L1hjN0QyVUV5VUlJYkRUSmhSd2ZrR3d4MlRUYnNXYmI0aGY3QjFSN3VDZGY1RGhsRVZPUHpQclV4cDRsR1VkYyt6eXMiLCJtYWMiOiI1OTNhM2NkYTc1NGE4MDI1YzU1YmNmMjVhY2I4YTJlM2UzNTk0YjQ0YzRiNWExYzAyOTIyODc3YmVkNjU5NTNhIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImZhYWEzVUNJK3ZKT0tqTStRVFFwd1E9PSIsInZhbHVlIjoiVklJdU1kWkZ3S045TnJxZGVDeDhTNjlOdzlNNTlFUVZEanBsZlNXWlVWZ0ZlbWFLbjBCa3NLUHE0d0xWeC9mY20yc2ZlZGxJSW5rNld3Z2o1dDVnaVFpMDZjalp5bEZpc2hGSzhxZlZTRjM5WUlhSVFmeTh4RXIzVmRoVU93eEkiLCJtYWMiOiI2ZjVmYjUxMWI5MWRkNjY5YThkNDMzZGZhOWQxZTRhNDk2MzkwOTRjYmRiYmJhMDEzZjAxODA2N2NiZjgwY2NjIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-02 15:46:53','2024-11-02 15:46:53'),(14,'GET','[]','http://127.0.0.1:8000/storage/theme/8/der2S4IGGs74j4smsFYu2TQ9skKWnQT0rgJt320q.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkVua2p4QU1wT1BLb0xlUmx6ZmpCS2c9PSIsInZhbHVlIjoiMzdKT055cEgyNGFKYUNPMU1HaDYvZm1hbllkbFgrQWNTSnhhUGNCZjFCTXR4UXhNdHArQXNCMUtUM1dNclJ0dzR2aklLUEVaUjdzeGtLMU9nM200bzF1Y05UeFVESVYxbUc2dklLaTlnZHM5N1p5ZGpGb1IvSUJRcmtyRDJzRWUiLCJtYWMiOiJmMDQ2ZjFiYWE3OGZlZGFhZDQ2ODlmZjcyMDg3NDc2MDQ4NzhkZDQxMjc5ZmYxYjIzYjY2Yzg5NWVmNGRlYTY0IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Iit1NitncXpsSStjU2syekVqOE94OHc9PSIsInZhbHVlIjoiY2tzdzc2Q2EyVEc1eEN2ejZKQkFHS0hVTFBSNjFUVXo0b09MMkZtZE50TlNPQWI3TlZTYmFhV1pJbGg2YWJKVGlmT1NiVXlZOE5GVUlsZ2ZnZ3JoS2JZRmtXU0ptdUR2WlV5WFJMdlBiM3Q1WXJUajJpQ2l6RHFzUjZZbjBNWnUiLCJtYWMiOiI2ZDg4MmViZDUzNWQwZjkwZWEwYmU4YTg0YmM2ZDM4NTkwM2JiOGI0ZWE0NzRjZjFlODg3NDM3MzQxNzQyZTUwIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-02 15:46:53','2024-11-02 15:46:53'),(15,'GET','[]','http://127.0.0.1:8000/storage/theme/10/MHXEJBZnlxwnEoRcMJpwA0KtOGRRC2NdauEgMEnK.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IitlVnlaZUVheTVFTTkramRLeUJoSEE9PSIsInZhbHVlIjoiN2hLS01JT215K29ETEhsTGNRUnpPb0RmMlpVUUNtZEJLN21uT2R3TWR0RW9ycktveXZCckR3SUY2cEVxWXY2bWVvdlRVLzNiUHdhdEVURVVJcGRybGNZaUI3cW9EdTJDN3ZONS9YK0pDZGt6SjlEY2ZYaFRQc1ZZR0FVeE44M3MiLCJtYWMiOiJjODQ2OGI3MGExNDVjMDkxNjQwYzNjYTVhMDA2YTMyN2U1M2MzNjFkZTVlY2U0MjUwZjVhNGYyOWNlOGM3YWZmIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IldSc1BRTXQzaXRKcTlhczliQ1A4bGc9PSIsInZhbHVlIjoiUm1NWmVLNGFTbU8ybUtxTlBvVkREMjhmbEdEU0lKNXdUV2l6Z1I5RWxVQXMrWUlCK1pjd0RCNnlIUG4rdFZLSkxldWhOV1dNRU5FenlHSkVyQ21EdTFMOHcrOFNuNjRxYktQVVptemRBb0VORjJhYW5hVmtFZEYwNVpTNjN3VFYiLCJtYWMiOiI0ODVmNDgzYTQwN2RjZDQ2NWIyYjAxNWI2Zjg4MGQ3ZWI5MTUzNzZkMjE0Y2QwNjA3Nzg3MGE3YTY2ZTcxZDI4IiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-02 15:46:54','2024-11-02 15:46:54'),(16,'GET','[]','http://127.0.0.1:8000/dorsay','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6Im9QK090RVlYZjk3T1VRYitzYWdycXc9PSIsInZhbHVlIjoib3Y2WVJxVEJoa09sTEZXcjM1c1pCNzlRa21sSEJTV2RGdG9XSStOL2d4Y3NoSWg1L0tQc2JQTk9weUNERktRbWJCUzZ2Wi9Rc1VEcHF3NXFLdDFnVTcvbTBTYzNYcVZPenhCWFl6SWdwRzRvRlZuYlZYWDVpL0ZrZldSSHJ6RXgiLCJtYWMiOiI5OGY0ODcwM2ZiMjY3ZjcxY2RmY2U4ZGUxNzJkNjBlY2U3OTA5YmUwM2QxNTk3NjdmMDliYmRjODFlOTdjYWM3IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Ik5ua2l1ZmNLWHBkK28zWCtSUHV3MWc9PSIsInZhbHVlIjoicmd6VnVuNG84MCtlTTMyWWxYM2hWd0c2YjlNYlYwS1JWbjRBTHh4d3dweDYvR2l2Y0VGK1FoMmVZLy9XM1BqSFBnTjNET3Bkd0dEc2xhdDVHWHlXYk1udVdDU0xYTktoZDNpdlhQMzU5dVR1UVNoazJOamJJcTRaanhiK1AxOTQiLCJtYWMiOiI3NGE3YmM2MGVhYTI3YTk0ZWJjMmM3OWM0ODkyNzk2NjRmYWJlYmJlZDU5YmMzMmU3ZGQ5MmMxMDE3ZGFjZWM0IiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',1,NULL,NULL,1,'2024-11-02 15:47:21','2024-11-02 15:47:21'),(17,'GET','[]','http://127.0.0.1:8000','http://127.0.0.1:8000/customer/login','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlRGWE9DVzRFVGE5eTZvQTRkZUQ0bXc9PSIsInZhbHVlIjoibEtibTcrT1g1TGdPUFVpYlMzSFFFK1pDQTcrUlh5YlBEWTRZSGV3TGlaNUxwTlJZb2JyMDJtaU42Ny9WRGNZMTV1andoK1B6QklEbTNDVjRNZXhmeEFFUjVnc0gwQkVrSXpnVHpVNHcvQkJ1UTQwc3AvVVZrcWd3UjNhYWZZV1kiLCJtYWMiOiI1OGUyZTQxNTQ0YmVlYjhiOThkOTY4MzI5YjUwYWY5ODcyNjliNWQyNzlhZGFhMDRiY2JkNzE4Y2UyNTdhMTY1IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IjVJM2IxZjJTS01CSWtwTThGK1lGT1E9PSIsInZhbHVlIjoiSC80ZnAvVGZwZ0Y5VEp4VzFhb1hOVHh6a1ZpMzFkK1NqbjFTbngvN2FtM3BLNkhZNDE2S203SkJVeWlzRXZZYVJvd1RRdzdYN2kxNDJFcWpaQVVueERidHUxdUM3bFRaRjM1K01LdzFsQ3hTeUIzYmdFb3pYZDI2TWZTT3BMTHEiLCJtYWMiOiI4MDE4MTgzNjMwZDJjYzFmNTBlNmU4NzZjZjU5ODBjMWRjYTZjYmRhMTlmNDQyMzY0MjJiOGYwMDA5ZDRlODA0IiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',1,1,'2024-11-02 15:58:15','2024-11-02 15:58:15'),(18,'GET','[]','http://127.0.0.1:8000/storage/theme/1/cKIJRBKYbJDYtwYknx95ZBRjf5KiD8bKBKUxDmZU.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkNSSjRZajU4S3ZrenZFUjFkYnRDL1E9PSIsInZhbHVlIjoiWG9JRUo4R2p3bzU3QWZEa3NQYkNMMHNZK0JwOVBtMFJZZW1kZzNzTkNlOW5tTFQzM0FuS1FCZi9ieCtqd25SMEl1b01USWFhWkYrZm9BUDVnSnRRRnpmbWZzNU9RMHlvbGZaRWpPT20rc2RVMm5vOGRxdDBZZGdkaW1USzJnSG4iLCJtYWMiOiIxMWQzZDI4YTA1NDI1OTZmM2U2OWY0NDMyMmYyNmI5Y2IwYzc1ZTAwYWUyODcyMzI0OGJiYWM4ZWEyYTk3YzAzIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImJXZXdUdXhZNFYyU1JWZHNobmRLcWc9PSIsInZhbHVlIjoiTXlNMDVjYjY1Y2ZmU2xMWDliZytvZnA4V1U0ZEJEMzZJd3o0K0UxbmRZZitvUDRxcC94RjBBc2t1ZG9EdVhsZmNINk50N3RpbDgxRDJDZmdvN0Vzc1cxdUdFeThDY05nSGVEcDh3NXNwNzQxazhGQzVJQ0xFV0x1YU93NXZ1L1YiLCJtYWMiOiI2NjY1MmU2NTQ3YjA4NzBiOGVkMmVmYmFiMWRlYmJmM2RkNzFkY2Q1OTY4MDQ0M2M1ZjRjODc3MWRlMTE2ZGZjIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',1,1,'2024-11-02 15:58:17','2024-11-02 15:58:17'),(19,'GET','[]','http://127.0.0.1:8000/storage/theme/1/6INTNuzjVM3ToJT0UNV2RyEUQLTJl8avHbH1ptIr.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkNSSjRZajU4S3ZrenZFUjFkYnRDL1E9PSIsInZhbHVlIjoiWG9JRUo4R2p3bzU3QWZEa3NQYkNMMHNZK0JwOVBtMFJZZW1kZzNzTkNlOW5tTFQzM0FuS1FCZi9ieCtqd25SMEl1b01USWFhWkYrZm9BUDVnSnRRRnpmbWZzNU9RMHlvbGZaRWpPT20rc2RVMm5vOGRxdDBZZGdkaW1USzJnSG4iLCJtYWMiOiIxMWQzZDI4YTA1NDI1OTZmM2U2OWY0NDMyMmYyNmI5Y2IwYzc1ZTAwYWUyODcyMzI0OGJiYWM4ZWEyYTk3YzAzIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImJXZXdUdXhZNFYyU1JWZHNobmRLcWc9PSIsInZhbHVlIjoiTXlNMDVjYjY1Y2ZmU2xMWDliZytvZnA4V1U0ZEJEMzZJd3o0K0UxbmRZZitvUDRxcC94RjBBc2t1ZG9EdVhsZmNINk50N3RpbDgxRDJDZmdvN0Vzc1cxdUdFeThDY05nSGVEcDh3NXNwNzQxazhGQzVJQ0xFV0x1YU93NXZ1L1YiLCJtYWMiOiI2NjY1MmU2NTQ3YjA4NzBiOGVkMmVmYmFiMWRlYmJmM2RkNzFkY2Q1OTY4MDQ0M2M1ZjRjODc3MWRlMTE2ZGZjIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',1,1,'2024-11-02 15:58:17','2024-11-02 15:58:17'),(20,'GET','[]','http://127.0.0.1:8000/storage/theme/1/7u8CAJSJEbo2ZntyZ0YesuX4sY0hcYO7bFDrtAXs.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkNSSjRZajU4S3ZrenZFUjFkYnRDL1E9PSIsInZhbHVlIjoiWG9JRUo4R2p3bzU3QWZEa3NQYkNMMHNZK0JwOVBtMFJZZW1kZzNzTkNlOW5tTFQzM0FuS1FCZi9ieCtqd25SMEl1b01USWFhWkYrZm9BUDVnSnRRRnpmbWZzNU9RMHlvbGZaRWpPT20rc2RVMm5vOGRxdDBZZGdkaW1USzJnSG4iLCJtYWMiOiIxMWQzZDI4YTA1NDI1OTZmM2U2OWY0NDMyMmYyNmI5Y2IwYzc1ZTAwYWUyODcyMzI0OGJiYWM4ZWEyYTk3YzAzIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImJXZXdUdXhZNFYyU1JWZHNobmRLcWc9PSIsInZhbHVlIjoiTXlNMDVjYjY1Y2ZmU2xMWDliZytvZnA4V1U0ZEJEMzZJd3o0K0UxbmRZZitvUDRxcC94RjBBc2t1ZG9EdVhsZmNINk50N3RpbDgxRDJDZmdvN0Vzc1cxdUdFeThDY05nSGVEcDh3NXNwNzQxazhGQzVJQ0xFV0x1YU93NXZ1L1YiLCJtYWMiOiI2NjY1MmU2NTQ3YjA4NzBiOGVkMmVmYmFiMWRlYmJmM2RkNzFkY2Q1OTY4MDQ0M2M1ZjRjODc3MWRlMTE2ZGZjIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',1,1,'2024-11-02 15:58:17','2024-11-02 15:58:17'),(21,'GET','[]','http://127.0.0.1:8000/storage/theme/1/CMu5HkMstUHOGxjwT00ILTG0z1GnOLd8wpWVO5Nq.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkNSSjRZajU4S3ZrenZFUjFkYnRDL1E9PSIsInZhbHVlIjoiWG9JRUo4R2p3bzU3QWZEa3NQYkNMMHNZK0JwOVBtMFJZZW1kZzNzTkNlOW5tTFQzM0FuS1FCZi9ieCtqd25SMEl1b01USWFhWkYrZm9BUDVnSnRRRnpmbWZzNU9RMHlvbGZaRWpPT20rc2RVMm5vOGRxdDBZZGdkaW1USzJnSG4iLCJtYWMiOiIxMWQzZDI4YTA1NDI1OTZmM2U2OWY0NDMyMmYyNmI5Y2IwYzc1ZTAwYWUyODcyMzI0OGJiYWM4ZWEyYTk3YzAzIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImJXZXdUdXhZNFYyU1JWZHNobmRLcWc9PSIsInZhbHVlIjoiTXlNMDVjYjY1Y2ZmU2xMWDliZytvZnA4V1U0ZEJEMzZJd3o0K0UxbmRZZitvUDRxcC94RjBBc2t1ZG9EdVhsZmNINk50N3RpbDgxRDJDZmdvN0Vzc1cxdUdFeThDY05nSGVEcDh3NXNwNzQxazhGQzVJQ0xFV0x1YU93NXZ1L1YiLCJtYWMiOiI2NjY1MmU2NTQ3YjA4NzBiOGVkMmVmYmFiMWRlYmJmM2RkNzFkY2Q1OTY4MDQ0M2M1ZjRjODc3MWRlMTE2ZGZjIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',1,1,'2024-11-02 15:58:17','2024-11-02 15:58:17'),(22,'GET','[]','http://127.0.0.1:8000/storage/theme/5/RtTpZSKOYycHZ44YXiCNODA77zuh9f9M2aAtjYNj.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6Ik4zV3dEQUdwYjVpcU9mL2lpaThoc3c9PSIsInZhbHVlIjoiQXRYMVVZN0gwakVFT3Z1VDRDaE54YndrOXl2VWRDZ1Q5UEtTcW5JODZDbnBFRUFKUlhTbm5ra0Zramt5MUZTanJrRWhTQlhWQXVFVE5JZTJxajRCQTVwVUhsNVBkOGNFalRMZDdsVXlhSnlZUkNhV0k2bk40dzk2WGtPUzF2aXQiLCJtYWMiOiI3OWI5N2U1Y2E1Y2QwYzJlYzY3M2MxNzMzMzIwZGQ1ZTdiZDc0NzdlMTA2MTk4OWYzNWU2ZThjNjgyYjUxMzE4IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IkFQVDZLQjdpT1lid2pSWC9BK0xLRHc9PSIsInZhbHVlIjoiTnlBRTJzRHlJaVY0S1E0a2xYamxMM3Qrc1Y1b2RaYzROcmprdUU4M1o5RU5kNk9XQnh5enBBUW5GK1poTk9oSmRtMmJVYkRvVDhCTCtKRHpXSFFqOGgwekJQMlZSVmhna0JvRWhlYTZ5MHEyMDNZV3k5Qkd3UitEWm9JenJ1WWoiLCJtYWMiOiI5NDExZWNjZTdlMjM5MGNhOTI1OGI2ZmNhOGE5MWUxZmNlYTUzMjZkNjkyYjkyYzViZDAwODlmMGMyOGQwZDMxIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',1,1,'2024-11-02 15:58:18','2024-11-02 15:58:18'),(23,'GET','[]','http://127.0.0.1:8000/storage/theme/5/i6BXelQrXsZnVYkZWuQtFUcnRGPyd8O612GHtqWU.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6Ik4zV3dEQUdwYjVpcU9mL2lpaThoc3c9PSIsInZhbHVlIjoiQXRYMVVZN0gwakVFT3Z1VDRDaE54YndrOXl2VWRDZ1Q5UEtTcW5JODZDbnBFRUFKUlhTbm5ra0Zramt5MUZTanJrRWhTQlhWQXVFVE5JZTJxajRCQTVwVUhsNVBkOGNFalRMZDdsVXlhSnlZUkNhV0k2bk40dzk2WGtPUzF2aXQiLCJtYWMiOiI3OWI5N2U1Y2E1Y2QwYzJlYzY3M2MxNzMzMzIwZGQ1ZTdiZDc0NzdlMTA2MTk4OWYzNWU2ZThjNjgyYjUxMzE4IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IkFQVDZLQjdpT1lid2pSWC9BK0xLRHc9PSIsInZhbHVlIjoiTnlBRTJzRHlJaVY0S1E0a2xYamxMM3Qrc1Y1b2RaYzROcmprdUU4M1o5RU5kNk9XQnh5enBBUW5GK1poTk9oSmRtMmJVYkRvVDhCTCtKRHpXSFFqOGgwekJQMlZSVmhna0JvRWhlYTZ5MHEyMDNZV3k5Qkd3UitEWm9JenJ1WWoiLCJtYWMiOiI5NDExZWNjZTdlMjM5MGNhOTI1OGI2ZmNhOGE5MWUxZmNlYTUzMjZkNjkyYjkyYzViZDAwODlmMGMyOGQwZDMxIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',1,1,'2024-11-02 15:58:18','2024-11-02 15:58:18'),(24,'GET','[]','http://127.0.0.1:8000/storage/theme/5/5Ju62hsTlITMOKSDIR7t7SWM1oN1ATVqgiE5AClY.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkhGWTQrazBCdW9uNVdpc1pVYnc5Umc9PSIsInZhbHVlIjoicUprSGRrTzg5SlBFMnA2dnVJZEluSXdET0JBbTBRWUtBaUN2WDdJTUlDcGorZEM5NUs5TGc0YVdDeTFlR1ZNTnZXakIwMTY4aDJITVh4WC9Sajg3LzQwank4N0JFcnZKK2YyYTVnTWhLWFduQmFKblErLytJRVVoMy9BWEhHSGoiLCJtYWMiOiJmNzIzZWMxNGE0MzRlY2NlOTQ5MzQzNzkxMDY2NzUyZWI0YjJmNWE1ZWIyMzVmN2M0YzVhMGQ0NTU5YzY5Mjg1IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6InBSb2xDZXVkWU5LWjR6QWRJM25NWFE9PSIsInZhbHVlIjoiY1BlV05DZ09vQk44VXNuVGRvbVd0bEQwWSt2VUwzZjduc1hvYjRjeDRJdzBMN3B3TllVaEE5ZlpNdk80TEpCWjVnTmhOb3dyWkxZcUJFSWxtZmZIMjUzLzZuY3RqVnlxZC9XcEcrcWlCSkw0QnJtaFFuV3VGSktJaGliZExMUlIiLCJtYWMiOiI1ZmQ4MWYwZWZmODNhZDZjMDYyOGRhNGI4NmRlNDc5NDYzODU2NTJjOTkwNDIzZjMwM2ViYTAzNWJlMGM0NDc0IiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',1,1,'2024-11-02 16:01:06','2024-11-02 16:01:06'),(25,'GET','[]','http://127.0.0.1:8000/storage/theme/5/6JDvOTJ12z1rFc4cEYFIRiUO6Y7MYON3OwkAvWGO.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkhGWTQrazBCdW9uNVdpc1pVYnc5Umc9PSIsInZhbHVlIjoicUprSGRrTzg5SlBFMnA2dnVJZEluSXdET0JBbTBRWUtBaUN2WDdJTUlDcGorZEM5NUs5TGc0YVdDeTFlR1ZNTnZXakIwMTY4aDJITVh4WC9Sajg3LzQwank4N0JFcnZKK2YyYTVnTWhLWFduQmFKblErLytJRVVoMy9BWEhHSGoiLCJtYWMiOiJmNzIzZWMxNGE0MzRlY2NlOTQ5MzQzNzkxMDY2NzUyZWI0YjJmNWE1ZWIyMzVmN2M0YzVhMGQ0NTU5YzY5Mjg1IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6InBSb2xDZXVkWU5LWjR6QWRJM25NWFE9PSIsInZhbHVlIjoiY1BlV05DZ09vQk44VXNuVGRvbVd0bEQwWSt2VUwzZjduc1hvYjRjeDRJdzBMN3B3TllVaEE5ZlpNdk80TEpCWjVnTmhOb3dyWkxZcUJFSWxtZmZIMjUzLzZuY3RqVnlxZC9XcEcrcWlCSkw0QnJtaFFuV3VGSktJaGliZExMUlIiLCJtYWMiOiI1ZmQ4MWYwZWZmODNhZDZjMDYyOGRhNGI4NmRlNDc5NDYzODU2NTJjOTkwNDIzZjMwM2ViYTAzNWJlMGM0NDc0IiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',1,1,'2024-11-02 16:01:06','2024-11-02 16:01:06'),(26,'GET','[]','http://127.0.0.1:8000/storage/theme/5/TeIIwTSnQla8RN5ThLGqbQjQaWjXTWpoMsD2k6YR.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlBSY1VTclI1bWhTclJva2JFNFpYcVE9PSIsInZhbHVlIjoidkp2b0lIRjM3QXB1MzM5UUZWd3lZRjAzSmlsQkFEMUV5NjV1LzRrY0FKclBLN2ZtZEhuS0ZXRE5FZ1huZ1pBL2kxcnU4aVRYcTZQZm9vcVlsT2RlSHN5OUR3eU1XQlllQW96L2dhbERDYnV0VFNpYnhTeVBDTmd2WUNsV1RqSEkiLCJtYWMiOiJjZGU2ZjdiZTYzNWU2NTMxNDcxMDY1ZDRjYmQzNjQ0NTYzODZhNmY0YjRkMGZjNjBjMmJjZTg0ODQxMGUwN2UxIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IktiaFpmYUpLbHpPTk9mVWEzNVl0Nmc9PSIsInZhbHVlIjoiRXdEWFU2K0hVanc5akNpb3ZaYkxpQkpnOEV4YTdEazVNVnVHb1VrYjRaTXVkQXlPM3ZOZWZyS3F6Qjl1UDVsN2l4TzZBcmd3clVXck1hQ2VMM21RTDYzQWtzWk84VndnSjd4WjcwYkRlcm91dUlEdjFMRzBhR3JPMVlUYTZpRVgiLCJtYWMiOiI4MGQyYzA5ZWVkOTk2YjE3ZWQxMGI0OGNlYWI5NTUyMjIxY2YyYTM0ZDYzNTRlNTAwYzAzNDIwZDEwOTBkZWUyIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',1,1,'2024-11-02 16:01:07','2024-11-02 16:01:07'),(27,'GET','[]','http://127.0.0.1:8000/storage/theme/5/bva2lhNTMxrhrt1pPUBMAjNvtHDTYHotpKNBxYGx.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlBSY1VTclI1bWhTclJva2JFNFpYcVE9PSIsInZhbHVlIjoidkp2b0lIRjM3QXB1MzM5UUZWd3lZRjAzSmlsQkFEMUV5NjV1LzRrY0FKclBLN2ZtZEhuS0ZXRE5FZ1huZ1pBL2kxcnU4aVRYcTZQZm9vcVlsT2RlSHN5OUR3eU1XQlllQW96L2dhbERDYnV0VFNpYnhTeVBDTmd2WUNsV1RqSEkiLCJtYWMiOiJjZGU2ZjdiZTYzNWU2NTMxNDcxMDY1ZDRjYmQzNjQ0NTYzODZhNmY0YjRkMGZjNjBjMmJjZTg0ODQxMGUwN2UxIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IktiaFpmYUpLbHpPTk9mVWEzNVl0Nmc9PSIsInZhbHVlIjoiRXdEWFU2K0hVanc5akNpb3ZaYkxpQkpnOEV4YTdEazVNVnVHb1VrYjRaTXVkQXlPM3ZOZWZyS3F6Qjl1UDVsN2l4TzZBcmd3clVXck1hQ2VMM21RTDYzQWtzWk84VndnSjd4WjcwYkRlcm91dUlEdjFMRzBhR3JPMVlUYTZpRVgiLCJtYWMiOiI4MGQyYzA5ZWVkOTk2YjE3ZWQxMGI0OGNlYWI5NTUyMjIxY2YyYTM0ZDYzNTRlNTAwYzAzNDIwZDEwOTBkZWUyIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',1,1,'2024-11-02 16:01:07','2024-11-02 16:01:07'),(28,'GET','[]','http://127.0.0.1:8000/storage/theme/6/FrP2IAG2UvDy0Sf0pw50WIHtUmF09XCW0feM7gbR.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkVtRmJVNUt0RUJ5VUdOYVI5N2xTM2c9PSIsInZhbHVlIjoiWCtwNUxYNTdrcEgzWFg4YTZzMnpsS1JINWd5Q1NnV2RCMGkzTFpZRU5EeWYvOHlvNlExZ2xqNWJzVE5CYlBDMEp0c2dWekxFWlAwcTErWFM5dkdMUXJsZ3ZPRzFnTHdMVERHS20yV1hDcjFJcGlNVis1RUgyai9XMkNDRDhyWDciLCJtYWMiOiI2YWFiZGNiODNjNmVkYmY0MTYxYzdhZDY4ZWJlYTQwYjM1NjEzZDQxMzAwNmYyMWFhNDMxMGJmMWFhNzFiNzllIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImpualVnL3RZd1JUZ3kxVlEzeEZvSWc9PSIsInZhbHVlIjoiSStybVllYitzTk84ZS9Ka1RHRjE3TGtFTkRwMEJ3ZUVvR1YzTVFNa1NNR2doYi93RWlIYWhwMzlFL0xHdlBwVXpJTXdrZzRJZG80TG5NMkVhQ1p1TkVJRnc4WjBoM1RXbFVwZVUwUWxSaGtEYWtkbXJaRHdKNXFhZW96eEVNVS8iLCJtYWMiOiJiOGM0OWRhOGQwYmU1M2JiZDYxODJlMDM4ODdhYTljMWE1ZGU4MzM0N2ZjZmI2NWQwMzEyMTA3ZWE0ZTc3MTA3IiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',1,1,'2024-11-02 16:01:07','2024-11-02 16:01:07'),(29,'GET','[]','http://127.0.0.1:8000/storage/theme/8/VS2lnY6tYr1eBYWWL25aZ5xuOu80ctvrGjPLggLs.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImZMRWNMS0kxTzdoT2hyOUxIRm9GT2c9PSIsInZhbHVlIjoiVldtOFR0dFNWQWFTMDlQKzQ5dzBLNTVRRGQ5enRLYjR4MU5ieW1WUDJpQXd6SVNZS2gzMTVjZ1FLZUR3RlRTbE5YcG83S1dTZVd3NlhQNTkvWnJUa2hEc0pjZmtEN2cybzBDRHVZcHJ4djZ6bmd2Tm9CY25XRC9FdDdoaEs0YVciLCJtYWMiOiI4NmU4MWY2MjFjYjc5YjcxNDFhZjMyYzM0ZDg1NDI5Yzg0ZTJhZTZhOGQ2NWU1YzZlYzU5ZjQwMjRhZmVjNzZkIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6InFrQzh2bGFWWCtDcGgwQ2d6YWM1R0E9PSIsInZhbHVlIjoiaVdkMGRCZXc2OG1xa0x4WXFxYis2M2Q2YkhydDBvNDBVSFpyVmVnKzlGZjBuVHRXQUxkU2tobXN2dzlqUTlkUEw4SnBWQ1crN2JNalptdm41dUx3VTJJU1lyM1lkTGNQVDVLYXFOM1BxcE5tdFJKOS9WbW8vYlRBc1V0TmpZQXkiLCJtYWMiOiJkMmM3MGQzZmRhODdkYjBhOWZmNGVjYThmNTRjYTgzNDgxYTA2NzViZDY1MDFjNzdiNjNmNGUzYjU1YjAzYWRkIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',1,1,'2024-11-02 16:01:08','2024-11-02 16:01:08'),(30,'GET','[]','http://127.0.0.1:8000/storage/theme/8/der2S4IGGs74j4smsFYu2TQ9skKWnQT0rgJt320q.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkE0TWp4U0k0eXJpYW5YYnpleTRzYUE9PSIsInZhbHVlIjoidnNwQmw0dzdRZElDTVN4Y2cyV2VpWUxXTlh2U0NFK096U3JSN3V0dGVxRVZNRjNqM0NQMXBGY3lheWszMlcwRXNEemZiTkYxTUs4aGQ4L1krVTdKbWtsSi91MkN3UUZBQWhkS2tYUUEwMTZnNXBFVnRNbEdzQnkxZGNJeGRjSG8iLCJtYWMiOiJjNzc2ZTExMTBiYWIwZjczOTBmMTExY2U5ODg4MjE4YWU4N2M5MTQxZGRjNWQ3NDNhZDQ1YWFmZTdlMjA3NmU1IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IkJ2TUR6OVF3NjZUbmwzd1ZYNUFBVUE9PSIsInZhbHVlIjoiOXUzTkplT1RWT2ZRYi9QbzZKQnBKMTVESEJPZ2lVUEdzYm9TanN2RVJBQmF0MjlNUnlmM3Z0T3p3UUxseXh2Q1kzbGR4dXJlRCtnS0EvM0xlWmdab0lxTjNVZXorV00wNzQxb0pUKzZCSWhLNitmREFTQlR2TXdJdUZac09jdVkiLCJtYWMiOiJmYmE4ZjJjNDUzZTJlNTc3MjkwMThkYTFjMDZmODVhZGQ5OGE4MmZiMzYzZjFkYmQwOGE2YzdjNmVlN2JhOWFlIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',1,1,'2024-11-02 16:01:08','2024-11-02 16:01:08'),(31,'GET','[]','http://127.0.0.1:8000/storage/theme/10/MHXEJBZnlxwnEoRcMJpwA0KtOGRRC2NdauEgMEnK.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6Iml3ZGhtNWlDd1VMaXBTVC91K01BVmc9PSIsInZhbHVlIjoiVS91ODU5MVI2VTJZNXp2cVA0Ym42OElheXJCOHVReFovYVI2NTFyaGt1QmVIRVlCUm1iNXlSNHpNTjJJSzREdkZJYklpTHpEaDZPNTJKWXludDdDakdwSnNLUHBPSkliWjZVUHFLK3FsZm1YdjRwMktPQ1pVV1NsTll3S21qOXAiLCJtYWMiOiIwNGE4NTBmNmM2YjRjZTkyNzM0NDQyNjdlYTI4ZGIzMzkxODg5ZGM1OGIzOTQ2MjkwMDM0N2JmYjE4N2U4NDQxIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IkRkM09FQlFnVU5jN2NxOXBsWFc4TGc9PSIsInZhbHVlIjoiOTM2aVhMNjk2VnpHVHlkd1FkY3dFWnBVU1RKR2h1T3lENUhXZG96NUFLVzJsSENWK29kSGVKc05WTW5zU0xFa1VwaDBveCtZb1UrV0tFTjRzektSNVBUWmFYMlk5MitsU04xU0N1SUdpaE9QU1lkWDhxRFFVSWxNSFhJTkJCalEiLCJtYWMiOiJjMWZkZWNhZGVkMGRlYWE3ZjM5NjExZTIyNjZmZGIyNDU2MTE2YWNmNmU3ZDBmM2ZjNzcwMTJhZmNiYWFmOWNiIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',1,1,'2024-11-02 16:01:08','2024-11-02 16:01:08'),(32,'GET','[]','http://127.0.0.1:8000/perfumes','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkxTblk1Tk1zamJMQWdhU1N4NDlveVE9PSIsInZhbHVlIjoid1VnVjFOR2cra2lDelJEZkhPNTZET1BjQ0FQM3pPdlMxUTBDU0ZxZlBwb0xtc2wxVjJhT2VzeFcwa0gxUEsvOGQ1ZnNBd0UvWC9TdkhkbmdPY2RkelI3NTJtZS8rMnR4d0VHZXJYTHVVUjRiYU5ObzI1MlRzcXA0T1ZNaHQ3dnkiLCJtYWMiOiJiOGRhNGJlNjc2ZDllZjVkNzJhZDdhZmViYTU4OTA2MDk1NDcxYmQyZDlhNGJjYWRkODk1ZDBhMzc5MWIyYmUzIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlUyM1NJQkp6anNuUUtPOE9IMVM2S3c9PSIsInZhbHVlIjoiQ25SQkRjWW5BMEhheE9Kb1oyT1N1Mm9WWVdsUjl2M3Q3NXZmQ1hLekMzMjZ3OTYya3FraktqRjNhbk5jMGh4b2NZYXlwRS9Ldms2dGFFMU5VVnlZYlV4aU1CR2FBUVlBRjk3Y2I1Z1gwQUkwYnNFUzJuc1lYY0dLMGRCeVppMXYiLCJtYWMiOiJhNTI4NWQxYzU4NTRlNzRlODA4MDk0YWVjOGIwMDY4YzYxNTcyNzExMTgxZTBlMmFhODU1ODM1Y2Q0MDQxOTJkIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Category\\Models\\Category',2,'Webkul\\Customer\\Models\\Customer',1,1,'2024-11-02 16:20:37','2024-11-02 16:20:37'),(33,'GET','[]','http://127.0.0.1:8000/hombre','http://127.0.0.1:8000/perfumes','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/perfumes\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IjhUTkVsNU4yS0NwekJvbTFseWhRV2c9PSIsInZhbHVlIjoiQUtsZG4wSVEwTHF5LzlQWldDaHRvTWdCL0JodzhMc0JmMHJPdE01N0MyU1B6dlR5ZUFiWXh3VVYwOCsrcnJ4aHNRTkY4YjJMNXZDblU5TW9lb0Z5RzkxMk5WUVdGcEluQzVIblpYczhSbUx5aGo2VnM4a1RaT0grNGtTdFZsc2YiLCJtYWMiOiI3YjYyZjQzZWM4YTgyYWFkMDVhMjhkMjgzMTdmYjAyMDg3OWExYTBmMTQyMGYzNjM3ZGY3M2M2NGEwYjkyZTBmIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlZRRm1FSno4RGdBR21obE1aK2FETHc9PSIsInZhbHVlIjoiZ2JpeWpUL1g1bVlGMkVQRUV6VzBhaVhUb2kzRGtkSXRYOEE2bXVzejFpRzgyRitTb2twVGhiN2NTZ2t2VnBFQ0pnWFFOb3B4YTV4bUFaU3Izc2xOQkNVNFRyZXFLaGR1T3Z4MTVpZ1pvNDQxOHhFQ3l0QXg1akxDeGVBQmxuRnoiLCJtYWMiOiIyNWRkNmU4YTlmZjhhNTQxMzIxZGRjNGI5NGE3MGRhMjI5NGFjNjZiOWQ3N2M4YzdjMjk1MDc3NDMxYTdjZGYwIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Category\\Models\\Category',3,'Webkul\\Customer\\Models\\Customer',1,1,'2024-11-02 16:20:40','2024-11-02 16:20:40'),(34,'GET','[]','http://127.0.0.1:8000/hombre','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkJUOGVYd0NrZkh0aXR4aFU4dU1Kcnc9PSIsInZhbHVlIjoiS3I4YmFzU0h0THAxakN6amF3WS9WRXRmWGI4K1pSRlhOU3Jva0hTa2xORG43SlIzSXg1azhIOFcvUkZIYkcxc0Z1WVd4cEsyUDRBdXZFaHFVZTMxQS9CTVJqelpOcjhzUmxrQ0tPTndoUWZDUXdYTEdWbURheXViZmszdGxYeWoiLCJtYWMiOiI0YTZmM2ViMjQxMGJlYmYwZmNlOTk5NTRmOTlhMzMzZGRiNjMwZDRhZTJhNmRhODQzM2Q2N2VjMmRhNWY2ODIxIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlQ4NnllZVlBWmZPbGpHazAwK0hkTVE9PSIsInZhbHVlIjoiZ05lRGtVM2Vyek1HSWNlWk9ncElnZXd6bjB5d3NmOU5SQjQ2bExnMlJyV2dZSnFWN2NMdGFKRUlxWG9hdVlrTVpmYkh6cStYUUF2blk5dDMyanVKdnpuRGhtSU5xN2NKUXhNeXZnMXRJWk9oanp5bHdMekxxN2s1a0F4SnZaNzciLCJtYWMiOiIwZjk1OWFmZmMwMjc0MzU0YTZmYjE3MmIwMjkwMzdkZTAxODQ1Nzk0ODQ1MzQwMzE0ZjkwMzM2YzRiYTJjYzliIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Category\\Models\\Category',3,NULL,NULL,1,'2024-11-02 18:38:11','2024-11-02 18:38:11'),(35,'GET','[]','http://127.0.0.1:8000/storage/theme/1/OOe4otIxfQTXXvcyfsthAXbpE6wGN0BFVoNpXutF.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlV0dGp0R1p3YllIdGozN1U2N2NXa0E9PSIsInZhbHVlIjoieFBxOHErYWJoSGo1b3hHYk40NGs5ejQwT1VCQXI0aStTY3dPQWxpZmNtYm1BTE11aXJNZGZnNlFucWpsTCsxNU9ZVnBCVUNNdjNSRkZYdVdWSUdyenFha0Jid05QaUxjZ1d6R0crSVUrRElRSERTMS9kOXpMWlNQTUxNYXRUS3EiLCJtYWMiOiJhMTVmN2ExYTUwMTRiNDJhNzU3MGE4ZTEyZDU2MWFiZTc0NDM2NTYzZmYyNThlMjQ4MGNjZmUzZTFiMDMzMThjIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Im15cDNTdnEvNnhDQktRTzFTK3VPQnc9PSIsInZhbHVlIjoiVVdqK3V5OWI0ZmliMW9ycG1jemhmajJ2U0t3cHdDTU1xMzhBV2Q1SFFCa0w0cG91ejM5ZUpKZWpDY3A0Q3JKd0pvQjJxakk5SmJEaTh6WUxOeVRaWFkzU2NydE10QnYrTGFaS1BvZzBzWDVkaFpsQjArN1FYQndjOHM5NWxWNTEiLCJtYWMiOiI1NDhkZmZlZTk1N2U2ZWNhNWJjOThlYWU3MWYzYTg1ZTRjNDc1ZDA0Yjg5NmE1YmY3YTA2OWY1NWZhM2ZkMmE1IiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-02 18:52:25','2024-11-02 18:52:25'),(36,'GET','[]','http://127.0.0.1:8000/storage/theme/1/f6ZWxqQOhFGKWoB2Qh2wcyQ06WjSzxo9STwF63p6.webp','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImIyMUNEM0tPMkRNWkt4Nm9jQVJOOFE9PSIsInZhbHVlIjoiSlBNSWxCc09vQkI5WFRYUXJOY2MxMUI1L0JJQ1VRUGE5VXZJUm9sN21tUHN5Tkpud0srNWFNdWgybGZpQVhvQS9iTktXWXRZM09lQ0wvenpTUHJ5K2xTUnBwOEdvM2NGdzVWZlJOL2d0Zm41S2dRZUJmVkNTZ3VTeVNQQURWRWQiLCJtYWMiOiI2MTZiMTYxNGE1M2E3YzJjNGZkYzcyNTA0OTkzZjcwN2YwNmRjZWQ4OWE5NDlmNmEyYjYxNjc1ZDE5ZGYwZTNhIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6Im5IWUZEbDZiYTFWZWNWb1dlN3lCSVE9PSIsInZhbHVlIjoiZkp4M28zTDhwUnJLRjVZRW1Rc1VybktMSXFXQy82aWQwMDlHdGNUN2d5dit1d04xT0ZDODIvcXowb1JrNzB3Y1pjQUY0TU1WKzB2cUNBY3hiMXdtMFlwQlVSMC9iTy9ZVGhncW5JVlp2UFVLNHlURzhVS1g3bFlqK2N1NHY2YU8iLCJtYWMiOiI5MjkxZDY4YTFkMWY5ZjI2Y2JmOTc3ZDhiMTRiNDE5MzkzZTAxMTE2ZjA4MzVmNzFiM2I5ZmNlMTEzYmEwZWViIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-02 18:53:07','2024-11-02 18:53:07'),(37,'GET','[]','http://127.0.0.1:8000/perfumes','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkxTbklBN2lmY1pnMk00Mk9NVVk3OWc9PSIsInZhbHVlIjoiU0lIQ0VXOEpZeVpSS2FBdkhrZzAvQ0dhZ2hzNnJVcmhNVEJ6d1Jwb3c0TGV3Y2FWVVVWTXh5MHY0YUhtNUVURE8vNTc1K0hQbkp6a2tOcnR1UTRUTk5PL1ZRN0ZxNzRJTGlVaG5PZjRIdmd0U2JZT0FPVmtLSlkzYWUybGZNSlIiLCJtYWMiOiIyYTY5Y2I4YzRhMjViNDc5MjFlN2I3MGUxMzAzOGRjZTM5ODBhYjljYmIyYzVlNzA3YjE3YTUyODY4ZTgxOWMzIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IlFnSk1xU01SSWVKQlFPcWV6Y2hoM3c9PSIsInZhbHVlIjoiT1VMYjU1L1BLK2J6NXNjY0lKMk1qOENjcE1aSVhERjFWSTh5WnhtcEdNaHhZanBjemd4UmhjSG5QYXEzcms3bWorTFIrNXhBVlh0OUdYczM5UFFIMUxBb005NUdUdVUwQW5oVzNjUXNVOWlwVEkvVkhoc1IrdW1scHVxcnBxNVIiLCJtYWMiOiJlNTQ3YTZhYWNkYjVlNWM4NTY0MzBkZTEzMWFiNzdjMTY3ZWNhNGQ4MzcxOWE3MTEzODgwNWRhMDMyZmJhZDAwIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Category\\Models\\Category',2,NULL,NULL,1,'2024-11-02 19:01:42','2024-11-02 19:01:42'),(38,'GET','[]','http://127.0.0.1:8000','http://127.0.0.1:8000/customer/login','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImFCRkhMVG11RWRwRE9lQlNlbTZ4elE9PSIsInZhbHVlIjoicXJEbmFnWFNoeUF3Y0txWUF1Q2FackZKSTZaUS9nVVdjdzBlU0VKZ0VWQU1waEFXdkVlQkxmd3V6VjRNQnVnRFBxUUlkb2NCcm5QdDVkMEdQNGFXTVA5QjVnbVk2QVNvc3haSW9GaFBzZUhIc05rVjh2YnU3Y1A5Q2lDL1NyWnUiLCJtYWMiOiIwMjQ1OWI1NjExYTQ0NmM1M2IzNGI0NzllMjc4MzFiNDZhYjY5N2VlOTdlOGEzYzE5MzQzNTcyNDkwZTdhZmIxIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6IkVSLzNFT1BiNldiQW8yRldXRVlZM0E9PSIsInZhbHVlIjoiZS9Qc0ZGakdaQnkvNVZXMWFTRGZyQkdRVXlVT2F5SWp1aGhiOUJWQisvRXVvVjR4eXZZT3dVSEYwQlpJeUs2eVozQTBTWUtlakQ3VWVrWHhYMzROc2hZUTVGUG0wK05admJ6UlMyU2tNdDhWaXhjdGcxdmh6MmhnR0lTQXRJRXoiLCJtYWMiOiIwMGQ2ODU2YWIyZDE5YjYyMDEyMTlmZjYzNDY0MTZlNDJkMTI0YWI2YWZkYjk2NjZlNjJkM2ExYjM4ZGNkNjUzIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',2,1,'2024-11-02 19:05:29','2024-11-02 19:05:29'),(39,'GET','[]','http://127.0.0.1:8000/cuidado-personal','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IlJBNHBpUHhwbmlLYWphTCtHL05kc1E9PSIsInZhbHVlIjoiNjhJa0NCNzJMNlM5d2k0THpodFlpM0pNVTd1MG5UOUNpQk1wcTE2T1ZhVXdzSGV2N29GV1BjajlDNUtoc2E1QjVhTGlqU3c2ckQ5a0gxV3d0VzlYZVhLSVptZzloYUYvbWVMa2M2QjQzSjQ3TDgzM3J0V2pmalBsQW5QakRkbGciLCJtYWMiOiI5MjU3MDA4YTcxYjZkODhmMWNhZDQ3NjdmYTE3NGY1ZjJkMGE4NmU4YTBkMThmOWU0NDA4ZGUxNDBiYTZjNDRhIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6InFPUHFxOS9uOUlQdlhDekdLYTRiZ3c9PSIsInZhbHVlIjoiTTN6akRnR0dOK3hwdHlTRi9XZnk3UFZ6eitzZ0RkaFNVdThhRkpwMDlnOEZwWnNLbjduZXpFQUg2ZDJPbzBLQytDemFxQ25aRmNyWE9jSnFzZyt0ajEreWhGSTE5TzFkZkdaT3gxalB4VDdtcXFRYmszQW1CU0VoeGxnNDNBZkwiLCJtYWMiOiJkNGQ5YzI0ODVkYTFhNjg3OTAxNmFhMTAzNDg1MjdmNTRkNmIwMGNlMmNjMzAwOGIxM2QyNGRlZTQ5Y2M5Y2M5IiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Category\\Models\\Category',5,'Webkul\\Customer\\Models\\Customer',2,1,'2024-11-02 19:17:39','2024-11-02 19:17:39'),(40,'GET','[]','http://127.0.0.1:8000/perfumes','http://127.0.0.1:8000/cuidado-personal','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/cuidado-personal\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6IjJQZmJjZnZzMEJkL1pVQmJPL0lyb1E9PSIsInZhbHVlIjoiYkVDMFBVU2h3VzV3Q2pDcFAvS29vbG1rTXpwQXVXeHRIa2JaQ1FKZkk5bkRTblpCMXJhWHYyQWRTa0xsNnB6NGFkNkQ4YnNibEVnZk5aQ2FpUEV1aFJRVjU0ZFRCamMxYmNNbm1iUXE3TE9HU0YrM2wxcmdrQzhDOGZMcXlEK2QiLCJtYWMiOiIyNTk0MjBhZDgyODgzMWNiMmZiNTAxMWU3YWYyNzc1YTdkNjlhODZiZmZkNjkxZmJmNDZkNjU0YzBjZDQyYTk2IiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6InF0ak5KUHplZkV0QWZ2U1V3Ri9JK1E9PSIsInZhbHVlIjoiaUlFQ21LeUNaVlVieDlZRzROSGtOQlpHZ2FkNWY1SVI0NWZYMTVvdE9Tdk5oQW5tU0xKVFczeVlJV3pzTWE3SmNjT21acHhZWkVpdW1XbnorQmp4VnBTa1grengzSGVwZk1kUXFxemhJU1pJVUlLNVlseldQa0ZqZjY1VVJ1TTQiLCJtYWMiOiJhOTFhOGQ4MWQ5YWVlNmVjNDMzNDYyZGRiMmZjYTZmNmUxNjc5YTg1MzczZDZlY2FhYTU1YTcwZDEwZWMyNDMyIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Category\\Models\\Category',2,'Webkul\\Customer\\Models\\Customer',2,1,'2024-11-02 19:17:43','2024-11-02 19:17:43'),(41,'GET','[]','http://127.0.0.1:8000/colonia-agu-fresca','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; dark_mode=0; XSRF-TOKEN=eyJpdiI6InpWSjA4cVVwbDdPa2lqM0U0bldoRFE9PSIsInZhbHVlIjoiY0Y0eXUzOGgwMzZKOERRRmFmYzJkbFZqODdudDZ0QkVGZlVkbTdtSWRpUk8zUm84L2gyQjBnYVFQWDlhSFluWXVoRGk1aDhpM3hWUWxiNnJSUVBaZmR1WW1jZE80TFR3a1k2ZXV1eE9xRlJpSTRBbjZXN0J2Sm5BSFpCRXdkVW8iLCJtYWMiOiIxNmQ3ZDU4YWRhMjI5NDhjYjQzMmQzOGNhZWQzMGI3NjAwNTM5NjkyOTI3NmQwMzkwOTgxMmNjOWNkZTQwNDgzIiwidGFnIjoiIn0%3D; bagisto_session=eyJpdiI6ImN5YmN6VWNTcFhWRWNlVDMrcUhySnc9PSIsInZhbHVlIjoiOCt2MVR2cnY0YkhBcnAyNFJZS1pGcHRTNDN2ZE9zNGkrRXlRTDZGWnNyd0lSb2FqdVdzcnhVVnR4YWVQRWNCN0dPNEVDN1NjV3VOckNEM1FsWS9WTVV2V25Vcnpod0Y2SElWYzZaWXp0S0NhMGU1amRaTm5Fd3ZqWGl6Sll0bnYiLCJtYWMiOiJkOTRmOWE2MzQ4MTM5ZjlmZGZhZGRiYTVlMTAxMTYzMzczN2VhMWFjYjk0MDNjYmNlOGY3YWZiMTU4ZjU2ZGU5IiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',2,'Webkul\\Customer\\Models\\Customer',2,1,'2024-11-02 19:20:44','2024-11-02 19:20:44'),(42,'GET','[]','http://127.0.0.1:8000/cuidado-personal','http://127.0.0.1:8000/perfumes','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/perfumes\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkprQXhxQWxLYWhDeWppbGw1cVlqMXc9PSIsInZhbHVlIjoiUzF4L2p1eG8yblAwa2diY1ZnRTJlbkRVK2F4aStldWFNYitCOWNtTkxOZFFhRnY5RDZQbnNzenJLVm5kL1NJOGlGSmYvVXdBUEhVS0pKSWY3b2x2aVZYR3FsOG1FZGw0eXhXMGpOU3ltRFVJd21TK1ZDQnA4SHpKWnpybDZSSCsiLCJtYWMiOiIwNjE0ZmE2YjRkYmNlMzFlN2UzMzM5NTg3OWExYzUxMzllZjJjODc2M2I3Y2UxZmYwODQ0MzMwNTAxMmI5YjZkIiwidGFnIjoiIn0%3D; vezeli_session=eyJpdiI6ImkwZElkeDJyVzJsZTlhSCtXd2VNeWc9PSIsInZhbHVlIjoiN1R1Ynd6V0lsRk95dFZjdE9ib252MEZJdG1sM3oweUtKZmxrODhVNmRCWm91NFhIejFtVGRCTjd0M3pVNVYzbmdzSnp5eENheVZ0TGpaYkV3S0YvMEZ5Z1FEVVR5akxPWlF5a0o3RGVDb2pIcFc4M2hFdnBEQU1OY1pGZVJYc2wiLCJtYWMiOiI4MjU0NWY0ZDliNmQ5MTM4M2RlMTg0MWY1Y2RjYWE1MzA0NzNiYzg5N2RlZGZmY2MyNmUzODU3MWJlMWJhMGE4IiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Category\\Models\\Category',5,NULL,NULL,1,'2024-11-02 21:51:50','2024-11-02 21:51:50'),(43,'GET','[]','http://127.0.0.1:8000',NULL,'[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; vezeli_session=eyJpdiI6Ii9TV2IwL0lSN0pSbHJvVzN4Ym16UVE9PSIsInZhbHVlIjoiVGZlTmxGNGpTZW5yYnpGbVA5b09OU1IvaU5kTitBQlc3cGJ5V2VORk9jcFFHWC9yQmkzZlhTZk0yQ0FHWlkzbVpLZ3dGVWZSMFJ4aktmY2JwWDZLc040U0xLd3pUNm1PQnpPT29HbUhqTTN4QU5LQlZpR05aSzFJWkZINWZtaFoiLCJtYWMiOiJmNTQ2YjJmZDM1N2Q0ZjAzNTk3OGFkYjNjODU5NDMwNWNhY2VkYjM3NWFlYjA0MWI0NTE2YmJhMzVjOTUwOWFmIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-03 15:31:34','2024-11-03 15:31:34'),(44,'GET','[]','http://127.0.0.1:8000/perfumes','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; XSRF-TOKEN=eyJpdiI6InU3c0tDMkdIMSt5K1Z1NDhRZTZ6VlE9PSIsInZhbHVlIjoieXdWdEVFR2dWQ3dZRDRKdzFEdnNDdFZVSlRsWlhPYitPb0NkWHM2eTdBNjNmRDVzZjdtTUZvY2lteVdCdUhwQ0lGTDd1Y0RMUFBYbHMyQXNKaGpUd0xZOW03ejNzS1BjSVNQaHlTQjlCOGVFTjVCSFlqSWI5T0RaMkNnL2VTOUQiLCJtYWMiOiI4NDkyOWZiNjVkY2JkZjZjNDAyODViYTgzOTJhOWIwODdmNjI2NDU0YTljNjhlMWQxMjIxYzEzN2ZlM2NkM2RhIiwidGFnIjoiIn0%3D; vezeli_session=eyJpdiI6ImQxdnNVZ1lUaEU3cm45NXpxNTVhNFE9PSIsInZhbHVlIjoiQ3A5eU5NOFZtSDFQa3R2Ly9DMm1DUnEvOU1uZzJ6V3dOLzVncnQzSXh4VlVXUUtDaE9Cc0ViRjRJSUhYWXNiYjVFcENlVThtMVhYRmk1VFNRQnV3TWJrMzU3RTBwU25RakFPcU43d1JBUS9kbzVSV2hlV3k4MklGR2tpUVZKTkciLCJtYWMiOiIzZTk1Y2Y4NDhiZTY2NzYyNmI4Yzk2Yjg2YjQyOWEzMDUzZDJhZDkwNGNiNjIwOWM5YTgxNWFmYWQ3NTNkN2ExIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Category\\Models\\Category',2,NULL,NULL,1,'2024-11-03 15:32:23','2024-11-03 15:32:23'),(45,'GET','[]','http://127.0.0.1:8000/nitro-edicion-limitada','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImJ6YVFTaWNWeFM3MkNDR3NNZ0Y4aHc9PSIsInZhbHVlIjoiNk8zcHVWMFBnWVBSSUNORDN5NmVsRi9pWUlOdmNxalRDRnRKNGpLTVJKZVZoaXFNL0pLV29rQkpMM0tJck41Y0dlSnd6QlB0eFl1WFFmN1pQM09uWlQzUFlNVERZc3ErNERVTzhmNEFKQjAvOGx5TkpveXVneWM0Vi8reUZRKzQiLCJtYWMiOiI0MGVkYWRkMGM1Y2NhN2RmNzEyNDRlMDBkMDhiZDliMWRiY2Q3NzJhNjU3NDNmNTBmYjNkMzc0MzdlZGJiMjRjIiwidGFnIjoiIn0%3D; vezeli_session=eyJpdiI6ImlOZVFtSTV6dDVUMkljME9Hd2NMUkE9PSIsInZhbHVlIjoiamdWa0FqbnFpWVdkVmlwU2tqcmwxTk1oSHNFaG1GMkpRMVl0Y2UyeXZvNEo5UVhuODluTXorUzBqTDdWeE5nN3c3VTRvcHl2aFRicE5iZjdSTnVBWUVKNERuSWdtSTQrWkJQQ3pCc1NVVXRSVHR1bXRyNWc4YTN5UTlWYUxFakYiLCJtYWMiOiJiYTA4MzU4MDcwYmEwZGQwYmNkMjBhMWM2NTlkYTJlOGMxNjJkZDAzYjQxMzk2MWFiMTliODI0MDhmNTViNTNlIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',3,NULL,NULL,1,'2024-11-03 16:30:54','2024-11-03 16:30:54'),(46,'GET','[]','http://127.0.0.1:8000',NULL,'[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; vezeli_session=eyJpdiI6IlY3RjNsbStmWEVocUlKUkx4b1V2MVE9PSIsInZhbHVlIjoiL2JEQnZFTzI2RForSGJpYWlSUDJFdEhIMkxuK0tTckpteVlVUm1rQmNmSWg5b1hBVW01SDlXditmcnRieFA2U01qcCsyVGRUWkNVUlY0K0gwSGN6QU5KQVBaRDFkUXhXU1BaK29qamVuNkhKdGxWMklxbElLR0J0UWR6UFN1TVMiLCJtYWMiOiJjMGZlZjgxNmYyMThjMzQxNTU0YzRlNTNjNzNhYTdiYTk1ODBjN2Q3YzljN2JiMDliYzFjZGQzOGQzNTg1MmIxIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-05 22:58:40','2024-11-05 22:58:40'),(47,'GET','[]','http://127.0.0.1:8000/cuidado-personal','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; XSRF-TOKEN=eyJpdiI6InBlVDNQZGRoNHNYS2hEQzdoNTVQRWc9PSIsInZhbHVlIjoiWXJNM3paczdXeWVpanRxTGlQN2NNSlpKbkZiUFFQbHZjNTJNb091WWE3OCtoSUJEQ2VMa25QVUlHQ1RaYzJrNmxSamhwcU9mWVplZnI4bWlLeHN2bWZubm9xakE5UjN1ci9ta2hDUVZUS3FNNzRiYmFRTTFwd240TW9SMi9sZHEiLCJtYWMiOiJkN2YzMmVhNDIxNDY4NzUwM2MwZGY0NDY1NTdkYTRhYjlhZDgyMDJkNGI5MWIzODI0Zjg1MjZjZmM4MmEzMGE4IiwidGFnIjoiIn0%3D; vezeli_session=eyJpdiI6IlAwY0VBS2lENU13blh1bmlsNEVSM3c9PSIsInZhbHVlIjoiZ2ZDLzJxUGNvSjM3aHlPeFhVdkwyOWZvNFpDWTBjU3k4VEpzZzV2WUF5K2ZSVWMrT0Y4bUxEQkZzK3ZVUG5aaGNaVXhXYzdYbUxzbFc0bGF3ZFN1TWt5QWpnK1NMMnlhK0E0UDZ3QmJ4QXlGVWQ2K0ZZazlKbHlVd3lCRlhJdUIiLCJtYWMiOiJlZGY2MzdhMmFmOWFlMjA0MmU1Y2MwY2I5M2EwMDU4NDZmNWFlYTA1ZDZiYTdjYzg2OTIxYWRhNDI1ODg4MmM1IiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Category\\Models\\Category',5,NULL,NULL,1,'2024-11-05 23:25:09','2024-11-05 23:25:09'),(48,'GET','[]','http://127.0.0.1:8000/hombre','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkNxMjdSYXlKNjhpSi9USHNpWmh1ekE9PSIsInZhbHVlIjoiRis4dFAreHljREd3VVVQdERIa29PbkRENlMvczhUSjJlS1NENFRYWHZGZGtrUmFORmFRK2N4SmpFVTM0VE5DR254NjRMU3F3OG4rTHZUODdPWXRzR3IxM2QrVysrUmR1WWN3Q1JUVFh4aVJUT1BZRGErYndQTEU1L3BBMjF6b2EiLCJtYWMiOiIyNGYxMTkzNTE1NjJhNDkwNjJiZmY3NzFjODNjZjI0MWI4NDk0Mzc0OWFmODMxNjA1ZTg3OGNkYTAyMGUwNmNkIiwidGFnIjoiIn0%3D; vezeli_session=eyJpdiI6InhvbVRteXZXRkFYaGhtYVg0bWl5T0E9PSIsInZhbHVlIjoiZHZKNXJlc3ZqSU5YeVl0aEZnNlc5YjdkTjNieEZ2a09UVENXbE13K1BGWUFpeFV5QlhyNXFHOU41a3AyMFY4ZFpLbUM5dUE4QjdDVGxCSUtsbS8yK1FWV1hiRkxiajRMSjdnN2U3YmM4QXh6VUUxRDVhbUhpYUw2U1ErbjNDdlEiLCJtYWMiOiI3MWNlZTJjOTRiNWRjNTE4M2MzYmQ2MWRkMWYwMzdlYTljNjMwZTQ4OTdhZTE3Yjc2N2MwNThjZTJlZTIxMjAxIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Category\\Models\\Category',3,NULL,NULL,1,'2024-11-06 01:09:14','2024-11-06 01:09:14'),(49,'GET','[]','http://127.0.0.1:8000',NULL,'[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; vezeli_session=eyJpdiI6Ii9vVjY2d1ZKdW9tOTBQUTZFdHA3VFE9PSIsInZhbHVlIjoiQXVuYmpxbXRtR3lybUJJSjNpano3RzkzYVk4NEh5ZDJvTytFT3JxdHM4c3ViVTh1d1RLb3hxbFBuYW1GUzZEMEZ3NWxhM0d4S1YydjU5Y3VQalQ0WEg5U3VjVmFnSEt0NTcxMXBrOUpjd2luRW9YQXk4b2poeFJRYm1sNjQvcHoiLCJtYWMiOiI5ZWI4NGYzMzZkNTUyMzViODE2NmYzMjNmMzY2YjU1ZDg4NTdhNDRhYWJlODQ4OTMyNzM4OWJkNTcyM2QzNzAzIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-07 12:07:05','2024-11-07 12:07:05'),(50,'GET','[]','http://127.0.0.1:8000/cuidado-personal','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; XSRF-TOKEN=eyJpdiI6Ik05ZEk1K1VMVFVGcnhhQUttYmhxTkE9PSIsInZhbHVlIjoiUUJrcm9weWxzR1lBRlVCc3ZzdXVNTHBNcnlKSk5SdVYycHpPaUMzYlpqZ05FV2xwTHpLbDJIcFRlU09yd3duRGszbWRXd0l3UFFtSGc2OVFXWG1LaUZPREpjeGg4K1ZIUE5BV3NSQkhNd3Y3bjJzdVdxQzZLWkJIeE0vakJ1Q0QiLCJtYWMiOiI5MjFmM2ZiYWJiNDU1YTQyOWQ4ZDIzNGRjOTY5N2ZkY2QwYWU4ZGM3ZjY1NTRlNmJiYmViYjk3ZWE0Y2QzNTlhIiwidGFnIjoiIn0%3D; vezeli_session=eyJpdiI6IkwxR1hvWkc1a0RRbGlTa3ptMHhEVGc9PSIsInZhbHVlIjoiYkJTT2wyRVlSSkRlVmhHK1A5Nlp3MGFuSnBzL2F3OGgxRi9RU000NUxGNjJCS25tdXhWL3p4MENXZmdIT1pwalJtcVB3dyswMi9PeVZkeWJITVFIbkgyRzY3b2VvVjRvaGtFN2lTWnpVMDMvNFhhejZtTktodndGcTE0eEhheTAiLCJtYWMiOiI3MDYxNmUwZDRlNzk4NDEyZjRhNDNmOGUzMDgxODUwYzY0N2UwOGE1YjU4ZTJlNTMzODE5MzE5MDI2ZDEwODFlIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Category\\Models\\Category',5,NULL,NULL,1,'2024-11-07 15:31:34','2024-11-07 15:31:34'),(51,'GET','[]','http://127.0.0.1:8000/nitro-edicion-limitada','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImVNSFM0eFRQWHFaY2haeXAyZjFyT1E9PSIsInZhbHVlIjoiUFA5TnhOSGgzWTczYXY4bCt5QmJGc3FKYmVPMDNlZEpGek5ESGhoZ2dDaDhUVk94NzJaVS92MS9DZU5Hbmd0UEd2bk5SOUVpb3Q0WDh1VXhXU2E2U3FPR0FPcDhZZkg5YWhUVVorcVgvbDloNGxReU1takx4bmYycVlQc29pOUQiLCJtYWMiOiIxM2E0M2IxNGQyZTdlMzhjMWUyZDNmODI4NTY3MDZiYzg2ZjFlMGExNmRiZDMyYmY5MWFlOGY5MTUxODFkYjc1IiwidGFnIjoiIn0%3D; vezeli_session=eyJpdiI6IksrekRxODQ0cDJNWFlYN0pQeTVHSEE9PSIsInZhbHVlIjoicDBTWDFlN2VNeEpRSjZyb3g3OUw0R1FsTXZaYit6RHlkOGRSSlJFSG9ZcWhUZU9WaWVlNjI3QjhURlZ0QkFCZHRDT3J0WEdiL1ZkNzUyVmYzWkF6dDlibGpPN3dqRlk5QSs0enhpVHo5UHFOMForVkl6WmpQeDRSYjhXenFTcTAiLCJtYWMiOiJkYzE5Y2RhZDFjYjFmMWEzOTNiZjdmMjJlYjkyZjYwZjMyZjllNDBjM2Q3MTY3M2QyMzZkNzAzODJhMmFkMGIyIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',3,NULL,NULL,1,'2024-11-07 15:54:43','2024-11-07 15:54:43'),(52,'GET','[]','http://127.0.0.1:8000/colonia-agu-fresca','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; XSRF-TOKEN=eyJpdiI6InVxaTlNSmFnSDdndVh6M2hqUVRhMkE9PSIsInZhbHVlIjoiSHl1UGhNeXMwZE1WQXlNMUlSSytzWVpuZnJiZ2tHTzRFRnh0UHEvZVc0WHEycVBoUk1UTFhyRGxIeHVzT3owU2dqMEdBUmZKU0VzS2x1cklTaEhFT3Z2UHlhVndoUnphUGdkbzVLZm02RktGUjhMZVp6WHpRd3dzejIwemRmZ0siLCJtYWMiOiIzM2IxNGJhZWM0YjBjNmJjNDNiMmQ3OTcyMWUxM2Q1ZDc1ZDQwZDM3MzU5ZWM5Yzc0ZDU3NTUzNDk4ODU0MjliIiwidGFnIjoiIn0%3D; vezeli_session=eyJpdiI6ImR3eXdTdVhOLzl1TDYwZmVQNlozWmc9PSIsInZhbHVlIjoiSmh6a2lJQTV0NzdLYkkrY2NtL1ZDZEJiOWV6aFJTR1B0MDAxOGVMbFAvMzhuQ3FSUjlEOHlrb09ITG9USXBkUWwxQ0lsd05hVjRBclFvU3VMOVFHNURkdGNycjh4V0pZenRtNlBlcUNuT2lNRTRTUklaQzZ0VGlQQml6TElzVnkiLCJtYWMiOiI2Nzg0NjNkMTM4NmQ1ZjYyMDA4M2ZmMDdiY2EwZTY2YjZkNzFmM2VkZjhiYTAyODE0YzM2OTNmOTZjMThmYzBmIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',2,NULL,NULL,1,'2024-11-07 15:54:46','2024-11-07 15:54:46'),(53,'GET','[]','http://127.0.0.1:8000',NULL,'[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; vezeli_session=eyJpdiI6Ii9wd0lmTml5akN6WmVCNEF3SHR3a1E9PSIsInZhbHVlIjoiRXhMaHBudXVvc01HV2VZV2JQWXhRTVBMajlYRW1WSGU4RXdhcUc0N0sxMTlBaXRDSXFING5tZW1YOWZCbGxxaitDSnRsSXpHYlFMdTJtUEtTS1Jpa1hYTlRpTXU2TEtXenE5VktuNk96WnA0QXlRK2NIWmgxYnh4Qy9zUkorb0kiLCJtYWMiOiI4OTE0YTRlOTY0N2NlMGFlMmNkYWU2YWQzY2EwYzQxY2NkYWY3NGZjMmFjOGU0NmU1YjY2ZjNkNWNkODYwNDI1IiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-08 18:45:24','2024-11-08 18:45:24'),(54,'GET','[]','http://127.0.0.1:8000','http://127.0.0.1:8000/customer/login','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImhuNFpyVC9HSFBGdGJtYjVjbEo3cEE9PSIsInZhbHVlIjoicGlEZktsTFNOb0JlbWNuOFhHd21BK1hnSUhxcUk4dTF6elN3eXB2d2VVZHRnWThlNWJGMkJDVjRtZWxrbTd0ZkY0enJINWRvMHNnNGVPZ3lYM2JTbW82ditwb0NHQjNDeWJQZkFrZURSNGpEKzRUTXVzZVFBRmsrODNTSUg4SzgiLCJtYWMiOiI2MmFkM2U2OGU5MjNhMWM2NmFkMjUyMDYxMjFkYzE0ODlhODIyM2VjYTg0ZDdiZGY0NDFhMjExOTIxZmZmMDA2IiwidGFnIjoiIn0%3D; vezeli_session=eyJpdiI6IlpYOEJENkhOQUcyM05QREpKVmV4UlE9PSIsInZhbHVlIjoiVkFmSkVNbmJISDZaaGRXMGdUaHA0NlAxYXphVmQ2WHFxbTNtN0FodXlzOTI0ZGJQaTVLdTdHYlZaTCtHWCtMSXl5eTBPUm81Y1RreldTQUFaRkdCTVF3M1MzekF5YUJ0VmF6dFVUYUduZWpiRzBUTllySFdrUldjV2NmbFJieFQiLCJtYWMiOiI5MmEzMDBkZmRmNmRlMDQwMTk4NzkyMDBjNTQzNDJmNWE5NzI3ODkyMDgyMzdiZjFlOWY2NDAyYjZkNGE0NWQ2IiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,'Webkul\\Customer\\Models\\Customer',2,1,'2024-11-08 21:26:53','2024-11-08 21:26:53'),(55,'GET','[]','http://127.0.0.1:8000/perfumes','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; XSRF-TOKEN=eyJpdiI6InhsdEF2d3VaVmhkNEZTVXVSK05icWc9PSIsInZhbHVlIjoiTzAwQWo5UkNCMi9HVmtBa3ltN3ZvY3dzMkk3OTZDYzg4cVNPN2xaMmZlb3RVbVB0M2x4VmNQV25OYXZjcjNrSFZFZEtLTkIxVW0waUlLbEpTQnpnRGwzSTVGb3pMWDU1cWpVYU9pSUVFNHZBRlNDeGdndC9sdzV5V0tKY1ZtejAiLCJtYWMiOiJiMWZlZDA0NDAyYTNiN2M0MjVhMzAwODJlYjhmOTkwYzMzYTEyMDAyN2U2ZjUyMTg4NjU0YjNkNWUxOTA4Zjc0IiwidGFnIjoiIn0%3D; vezeli_session=eyJpdiI6ImI0V1AvNXc2ZlVIaTRTWDdFZVp5ZXc9PSIsInZhbHVlIjoiZWRMdTNodmxzcFpxT3plLzRaWURvdThmaS83THpTNGpQR3lBajZRdzNYMWtpR3J0czdCeXYyQ1M3TThqNGhjR0hhV0w3SlYybHQ2dU82WElmbDk3bmViRk80bG1vb0s1WnBJcFd6S2MxZEhnV0k2S3NlQW5odUlBbHVnM3ZQSTYiLCJtYWMiOiI0MzAzODUwODc4ZmI5MWU0NWY2MWI4N2I5ZmU4ZTdlMjgzY2UyNDIyMTIzMzNlNjJmZWJkNzk1MjBkNWE4ZGU0IiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Category\\Models\\Category',2,'Webkul\\Customer\\Models\\Customer',2,1,'2024-11-08 22:22:29','2024-11-08 22:22:29'),(56,'GET','[]','http://127.0.0.1:8000/hombre','http://127.0.0.1:8000/perfumes','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/perfumes\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; XSRF-TOKEN=eyJpdiI6IjRJR1FkeFg3K0VXSURvc0ZGRzBac0E9PSIsInZhbHVlIjoiTW1ZYktxenUxYlhIeW5SczVZU3hKR1hpYk9OcDY3aEd5S1l3Nm1yRVlDSWxodVVSVGIwbG4vclNuOStzTkJjN2s3azgxZkt5YWpTVVpMY05zOGhDVnNDRjdmbksxdCtJWldVekRIL042WGJlY0hzU2tSY2JTL2VkL1MwUjBWaFciLCJtYWMiOiJhNGFjMTUzN2NhOTc4NGUzNDVkNzBmN2VlODI0YWE0ZTFjMjhmMmRiYmNiNTZhNWM5YzUzNDM1YTU5NTNmZWYxIiwidGFnIjoiIn0%3D; vezeli_session=eyJpdiI6IktSd0xLL29SZ0NCMGtkUWVNV3ovUnc9PSIsInZhbHVlIjoiR2JPV3BETWJabXAvOWpuNFhyRVpuQXl5QjcvV2VTV0w4QnVmbktIMHdBTWtFNUY0U3ZaWERXb1I2cWU1dWMxSXRNcXVqdXY1elBjVGtJemE4aGpjdGlOeGNmQU4vM2gzdVV3eHg1QUFqRmxqZ2NaV3Z5QnB6WTR2UElsUU4vSTkiLCJtYWMiOiI4Y2JkZTcwZjIwZjgwOTgxN2Y5YWIwODk4YWU4MWFmNDU1MzE3Njg0MDg3OGE2M2Y2NDgwNGZkOTQzYzE0MTJmIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Category\\Models\\Category',3,'Webkul\\Customer\\Models\\Customer',2,1,'2024-11-08 22:22:33','2024-11-08 22:22:33'),(57,'GET','[]','http://127.0.0.1:8000/cuidado-personal','http://127.0.0.1:8000/hombre','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/hombre\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; XSRF-TOKEN=eyJpdiI6Im12d0R1NjgvUE1pOGl2QTNQZTZWVUE9PSIsInZhbHVlIjoiclBXRlVkeWRsN2VvRktqSU85TS9MRmUwYlk3cTRVdlJSUXhVeG1PNWgyT0tEdkxBMFBEN2hHVjhybzhGcUhqWW1qcGxET0N3am1YZkoxZmRGM2ZPSHJKV2QwRUtDQkc0V05JNjYvVHAyZHJwNllwT2t0L25zY3F5RmhWeEcrcVkiLCJtYWMiOiI4NTIwNGYzYmE1OWRhZmUyYzI0MDFhMDlkOTAxNDI1MmQzNTk0MjAxMTkzOGUwMWY4YWI1MWMxNWEwNDU3ZjQwIiwidGFnIjoiIn0%3D; vezeli_session=eyJpdiI6IkYrR1I1Q0RJOURLbDJRbkI3QlBwV1E9PSIsInZhbHVlIjoiZGc4R3FvYWViWENZLzh4Yy9IOExZMnZiL3dIeWxGQ3lKV0RyeTQ0QVJGRmxPbEpZUzNqa1ZqNXR6WE13S3phZGpRVWNKQzc3M09GWnlvaEwwVnlVK2xsUDVZS3FReE5Hd01oZ2o5TFAzMjVQUnltZ1lFWTJlbkg2b2xkdEdUQ2IiLCJtYWMiOiJmNWZiMjEyNDVlODA3MmYyMzE0Y2Q1ZTIwNzc3Y2JiZTdkNWMwODU3ZTVlMTEzMDZkNzZjN2MzYTI2YWNiOTg0IiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Category\\Models\\Category',5,'Webkul\\Customer\\Models\\Customer',2,1,'2024-11-08 22:22:36','2024-11-08 22:22:36'),(58,'GET','[]','http://localhost:8000/storage/product/1/JAbD7c4qEIuyLdL4FoldjRGxnIcOhHBjwdNTwWVl.webp','http://127.0.0.1:8000/admin/dashboard','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"cross-site\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/dashboard\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-09 00:00:25','2024-11-09 00:00:25'),(59,'GET','[]','http://localhost:8000/storage/product/3/ux2oCGWWYaOdvKTnaga4yHniE3Pw1gHLasJ5noA6.webp','http://127.0.0.1:8000/admin/dashboard','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"cross-site\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/dashboard\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-09 00:00:25','2024-11-09 00:00:25'),(60,'GET','[]','http://localhost:8000/storage/product/2/qZpaPLVmdUex53lTAm7HC0xTrqDB1bKv7ATXvhja.webp','http://127.0.0.1:8000/admin/dashboard','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"cross-site\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/dashboard\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-09 00:00:25','2024-11-09 00:00:25'),(61,'GET','[]','http://localhost:8000/storage/product/1/l5dBctJpf2ipjx1S4XSA5Mc2kEyAXK8weja8kplI.webp','http://127.0.0.1:8000/admin/catalog/products','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"cross-site\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-09 00:00:59','2024-11-09 00:00:59'),(62,'GET','[]','http://127.0.0.1:8000',NULL,'[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; XSRF-TOKEN=eyJpdiI6InNJSDl2YVZ6dFdoYm9xcmpvUlNiQmc9PSIsInZhbHVlIjoiazRlT3RXZmxqMGZ6NXZhRG5pU2hMMCtqTDF6aW9NM21xaFJKL1RDU3RpWE5GWkMxSUlEVnVVOUIvTWJOQk5ndVU4M2xNSTNSQk1rNVhrSm55d3ZUYWs2THFZaG14SEgxeWtSVlZKZm1YYnBCajRUWk5CTlNLTnFLK1hYaDhtZTciLCJtYWMiOiI0MTM5MGE0M2Q1ZGExMGRhNzg3NTQyMjhmYTRjMTI0NTVmNzgyMzJkZWIwZTFjMjU3MmRkODBjYzcyYTNiZDlkIiwidGFnIjoiIn0%3D; vezeli_session=eyJpdiI6InI1UmkzZFVIZUdrTEJaa2Nibk5IbEE9PSIsInZhbHVlIjoiR0RsVHNmV1UrTklyUmRweHFzTWFYM1VWY1pMeXRQS3FwTVpMRXh5SXpRckRCYWo5ZmlKYkxsdVFKZ2x6SCt5YTJ2SnRkTldsdXU4bHpIT28xdWl3OVVYMzdVUW02bEhoMWE2ci9kUERhZlN1TE1QV0ljM3lZTEtrWGpXVFJucS8iLCJtYWMiOiJmMWJhMTIwM2EwZGExZTQ5ZDhiOWQ2OGM2ZDdmMzk1MzQ5OWQ4Mjc0MmExYWI5ZTUwZWYzMzg5MjJmMDhjNTk0IiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-09 13:39:49','2024-11-09 13:39:49'),(63,'GET','[]','http://localhost:8000/storage/product/1/l5dBctJpf2ipjx1S4XSA5Mc2kEyAXK8weja8kplI.webp','http://127.0.0.1:8000/admin/dashboard','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"cross-site\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/dashboard\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-09 13:44:06','2024-11-09 13:44:06'),(64,'GET','[]','http://localhost:8000/storage/product/3/ux2oCGWWYaOdvKTnaga4yHniE3Pw1gHLasJ5noA6.webp','http://127.0.0.1:8000/admin/dashboard','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"cross-site\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/dashboard\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-09 13:44:06','2024-11-09 13:44:06'),(65,'GET','[]','http://localhost:8000/storage/product/2/qZpaPLVmdUex53lTAm7HC0xTrqDB1bKv7ATXvhja.webp','http://127.0.0.1:8000/admin/dashboard','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"cross-site\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/dashboard\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-09 13:44:06','2024-11-09 13:44:06'),(66,'GET','[]','http://lookup-statewide-strictly-printers.trycloudflare.com',NULL,'[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"lookup-statewide-strictly-printers.trycloudflare.com\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"accept-encoding\":[\"gzip\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cdn-loop\":[\"cloudflare; loops=1; subreqs=1\"],\"cf-connecting-ip\":[\"186.114.161.43\"],\"cf-ew-via\":[\"15\"],\"cf-ipcountry\":[\"CO\"],\"cf-ray\":[\"8dfe43f690864958-MIA\"],\"cf-visitor\":[\"{\\\"scheme\\\":\\\"https\\\"}\"],\"cf-warp-tag-id\":[\"d7233d02-5a27-4684-8a5b-c377db5a6280\"],\"cf-worker\":[\"trycloudflare.com\"],\"connection\":[\"keep-alive\"],\"priority\":[\"u=0, i\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"sec-fetch-dest\":[\"document\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-user\":[\"?1\"],\"upgrade-insecure-requests\":[\"1\"],\"x-forwarded-for\":[\"186.114.161.43\"],\"x-forwarded-proto\":[\"https\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-09 13:49:19','2024-11-09 13:49:19'),(67,'GET','[]','http://scratch-outreach-burning-auction.trycloudflare.com',NULL,'[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"scratch-outreach-burning-auction.trycloudflare.com\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"accept-encoding\":[\"gzip\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cdn-loop\":[\"cloudflare; loops=1; subreqs=1\"],\"cf-connecting-ip\":[\"186.114.161.43\"],\"cf-ew-via\":[\"15\"],\"cf-ipcountry\":[\"CO\"],\"cf-ray\":[\"8dfe4516d4384c0c-MIA\"],\"cf-visitor\":[\"{\\\"scheme\\\":\\\"https\\\"}\"],\"cf-warp-tag-id\":[\"55c44295-bf77-4a3c-b3e1-dadbcc1b9e5a\"],\"cf-worker\":[\"trycloudflare.com\"],\"connection\":[\"keep-alive\"],\"priority\":[\"u=0, i\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"sec-fetch-dest\":[\"document\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-user\":[\"?1\"],\"upgrade-insecure-requests\":[\"1\"],\"x-forwarded-for\":[\"186.114.161.43\"],\"x-forwarded-proto\":[\"https\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-09 13:50:06','2024-11-09 13:50:06'),(68,'GET','[]','http://127.0.0.1:8000',NULL,'[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; vezeli_session=eyJpdiI6ImsrZGIwM0xKaFYzRTJJVzRFUGNzS1E9PSIsInZhbHVlIjoiMFhpeCtzTHl5eU9tVFJHNU5FaWZWUU9yWnJBVW4yK2RQaVFZc0oySGJSUlRHbzdlMkM1ZVNuMjRuK0hZaGxMWWhEdzhqMmZjaEdSS2JKd3pQcU9SMVorbkNWYTJlQkR4c2c1SlFVQkVpY1plaFpDU2NaZW5uZ3dOekJpTkQ4UHciLCJtYWMiOiIyMzFjZTg2NGRhZjE2MzUzZWRmNjE5NTk1OWVkNDUzZTdkZGQ1YTUyNzUzMzU0MjExNTI3MTFkMTc3NDI4ZmUzIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-12 23:17:34','2024-11-12 23:17:34'),(69,'GET','[]','http://localhost:8000/storage/product/1/l5dBctJpf2ipjx1S4XSA5Mc2kEyAXK8weja8kplI.webp','http://127.0.0.1:8000/admin/dashboard','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"cross-site\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/dashboard\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-12 23:18:25','2024-11-12 23:18:25'),(70,'GET','[]','http://localhost:8000/storage/product/3/ux2oCGWWYaOdvKTnaga4yHniE3Pw1gHLasJ5noA6.webp','http://127.0.0.1:8000/admin/dashboard','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"cross-site\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/dashboard\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-12 23:18:25','2024-11-12 23:18:25'),(71,'GET','[]','http://localhost:8000/storage/product/2/qZpaPLVmdUex53lTAm7HC0xTrqDB1bKv7ATXvhja.webp','http://127.0.0.1:8000/admin/dashboard','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"cross-site\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/dashboard\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-12 23:18:26','2024-11-12 23:18:26'),(72,'GET','[]','http://localhost:8000/storage/product/4/MS65ZQB3ks8aWYiDXRtUC8MIM8hCSpFAj4FZJSMy.webp','http://127.0.0.1:8000/admin/catalog/products','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"cross-site\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-12 23:35:22','2024-11-12 23:35:22'),(73,'GET','[]','http://localhost:8000/storage/product/5/GITocQpo50HZH4FDsTsUWBpiDn16zY8yPHqcltCm.webp','http://127.0.0.1:8000/admin/catalog/products','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"cross-site\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-12 23:39:59','2024-11-12 23:39:59'),(74,'GET','[]','http://localhost:8000/storage/product/6/k4BzKn0LuPpbnjR0htNUjCH8sPnI8GHLFBlJEtha.webp','http://127.0.0.1:8000/admin/catalog/products','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"cross-site\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-12 23:43:35','2024-11-12 23:43:35'),(75,'GET','[]','http://localhost:8000/storage/category/2/BwV375UE2OWqBrxwVNlggXDX5vKVZuS0OqHyZaeK.webp','http://127.0.0.1:8000/admin/catalog/categories/edit/2','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"cross-site\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/categories\\/edit\\/2\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-12 23:47:02','2024-11-12 23:47:02'),(76,'GET','[]','http://localhost:8000/storage/category/3/8WZN2rWnJqv3zHnulk6JGErHpSZ66BMOhc2AU6xT.webp','http://127.0.0.1:8000/admin/catalog/categories/edit/3','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"cross-site\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/categories\\/edit\\/3\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-12 23:47:52','2024-11-12 23:47:52'),(77,'GET','[]','http://127.0.0.1:8000/maquillaje','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; XSRF-TOKEN=eyJpdiI6Ik5tTHlVcGJPTndVd29iZ2hzczRYdEE9PSIsInZhbHVlIjoibUVzRkxCaUZHa3gzbjV2VkFGS0NTaXg4Mm9NR2Q3QkVsRTZoU2ZPUmplcTIxL1kxZlpCd01vQUdRRVJWK0ZYaFlBbjY5SUlrK2MybkRVTW5XbjhtTzExTGhGR3ZBZytjS1RiZ0F2RzEvOWhyL2JzSVNQdklra0k4aWl0OThubzQiLCJtYWMiOiJiOTIyMDM4YzU1OWFmYzg5ZGE1NmY5MDdjMDk2NmU4MzJhMGM5YjdlMmRlZTUxMWY2MGI0YWY1ZjJiZWY2ZDY5IiwidGFnIjoiIn0%3D; vezeli_session=eyJpdiI6IjBGanlqMFJFRFRjY2ZFc3haaytwenc9PSIsInZhbHVlIjoiWEtDY1BlQXc1cHcvd1Vzb2txdjl3YjByTVFVOW94eHlQNnhKV0p6OXYvQVNtcWxiTFJ3N3ZPWjRnK0UzUG9jNzM3OGNnVTFGQm16emRWWVJhcmlCdXNBL01QckFUTmVxdENFM0Q0N0JkZTNHT1B4b0o3TEEzdzVlbTlpZ21sTUsiLCJtYWMiOiJmYzIwMjRkZWNkYjVmZjYxYmI3ZTZjMTRhNzJkOGYyMGQ3OWNlMGI2YjRiYzIwMjBlZTVkYzU3N2ZjYjEwMDEwIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Category\\Models\\Category',6,NULL,NULL,1,'2024-11-12 23:49:44','2024-11-12 23:49:44'),(78,'GET','[]','http://localhost:8000/storage/product/7/jqM5YOgkX6ITIIXFMHm82kgspD2G2j0mLrM6tjpJ.webp','http://127.0.0.1:8000/admin/catalog/products','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"cross-site\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-12 23:52:02','2024-11-12 23:52:02'),(79,'GET','[]','http://localhost:8000/storage/product/8/StbeyE3bOqGCkYBenlAulzWhjWJQDdyR3czNMLFt.webp','http://127.0.0.1:8000/admin/catalog/products','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"cross-site\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-12 23:55:34','2024-11-12 23:55:34'),(80,'GET','[]','http://localhost:8000/storage/product/9/YrrSXRlIUULPE0yrDbWerHmhXW71lGvdPcVOjpBT.webp','http://127.0.0.1:8000/admin/catalog/products','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"cross-site\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"]}','','Linux','Chrome','127.0.0.1',NULL,NULL,NULL,NULL,1,'2024-11-12 23:59:31','2024-11-12 23:59:31'),(81,'GET','[]','http://127.0.0.1:8000/delineador-de-cejas-brow-pen-cyplay','http://127.0.0.1:8000/','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; XSRF-TOKEN=eyJpdiI6IkNIZ25uOGpONS8wa2F0VUt5NVlTeUE9PSIsInZhbHVlIjoiOWpCUENFVW8zWEFTWU9pTjkvTDA3aHRJS2VjM2Q1VHhyUkxCNEJSc0hxS2NuRU42RmlyZTN3d0xtRGVTRTA2cURZZ0hvcWVCWnkxbVZXTXdCMzA4Y2FZNkxKdWs4RkJ4eVh4RlVOdEdqK0ZhNUg1TDd6YTkwUS9PckdscHA3ZmkiLCJtYWMiOiIxMThiODczOTcxMTdiN2Q2NTNlOGUwNzYyNWQwZGVlZjk1NTMzOTExMDliNzIyN2EzNmRlZWVmYjAyMTAwMDBmIiwidGFnIjoiIn0%3D; vezeli_session=eyJpdiI6IkNPM1Bua0Q5MERUeDgwV0F2aTkwYnc9PSIsInZhbHVlIjoiZWVZTXYrYzRBUHJndmdqKzdKSFE1bDRueWVZemFDdis0dmtKbm4vOGdwMWE1dzY1UDdscnIvSExqcUJYbGRjRWxGTmpxd2NDR2tpZlVHZ2haQ0tSenJmNWlueHF5RnhUbXpBRlBON05rLy8wVTZRbnoxVEQydmI4Slo3K2NZejciLCJtYWMiOiIzMGVjMWQ1MDkxNjY4MTJkMzRjZjhkZDc5YzYwNGE5MmJiNjU3NTdjOGQzM2U5Y2M3MDg2NTkzZjgyZGQwYjM1IiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Product\\Models\\Product',5,NULL,NULL,1,'2024-11-13 00:00:15','2024-11-13 00:00:15'),(82,'GET','[]','http://127.0.0.1:8000/perfumes','http://127.0.0.1:8000/delineador-de-cejas-brow-pen-cyplay','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/delineador-de-cejas-brow-pen-cyplay\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; XSRF-TOKEN=eyJpdiI6IjlITUpLQm9OajZldmRkR2pTL0o0Q1E9PSIsInZhbHVlIjoiTlp5WnAyQ0I0UXZHeVVPTi9hZGtpQ0NXWXNHeDF6YlJxRnlNMFdSTzJscnpUc1ZpWjVJZk9yT2RWTkZ0d1N6WmNLa2dQNXRVd2lPYzJtNW1vZGFodTFhUE5WMDRKUzI0QkhRaDZHTUVIUFdxMVk5eVJiRCtYK1k5S3lmWXh1Q1oiLCJtYWMiOiIxZjZlNGViZmU4ZWNjNjMxZTNhZWZhMDlhZjM0YjJmYmY2YTY2MmExMDZjNDBlNThiYTdmMTIzODQ2MTRkZTM4IiwidGFnIjoiIn0%3D; vezeli_session=eyJpdiI6IkYyNVRKNHFheDV2S3hFYXlUQU1Ya2c9PSIsInZhbHVlIjoiNlM2cTlsSlBpV1JKa0pRanhwNzFWcTZ0b0RNTFoycHYvc3YvUVgxTHlFSEc4NWVhYUJ4QWVpTFVVSmk5WlJYcnVvVXFLMUFHOHZBS0ZHTUtpVTMxc3NYeU9ybW11bXRya2JLVzUrRnRQaHN6UGxMTlZIOW9nRnBKakJsL3JORGIiLCJtYWMiOiJkNWQ1OGQwNjQ4YmE2NTUyY2U5MTU4YmMxYmM1MTZhNmJhMTFiOGVmYzFmOTIxMjkyMDBiYzAxMzExYTA5ODI4IiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Category\\Models\\Category',2,NULL,NULL,1,'2024-11-13 00:00:32','2024-11-13 00:00:32'),(83,'GET','[]','http://127.0.0.1:8000/hombre','http://127.0.0.1:8000/perfumes','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/perfumes\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; XSRF-TOKEN=eyJpdiI6ImdJaDJzK2FGU2YzVHpTcmFQdWNDVkE9PSIsInZhbHVlIjoicEtveHBNOHdKdHEyUHA4dGZSUWVHQTBqT214ZFRJNVg2R0kzc3NUWFpPanBoRmpWTzlORkE0YTE5VlM2TmhaOStyNytTZjZaU3VJaDh4Rnpqd3hrQklCY0dDS3o2NlpoRFVVRFQ4U0JsVzNNQlhScmdmOTkrZWM4cWMxanBTdVoiLCJtYWMiOiI0NWM0OTNjMzNhNjI4YmY0OGZlYmY5ZmIzYWFkOTA4NTRkMTE3YzZmOGRlMGMwMzhmOTAxNmI1NTk1NTczMTZjIiwidGFnIjoiIn0%3D; vezeli_session=eyJpdiI6IldLWlp1OWUwY0FPWllLNHpPN28xaGc9PSIsInZhbHVlIjoiY0ZiR0pCb29EMytFM3VYVWJKaFpIYmlmaFZOT3Byblh4T0xjLzgzb3I5U2l3VlV2OUpzV0ZaM1oyNnNoZElZdHRqd0EvZlhGU1FTaWRFaEFwbEw3emFyREVya2ppVk1aRWZWdzNTbmsxZ3VGa2xHcCt2cHZhd1BObnBZNll3K3kiLCJtYWMiOiI3ODIxNzBhNTMyODA0OWJmMDk3NDc0ZGE3ZWVmNzQ5MGY2MDM5M2U1YTllYjQ0NTYxMmZjYjI1YWMyNTUzYTM5IiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Category\\Models\\Category',3,NULL,NULL,1,'2024-11-13 00:00:36','2024-11-13 00:00:36'),(84,'GET','[]','http://127.0.0.1:8000/mujer','http://127.0.0.1:8000/hombre','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/hombre\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; XSRF-TOKEN=eyJpdiI6Ikxzb1JjMlhhVElhemVMb21BUUtFU1E9PSIsInZhbHVlIjoiSndYMFo5YzFOeXhrWXI4Z3RFSXg4d0hDbk51SWI2VVZZY0RPMi94TnpRazNlZjQ4Wk1IekRzVEp4RXBFZHNKelVMa1lUU21IaXRqQlp6U0s3MlNiZ2RNTFJxU04vTDhERW9JdnNZZnhvcUR4MStCMlRsUXhDUzZNRVI0YVVOOC8iLCJtYWMiOiIwOTE2NmM5NGU2NmRmNjcxMTRhZWM0OWQ5ODJmZDE4ZDE4NWFkNzY0NDc3N2VmZjI0ZTA1MDczYjA4NmFkZGQzIiwidGFnIjoiIn0%3D; vezeli_session=eyJpdiI6IkNxUGRwNDI2TnM5MjhXcUN1UlRyc2c9PSIsInZhbHVlIjoiYlpGYXdSMVBiOURDOXkzZVFpbVFaQmd3OFozdzBBMFZPbFRvcEFlcDczWGNVenRpNjdTc3VtTXdUNnY4QlkyVlJYVVVEMHJtZ21rUGpaREpPZ0RiWGhkbUw2M0RITFpkaDQ4b2RrTGNUYmE2MGR3d0VNRG1zN2s1UnBtRDg5NnAiLCJtYWMiOiIzZGQwMjBmMjQ3NjRhMzcxZDRmMmQ0Y2FjZGExODU5NGYxZDJmMzYyMzk3ODEyZDllMTM3ODA3NDhmZDY0ZDhjIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Category\\Models\\Category',4,NULL,NULL,1,'2024-11-13 00:00:39','2024-11-13 00:00:39'),(85,'GET','[]','http://127.0.0.1:8000/cuidado-personal','http://127.0.0.1:8000/mujer','[]','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"130\\\", \\\"Google Chrome\\\";v=\\\"130\\\", \\\"Not?A_Brand\\\";v=\\\"99\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Linux\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/mujer\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"es-US,es-419;q=0.9,es;q=0.8\"],\"cookie\":[\"lang=eyJpdiI6IkpMWk1WQW9iOEpyZjkxc1dIakFpNmc9PSIsInZhbHVlIjoiaENTY2I2MGJvRUxSNVRHS2docW92SkNaU3lIRnlKdjhJZ2lBWGJzejFaSmJXN1pGOW9xcEJoN1FVRE9sbFVaYWdMeFZWbkxQcE1sS3lQaElBWlZEbktVdzdlWk51TzhIWWxwT0N5dUxHNzg9IiwibWFjIjoiMTBiMWM4ZDFiZWRmZmNiMjJhNzk1OTY1MzdiYWU4NzMxMGE4MWIyZjViYzg5MDNjYmU1N2RkMzE1YTU0MmNjNiIsInRhZyI6IiJ9; bagisto_session=eyJpdiI6InhGOUJ3enRjM3BnemlKcVc3aFg2Q2c9PSIsInZhbHVlIjoiMGZnSVRhNW1LS3N1WmZsdko3czJ1Qk1sT0JESTJkaW50aXRlRUtmSEZjUDh2NVpEM2RHYm5MeUluNjc3SjNTSkNwaENaZkpra05yZ0wvbmlMOGcwU1N3NXhRYlZwOVFuYWNDVXgwS1VQcnRPVnA3ZWI3MlZ2SmJXdWtNM1hxZ3YiLCJtYWMiOiJhNmVlMzhlYjY3YTIxOWRhYTE2ODlkZTBkNDMwZGMyNDhhZTlhNjI0ZjIzNDQ1MjNjZTZmMmRhZTY3NGVkNWQ5IiwidGFnIjoiIn0%3D; dark_mode=0; XSRF-TOKEN=eyJpdiI6InkwbFk5OGYyVnlrdmZmUUZKWGthZlE9PSIsInZhbHVlIjoiL2ZqNHBucjZHbTk4WjdUU3VqVFg3SFZEalVvZG9waHg2N3BVRGJUajJXL3RtcUtHMU9Kd1RCRVkrK1hlWTMwdGhDY2duM1h3YllmNFBqT1JkZG1JRUJqZnBYK1FHYzAyczRtOEdmazZkYktvdkdIUG02bWl2bFFkT3VjcXFERzciLCJtYWMiOiIyYmI4N2RjZWI1YTk4ODI4YTU2ODE2ZTBmMzMxZWM2YTc3NGVhNWUyZTQ5OWI1MTAyYzUwMjU2ZGQ5MGY4YmM1IiwidGFnIjoiIn0%3D; vezeli_session=eyJpdiI6IklpTnBjaVFzamhKMnpubUVGU2RtZUE9PSIsInZhbHVlIjoibjF0ZCszQUZ3aHNvV3RCc0JVRkJwcVpXaTRFMFJ5NFlNMHNnUmN4TVpHRzdHYURGd2pQYTIrSitRS1ZvR0E4MFhza1hPS3ljbzR1NWF5dG1MMW9YUWFLVEM4cVRtYnExZTdEQjY3V1JBa3FLWEl3ZkhRZyt1eVN3VDM3ekt3SFciLCJtYWMiOiJhOGE4MWMxZDA4MmI4OWJlOWE1ZWU4NmI5MWY5OTIyNmM3ODMzYjlkNDgxN2Q3ZDUzMjk4NzRlZWU3OTcxZmIzIiwidGFnIjoiIn0%3D\"]}','','Linux','Chrome','127.0.0.1','Webkul\\Category\\Models\\Category',5,NULL,NULL,1,'2024-11-13 00:00:41','2024-11-13 00:00:41');
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `item_options` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `time_of_moving` date DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_channel_id_foreign` (`channel_id`),
  KEY `wishlist_product_id_foreign` (`product_id`),
  KEY `wishlist_customer_id_foreign` (`customer_id`),
  CONSTRAINT `wishlist_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_items`
--

DROP TABLE IF EXISTS `wishlist_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `additional` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_items_channel_id_foreign` (`channel_id`),
  KEY `wishlist_items_product_id_foreign` (`product_id`),
  KEY `wishlist_items_customer_id_foreign` (`customer_id`),
  CONSTRAINT `wishlist_items_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_items`
--

LOCK TABLES `wishlist_items` WRITE;
/*!40000 ALTER TABLE `wishlist_items` DISABLE KEYS */;
INSERT INTO `wishlist_items` VALUES (1,1,2,2,NULL,NULL,NULL,'2024-11-02 19:22:47','2024-11-02 19:22:47');
/*!40000 ALTER TABLE `wishlist_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'laravel'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-12 19:04:10
