/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: olist_db
-- ------------------------------------------------------
-- Server version	11.8.6-MariaDB-0+deb13u1 from Debian

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
-- Table structure for table `CLIENTE`
--

DROP TABLE IF EXISTS `CLIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENTE` (
  `customer_id` varchar(32) NOT NULL,
  `customer_unique_id` varchar(32) NOT NULL,
  `customer_zip_code_prefix` int(5) NOT NULL,
  `customer_city` varchar(50) NOT NULL,
  `customer_state` char(2) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `CLIENTE_ID_UNIQUE` (`customer_unique_id`),
  KEY `CLIENTE_GEOLOCALIZACAO_FK` (`customer_zip_code_prefix`),
  CONSTRAINT `CLIENTE_GEOLOCALIZACAO_FK` FOREIGN KEY (`customer_zip_code_prefix`) REFERENCES `GEOLOCALIZACAO` (`geolocalization_zip_code_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GEOLOCALIZACAO`
--

DROP TABLE IF EXISTS `GEOLOCALIZACAO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `GEOLOCALIZACAO` (
  `geolocalization_zip_code_prefix` int(5) NOT NULL,
  `geolocalization_lat` decimal(10,8) NOT NULL,
  `geolocalization_long` decimal(10,8) NOT NULL,
  `geolocalization_city` varchar(50) NOT NULL,
  `geolocalization_state` char(2) NOT NULL,
  PRIMARY KEY (`geolocalization_zip_code_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ITEM_PEDIDO`
--

DROP TABLE IF EXISTS `ITEM_PEDIDO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ITEM_PEDIDO` (
  `order_item_id` int(11) NOT NULL,
  `order_id` varchar(32) NOT NULL,
  `product_id` varchar(32) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `freight_value` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_item_id`,`order_id`),
  KEY `ITEM_PEDIDO_PEDIDO_FK` (`order_id`),
  KEY `ITEM_PEDIDO_PRODUTO_FK` (`product_id`),
  CONSTRAINT `ITEM_PEDIDO_PEDIDO_FK` FOREIGN KEY (`order_id`) REFERENCES `PEDIDO` (`order_id`),
  CONSTRAINT `ITEM_PEDIDO_PRODUTO_FK` FOREIGN KEY (`product_id`) REFERENCES `PRODUTO` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PEDIDO`
--

DROP TABLE IF EXISTS `PEDIDO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PEDIDO` (
  `order_id` varchar(32) NOT NULL,
  `customer_id` varchar(32) NOT NULL,
  `order_status` varchar(20) NOT NULL,
  `order_purchase_timestamp` datetime NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `PEDIDO_CLIENTE_FK` (`customer_id`),
  CONSTRAINT `PEDIDO_CLIENTE_FK` FOREIGN KEY (`customer_id`) REFERENCES `CLIENTE` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PRODUTO`
--

DROP TABLE IF EXISTS `PRODUTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRODUTO` (
  `product_id` varchar(32) NOT NULL,
  `product_category_name` varchar(50) DEFAULT NULL,
  `product_weight_g` int(10) DEFAULT NULL,
  `product_length_cm` int(10) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'olist_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-04-20 21:38:12
