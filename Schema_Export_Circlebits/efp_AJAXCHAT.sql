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
-- Table structure for table `AJAXCHAT`
--

DROP TABLE IF EXISTS `AJAXCHAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AJAXCHAT` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `question` varchar(4000) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AJAXCHAT`
--

LOCK TABLES `AJAXCHAT` WRITE;
/*!40000 ALTER TABLE `AJAXCHAT` DISABLE KEYS */;
INSERT INTO `AJAXCHAT` VALUES (42,1,1,'trigger0, trigger2','2038-01-19 02:14:07'),(50,1,1,'trigger0 new question','2018-05-14 12:23:49'),(51,1,1,'trigger0 meine neue frage','2018-05-14 13:05:06'),(52,14338,1,'trigger0 My first question','2018-05-15 21:46:42'),(53,14338,30,'Wo finde ich ausführliche Informationen zum Praxissemester?','2018-05-15 22:09:10'),(54,14338,31,'Muss ich mich selbst um eine geeignete Praktikantenstelle kümmern?','2018-05-15 22:09:52'),(55,14338,1,'trigger0 Looks like its working','2018-05-15 22:36:41'),(56,14338,1,'trigger0 Why does the input field does not clear after sending >:/','2018-05-15 22:38:51'),(57,14338,1,'trigger0 shithead','2018-05-15 22:41:52'),(58,11725,30,'Hi, wie läuft das Praxissemester ab?','2018-05-16 10:30:55'),(59,14338,30,'Wo bekomme ich Informationen','2018-05-16 12:22:16'),(60,11725,28,'egsdg doof','2018-05-16 16:16:40'),(61,11725,28,'Doof?','2018-05-21 23:01:30'),(62,11725,28,'Wann muss ich mich bewerben?','2018-05-21 23:56:11'),(63,11725,28,'\r\ndooohof doof?\r\n','2018-06-02 13:46:44'),(64,11725,0,'aa','2018-06-04 23:39:04'),(65,11725,0,'aa','2018-06-04 23:39:15'),(66,11725,1,'a','2018-06-04 23:52:48'),(67,11725,1,'b','2018-06-04 23:52:52'),(68,11725,28,'doof test?\r\n','2018-06-05 00:08:25'),(69,11725,1,'\r\ntt aa\r\n','2018-06-05 00:09:00'),(70,11725,1,'\r\naaa\r\n','2018-06-05 00:11:03'),(71,11725,1,'\r\nkaaa\r\n','2018-06-05 00:12:18'),(72,11725,40,'\r\nTest test 123!?\r\n','2018-06-05 00:46:47'),(73,11725,1,'tt','2018-06-10 18:34:18'),(74,11725,1,'aha','2018-06-10 18:34:26'),(75,14338,32,'Hallo,\r\nwie bekomme ich ein Auslandssemester\r\n\r\n','2018-06-18 14:00:46'),(76,14338,32,'Hallo,\r\nwie bekomme ich ein Auslandssemester?\r\nPlease help faaaast\r\n  \r\n\r\n','2018-06-18 14:19:28'),(77,14338,32,'Hallo,\r\nwie bekomme ich ein Auslandssemester?\r\nPlease help faaaast\r\n','2018-06-18 14:27:22'),(78,14338,1,'(map read-message)\r\n','2018-06-18 15:13:41'),(79,14338,1,'Am Mon, 18 Jun 2018 17:13:41 +0200 (CEST)\r\n  schrieb efp@eisenschmidt.family:\r\n> Es konnte leider keine passende Antwort  zu deiner Frage ermittelt \r\n>werden. Achte auf korrekte Rechtschreibung  und Tippfehler und \r\n>versuche es erneut.\r\n\r\n','2018-06-18 15:15:20'),(80,14338,1,'Am Mon, 18 Jun 2018 17:15:20 +0200 (CEST)\r\n  schrieb efp@eisenschmidt.family:\r\n> Es konnte leider keine passende Antwort  zu deiner Frage ermittelt \r\n>werden. Achte auf korrekte Rechtschreibung  und Tippfehler und \r\n>versuche es erneut.\r\n\r\n','2018-06-18 15:25:45'),(81,14338,1339,'Ich will ins Ausland. Please help me mAster Bot\r\n','2018-06-18 15:27:25'),(82,11725,1,'test','2018-06-25 14:32:28'),(83,11725,1,'test22','2018-06-25 14:53:04'),(84,11725,1,'test33','2018-06-25 14:53:54'),(85,11725,1,'Wann ist das Praxissemester?','2018-06-25 14:54:06'),(86,11725,1,'tt','2018-06-25 14:54:34'),(87,11725,1,'Wie kann ich ins Ausland?','2018-06-25 14:56:56'),(88,11725,1,'Wie kann ich ins ausland?','2018-06-25 14:57:39'),(89,11725,1339,'ausland','2018-06-25 14:57:46'),(90,11725,1,'Wann ist das Praxissemester?','2018-06-25 14:59:50'),(91,11725,1,'Wie kann ich ins Ausland?','2018-06-25 15:01:27'),(92,11725,1,'Wie kann ich ins Ausland?','2018-06-25 15:02:34'),(93,11725,1339,NULL,'2018-06-25 15:05:06'),(94,11725,30,NULL,'2018-06-25 15:07:12'),(95,11725,30,NULL,'2018-06-25 15:08:04'),(96,11725,1339,NULL,'2018-06-25 15:09:01'),(97,11725,30,NULL,'2018-06-25 15:09:55'),(98,11725,1339,NULL,'2018-06-25 15:11:27'),(99,11725,30,NULL,'2018-06-25 15:12:27'),(100,11725,1339,NULL,'2018-06-25 15:13:52'),(101,11725,30,'Wann ist das Praxissemester?','2018-06-25 15:14:41'),(102,11725,30,'was ist das Praxissemester?','2018-06-25 15:16:40'),(103,11725,30,'Kann ich das Praxissemester verschieben?','2018-06-25 15:18:14'),(104,11725,30,'Kann ich das Praxissemester nach dem 5 sem?','2018-06-25 15:18:41'),(105,11725,30,'Kann ich das Praxissemester nach dem 5 sem?','2018-07-03 15:34:27'),(106,11725,1,'was?','2018-07-03 15:34:35'),(107,11725,1,'historie?','2018-07-03 15:34:42'),(108,11725,1358,'Kann ich während des Praxissemesters Prüfungen schreiben?','2018-07-03 15:35:24'),(109,11725,32,'Bekomme ich eine Antwort?\r\n','2018-07-03 15:37:55'),(110,11725,32,'Wie bekomme ich eine Praktikumsstelle?','2018-07-03 15:40:23'),(111,11725,1342,'wie muss mein bericht aussehen?','2018-07-03 16:03:42'),(112,11725,1358,'wie muss mein bericht aussehen?','2018-07-03 16:06:49'),(113,11725,1367,'wie muss mein bericht aussehen?','2018-07-03 16:08:32'),(114,11725,1340,'was ist ein erasmus?','2018-07-03 16:13:33'),(115,11725,1,'Kann ich während meines Semesters förderungen erhalten?','2018-07-03 16:15:02'),(116,11725,1,'Kann ich während meines Semesters förderung erhalten?','2018-07-03 16:15:35'),(117,11725,1348,'Kann ich während meines trotz gehalt Semesters förderung erhalten?','2018-07-03 16:16:12'),(118,11725,1,'test123?\r\n','2018-07-03 17:41:58'),(119,11725,1,'test123','2018-07-07 15:38:00'),(120,11725,1,'test321','2018-07-07 19:06:33'),(121,11725,30,'Was ist das Praxissemester? du dEPP?\r\n','2018-07-14 22:53:30'),(122,11725,1375,'Wie finde ich eine passende praktikumsstelle?','2018-07-15 20:27:59'),(123,11725,1407,'muss ich mich selbst um eine praktikantenstelle kümmern?','2018-07-15 20:30:43'),(124,11725,1398,'Wo finde ich ausführliche Informationen zum Praxissemester?','2018-07-15 20:51:21'),(125,11725,1409,'Muss ich mich selbst um eine geeignete Praktikantenstelle kümmern?','2018-07-15 20:51:32'),(126,11725,1375,'Wie finde ich eine Praktikumsstelle?','2018-07-15 20:51:45'),(127,11725,1,'Wie finde ich eine Praktikumsstelle?','2018-07-15 20:53:30'),(128,11725,1415,'Wie finde ich eine Praktikumsstelle?','2018-07-15 20:54:26'),(129,11725,1415,'Wie finde ich eine Praktikumsstelle im ausland?','2018-07-15 20:54:46'),(130,11725,1415,'Wie finde ich eine Praktikumsstelle im ausland?','2018-07-15 20:56:00'),(131,11725,1415,'Wie finde ich eine Praktikumsstelle im ausland?','2018-07-15 20:56:55'),(132,11725,1414,'Wie bekomme ich eine Praktikumsstelle im ausland?','2018-07-15 20:57:15'),(133,11725,1414,'Wie finde ich eine Praktikumsstelle im ausland?','2018-07-15 20:57:43'),(134,11725,1414,'Wie finde ich eine Praktikumsstelle?','2018-07-15 20:57:49'),(135,11725,1416,'Wie finde ich eine Praktikumsstelle?','2018-07-15 20:59:09'),(136,11725,1416,'Wie finde ich eine Praktikumsstelle?','2018-07-15 21:00:29'),(137,11725,1422,'Wie finde ich eine Praktikumsstelle?','2018-07-15 21:04:16'),(138,11725,1417,'Wie finde ich eine Praktikumsstelle im ausland?','2018-07-15 21:04:26'),(139,11725,1417,'Wie finde ich eine Praktikumsstelle im ausland?','2018-07-15 21:07:33'),(140,11725,1417,'Nicht ins Ausland und trotzdem Erasmus wie geht denn das?','2018-07-15 21:08:47'),(141,11725,1340,'Nicht ins Ausland und trotzdem Erasmus wie geht denn das?','2018-07-15 21:11:06'),(142,11725,1412,'Welche Formalien sind vor Antritt des Praxissemesters zu beachten?','2018-07-15 21:12:15'),(143,11725,1362,'Wie muss der Vertrag mit dem Unternehmen aussehen?','2018-07-15 21:12:30'),(144,11725,1362,'Mein Vertrag sieht einen Zeitraum vor, der genau 100 Präsenztagen entspricht. Was passiert, wenn ich mal krank werden sollte?','2018-07-15 21:12:52'),(145,11725,1,'Gibt es vorgeschriebene Arbeitszeiten?','2018-07-15 21:17:39'),(146,11725,1362,'Mein Vertrag sieht einen Zeitraum vor, der genau 100 Präsenztagen entspricht. Was passiert, wenn ich mal krank werden sollte?','2018-07-15 21:19:06'),(147,11725,1,'Gibt es vorgeschriebene Arbeitszeiten?','2018-07-15 21:22:25'),(148,11725,1,'arbeitszeiten','2018-07-15 21:22:54'),(149,11725,1,'arbeitszeiten','2018-07-15 21:23:12'),(150,11725,1348,'BAföG im Praxissemester?','2018-07-15 21:24:02'),(151,11725,1398,'Kann man das Praxissemester verschieben?','2018-07-15 21:24:13'),(152,11725,1363,'Kann man das Praxissemester verschieben?','2018-07-15 21:25:46'),(153,11725,1364,'Gründe und Voraussetzungen für das Verschieben','2018-07-15 21:26:01'),(154,11725,1374,'Prüfungen und Lehrveranstaltungen während des Praxissemesters','2018-07-15 21:26:16'),(155,11725,1357,'Was ist beim Verschieben des Praxissemesters zu beachten?','2018-07-15 21:28:08'),(156,11725,1374,'Können im Praxissemester auch Klausuren geschrieben werden?','2018-07-15 21:28:15'),(157,11725,1365,'Schreibwerkstatt, wissenschaftliches Arbeiten (WIA), überfachliche Kompetenzen (UK)','2018-07-15 21:28:30'),(158,11725,1367,'Gibt es spezifische Vorgaben für das Layout des Praxissemesterberichts?','2018-07-15 21:28:38'),(159,11725,1369,'Wer hat die Rechte an Arbeitsergebnissen des Praxissemesters?','2018-07-15 21:28:48'),(160,11725,1344,'Müssen Arbeitszeiten erfasst werden?','2018-07-15 21:28:57'),(161,11725,1365,'Darf ich im Praxissemester remote arbeiten (\"Home Office\")?','2018-07-15 21:29:15'),(162,11725,1398,'Wo finde ich ausführliche Informationen zum Praxissemester?','2018-07-15 21:29:41'),(163,11725,1409,'Muss ich mich selbst um eine geeignete Praktikantenstelle kümmern?','2018-07-15 21:30:17'),(164,11725,1422,'Wie finde ich eine Praktikumsstelle?','2018-07-15 21:30:25'),(165,11725,1417,'Wie finde ich eine Praktikumsstelle im ausland?','2018-07-15 21:30:42'),(166,11725,1340,'Nicht ins Ausland und trotzdem Erasmus wie geht denn das?','2018-07-15 21:31:06'),(167,11725,1412,'Welche Formalien sind vor Antritt des Praxissemesters zu beachten?','2018-07-15 21:31:25'),(168,11725,1362,'Wie muss der Vertrag mit dem Unternehmen aussehen?','2018-07-15 21:31:46'),(169,11725,1362,'Mein Vertrag sieht einen Zeitraum vor, der genau 100 Präsenztagen entspricht. Was passiert, wenn ich mal krank werden sollte?','2018-07-15 21:32:00'),(170,11725,1,'Gibt es vorgeschriebene Arbeitszeiten?','2018-07-15 21:32:08'),(171,11725,1348,'BAföG im Praxissemester?','2018-07-15 21:32:17'),(172,11725,1363,'Kann man das Praxissemester verschieben?','2018-07-15 21:32:35'),(173,11725,1364,'Gründe und Voraussetzungen für das Verschieben','2018-07-15 21:32:56'),(174,11725,1354,'Prüfungen und Lehrveranstaltungen während des Praxissemesters','2018-07-15 21:33:10'),(175,11725,1357,'Was ist beim Verschieben des Praxissemesters zu beachten?','2018-07-15 21:33:20'),(176,11725,1374,'Können im Praxissemester auch Klausuren geschrieben werden?','2018-07-15 21:33:32'),(177,11725,1365,'Schreibwerkstatt, wissenschaftliches Arbeiten (WIA), überfachliche Kompetenzen (UK','2018-07-15 21:33:46'),(178,11725,1367,'Gibt es spezifische Vorgaben für das Layout des Praxissemesterberichts?','2018-07-15 21:33:57'),(179,11725,1369,'Wer hat die Rechte an Arbeitsergebnissen des Praxissemesters?','2018-07-15 21:34:08'),(180,11725,1344,'Müssen Arbeitszeiten erfasst werden?','2018-07-15 21:34:21'),(181,11725,1365,'Darf ich im Praxissemester remote arbeiten (\"Home Office\")?','2018-07-15 21:34:43'),(182,11725,1365,'Darf ich im Praxissemester remote arbeiten (\"Home Office\")?','2018-07-15 21:37:29'),(183,11725,1371,'Darf ich im Praxissemester remote arbeiten (\"Home Office\")?','2018-07-15 21:37:48'),(184,11725,1344,'Müssen Arbeitszeiten erfasst werden?','2018-07-15 21:38:01'),(185,11725,1340,'Nicht in\'s Ausland und trotzdem Erasmus - wie geht denn das?','2018-07-15 21:38:56'),(186,11725,1362,'Mein Vertrag sieht einen Zeitraum vor, der genau 100 Präsenztagen entspricht. Was passiert, wenn ich mal krank werden sollte?','2018-07-15 21:39:27'),(187,11725,1344,'Müssen Arbeitszeiten erfasst werden?','2018-07-15 21:40:01'),(188,11725,1344,'Gibt es vorgeschriebene Arbeitszeiten?','2018-07-15 21:40:12'),(189,11725,1344,'Müssen Arbeitszeiten erfasst werden?','2018-07-15 21:41:03'),(190,11725,1363,'Kann man das Praxissemester verschieben?','2018-07-15 21:42:24'),(191,11725,1357,'Gründe und Voraussetzungen für das Verschieben','2018-07-15 21:42:41'),(192,11725,1409,'Muss ich mich selbst um eine geeignete Praktikantenstelle kümmern?','2018-07-15 21:44:56'),(193,11725,1344,'Müssen Arbeitszeiten erfasst werden?','2018-07-15 21:46:48'),(194,11725,1344,'Gibt es vorgeschriebene Arbeitszeiten?','2018-07-15 21:47:15'),(195,11725,1398,'Wo finde ich ausführliche Informationen zum Praxissemester?','2018-07-15 21:47:39'),(196,11725,1409,'Muss ich mich selbst um eine geeignete Praktikantenstelle kümmern?','2018-07-15 21:49:10'),(197,11725,1417,'Wie finde ich eine Praktikumsstelle?','2018-07-15 21:49:24'),(198,11725,1422,'Wie finde ich eine Praktikumsstelle?','2018-07-15 21:50:49'),(199,11725,1417,'Wie finde ich eine Praktikumsstelle im ausland?','2018-07-15 21:51:04'),(200,11725,1340,'Nicht in\'s Ausland und trotzdem Erasmus - wie geht denn das?','2018-07-15 21:51:22'),(201,11725,1412,'Welche Formalien sind vor Antritt des Praxissemesters zu beachten?','2018-07-15 21:51:33'),(202,11725,1362,'Wie muss der Vertrag mit dem Unternehmen aussehen?','2018-07-15 21:51:47'),(203,11725,1362,'Mein Vertrag sieht einen Zeitraum vor, der genau 100 Präsenztagen entspricht. Was passiert, wenn ich mal krank werden sollte?','2018-07-15 21:52:21'),(204,11725,1344,'Gibt es vorgeschriebene Arbeitszeiten?','2018-07-15 21:52:31'),(205,11725,1398,'BAföG im Praxissemester?','2018-07-15 21:52:46'),(206,11725,1,'BAföG im Praxissemester?','2018-07-15 21:53:55'),(207,11725,1348,'BAföG im Praxissemester?','2018-07-15 21:56:00'),(208,11725,30,'Wo finde ich ausführliche Informationen zum Praxissemester?','2018-07-15 21:56:41'),(209,11725,1409,'Muss ich mich selbst um eine geeignete Praktikantenstelle kümmern?','2018-07-15 21:56:57'),(210,11725,1422,'Wie finde ich eine Praktikumsstelle?','2018-07-15 21:57:12'),(211,11725,1422,'Wie finde ich eine Praktikumsstelle im ausland?','2018-07-15 21:57:23'),(212,11725,1418,'Wie finde ich eine Praktikumsstelle im ausland?','2018-07-15 21:59:00'),(213,11725,1422,'Wie finde ich eine Praktikumsstelle?','2018-07-15 21:59:04'),(214,11725,30,'Wo finde ich ausführliche Informationen zum Praxissemester?','2018-07-15 22:01:01'),(215,11725,1409,'Muss ich mich selbst um eine geeignete Praktikantenstelle kümmern?','2018-07-15 22:01:08'),(216,11725,1422,'Wie finde ich eine Praktikumsstelle?','2018-07-15 22:01:18'),(217,11725,1418,'Wie finde ich eine Praktikumsstelle im ausland?','2018-07-15 22:01:27'),(218,11725,1340,'Nicht ins Ausland und trotzdem Erasmus - wie geht denn das?','2018-07-15 22:01:44'),(219,11725,1340,'Nicht in\'s Ausland und trotzdem Erasmus - wie geht denn das?','2018-07-15 22:02:50'),(220,11725,1418,'Wie finde ich eine Praktikumsstelle im ausland?','2018-07-15 22:03:02'),(221,11725,1422,'Wie finde ich eine Praktikumsstelle?','2018-07-15 22:03:07'),(222,11725,1409,'Muss ich mich selbst um eine geeignete Praktikantenstelle kümmern?','2018-07-15 22:03:18'),(223,11725,30,'Wo finde ich ausführliche Informationen zum Praxissemester?','2018-07-15 22:03:23'),(224,11725,1412,'Welche Formalien sind vor Antritt des Praxissemesters zu beachten?','2018-07-15 22:03:48'),(225,11725,1362,'Wie muss der Vertrag mit dem Unternehmen aussehen?','2018-07-15 22:04:01'),(226,11725,1362,'Mein Vertrag sieht einen Zeitraum vor, der genau 100 Präsenztagen entspricht. Was passiert, wenn ich mal krank werden sollte?','2018-07-15 22:04:17'),(227,11725,1344,'Gibt es vorgeschriebene Arbeitszeiten?','2018-07-15 22:04:33'),(228,11725,1418,'BAföG im Praxissemester?','2018-07-15 22:05:03'),(229,11725,1348,'BAföG im Praxissemester?','2018-07-15 22:05:59'),(230,11725,1363,'Kann man das Praxissemester verschieben?','2018-07-15 22:06:12'),(231,11725,1364,'Gründe und Voraussetzungen für das Verschieben','2018-07-15 22:06:29'),(232,11725,1354,'Prüfungen und Lehrveranstaltungen während des Praxissemesters','2018-07-15 22:06:53'),(233,11725,1357,'Was ist beim Verschieben des Praxissemesters zu beachten?','2018-07-15 22:07:07'),(234,11725,1374,'Können im Praxissemester auch Klausuren geschrieben werden?','2018-07-15 22:07:18'),(235,11725,1435,'Schreibwerkstatt, wissenschaftliches Arbeiten (WIA), überfachliche Kompetenzen (UK)','2018-07-15 22:07:30'),(236,11725,1367,'Gibt es spezifische Vorgaben für das Layout des Praxissemesterberichts?','2018-07-15 22:07:40'),(237,11725,1369,'Wer hat die Rechte an Arbeitsergebnissen des Praxissemesters?','2018-07-15 22:07:50'),(238,11725,1344,'Müssen Arbeitszeiten erfasst werden?','2018-07-15 22:08:00'),(239,11725,1371,'Darf ich im Praxissemester remote arbeiten (\"Home Office\")?','2018-07-15 22:08:22'),(240,11725,1344,'Müssen Arbeitszeiten erfasst werden?','2018-07-15 22:08:41'),(241,11725,1439,'Müssen Arbeitszeiten erfasst werden?','2018-07-15 22:09:55'),(242,11725,1362,'Mein Vertrag sieht einen Zeitraum vor, der genau 100 Präsenztagen entspricht. Was passiert, wenn ich mal krank werden sollte?','2018-07-15 22:10:50'),(243,11725,1343,'Mein Vertrag sieht einen Zeitraum vor, der genau 100 Präsenztagen entspricht. Was passiert, wenn ich mal krank werden sollte?','2018-07-15 22:12:28'),(244,11725,1,'testfrage?','2018-07-15 23:56:33'),(245,11725,1,'testfrage?','2018-07-15 23:58:35'),(246,11725,1,'testfrage? ,Antwort was?','2018-07-16 00:25:52'),(247,11725,1,'testfrage? ,Antwort was?','2018-07-16 00:26:51'),(248,11725,30,'Wo finde ich ausführliche Informationen zum Praxissemester?','2018-07-16 00:27:23'),(249,11725,1409,'Muss ich mich selbst um eine geeignete Praktikantenstelle kümmern?','2018-07-16 00:27:35'),(250,11725,1422,'Wie finde ich eine Praktikumsstelle?','2018-07-16 00:27:41'),(251,11725,1418,'Wie finde ich eine Praktikumsstelle im Ausland?','2018-07-16 00:27:47'),(252,11725,1340,'Nicht in\'s Ausland und trotzdem Erasmus - wie geht denn das?','2018-07-16 00:28:28'),(253,11725,1412,'Welche Formalien sind vor Antritt des Praxissemesters zu beachten?','2018-07-16 00:28:40'),(254,11725,1362,'Wie muss der Vertrag mit dem Unternehmen aussehen?','2018-07-16 00:28:53'),(255,11725,1343,'Mein Vertrag sieht einen Zeitraum vor, der genau 100 Präsenztagen entspricht. Was passiert, wenn ich mal krank werden sollte?','2018-07-16 00:29:01'),(256,11725,1439,'Gibt es vorgeschriebene Arbeitszeiten?','2018-07-16 00:29:08'),(257,11725,1418,'BAföG im Praxissemester?','2018-07-16 00:29:21'),(258,11725,1418,'BAföG im Praxissemester?','2018-07-16 00:30:18'),(259,11725,1418,'BAföG im Praxissemester?','2018-07-16 00:31:57'),(260,11725,1418,'BAföG im Praxissemester?','2018-07-16 00:32:56'),(261,11725,1418,'BAföG im Praxissemester?','2018-07-16 00:35:40'),(262,11725,1348,'BAföG im Praxissemester?','2018-07-16 00:40:17'),(263,11725,1439,'Gibt es vorgeschriebene Arbeitszeiten?','2018-07-16 00:40:34'),(264,11725,1343,'Mein Vertrag sieht einen Zeitraum vor, der genau 100 Präsenztagen entspricht. Was passiert, wenn ich mal krank werden sollte?','2018-07-16 00:40:42'),(265,11725,1362,'Wie muss der Vertrag mit dem Unternehmen aussehen?','2018-07-16 00:40:54'),(266,11725,1412,'Welche Formalien sind vor Antritt des Praxissemesters zu beachten?','2018-07-16 00:41:02'),(267,11725,1340,'Nicht in\'s Ausland und trotzdem Erasmus - wie geht denn das?','2018-07-16 00:41:14'),(268,11725,1422,'Wie finde ich eine Praktikumsstelle?','2018-07-16 00:41:21'),(269,11725,1418,'Wie finde ich eine Praktikumsstelle im Ausland?','2018-07-16 00:41:27'),(270,11725,1409,'Muss ich mich selbst um eine geeignete Praktikantenstelle kümmern?','2018-07-16 00:41:39'),(271,11725,30,'Wo finde ich ausführliche Informationen zum Praxissemester?','2018-07-16 00:41:46'),(272,11725,1363,'Kann man das Praxissemester verschieben?','2018-07-16 00:42:03'),(273,11725,1364,'Gründe und Voraussetzungen für das Verschieben','2018-07-16 00:42:12'),(274,11725,1354,'Prüfungen und Lehrveranstaltungen während des Praxissemesters','2018-07-16 00:42:21'),(275,11725,1357,'Was ist beim Verschieben des Praxissemesters zu beachten?','2018-07-16 00:42:29'),(276,11725,1374,'Können im Praxissemester auch Klausuren geschrieben werden?','2018-07-16 00:42:35'),(277,11725,1435,'Schreibwerkstatt, wissenschaftliches Arbeiten (WIA), überfachliche Kompetenzen (UK)','2018-07-16 00:42:42'),(278,11725,1367,'Gibt es spezifische Vorgaben für das Layout des Praxissemesterberichts?','2018-07-16 00:42:49'),(279,11725,1369,'Wer hat die Rechte an Arbeitsergebnissen des Praxissemesters?','2018-07-16 00:42:55'),(280,11725,1439,'Müssen Arbeitszeiten erfasst werden?','2018-07-16 00:43:04'),(281,11725,1371,'Darf ich im Praxissemester remote arbeiten (\"Home Office\")?','2018-07-16 00:43:12'),(282,11725,1371,'Darf ich im Praxissemester remote arbeiten (\"Home Office\")?','2018-07-16 00:46:33');
/*!40000 ALTER TABLE `AJAXCHAT` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-16  2:49:37
