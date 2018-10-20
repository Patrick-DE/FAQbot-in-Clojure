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
-- Temporary view structure for view `new_view`
--

DROP TABLE IF EXISTS `new_view`;
/*!50001 DROP VIEW IF EXISTS `new_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `new_view` AS SELECT 
 1 AS `aid`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `new_view`
--

/*!50001 DROP VIEW IF EXISTS `new_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`efp`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `new_view` AS select `t4`.`aid` AS `aid` from ((`ANSWERS` `t4` join `KEYANSWER` `t5` on((`t4`.`aid` = `t5`.`aid`))) join `KEYWORDS` `t6` on((`t5`.`kid` = `t6`.`kid`))) where (`t6`.`keyword` in ('trigger0','trigger1')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'efp'
--
/*!50003 DROP FUNCTION IF EXISTS `SPLIT_STRING` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`efp`@`%` FUNCTION `SPLIT_STRING`(
	str VARCHAR(255) ,
	delim VARCHAR(12) ,
	pos INT
) RETURNS varchar(255) CHARSET utf8
RETURN REPLACE(
	SUBSTRING(
		SUBSTRING_INDEX(str , delim , pos) ,
		CHAR_LENGTH(
			SUBSTRING_INDEX(str , delim , pos - 1)
		) + 1
	) ,
	delim ,
	''
) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllProducts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`efp`@`localhost` PROCEDURE `GetAllProducts`()
BEGIN
   SELECT * FROM ANSWERS as t1
JOIN KEYANSWER as t2 
on t1.aid=t2.aid 
JOIN KEYWORDS as t3 
ON t2.kid=t3.kid 
WHERE keyword in ('trigger0','trigger1')
AND 


(SELECT MAX(COUNT(*))  FROM  
(SELECT t4.aid FROM ANSWERS as t4  
JOIN KEYANSWER as t5  on t4.aid=t5.aid   
JOIN KEYWORDS as t6  ON t5.kid=t6.kid   
WHERE keyword in ('trigger0','trigger1') 
AND t4.aid = t1.aid) 
as t)


=

(SELECT COUNT(*) FROM  
(SELECT t7.aid FROM ANSWERS as t7  
JOIN KEYANSWER as t8  on t7.aid=t8.aid   
JOIN KEYWORDS as t9  ON t8.kid=t9.kid   
WHERE keyword in ('trigger0','trigger1') 
AND t7.aid = t1.aid) as t);
   END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAnswer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`efp`@`localhost` PROCEDURE `GetAnswer`(IN IN_TRIGGER varchar(1000))
BEGIN

DECLARE count INT DEFAULT 0;
DECLARE best_aid INT DEFAULT 0;
DECLARE maxCount INT DEFAULT 0;

SET @trigger = CONCAT(CONCAT('(',IN_TRIGGER), ')');

SET @sql =CONCAT('SELECT COUNT(DISTINCT t1.aid) INTO @iterations FROM ANSWERS as t1
JOIN KEYANSWER as t2 
on t1.aid=t2.aid 
JOIN KEYWORDS as t3 
ON t2.kid=t3.kid 
WHERE keyword in ',@trigger);

PREPARE stmt1 FROM @sql;
EXECUTE stmt1;

WHILE count < (SELECT @iterations) DO

SET @sql = CONCAT(CONCAT(CONCAT('SELECT DISTINCT(t1.aid) INTO @l_aid 
FROM ANSWERS as t1 
JOIN KEYANSWER as t2 
on t1.aid=t2.aid 
JOIN KEYWORDS as t3 
ON t2.kid=t3.kid 
WHERE t3.keyword in ',@trigger),
'ORDER BY t1.aid
LIMIT 1 OFFSET '), count);

PREPARE stmt1 FROM @sql;
EXECUTE stmt1;

SET @sql = CONCAT(CONCAT('(SELECT COUNT(*) 
into @currentCount  FROM  
(SELECT t4.aid FROM ANSWERS as t4  
JOIN KEYANSWER as t5  on t4.aid=t5.aid   
JOIN KEYWORDS as t6  ON t5.kid=t6.kid   
WHERE keyword in ', @trigger) ,
' AND t4.aid IN (SELECT @l_aid)) 
as t)');

PREPARE stmt1 FROM @sql;
EXECUTE stmt1;

IF (SELECT @currentCount) > maxCount THEN
SET maxCount = (SELECT @currentCount);
SET best_aid =  (SELECT @l_aid);
END IF;

SET count = count + 1;
END WHILE;

IF best_aid = null OR best_aid = 0 THEN
SELECT * FROM ANSWERS WHERE aid = 1;
ELSE
SELECT * FROM ANSWERS WHERE aid = best_aid;
END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAnswerTEST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`efp`@`%` PROCEDURE `GetAnswerTEST`(IN IN_TRIGGER varchar(1000))
BEGIN

DECLARE count INT DEFAULT 0;
DECLARE best_aid INT DEFAULT 0;
DECLARE maxCount INT DEFAULT 0;

SET @trigger = CONCAT(CONCAT('(',IN_TRIGGER), ')');

SET @sql =CONCAT('SELECT COUNT(DISTINCT t1.aid) INTO @iterations FROM ANSWERS as t1
JOIN KEYANSWER as t2 
on t1.aid=t2.aid 
JOIN KEYWORDS as t3 
ON t2.kid=t3.kid 
WHERE keyword in ',@trigger);

PREPARE stmt1 FROM @sql;
EXECUTE stmt1;

WHILE count < (SELECT @iterations) DO

SET @sql = CONCAT(CONCAT(CONCAT('SELECT DISTINCT(t1.aid) INTO @l_aid 
FROM ANSWERS as t1 
JOIN KEYANSWER as t2 
on t1.aid=t2.aid 
JOIN KEYWORDS as t3 
ON t2.kid=t3.kid 
WHERE t3.keyword in ',@trigger),
'ORDER BY t1.aid
LIMIT 1 OFFSET '), count);

PREPARE stmt1 FROM @sql;
EXECUTE stmt1;

SET @sql = CONCAT(CONCAT('(SELECT COUNT(*) 
into @currentCount  FROM  
(SELECT t4.aid FROM ANSWERS as t4  
JOIN KEYANSWER as t5  on t4.aid=t5.aid   
JOIN KEYWORDS as t6  ON t5.kid=t6.kid   
WHERE keyword in ', @trigger) ,
' AND t4.aid IN (SELECT @l_aid)) 
as t)');

PREPARE stmt1 FROM @sql;
EXECUTE stmt1;

IF (SELECT @currentCount) > maxCount THEN
SET maxCount = (SELECT @currentCount);
SET best_aid =  (SELECT @l_aid);
END IF;

SET count = count + 1;
END WHILE;

IF best_aid = null OR best_aid = 0 THEN
SELECT * FROM ANSWERS WHERE aid = 1;
ELSE
SELECT * FROM ANSWERS WHERE aid = best_aid;
END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-16  2:49:40
