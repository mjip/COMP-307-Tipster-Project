-- MySQL dump 10.16  Distrib 10.1.16-MariaDB, for osx10.6 (i386)
--
-- Host: localhost    Database: tipster
-- ------------------------------------------------------
-- Server version	10.1.16-MariaDB

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `date_created` date NOT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (0,'lvancraen','1234567890','2016-11-29',NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geolocations`
--

DROP TABLE IF EXISTS `geolocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geolocations` (
  `id` int(11) NOT NULL,
  `name_borough` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_borough` (`name_borough`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geolocations`
--

LOCK TABLES `geolocations` WRITE;
/*!40000 ALTER TABLE `geolocations` DISABLE KEYS */;
INSERT INTO `geolocations` VALUES (1,'Cote-des-Neiges/Notr');
INSERT INTO `geolocations` VALUES (2,'Cote-St-Luc/Hampstea');
INSERT INTO `geolocations` VALUES (3,'Lachine');
INSERT INTO `geolocations` VALUES (4,'Lasalle');
INSERT INTO `geolocations` VALUES (8,'Mercier/Hochelaga-Ma');
INSERT INTO `geolocations` VALUES (5,'Mont-Royal');
INSERT INTO `geolocations` VALUES (0,'Other/Non-specified');
INSERT INTO `geolocations` VALUES (9,'Outremont');
INSERT INTO `geolocations` VALUES (6,'Plateau-Mont-Royal');
INSERT INTO `geolocations` VALUES (10,'Rosemont/La Petite-P');
INSERT INTO `geolocations` VALUES (11,'Saint-Laurent');
INSERT INTO `geolocations` VALUES (7,'Sud-Ouest');
INSERT INTO `geolocations` VALUES (12,'Verdun');
INSERT INTO `geolocations` VALUES (13,'Ville-Marie');
INSERT INTO `geolocations` VALUES (14,'Villeray/Saint-Miche');
INSERT INTO `geolocations` VALUES (15,'Westmount');
/*!40000 ALTER TABLE `geolocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_posted` date NOT NULL,
  `title` varchar(15) NOT NULL,
  `body` text NOT NULL,
  `location_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `reviewed_by_id` int(11) DEFAULT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(20) NOT NULL,
  `tag_value` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'scam','Scam');
INSERT INTO `tags` VALUES (2,'harrasment','Harrasment');
INSERT INTO `tags` VALUES (3,'breakin','Break-In');
INSERT INTO `tags` VALUES (4,'sa','Sexual Assault');
INSERT INTO `tags` VALUES (5,'pa','Physical Assault');
INSERT INTO `tags` VALUES (6,'other','Other');
INSERT INTO `tags` VALUES (10,'theft','Theft');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-29 12:09:44
