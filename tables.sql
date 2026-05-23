/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.23-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: social_media
-- ------------------------------------------------------
-- Server version	10.6.23-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment_text` text DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `fk_comment_post` (`post_id`),
  KEY `fk_comment_user` (`user_id`),
  CONSTRAINT `fk_comment_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow` (
  `follower_user_id` int(11) NOT NULL,
  `followed_user_id` int(11) NOT NULL,
  `follow_date` date DEFAULT NULL,
  PRIMARY KEY (`follower_user_id`,`followed_user_id`),
  KEY `fk_followed` (`followed_user_id`),
  CONSTRAINT `fk_followed` FOREIGN KEY (`followed_user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_follower` FOREIGN KEY (`follower_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `friendship_status`
--

DROP TABLE IF EXISTS `friendship_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `friendship_status` (
  `request_id` int(11) NOT NULL,
  `sender_user_id` int(11) DEFAULT NULL,
  `receiver_user_id` int(11) DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  KEY `fk_sender_user` (`sender_user_id`),
  KEY `fk_receiver_user` (`receiver_user_id`),
  CONSTRAINT `fk_receiver_user` FOREIGN KEY (`receiver_user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_sender_user` FOREIGN KEY (`sender_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_membership`
--

DROP TABLE IF EXISTS `group_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_membership` (
  `membership_id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `membership_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`membership_id`),
  KEY `fk_membership_group` (`group_id`),
  KEY `fk_membership_user` (`user_id`),
  CONSTRAINT `fk_membership_group` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`),
  CONSTRAINT `fk_membership_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(100) DEFAULT NULL,
  `privacy_setting` varchar(20) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  KEY `fk_group_creator` (`created_by`),
  CONSTRAINT `fk_group_creator` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `like_id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`like_id`),
  KEY `fk_like_post` (`post_id`),
  KEY `fk_like_user` (`user_id`),
  CONSTRAINT `fk_like_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  CONSTRAINT `fk_like_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `sender_user_id` int(11) DEFAULT NULL,
  `receiver_user_id` int(11) DEFAULT NULL,
  `message_text` text DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `read_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  KEY `fk_message_sender` (`sender_user_id`),
  KEY `fk_message_receiver` (`receiver_user_id`),
  CONSTRAINT `fk_message_receiver` FOREIGN KEY (`receiver_user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_message_sender` FOREIGN KEY (`sender_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `notification_type` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `read_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `fk_notification_user` (`user_id`),
  CONSTRAINT `fk_notification_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `text` varchar(200) DEFAULT NULL,
  `media_url` varchar(100) DEFAULT NULL,
  `media_type` varchar(20) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `location_tag` varchar(100) DEFAULT NULL,
  `visibility_setting` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `fk_post_user` (`user_id`),
  CONSTRAINT `fk_post_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `privacy_setting` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-15  0:04:27
