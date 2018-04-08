CREATE DATABASE  IF NOT EXISTS `test_donation` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test_donation`;
-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: test_donation
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Afghanistan'),(2,'Albania'),(3,'Algeria'),(4,'American Samoa'),(5,'Andorra'),(6,'Angola'),(7,'Anguilla'),(8,'Antarctica'),(9,'Antigua and Barbuda'),(10,'Argentina'),(11,'Armenia'),(12,'Aruba'),(13,'Australia'),(14,'Austria'),(15,'Azerbaijan'),(16,'Bahamas'),(17,'Bahrain'),(18,'Bangladesh'),(19,'Barbados'),(20,'Belarus'),(21,'Belgium'),(22,'Belize'),(23,'Benin'),(24,'Bermuda'),(25,'Bhutan'),(26,'Bolivia'),(27,'Bosnia and Herzegovina'),(28,'Botswana'),(29,'Bouvet Island'),(30,'Brazil'),(31,'British Indian Ocean Territory'),(32,'Brunei Darussalam'),(33,'Bulgaria'),(34,'Burkina Faso'),(35,'Burundi'),(36,'Cambodia'),(37,'Cameroon'),(38,'Canada'),(39,'Cape Verde'),(40,'Cayman Islands'),(41,'Central African Republic'),(42,'Chad'),(43,'Chile'),(44,'China'),(45,'Christmas Island'),(46,'Cocos (Keeling) Islands'),(47,'Colombia'),(48,'Comoros'),(49,'Congo'),(50,'Cook Islands'),(51,'Costa Rica'),(52,'Croatia (Hrvatska)'),(53,'Cuba'),(54,'Cyprus'),(55,'Czech Republic'),(56,'Denmark'),(57,'Djibouti'),(58,'Dominica'),(59,'Dominican Republic'),(60,'East Timor'),(61,'Ecuador'),(62,'Egypt'),(63,'El Salvador'),(64,'Equatorial Guinea'),(65,'Eritrea'),(66,'Estonia'),(67,'Ethiopia'),(68,'Falkland Islands (Malvinas)'),(69,'Faroe Islands'),(70,'Fiji'),(71,'Finland'),(72,'France'),(73,'France, Metropolitan'),(74,'French Guiana'),(75,'French Polynesia'),(76,'French Southern Territories'),(77,'Gabon'),(78,'Gambia'),(79,'Georgia'),(80,'Germany'),(81,'Ghana'),(82,'Gibraltar'),(83,'Guernsey'),(84,'Greece'),(85,'Greenland'),(86,'Grenada'),(87,'Guadeloupe'),(88,'Guam'),(89,'Guatemala'),(90,'Guinea'),(91,'Guinea-Bissau'),(92,'Guyana'),(93,'Haiti'),(94,'Heard and Mc Donald Islands'),(95,'Honduras'),(96,'Hong Kong'),(97,'Hungary'),(98,'Iceland'),(99,'India'),(100,'Isle of Man'),(101,'Indonesia'),(102,'Iran (Islamic Republic of)'),(103,'Iraq'),(104,'Ireland'),(105,'Israel'),(106,'Italy'),(107,'Ivory Coast'),(108,'Jersey'),(109,'Jamaica'),(110,'Japan'),(111,'Jordan'),(112,'Kazakhstan'),(113,'Kenya'),(114,'Kiribati'),(115,'Korea, Democratic People\'s Republic of'),(116,'Korea, Republic of'),(117,'Kosovo'),(118,'Kuwait'),(119,'Kyrgyzstan'),(120,'Lao People\'s Democratic Republic'),(121,'Latvia'),(122,'Lebanon'),(123,'Lesotho'),(124,'Liberia'),(125,'Libyan Arab Jamahiriya'),(126,'Liechtenstein'),(127,'Lithuania'),(128,'Luxembourg'),(129,'Macau'),(130,'Macedonia'),(131,'Madagascar'),(132,'Malawi'),(133,'Malaysia'),(134,'Maldives'),(135,'Mali'),(136,'Malta'),(137,'Marshall Islands'),(138,'Martinique'),(139,'Mauritania'),(140,'Mauritius'),(141,'Mayotte'),(142,'Mexico'),(143,'Micronesia, Federated States of'),(144,'Moldova, Republic of'),(145,'Monaco'),(146,'Mongolia'),(147,'Montenegro'),(148,'Montserrat'),(149,'Morocco'),(150,'Mozambique'),(151,'Myanmar'),(152,'Namibia'),(153,'Nauru'),(154,'Nepal'),(155,'Netherlands'),(156,'Netherlands Antilles'),(157,'New Caledonia'),(158,'New Zealand'),(159,'Nicaragua'),(160,'Niger'),(161,'Nigeria'),(162,'Niue'),(163,'Norfolk Island'),(164,'Northern Mariana Islands'),(165,'Norway'),(166,'Oman'),(167,'Pakistan'),(168,'Palau'),(169,'Palestine'),(170,'Panama'),(171,'Papua New Guinea'),(172,'Paraguay'),(173,'Peru'),(174,'Philippines'),(175,'Pitcairn'),(176,'Poland'),(177,'Portugal'),(178,'Puerto Rico'),(179,'Qatar'),(180,'Reunion'),(181,'Romania'),(182,'Russian Federation'),(183,'Rwanda'),(184,'Saint Kitts and Nevis'),(185,'Saint Lucia'),(186,'Saint Vincent and the Grenadines'),(187,'Samoa'),(188,'San Marino'),(189,'Sao Tome and Principe'),(190,'Saudi Arabia'),(191,'Senegal'),(192,'Serbia'),(193,'Seychelles'),(194,'Sierra Leone'),(195,'Singapore'),(196,'Slovakia'),(197,'Slovenia'),(198,'Solomon Islands'),(199,'Somalia'),(200,'South Africa'),(201,'South Georgia South Sandwich Islands'),(202,'Spain'),(203,'Sri Lanka'),(204,'St. Helena'),(205,'St. Pierre and Miquelon'),(206,'Sudan'),(207,'Suriname'),(208,'Svalbard and Jan Mayen Islands'),(209,'Swaziland'),(210,'Sweden'),(211,'Switzerland'),(212,'Syrian Arab Republic'),(213,'Taiwan'),(214,'Tajikistan'),(215,'Tanzania, United Republic of'),(216,'Thailand'),(217,'Togo'),(218,'Tokelau'),(219,'Tonga'),(220,'Trinidad and Tobago'),(221,'Tunisia'),(222,'Turkey'),(223,'Turkmenistan'),(224,'Turks and Caicos Islands'),(225,'Tuvalu'),(226,'Uganda'),(227,'Ukraine'),(228,'United Arab Emirates'),(229,'United Kingdom'),(230,'United States'),(231,'United States minor outlying islands'),(232,'Uruguay'),(233,'Uzbekistan'),(234,'Vanuatu'),(235,'Vatican City State'),(236,'Venezuela'),(237,'Vietnam'),(238,'Virgin Islands (British)'),(239,'Virgin Islands (U.S.)'),(240,'Wallis and Futuna Islands'),(241,'Western Sahara'),(242,'Yemen'),(243,'Zaire'),(244,'Zambia'),(245,'Zimbabwe');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card`
--

DROP TABLE IF EXISTS `credit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month_expiration` int(11) NOT NULL,
  `number` varchar(20) NOT NULL,
  `number_pin` int(11) NOT NULL,
  `year_expiration` int(11) NOT NULL,
  `id_donor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6ynchsq8oshqeeowhvnak2oqc` (`id_donor`),
  CONSTRAINT `FK_6ynchsq8oshqeeowhvnak2oqc` FOREIGN KEY (`id_donor`) REFERENCES `donor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card`
--

LOCK TABLES `credit_card` WRITE;
/*!40000 ALTER TABLE `credit_card` DISABLE KEYS */;
INSERT INTO `credit_card` VALUES (2,1,'2132132132132132',213,23,3),(3,21,'4321321321321321',121,21,4);
/*!40000 ALTER TABLE `credit_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `id_country` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_iddlqbgpwwxs9xigukc509y60` (`id_country`),
  CONSTRAINT `FK_iddlqbgpwwxs9xigukc509y60` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Ahuachapán',63),(2,'Santa Ana',63),(3,'Sonsonate',63),(4,'La Libertad',63),(5,'Chalatenango',63),(6,'San Salvador',63),(7,'Cuscatlán',63),(8,'La Paz',63),(9,'Cabañas',63),(10,'San Vicente',63),(11,'Usulután',63),(12,'Morazán',63),(13,'San Miguel',63),(14,'La Unión',63),(15,'Guatemala',89),(16,'Managua',159),(17,'Ottawa',38),(18,'Toronto',38);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donation`
--

DROP TABLE IF EXISTS `donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `date` date NOT NULL,
  `id_donor` int(11) NOT NULL,
  `id_institution` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rs9rvgroim0ufmb1b2me30egp` (`id_donor`),
  KEY `FK_nbr6w8u06e9hfuwscutea0fp1` (`id_institution`),
  CONSTRAINT `FK_nbr6w8u06e9hfuwscutea0fp1` FOREIGN KEY (`id_institution`) REFERENCES `institution` (`id`),
  CONSTRAINT `FK_rs9rvgroim0ufmb1b2me30egp` FOREIGN KEY (`id_donor`) REFERENCES `donor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation`
--

LOCK TABLES `donation` WRITE;
/*!40000 ALTER TABLE `donation` DISABLE KEYS */;
INSERT INTO `donation` VALUES (1,250,'2018-04-12',3,1),(3,150,'2018-04-07',3,3),(4,250,'2018-04-07',3,4);
/*!40000 ALTER TABLE `donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_document` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `surname` varchar(150) NOT NULL,
  `id_user` bigint(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_hp393i0ydg0vr83eh7r0dut7h` (`id_user`),
  CONSTRAINT `FK_hp393i0ydg0vr83eh7r0dut7h` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor`
--

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
INSERT INTO `donor` VALUES (3,123154213,'Jeovanni','Hernandez',17,''),(4,464654,'Jeovanni','Hernandez',18,'jeovanni.jahm@gmail.com');
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution`
--

DROP TABLE IF EXISTS `institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `id_department` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_f90lvt3t35ub3melu9jx6pwr7` (`id_department`),
  CONSTRAINT `FK_f90lvt3t35ub3melu9jx6pwr7` FOREIGN KEY (`id_department`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution`
--

LOCK TABLES `institution` WRITE;
/*!40000 ALTER TABLE `institution` DISABLE KEYS */;
INSERT INTO `institution` VALUES (1,'Libras de amor',1),(2,'Hogar de niños padre Vito Guarato',6),(3,'Beneficiencia Guate',15),(4,'Hogar de ancianos Nicaragua',16),(5,'The YMCA Toronto',18);
/*!40000 ALTER TABLE `institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'$2a$10$aepcWT2gUSgrtvt1G85bB.hKFsnHx2h9dVnSL6qzBuXNcETqvZMSq','jeovanni'),(17,'$2a$10$VXOELZyECrKZvrvNAHNhresHdPH3xhxl0NsnWUOZwYGrlTT7dPi76','jeovanni2'),(18,'$2a$10$WdDpZlHz1yOTO4BDHqWMdeGXTXDyy5hj88K.4Psr/DUrC667c0Y6W','jeovanni3');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-08 14:43:49
