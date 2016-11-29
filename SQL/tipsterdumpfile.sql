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
  UNIQUE KEY `username` (`username`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (0,'lvancraen','1234567890','2016-11-29',NULL),(1,'mjip','1234567890','2016-11-29',NULL),(2,'ellxandra','1234567890','2016-11-29',NULL);
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
  UNIQUE KEY `name_borough` (`name_borough`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geolocations`
--

LOCK TABLES `geolocations` WRITE;
/*!40000 ALTER TABLE `geolocations` DISABLE KEYS */;
INSERT INTO `geolocations` VALUES (1,'Cote-des-Neiges/Notr'),(2,'Cote-St-Luc/Hampstea'),(3,'Lachine'),(4,'Lasalle'),(8,'Mercier/Hochelaga-Ma'),(5,'Mont-Royal'),(0,'Other/Non-specified'),(9,'Outremont'),(6,'Plateau-Mont-Royal'),(10,'Rosemont/La Petite-P'),(11,'Saint-Laurent'),(7,'Sud-Ouest'),(12,'Verdun'),(13,'Ville-Marie'),(14,'Villeray/Saint-Miche'),(15,'Westmount');
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
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `tag_id` (`tag_id`),
  KEY `reviewed_by_id` (`reviewed_by_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `geolocations` (`id`),
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`),
  CONSTRAINT `post_ibfk_3` FOREIGN KEY (`reviewed_by_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `tag` (`tag`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (0,'theft','Theft'),(1,'scam','Scam'),(2,'harrasment','Harrasment'),(3,'breakin','Break-In'),(4,'sa','Sexual Assault'),(5,'pa','Physical Assault'),(6,'other','Other');
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

-- Dump completed on 2016-11-29 13:13:40
