-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: acm_db
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add brand',7,'add_brand'),(26,'Can change brand',7,'change_brand'),(27,'Can delete brand',7,'delete_brand'),(28,'Can view brand',7,'view_brand'),(29,'Can add market place',8,'add_marketplace'),(30,'Can change market place',8,'change_marketplace'),(31,'Can delete market place',8,'delete_marketplace'),(32,'Can view market place',8,'view_marketplace'),(33,'Can add product',9,'add_product'),(34,'Can change product',9,'change_product'),(35,'Can delete product',9,'delete_product'),(36,'Can view product',9,'view_product'),(37,'Can add product highlight',10,'add_producthighlight'),(38,'Can change product highlight',10,'change_producthighlight'),(39,'Can delete product highlight',10,'delete_producthighlight'),(40,'Can view product highlight',10,'view_producthighlight'),(41,'Can add specification type',11,'add_specificationtype'),(42,'Can change specification type',11,'change_specificationtype'),(43,'Can delete specification type',11,'delete_specificationtype'),(44,'Can view specification type',11,'view_specificationtype'),(45,'Can add specification',12,'add_specification'),(46,'Can change specification',12,'change_specification'),(47,'Can delete specification',12,'delete_specification'),(48,'Can view specification',12,'view_specification'),(49,'Can add product to specification',13,'add_producttospecification'),(50,'Can change product to specification',13,'change_producttospecification'),(51,'Can delete product to specification',13,'delete_producttospecification'),(52,'Can view product to specification',13,'view_producttospecification'),(53,'Can add product to product highlight',14,'add_producttoproducthighlight'),(54,'Can change product to product highlight',14,'change_producttoproducthighlight'),(55,'Can delete product to product highlight',14,'delete_producttoproducthighlight'),(56,'Can view product to product highlight',14,'view_producttoproducthighlight'),(57,'Can add product media',15,'add_productmedia'),(58,'Can change product media',15,'change_productmedia'),(59,'Can delete product media',15,'delete_productmedia'),(60,'Can view product media',15,'view_productmedia'),(61,'Can add product link',16,'add_productlink'),(62,'Can change product link',16,'change_productlink'),(63,'Can delete product link',16,'delete_productlink'),(64,'Can view product link',16,'view_productlink'),(65,'Can add important specification',17,'add_importantspecification'),(66,'Can change important specification',17,'change_importantspecification'),(67,'Can delete important specification',17,'delete_importantspecification'),(68,'Can view important specification',17,'view_importantspecification'),(69,'Can add product category',18,'add_productcategory'),(70,'Can change product category',18,'change_productcategory'),(71,'Can delete product category',18,'delete_productcategory'),(72,'Can view product category',18,'view_productcategory'),(73,'Can add product to product category',19,'add_producttoproductcategory'),(74,'Can change product to product category',19,'change_producttoproductcategory'),(75,'Can delete product to product category',19,'delete_producttoproductcategory'),(76,'Can view product to product category',19,'view_producttoproductcategory'),(77,'Can add tile',20,'add_tile'),(78,'Can change tile',20,'change_tile'),(79,'Can delete tile',20,'delete_tile'),(80,'Can view tile',20,'view_tile'),(81,'Can add tile filter',21,'add_tilefilter'),(82,'Can change tile filter',21,'change_tilefilter'),(83,'Can delete tile filter',21,'delete_tilefilter'),(84,'Can view tile filter',21,'view_tilefilter'),(85,'Can add tile to tile filter',22,'add_tiletotilefilter'),(86,'Can change tile to tile filter',22,'change_tiletotilefilter'),(87,'Can delete tile to tile filter',22,'delete_tiletotilefilter'),(88,'Can view tile to tile filter',22,'view_tiletotilefilter'),(89,'Can add tile category',23,'add_tilecategory'),(90,'Can change tile category',23,'change_tilecategory'),(91,'Can delete tile category',23,'delete_tilecategory'),(92,'Can view tile category',23,'view_tilecategory'),(93,'Can add blog post',24,'add_blogpost'),(94,'Can change blog post',24,'change_blogpost'),(95,'Can delete blog post',24,'delete_blogpost'),(96,'Can view blog post',24,'view_blogpost');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$w3wAoOmsgCivfIhsqgK5Bh$eu9/7NcHlvK706pLjqfXj53po474GVulnZXFsf4FUeA=','2024-05-25 16:37:32.671707',1,'admin','','','pkverma131@gmail.com',1,1,'2024-05-16 08:22:18.985136');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_brand`
--

DROP TABLE IF EXISTS `catalogue_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogue_brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL,
  `company` varchar(100) NOT NULL,
  `origin_country` varchar(50) NOT NULL,
  `manufacture_country` varchar(50) NOT NULL,
  `support_contact` varchar(100) NOT NULL,
  `support_email` varchar(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `logo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_brand_created_by_id_69eb38e5` (`created_by_id`),
  KEY `catalogue_brand_updated_by_id_bfc5c593` (`updated_by_id`),
  CONSTRAINT `catalogue_brand_created_by_id_69eb38e5_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `catalogue_brand_updated_by_id_bfc5c593_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_brand`
--

LOCK TABLES `catalogue_brand` WRITE;
/*!40000 ALTER TABLE `catalogue_brand` DISABLE KEYS */;
INSERT INTO `catalogue_brand` VALUES (1,'2024-05-25 21:03:07.169170','2024-05-25 21:03:07.169216',1,NULL,'Blue Star','','','India','China','None','None','Manufacturer Name & Address: Blue Star | Kasturi Buildings Mohan T Advani Chowk Jamshedji Tata Road Mumbai - 400020',''),(2,'2024-05-25 21:03:46.455595','2024-05-25 21:03:46.455647',1,NULL,'Croma','','','India','India','None','None','None',''),(3,'2024-05-25 21:03:46.470653','2024-05-25 21:03:46.470703',1,NULL,'Godrej','','','India','India','None','None','Manufacturer Name & Address: Godrej  Boyce Manufacturing Company Limited, Pirojshanagar, Vikhroli, Mumbai - 400079, India',''),(4,'2024-05-25 21:03:46.480435','2024-05-25 21:03:46.480477',1,NULL,'LLOYD','','','India','India','None','None','None',''),(5,'2024-05-25 21:03:46.498107','2024-05-25 21:03:46.498153',1,NULL,'VOLTAS','','','India','India','None','None','Manufacturer Name & Address: Voltas Limited. Voltas House \'A\' Block Dr. Babasaheb Ambedkar Rd Chinchpokli Mumbai - 400 033 India','');
/*!40000 ALTER TABLE `catalogue_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_importantspecification`
--

DROP TABLE IF EXISTS `catalogue_importantspecification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogue_importantspecification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `wattage` int NOT NULL,
  `coverage_area` int NOT NULL,
  `energy_rating` double NOT NULL,
  `default_bill_amount` int NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_importants_product_id_0573d52a_fk_catalogue` (`product_id`),
  CONSTRAINT `catalogue_importants_product_id_0573d52a_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_importantspecification`
--

LOCK TABLES `catalogue_importantspecification` WRITE;
/*!40000 ALTER TABLE `catalogue_importantspecification` DISABLE KEYS */;
INSERT INTO `catalogue_importantspecification` VALUES (11,3590,120,2.56,2692,2),(12,5010,180,3.85,2498,3),(13,5275,120,2.28,4442,4),(14,0,180,3.85,0,5),(15,4900,180,3.94,2387,6),(16,3450,130,3.9,1698,7),(17,0,180,3.95,0,8),(18,269,150,3.85,134,9),(19,4800,180,3.81,2418,10),(20,4900,180,5,1881,11);
/*!40000 ALTER TABLE `catalogue_importantspecification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_marketplace`
--

DROP TABLE IF EXISTS `catalogue_marketplace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogue_marketplace` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_marketplace_created_by_id_4aeb189a` (`created_by_id`),
  KEY `catalogue_marketplace_updated_by_id_15a7bea3` (`updated_by_id`),
  CONSTRAINT `catalogue_marketplace_created_by_id_4aeb189a_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `catalogue_marketplace_updated_by_id_15a7bea3_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_marketplace`
--

LOCK TABLES `catalogue_marketplace` WRITE;
/*!40000 ALTER TABLE `catalogue_marketplace` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_marketplace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_product`
--

DROP TABLE IF EXISTS `catalogue_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogue_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(500) NOT NULL,
  `brand_id` bigint NOT NULL,
  `model_number` varchar(100) NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_product_brand_id_74599134_fk_catalogue_brand_id` (`brand_id`),
  KEY `catalogue_product_created_by_id_51d00635` (`created_by_id`),
  KEY `catalogue_product_updated_by_id_863c7f68` (`updated_by_id`),
  CONSTRAINT `catalogue_product_brand_id_74599134_fk_catalogue_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `catalogue_brand` (`id`),
  CONSTRAINT `catalogue_product_created_by_id_51d00635_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `catalogue_product_updated_by_id_863c7f68_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_product`
--

LOCK TABLES `catalogue_product` WRITE;
/*!40000 ALTER TABLE `catalogue_product` DISABLE KEYS */;
INSERT INTO `catalogue_product` VALUES (2,'2024-05-25 21:18:14.416019','2024-05-25 21:18:14.416061',1,NULL,'Blue Star 1 Ton Portable AC (Fuzzy Logic, Copper Condenser, PC12DB)','Stay Cool and Comfortable\nBoasting an airflow volume of up to 350CFM, the Blue Star PC12DB 1-ton Portable Air Conditioner is ideal for rooms up to 120Sq.Ft. Hence, you can instantly lower the temperature in your room with this portable air conditioner, which features fast cooling that promises fast and efficient cooling. Hence, when you\'ve been out running errands in the heat, this AC\'s quick cooling will rejuvenate your body and mind as soon as you step inside.\nSleep Mode\nRest easy with the Sl',1,'None',''),(3,'2024-05-25 21:18:15.142789','2024-05-25 21:18:15.142953',1,NULL,'Blue Star Y Series 5 in 1 Convertible 1.5 Ton 3 Star Inverter Split AC with Self Diagnosis (Copper Condenser, ID318YKU)','Efficient Cooling\n\n\n\nThe Blue Star ID318YKU 1.5-ton Split Air Conditioner has an airflow volume of up to 471CFM, ensuring efficient cooling for rooms as large as 180Sq.Ft. Furthermore, this split air Conditioner incorporates advanced turbo cooling to cool down your room rapidly, offering swift relief from the heat as soon as it\'s powered on. So, your hectic schedule may wear you out, but this AC\'s immediate cooling ensures that you can quickly recharge and rejuvenate.\n\n\n\n\n\n\n5-in-1 Convertible M',1,'None',''),(4,'2024-05-25 21:18:16.156245','2024-05-25 21:18:16.156285',1,NULL,'Croma 1.5 Ton Portable AC (Dust Filter, Copper Condenser, CRLA018PAA025801)','Powerful Cooling\nWith an airflow volume of up to 450CMH, the Croma CRLA018PAA025801 1.5-ton Portable Air Conditioner delivers efficiently making it a good choice for rooms up to 170Sq.Ft. Moreover, you can experience the benefit of quick cooling with this Portable Air Conditioner, which employs fast cooling to rapidly create a comfortable indoor environment. Whether it\'s work-related stress or simply a hot day, this AC guarantees you a speedy rejuvenation as you return home.\nSleep Mode\nWith the',2,'None',''),(5,'2024-05-25 21:18:17.230228','2024-05-25 21:18:17.230272',1,NULL,'Croma 4 in 1 Convertible 1.5 Ton 3 Star Inverter Split AC with Dust Filter (2024 Model, Copper Condenser, CRLA018IND199454)','Optimal Cooling for Your Space\n\nExperience unparalleled cooling efficiency with the 1.5 Ton Split Inverter AC designed for rooms up to 180 sq.ft. Equipped with convertible modes including C1 (40%), C2 (60%), C3 (80%), and C4 (100%), this AC offers customizable cooling capacities to suit your needs, ensuring energy savings without compromising on comfort. Control the cooling capacity of your air conditioner with ease while saving energy using the unique convertible modes. Whether it\'s C1 for a l',2,'None',''),(6,'2024-05-25 21:18:18.419490','2024-05-25 21:18:18.419519',1,NULL,'Croma 4 in 1 Convertible 1.5 Ton 3 Star Inverter Split AC with Dust Filter (2024 Model, Copper Condenser, CRLA018IND283258)','Air Conditioner Modes\nExperience customized cooling comfort with a range of modes designed to suit your preferences and needs. From Auto mode for automatic temperature adjustment to Turbo mode for rapid cooling, Sleep mode for enhanced comfort during sleep, Dry mode for dehumidification, and ECO mode for energy savings, Croma air conditioner offers versatility and convenience.\n \n800 CMH High Air Flow Volume for Efficient Cooling\nStay cool even in extreme temperatures with the Croma air conditio',2,'None',''),(7,'2024-05-25 21:18:19.222451','2024-05-25 21:18:19.222500',1,NULL,'Croma 4 in 1 Convertible 1 Ton 3 Star Inverter Split AC with Dust Filter (2024 Model, Copper Condenser, CRLA012IND283257)','Efficient Inverter Rotary Compressor with Inverter Technology\nEnjoy superior cooling performance and energy efficiency with the high-efficiency inverter rotary compressor and advanced inverter technology of this air conditioner. These innovative features optimize compressor operation by adjusting cooling capacity in real-time, resulting in energy savings and reduced electricity costs.\n \nStabilizer-Free Operation\nExperience stable operation even during voltage fluctuations without the need for a',2,'None',''),(8,'2024-05-25 21:18:20.444045','2024-05-25 21:18:20.444138',1,NULL,'Godrej 5 in 1 Convertible 1.5 Ton 3 Star Inverter Split AC with Active Carbon Filter (Copper Condenser, SIC 18TTC3WWA)','Breathe Pure, Live Fresh\nWelcome to a revolutionary cooling experience with the Godrej Inverter Split AC, where cutting-edge technology meets your comfort needs. Explore the key features that make this AC a game-changer for your living space.\n \nNano-Coated Anti-Viral Filter to Your Shield Against Viruses\nExperience a new level of health assurance with the Nano-coated anti-viral filter that diligently disinfects 99.9% of viral particles. Breathe confidently as this feature actively combats airbo',3,'None',''),(9,'2024-05-25 21:18:21.780828','2024-05-25 21:18:21.781372',1,NULL,'LLOYD 5 in 1 Convertible 1.25 Ton 3 Star Inverter Split AC with 4 way Swing (Copper Condenser, GLS15I3FWSEV)','High Performance\nOffering an airflow volume of up to 640CFM, the LLOYD GLS15I3FWSEV 1.25-Ton Split Air Conditioner is a good option for cooling rooms as large as 150Sq.Ft. Moreover, this AC\'s four-way swing circulates cool air throughout the entire room efficiently by employing both horizontal and vertical louvres, ensuring an even and comfortable distribution of temperature. \nTurbo Cooling\nWith its rapid cooling capabilities powered by the Turbo Cooling technology, this split air conditioner s',4,'None',''),(10,'2024-05-25 21:18:22.633398','2024-05-25 21:18:22.633471',1,NULL,'VOLTAS Vectra 4 in 1 Convertible 1.5 Ton 3 Star Inverter Split AC with Anti Dust Filter (2023 Model, Copper Condenser)','Efficient Cooling\nThe 441CFM VOLTAS VECTRA 1.5-Ton Split Air Conditioner is an ideal choice if you’re looking for a way to effectively cool spaces up to 180Sq.Ft. What\'s more, this AC is designed to cool your indoor environment even when the ambient temperature reaches 52°C to provide relief from scorching summer conditions.\nFast Cooling\nPowered by Fast Cooling technology, this split air conditioner swiftly brings down the temperature in your room, making it the perfect choice for scorching sum',5,'None',''),(11,'2024-05-25 21:18:23.815598','2024-05-25 21:18:23.815650',1,NULL,'VOLTAS Vectra 4 in 1 Convertible 1.5 Ton 5 Star Inverter Split AC with Anti Dust Filter (Copper Condenser)','Rapid Cooling Solution\nThe VOLTAS 185V Vectra Elite 1.5-Ton Split Air Conditioner delivers an airflow volume of up to 547CFM, making it an appropriate choice for large spaces measuring up to 180Sq.Ft. Plus, featuring a Super Dry mode, this AC can effectively reduce excessive humidity in the room, ensuring a comfortable and moisture-free environment.\nTurbo Cooling Function\nThanks to its Turbo Cooling function, this split air conditioner makes sure that your room cools down quickly and efficientl',5,'None','');
/*!40000 ALTER TABLE `catalogue_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productcategory`
--

DROP TABLE IF EXISTS `catalogue_productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogue_productcategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_productcategory_created_by_id_ff9aeddf_fk_auth_user_id` (`created_by_id`),
  KEY `catalogue_productcategory_updated_by_id_50cd31a2_fk_auth_user_id` (`updated_by_id`),
  CONSTRAINT `catalogue_productcategory_created_by_id_ff9aeddf_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `catalogue_productcategory_updated_by_id_50cd31a2_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productcategory`
--

LOCK TABLES `catalogue_productcategory` WRITE;
/*!40000 ALTER TABLE `catalogue_productcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_productcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_producthighlight`
--

DROP TABLE IF EXISTS `catalogue_producthighlight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogue_producthighlight` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int DEFAULT NULL,
  `highlight` varchar(200) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_producthighlight_created_by_id_9875ec1f` (`created_by_id`),
  KEY `catalogue_producthighlight_updated_by_id_6f268b95` (`updated_by_id`),
  CONSTRAINT `catalogue_producthig_created_by_id_9875ec1f_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `catalogue_producthig_updated_by_id_6f268b95_fk_auth_user` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_producthighlight`
--

LOCK TABLES `catalogue_producthighlight` WRITE;
/*!40000 ALTER TABLE `catalogue_producthighlight` DISABLE KEYS */;
INSERT INTO `catalogue_producthighlight` VALUES (1,'2024-05-25 21:10:19.472011','2024-05-25 21:10:19.472040',1,NULL,'1 Ton','2'),(2,'2024-05-25 21:10:19.481406','2024-05-25 21:10:19.481469',1,NULL,'Copper Condenser','2'),(3,'2024-05-25 21:10:19.486817','2024-05-25 21:10:19.486849',1,NULL,'1 Year Comprehensive Warranty, 5 Years Compressor Warranty','2'),(4,'2024-05-25 21:10:19.492568','2024-05-25 21:10:19.492596',1,NULL,'For Rooms up to 120 sqft','2'),(5,'2024-05-25 21:10:19.498219','2024-05-25 21:10:19.498246',1,NULL,'Power Consumption: 1404 Watts','2'),(6,'2024-05-25 21:10:19.503777','2024-05-25 21:10:19.503805',1,NULL,'Refrigerant: R410A','2'),(7,'2024-05-25 21:10:19.510193','2024-05-25 21:10:19.510238',1,NULL,'Hydrophilic Golden Fins, Self Diagnosis','2'),(8,'2024-05-25 21:18:14.430829','2024-05-25 21:18:14.430862',1,NULL,'1 Ton','2'),(9,'2024-05-25 21:18:14.441984','2024-05-25 21:18:14.442015',1,NULL,'Copper Condenser','2'),(10,'2024-05-25 21:18:14.451914','2024-05-25 21:18:14.451953',1,NULL,'1 Year Comprehensive Warranty, 5 Years Compressor Warranty','2'),(11,'2024-05-25 21:18:14.459107','2024-05-25 21:18:14.459139',1,NULL,'For Rooms up to 120 sqft','2'),(12,'2024-05-25 21:18:14.468338','2024-05-25 21:18:14.468381',1,NULL,'Power Consumption: 1404 Watts','2'),(13,'2024-05-25 21:18:14.477812','2024-05-25 21:18:14.477860',1,NULL,'Refrigerant: R410A','2'),(14,'2024-05-25 21:18:14.486928','2024-05-25 21:18:14.486962',1,NULL,'Hydrophilic Golden Fins, Self Diagnosis','2'),(15,'2024-05-25 21:18:15.150019','2024-05-25 21:18:15.150135',1,NULL,'1.5 Ton Inverter Split  AC, 3 Star Rating','2'),(16,'2024-05-25 21:18:15.156200','2024-05-25 21:18:15.156232',1,NULL,'100% Copper Condenser','2'),(17,'2024-05-25 21:18:15.165726','2024-05-25 21:18:15.165772',1,NULL,'1 Year Comprehensive Warranty, 10 Years Compressor Warranty','2'),(18,'2024-05-25 21:18:15.171825','2024-05-25 21:18:15.171856',1,NULL,'For Rooms up to 180 sq.ft','2'),(19,'2024-05-25 21:18:15.179639','2024-05-25 21:18:15.179685',1,NULL,'Power Consumption: ‎1730 Watts','2'),(20,'2024-05-25 21:18:15.188067','2024-05-25 21:18:15.188103',1,NULL,'Refrigerant: R32','2'),(21,'2024-05-25 21:18:15.195807','2024-05-25 21:18:15.195856',1,NULL,'Inverter Rotary Compressor, Dust Filter','2'),(22,'2024-05-25 21:18:16.164978','2024-05-25 21:18:16.165019',1,NULL,'1.5 Ton Portable AC','2'),(23,'2024-05-25 21:18:16.173577','2024-05-25 21:18:16.173668',1,NULL,'Copper Condenser','2'),(24,'2024-05-25 21:18:16.186087','2024-05-25 21:18:16.186145',1,NULL,'1 Year Comprehensive Warranty, 5 Years Compressor Warranty','2'),(25,'2024-05-25 21:18:16.193605','2024-05-25 21:18:16.193664',1,NULL,'For Rooms up to 120 sqft','2'),(26,'2024-05-25 21:18:16.202816','2024-05-25 21:18:16.202903',1,NULL,'Power Consumption: 2300 W','2'),(27,'2024-05-25 21:18:16.210255','2024-05-25 21:18:16.210347',1,NULL,'Refrigerant: R410a','2'),(28,'2024-05-25 21:18:16.218917','2024-05-25 21:18:16.219072',1,NULL,'Self Diagnosis, Sleep Mode','2'),(29,'2024-05-25 21:18:17.234700','2024-05-25 21:18:17.234741',1,NULL,'1.5 Ton Split Inverter AC, 3 Star Rating','2'),(30,'2024-05-25 21:18:17.242311','2024-05-25 21:18:17.242362',1,NULL,'Copper Condenser','2'),(31,'2024-05-25 21:18:17.252310','2024-05-25 21:18:17.252356',1,NULL,'1 Year Comprehensive Warranty, 10 Years Warranty on Compressor','2'),(32,'2024-05-25 21:18:17.259577','2024-05-25 21:18:17.259634',1,NULL,'For Rooms up to 180 sq.ft','2'),(33,'2024-05-25 21:18:17.270835','2024-05-25 21:18:17.270880',1,NULL,'Power Consumption: 1720 Watt','2'),(34,'2024-05-25 21:18:17.281588','2024-05-25 21:18:17.281630',1,NULL,'Refrigerant: R32','2'),(35,'2024-05-25 21:18:17.289329','2024-05-25 21:18:17.289370',1,NULL,'Dust Filter, Self-Diagnosis System','2'),(36,'2024-05-25 21:18:18.425194','2024-05-25 21:18:18.425240',1,NULL,'1.5Ton, Inverter Split AC, 3 Star Rating','2'),(37,'2024-05-25 21:18:18.434202','2024-05-25 21:18:18.434233',1,NULL,'Copper Condenser','2'),(38,'2024-05-25 21:18:18.442521','2024-05-25 21:18:18.442581',1,NULL,'1 Year Comprehensive Warranty, 10 Years Warranty on Compressor','2'),(39,'2024-05-25 21:18:18.449386','2024-05-25 21:18:18.449425',1,NULL,'For Rooms up to 180 sq.ft','2'),(40,'2024-05-25 21:18:18.454884','2024-05-25 21:18:18.454915',1,NULL,'Power Consumption: 1580 Watts','2'),(41,'2024-05-25 21:18:18.463732','2024-05-25 21:18:18.463764',1,NULL,'Refrigerant: R32','2'),(42,'2024-05-25 21:18:18.468851','2024-05-25 21:18:18.468881',1,NULL,'Humidity Control, PM 2.5 Filter with Activated carbon and Dust Filter','2'),(43,'2024-05-25 21:18:19.229779','2024-05-25 21:18:19.229817',1,NULL,'1 Ton, Inverter Split AC, 3 Star Rating','2'),(44,'2024-05-25 21:18:19.237094','2024-05-25 21:18:19.237137',1,NULL,'Copper Condenser','2'),(45,'2024-05-25 21:18:19.247043','2024-05-25 21:18:19.247089',1,NULL,'1 Year Comprehensive Warranty, 10 Years Warranty on Compressor','2'),(46,'2024-05-25 21:18:19.254631','2024-05-25 21:18:19.254677',1,NULL,'For Rooms up to 130 sq.ft','2'),(47,'2024-05-25 21:18:19.265018','2024-05-25 21:18:19.265072',1,NULL,'Power Consumption: 1065 Watts','2'),(48,'2024-05-25 21:18:19.272217','2024-05-25 21:18:19.272269',1,NULL,'Refrigerant: R32','2'),(49,'2024-05-25 21:18:19.282063','2024-05-25 21:18:19.282139',1,NULL,'Humidity Control, PM 2.5 Filter with Activated carbon and Dust Filter','2'),(50,'2024-05-25 21:18:20.449184','2024-05-25 21:18:20.449263',1,NULL,'1.5 Ton Split Inverter AC, 3 Star Rating','2'),(51,'2024-05-25 21:18:20.458292','2024-05-25 21:18:20.458349',1,NULL,'Copper Condenser','2'),(52,'2024-05-25 21:18:20.467867','2024-05-25 21:18:20.467918',1,NULL,'1 Year Comprehensive Warranty, 10 Warranty on Compressor','2'),(53,'2024-05-25 21:18:20.478621','2024-05-25 21:18:20.478676',1,NULL,'For Rooms up to 180 sq.ft','2'),(54,'2024-05-25 21:18:20.487587','2024-05-25 21:18:20.487639',1,NULL,'Power Consumption: 1650 Watts','2'),(55,'2024-05-25 21:18:20.498687','2024-05-25 21:18:20.498780',1,NULL,'Refrigerant: R32','2'),(56,'2024-05-25 21:18:20.507344','2024-05-25 21:18:20.507389',1,NULL,'Anti-Dust Filter and Active Carbon Filter, Nano-Coated Anti-viral Filter','2'),(57,'2024-05-25 21:18:21.789266','2024-05-25 21:18:21.789951',1,NULL,'1.25 Ton Inverter Split AC, 3 Star Rating','2'),(58,'2024-05-25 21:18:21.803325','2024-05-25 21:18:21.803372',1,NULL,'Copper Condenser','2'),(59,'2024-05-25 21:18:21.815710','2024-05-25 21:18:21.815759',1,NULL,'1 Year Comprehensive Warranty, 10 Years Compressor Warranty','2'),(60,'2024-05-25 21:18:21.825202','2024-05-25 21:18:21.825254',1,NULL,'For Rooms up to 150 sqft','2'),(61,'2024-05-25 21:18:21.833377','2024-05-25 21:18:21.833416',1,NULL,'Power Consumption: 854.42 kWh','2'),(62,'2024-05-25 21:18:21.840740','2024-05-25 21:18:21.841070',1,NULL,'Refrigerant: R32','2'),(63,'2024-05-25 21:18:21.847745','2024-05-25 21:18:21.847783',1,NULL,'5 in 1 Convertible, Smart 4-way Swing','2'),(64,'2024-05-25 21:18:22.641599','2024-05-25 21:18:22.641645',1,NULL,'1.5 Ton Inverter Split AC, 3 Star Rating','2'),(65,'2024-05-25 21:18:22.651554','2024-05-25 21:18:22.651590',1,NULL,'Copper Condenser','2'),(66,'2024-05-25 21:18:22.660050','2024-05-25 21:18:22.660103',1,NULL,'1 Year Comprehensive Warranty, 10 Years Compressor Warranty','2'),(67,'2024-05-25 21:18:22.669702','2024-05-25 21:18:22.669753',1,NULL,'For Rooms up to 180 sqft','2'),(68,'2024-05-25 21:18:22.677544','2024-05-25 21:18:22.677590',1,NULL,'Power Consumption: 1615 W','2'),(69,'2024-05-25 21:18:22.686408','2024-05-25 21:18:22.686462',1,NULL,'Refrigerant: R32','2'),(70,'2024-05-25 21:18:22.694830','2024-05-25 21:18:22.694898',1,NULL,'High Ambient Cooling, Anti Microbial Air Filteration','2'),(71,'2024-05-25 21:18:23.825870','2024-05-25 21:18:23.825926',1,NULL,'1.5 Ton Inverter Split AC, 5 Star Rating','2'),(72,'2024-05-25 21:18:23.837511','2024-05-25 21:18:23.837567',1,NULL,'Copper Condenser','2'),(73,'2024-05-25 21:18:23.847126','2024-05-25 21:18:23.847216',1,NULL,'1 Year Comprehensive Warranty, 10 Years Compressor Warranty','2'),(74,'2024-05-25 21:18:23.859645','2024-05-25 21:18:23.859697',1,NULL,'For Rooms up to 180 sqft','2'),(75,'2024-05-25 21:18:23.869813','2024-05-25 21:18:23.869857',1,NULL,'Power Consumption: 1295 W','2'),(76,'2024-05-25 21:18:23.878003','2024-05-25 21:18:23.878085',1,NULL,'Refrigerant: R32','2'),(77,'2024-05-25 21:18:23.885820','2024-05-25 21:18:23.885912',1,NULL,'High Ambient Cooling, Anti Microbial Air Filteration','2');
/*!40000 ALTER TABLE `catalogue_producthighlight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productlink`
--

DROP TABLE IF EXISTS `catalogue_productlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogue_productlink` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int DEFAULT NULL,
  `link` varchar(100) NOT NULL,
  `mrp` double NOT NULL,
  `discount` double NOT NULL,
  `sales_price` double NOT NULL,
  `marketplace_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_productlin_marketplace_id_e079337d_fk_catalogue` (`marketplace_id`),
  KEY `catalogue_productlin_product_id_a978fa7e_fk_catalogue` (`product_id`),
  KEY `catalogue_productlink_created_by_id_c5127051` (`created_by_id`),
  KEY `catalogue_productlink_updated_by_id_bf618372` (`updated_by_id`),
  CONSTRAINT `catalogue_productlin_marketplace_id_e079337d_fk_catalogue` FOREIGN KEY (`marketplace_id`) REFERENCES `catalogue_marketplace` (`id`),
  CONSTRAINT `catalogue_productlin_product_id_a978fa7e_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `catalogue_productlink_created_by_id_c5127051_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `catalogue_productlink_updated_by_id_bf618372_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productlink`
--

LOCK TABLES `catalogue_productlink` WRITE;
/*!40000 ALTER TABLE `catalogue_productlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_productlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productmedia`
--

DROP TABLE IF EXISTS `catalogue_productmedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogue_productmedia` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int DEFAULT NULL,
  `is_thumbnail` tinyint(1) NOT NULL,
  `media_file` varchar(100) NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_productmed_product_id_6222c484_fk_catalogue` (`product_id`),
  KEY `catalogue_productmedia_created_by_id_dcaf8116` (`created_by_id`),
  KEY `catalogue_productmedia_updated_by_id_73bface7` (`updated_by_id`),
  CONSTRAINT `catalogue_productmed_product_id_6222c484_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `catalogue_productmedia_created_by_id_dcaf8116_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `catalogue_productmedia_updated_by_id_73bface7_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productmedia`
--

LOCK TABLES `catalogue_productmedia` WRITE;
/*!40000 ALTER TABLE `catalogue_productmedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_productmedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_producttoproductcategory`
--

DROP TABLE IF EXISTS `catalogue_producttoproductcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogue_producttoproductcategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `product_category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_producttop_product_id_77ac8a74_fk_catalogue` (`product_id`),
  KEY `catalogue_producttop_product_category_id_e2136332_fk_catalogue` (`product_category_id`),
  CONSTRAINT `catalogue_producttop_product_category_id_e2136332_fk_catalogue` FOREIGN KEY (`product_category_id`) REFERENCES `catalogue_productcategory` (`id`),
  CONSTRAINT `catalogue_producttop_product_id_77ac8a74_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_producttoproductcategory`
--

LOCK TABLES `catalogue_producttoproductcategory` WRITE;
/*!40000 ALTER TABLE `catalogue_producttoproductcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_producttoproductcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_producttoproducthighlight`
--

DROP TABLE IF EXISTS `catalogue_producttoproducthighlight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogue_producttoproducthighlight` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `highlight_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_producttop_highlight_id_366b368a_fk_catalogue` (`highlight_id`),
  KEY `catalogue_producttop_product_id_5464453d_fk_catalogue` (`product_id`),
  CONSTRAINT `catalogue_producttop_highlight_id_366b368a_fk_catalogue` FOREIGN KEY (`highlight_id`) REFERENCES `catalogue_producthighlight` (`id`),
  CONSTRAINT `catalogue_producttop_product_id_5464453d_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_producttoproducthighlight`
--

LOCK TABLES `catalogue_producttoproducthighlight` WRITE;
/*!40000 ALTER TABLE `catalogue_producttoproducthighlight` DISABLE KEYS */;
INSERT INTO `catalogue_producttoproducthighlight` VALUES (8,8,2),(9,9,2),(10,10,2),(11,11,2),(12,12,2),(13,13,2),(14,14,2),(15,15,3),(16,16,3),(17,17,3),(18,18,3),(19,19,3),(20,20,3),(21,21,3),(22,22,4),(23,23,4),(24,24,4),(25,25,4),(26,26,4),(27,27,4),(28,28,4),(29,29,5),(30,30,5),(31,31,5),(32,32,5),(33,33,5),(34,34,5),(35,35,5),(36,36,6),(37,37,6),(38,38,6),(39,39,6),(40,40,6),(41,41,6),(42,42,6),(43,43,7),(44,44,7),(45,45,7),(46,46,7),(47,47,7),(48,48,7),(49,49,7),(50,50,8),(51,51,8),(52,52,8),(53,53,8),(54,54,8),(55,55,8),(56,56,8),(57,57,9),(58,58,9),(59,59,9),(60,60,9),(61,61,9),(62,62,9),(63,63,9),(64,64,10),(65,65,10),(66,66,10),(67,67,10),(68,68,10),(69,69,10),(70,70,10),(71,71,11),(72,72,11),(73,73,11),(74,74,11),(75,75,11),(76,76,11),(77,77,11);
/*!40000 ALTER TABLE `catalogue_producttoproducthighlight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_producttospecification`
--

DROP TABLE IF EXISTS `catalogue_producttospecification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogue_producttospecification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `specification_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_producttos_product_id_3f641bf8_fk_catalogue` (`product_id`),
  KEY `catalogue_producttos_specification_id_99e44f1b_fk_catalogue` (`specification_id`),
  CONSTRAINT `catalogue_producttos_product_id_3f641bf8_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `catalogue_producttos_specification_id_99e44f1b_fk_catalogue` FOREIGN KEY (`specification_id`) REFERENCES `catalogue_specification` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=705 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_producttospecification`
--

LOCK TABLES `catalogue_producttospecification` WRITE;
/*!40000 ALTER TABLE `catalogue_producttospecification` DISABLE KEYS */;
INSERT INTO `catalogue_producttospecification` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,2,6),(7,2,7),(8,2,8),(9,2,9),(10,2,10),(11,2,11),(12,2,12),(13,2,13),(14,2,14),(15,2,15),(16,2,16),(17,2,17),(18,2,18),(19,2,19),(20,2,20),(21,2,21),(22,2,22),(23,2,23),(24,2,24),(25,2,25),(26,2,26),(27,2,27),(28,2,28),(29,2,29),(30,2,30),(31,2,31),(32,2,32),(33,2,33),(34,2,34),(35,2,35),(36,2,36),(37,2,37),(38,2,38),(39,2,39),(40,2,40),(41,2,41),(42,2,42),(43,2,43),(44,2,44),(45,2,45),(46,2,46),(47,2,47),(48,2,48),(49,2,49),(50,2,50),(51,2,51),(52,2,52),(53,2,53),(54,2,54),(55,2,55),(56,2,56),(57,2,57),(58,2,58),(59,2,59),(60,2,60),(61,2,61),(62,3,62),(63,3,63),(64,3,64),(65,3,65),(66,3,66),(67,3,67),(68,3,68),(69,3,69),(70,3,70),(71,3,71),(72,3,72),(73,3,73),(74,3,74),(75,3,75),(76,3,76),(77,3,77),(78,3,78),(79,3,79),(80,3,80),(81,3,81),(82,3,82),(83,3,83),(84,3,84),(85,3,85),(86,3,86),(87,3,87),(88,3,88),(89,3,89),(90,3,90),(91,3,91),(92,3,92),(93,3,93),(94,3,94),(95,3,95),(96,3,96),(97,3,97),(98,3,98),(99,3,99),(100,3,100),(101,3,101),(102,3,102),(103,3,103),(104,3,104),(105,3,105),(106,3,106),(107,3,107),(108,3,108),(109,3,109),(110,3,110),(111,3,111),(112,3,112),(113,3,113),(114,3,114),(115,3,115),(116,3,116),(117,3,117),(118,3,118),(119,3,119),(120,3,120),(121,3,121),(122,3,122),(123,3,123),(124,3,124),(125,3,125),(126,4,126),(127,4,127),(128,4,128),(129,4,129),(130,4,130),(131,4,131),(132,4,132),(133,4,133),(134,4,134),(135,4,135),(136,4,136),(137,4,137),(138,4,138),(139,4,139),(140,4,140),(141,4,141),(142,4,142),(143,4,143),(144,4,144),(145,4,145),(146,4,146),(147,4,147),(148,4,148),(149,4,149),(150,4,150),(151,4,151),(152,4,152),(153,4,153),(154,4,154),(155,4,155),(156,4,156),(157,4,157),(158,4,158),(159,4,159),(160,4,160),(161,4,161),(162,4,162),(163,4,163),(164,4,164),(165,4,165),(166,4,166),(167,4,167),(168,4,168),(169,4,169),(170,4,170),(171,4,171),(172,4,172),(173,4,173),(174,4,174),(175,4,175),(176,4,176),(177,4,177),(178,4,178),(179,4,179),(180,4,180),(181,4,181),(182,4,182),(183,4,183),(184,4,184),(185,4,185),(186,4,186),(187,4,187),(188,4,188),(189,4,189),(190,4,190),(191,4,191),(192,4,192),(193,5,193),(194,5,194),(195,5,195),(196,5,196),(197,5,197),(198,5,198),(199,5,199),(200,5,200),(201,5,201),(202,5,202),(203,5,203),(204,5,204),(205,5,205),(206,5,206),(207,5,207),(208,5,208),(209,5,209),(210,5,210),(211,5,211),(212,5,212),(213,5,213),(214,5,214),(215,5,215),(216,5,216),(217,5,217),(218,5,218),(219,5,219),(220,5,220),(221,5,221),(222,5,222),(223,5,223),(224,5,224),(225,5,225),(226,5,226),(227,5,227),(228,5,228),(229,5,229),(230,5,230),(231,5,231),(232,5,232),(233,5,233),(234,5,234),(235,5,235),(236,5,236),(237,5,237),(238,5,238),(239,5,239),(240,5,240),(241,5,241),(242,5,242),(243,5,243),(244,5,244),(245,5,245),(246,5,246),(247,5,247),(248,5,248),(249,5,249),(250,5,250),(251,5,251),(252,5,252),(253,5,253),(254,5,254),(255,5,255),(256,5,256),(257,5,257),(258,5,258),(259,5,259),(260,5,260),(261,5,261),(262,5,262),(263,5,263),(264,5,264),(265,5,265),(266,5,266),(267,5,267),(268,5,268),(269,5,269),(270,5,270),(271,6,271),(272,6,272),(273,6,273),(274,6,274),(275,6,275),(276,6,276),(277,6,277),(278,6,278),(279,6,279),(280,6,280),(281,6,281),(282,6,282),(283,6,283),(284,6,284),(285,6,285),(286,6,286),(287,6,287),(288,6,288),(289,6,289),(290,6,290),(291,6,291),(292,6,292),(293,6,293),(294,6,294),(295,6,295),(296,6,296),(297,6,297),(298,6,298),(299,6,299),(300,6,300),(301,6,301),(302,6,302),(303,6,303),(304,6,304),(305,6,305),(306,6,306),(307,6,307),(308,6,308),(309,6,309),(310,6,310),(311,6,311),(312,6,312),(313,6,313),(314,6,314),(315,6,315),(316,6,316),(317,6,317),(318,6,318),(319,6,319),(320,6,320),(321,6,321),(322,6,322),(323,6,323),(324,6,324),(325,6,325),(326,6,326),(327,6,327),(328,6,328),(329,6,329),(330,6,330),(331,6,331),(332,6,332),(333,6,333),(334,6,334),(335,6,335),(336,6,336),(337,6,337),(338,6,338),(339,6,339),(340,6,340),(341,6,341),(342,6,342),(343,6,343),(344,6,344),(345,6,345),(346,6,346),(347,6,347),(348,6,348),(349,6,349),(350,6,350),(351,7,351),(352,7,352),(353,7,353),(354,7,354),(355,7,355),(356,7,356),(357,7,357),(358,7,358),(359,7,359),(360,7,360),(361,7,361),(362,7,362),(363,7,363),(364,7,364),(365,7,365),(366,7,366),(367,7,367),(368,7,368),(369,7,369),(370,7,370),(371,7,371),(372,7,372),(373,7,373),(374,7,374),(375,7,375),(376,7,376),(377,7,377),(378,7,378),(379,7,379),(380,7,380),(381,7,381),(382,7,382),(383,7,383),(384,7,384),(385,7,385),(386,7,386),(387,7,387),(388,7,388),(389,7,389),(390,7,390),(391,7,391),(392,7,392),(393,7,393),(394,7,394),(395,7,395),(396,7,396),(397,7,397),(398,7,398),(399,7,399),(400,7,400),(401,7,401),(402,7,402),(403,7,403),(404,7,404),(405,7,405),(406,7,406),(407,7,407),(408,7,408),(409,7,409),(410,7,410),(411,7,411),(412,7,412),(413,7,413),(414,7,414),(415,7,415),(416,7,416),(417,7,417),(418,7,418),(419,7,419),(420,7,420),(421,7,421),(422,7,422),(423,7,423),(424,7,424),(425,7,425),(426,7,426),(427,7,427),(428,7,428),(429,7,429),(430,8,430),(431,8,431),(432,8,432),(433,8,433),(434,8,434),(435,8,435),(436,8,436),(437,8,437),(438,8,438),(439,8,439),(440,8,440),(441,8,441),(442,8,442),(443,8,443),(444,8,444),(445,8,445),(446,8,446),(447,8,447),(448,8,448),(449,8,449),(450,8,450),(451,8,451),(452,8,452),(453,8,453),(454,8,454),(455,8,455),(456,8,456),(457,8,457),(458,8,458),(459,8,459),(460,8,460),(461,8,461),(462,8,462),(463,8,463),(464,8,464),(465,8,465),(466,8,466),(467,8,467),(468,8,468),(469,8,469),(470,8,470),(471,8,471),(472,8,472),(473,8,473),(474,8,474),(475,8,475),(476,8,476),(477,8,477),(478,8,478),(479,8,479),(480,8,480),(481,8,481),(482,8,482),(483,8,483),(484,8,484),(485,8,485),(486,8,486),(487,8,487),(488,8,488),(489,8,489),(490,8,490),(491,8,491),(492,9,492),(493,9,493),(494,9,494),(495,9,495),(496,9,496),(497,9,497),(498,9,498),(499,9,499),(500,9,500),(501,9,501),(502,9,502),(503,9,503),(504,9,504),(505,9,505),(506,9,506),(507,9,507),(508,9,508),(509,9,509),(510,9,510),(511,9,511),(512,9,512),(513,9,513),(514,9,514),(515,9,515),(516,9,516),(517,9,517),(518,9,518),(519,9,519),(520,9,520),(521,9,521),(522,9,522),(523,9,523),(524,9,524),(525,9,525),(526,9,526),(527,9,527),(528,9,528),(529,9,529),(530,9,530),(531,9,531),(532,9,532),(533,9,533),(534,9,534),(535,9,535),(536,9,536),(537,9,537),(538,9,538),(539,9,539),(540,9,540),(541,9,541),(542,9,542),(543,9,543),(544,9,544),(545,9,545),(546,9,546),(547,9,547),(548,9,548),(549,9,549),(550,9,550),(551,9,551),(552,9,552),(553,9,553),(554,9,554),(555,9,555),(556,9,556),(557,9,557),(558,9,558),(559,9,559),(560,10,560),(561,10,561),(562,10,562),(563,10,563),(564,10,564),(565,10,565),(566,10,566),(567,10,567),(568,10,568),(569,10,569),(570,10,570),(571,10,571),(572,10,572),(573,10,573),(574,10,574),(575,10,575),(576,10,576),(577,10,577),(578,10,578),(579,10,579),(580,10,580),(581,10,581),(582,10,582),(583,10,583),(584,10,584),(585,10,585),(586,10,586),(587,10,587),(588,10,588),(589,10,589),(590,10,590),(591,10,591),(592,10,592),(593,10,593),(594,10,594),(595,10,595),(596,10,596),(597,10,597),(598,10,598),(599,10,599),(600,10,600),(601,10,601),(602,10,602),(603,10,603),(604,10,604),(605,10,605),(606,10,606),(607,10,607),(608,10,608),(609,10,609),(610,10,610),(611,10,611),(612,10,612),(613,10,613),(614,10,614),(615,10,615),(616,10,616),(617,10,617),(618,10,618),(619,10,619),(620,10,620),(621,10,621),(622,10,622),(623,10,623),(624,10,624),(625,10,625),(626,10,626),(627,10,627),(628,10,628),(629,10,629),(630,10,630),(631,10,631),(632,10,632),(633,11,633),(634,11,634),(635,11,635),(636,11,636),(637,11,637),(638,11,638),(639,11,639),(640,11,640),(641,11,641),(642,11,642),(643,11,643),(644,11,644),(645,11,645),(646,11,646),(647,11,647),(648,11,648),(649,11,649),(650,11,650),(651,11,651),(652,11,652),(653,11,653),(654,11,654),(655,11,655),(656,11,656),(657,11,657),(658,11,658),(659,11,659),(660,11,660),(661,11,661),(662,11,662),(663,11,663),(664,11,664),(665,11,665),(666,11,666),(667,11,667),(668,11,668),(669,11,669),(670,11,670),(671,11,671),(672,11,672),(673,11,673),(674,11,674),(675,11,675),(676,11,676),(677,11,677),(678,11,678),(679,11,679),(680,11,680),(681,11,681),(682,11,682),(683,11,683),(684,11,684),(685,11,685),(686,11,686),(687,11,687),(688,11,688),(689,11,689),(690,11,690),(691,11,691),(692,11,692),(693,11,693),(694,11,694),(695,11,695),(696,11,696),(697,11,697),(698,11,698),(699,11,699),(700,11,700),(701,11,701),(702,11,702),(703,11,703),(704,11,704);
/*!40000 ALTER TABLE `catalogue_producttospecification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_specification`
--

DROP TABLE IF EXISTS `catalogue_specification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogue_specification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int DEFAULT NULL,
  `label` varchar(100) NOT NULL,
  `value` varchar(400) NOT NULL,
  `specification_type_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_specificat_specification_type_i_ace0cf6b_fk_catalogue` (`specification_type_id`),
  KEY `catalogue_specification_created_by_id_f706ba64` (`created_by_id`),
  KEY `catalogue_specification_updated_by_id_508bcc01` (`updated_by_id`),
  CONSTRAINT `catalogue_specificat_specification_type_i_ace0cf6b_fk_catalogue` FOREIGN KEY (`specification_type_id`) REFERENCES `catalogue_specificationtype` (`id`),
  CONSTRAINT `catalogue_specification_created_by_id_f706ba64_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `catalogue_specification_updated_by_id_508bcc01_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=705 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_specification`
--

LOCK TABLES `catalogue_specification` WRITE;
/*!40000 ALTER TABLE `catalogue_specification` DISABLE KEYS */;
INSERT INTO `catalogue_specification` VALUES (1,'2024-05-25 21:18:14.495463','2024-05-25 21:18:14.495506',1,NULL,'Air Conditioner Type','Portable',1),(2,'2024-05-25 21:18:14.505559','2024-05-25 21:18:14.505587',1,NULL,'Air Conditioner Capacity','1 Ton',1),(3,'2024-05-25 21:18:14.516520','2024-05-25 21:18:14.516584',1,NULL,'Coverage Area','120 Sq.Ft.',1),(4,'2024-05-25 21:18:14.528228','2024-05-25 21:18:14.528269',1,NULL,'Approximate Coverage Area(Sq.M)','11 Sq.M.',1),(5,'2024-05-25 21:18:14.541831','2024-05-25 21:18:14.541867',1,NULL,'Installation Type','Floor Standing',1),(6,'2024-05-25 21:18:14.554942','2024-05-25 21:18:14.554992',1,NULL,'Brand','Blue Star',1),(7,'2024-05-25 21:18:14.569109','2024-05-25 21:18:14.569147',1,NULL,'Model Series','PC12DB',1),(8,'2024-05-25 21:18:14.577727','2024-05-25 21:18:14.577889',1,NULL,'Model Number','PC12DB',1),(9,'2024-05-25 21:18:14.588910','2024-05-25 21:18:14.588942',1,NULL,'Dimensions In CM (WxDxH)','46.6 x 39.6 x 76.40',1),(10,'2024-05-25 21:18:14.599924','2024-05-25 21:18:14.599963',1,NULL,'Main Unit Weight','32800 g',1),(11,'2024-05-25 21:18:14.607751','2024-05-25 21:18:14.607787',1,NULL,'Product Weight','33 Kg',1),(12,'2024-05-25 21:18:14.618019','2024-05-25 21:18:14.618125',1,NULL,'Dimensions In Inches (WxDxH)','18.38 x 15.62 x 30.11',1),(13,'2024-05-25 21:18:14.633235','2024-05-25 21:18:14.633280',1,NULL,'Air Conditioner Modes','Auto Mode',1),(14,'2024-05-25 21:18:14.642044','2024-05-25 21:18:14.642075',1,NULL,'Convertible Mode','No',1),(15,'2024-05-25 21:18:14.652736','2024-05-25 21:18:14.652778',1,NULL,'Cooling Technology','Fixed Speed',1),(16,'2024-05-25 21:18:14.659987','2024-05-25 21:18:14.660097',1,NULL,'Air Flow Volume','410 / 370 / 350 CFM',1),(17,'2024-05-25 21:18:14.670441','2024-05-25 21:18:14.670473',1,NULL,'Inverter Technology','No',1),(18,'2024-05-25 21:18:14.678208','2024-05-25 21:18:14.678249',1,NULL,'Cooling Capacity','Rated Capacity - 3590 Watts',1),(19,'2024-05-25 21:18:14.687385','2024-05-25 21:18:14.687422',1,NULL,'Ambient Temperature (Cooling/Heating) In Degree Celsius','Cooling: 50',1),(20,'2024-05-25 21:18:14.697811','2024-05-25 21:18:14.697846',1,NULL,'Cooling Power Input','Rated Capacity - 1404 Watts',1),(21,'2024-05-25 21:18:14.705772','2024-05-25 21:18:14.705803',1,NULL,'Air Conditioner Features','Hydrophilic Golden Evaporator Fins Quick Cooling |  Self-Diagnosis',1),(22,'2024-05-25 21:18:14.723021','2024-05-25 21:18:14.723049',1,NULL,'Compressor Type','Rotary',1),(23,'2024-05-25 21:18:14.732534','2024-05-25 21:18:14.732571',1,NULL,'Refrigerant Type','R-410A',1),(24,'2024-05-25 21:18:14.739063','2024-05-25 21:18:14.739134',1,NULL,'Noise Level (Indoor Unit)','51 dB  | 53 dB  | 52 dB',1),(25,'2024-05-25 21:18:14.750492','2024-05-25 21:18:14.750528',1,NULL,'Air Conditioner Filters','Anti-Bacterial Silver Coating',1),(26,'2024-05-25 21:18:14.757869','2024-05-25 21:18:14.757907',1,NULL,'Condenser Coil Type','Copper',1),(27,'2024-05-25 21:18:14.769419','2024-05-25 21:18:14.769453',1,NULL,'Louvers Swing Type','Left/Right Automatic',1),(28,'2024-05-25 21:18:14.781414','2024-05-25 21:18:14.781476',1,NULL,'Display','LCD',1),(29,'2024-05-25 21:18:14.788364','2024-05-25 21:18:14.788403',1,NULL,'Energy Efficiency (Star Rating)','No Star Rating',1),(30,'2024-05-25 21:18:14.800546','2024-05-25 21:18:14.800587',1,NULL,'Energy Efficiency Ratio (EER)','3',1),(31,'2024-05-25 21:18:14.808082','2024-05-25 21:18:14.808120',1,NULL,'Indian Seasonal Energy Efficiency Ratio (ISEER)','ISEER 2.56',1),(32,'2024-05-25 21:18:14.818682','2024-05-25 21:18:14.818710',1,NULL,'Economy Mode','Yes',1),(33,'2024-05-25 21:18:14.826835','2024-05-25 21:18:14.826877',1,NULL,'Power Consumption','1404 Watts',1),(34,'2024-05-25 21:18:14.837776','2024-05-25 21:18:14.837813',1,NULL,'Voltage Rating','230 V',1),(35,'2024-05-25 21:18:14.847753','2024-05-25 21:18:14.847791',1,NULL,'Frequency','50 Hz',1),(36,'2024-05-25 21:18:14.855690','2024-05-25 21:18:14.855725',1,NULL,'Phase','Single',1),(37,'2024-05-25 21:18:14.866932','2024-05-25 21:18:14.866969',1,NULL,'Brand Color','White',1),(38,'2024-05-25 21:18:14.874792','2024-05-25 21:18:14.874818',1,NULL,'Color','WHITE',1),(39,'2024-05-25 21:18:14.886076','2024-05-25 21:18:14.886203',1,NULL,'Documents','User-Manual  | Warranty Card',1),(40,'2024-05-25 21:18:14.894628','2024-05-25 21:18:14.894672',1,NULL,'Main product','1 x Air Conditioner U',1),(41,'2024-05-25 21:18:14.904371','2024-05-25 21:18:14.904406',1,NULL,'Accessories','RemoteControlBatteries  | RemoteControl  | InstallationKit',1),(42,'2024-05-25 21:18:14.915695','2024-05-25 21:18:14.915732',1,NULL,'Generic Name','Air Conditioner',1),(43,'2024-05-25 21:18:14.923905','2024-05-25 21:18:14.923941',1,NULL,'Dimensions in CM (W x D x H)','52.40 x 46.30 x 87.00',1),(44,'2024-05-25 21:18:14.935106','2024-05-25 21:18:14.935168',1,NULL,'Dimensions in Inches (W x D x H)','20.63 x 18.23 x 34.25',1),(45,'2024-05-25 21:18:14.949058','2024-05-25 21:18:14.949096',1,NULL,'Outdoor Unit Weight','37 Kg',1),(46,'2024-05-25 21:18:14.964267','2024-05-25 21:18:14.964304',1,NULL,'Package Dimensions in Inches (W x D x H)','20.62 x 18.22 x 34.25',1),(47,'2024-05-25 21:18:14.974544','2024-05-25 21:18:14.974579',1,NULL,'Package Weight','37 Kg',1),(48,'2024-05-25 21:18:14.984998','2024-05-25 21:18:14.985039',1,NULL,'Package Dimensions in cm (W x D x H)','52.4 x 46.3 x 87',1),(49,'2024-05-25 21:18:14.998411','2024-05-25 21:18:14.998484',1,NULL,'Warranty on Main Product','12 Months',1),(50,'2024-05-25 21:18:15.009537','2024-05-25 21:18:15.009581',1,NULL,'Additional Warranties','5 Years Compressor Warranty',1),(51,'2024-05-25 21:18:15.021195','2024-05-25 21:18:15.021240',1,NULL,'Warranty Type','Onsite',1),(52,'2024-05-25 21:18:15.033191','2024-05-25 21:18:15.033223',1,NULL,'Installation & Demo','Croma will coordinate for Installation and Demo on Chargeable Basis',1),(53,'2024-05-25 21:18:15.040923','2024-05-25 21:18:15.040962',1,NULL,'Customer Support Number','18002091177',1),(54,'2024-05-25 21:18:15.053451','2024-05-25 21:18:15.053521',1,NULL,'Customer Support Email','customerservice@bluestarindia.com',1),(55,'2024-05-25 21:18:15.064506','2024-05-25 21:18:15.064547',1,NULL,'Manufacturer/Importer/Marketer Name & Address','Manufacturer Name & Address: Blue Star | Kasturi Buildings Mohan T Advani Chowk Jamshedji Tata Road Mumbai - 400020',1),(56,'2024-05-25 21:18:15.077022','2024-05-25 21:18:15.077086',1,NULL,'Country of Manufacture','China',1),(57,'2024-05-25 21:18:15.088003','2024-05-25 21:18:15.088042',1,NULL,'Country of Brand Origin','India',1),(58,'2024-05-25 21:18:15.101082','2024-05-25 21:18:15.101112',1,NULL,'Customer Support Email','customersupport@croma.com',1),(59,'2024-05-25 21:18:15.109449','2024-05-25 21:18:15.109604',1,NULL,'Registered Name and Address','Infiniti Retail Ltd. - Unit No. 701 & 702, 7th Floor, Kaledonia, Sahar Road, Andheri (East); Mumbai - 400069. India',1),(60,'2024-05-25 21:18:15.119726','2024-05-25 21:18:15.119762',1,NULL,'Customer Support Number','1800 572 7662',1),(61,'2024-05-25 21:18:15.128809','2024-05-25 21:18:15.128855',1,NULL,'Customer Care Contact Person','Grievance Officer',1),(62,'2024-05-25 21:18:15.204767','2024-05-25 21:18:15.204809',1,NULL,'Air Conditioner Type','Split',1),(63,'2024-05-25 21:18:15.214288','2024-05-25 21:18:15.214353',1,NULL,'Air Conditioner Capacity','1.5 Ton',1),(64,'2024-05-25 21:18:15.222033','2024-05-25 21:18:15.222115',1,NULL,'Coverage Area','180 Sq.Ft.',1),(65,'2024-05-25 21:18:15.232100','2024-05-25 21:18:15.232137',1,NULL,'Approximate Coverage Area(Sq.M)','16.72 Sq.M.',1),(66,'2024-05-25 21:18:15.239273','2024-05-25 21:18:15.239312',1,NULL,'Installation Type','Wall Mount',1),(67,'2024-05-25 21:18:15.249627','2024-05-25 21:18:15.249669',1,NULL,'Brand','Blue Star',1),(68,'2024-05-25 21:18:15.257624','2024-05-25 21:18:15.257663',1,NULL,'Model Series','Y Series',1),(69,'2024-05-25 21:18:15.270459','2024-05-25 21:18:15.270506',1,NULL,'Model Number','ID318YKU',1),(70,'2024-05-25 21:18:15.289040','2024-05-25 21:18:15.289086',1,NULL,'Dimensions In CM (WxDxH)','84.50 x 19.30 x 30.00',1),(71,'2024-05-25 21:18:15.306852','2024-05-25 21:18:15.306907',1,NULL,'Dimensions In Inches (WxDxH)','33.27 x 7.60 x 11.81',1),(72,'2024-05-25 21:18:15.321668','2024-05-25 21:18:15.321710',1,NULL,'Air Conditioner Modes','Turbo Cool  | Eco mode',1),(73,'2024-05-25 21:18:15.335822','2024-05-25 21:18:15.335955',1,NULL,'Convertible Mode','Yes',1),(74,'2024-05-25 21:18:15.351026','2024-05-25 21:18:15.351073',1,NULL,'Air Flow Volume','471 CFM',1),(75,'2024-05-25 21:18:15.366889','2024-05-25 21:18:15.366935',1,NULL,'Inverter Technology','Yes',1),(76,'2024-05-25 21:18:15.377073','2024-05-25 21:18:15.377114',1,NULL,'Cooling Capacity','5010 Watts',1),(77,'2024-05-25 21:18:15.389784','2024-05-25 21:18:15.389837',1,NULL,'Rated Current','7.62 Amps',1),(78,'2024-05-25 21:18:15.404462','2024-05-25 21:18:15.404510',1,NULL,'Air Conditioner Features','5-in-1 Convertible  | Smart Ready',1),(79,'2024-05-25 21:18:15.420562','2024-05-25 21:18:15.420602',1,NULL,'Compressor Type','Inverter Rotary Compressor',1),(80,'2024-05-25 21:18:15.435349','2024-05-25 21:18:15.435399',1,NULL,'Refrigerant Type','R32',1),(81,'2024-05-25 21:18:15.450337','2024-05-25 21:18:15.450380',1,NULL,'Noise Level (Indoor Unit)','46 db',1),(82,'2024-05-25 21:18:15.460498','2024-05-25 21:18:15.460546',1,NULL,'Noise Level (Outdoor Unit)','60 db',1),(83,'2024-05-25 21:18:15.473819','2024-05-25 21:18:15.473857',1,NULL,'Air Conditioner Filters','Dust Filter',1),(84,'2024-05-25 21:18:15.486894','2024-05-25 21:18:15.486936',1,NULL,'Additional Air Conditioner Functions','Electricity Consumed In 1600 Hours : 1006.84 Units Per Year  | Comfort Sleep',1),(85,'2024-05-25 21:18:15.501869','2024-05-25 21:18:15.501914',1,NULL,'Connecting Pipe Type','Copper Pipe',1),(86,'2024-05-25 21:18:15.514215','2024-05-25 21:18:15.514265',1,NULL,'Connecting Pipe Length','3 Meters',1),(87,'2024-05-25 21:18:15.527642','2024-05-25 21:18:15.527963',1,NULL,'Condenser Coil Type','Copper',1),(88,'2024-05-25 21:18:15.548131','2024-05-25 21:18:15.548174',1,NULL,'Louvers Swing Type','Up/Down',1),(89,'2024-05-25 21:18:15.559667','2024-05-25 21:18:15.559754',1,NULL,'Other Body Features','Acoustic Jacket On Compressor  | Anti-Corrosive Blue Fins for Protection',1),(90,'2024-05-25 21:18:15.575073','2024-05-25 21:18:15.575114',1,NULL,'Additional Smart Functions','Self Diagnosis  | Leakage Detector',1),(91,'2024-05-25 21:18:15.589864','2024-05-25 21:18:15.589908',1,NULL,'Wi-Fi Supported','Yes',1),(92,'2024-05-25 21:18:15.604751','2024-05-25 21:18:15.604799',1,NULL,'Wi-Fi Features','Smart Ready',1),(93,'2024-05-25 21:18:15.619685','2024-05-25 21:18:15.619728',1,NULL,'Display','LCD',1),(94,'2024-05-25 21:18:15.634487','2024-05-25 21:18:15.634573',1,NULL,'Remote Battery Type','AAA',1),(95,'2024-05-25 21:18:15.648451','2024-05-25 21:18:15.648496',1,NULL,'Energy Efficiency (Star Rating)','3 Star',1),(96,'2024-05-25 21:18:15.658902','2024-05-25 21:18:15.658942',1,NULL,'Indian Seasonal Energy Efficiency Ratio (ISEER)','3.85',1),(97,'2024-05-25 21:18:15.675267','2024-05-25 21:18:15.675314',1,NULL,'Economy Mode','Yes',1),(98,'2024-05-25 21:18:15.760795','2024-05-25 21:18:15.760840',1,NULL,'Power Consumption','1730 Watts',1),(99,'2024-05-25 21:18:15.789228','2024-05-25 21:18:15.789266',1,NULL,'Voltage Rating','230 V',1),(100,'2024-05-25 21:18:15.804941','2024-05-25 21:18:15.804981',1,NULL,'Frequency','50Hz',1),(101,'2024-05-25 21:18:15.817665','2024-05-25 21:18:15.817703',1,NULL,'Phase','Single Phase',1),(102,'2024-05-25 21:18:15.831614','2024-05-25 21:18:15.831662',1,NULL,'Cord Length','3.5 Meters',1),(103,'2024-05-25 21:18:15.842461','2024-05-25 21:18:15.842504',1,NULL,'Maximum Operating Temperature','52 Degree Celsius',1),(104,'2024-05-25 21:18:15.854888','2024-05-25 21:18:15.854940',1,NULL,'Brand Color','White',1),(105,'2024-05-25 21:18:15.869247','2024-05-25 21:18:15.869295',1,NULL,'Color','WHITE',1),(106,'2024-05-25 21:18:15.883549','2024-05-25 21:18:15.883596',1,NULL,'Documents','Warranty Card  | User-Manual',1),(107,'2024-05-25 21:18:15.898681','2024-05-25 21:18:15.898743',1,NULL,'Main product','1 x Indoor Unit & Outdoor Unit',1),(108,'2024-05-25 21:18:15.909515','2024-05-25 21:18:15.909584',1,NULL,'Accessories','RemoteControl',1),(109,'2024-05-25 21:18:15.923191','2024-05-25 21:18:15.923242',1,NULL,'Generic Name','Air Conditioner',1),(110,'2024-05-25 21:18:15.937020','2024-05-25 21:18:15.937077',1,NULL,'Dimensions in CM (W x D x H)','85.80 x 32.70 x 53.60',1),(111,'2024-05-25 21:18:15.951531','2024-05-25 21:18:15.951576',1,NULL,'Dimensions in Inches (W x D x H)','33.78 x 12.87 x 21.10',1),(112,'2024-05-25 21:18:15.961706','2024-05-25 21:18:15.961754',1,NULL,'Package Dimensions in Inches (W x D x H)','15.75 x 47.24 x 43.5',1),(113,'2024-05-25 21:18:15.973848','2024-05-25 21:18:15.973892',1,NULL,'Package Dimensions in cm (W x D x H)','40 x 120 x 110.5',1),(114,'2024-05-25 21:18:15.988070','2024-05-25 21:18:15.988115',1,NULL,'Warranty on Main Product','12 Months',1),(115,'2024-05-25 21:18:16.002974','2024-05-25 21:18:16.003011',1,NULL,'Additional Warranties','10 Year Warranty on Inverter Compressor',1),(116,'2024-05-25 21:18:16.016591','2024-05-25 21:18:16.016669',1,NULL,'Warranty Type','Onsite',1),(117,'2024-05-25 21:18:16.032041','2024-05-25 21:18:16.032086',1,NULL,'Installation & Demo','Croma will coordinate with the brand for Installation and Demo',1),(118,'2024-05-25 21:18:16.047343','2024-05-25 21:18:16.047497',1,NULL,'Customer Support Number','18002091177',1),(119,'2024-05-25 21:18:16.060049','2024-05-25 21:18:16.060093',1,NULL,'Customer Support Email','customerservice@bluestarindia.com',1),(120,'2024-05-25 21:18:16.073612','2024-05-25 21:18:16.073652',1,NULL,'Country of Manufacture','India',1),(121,'2024-05-25 21:18:16.086709','2024-05-25 21:18:16.086755',1,NULL,'Country of Brand Origin','India',1),(122,'2024-05-25 21:18:16.101783','2024-05-25 21:18:16.101910',1,NULL,'Customer Support Email','customersupport@croma.com',1),(123,'2024-05-25 21:18:16.113961','2024-05-25 21:18:16.114011',1,NULL,'Registered Name and Address','Infiniti Retail Ltd. - Unit No. 701 & 702, 7th Floor, Kaledonia, Sahar Road, Andheri (East); Mumbai - 400069. India',1),(124,'2024-05-25 21:18:16.123826','2024-05-25 21:18:16.123870',1,NULL,'Customer Support Number','1800 572 7662',1),(125,'2024-05-25 21:18:16.137169','2024-05-25 21:18:16.137213',1,NULL,'Customer Care Contact Person','Grievance Officer',1),(126,'2024-05-25 21:18:16.230875','2024-05-25 21:18:16.231016',1,NULL,'Air Conditioner Type','Portable',1),(127,'2024-05-25 21:18:16.240595','2024-05-25 21:18:16.240639',1,NULL,'Air Conditioner Capacity','1.5 Ton',1),(128,'2024-05-25 21:18:16.253841','2024-05-25 21:18:16.253909',1,NULL,'Coverage Area','120 Sq.Ft.',1),(129,'2024-05-25 21:18:16.268745','2024-05-25 21:18:16.268861',1,NULL,'Approximate Coverage Area(Sq.M)','11.14 Sq.M.',1),(130,'2024-05-25 21:18:16.285021','2024-05-25 21:18:16.285081',1,NULL,'Installation Type','Floor Standing',1),(131,'2024-05-25 21:18:16.299556','2024-05-25 21:18:16.299674',1,NULL,'Brand','Croma',1),(132,'2024-05-25 21:18:16.310048','2024-05-25 21:18:16.310094',1,NULL,'Model Series','CRLA018PAA025801',1),(133,'2024-05-25 21:18:16.322343','2024-05-25 21:18:16.322409',1,NULL,'Model Number','CRLA018PAA025801',1),(134,'2024-05-25 21:18:16.335889','2024-05-25 21:18:16.335933',1,NULL,'Dimensions In CM (WxDxH)','36.50 x 56.80 x 77.50',1),(135,'2024-05-25 21:18:16.350003','2024-05-25 21:18:16.350048',1,NULL,'Product Weight','47 Kg',1),(136,'2024-05-25 21:18:16.361511','2024-05-25 21:18:16.361569',1,NULL,'Dimensions In Inches (WxDxH)','14.37 x 22.36 x 30.51  | 14.30 x 22.30 x 30.50',1),(137,'2024-05-25 21:18:16.373624','2024-05-25 21:18:16.373662',1,NULL,'Air Conditioner Modes','Dry Mode | Auto Mode | Cool Mode | Fan Mode',1),(138,'2024-05-25 21:18:16.386211','2024-05-25 21:18:16.386254',1,NULL,'Convertible Mode','No',1),(139,'2024-05-25 21:18:16.398747','2024-05-25 21:18:16.398783',1,NULL,'Cooling Technology','Yes',1),(140,'2024-05-25 21:18:16.409912','2024-05-25 21:18:16.409973',1,NULL,'Air Flow Volume','450 CMH',1),(141,'2024-05-25 21:18:16.423031','2024-05-25 21:18:16.423075',1,NULL,'Humidity Control','Yes',1),(142,'2024-05-25 21:18:16.439625','2024-05-25 21:18:16.439675',1,NULL,'Types of Sensors','Temprature Sensor',1),(143,'2024-05-25 21:18:16.455851','2024-05-25 21:18:16.455970',1,NULL,'Inverter Technology','No',1),(144,'2024-05-25 21:18:16.469462','2024-05-25 21:18:16.469508',1,NULL,'Cooling Capacity','5275 Watts',1),(145,'2024-05-25 21:18:16.483712','2024-05-25 21:18:16.483756',1,NULL,'Ambient Temperature (Cooling/Heating) In Degree Celsius','55�C/NA',1),(146,'2024-05-25 21:18:16.505129','2024-05-25 21:18:16.505173',1,NULL,'Rated Current','9.3 �3% A',1),(147,'2024-05-25 21:18:16.521988','2024-05-25 21:18:16.522038',1,NULL,'Cooling Power Input','2180 Watts',1),(148,'2024-05-25 21:18:16.557161','2024-05-25 21:18:16.557253',1,NULL,'Air Conditioner Features','Blue Hydrophilic Fins at evaporator | Self Diagnosis | On-Off Timer | Auto Restart (Memory)',1),(149,'2024-05-25 21:18:16.573212','2024-05-25 21:18:16.573253',1,NULL,'Compressor Type','Single Rotary Fixed Speed',1),(150,'2024-05-25 21:18:16.589656','2024-05-25 21:18:16.589699',1,NULL,'Refrigerant Type','R410a',1),(151,'2024-05-25 21:18:16.605747','2024-05-25 21:18:16.605790',1,NULL,'Temperature Settings','30',1),(152,'2024-05-25 21:18:16.623696','2024-05-25 21:18:16.623739',1,NULL,'Noise Level (Indoor Unit)','56 dB',1),(153,'2024-05-25 21:18:16.642033','2024-05-25 21:18:16.642115',1,NULL,'Air Conditioner Filters','Dust Filter',1),(154,'2024-05-25 21:18:16.668466','2024-05-25 21:18:16.668517',1,NULL,'Air Flow Type','450/430/410',1),(155,'2024-05-25 21:18:16.700405','2024-05-25 21:18:16.700765',1,NULL,'Connecting Pipe Type','Copper',1),(156,'2024-05-25 21:18:16.720677','2024-05-25 21:18:16.720804',1,NULL,'Condenser Coil Type','Copper',1),(157,'2024-05-25 21:18:16.739238','2024-05-25 21:18:16.739350',1,NULL,'Evaporator Coil Type','Copper',1),(158,'2024-05-25 21:18:16.753657','2024-05-25 21:18:16.753736',1,NULL,'Leakage Detector','Yes',1),(159,'2024-05-25 21:18:16.766728','2024-05-25 21:18:16.766771',1,NULL,'Louvers Swing Type','Left/Right Automatic',1),(160,'2024-05-25 21:18:16.777705','2024-05-25 21:18:16.777762',1,NULL,'Remote Control Type','IR',1),(161,'2024-05-25 21:18:16.789125','2024-05-25 21:18:16.789163',1,NULL,'Remote Battery Type','AAA',1),(162,'2024-05-25 21:18:16.803609','2024-05-25 21:18:16.803654',1,NULL,'Indicators','On/Off Indicator',1),(163,'2024-05-25 21:18:16.816654','2024-05-25 21:18:16.816700',1,NULL,'Energy Efficiency (Star Rating)','No Star Rating',1),(164,'2024-05-25 21:18:16.831979','2024-05-25 21:18:16.832024',1,NULL,'Indian Seasonal Energy Efficiency Ratio (ISEER)','2.28',1),(165,'2024-05-25 21:18:16.848788','2024-05-25 21:18:16.848831',1,NULL,'Economy Mode','Yes',1),(166,'2024-05-25 21:18:16.858064','2024-05-25 21:18:16.858110',1,NULL,'Power Consumption','2300 Watts',1),(167,'2024-05-25 21:18:16.873583','2024-05-25 21:18:16.873627',1,NULL,'Voltage Rating','230V',1),(168,'2024-05-25 21:18:16.886926','2024-05-25 21:18:16.886969',1,NULL,'Frequency','50Hz',1),(169,'2024-05-25 21:18:16.900857','2024-05-25 21:18:16.900907',1,NULL,'Phase','Single',1),(170,'2024-05-25 21:18:16.915046','2024-05-25 21:18:16.915088',1,NULL,'Cord Length','1.8 Meters',1),(171,'2024-05-25 21:18:16.927963','2024-05-25 21:18:16.928035',1,NULL,'Brand Color','White',1),(172,'2024-05-25 21:18:16.938862','2024-05-25 21:18:16.938908',1,NULL,'Color','WHITE',1),(173,'2024-05-25 21:18:16.954876','2024-05-25 21:18:16.955105',1,NULL,'Documents','User-Manual  | Warranty-Documents',1),(174,'2024-05-25 21:18:16.969326','2024-05-25 21:18:16.969461',1,NULL,'Main product','1 x Indoor Unit & Outdoor Unit  | 1 x Air Conditioner U',1),(175,'2024-05-25 21:18:16.983099','2024-05-25 21:18:16.983293',1,NULL,'Accessories','RemoteControl  | HosePipe',1),(176,'2024-05-25 21:18:16.997911','2024-05-25 21:18:16.998043',1,NULL,'Generic Name','Air Conditioner',1),(177,'2024-05-25 21:18:17.008529','2024-05-25 21:18:17.008579',1,NULL,'Package Dimensions in Inches (W x D x H)','16.89 x 27.91 x 34.61',1),(178,'2024-05-25 21:18:17.025242','2024-05-25 21:18:17.025308',1,NULL,'Package Weight','54 Kg',1),(179,'2024-05-25 21:18:17.039073','2024-05-25 21:18:17.039114',1,NULL,'Package Dimensions in cm (W x D x H)','42.90 x 70.90 x 87.90',1),(180,'2024-05-25 21:18:17.052279','2024-05-25 21:18:17.052346',1,NULL,'Warranty on Main Product','12 Months',1),(181,'2024-05-25 21:18:17.065183','2024-05-25 21:18:17.065232',1,NULL,'Additional Warranties','5 Years Warranty on Compressor',1),(182,'2024-05-25 21:18:17.080209','2024-05-25 21:18:17.080334',1,NULL,'Warranty Type','Onsite',1),(183,'2024-05-25 21:18:17.090239','2024-05-25 21:18:17.090271',1,NULL,'Installation & Demo','Croma will coordinate for Installation and Demo',1),(184,'2024-05-25 21:18:17.103625','2024-05-25 21:18:17.103681',1,NULL,'Installation & Demo applicable','Yes',1),(185,'2024-05-25 21:18:17.116366','2024-05-25 21:18:17.116408',1,NULL,'Customer Support Number','18005727662',1),(186,'2024-05-25 21:18:17.130503','2024-05-25 21:18:17.130556',1,NULL,'Customer Support Email','customersupport@croma.com',1),(187,'2024-05-25 21:18:17.146281','2024-05-25 21:18:17.146338',1,NULL,'Country of Manufacture','India',1),(188,'2024-05-25 21:18:17.156206','2024-05-25 21:18:17.156247',1,NULL,'Country of Brand Origin','India',1),(189,'2024-05-25 21:18:17.169607','2024-05-25 21:18:17.169648',1,NULL,'Customer Support Email','customersupport@croma.com',1),(190,'2024-05-25 21:18:17.182114','2024-05-25 21:18:17.182157',1,NULL,'Registered Name and Address','Infiniti Retail Ltd. - Unit No. 701 & 702, 7th Floor, Kaledonia, Sahar Road, Andheri (East); Mumbai - 400069. India',1),(191,'2024-05-25 21:18:17.191774','2024-05-25 21:18:17.191845',1,NULL,'Customer Support Number','1800 572 7662',1),(192,'2024-05-25 21:18:17.206248','2024-05-25 21:18:17.206289',1,NULL,'Customer Care Contact Person','Grievance Officer',1),(193,'2024-05-25 21:18:17.298422','2024-05-25 21:18:17.298469',1,NULL,'Air Conditioner Type','Split',1),(194,'2024-05-25 21:18:17.313953','2024-05-25 21:18:17.314045',1,NULL,'Air Conditioner Capacity','1.5 Ton',1),(195,'2024-05-25 21:18:17.325340','2024-05-25 21:18:17.325387',1,NULL,'Coverage Area','180 Sq.Ft.',1),(196,'2024-05-25 21:18:17.337612','2024-05-25 21:18:17.337682',1,NULL,'Approximate Coverage Area(Sq.M)','16.72 Sq.M.',1),(197,'2024-05-25 21:18:17.350052','2024-05-25 21:18:17.350094',1,NULL,'Installation Type','Wall Mount',1),(198,'2024-05-25 21:18:17.359588','2024-05-25 21:18:17.359640',1,NULL,'Brand','Croma',1),(199,'2024-05-25 21:18:17.372711','2024-05-25 21:18:17.372752',1,NULL,'Model Series','CRLA018IND199454',1),(200,'2024-05-25 21:18:17.388382','2024-05-25 21:18:17.388424',1,NULL,'Model Number','CRLA018IND199454',1),(201,'2024-05-25 21:18:17.401584','2024-05-25 21:18:17.401633',1,NULL,'Dimensions In CM (WxDxH)','83.00 x 31.50 x 23.50',1),(202,'2024-05-25 21:18:17.413996','2024-05-25 21:18:17.414041',1,NULL,'Dimensions In Inches (WxDxH)','32.68 x 12.40 x 9.25',1),(203,'2024-05-25 21:18:17.423271','2024-05-25 21:18:17.423314',1,NULL,'Air Conditioner Modes','Turbo Mode, Dry Mode, Auto Mode, Cool Mode  | Sleep Mode',1),(204,'2024-05-25 21:18:17.436213','2024-05-25 21:18:17.436255',1,NULL,'Convertible Mode','Yes',1),(205,'2024-05-25 21:18:17.450409','2024-05-25 21:18:17.450456',1,NULL,'Cooling Technology','Yes',1),(206,'2024-05-25 21:18:17.463440','2024-05-25 21:18:17.463491',1,NULL,'Air Flow Volume','950 CMH',1),(207,'2024-05-25 21:18:17.472965','2024-05-25 21:18:17.473092',1,NULL,'Humidity Control','Yes',1),(208,'2024-05-25 21:18:17.486486','2024-05-25 21:18:17.486526',1,NULL,'Types of Sensors','Temperature Sensor',1),(209,'2024-05-25 21:18:17.499820','2024-05-25 21:18:17.500387',1,NULL,'Inverter Technology','Yes',1),(210,'2024-05-25 21:18:17.515746','2024-05-25 21:18:17.515853',1,NULL,'Stabilizer Free Operation','Yes',1),(211,'2024-05-25 21:18:17.528176','2024-05-25 21:18:17.528444',1,NULL,'Cooling Capacity','4800 Watt',1),(212,'2024-05-25 21:18:17.541067','2024-05-25 21:18:17.541158',1,NULL,'Ambient Temperature (Cooling/Heating) In Degree Celsius','52 Degree Celsius',1),(213,'2024-05-25 21:18:17.562883','2024-05-25 21:18:17.562937',1,NULL,'Rated Current','6.90 Amps',1),(214,'2024-05-25 21:18:17.579321','2024-05-25 21:18:17.579394',1,NULL,'Cooling Power Input','1720 Watt',1),(215,'2024-05-25 21:18:17.589366','2024-05-25 21:18:17.589415',1,NULL,'Air Conditioner Features','Self Diagnosis, Self Cleaning, On-Off Timer  | 4 in 1 Convertible',1),(216,'2024-05-25 21:18:17.603615','2024-05-25 21:18:17.603658',1,NULL,'Compressor Type','Single Rotary Inverter Compressor',1),(217,'2024-05-25 21:18:17.616812','2024-05-25 21:18:17.616853',1,NULL,'Refrigerant Type','R-32',1),(218,'2024-05-25 21:18:17.626897','2024-05-25 21:18:17.626967',1,NULL,'Temperature Settings','31',1),(219,'2024-05-25 21:18:17.638506','2024-05-25 21:18:17.638547',1,NULL,'Noise Level (Indoor Unit)','56 db',1),(220,'2024-05-25 21:18:17.653981','2024-05-25 21:18:17.654032',1,NULL,'Noise Level (Outdoor Unit)','59.40 db',1),(221,'2024-05-25 21:18:17.667449','2024-05-25 21:18:17.667485',1,NULL,'Air Conditioner Filters','Dust Filter (White)',1),(222,'2024-05-25 21:18:17.682615','2024-05-25 21:18:17.682658',1,NULL,'Connecting Pipe Type','Copper Pipe',1),(223,'2024-05-25 21:18:17.697450','2024-05-25 21:18:17.697492',1,NULL,'Connecting Pipe Length','3 Meters',1),(224,'2024-05-25 21:18:17.717099','2024-05-25 21:18:17.717154',1,NULL,'Condenser Coil Type','Copper',1),(225,'2024-05-25 21:18:17.768263','2024-05-25 21:18:17.768323',1,NULL,'Evaporator Coil Type','Copper',1),(226,'2024-05-25 21:18:17.851610','2024-05-25 21:18:17.851653',1,NULL,'Louvers Swing Type','Up/Down Automatic',1),(227,'2024-05-25 21:18:17.871181','2024-05-25 21:18:17.871226',1,NULL,'Remote Control Type','IR',1),(228,'2024-05-25 21:18:17.899231','2024-05-25 21:18:17.899282',1,NULL,'Display','LCD',1),(229,'2024-05-25 21:18:17.921748','2024-05-25 21:18:17.921818',1,NULL,'Indicators','Hidden Display',1),(230,'2024-05-25 21:18:17.937410','2024-05-25 21:18:17.937452',1,NULL,'Energy Efficiency (Star Rating)','3 Star',1),(231,'2024-05-25 21:18:17.964935','2024-05-25 21:18:17.964983',1,NULL,'Indian Seasonal Energy Efficiency Ratio (ISEER)','3.85',1),(232,'2024-05-25 21:18:17.997686','2024-05-25 21:18:17.997733',1,NULL,'Power Consumption','1720 Watts',1),(233,'2024-05-25 21:18:18.019415','2024-05-25 21:18:18.019462',1,NULL,'Voltage Rating','230',1),(234,'2024-05-25 21:18:18.039138','2024-05-25 21:18:18.039186',1,NULL,'Frequency','50 Hz',1),(235,'2024-05-25 21:18:18.063323','2024-05-25 21:18:18.063373',1,NULL,'Phase','Single Phase',1),(236,'2024-05-25 21:18:18.083377','2024-05-25 21:18:18.083460',1,NULL,'Compatible Sockets','15A',1),(237,'2024-05-25 21:18:18.100229','2024-05-25 21:18:18.100272',1,NULL,'Grounded','Yes',1),(238,'2024-05-25 21:18:18.114203','2024-05-25 21:18:18.114269',1,NULL,'Cord Length','1.5 Meters',1),(239,'2024-05-25 21:18:18.124729','2024-05-25 21:18:18.124779',1,NULL,'Maximum Operating Temperature','52 Degree Celsius',1),(240,'2024-05-25 21:18:18.137420','2024-05-25 21:18:18.137460',1,NULL,'Brand Color','White',1),(241,'2024-05-25 21:18:18.149914','2024-05-25 21:18:18.149958',1,NULL,'Color','WHITE',1),(242,'2024-05-25 21:18:18.158514','2024-05-25 21:18:18.158609',1,NULL,'Main product','1 x Indoor Unit & Outdoor Unit',1),(243,'2024-05-25 21:18:18.168261','2024-05-25 21:18:18.168328',1,NULL,'Accessories','1 x Connecting Pipe, 1 x Remote Control,  1 x Connecting Wires, 1 x Drain Pipe, 1 x Fatner and Screw',1),(244,'2024-05-25 21:18:18.178329','2024-05-25 21:18:18.178364',1,NULL,'Package Includes','1 x Indoor Unit, 1 x Outdoor Unit, 1 x Connecting Pipe, 1 x Remote Control,  1 x Connecting Wires, 1 x Drain Pipe, 1 x Fatner and Screw',1),(245,'2024-05-25 21:18:18.185766','2024-05-25 21:18:18.185801',1,NULL,'Generic Name','Air Conditioner',1),(246,'2024-05-25 21:18:18.197425','2024-05-25 21:18:18.197458',1,NULL,'Dimensions in CM (W x D x H)','84.00 x 30.00 x 56.00',1),(247,'2024-05-25 21:18:18.204219','2024-05-25 21:18:18.204253',1,NULL,'Dimensions in Inches (W x D x H)','33.07 x 11.81 x 22.04',1),(248,'2024-05-25 21:18:18.214151','2024-05-25 21:18:18.214187',1,NULL,'Outdoor Unit Weight','24 Kg',1),(249,'2024-05-25 21:18:18.220629','2024-05-25 21:18:18.220666',1,NULL,'Package Dimensions in Inches (W x D x H)','35.51 x 14.96 x 11.81',1),(250,'2024-05-25 21:18:18.230985','2024-05-25 21:18:18.231021',1,NULL,'Package Weight','14',1),(251,'2024-05-25 21:18:18.237449','2024-05-25 21:18:18.237482',1,NULL,'Package Dimensions in cm (W x D x H)','90.20 x 38.00 X 30.00',1),(252,'2024-05-25 21:18:18.249359','2024-05-25 21:18:18.249395',1,NULL,'Outdoor Unit Package Dimensions in CM (W x D x H)','92.00 x 35.50 x 58.00',1),(253,'2024-05-25 21:18:18.255710','2024-05-25 21:18:18.255746',1,NULL,'Dimensions in Inches (W x D x H)','36.22 x 13.97 x 22.83',1),(254,'2024-05-25 21:18:18.265620','2024-05-25 21:18:18.265657',1,NULL,'Warranty on Main Product','12 Months',1),(255,'2024-05-25 21:18:18.273258','2024-05-25 21:18:18.273300',1,NULL,'Additional Warranties','Additional Warranties :10 Years on Compressor',1),(256,'2024-05-25 21:18:18.283372','2024-05-25 21:18:18.283412',1,NULL,'Warranty Type','Onsite',1),(257,'2024-05-25 21:18:18.290314','2024-05-25 21:18:18.290412',1,NULL,'Standard Warranty Includes','All Functional Part of AC and Compressor Other Than Aesthetic Parts (Plastic Parts) will Covered in Warrant',1),(258,'2024-05-25 21:18:18.301036','2024-05-25 21:18:18.301091',1,NULL,'Standard Warranty Excludes','Parts: Air Filter or Front Grill .The Warranty does not Cover Installation or Demonstration. External Accessories. Damage Parts. The Product is Not Used According to the Instructions Given in the Instruction Manual. Defects Caused by Improper Use as Determined by the Company Personnel. Modification or Alteration of Any Nature is Made in the Electrical Circuitry or Physical Construction of the Set',1),(259,'2024-05-25 21:18:18.309531','2024-05-25 21:18:18.309577',1,NULL,'How to claim Standard Warranty','Contact Croma customer care',1),(260,'2024-05-25 21:18:18.318285','2024-05-25 21:18:18.318319',1,NULL,'Installation & Demo','Croma will coordinate for Installation and Demo on Chargeable Basis',1),(261,'2024-05-25 21:18:18.328679','2024-05-25 21:18:18.328719',1,NULL,'Installation & Demo applicable','Yes',1),(262,'2024-05-25 21:18:18.336450','2024-05-25 21:18:18.336487',1,NULL,'Customer Support Number','18005727662',1),(263,'2024-05-25 21:18:18.346235','2024-05-25 21:18:18.346270',1,NULL,'Customer Support Email','customersupport@croma.com',1),(264,'2024-05-25 21:18:18.353329','2024-05-25 21:18:18.353365',1,NULL,'Manufacturer/Importer/Marketer Name & Address','Manufacturer Name & Address: Unit No. 701 702, Wing – A,7th Floor, Kaledonia, SaharRoad, Andheri East, Mumbai.400 069.',1),(265,'2024-05-25 21:18:18.362725','2024-05-25 21:18:18.362760',1,NULL,'Country of Manufacture','India',1),(266,'2024-05-25 21:18:18.370957','2024-05-25 21:18:18.370991',1,NULL,'Country of Brand Origin','India',1),(267,'2024-05-25 21:18:18.379760','2024-05-25 21:18:18.379794',1,NULL,'Customer Support Email','customersupport@croma.com',1),(268,'2024-05-25 21:18:18.387890','2024-05-25 21:18:18.387927',1,NULL,'Registered Name and Address','Infiniti Retail Ltd. - Unit No. 701 & 702, 7th Floor, Kaledonia, Sahar Road, Andheri (East); Mumbai - 400069. India',1),(269,'2024-05-25 21:18:18.398086','2024-05-25 21:18:18.398122',1,NULL,'Customer Support Number','1800 572 7662',1),(270,'2024-05-25 21:18:18.405652','2024-05-25 21:18:18.405690',1,NULL,'Customer Care Contact Person','Grievance Officer',1),(271,'2024-05-25 21:18:18.477406','2024-05-25 21:18:18.477443',1,NULL,'Air Conditioner Type','Split',1),(272,'2024-05-25 21:18:18.484275','2024-05-25 21:18:18.484309',1,NULL,'Air Conditioner Capacity','1.5 Ton',1),(273,'2024-05-25 21:18:18.491899','2024-05-25 21:18:18.491943',1,NULL,'Coverage Area','180 Sq.Ft.',1),(274,'2024-05-25 21:18:18.500776','2024-05-25 21:18:18.500828',1,NULL,'Approximate Coverage Area(Sq.M)','16.72 Sq.M.',1),(275,'2024-05-25 21:18:18.512206','2024-05-25 21:18:18.512236',1,NULL,'Installation Type','Wall Mount',1),(276,'2024-05-25 21:18:18.518819','2024-05-25 21:18:18.518856',1,NULL,'Brand','Croma',1),(277,'2024-05-25 21:18:18.528903','2024-05-25 21:18:18.528937',1,NULL,'Model Series','CRLA018IND283258',1),(278,'2024-05-25 21:18:18.536183','2024-05-25 21:18:18.536223',1,NULL,'Model Number','CRLA018IND283258',1),(279,'2024-05-25 21:18:18.545941','2024-05-25 21:18:18.545976',1,NULL,'Dimensions In CM (WxDxH)','82.00 x 22.00 x 27.00',1),(280,'2024-05-25 21:18:18.552708','2024-05-25 21:18:18.552774',1,NULL,'Product Weight','8',1),(281,'2024-05-25 21:18:18.562489','2024-05-25 21:18:18.562522',1,NULL,'Dimensions In Inches (WxDxH)','32.28 x 8.66 x 10.63',1),(282,'2024-05-25 21:18:18.570173','2024-05-25 21:18:18.570210',1,NULL,'Air Conditioner Modes','Sleep, Auto, Cool, Dry, Fan, Turbo, Eco Modes',1),(283,'2024-05-25 21:18:18.580808','2024-05-25 21:18:18.580850',1,NULL,'Convertible Mode','Yes',1),(284,'2024-05-25 21:18:18.587836','2024-05-25 21:18:18.587874',1,NULL,'Cooling Technology','Yes',1),(285,'2024-05-25 21:18:18.598944','2024-05-25 21:18:18.598982',1,NULL,'Air Flow Volume','800 CMH',1),(286,'2024-05-25 21:18:18.605988','2024-05-25 21:18:18.606027',1,NULL,'Humidity Control','Yes',1),(287,'2024-05-25 21:18:18.616186','2024-05-25 21:18:18.616216',1,NULL,'Types of Sensors','Temperature Sensor',1),(288,'2024-05-25 21:18:18.623663','2024-05-25 21:18:18.623707',1,NULL,'Inverter Technology','Yes',1),(289,'2024-05-25 21:18:18.632709','2024-05-25 21:18:18.632743',1,NULL,'Stabilizer Free Operation','Yes',1),(290,'2024-05-25 21:18:18.638764','2024-05-25 21:18:18.638795',1,NULL,'Cooling Capacity','4900 Watts',1),(291,'2024-05-25 21:18:18.649439','2024-05-25 21:18:18.649477',1,NULL,'Ambient Temperature (Cooling/Heating) In Degree Celsius','52 Degree Celsius',1),(292,'2024-05-25 21:18:18.657506','2024-05-25 21:18:18.657549',1,NULL,'Rated Current','7.10 Amps',1),(293,'2024-05-25 21:18:18.667759','2024-05-25 21:18:18.667795',1,NULL,'Cooling Power Input','1580 Watts',1),(294,'2024-05-25 21:18:18.682979','2024-05-25 21:18:18.683020',1,NULL,'Air Conditioner Features','4 In 1 Convertible Function',1),(295,'2024-05-25 21:18:18.690694','2024-05-25 21:18:18.690757',1,NULL,'Compressor Type','Single Rotary Inverter Compressor',1),(296,'2024-05-25 21:18:18.700044','2024-05-25 21:18:18.700083',1,NULL,'Refrigerant Type','R-32',1),(297,'2024-05-25 21:18:18.708171','2024-05-25 21:18:18.708213',1,NULL,'Temperature Settings','30',1),(298,'2024-05-25 21:18:18.717473','2024-05-25 21:18:18.717510',1,NULL,'Noise Level (Indoor Unit)','44 db',1),(299,'2024-05-25 21:18:18.728215','2024-05-25 21:18:18.728251',1,NULL,'Noise Level (Outdoor Unit)','55 db',1),(300,'2024-05-25 21:18:18.736893','2024-05-25 21:18:18.736923',1,NULL,'Air Conditioner Filters','Dust Filter, PM 2.5 Filter with Activated Carbon',1),(301,'2024-05-25 21:18:18.746817','2024-05-25 21:18:18.746872',1,NULL,'Air Flow Type','2-Way Swing',1),(302,'2024-05-25 21:18:18.754224','2024-05-25 21:18:18.754254',1,NULL,'Additional Air Conditioner Functions','Self Diagnosis, Self Cleaning, On-Off Timer, Auto Restart( Memory)',1),(303,'2024-05-25 21:18:18.763856','2024-05-25 21:18:18.763885',1,NULL,'Connecting Pipe Type','Copper Connecting Pipe',1),(304,'2024-05-25 21:18:18.770932','2024-05-25 21:18:18.770969',1,NULL,'Connecting Pipe Length','3 Meters',1),(305,'2024-05-25 21:18:18.781177','2024-05-25 21:18:18.781216',1,NULL,'Condenser Coil Type','Copper',1),(306,'2024-05-25 21:18:18.787876','2024-05-25 21:18:18.787915',1,NULL,'Evaporator Coil Type','Copper Evaporator Coil',1),(307,'2024-05-25 21:18:18.798786','2024-05-25 21:18:18.798825',1,NULL,'Louvers Swing Type','Up/Down Automatic  | Left/Right Manual',1),(308,'2024-05-25 21:18:18.806770','2024-05-25 21:18:18.806812',1,NULL,'Other Body Features','Blue Fins Evaporator Fins Coating and Condenser Fins Coating, Nano Shield Coated',1),(309,'2024-05-25 21:18:18.817995','2024-05-25 21:18:18.818027',1,NULL,'Display','Hidden',1),(310,'2024-05-25 21:18:18.827932','2024-05-25 21:18:18.827968',1,NULL,'Remote Control Type','IR',1),(311,'2024-05-25 21:18:18.835314','2024-05-25 21:18:18.835350',1,NULL,'Display','LCD Screen',1),(312,'2024-05-25 21:18:18.845111','2024-05-25 21:18:18.845153',1,NULL,'Remote Battery Type','AAA',1),(313,'2024-05-25 21:18:18.852231','2024-05-25 21:18:18.852271',1,NULL,'Energy Efficiency (Star Rating)','3 Star',1),(314,'2024-05-25 21:18:18.861755','2024-05-25 21:18:18.861795',1,NULL,'Indian Seasonal Energy Efficiency Ratio (ISEER)','3.94',1),(315,'2024-05-25 21:18:18.868462','2024-05-25 21:18:18.868495',1,NULL,'Economy Mode','Yes',1),(316,'2024-05-25 21:18:18.878898','2024-05-25 21:18:18.878934',1,NULL,'Power Consumption','1580 Watts',1),(317,'2024-05-25 21:18:18.886717','2024-05-25 21:18:18.886748',1,NULL,'Voltage Rating','230 v AC',1),(318,'2024-05-25 21:18:18.896113','2024-05-25 21:18:18.896147',1,NULL,'Frequency','50 Hz',1),(319,'2024-05-25 21:18:18.903695','2024-05-25 21:18:18.903736',1,NULL,'Phase','Single Phase',1),(320,'2024-05-25 21:18:18.914023','2024-05-25 21:18:18.914057',1,NULL,'Cord Length','1.5 Meters',1),(321,'2024-05-25 21:18:18.920806','2024-05-25 21:18:18.920844',1,NULL,'Maximum Operating Temperature','52 Degree Celsius',1),(322,'2024-05-25 21:18:18.930436','2024-05-25 21:18:18.930472',1,NULL,'Brand Color','White',1),(323,'2024-05-25 21:18:18.936939','2024-05-25 21:18:18.936976',1,NULL,'Color','WHITE',1),(324,'2024-05-25 21:18:18.947346','2024-05-25 21:18:18.947382',1,NULL,'Main product','1 x Indoor Unit & Outdoor Unit',1),(325,'2024-05-25 21:18:18.962851','2024-05-25 21:18:18.962909',1,NULL,'Accessories','1 x Connecting Pipe, 1 x Remote Control,  1 x Connecting Wires',1),(326,'2024-05-25 21:18:18.971176','2024-05-25 21:18:18.971213',1,NULL,'Package Includes','1 x Indoor Unit, 1 x Outdoor Unit, 1 x Connecting Pipe, 1 x Remote Control,  1 x Connecting Wires',1),(327,'2024-05-25 21:18:18.980476','2024-05-25 21:18:18.980513',1,NULL,'Generic Name','Air Conditioner',1),(328,'2024-05-25 21:18:18.986600','2024-05-25 21:18:18.986634',1,NULL,'Dimensions in CM (W x D x H)','84.00 x 30.00 x 56.00',1),(329,'2024-05-25 21:18:18.996868','2024-05-25 21:18:18.996906',1,NULL,'Dimensions in Inches (W x D x H)','33.07 x 11.81 x 22.05',1),(330,'2024-05-25 21:18:19.004557','2024-05-25 21:18:19.004595',1,NULL,'Outdoor Unit Weight','21.5 Kg',1),(331,'2024-05-25 21:18:19.015097','2024-05-25 21:18:19.015129',1,NULL,'Package Dimensions in Inches (W x D x H)','34.80 x 11.46 x 13.39',1),(332,'2024-05-25 21:18:19.022288','2024-05-25 21:18:19.022328',1,NULL,'Package Weight','12',1),(333,'2024-05-25 21:18:19.032786','2024-05-25 21:18:19.032816',1,NULL,'Package Dimensions in cm (W x D x H)','88.40 x 29.10 x 34.00',1),(334,'2024-05-25 21:18:19.042038','2024-05-25 21:18:19.042083',1,NULL,'Outdoor Unit Package Dimensions in CM (W x D x H)','91.00 x 34.50 x 61.50',1),(335,'2024-05-25 21:18:19.051079','2024-05-25 21:18:19.051121',1,NULL,'Dimensions in Inches (W x D x H)','35.83 x 13.58 x 24.21',1),(336,'2024-05-25 21:18:19.061140','2024-05-25 21:18:19.061185',1,NULL,'Outdoor Unit Package Weight','12',1),(337,'2024-05-25 21:18:19.068823','2024-05-25 21:18:19.068852',1,NULL,'Warranty on Main Product','12 Months',1),(338,'2024-05-25 21:18:19.080673','2024-05-25 21:18:19.080715',1,NULL,'Additional Warranties','10 Years Warranty on Compressor, 5 Years Warranty on PCB',1),(339,'2024-05-25 21:18:19.087717','2024-05-25 21:18:19.087753',1,NULL,'Warranty Type','Onsite',1),(340,'2024-05-25 21:18:19.098283','2024-05-25 21:18:19.098320',1,NULL,'Installation & Demo','Croma will coordinate for Installation and Demo on Chargeable Basis',1),(341,'2024-05-25 21:18:19.105976','2024-05-25 21:18:19.106024',1,NULL,'Installation & Demo applicable','Yes',1),(342,'2024-05-25 21:18:19.116677','2024-05-25 21:18:19.116712',1,NULL,'Customer Support Number','18005727662',1),(343,'2024-05-25 21:18:19.127335','2024-05-25 21:18:19.127592',1,NULL,'Customer Support Email','customersupport@croma.com',1),(344,'2024-05-25 21:18:19.134995','2024-05-25 21:18:19.135034',1,NULL,'Manufacturer/Importer/Marketer Name & Address','Manufacturer Name & Address : Infiniti Retail Ltd./Unit No.701&702,7th Floor,Kaledonia,Sahar Road, Andheri East, Mumbai-400 069, India',1),(345,'2024-05-25 21:18:19.145182','2024-05-25 21:18:19.145233',1,NULL,'Country of Manufacture','India',1),(346,'2024-05-25 21:18:19.152929','2024-05-25 21:18:19.152966',1,NULL,'Country of Brand Origin','India',1),(347,'2024-05-25 21:18:19.166865','2024-05-25 21:18:19.167027',1,NULL,'Customer Support Email','customersupport@croma.com',1),(348,'2024-05-25 21:18:19.179677','2024-05-25 21:18:19.179728',1,NULL,'Registered Name and Address','Infiniti Retail Ltd. - Unit No. 701 & 702, 7th Floor, Kaledonia, Sahar Road, Andheri (East); Mumbai - 400069. India',1),(349,'2024-05-25 21:18:19.189967','2024-05-25 21:18:19.190074',1,NULL,'Customer Support Number','1800 572 7662',1),(350,'2024-05-25 21:18:19.205246','2024-05-25 21:18:19.205300',1,NULL,'Customer Care Contact Person','Grievance Officer',1),(351,'2024-05-25 21:18:19.295328','2024-05-25 21:18:19.295440',1,NULL,'Air Conditioner Type','Split',1),(352,'2024-05-25 21:18:19.305198','2024-05-25 21:18:19.305245',1,NULL,'Air Conditioner Capacity','1 Ton',1),(353,'2024-05-25 21:18:19.315077','2024-05-25 21:18:19.315130',1,NULL,'Coverage Area','130 Sq.Ft.',1),(354,'2024-05-25 21:18:19.329466','2024-05-25 21:18:19.329508',1,NULL,'Approximate Coverage Area(Sq.M)','12.07 Sq.M.',1),(355,'2024-05-25 21:18:19.339627','2024-05-25 21:18:19.339677',1,NULL,'Installation Type','Wall Mount',1),(356,'2024-05-25 21:18:19.351901','2024-05-25 21:18:19.351955',1,NULL,'Brand','Croma',1),(357,'2024-05-25 21:18:19.364115','2024-05-25 21:18:19.364182',1,NULL,'Model Series','CRLA012IND283257',1),(358,'2024-05-25 21:18:19.374780','2024-05-25 21:18:19.374823',1,NULL,'Model Number','CRLA012IND283257',1),(359,'2024-05-25 21:18:19.387143','2024-05-25 21:18:19.387187',1,NULL,'Dimensions In CM (WxDxH)','82.00 x 22.00 x 27.00',1),(360,'2024-05-25 21:18:19.407667','2024-05-25 21:18:19.407711',1,NULL,'Product Weight','9.5',1),(361,'2024-05-25 21:18:19.423828','2024-05-25 21:18:19.423887',1,NULL,'Dimensions In Inches (WxDxH)','32.28 x 8.66 x 10.63',1),(362,'2024-05-25 21:18:19.437047','2024-05-25 21:18:19.437665',1,NULL,'Air Conditioner Modes','Sleep, Auto, Cool, Dry, Fan, Turbo, Eco Modes',1),(363,'2024-05-25 21:18:19.451686','2024-05-25 21:18:19.451728',1,NULL,'Convertible Mode','Yes',1),(364,'2024-05-25 21:18:19.465364','2024-05-25 21:18:19.465490',1,NULL,'Cooling Technology','Yes',1),(365,'2024-05-25 21:18:19.478512','2024-05-25 21:18:19.478558',1,NULL,'Air Flow Volume','700 CMH',1),(366,'2024-05-25 21:18:19.488113','2024-05-25 21:18:19.488151',1,NULL,'Humidity Control','Yes',1),(367,'2024-05-25 21:18:19.501481','2024-05-25 21:18:19.501526',1,NULL,'Types of Sensors','Temperature Sensor',1),(368,'2024-05-25 21:18:19.514689','2024-05-25 21:18:19.514770',1,NULL,'Inverter Technology','Yes',1),(369,'2024-05-25 21:18:19.533319','2024-05-25 21:18:19.533698',1,NULL,'Stabilizer Free Operation','Yes',1),(370,'2024-05-25 21:18:19.642202','2024-05-25 21:18:19.642248',1,NULL,'Cooling Capacity','3450 Watts',1),(371,'2024-05-25 21:18:19.652014','2024-05-25 21:18:19.652059',1,NULL,'Ambient Temperature (Cooling/Heating) In Degree Celsius','52 Degree Celsius',1),(372,'2024-05-25 21:18:19.666212','2024-05-25 21:18:19.666280',1,NULL,'Rated Current','4.88 Amps',1),(373,'2024-05-25 21:18:19.678678','2024-05-25 21:18:19.678722',1,NULL,'Cooling Power Input','1065 Watts',1),(374,'2024-05-25 21:18:19.687947','2024-05-25 21:18:19.688071',1,NULL,'Air Conditioner Features','4 In 1 Convertible Function',1),(375,'2024-05-25 21:18:19.701124','2024-05-25 21:18:19.701169',1,NULL,'Compressor Type','Single Rotary Inverter Compressor',1),(376,'2024-05-25 21:18:19.713140','2024-05-25 21:18:19.713185',1,NULL,'Refrigerant Type','R-32',1),(377,'2024-05-25 21:18:19.727224','2024-05-25 21:18:19.727283',1,NULL,'Temperature Settings','30',1),(378,'2024-05-25 21:18:19.736972','2024-05-25 21:18:19.737038',1,NULL,'Noise Level (Indoor Unit)','43 db',1),(379,'2024-05-25 21:18:19.749263','2024-05-25 21:18:19.749309',1,NULL,'Noise Level (Outdoor Unit)','23 db',1),(380,'2024-05-25 21:18:19.763531','2024-05-25 21:18:19.763573',1,NULL,'Air Conditioner Filters','Dust Filter, PM 2.5 Filter with Activated Carbon',1),(381,'2024-05-25 21:18:19.774066','2024-05-25 21:18:19.774111',1,NULL,'Air Flow Type','2-Way Swing',1),(382,'2024-05-25 21:18:19.786116','2024-05-25 21:18:19.786155',1,NULL,'Additional Air Conditioner Functions','Self Diagnosis, Self Cleaning, On-Off Timer, Auto Restart( Memory)',1),(383,'2024-05-25 21:18:19.802206','2024-05-25 21:18:19.802312',1,NULL,'Connecting Pipe Type','Copper Connecting Pipe',1),(384,'2024-05-25 21:18:19.818239','2024-05-25 21:18:19.818297',1,NULL,'Connecting Pipe Length','3 Meters',1),(385,'2024-05-25 21:18:19.835958','2024-05-25 21:18:19.836004',1,NULL,'Condenser Coil Type','Copper',1),(386,'2024-05-25 21:18:19.848541','2024-05-25 21:18:19.848584',1,NULL,'Evaporator Coil Type','Copper Evaporator Coil',1),(387,'2024-05-25 21:18:19.860809','2024-05-25 21:18:19.860854',1,NULL,'Louvers Swing Type','Up/Down Automatic  | Left/Right Manual',1),(388,'2024-05-25 21:18:19.870715','2024-05-25 21:18:19.870757',1,NULL,'Other Body Features','Blue Fins Evaporator Fins Coating and Condenser Fins Coating, Nano Shield Coated',1),(389,'2024-05-25 21:18:19.883875','2024-05-25 21:18:19.883919',1,NULL,'Display','Hidden',1),(390,'2024-05-25 21:18:19.897856','2024-05-25 21:18:19.897901',1,NULL,'Remote Control Type','IR',1),(391,'2024-05-25 21:18:19.908632','2024-05-25 21:18:19.908676',1,NULL,'Display','LCD Screen',1),(392,'2024-05-25 21:18:19.922693','2024-05-25 21:18:19.922836',1,NULL,'Remote Battery Type','AAA',1),(393,'2024-05-25 21:18:19.935243','2024-05-25 21:18:19.935289',1,NULL,'Energy Efficiency (Star Rating)','3 Star',1),(394,'2024-05-25 21:18:19.948759','2024-05-25 21:18:19.948805',1,NULL,'Indian Seasonal Energy Efficiency Ratio (ISEER)','3.90',1),(395,'2024-05-25 21:18:19.963800','2024-05-25 21:18:19.963843',1,NULL,'Economy Mode','Yes',1),(396,'2024-05-25 21:18:19.974918','2024-05-25 21:18:19.974966',1,NULL,'Power Consumption','1065 Watts',1),(397,'2024-05-25 21:18:19.986989','2024-05-25 21:18:19.987041',1,NULL,'Voltage Rating','230 v AC',1),(398,'2024-05-25 21:18:20.002600','2024-05-25 21:18:20.002660',1,NULL,'Frequency','50 Hz',1),(399,'2024-05-25 21:18:20.015884','2024-05-25 21:18:20.015927',1,NULL,'Phase','Single Phase',1),(400,'2024-05-25 21:18:20.028379','2024-05-25 21:18:20.028418',1,NULL,'Cord Length','1.5 Meters',1),(401,'2024-05-25 21:18:20.043942','2024-05-25 21:18:20.043987',1,NULL,'Maximum Operating Temperature','52 Degree Celsius',1),(402,'2024-05-25 21:18:20.054595','2024-05-25 21:18:20.054639',1,NULL,'Brand Color','White',1),(403,'2024-05-25 21:18:20.067842','2024-05-25 21:18:20.067927',1,NULL,'Color','WHITE',1),(404,'2024-05-25 21:18:20.081473','2024-05-25 21:18:20.081594',1,NULL,'Main product','1 x Indoor Unit & Outdoor Unit',1),(405,'2024-05-25 21:18:20.093687','2024-05-25 21:18:20.093740',1,NULL,'Accessories','1 x Connecting Pipe, 1 x Remote Control,  1 x Connecting Wires',1),(406,'2024-05-25 21:18:20.103388','2024-05-25 21:18:20.103424',1,NULL,'Package Includes','1 x Indoor Unit, 1 x Outdoor Unit, 1 x Connecting Pipe, 1 x Remote Control,  1 x Connecting Wires',1),(407,'2024-05-25 21:18:20.119891','2024-05-25 21:18:20.119938',1,NULL,'Generic Name','Air Conditioner',1),(408,'2024-05-25 21:18:20.137282','2024-05-25 21:18:20.137326',1,NULL,'Dimensions in CM (W x D x H)','84.00 x 30.00 x 56.00',1),(409,'2024-05-25 21:18:20.151687','2024-05-25 21:18:20.151738',1,NULL,'Dimensions in Inches (W x D x H)','33.07 x 11.81 x 22.05',1),(410,'2024-05-25 21:18:20.166219','2024-05-25 21:18:20.166505',1,NULL,'Outdoor Unit Weight','21.5 Kg',1),(411,'2024-05-25 21:18:20.179972','2024-05-25 21:18:20.180056',1,NULL,'Package Dimensions in Inches (W x D x H)','34.80 x 11.46 x 13.39',1),(412,'2024-05-25 21:18:20.190139','2024-05-25 21:18:20.190215',1,NULL,'Package Weight','6',1),(413,'2024-05-25 21:18:20.202552','2024-05-25 21:18:20.202630',1,NULL,'Package Dimensions in cm (W x D x H)','88.40 x 29.10 x 34.00',1),(414,'2024-05-25 21:18:20.216019','2024-05-25 21:18:20.216067',1,NULL,'Outdoor Unit Package Dimensions in CM (W x D x H)','91.00 x 34.50 x 61.50',1),(415,'2024-05-25 21:18:20.228546','2024-05-25 21:18:20.228606',1,NULL,'Dimensions in Inches (W x D x H)','35.83 x 13.58 x 24.21',1),(416,'2024-05-25 21:18:20.239254','2024-05-25 21:18:20.239364',1,NULL,'Warranty on Main Product','12 Months',1),(417,'2024-05-25 21:18:20.254314','2024-05-25 21:18:20.254362',1,NULL,'Additional Warranties','10 Years Warranty on Compressor, 5 Years Warranty on PCB',1),(418,'2024-05-25 21:18:20.269584','2024-05-25 21:18:20.269713',1,NULL,'Warranty Type','Onsite',1),(419,'2024-05-25 21:18:20.285908','2024-05-25 21:18:20.285953',1,NULL,'Installation & Demo','Croma will coordinate for Installation and Demo on Chargeable Basis',1),(420,'2024-05-25 21:18:20.301409','2024-05-25 21:18:20.301458',1,NULL,'Installation & Demo applicable','Yes',1),(421,'2024-05-25 21:18:20.315597','2024-05-25 21:18:20.315632',1,NULL,'Customer Support Number','18005727662',1),(422,'2024-05-25 21:18:20.328435','2024-05-25 21:18:20.328484',1,NULL,'Customer Support Email','customersupport@croma.com',1),(423,'2024-05-25 21:18:20.345089','2024-05-25 21:18:20.345141',1,NULL,'Manufacturer/Importer/Marketer Name & Address','Manufacturer Name & Address : Infiniti Retail Ltd./Unit No.701&702,7th Floor,Kaledonia,Sahar Road, Andheri East, Mumbai-400 069, India',1),(424,'2024-05-25 21:18:20.356784','2024-05-25 21:18:20.356838',1,NULL,'Country of Manufacture','India',1),(425,'2024-05-25 21:18:20.369813','2024-05-25 21:18:20.369857',1,NULL,'Country of Brand Origin','India',1),(426,'2024-05-25 21:18:20.382373','2024-05-25 21:18:20.382427',1,NULL,'Customer Support Email','customersupport@croma.com',1),(427,'2024-05-25 21:18:20.397205','2024-05-25 21:18:20.397257',1,NULL,'Registered Name and Address','Infiniti Retail Ltd. - Unit No. 701 & 702, 7th Floor, Kaledonia, Sahar Road, Andheri (East); Mumbai - 400069. India',1),(428,'2024-05-25 21:18:20.410423','2024-05-25 21:18:20.410520',1,NULL,'Customer Support Number','1800 572 7662',1),(429,'2024-05-25 21:18:20.420751','2024-05-25 21:18:20.420835',1,NULL,'Customer Care Contact Person','Grievance Officer',1),(430,'2024-05-25 21:18:20.516247','2024-05-25 21:18:20.516290',1,NULL,'Air Conditioner Type','Split',1),(431,'2024-05-25 21:18:20.527544','2024-05-25 21:18:20.527587',1,NULL,'Air Conditioner Capacity','1.5 Ton',1),(432,'2024-05-25 21:18:20.544079','2024-05-25 21:18:20.544185',1,NULL,'Coverage Area','180 Sq.Ft.',1),(433,'2024-05-25 21:18:20.556382','2024-05-25 21:18:20.556425',1,NULL,'Approximate Coverage Area(Sq.M)','16.72 Sq.M.',1),(434,'2024-05-25 21:18:20.568535','2024-05-25 21:18:20.568577',1,NULL,'Installation Type','Wall Mount',1),(435,'2024-05-25 21:18:20.584147','2024-05-25 21:18:20.584264',1,NULL,'Brand','Godrej',1),(436,'2024-05-25 21:18:20.596965','2024-05-25 21:18:20.597024',1,NULL,'Model Series','SIC 18TTC3WWA',1),(437,'2024-05-25 21:18:20.609350','2024-05-25 21:18:20.609617',1,NULL,'Model Number','SIC 18TTC3WWA',1),(438,'2024-05-25 21:18:20.620274','2024-05-25 21:18:20.620319',1,NULL,'Dimensions In CM (WxDxH)','97.00 x 23.50 x 30.00',1),(439,'2024-05-25 21:18:20.635770','2024-05-25 21:18:20.635915',1,NULL,'Product Weight','11.5',1),(440,'2024-05-25 21:18:20.650269','2024-05-25 21:18:20.650333',1,NULL,'Dimensions In Inches (WxDxH)','38.19 x 9.25 x 11.81',1),(441,'2024-05-25 21:18:20.663432','2024-05-25 21:18:20.663475',1,NULL,'Air Conditioner Modes','Cool, Auto, Dry, Fan, Sleep, Turbo',1),(442,'2024-05-25 21:18:20.676600','2024-05-25 21:18:20.676676',1,NULL,'Convertible Mode','Yes',1),(443,'2024-05-25 21:18:20.686478','2024-05-25 21:18:20.686545',1,NULL,'Air Flow Volume','675 CFM',1),(444,'2024-05-25 21:18:20.703400','2024-05-25 21:18:20.703504',1,NULL,'Inverter Technology','Yes',1),(445,'2024-05-25 21:18:20.718630','2024-05-25 21:18:20.718675',1,NULL,'Cooling Capacity','5000 Watt / 1.5 TR',1),(446,'2024-05-25 21:18:20.732124','2024-05-25 21:18:20.732230',1,NULL,'Ambient Temperature (Cooling/Heating) In Degree Celsius','52 Degree Celsius',1),(447,'2024-05-25 21:18:20.744630','2024-05-25 21:18:20.744673',1,NULL,'Rated Current','7.6 Amps',1),(448,'2024-05-25 21:18:20.759708','2024-05-25 21:18:20.759784',1,NULL,'Air Conditioner Features','5-in-1 Convertible, Acoustic Jacket on Compressor, Anti-Freeze Thermostat, Clock, Evaporator Fins: Hydrophilic Blue Fins, Hygiene Plus / Blow (Self Clean), i-Sense',1),(449,'2024-05-25 21:18:20.772814','2024-05-25 21:18:20.772872',1,NULL,'Compressor Type','Rotary Compressor',1),(450,'2024-05-25 21:18:20.786638','2024-05-25 21:18:20.786679',1,NULL,'Refrigerant Type','R32',1),(451,'2024-05-25 21:18:20.802341','2024-05-25 21:18:20.802390',1,NULL,'Noise Level (Indoor Unit)','High: 48dB, Medium: 44dB, Low: 40dB',1),(452,'2024-05-25 21:18:20.815024','2024-05-25 21:18:20.815068',1,NULL,'Noise Level (Outdoor Unit)','58dB',1),(453,'2024-05-25 21:18:20.830497','2024-05-25 21:18:20.830539',1,NULL,'Air Conditioner Filters','Nano Coated Antiviral Filter  | Active Carbon Filter  | Anti-Dust Filter',1),(454,'2024-05-25 21:18:20.839340','2024-05-25 21:18:20.839384',1,NULL,'Additional Air Conditioner Functions','Auto Restart With Memory Function, Self Diagnosis, Timer On / Off, Silent Operation, Dehumidification',1),(455,'2024-05-25 21:18:20.853709','2024-05-25 21:18:20.853759',1,NULL,'Connecting Pipe Length','3 Meters',1),(456,'2024-05-25 21:18:20.868169','2024-05-25 21:18:20.868211',1,NULL,'Condenser Coil Type','Copper',1),(457,'2024-05-25 21:18:20.884560','2024-05-25 21:18:20.884664',1,NULL,'Louvers Swing Type','Up/Down Manual',1),(458,'2024-05-25 21:18:20.899189','2024-05-25 21:18:20.899235',1,NULL,'Display','Hidden Display in IDU',1),(459,'2024-05-25 21:18:20.912600','2024-05-25 21:18:20.912648',1,NULL,'Energy Efficiency (Star Rating)','3 Star',1),(460,'2024-05-25 21:18:20.928508','2024-05-25 21:18:20.928553',1,NULL,'Indian Seasonal Energy Efficiency Ratio (ISEER)','3.95',1),(461,'2024-05-25 21:18:20.946329','2024-05-25 21:18:20.946370',1,NULL,'Power Consumption','1650 Watts',1),(462,'2024-05-25 21:18:20.957608','2024-05-25 21:18:20.957654',1,NULL,'Voltage Rating','230 V',1),(463,'2024-05-25 21:18:20.970535','2024-05-25 21:18:20.970578',1,NULL,'Frequency','50 Hz',1),(464,'2024-05-25 21:18:20.985399','2024-05-25 21:18:20.985445',1,NULL,'Phase','Single Phase',1),(465,'2024-05-25 21:18:20.999580','2024-05-25 21:18:20.999624',1,NULL,'Brand Color','White (Chrome)',1),(466,'2024-05-25 21:18:21.014459','2024-05-25 21:18:21.014606',1,NULL,'Color','WHITE',1),(467,'2024-05-25 21:18:21.029067','2024-05-25 21:18:21.029190',1,NULL,'Main product','1 x Indoor Unit & Outdoor Unit',1),(468,'2024-05-25 21:18:21.044275','2024-05-25 21:18:21.044331',1,NULL,'Accessories','1 x Remote Control, 1 x Interconnecting Pipe',1),(469,'2024-05-25 21:18:21.054253','2024-05-25 21:18:21.054341',1,NULL,'Package Includes','1 x Air Conditioner, 1 x Remote Control, 1 x 3m Copper Wire, 1 x Interconnecting Pipe, 1 x User Manual, 1 x Warranty Card',1),(470,'2024-05-25 21:18:21.070839','2024-05-25 21:18:21.070931',1,NULL,'Generic Name','Air Conditioner',1),(471,'2024-05-25 21:18:21.088137','2024-05-25 21:18:21.088297',1,NULL,'Dimensions in CM (W x D x H)','78.00 x 32.00 x 54.50',1),(472,'2024-05-25 21:18:21.100033','2024-05-25 21:18:21.100076',1,NULL,'Dimensions in Inches (W x D x H)','30.71 x 12.60 x 21.46',1),(473,'2024-05-25 21:18:21.177197','2024-05-25 21:18:21.177243',1,NULL,'Outdoor Unit Weight','26 Kg',1),(474,'2024-05-25 21:18:21.261073','2024-05-25 21:18:21.261120',1,NULL,'Package Dimensions in Inches (W x D x H)','40.48 x 14.50 x 11.73',1),(475,'2024-05-25 21:18:21.297916','2024-05-25 21:18:21.297964',1,NULL,'Package Weight','13',1),(476,'2024-05-25 21:18:21.316289','2024-05-25 21:18:21.316334',1,NULL,'Package Dimensions in cm (W x D x H)','103.80 x 37.20 x 30.10',1),(477,'2024-05-25 21:18:21.429059','2024-05-25 21:18:21.429108',1,NULL,'Outdoor Unit Package Weight','13',1),(478,'2024-05-25 21:18:21.445485','2024-05-25 21:18:21.445531',1,NULL,'Warranty on Main Product','12 Months',1),(479,'2024-05-25 21:18:21.463091','2024-05-25 21:18:21.463144',1,NULL,'Additional Warranties','10 Years Compressor Warranty',1),(480,'2024-05-25 21:18:21.477894','2024-05-25 21:18:21.477963',1,NULL,'Warranty Type','Onsite',1),(481,'2024-05-25 21:18:21.498673','2024-05-25 21:18:21.498717',1,NULL,'Installation & Demo','Croma will coordinate with the brand for Installation and Demo',1),(482,'2024-05-25 21:18:21.526618','2024-05-25 21:18:21.526665',1,NULL,'Installation & Demo applicable','Yes',1),(483,'2024-05-25 21:18:21.549262','2024-05-25 21:18:21.549308',1,NULL,'Customer Support Number','18005727662',1),(484,'2024-05-25 21:18:21.581921','2024-05-25 21:18:21.581969',1,NULL,'Customer Support Email','customersupport@croma.com',1),(485,'2024-05-25 21:18:21.600552','2024-05-25 21:18:21.600609',1,NULL,'Manufacturer/Importer/Marketer Name & Address','Manufacturer Name & Address: Godrej  Boyce Manufacturing Company Limited, Pirojshanagar, Vikhroli, Mumbai - 400079, India',1),(486,'2024-05-25 21:18:21.631453','2024-05-25 21:18:21.631535',1,NULL,'Country of Manufacture','India',1),(487,'2024-05-25 21:18:21.653615','2024-05-25 21:18:21.653660',1,NULL,'Country of Brand Origin','India',1),(488,'2024-05-25 21:18:21.674022','2024-05-25 21:18:21.674067',1,NULL,'Customer Support Email','customersupport@croma.com',1),(489,'2024-05-25 21:18:21.696816','2024-05-25 21:18:21.696863',1,NULL,'Registered Name and Address','Infiniti Retail Ltd. - Unit No. 701 & 702, 7th Floor, Kaledonia, Sahar Road, Andheri (East); Mumbai - 400069. India',1),(490,'2024-05-25 21:18:21.720817','2024-05-25 21:18:21.720864',1,NULL,'Customer Support Number','1800 572 7662',1),(491,'2024-05-25 21:18:21.738475','2024-05-25 21:18:21.738543',1,NULL,'Customer Care Contact Person','Grievance Officer',1),(492,'2024-05-25 21:18:21.859583','2024-05-25 21:18:21.859671',1,NULL,'Air Conditioner Type','Split',1),(493,'2024-05-25 21:18:21.869777','2024-05-25 21:18:21.869824',1,NULL,'Air Conditioner Capacity','1.25 Ton',1),(494,'2024-05-25 21:18:21.880280','2024-05-25 21:18:21.880325',1,NULL,'Coverage Area','150 Sq.Ft.',1),(495,'2024-05-25 21:18:21.898003','2024-05-25 21:18:21.898053',1,NULL,'Approximate Coverage Area(Sq.M)','13.93 Sq.M.',1),(496,'2024-05-25 21:18:21.913742','2024-05-25 21:18:21.914009',1,NULL,'Installation Type','Wall Mount',1),(497,'2024-05-25 21:18:21.928584','2024-05-25 21:18:21.928685',1,NULL,'Brand','LLOYD',1),(498,'2024-05-25 21:18:21.937968','2024-05-25 21:18:21.938027',1,NULL,'Model Series','GLS15I3FWSEV',1),(499,'2024-05-25 21:18:21.951632','2024-05-25 21:18:21.951673',1,NULL,'Model Number','GLS15I3FWSEV',1),(500,'2024-05-25 21:18:21.968132','2024-05-25 21:18:21.968253',1,NULL,'Dimensions In CM (WxDxH)','87.00 x 21.70 x 30.00',1),(501,'2024-05-25 21:18:21.983528','2024-05-25 21:18:21.983575',1,NULL,'Product Weight','9.7 Kg',1),(502,'2024-05-25 21:18:21.997839','2024-05-25 21:18:21.997894',1,NULL,'Dimensions In Inches (WxDxH)','34.25 x 8.54 x 11.81',1),(503,'2024-05-25 21:18:22.011469','2024-05-25 21:18:22.011536',1,NULL,'Convertible Mode','Yes',1),(504,'2024-05-25 21:18:22.075835','2024-05-25 21:18:22.075877',1,NULL,'Cooling Technology','Turbo Cool',1),(505,'2024-05-25 21:18:22.094595','2024-05-25 21:18:22.094628',1,NULL,'Air Flow Volume','Maximum Air Circulation: 640 CFM',1),(506,'2024-05-25 21:18:22.104448','2024-05-25 21:18:22.104492',1,NULL,'Humidity Control','Yes',1),(507,'2024-05-25 21:18:22.115253','2024-05-25 21:18:22.115291',1,NULL,'Inverter Technology','Yes',1),(508,'2024-05-25 21:18:22.125390','2024-05-25 21:18:22.125433',1,NULL,'Stabilizer Free Operation','Yes',1),(509,'2024-05-25 21:18:22.132622','2024-05-25 21:18:22.132657',1,NULL,'Cooling Capacity','918.14 BTU/H',1),(510,'2024-05-25 21:18:22.143443','2024-05-25 21:18:22.143511',1,NULL,'Air Conditioner Features','Strong Dehumidifier  | Valve Protection Cover  | Connecting Cable Length: 10m  | Cools at 52 Degree C  | Low Gas Detection',1),(511,'2024-05-25 21:18:22.150873','2024-05-25 21:18:22.150901',1,NULL,'Compressor Type','Rotary Compressor',1),(512,'2024-05-25 21:18:22.163277','2024-05-25 21:18:22.163313',1,NULL,'Refrigerant Type','R32 Eco Friendly Refrigerant',1),(513,'2024-05-25 21:18:22.171494','2024-05-25 21:18:22.171564',1,NULL,'Noise Level (Indoor Unit)','32dB',1),(514,'2024-05-25 21:18:22.181050','2024-05-25 21:18:22.181085',1,NULL,'Noise Level (Outdoor Unit)','55dB',1),(515,'2024-05-25 21:18:22.189574','2024-05-25 21:18:22.189650',1,NULL,'Air Conditioner Filters','PM 2.5 Anti-Viral Dust Filter',1),(516,'2024-05-25 21:18:22.199049','2024-05-25 21:18:22.199081',1,NULL,'Additional Air Conditioner Functions','Blow Function',1),(517,'2024-05-25 21:18:22.212097','2024-05-25 21:18:22.212135',1,NULL,'Connecting Pipe Length','10 Meters',1),(518,'2024-05-25 21:18:22.218889','2024-05-25 21:18:22.218921',1,NULL,'Condenser Coil Type','Copper',1),(519,'2024-05-25 21:18:22.229243','2024-05-25 21:18:22.229278',1,NULL,'Evaporator Coil Type','Bare Fin Cond Coils | Golden Fin Eva Coils',1),(520,'2024-05-25 21:18:22.235305','2024-05-25 21:18:22.235341',1,NULL,'Louvers Swing Type','Up/Down  | Left/Right',1),(521,'2024-05-25 21:18:22.247371','2024-05-25 21:18:22.247424',1,NULL,'Display','LCD',1),(522,'2024-05-25 21:18:22.257341','2024-05-25 21:18:22.257590',1,NULL,'Indicators','Clean Filter Indicator',1),(523,'2024-05-25 21:18:22.264922','2024-05-25 21:18:22.264959',1,NULL,'Energy Efficiency (Star Rating)','3 Star',1),(524,'2024-05-25 21:18:22.276056','2024-05-25 21:18:22.276132',1,NULL,'Indian Seasonal Energy Efficiency Ratio (ISEER)','3.85',1),(525,'2024-05-25 21:18:22.283196','2024-05-25 21:18:22.283231',1,NULL,'Power Consumption','1485 Watts',1),(526,'2024-05-25 21:18:22.292632','2024-05-25 21:18:22.292667',1,NULL,'Voltage Rating','220V~240V',1),(527,'2024-05-25 21:18:22.299635','2024-05-25 21:18:22.299679',1,NULL,'Frequency','50Hz',1),(528,'2024-05-25 21:18:22.309353','2024-05-25 21:18:22.309389',1,NULL,'Phase','Single Phase',1),(529,'2024-05-25 21:18:22.318746','2024-05-25 21:18:22.318777',1,NULL,'Brand Color','White',1),(530,'2024-05-25 21:18:22.328101','2024-05-25 21:18:22.328137',1,NULL,'Color','WHITE',1),(531,'2024-05-25 21:18:22.335542','2024-05-25 21:18:22.335581',1,NULL,'Documents','User-Manual  | Warranty-Documents',1),(532,'2024-05-25 21:18:22.346469','2024-05-25 21:18:22.346503',1,NULL,'Main product','1 x Indoor Unit & Outdoor Unit',1),(533,'2024-05-25 21:18:22.354291','2024-05-25 21:18:22.354333',1,NULL,'Accessories','RemoteControl  | Battery | Drain Pipe | Installation Kit | Connecting Wire | Installation Pipe | Copper Wire-3 Meter',1),(534,'2024-05-25 21:18:22.364186','2024-05-25 21:18:22.364221',1,NULL,'Package Includes','1 x  Indoor Unit, 1 x Outdoor Unit, 1 x Connecting Wire, 1 x Installation Pipe, 1 x Copper Wire, 1 x Remote, 1 x Remote Battery, 1 x Drain Pipe, 1 x Installation Kit',1),(535,'2024-05-25 21:18:22.371518','2024-05-25 21:18:22.371560',1,NULL,'Others','Copper wire-3 Meter  | Installation Pipe  | Connecting Wire',1),(536,'2024-05-25 21:18:22.380747','2024-05-25 21:18:22.380783',1,NULL,'Generic Name','Air Conditioner',1),(537,'2024-05-25 21:18:22.391888','2024-05-25 21:18:22.391929',1,NULL,'Dimensions in CM (W x D x H)','87.00 x 36.50 x 56.00',1),(538,'2024-05-25 21:18:22.398788','2024-05-25 21:18:22.398820',1,NULL,'Dimensions in Inches (W x D x H)','34.25 x 14.37 x 22.05',1),(539,'2024-05-25 21:18:22.411002','2024-05-25 21:18:22.411053',1,NULL,'Outdoor Unit Weight','26.9 Kg',1),(540,'2024-05-25 21:18:22.418018','2024-05-25 21:18:22.418049',1,NULL,'Package Dimensions in Inches (W x D x H)','34.25 x 10.63 x 14.17',1),(541,'2024-05-25 21:18:22.429237','2024-05-25 21:18:22.429271',1,NULL,'Package Weight','11.1 Kg',1),(542,'2024-05-25 21:18:22.438014','2024-05-25 21:18:22.438057',1,NULL,'Package Dimensions in cm (W x D x H)','87.00 x 27.00 x 36.00',1),(543,'2024-05-25 21:18:22.447723','2024-05-25 21:18:22.447753',1,NULL,'Outdoor Unit Package Dimensions in CM (W x D x H)','92.50 x 38.30 x 59.80',1),(544,'2024-05-25 21:18:22.459454','2024-05-25 21:18:22.459488',1,NULL,'Dimensions in Inches (W x D x H)','36.42 x 15.08 x 23.54',1),(545,'2024-05-25 21:18:22.469397','2024-05-25 21:18:22.469443',1,NULL,'Outdoor Unit Package Weight','26.3 Kg',1),(546,'2024-05-25 21:18:22.480018','2024-05-25 21:18:22.480056',1,NULL,'Warranty on Main Product','12 Months',1),(547,'2024-05-25 21:18:22.487685','2024-05-25 21:18:22.487729',1,NULL,'Additional Warranties','10 Years Warranty on Compressor',1),(548,'2024-05-25 21:18:22.497867','2024-05-25 21:18:22.497901',1,NULL,'Standard Warranty Includes','Manufacturing Defect',1),(549,'2024-05-25 21:18:22.508041','2024-05-25 21:18:22.508077',1,NULL,'Standard Warranty Excludes','Physical Damage',1),(550,'2024-05-25 21:18:22.516471','2024-05-25 21:18:22.516502',1,NULL,'Installation & Demo','Croma will coordinate with the brand for Installation and Demo',1),(551,'2024-05-25 21:18:22.526958','2024-05-25 21:18:22.526989',1,NULL,'Installation & Demo applicable','Yes',1),(552,'2024-05-25 21:18:22.534333','2024-05-25 21:18:22.534367',1,NULL,'Customer Support Number','8045775666',1),(553,'2024-05-25 21:18:22.543466','2024-05-25 21:18:22.543537',1,NULL,'Customer Support Email','perfectservice@lloydmail.com',1),(554,'2024-05-25 21:18:22.558117','2024-05-25 21:18:22.558183',1,NULL,'Country of Manufacture','India',1),(555,'2024-05-25 21:18:22.569409','2024-05-25 21:18:22.569455',1,NULL,'Country of Brand Origin','India',1),(556,'2024-05-25 21:18:22.579310','2024-05-25 21:18:22.579361',1,NULL,'Customer Support Email','customersupport@croma.com',1),(557,'2024-05-25 21:18:22.591902','2024-05-25 21:18:22.591945',1,NULL,'Registered Name and Address','Infiniti Retail Ltd. - Unit No. 701 & 702, 7th Floor, Kaledonia, Sahar Road, Andheri (East); Mumbai - 400069. India',1),(558,'2024-05-25 21:18:22.604679','2024-05-25 21:18:22.604722',1,NULL,'Customer Support Number','1800 572 7662',1),(559,'2024-05-25 21:18:22.616429','2024-05-25 21:18:22.616467',1,NULL,'Customer Care Contact Person','Grievance Officer',1),(560,'2024-05-25 21:18:22.704131','2024-05-25 21:18:22.704173',1,NULL,'Air Conditioner Type','Split',1),(561,'2024-05-25 21:18:22.714419','2024-05-25 21:18:22.714457',1,NULL,'Air Conditioner Capacity','1.5 Ton',1),(562,'2024-05-25 21:18:22.723372','2024-05-25 21:18:22.723428',1,NULL,'Coverage Area','180 Sq.Ft.',1),(563,'2024-05-25 21:18:22.735325','2024-05-25 21:18:22.735368',1,NULL,'Approximate Coverage Area(Sq.M)','16.72 Sq.M.',1),(564,'2024-05-25 21:18:22.747923','2024-05-25 21:18:22.747968',1,NULL,'Installation Type','Wall Mount',1),(565,'2024-05-25 21:18:22.757772','2024-05-25 21:18:22.757810',1,NULL,'Brand','VOLTAS',1),(566,'2024-05-25 21:18:22.768233','2024-05-25 21:18:22.768267',1,NULL,'Model Series','Vectra',1),(567,'2024-05-25 21:18:22.779136','2024-05-25 21:18:22.779173',1,NULL,'Model Number','4503448',1),(568,'2024-05-25 21:18:22.787623','2024-05-25 21:18:22.787665',1,NULL,'Dimensions In CM (WxDxH)','84.00 x 21.00 x 29.00',1),(569,'2024-05-25 21:18:22.799201','2024-05-25 21:18:22.799242',1,NULL,'Product Weight','9.5 Kg',1),(570,'2024-05-25 21:18:22.815966','2024-05-25 21:18:22.816006',1,NULL,'Dimensions In Inches (WxDxH)','33.07 x 8.27 x 11.42',1),(571,'2024-05-25 21:18:22.832979','2024-05-25 21:18:22.833013',1,NULL,'Air Conditioner Modes','4-Steps Adjustable Cooling  | Turbo Cooling  | Sleep Mode  | Energy Saver Mode',1),(572,'2024-05-25 21:18:22.850109','2024-05-25 21:18:22.850153',1,NULL,'Convertible Mode','Yes',1),(573,'2024-05-25 21:18:22.865342','2024-05-25 21:18:22.865380',1,NULL,'Air Flow Volume','441 CFM',1),(574,'2024-05-25 21:18:22.877832','2024-05-25 21:18:22.877873',1,NULL,'Types of Sensors','Temperature Sensors',1),(575,'2024-05-25 21:18:22.893630','2024-05-25 21:18:22.893670',1,NULL,'Inverter Technology','Yes',1),(576,'2024-05-25 21:18:22.905134','2024-05-25 21:18:22.905183',1,NULL,'Stabilizer Free Operation','Yes',1),(577,'2024-05-25 21:18:22.915972','2024-05-25 21:18:22.916010',1,NULL,'Cooling Capacity','4800 Watts',1),(578,'2024-05-25 21:18:22.926034','2024-05-25 21:18:22.926069',1,NULL,'Air Conditioner Features','High Ambient Cooling  | SuperDry  | 4 in 1 convertible  | Timer',1),(579,'2024-05-25 21:18:22.934074','2024-05-25 21:18:22.934104',1,NULL,'Compressor Type','High EER Rotary- BLDC',1),(580,'2024-05-25 21:18:22.943753','2024-05-25 21:18:22.943794',1,NULL,'Refrigerant Type','R-32',1),(581,'2024-05-25 21:18:22.950518','2024-05-25 21:18:22.950554',1,NULL,'Noise Level (Indoor Unit)','46 db',1),(582,'2024-05-25 21:18:22.959595','2024-05-25 21:18:22.959627',1,NULL,'Air Conditioner Filters','Anti Dust Filter  | Anti-Bacterial',1),(583,'2024-05-25 21:18:22.967129','2024-05-25 21:18:22.967170',1,NULL,'Additional Air Conditioner Functions','Self Diagnosis  | Eco- Friendly Refrigerant  | Anti Microbial Air FIlteration',1),(584,'2024-05-25 21:18:22.979594','2024-05-25 21:18:22.979623',1,NULL,'Connecting Pipe Type','Copper',1),(585,'2024-05-25 21:18:22.987084','2024-05-25 21:18:22.987142',1,NULL,'Connecting Pipe Length','3 Meters',1),(586,'2024-05-25 21:18:22.998618','2024-05-25 21:18:22.998655',1,NULL,'Condenser Coil Type','Copper',1),(587,'2024-05-25 21:18:23.010393','2024-05-25 21:18:23.010434',1,NULL,'Evaporator Coil Type','Blue Evaporator Fin',1),(588,'2024-05-25 21:18:23.017854','2024-05-25 21:18:23.017882',1,NULL,'Louvers Swing Type','Up/Down',1),(589,'2024-05-25 21:18:23.028611','2024-05-25 21:18:23.028646',1,NULL,'Display','Yes',1),(590,'2024-05-25 21:18:23.037226','2024-05-25 21:18:23.037269',1,NULL,'Parental Control','Child Lock',1),(591,'2024-05-25 21:18:23.047692','2024-05-25 21:18:23.047746',1,NULL,'Child lock','Yes',1),(592,'2024-05-25 21:18:23.060000','2024-05-25 21:18:23.060038',1,NULL,'Display','LCD',1),(593,'2024-05-25 21:18:23.066745','2024-05-25 21:18:23.066782',1,NULL,'Remote Additional Features','Glow Buttons',1),(594,'2024-05-25 21:18:23.077811','2024-05-25 21:18:23.077838',1,NULL,'Energy Efficiency (Star Rating)','3 Star',1),(595,'2024-05-25 21:18:23.086107','2024-05-25 21:18:23.086151',1,NULL,'Indian Seasonal Energy Efficiency Ratio (ISEER)','3.81',1),(596,'2024-05-25 21:18:23.097545','2024-05-25 21:18:23.097599',1,NULL,'Power Consumption','1615 Watts',1),(597,'2024-05-25 21:18:23.116026','2024-05-25 21:18:23.116086',1,NULL,'Voltage Rating','230 Volts',1),(598,'2024-05-25 21:18:23.132844','2024-05-25 21:18:23.132892',1,NULL,'Frequency','50 Hz',1),(599,'2024-05-25 21:18:23.151656','2024-05-25 21:18:23.151702',1,NULL,'Phase','Single Phase',1),(600,'2024-05-25 21:18:23.172385','2024-05-25 21:18:23.172443',1,NULL,'Cord Length','3 Meters',1),(601,'2024-05-25 21:18:23.193333','2024-05-25 21:18:23.193375',1,NULL,'Maximum Operating Temperature','52 Degree Celsius',1),(602,'2024-05-25 21:18:23.208743','2024-05-25 21:18:23.208797',1,NULL,'Brand Color','White',1),(603,'2024-05-25 21:18:23.220902','2024-05-25 21:18:23.220945',1,NULL,'Color','WHITE',1),(604,'2024-05-25 21:18:23.236662','2024-05-25 21:18:23.236704',1,NULL,'Documents','User-Manual  | Warranty Card',1),(605,'2024-05-25 21:18:23.251389','2024-05-25 21:18:23.251442',1,NULL,'Main product','1 x Indoor Unit & Outdoor Unit',1),(606,'2024-05-25 21:18:23.274829','2024-05-25 21:18:23.274877',1,NULL,'Accessories','Inter Connecting Pipe | 1 x Remote | 2 x Batteries | Inter Connecting Wire',1),(607,'2024-05-25 21:18:23.374468','2024-05-25 21:18:23.374512',1,NULL,'Package Includes','1 x Indoor Unit & Outdoor Unit',1),(608,'2024-05-25 21:18:23.392392','2024-05-25 21:18:23.392460',1,NULL,'Others','Connecting Wire',1),(609,'2024-05-25 21:18:23.426004','2024-05-25 21:18:23.426048',1,NULL,'Generic Name','Air Conditioner',1),(610,'2024-05-25 21:18:23.436818','2024-05-25 21:18:23.436863',1,NULL,'Dimensions in CM (W x D x H)','83.50 x 29.50 x 55.50',1),(611,'2024-05-25 21:18:23.449506','2024-05-25 21:18:23.449554',1,NULL,'Dimensions in Inches (W x D x H)','32.87 x 11.61 x 21.85',1),(612,'2024-05-25 21:18:23.464244','2024-05-25 21:18:23.464286',1,NULL,'Outdoor Unit Weight','27.5 Kg',1),(613,'2024-05-25 21:18:23.478410','2024-05-25 21:18:23.478453',1,NULL,'Package Dimensions in Inches (W x D x H)','35.03 x 10.23 x 13.38',1),(614,'2024-05-25 21:18:23.492628','2024-05-25 21:18:23.492698',1,NULL,'Package Weight','11.5 Kg',1),(615,'2024-05-25 21:18:23.504337','2024-05-25 21:18:23.504380',1,NULL,'Package Dimensions in cm (W x D x H)','89.00 x 26.00 x 34.00',1),(616,'2024-05-25 21:18:23.516709','2024-05-25 21:18:23.516743',1,NULL,'Outdoor Unit Package Dimensions in CM (W x D x H)','88.50 x 34.50 x 60.50',1),(617,'2024-05-25 21:18:23.530438','2024-05-25 21:18:23.530512',1,NULL,'Dimensions in Inches (W x D x H)','34.84 x 13.58 x 23.82',1),(618,'2024-05-25 21:18:23.542868','2024-05-25 21:18:23.542912',1,NULL,'Outdoor Unit Package Weight','27.5 Kg',1),(619,'2024-05-25 21:18:23.554076','2024-05-25 21:18:23.554122',1,NULL,'Warranty on Main Product','12 Months',1),(620,'2024-05-25 21:18:23.568128','2024-05-25 21:18:23.568175',1,NULL,'Additional Warranties','1 Year Warranty on Condenser | 10 Years Warranty on Compressor',1),(621,'2024-05-25 21:18:23.584637','2024-05-25 21:18:23.584685',1,NULL,'Warranty Type','Onsite',1),(622,'2024-05-25 21:18:23.602594','2024-05-25 21:18:23.602640',1,NULL,'Installation & Demo','Croma will coordinate with the brand for Installation and Demo',1),(623,'2024-05-25 21:18:23.620460','2024-05-25 21:18:23.620515',1,NULL,'Installation & Demo applicable','Yes',1),(624,'2024-05-25 21:18:23.638221','2024-05-25 21:18:23.638273',1,NULL,'Customer Support Number','18605994555  | 9650694555',1),(625,'2024-05-25 21:18:23.655643','2024-05-25 21:18:23.655690',1,NULL,'Customer Support Email','vcare@voltas.com',1),(626,'2024-05-25 21:18:23.675276','2024-05-25 21:18:23.675399',1,NULL,'Manufacturer/Importer/Marketer Name & Address','Manufacturer Name & Address: Voltas Limited. Voltas House \'A\' Block Dr. Babasaheb Ambedkar Rd Chinchpokli Mumbai - 400 033 India',1),(627,'2024-05-25 21:18:23.694754','2024-05-25 21:18:23.694800',1,NULL,'Country of Manufacture','India',1),(628,'2024-05-25 21:18:23.718184','2024-05-25 21:18:23.718232',1,NULL,'Country of Brand Origin','India',1),(629,'2024-05-25 21:18:23.735741','2024-05-25 21:18:23.735899',1,NULL,'Customer Support Email','customersupport@croma.com',1),(630,'2024-05-25 21:18:23.755241','2024-05-25 21:18:23.755292',1,NULL,'Registered Name and Address','Infiniti Retail Ltd. - Unit No. 701 & 702, 7th Floor, Kaledonia, Sahar Road, Andheri (East); Mumbai - 400069. India',1),(631,'2024-05-25 21:18:23.775327','2024-05-25 21:18:23.775375',1,NULL,'Customer Support Number','1800 572 7662',1),(632,'2024-05-25 21:18:23.791174','2024-05-25 21:18:23.791494',1,NULL,'Customer Care Contact Person','Grievance Officer',1),(633,'2024-05-25 21:18:23.894901','2024-05-25 21:18:23.894986',1,NULL,'Air Conditioner Type','Split',1),(634,'2024-05-25 21:18:23.904987','2024-05-25 21:18:23.905033',1,NULL,'Air Conditioner Capacity','1.5 Ton',1),(635,'2024-05-25 21:18:23.914617','2024-05-25 21:18:23.914658',1,NULL,'Coverage Area','180 Sq.Ft.',1),(636,'2024-05-25 21:18:23.927577','2024-05-25 21:18:23.927620',1,NULL,'Approximate Coverage Area(Sq.M)','16.72 Sq.M.',1),(637,'2024-05-25 21:18:23.940265','2024-05-25 21:18:23.940355',1,NULL,'Installation Type','Wall Mount',1),(638,'2024-05-25 21:18:23.956824','2024-05-25 21:18:23.956871',1,NULL,'Brand','VOLTAS',1),(639,'2024-05-25 21:18:23.969846','2024-05-25 21:18:23.969893',1,NULL,'Model Series','Vectra',1),(640,'2024-05-25 21:18:23.984901','2024-05-25 21:18:23.984945',1,NULL,'Model Number','185V Vectra Elite',1),(641,'2024-05-25 21:18:23.996844','2024-05-25 21:18:23.996902',1,NULL,'Dimensions In CM (WxDxH)','96.00 x 23.50 x 31.70',1),(642,'2024-05-25 21:18:24.010181','2024-05-25 21:18:24.010225',1,NULL,'Product Weight','11.1 Kg',1),(643,'2024-05-25 21:18:24.031510','2024-05-25 21:18:24.031552',1,NULL,'Dimensions In Inches (WxDxH)','37.80 x 9.25 x 12.48',1),(644,'2024-05-25 21:18:24.046379','2024-05-25 21:18:24.046420',1,NULL,'Air Conditioner Modes','Turbo Mode  | Auto Clean  | Energy Saver Mode  | Sleep Mode',1),(645,'2024-05-25 21:18:24.060904','2024-05-25 21:18:24.060944',1,NULL,'Convertible Mode','Yes',1),(646,'2024-05-25 21:18:24.071377','2024-05-25 21:18:24.071424',1,NULL,'Air Flow Volume','547 CFM',1),(647,'2024-05-25 21:18:24.083943','2024-05-25 21:18:24.084003',1,NULL,'Inverter Technology','Yes',1),(648,'2024-05-25 21:18:24.096446','2024-05-25 21:18:24.096490',1,NULL,'Stabilizer Free Operation','Yes',1),(649,'2024-05-25 21:18:24.111020','2024-05-25 21:18:24.111064',1,NULL,'Cooling Capacity','4900 Watts',1),(650,'2024-05-25 21:18:24.123555','2024-05-25 21:18:24.123603',1,NULL,'Air Conditioner Features','High Ambient Cooling  | Self Diagnosis  | Super Dry  | 4 in 1 convertible  | Quick Dehumidification  | Timer',1),(651,'2024-05-25 21:18:24.134557','2024-05-25 21:18:24.134605',1,NULL,'Compressor Type','High EER Rotary - BLDC',1),(652,'2024-05-25 21:18:24.150233','2024-05-25 21:18:24.150286',1,NULL,'Refrigerant Type','R-32',1),(653,'2024-05-25 21:18:24.164657','2024-05-25 21:18:24.164700',1,NULL,'Noise Level (Indoor Unit)','45 db',1),(654,'2024-05-25 21:18:24.180694','2024-05-25 21:18:24.180759',1,NULL,'Air Conditioner Filters','Anti Dust Filter  | Anti Microbial Air FIlteration',1),(655,'2024-05-25 21:18:24.198489','2024-05-25 21:18:24.198535',1,NULL,'Additional Air Conditioner Functions','4 Step Adjustable Cooling  | Eco Friendly Refrigerant  | Wide Voltage Range Operation',1),(656,'2024-05-25 21:18:24.217553','2024-05-25 21:18:24.217621',1,NULL,'Connecting Pipe Type','Copper Connecting Pipe',1),(657,'2024-05-25 21:18:24.231728','2024-05-25 21:18:24.231771',1,NULL,'Connecting Pipe Length','3 Meters',1),(658,'2024-05-25 21:18:24.255332','2024-05-25 21:18:24.255539',1,NULL,'Condenser Coil Type','Copper',1),(659,'2024-05-25 21:18:24.267375','2024-05-25 21:18:24.267447',1,NULL,'Evaporator Coil Type','Blue Evaporator Fin',1),(660,'2024-05-25 21:18:24.284530','2024-05-25 21:18:24.284574',1,NULL,'Louvers Swing Type','Up/Down',1),(661,'2024-05-25 21:18:24.300043','2024-05-25 21:18:24.300094',1,NULL,'Other Body Features','Anti-Corrosive Coating',1),(662,'2024-05-25 21:18:24.316876','2024-05-25 21:18:24.316939',1,NULL,'Display','Yes',1),(663,'2024-05-25 21:18:24.335219','2024-05-25 21:18:24.335264',1,NULL,'Parental Control','Child Lock',1),(664,'2024-05-25 21:18:24.350741','2024-05-25 21:18:24.350789',1,NULL,'Child lock','Yes',1),(665,'2024-05-25 21:18:24.366420','2024-05-25 21:18:24.366497',1,NULL,'Display','LCD',1),(666,'2024-05-25 21:18:24.382482','2024-05-25 21:18:24.382534',1,NULL,'Remote Additional Features','Glow Buttons',1),(667,'2024-05-25 21:18:24.399458','2024-05-25 21:18:24.399560',1,NULL,'Energy Efficiency (Star Rating)','5 Star',1),(668,'2024-05-25 21:18:24.419178','2024-05-25 21:18:24.419244',1,NULL,'Indian Seasonal Energy Efficiency Ratio (ISEER)','5',1),(669,'2024-05-25 21:18:24.434311','2024-05-25 21:18:24.434400',1,NULL,'Power Consumption','1295 Watts',1),(670,'2024-05-25 21:18:24.449776','2024-05-25 21:18:24.450023',1,NULL,'Voltage Rating','220 V',1),(671,'2024-05-25 21:18:24.466920','2024-05-25 21:18:24.466960',1,NULL,'Frequency','50 Hz',1),(672,'2024-05-25 21:18:24.483478','2024-05-25 21:18:24.483539',1,NULL,'Phase','Single Phase',1),(673,'2024-05-25 21:18:24.499173','2024-05-25 21:18:24.499218',1,NULL,'Cord Length','3 Meters',1),(674,'2024-05-25 21:18:24.514244','2024-05-25 21:18:24.514290',1,NULL,'Maximum Operating Temperature','52 Degree Celsius',1),(675,'2024-05-25 21:18:24.527641','2024-05-25 21:18:24.528497',1,NULL,'Brand Color','White',1),(676,'2024-05-25 21:18:24.543774','2024-05-25 21:18:24.543819',1,NULL,'Color','WHITE',1),(677,'2024-05-25 21:18:24.559521','2024-05-25 21:18:24.559568',1,NULL,'Documents','User-Manual  | Warranty Card',1),(678,'2024-05-25 21:18:24.574944','2024-05-25 21:18:24.575065',1,NULL,'Main product','1 x Indoor Unit & Outdoor Unit',1),(679,'2024-05-25 21:18:24.589903','2024-05-25 21:18:24.589955',1,NULL,'Accessories','RemoteControl  | 3 m Length Inter Connecting Copper Pipe',1),(680,'2024-05-25 21:18:24.604691','2024-05-25 21:18:24.604742',1,NULL,'Package Includes','1 x Indoor Unit & Outdoor Unit',1),(681,'2024-05-25 21:18:24.615105','2024-05-25 21:18:24.615148',1,NULL,'Generic Name','Air Conditioner',1),(682,'2024-05-25 21:18:24.631256','2024-05-25 21:18:24.631311',1,NULL,'Dimensions in CM (W x D x H)','83.50 x 29.50 x 55.50',1),(683,'2024-05-25 21:18:24.645829','2024-05-25 21:18:24.645870',1,NULL,'Dimensions in Inches (W x D x H)','32.87 x 11.61 x 21.85',1),(684,'2024-05-25 21:18:24.659759','2024-05-25 21:18:24.659802',1,NULL,'Outdoor Unit Weight','26 Kg',1),(685,'2024-05-25 21:18:24.677592','2024-05-25 21:18:24.677647',1,NULL,'Package Dimensions in Inches (W x D x H)','39.76 x 11.22 x 14.45',1),(686,'2024-05-25 21:18:24.694320','2024-05-25 21:18:24.694368',1,NULL,'Package Weight','13.8 Kg',1),(687,'2024-05-25 21:18:24.711996','2024-05-25 21:18:24.712041',1,NULL,'Package Dimensions in cm (W x D x H)','101.00 x 28.50 x 36.70',1),(688,'2024-05-25 21:18:24.730715','2024-05-25 21:18:24.730756',1,NULL,'Outdoor Unit Package Dimensions in CM (W x D x H)','88.50 x 34.50 x 60.50',1),(689,'2024-05-25 21:18:24.750709','2024-05-25 21:18:24.750786',1,NULL,'Dimensions in Inches (W x D x H)','34.84 x 13.58 x 23.81',1),(690,'2024-05-25 21:18:24.768434','2024-05-25 21:18:24.768477',1,NULL,'Outdoor Unit Package Weight','30.3 Kg',1),(691,'2024-05-25 21:18:24.793963','2024-05-25 21:18:24.794009',1,NULL,'Warranty on Main Product','12 Months',1),(692,'2024-05-25 21:18:24.812349','2024-05-25 21:18:24.812546',1,NULL,'Additional Warranties','1 Year Warranty on Condenser| 10 Years Warranty on Compressor',1),(693,'2024-05-25 21:18:24.828387','2024-05-25 21:18:24.828433',1,NULL,'Warranty Type','Onsite',1),(694,'2024-05-25 21:18:24.843455','2024-05-25 21:18:24.843500',1,NULL,'Installation & Demo','Croma will coordinate with the brand for Installation and Demo',1),(695,'2024-05-25 21:18:24.859331','2024-05-25 21:18:24.859371',1,NULL,'Installation & Demo applicable','Yes',1),(696,'2024-05-25 21:18:24.876559','2024-05-25 21:18:24.876606',1,NULL,'Customer Support Number','18605994555  | 9650694555',1),(697,'2024-05-25 21:18:24.892847','2024-05-25 21:18:24.892893',1,NULL,'Customer Support Email','vcare@voltas.com',1),(698,'2024-05-25 21:18:24.912603','2024-05-25 21:18:24.912650',1,NULL,'Manufacturer/Importer/Marketer Name & Address','Manufacturer Name & Address: Voltas Limited. Voltas House \'A\' Block Dr. Babasaheb Ambedkar Rd Chinchpokli Mumbai - 400 033 India',1),(699,'2024-05-25 21:18:24.935399','2024-05-25 21:18:24.935477',1,NULL,'Country of Manufacture','India',1),(700,'2024-05-25 21:18:24.955338','2024-05-25 21:18:24.955437',1,NULL,'Country of Brand Origin','India',1),(701,'2024-05-25 21:18:24.965937','2024-05-25 21:18:24.965992',1,NULL,'Customer Support Email','customersupport@croma.com',1),(702,'2024-05-25 21:18:24.981581','2024-05-25 21:18:24.981625',1,NULL,'Registered Name and Address','Infiniti Retail Ltd. - Unit No. 701 & 702, 7th Floor, Kaledonia, Sahar Road, Andheri (East); Mumbai - 400069. India',1),(703,'2024-05-25 21:18:24.995273','2024-05-25 21:18:24.995345',1,NULL,'Customer Support Number','1800 572 7662',1),(704,'2024-05-25 21:18:25.009610','2024-05-25 21:18:25.009654',1,NULL,'Customer Care Contact Person','Grievance Officer',1);
/*!40000 ALTER TABLE `catalogue_specification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_specificationtype`
--

DROP TABLE IF EXISTS `catalogue_specificationtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogue_specificationtype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_specificationtype_created_by_id_063a8327` (`created_by_id`),
  KEY `catalogue_specificationtype_updated_by_id_2f1bbe80` (`updated_by_id`),
  CONSTRAINT `catalogue_specificat_created_by_id_063a8327_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `catalogue_specificat_updated_by_id_2f1bbe80_fk_auth_user` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_specificationtype`
--

LOCK TABLES `catalogue_specificationtype` WRITE;
/*!40000 ALTER TABLE `catalogue_specificationtype` DISABLE KEYS */;
INSERT INTO `catalogue_specificationtype` VALUES (1,'2024-05-25 21:13:41.428517','2024-05-25 21:13:53.314118',1,NULL,'default','air_conditioner_category');
/*!40000 ALTER TABLE `catalogue_specificationtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-05-25 21:13:41.430123','1','SpecificationType object (1)',1,'[{\"added\": {}}]',11,1),(2,'2024-05-25 21:13:53.316341','1','SpecificationType object (1)',2,'[{\"changed\": {\"fields\": [\"Type\"]}}]',11,1),(3,'2024-05-25 21:18:03.181278','1','Product object (1)',3,'',9,1),(4,'2024-05-25 21:42:44.163044','10','ImportantSpecification object (10)',3,'',17,1),(5,'2024-05-25 21:42:44.179454','9','ImportantSpecification object (9)',3,'',17,1),(6,'2024-05-25 21:42:44.183774','8','ImportantSpecification object (8)',3,'',17,1),(7,'2024-05-25 21:42:44.187640','7','ImportantSpecification object (7)',3,'',17,1),(8,'2024-05-25 21:42:44.191300','6','ImportantSpecification object (6)',3,'',17,1),(9,'2024-05-25 21:42:44.194269','5','ImportantSpecification object (5)',3,'',17,1),(10,'2024-05-25 21:42:44.197193','4','ImportantSpecification object (4)',3,'',17,1),(11,'2024-05-25 21:42:44.200992','3','ImportantSpecification object (3)',3,'',17,1),(12,'2024-05-25 21:42:44.204932','2','ImportantSpecification object (2)',3,'',17,1),(13,'2024-05-25 21:42:44.209465','1','ImportantSpecification object (1)',3,'',17,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(24,'blog','blogpost'),(7,'catalogue','brand'),(17,'catalogue','importantspecification'),(8,'catalogue','marketplace'),(9,'catalogue','product'),(18,'catalogue','productcategory'),(10,'catalogue','producthighlight'),(16,'catalogue','productlink'),(15,'catalogue','productmedia'),(19,'catalogue','producttoproductcategory'),(14,'catalogue','producttoproducthighlight'),(13,'catalogue','producttospecification'),(12,'catalogue','specification'),(11,'catalogue','specificationtype'),(5,'contenttypes','contenttype'),(20,'index','tile'),(23,'index','tilecategory'),(21,'index','tilefilter'),(22,'index','tiletotilefilter'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-05-16 08:20:39.881550'),(2,'auth','0001_initial','2024-05-16 08:20:40.620003'),(3,'admin','0001_initial','2024-05-16 08:20:40.833572'),(4,'admin','0002_logentry_remove_auto_add','2024-05-16 08:20:40.852598'),(5,'admin','0003_logentry_add_action_flag_choices','2024-05-16 08:20:40.869970'),(6,'contenttypes','0002_remove_content_type_name','2024-05-16 08:20:40.982046'),(7,'auth','0002_alter_permission_name_max_length','2024-05-16 08:20:41.056891'),(8,'auth','0003_alter_user_email_max_length','2024-05-16 08:20:41.082389'),(9,'auth','0004_alter_user_username_opts','2024-05-16 08:20:41.095685'),(10,'auth','0005_alter_user_last_login_null','2024-05-16 08:20:41.172636'),(11,'auth','0006_require_contenttypes_0002','2024-05-16 08:20:41.177208'),(12,'auth','0007_alter_validators_add_error_messages','2024-05-16 08:20:41.186254'),(13,'auth','0008_alter_user_username_max_length','2024-05-16 08:20:41.257465'),(14,'auth','0009_alter_user_last_name_max_length','2024-05-16 08:20:41.323924'),(15,'auth','0010_alter_group_name_max_length','2024-05-16 08:20:41.347697'),(16,'auth','0011_update_proxy_permissions','2024-05-16 08:20:41.366989'),(17,'auth','0012_alter_user_first_name_max_length','2024-05-16 08:20:41.441271'),(18,'catalogue','0001_initial','2024-05-16 08:20:42.180758'),(19,'catalogue','0002_alter_brand_created_by_alter_brand_updated_by_and_more','2024-05-16 08:20:45.721668'),(20,'catalogue','0003_alter_brand_updated_by_alter_marketplace_updated_by_and_more','2024-05-16 08:20:46.883939'),(21,'catalogue','0004_importantspecification_productcategory_and_more','2024-05-16 08:20:48.747791'),(22,'index','0001_initial','2024-05-16 08:20:49.703201'),(23,'sessions','0001_initial','2024-05-16 08:20:49.794953');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('n0qssen1wdvbs360h21q716to2406zxa','.eJxVjEsOAiEQBe_C2pDwaT4u3XsG0tAgowaSYWZlvLuSzEJ3L68q9WIB962GfeQ1LMTOTLDT7xcxPXKbgO7Ybp2n3rZ1iXwq_KCDXzvl5-Vw_wIVR53Z4hFsNK5EcEZbScKgN9YhaEkleWeMBOmyBEL93QKcklH5lJUuitj7A8aDNwM:1sAuOi:U6j6LIMySJByX7mnVb7uYtY0JBg1EZmSNIT1E_xn88Y','2024-06-08 16:37:32.690490'),('w9rnljjfxz2d5s3aesf8z6lpzoh0pddd','.eJxVjEsOAiEQBe_C2pDwaT4u3XsG0tAgowaSYWZlvLuSzEJ3L68q9WIB962GfeQ1LMTOTLDT7xcxPXKbgO7Ybp2n3rZ1iXwq_KCDXzvl5-Vw_wIVR53Z4hFsNK5EcEZbScKgN9YhaEkleWeMBOmyBEL93QKcklH5lJUuitj7A8aDNwM:1s7WPQ:v2G1cqjDnin0Ngv0Qt_dYVsVg9V9jzq_aXRASjB-Vp0','2024-05-30 08:24:16.981295');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_tile`
--

DROP TABLE IF EXISTS `index_tile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_tile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  `created_by_id` int NOT NULL,
  `tile_category_id` bigint NOT NULL,
  `updated_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tile_tile_category_id_421c8066_fk_index_tilecategory_id` (`tile_category_id`),
  KEY `index_tile_updated_by_id_c426c179_fk_auth_user_id` (`updated_by_id`),
  KEY `index_tile_created_by_id_9e3a4620_fk_auth_user_id` (`created_by_id`),
  CONSTRAINT `index_tile_created_by_id_9e3a4620_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `index_tile_tile_category_id_421c8066_fk_index_tilecategory_id` FOREIGN KEY (`tile_category_id`) REFERENCES `index_tilecategory` (`id`),
  CONSTRAINT `index_tile_updated_by_id_c426c179_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_tile`
--

LOCK TABLES `index_tile` WRITE;
/*!40000 ALTER TABLE `index_tile` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_tile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_tilecategory`
--

DROP TABLE IF EXISTS `index_tilecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_tilecategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tilecategory_created_by_id_380ee996_fk_auth_user_id` (`created_by_id`),
  KEY `index_tilecategory_updated_by_id_753f9180_fk_auth_user_id` (`updated_by_id`),
  CONSTRAINT `index_tilecategory_created_by_id_380ee996_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `index_tilecategory_updated_by_id_753f9180_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_tilecategory`
--

LOCK TABLES `index_tilecategory` WRITE;
/*!40000 ALTER TABLE `index_tilecategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_tilecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_tilefilter`
--

DROP TABLE IF EXISTS `index_tilefilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_tilefilter` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `filter_key` varchar(20) NOT NULL,
  `filter_value` varchar(20) NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tilefilter_created_by_id_5c8ebb59_fk_auth_user_id` (`created_by_id`),
  KEY `index_tilefilter_updated_by_id_fa6688a2_fk_auth_user_id` (`updated_by_id`),
  CONSTRAINT `index_tilefilter_created_by_id_5c8ebb59_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `index_tilefilter_updated_by_id_fa6688a2_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_tilefilter`
--

LOCK TABLES `index_tilefilter` WRITE;
/*!40000 ALTER TABLE `index_tilefilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_tilefilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_tiletotilefilter`
--

DROP TABLE IF EXISTS `index_tiletotilefilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_tiletotilefilter` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tile_id` bigint NOT NULL,
  `tile_filter_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tiletotilefilter_tile_id_32908efa_fk_index_tile_id` (`tile_id`),
  KEY `index_tiletotilefilt_tile_filter_id_f2156a23_fk_index_til` (`tile_filter_id`),
  CONSTRAINT `index_tiletotilefilt_tile_filter_id_f2156a23_fk_index_til` FOREIGN KEY (`tile_filter_id`) REFERENCES `index_tilefilter` (`id`),
  CONSTRAINT `index_tiletotilefilter_tile_id_32908efa_fk_index_tile_id` FOREIGN KEY (`tile_id`) REFERENCES `index_tile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_tiletotilefilter`
--

LOCK TABLES `index_tiletotilefilter` WRITE;
/*!40000 ALTER TABLE `index_tiletotilefilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_tiletotilefilter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-26  8:00:41
