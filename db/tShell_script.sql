CREATE DATABASE  IF NOT EXISTS `tshell` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `tshell`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: tshell
-- ------------------------------------------------------
-- Server version	5.1.45-community

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
-- Table structure for table `assessment_question`
--

DROP TABLE IF EXISTS `assessment_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_question` (
  `aq_id` int(11) NOT NULL AUTO_INCREMENT,
  `aq_as_id` int(11) NOT NULL,
  `aq_qu_id` int(11) NOT NULL,
  PRIMARY KEY (`aq_id`),
  KEY `aq_as_id` (`aq_as_id`),
  KEY `aq_qu_id` (`aq_qu_id`),
  CONSTRAINT `aq_as_id` FOREIGN KEY (`aq_as_id`) REFERENCES `assessment` (`as_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `aq_qu_id` FOREIGN KEY (`aq_qu_id`) REFERENCES `question` (`qu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_question`
--

LOCK TABLES `assessment_question` WRITE;
/*!40000 ALTER TABLE `assessment_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_question_option`
--

DROP TABLE IF EXISTS `assessment_question_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_question_option` (
  `ao_id` int(11) NOT NULL AUTO_INCREMENT,
  `ao_aq_id` int(11) DEFAULT NULL,
  `ao_op_id` int(11) DEFAULT NULL,
  `ao_is_selected` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ao_id`),
  KEY `ao_aq_fk` (`ao_aq_id`),
  KEY `ao_op_fk` (`ao_op_id`),
  CONSTRAINT `ao_aq_fk` FOREIGN KEY (`ao_aq_id`) REFERENCES `assessment_question` (`aq_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ao_op_fk` FOREIGN KEY (`ao_op_id`) REFERENCES `option` (`op_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_question_option`
--

LOCK TABLES `assessment_question_option` WRITE;
/*!40000 ALTER TABLE `assessment_question_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_question_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_answer_type`
--

DROP TABLE IF EXISTS `question_answer_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_answer_type` (
  `qt_id` int(11) NOT NULL AUTO_INCREMENT,
  `qt_type` varchar(15) NOT NULL DEFAULT 'single',
  PRIMARY KEY (`qt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_answer_type`
--

LOCK TABLES `question_answer_type` WRITE;
/*!40000 ALTER TABLE `question_answer_type` DISABLE KEYS */;
INSERT INTO `question_answer_type` VALUES (1,'mcq'),(2,'descriptive');
/*!40000 ALTER TABLE `question_answer_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_skill`
--

DROP TABLE IF EXISTS `user_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_skill` (
  `uk_id` int(11) NOT NULL AUTO_INCREMENT,
  `uk_us_id` int(11) NOT NULL,
  `uk_sk_id` int(11) NOT NULL,
  PRIMARY KEY (`uk_id`),
  KEY `uk_us_id` (`uk_us_id`),
  KEY `uk_sk_id` (`uk_sk_id`),
  CONSTRAINT `uk_us_id` FOREIGN KEY (`uk_us_id`) REFERENCES `user` (`us_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `uk_sk_id` FOREIGN KEY (`uk_sk_id`) REFERENCES `skill` (`sk_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_skill`
--

LOCK TABLES `user_skill` WRITE;
/*!40000 ALTER TABLE `user_skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic_question`
--

DROP TABLE IF EXISTS `topic_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic_question` (
  `tq_id` int(11) NOT NULL AUTO_INCREMENT,
  `tq_tp_id` int(11) NOT NULL,
  `tq_qu_id` int(11) NOT NULL,
  PRIMARY KEY (`tq_id`),
  KEY `tq_tp_id` (`tq_tp_id`),
  KEY `tq_qu_id` (`tq_qu_id`),
  CONSTRAINT `tq_tp_id` FOREIGN KEY (`tq_tp_id`) REFERENCES `topic` (`tp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tq_qu_id` FOREIGN KEY (`tq_qu_id`) REFERENCES `question` (`qu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_question`
--

LOCK TABLES `topic_question` WRITE;
/*!40000 ALTER TABLE `topic_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `topic_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `qu_id` int(11) NOT NULL AUTO_INCREMENT,
  `qu_question` varchar(100) NOT NULL,
  `qu_qd_id` int(11) NOT NULL,
  `qu_status` varchar(45) NOT NULL,
  `qu_created_by_us_id` int(11) DEFAULT NULL,
  `qu_qt_id` int(11) DEFAULT NULL,
  `qu_reviewed_by_us_id` int(11) DEFAULT NULL,
  `qu_created_date` date DEFAULT NULL,
  `qu_reviewed_date` date DEFAULT NULL,
  PRIMARY KEY (`qu_id`),
  KEY `qu_df_id` (`qu_qd_id`),
  KEY `qu_us_fk` (`qu_created_by_us_id`),
  KEY `qu_qt_id` (`qu_qt_id`),
  CONSTRAINT `qu_df_id` FOREIGN KEY (`qu_qd_id`) REFERENCES `question_difficulty` (`qd_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `qu_us_fk` FOREIGN KEY (`qu_created_by_us_id`) REFERENCES `user` (`us_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `qu_qt_id` FOREIGN KEY (`qu_qt_id`) REFERENCES `question_answer_type` (`qt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'What is the syntax to show output in java?',3,'Approved',1,1,1,'2018-12-19','2018-12-20'),(2,'What does OOPS stand for?',2,'Approved',1,1,1,'2018-12-19','2018-12-20'),(3,'What is the syntax of count query in mysql?',1,'Approved',1,1,1,'2018-12-19','2018-12-20');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `ur_id` int(11) NOT NULL AUTO_INCREMENT,
  `ur_role` varchar(45) NOT NULL,
  PRIMARY KEY (`ur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'ADMIN');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_difficulty`
--

DROP TABLE IF EXISTS `question_difficulty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_difficulty` (
  `qd_id` int(11) NOT NULL AUTO_INCREMENT,
  `qd_difficulty` varchar(7) NOT NULL,
  PRIMARY KEY (`qd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_difficulty`
--

LOCK TABLES `question_difficulty` WRITE;
/*!40000 ALTER TABLE `question_difficulty` DISABLE KEYS */;
INSERT INTO `question_difficulty` VALUES (1,'HARD'),(2,'MEDIUM'),(3,'EASY');
/*!40000 ALTER TABLE `question_difficulty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `tp_id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_name` varchar(45) NOT NULL,
  `tp_sk_id` int(11) NOT NULL,
  PRIMARY KEY (`tp_id`),
  KEY `tp_sk_id` (`tp_sk_id`),
  CONSTRAINT `tp_sk_id` FOREIGN KEY (`tp_sk_id`) REFERENCES `skill` (`sk_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `us_id` int(11) NOT NULL AUTO_INCREMENT,
  `us_name` varchar(45) NOT NULL,
  `us_email` varchar(45) NOT NULL,
  `us_password` varchar(45) NOT NULL,
  `us_ur_id` int(11) NOT NULL,
  `us_emp_id` int(11) DEFAULT NULL,
  `us_image` longblob,
  `us_signup_date` date DEFAULT NULL,
  `us_last_login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`us_id`),
  KEY `us_ur_id` (`us_ur_id`),
  CONSTRAINT `us_ur_id` FOREIGN KEY (`us_ur_id`) REFERENCES `user_role` (`ur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'soumya','john@email.com','123',1,729714,NULL,'2018-12-13','2018-12-20 23:59:59');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill` (
  `sk_id` int(11) NOT NULL AUTO_INCREMENT,
  `sk_name` varchar(45) NOT NULL,
  `sk_search_count` int(11) DEFAULT NULL,
  `sk_active` varchar(45) NOT NULL,
  `sk_test_count` int(11) DEFAULT NULL,
  `sk_description` varchar(140) DEFAULT NULL,
  `sk_image` longblob,
  `sk_creation_date` date DEFAULT NULL,
  PRIMARY KEY (`sk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment`
--

DROP TABLE IF EXISTS `assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment` (
  `as_id` int(11) NOT NULL AUTO_INCREMENT,
  `as_type` varchar(6) NOT NULL,
  `as_start_time` datetime NOT NULL,
  `as_score` float NOT NULL,
  `as_sk_id` int(11) NOT NULL,
  `as_us_id` int(11) NOT NULL,
  `as_end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`as_id`),
  KEY `as_sk_id` (`as_sk_id`),
  KEY `as_us_id` (`as_us_id`),
  CONSTRAINT `as_sk_id` FOREIGN KEY (`as_sk_id`) REFERENCES `skill` (`sk_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `as_us_id` FOREIGN KEY (`as_us_id`) REFERENCES `user` (`us_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment`
--

LOCK TABLES `assessment` WRITE;
/*!40000 ALTER TABLE `assessment` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option`
--

DROP TABLE IF EXISTS `option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option` (
  `op_id` int(11) NOT NULL AUTO_INCREMENT,
  `op_description` varchar(45) NOT NULL,
  `op_qu_id` int(11) NOT NULL,
  `op_is_correct` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`op_id`),
  KEY `op_qu_fk` (`op_qu_id`),
  CONSTRAINT `op_qu_fk` FOREIGN KEY (`op_qu_id`) REFERENCES `question` (`qu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option`
--

LOCK TABLES `option` WRITE;
/*!40000 ALTER TABLE `option` DISABLE KEYS */;
/*!40000 ALTER TABLE `option` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-20 15:22:46
