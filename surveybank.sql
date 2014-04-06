-- MySQL dump 10.13  Distrib 5.1.34, for Win32 (ia32)
--
-- Host: localhost    Database: surveybank
-- ------------------------------------------------------
-- Server version	5.1.34-community

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
-- Table structure for table `survey`
--

DROP TABLE IF EXISTS `survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey` (
  `num` int(5) NOT NULL AUTO_INCREMENT,
  `cate` char(4) DEFAULT NULL,
  `que` text,
  `ans` text,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` VALUES (1,'선택형','당신의 성별은 무엇입니까?','남, 여'),(2,'선택형','당신이 좋아하는 프로그래밍 언어는?','asp,jsp,c++,c,flex,java'),(3,'단답형','어느 대학을 다니시나요?','');
/*!40000 ALTER TABLE `survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey1`
--

DROP TABLE IF EXISTS `survey1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey1` (
  `no` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `contents` text,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey1`
--

LOCK TABLES `survey1` WRITE;
/*!40000 ALTER TABLE `survey1` DISABLE KEYS */;
INSERT INTO `survey1` VALUES (1,'남'),(2,' 여'),(3,'남'),(4,'남');
/*!40000 ALTER TABLE `survey1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey2`
--

DROP TABLE IF EXISTS `survey2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey2` (
  `no` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `contents` text,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey2`
--

LOCK TABLES `survey2` WRITE;
/*!40000 ALTER TABLE `survey2` DISABLE KEYS */;
INSERT INTO `survey2` VALUES (1,'jsp'),(2,'jsp'),(3,'jsp'),(4,'asp'),(5,'java'),(6,'c');
/*!40000 ALTER TABLE `survey2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey29`
--

DROP TABLE IF EXISTS `survey29`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey29` (
  `no` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `contents` text,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey29`
--

LOCK TABLES `survey29` WRITE;
/*!40000 ALTER TABLE `survey29` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey29` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey3`
--

DROP TABLE IF EXISTS `survey3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey3` (
  `no` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `contents` text,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey3`
--

LOCK TABLES `survey3` WRITE;
/*!40000 ALTER TABLE `survey3` DISABLE KEYS */;
INSERT INTO `survey3` VALUES (1,'인하대학교'),(2,'인하대학교'),(3,'');
/*!40000 ALTER TABLE `survey3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey30`
--

DROP TABLE IF EXISTS `survey30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey30` (
  `no` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `contents` text,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey30`
--

LOCK TABLES `survey30` WRITE;
/*!40000 ALTER TABLE `survey30` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey30` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey31`
--

DROP TABLE IF EXISTS `survey31`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey31` (
  `no` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `contents` text,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey31`
--

LOCK TABLES `survey31` WRITE;
/*!40000 ALTER TABLE `survey31` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey31` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveylist`
--

DROP TABLE IF EXISTS `surveylist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveylist` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `subtitle` varchar(200) DEFAULT NULL,
  `type` char(10) DEFAULT NULL,
  `survey` text,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveylist`
--

LOCK TABLES `surveylist` WRITE;
/*!40000 ALTER TABLE `surveylist` DISABLE KEYS */;
INSERT INTO `surveylist` VALUES (29,'강의 평가','한학기 동안 들었던 강의를 평가해봅시다.\r\n정확한 평가를 부탁드립니다.','종합형','1!@웹프로그래밍!@매우좋음, 좋음, 보통, 나쁨, 매우나쁨!@2!@휴강이 있었던 강의를 선택해주세요!@!@3!@가장 마음에 들었던 강의와 이유를 넣어주세요!@'),(30,'대학 선호도 조사','대학 선호도에 대한 조사입니다.\r\n어떤 대학이 인기가 있는지 알아보려고 합니다.','종합형','1!@취업시 선호하는 대학!@인하대, 서울대, 연세대, 고려대!@1!@입시성적이 높은 대학!@인하대, 서울대, 연세대, 고려대!@2!@가고 싶은 대학!@인하대, 서울대, 연세대, 고려대!@3!@그외 좋아하는 대학!@'),(31,'선호하는 직업','선호하는 직업에 대한 설문조사입니다.','종합형','3!@어떤 직업을 갖고싶으세요?!@4!@그 이유는 무었인가요?!@');
/*!40000 ALTER TABLE `surveylist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-06-21 22:42:56
