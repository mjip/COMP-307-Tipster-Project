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
INSERT INTO `admin` VALUES (0,'lvancraen','123','2016-11-29',NULL),(1,'mjip','123','2016-11-29',NULL),(2,'ellxandra','123','2016-11-29',NULL);
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
  `name_borough` varchar(30) NOT NULL,
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
INSERT INTO `geolocations` VALUES (1,'Cote-des-Neiges/NDG'),(2,'Cote-St-Luc/Hampstead'),(3,'Lachine'),(4,'Lasalle'),(8,'Mercier/Hochelaga-Maisonneuve'),(5,'Mont-Royal'),(0,'Other/Non-specified'),(9,'Outremont'),(6,'Plateau-Mont-Royal'),(10,'Rosemont/La Petite-Prairie'),(11,'Saint-Laurent'),(7,'Sud-Ouest'),(12,'Verdun'),(13,'Ville-Marie'),(14,'Villeray/Saint-Michel'),(15,'Westmount');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (4,'2016-12-02','Crime','A%20crime%20occured%20yesterday%20at%206pm%20on%20St.%20Laurent',11,6,NULL,-1),(5,'2016-12-02','Apartment Break','Someone%20broke%20into%20my%20apartment%20last%20night%20around%202am',3,3,NULL,1),(6,'2016-12-02','Fires on top of','There%27s%20been%20cases%20of%20fires%20being%20lit%20on%20top%20of%20the%20mountain.%20It%20has%20been%20causing%20small%20fires%2C%20but%20could%20become%20more%20dangerous.',5,6,NULL,-1),(7,'2016-12-02','A serial luge s','I%20have%205%20kids%20each%20having%20their%20own%20sled.%20In%20the%20past%204%20nights%2C%20each%20one%20has%20been%20stolen.%20I%20don%27t%20have%20the%20money%20to%20buy%20new%20ones.%20So%20beware.%20There%27s%20a%20sled%20stealer%21%21%21',1,0,NULL,-1),(8,'2016-12-02','Sexual Assault','Date%20drug%20+%20scary%20men%20at%20bar%20st.%20moo%27s.%20Beware%20of%20this%20place.%20Don%27t%20frequent%20alone.',8,4,NULL,1),(9,'2016-12-02','Physical Assaul','A%20man%20has%20been%20assaulting%20young%20children%20in%20the%20evening%20after%20school.%20Beware%20of%20white%20van%20lurking%20around%20schools.',1,5,NULL,-1),(10,'2016-12-02','Woman street sc','Woman%20on%20Atwater%20has%20been%20seen%20playing%20card%20games%20and%20clearly%20scamming%20passer-bys%20by%20luring%20them%20into%20her%20game.%20Do%20Not%20Play%21',15,1,NULL,0),(11,'2016-12-02','Door-to-Door Sc','A%20man%20has%20been%20going%20door-to-door%20and%20scamming%20old%20woman%20into%20buying%20his%20defective%20cleaning%20products.%20They%20don%27t%20work%2C%20yet%20they%20keep%20buying%20them.%20This%20is%20a%20warning%20to%20all%20old%20ladies%20about%20this%20scam.',0,1,NULL,0);
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
INSERT INTO `tags` VALUES (0,'theft','Theft'),(1,'scam','Scam'),(2,'harassment','Harassment'),(3,'breakin','Break-In'),(4,'sa','Sexual Assault'),(5,'pa','Physical Assault'),(6,'other','Other');
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

-- Dump completed on 2016-12-06 14:05:47
