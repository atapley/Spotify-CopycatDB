CREATE DATABASE  IF NOT EXISTS `spotify_copycatDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `spotify_copycatDB`;
-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: spotify_copycatDB
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add artist',6,'add_artist'),(22,'Can change artist',6,'change_artist'),(23,'Can delete artist',6,'delete_artist'),(24,'Can view artist',6,'view_artist'),(25,'Can add genre',7,'add_genre'),(26,'Can change genre',7,'change_genre'),(27,'Can delete genre',7,'delete_genre'),(28,'Can view genre',7,'view_genre'),(29,'Can add playlist',8,'add_playlist'),(30,'Can change playlist',8,'change_playlist'),(31,'Can delete playlist',8,'delete_playlist'),(32,'Can view playlist',8,'view_playlist'),(33,'Can add song',9,'add_song'),(34,'Can change song',9,'change_song'),(35,'Can delete song',9,'delete_song'),(36,'Can view song',9,'view_song'),(37,'Can add spotify user',10,'add_spotifyuser'),(38,'Can change spotify user',10,'change_spotifyuser'),(39,'Can delete spotify user',10,'delete_spotifyuser'),(40,'Can view spotify user',10,'view_spotifyuser'),(41,'Can add user likes',11,'add_userlikes'),(42,'Can change user likes',11,'change_userlikes'),(43,'Can delete user likes',11,'delete_userlikes'),(44,'Can view user likes',11,'view_userlikes'),(45,'Can add user follow',12,'add_userfollow'),(46,'Can change user follow',12,'change_userfollow'),(47,'Can delete user follow',12,'delete_userfollow'),(48,'Can view user follow',12,'view_userfollow'),(49,'Can add playlist songs',13,'add_playlistsongs'),(50,'Can change playlist songs',13,'change_playlistsongs'),(51,'Can delete playlist songs',13,'delete_playlistsongs'),(52,'Can view playlist songs',13,'view_playlistsongs');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_spotify_s` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_spotify_s` FOREIGN KEY (`user_id`) REFERENCES `spotify_spotifyuser` (`username`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(6,'spotify','artist'),(7,'spotify','genre'),(8,'spotify','playlist'),(13,'spotify','playlistsongs'),(9,'spotify','song'),(10,'spotify','spotifyuser'),(12,'spotify','userfollow'),(11,'spotify','userlikes');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'spotify','0001_initial','2020-04-14 16:10:55.625707'),(2,'contenttypes','0001_initial','2020-04-14 16:10:55.675267'),(3,'admin','0001_initial','2020-04-14 16:10:55.697775'),(4,'admin','0002_logentry_remove_auto_add','2020-04-14 16:10:55.787349'),(5,'admin','0003_logentry_add_action_flag_choices','2020-04-14 16:10:55.793844'),(6,'contenttypes','0002_remove_content_type_name','2020-04-14 16:10:55.845247'),(7,'auth','0001_initial','2020-04-14 16:10:55.893842'),(8,'auth','0002_alter_permission_name_max_length','2020-04-14 16:10:55.988595'),(9,'auth','0003_alter_user_email_max_length','2020-04-14 16:10:56.013765'),(10,'auth','0004_alter_user_username_opts','2020-04-14 16:10:56.022297'),(11,'auth','0005_alter_user_last_login_null','2020-04-14 16:10:56.031242'),(12,'auth','0006_require_contenttypes_0002','2020-04-14 16:10:56.034357'),(13,'auth','0007_alter_validators_add_error_messages','2020-04-14 16:10:56.042734'),(14,'auth','0008_alter_user_username_max_length','2020-04-14 16:10:56.051039'),(15,'auth','0009_alter_user_last_name_max_length','2020-04-14 16:10:56.059334'),(16,'auth','0010_alter_group_name_max_length','2020-04-14 16:10:56.075136'),(17,'auth','0011_update_proxy_permissions','2020-04-14 16:10:56.089699'),(18,'sessions','0001_initial','2020-04-14 16:10:56.103298'),(19,'spotify','0002_auto_20200414_0005','2020-04-14 16:10:56.839879');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spotify_artist`
--

DROP TABLE IF EXISTS `spotify_artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spotify_artist` (
  `artistName` varchar(50) NOT NULL,
  `mainGenre` int NOT NULL,
  PRIMARY KEY (`artistName`),
  KEY `spotify_artist_mainGenre_5fc9b805` (`mainGenre`),
  CONSTRAINT `spotify_artist_mainGenre_5fc9b805_fk_spotify_genre_genreID` FOREIGN KEY (`mainGenre`) REFERENCES `spotify_genre` (`genreID`),
  CONSTRAINT `artistName_not_blank` CHECK ((`artistName` <> _utf8mb3''))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spotify_artist`
--

LOCK TABLES `spotify_artist` WRITE;
/*!40000 ALTER TABLE `spotify_artist` DISABLE KEYS */;
INSERT INTO `spotify_artist` VALUES ('Florida Georgia Line',1),('High Valley',1),('Guns N\' Roses',2),('Van halen',2),('Eminem',3),('G-Eazy',3);
/*!40000 ALTER TABLE `spotify_artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spotify_genre`
--

DROP TABLE IF EXISTS `spotify_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spotify_genre` (
  `genreID` int NOT NULL,
  `genre` varchar(50) NOT NULL,
  PRIMARY KEY (`genreID`),
  CONSTRAINT `genre_not_blank` CHECK ((`genre` <> _utf8mb3''))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spotify_genre`
--

LOCK TABLES `spotify_genre` WRITE;
/*!40000 ALTER TABLE `spotify_genre` DISABLE KEYS */;
INSERT INTO `spotify_genre` VALUES (1,'Country'),(2,'Rock'),(3,'Rap');
/*!40000 ALTER TABLE `spotify_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spotify_playlist`
--

DROP TABLE IF EXISTS `spotify_playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spotify_playlist` (
  `playlistID` int NOT NULL,
  `playlistName` varchar(50) NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  PRIMARY KEY (`playlistID`),
  KEY `spotify_playlist_createdBy_d8fc93d0` (`createdBy`),
  CONSTRAINT `spotify_playlist_createdBy_d8fc93d0_fk_spotify_s` FOREIGN KEY (`createdBy`) REFERENCES `spotify_spotifyuser` (`username`),
  CONSTRAINT `playlistName_not_blank` CHECK ((`playlistName` <> _utf8mb3''))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spotify_playlist`
--

LOCK TABLES `spotify_playlist` WRITE;
/*!40000 ALTER TABLE `spotify_playlist` DISABLE KEYS */;
INSERT INTO `spotify_playlist` VALUES (1,'CountryPlaylist','User1'),(2,'RockPlaylist','User1'),(3,'PartyPlaylist','User2');
/*!40000 ALTER TABLE `spotify_playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spotify_playlistsongs`
--

DROP TABLE IF EXISTS `spotify_playlistsongs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spotify_playlistsongs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `songID` int NOT NULL,
  `playlistID` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `spotify_playlistsongs_songID_playlistID_796a4882_uniq` (`songID`,`playlistID`),
  KEY `spotify_playlistsongs_playlistID_e3637146` (`playlistID`),
  KEY `spotify_playlistsongs_songID_5d272996` (`songID`),
  CONSTRAINT `spotify_playlistsong_playlistID_e3637146_fk_spotify_p` FOREIGN KEY (`playlistID`) REFERENCES `spotify_playlist` (`playlistID`),
  CONSTRAINT `spotify_playlistsongs_songID_5d272996_fk_spotify_song_songID` FOREIGN KEY (`songID`) REFERENCES `spotify_song` (`songID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spotify_playlistsongs`
--

LOCK TABLES `spotify_playlistsongs` WRITE;
/*!40000 ALTER TABLE `spotify_playlistsongs` DISABLE KEYS */;
INSERT INTO `spotify_playlistsongs` VALUES (1,1,1),(2,2,1),(3,3,1),(8,4,3),(6,5,3),(4,6,2),(7,7,3),(5,8,2),(9,9,3),(10,10,3);
/*!40000 ALTER TABLE `spotify_playlistsongs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spotify_song`
--

DROP TABLE IF EXISTS `spotify_song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spotify_song` (
  `songID` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `duration` int NOT NULL,
  `genreID` int NOT NULL,
  `artist` varchar(50) NOT NULL,
  PRIMARY KEY (`songID`),
  KEY `spotify_song_artist_49944d00` (`artist`),
  KEY `spotify_song_genreID_61b19bff` (`genreID`),
  CONSTRAINT `spotify_song_artist_49944d00_fk_spotify_artist_artistName` FOREIGN KEY (`artist`) REFERENCES `spotify_artist` (`artistName`),
  CONSTRAINT `spotify_song_genreID_61b19bff_fk_spotify_genre_genreID` FOREIGN KEY (`genreID`) REFERENCES `spotify_genre` (`genreID`),
  CONSTRAINT `title_not_blank` CHECK ((`title` <> _utf8mb3''))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spotify_song`
--

LOCK TABLES `spotify_song` WRITE;
/*!40000 ALTER TABLE `spotify_song` DISABLE KEYS */;
INSERT INTO `spotify_song` VALUES (1,'Smooth',170,1,'Florida Georgia Line'),(2,'Dig Your Roots',213,1,'Florida Georgia Line'),(3,'Farm Girl',181,1,'High Valley'),(4,'Be You',188,1,'High Valley'),(5,'Good Enough',243,2,'Van Halen'),(6,'Get Up',283,2,'Van Halen'),(7,'Welcome to the Jungle',273,2,'Guns N\' Roses'),(8,'Sweet Child O\' Mine',356,2,'Guns N\' Roses'),(9,'These Things Happen',144,3,'G-Eazy'),(10,'Almost Famous',269,3,'G-Eazy'),(11,'FACK',206,3,'Eminem'),(12,'The Way I Am',291,3,'Eminem');
/*!40000 ALTER TABLE `spotify_song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spotify_spotifyuser`
--

DROP TABLE IF EXISTS `spotify_spotifyuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spotify_spotifyuser` (
  `username` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `dateJoined` date NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `firstName_not_blank` CHECK ((`firstName` <> _utf8mb4'')),
  CONSTRAINT `password_not_blank` CHECK (((`pass` <> _utf8mb3'') and (not((`pass` like cast(_utf8mb3'% %' as char charset binary)))))),
  CONSTRAINT `username_not_blank` CHECK (((`username` <> _utf8mb4'') and (not((`username` like cast(_utf8mb3'% %' as char charset binary))))))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spotify_spotifyuser`
--

LOCK TABLES `spotify_spotifyuser` WRITE;
/*!40000 ALTER TABLE `spotify_spotifyuser` DISABLE KEYS */;
INSERT INTO `spotify_spotifyuser` VALUES ('User1','password123','Tester1','2020-03-28'),('User2','password123','Tester2','2020-03-28');
/*!40000 ALTER TABLE `spotify_spotifyuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spotify_userfollow`
--

DROP TABLE IF EXISTS `spotify_userfollow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spotify_userfollow` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `artist` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `spotify_userfollow_username_artist_18c947b2_uniq` (`username`,`artist`),
  KEY `spotify_userfollow_artist_de42d3c5` (`artist`),
  KEY `spotify_userfollow_username_767e9e54` (`username`),
  CONSTRAINT `spotify_userfollow_artist_de42d3c5_fk_spotify_artist_artistName` FOREIGN KEY (`artist`) REFERENCES `spotify_artist` (`artistName`),
  CONSTRAINT `spotify_userfollow_username_767e9e54_fk_spotify_s` FOREIGN KEY (`username`) REFERENCES `spotify_spotifyuser` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spotify_userfollow`
--

LOCK TABLES `spotify_userfollow` WRITE;
/*!40000 ALTER TABLE `spotify_userfollow` DISABLE KEYS */;
INSERT INTO `spotify_userfollow` VALUES (3,'User1','G-Eazy'),(1,'User1','High Valley'),(2,'User1','Van Halen');
/*!40000 ALTER TABLE `spotify_userfollow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spotify_userlikes`
--

DROP TABLE IF EXISTS `spotify_userlikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spotify_userlikes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `songID` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `spotify_userlikes_username_songID_05f8e46b_uniq` (`username`,`songID`),
  KEY `spotify_userlikes_songID_b6e86bd8` (`songID`),
  KEY `spotify_userlikes_username_ad21cc26` (`username`),
  CONSTRAINT `spotify_userlikes_songID_b6e86bd8_fk_spotify_song_songID` FOREIGN KEY (`songID`) REFERENCES `spotify_song` (`songID`),
  CONSTRAINT `spotify_userlikes_username_ad21cc26_fk_spotify_s` FOREIGN KEY (`username`) REFERENCES `spotify_spotifyuser` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spotify_userlikes`
--

LOCK TABLES `spotify_userlikes` WRITE;
/*!40000 ALTER TABLE `spotify_userlikes` DISABLE KEYS */;
INSERT INTO `spotify_userlikes` VALUES (1,'User1',1),(2,'User1',2),(3,'User1',4),(6,'User1',6),(4,'User1',7),(5,'User1',9),(9,'User2',1),(7,'User2',4),(8,'User2',8);
/*!40000 ALTER TABLE `spotify_userlikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'spotify_copycatDB'
--
/*!50003 DROP PROCEDURE IF EXISTS `artist_catalog` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `artist_catalog`()
BEGIN
  SELECT artistName, genre
  FROM spotify_artist JOIN spotify_genre ON spotify_artist.mainGenre = spotify_genre.genreID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `in_playlist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `in_playlist`(IN id int)
BEGIN
SELECT a.songID, title, artist, (playlistID IS NOT NULL) AS in_playlist
FROM spotify_song a LEFT JOIN (SELECT * FROM spotify_playlistsongs b WHERE playlistID = id) AS temp
ON a.songID = temp.songID;
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

-- Dump completed on 2020-04-14 12:11:38
