CREATE DATABASE  IF NOT EXISTS `efp` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `efp`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: cloud.eisenschmidt.family    Database: efp
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.26-MariaDB-0+deb9u1

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
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERS` (
  `uid` int(11) NOT NULL,
  `creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hsid` int(11) DEFAULT '0',
  `roles` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fullname` varchar(2000) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS`
--

LOCK TABLES `USERS` WRITE;
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
INSERT INTO `USERS` VALUES (1,'2018-05-15 21:50:04',9999999,'Dorfkasper','jonas@das.bist.du','#Dorfkasper'),(6224,'2018-06-18 12:36:33',1211356,'Instructor','1211356@stud.hs-mannheim.de','Thomas Welter'),(11725,'2018-05-16 10:29:04',1428107,'Instructor','1428107@stud.hs-mannheim.de','Jonas Weis'),(12192,'2018-05-29 15:36:03',1512359,'Dorfkasper','1512359@stud.hs-mannheim.de','Julian Braasch'),(12608,'2018-06-17 18:38:18',1514711,'Instructor','1514711@stud.hs-mannheim.de','Dennis Schlage'),(13419,'2018-05-29 15:36:03',1520152,'Dorfkasper','1520152@stud.hs-mannheim.de','Nicolas Dane Pilch'),(14338,'2018-05-18 10:54:42',1611812,'Instructor','1611812@stud.hs-mannheim.de','Patrick Eisenschmidt');
/*!40000 ALTER TABLE `USERS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-16  2:49:35
