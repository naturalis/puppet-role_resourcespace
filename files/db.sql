-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: resourcespace
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_log` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `logged` datetime DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `log_code` char(1) DEFAULT NULL,
  `note` text,
  `value_old` text,
  `value_new` text,
  `value_diff` text,
  `remote_table` varchar(100) DEFAULT NULL,
  `remote_column` varchar(100) DEFAULT NULL,
  `remote_ref` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `public` int(11) DEFAULT '0',
  `theme` varchar(100) DEFAULT NULL,
  `theme2` varchar(100) DEFAULT NULL,
  `theme3` varchar(100) DEFAULT NULL,
  `allow_changes` int(11) DEFAULT '0',
  `cant_delete` int(11) DEFAULT '0',
  `keywords` text,
  `savedsearch` int(11) DEFAULT NULL,
  `home_page_publish` int(11) DEFAULT NULL,
  `home_page_text` text,
  `home_page_image` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`),
  KEY `theme` (`theme`),
  KEY `public` (`public`),
  KEY `user` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES (1,'My Collection',1,'2008-01-01 10:00:00',0,NULL,'0','1',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_keyword`
--

DROP TABLE IF EXISTS `collection_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_keyword` (
  `collection` int(11) DEFAULT NULL,
  `keyword` int(11) DEFAULT NULL,
  KEY `collection` (`collection`),
  KEY `keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_keyword`
--

LOCK TABLES `collection_keyword` WRITE;
/*!40000 ALTER TABLE `collection_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_log`
--

DROP TABLE IF EXISTS `collection_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_log` (
  `date` datetime DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `collection` int(11) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `resource` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_log`
--

LOCK TABLES `collection_log` WRITE;
/*!40000 ALTER TABLE `collection_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_resource`
--

DROP TABLE IF EXISTS `collection_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_resource` (
  `collection` int(11) DEFAULT NULL,
  `resource` int(11) DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` text,
  `rating` int(11) DEFAULT NULL,
  `use_as_theme_thumbnail` int(11) DEFAULT NULL,
  `purchase_size` varchar(10) DEFAULT NULL,
  `purchase_complete` int(11) DEFAULT '0',
  `purchase_price` decimal(10,2) DEFAULT '0.00',
  `sortorder` int(11) DEFAULT NULL,
  KEY `collection` (`collection`),
  KEY `resource_collection` (`collection`,`resource`),
  KEY `resource` (`resource`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_resource`
--

LOCK TABLES `collection_resource` WRITE;
/*!40000 ALTER TABLE `collection_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_savedsearch`
--

DROP TABLE IF EXISTS `collection_savedsearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_savedsearch` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `collection` int(11) DEFAULT NULL,
  `search` text,
  `restypes` text,
  `starsearch` int(11) DEFAULT NULL,
  `archive` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `result_limit` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_savedsearch`
--

LOCK TABLES `collection_savedsearch` WRITE;
/*!40000 ALTER TABLE `collection_savedsearch` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_savedsearch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `ref_parent` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hide` int(1) DEFAULT '0',
  `collection_ref` int(11) DEFAULT NULL,
  `resource_ref` int(11) DEFAULT NULL,
  `user_ref` int(11) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website_url` text,
  `body` text,
  PRIMARY KEY (`ref`),
  KEY `ref_parent` (`ref_parent`),
  KEY `collection_ref` (`collection_ref`),
  KEY `resource_ref` (`resource_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_stat`
--

DROP TABLE IF EXISTS `daily_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_stat` (
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `usergroup` int(11) DEFAULT '0',
  `activity_type` varchar(50) DEFAULT NULL,
  `object_ref` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT '0',
  `external` tinyint(1) DEFAULT '0',
  KEY `stat_day` (`year`,`month`,`day`),
  KEY `stat_month` (`year`,`month`),
  KEY `stat_usergroup` (`usergroup`),
  KEY `stat_day_activity` (`year`,`month`,`day`,`activity_type`),
  KEY `stat_day_activity_ref` (`year`,`month`,`day`,`activity_type`,`object_ref`),
  KEY `activity_type` (`activity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_stat`
--

LOCK TABLES `daily_stat` WRITE;
/*!40000 ALTER TABLE `daily_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dash_tile`
--

DROP TABLE IF EXISTS `dash_tile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dash_tile` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `txt` text,
  `all_users` int(1) DEFAULT NULL,
  `default_order_by` int(11) DEFAULT NULL,
  `url` text,
  `link` text,
  `reload_interval_secs` int(11) DEFAULT NULL,
  `resource_count` int(1) DEFAULT NULL,
  `allow_delete` int(1) DEFAULT '1',
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dash_tile`
--

LOCK TABLES `dash_tile` WRITE;
/*!40000 ALTER TABLE `dash_tile` DISABLE KEYS */;
/*!40000 ALTER TABLE `dash_tile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamic_tree_node`
--

DROP TABLE IF EXISTS `dynamic_tree_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamic_tree_node` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `resource_type_field` int(11) DEFAULT '0',
  `parent` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ref`),
  KEY `parent` (`parent`),
  KEY `resource_type_field` (`resource_type_field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamic_tree_node`
--

LOCK TABLES `dynamic_tree_node` WRITE;
/*!40000 ALTER TABLE `dynamic_tree_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamic_tree_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_access_keys`
--

DROP TABLE IF EXISTS `external_access_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_access_keys` (
  `resource` int(11) DEFAULT NULL,
  `access_key` char(10) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `usergroup` int(11) DEFAULT NULL,
  `collection` int(11) DEFAULT NULL,
  `request_feedback` int(11) DEFAULT '0',
  `email` varchar(100) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `lastused` datetime DEFAULT NULL,
  `access` int(11) DEFAULT '-1',
  `expires` datetime DEFAULT NULL,
  KEY `resource` (`resource`),
  KEY `resource_key` (`resource`,`access_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_access_keys`
--

LOCK TABLES `external_access_keys` WRITE;
/*!40000 ALTER TABLE `external_access_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_access_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_lockout`
--

DROP TABLE IF EXISTS `ip_lockout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_lockout` (
  `ip` varchar(40) NOT NULL DEFAULT '',
  `tries` int(11) DEFAULT '0',
  `last_try` datetime DEFAULT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_lockout`
--

LOCK TABLES `ip_lockout` WRITE;
/*!40000 ALTER TABLE `ip_lockout` DISABLE KEYS */;
INSERT INTO `ip_lockout` VALUES ('172.16.45.240',2,'2016-06-06 14:01:47');
/*!40000 ALTER TABLE `ip_lockout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_queue`
--

DROP TABLE IF EXISTS `job_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_queue` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  `job_data` text,
  `start_date` datetime DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `success_text` varchar(250) DEFAULT NULL,
  `failure_text` varchar(250) DEFAULT NULL,
  `job_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_queue`
--

LOCK TABLES `job_queue` WRITE;
/*!40000 ALTER TABLE `job_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyword`
--

DROP TABLE IF EXISTS `keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyword` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) DEFAULT NULL,
  `soundex` varchar(50) DEFAULT NULL,
  `hit_count` int(11) DEFAULT '0',
  PRIMARY KEY (`ref`),
  KEY `keyword` (`keyword`),
  KEY `keyword_hit_count` (`hit_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyword`
--

LOCK TABLES `keyword` WRITE;
/*!40000 ALTER TABLE `keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyword_related`
--

DROP TABLE IF EXISTS `keyword_related`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyword_related` (
  `keyword` int(11) DEFAULT NULL,
  `related` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyword_related`
--

LOCK TABLES `keyword_related` WRITE;
/*!40000 ALTER TABLE `keyword_related` DISABLE KEYS */;
/*!40000 ALTER TABLE `keyword_related` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `message` mediumtext,
  `url` text,
  `expires` datetime DEFAULT NULL,
  `related_activity` int(11) DEFAULT NULL,
  `related_ref` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `resource_type_field` int(11) DEFAULT NULL,
  `name` text,
  `parent` int(11) DEFAULT NULL,
  `order_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`),
  KEY `resource_type_field` (`resource_type_field`,`ref`,`parent`,`order_by`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
INSERT INTO `node` VALUES (1,3,'Afghanistan',NULL,10),(2,3,'Aland Islands',NULL,20),(3,3,'Albania',NULL,30),(4,3,'Algeria',NULL,40),(5,3,'American Samoa',NULL,50),(6,3,'Andorra',NULL,60),(7,3,'Angola',NULL,70),(8,3,'Anguilla',NULL,80),(9,3,'Antarctica',NULL,90),(10,3,'Antigua And Barbuda',NULL,100),(11,3,'Argentina',NULL,110),(12,3,'Armenia',NULL,120),(13,3,'Aruba',NULL,130),(14,3,'Australia',NULL,140),(15,3,'Austria',NULL,150),(16,3,'Azerbaijan',NULL,160),(17,3,'Bahamas',NULL,170),(18,3,'Bahrain',NULL,180),(19,3,'Bangladesh',NULL,190),(20,3,'Barbados',NULL,200),(21,3,'Belarus',NULL,210),(22,3,'Belgium',NULL,220),(23,3,'Belize',NULL,230),(24,3,'Benin',NULL,240),(25,3,'Bermuda',NULL,250),(26,3,'Bhutan',NULL,260),(27,3,'Bolivia',NULL,270),(28,3,'Bosnia And Herzegovina',NULL,280),(29,3,'Botswana',NULL,290),(30,3,'Bouvet Island',NULL,300),(31,3,'Brazil',NULL,310),(32,3,'British Indian Ocean Territory',NULL,320),(33,3,'Brunei Darussalam',NULL,330),(34,3,'Bulgaria',NULL,340),(35,3,'Burkina Faso',NULL,350),(36,3,'Burundi',NULL,360),(37,3,'Cambodia',NULL,370),(38,3,'Cameroon',NULL,380),(39,3,'Canada',NULL,390),(40,3,'Cape Verde',NULL,400),(41,3,'Cayman Islands',NULL,410),(42,3,'Central African Republic',NULL,420),(43,3,'Chad',NULL,430),(44,3,'Chile',NULL,440),(45,3,'China',NULL,450),(46,3,'Christmas Island',NULL,460),(47,3,'Cocos (Keeling) Islands',NULL,470),(48,3,'Colombia',NULL,480),(49,3,'Comoros',NULL,490),(50,3,'Congo',NULL,500),(51,3,'Congo - The Democratic Republic Of The',NULL,510),(52,3,'Cook Islands',NULL,520),(53,3,'Costa Rica',NULL,530),(54,3,'CÃ´te D\'ivoire',NULL,540),(55,3,'Croatia',NULL,550),(56,3,'Cuba',NULL,560),(57,3,'Cyprus',NULL,570),(58,3,'Czech Republic',NULL,580),(59,3,'Denmark',NULL,590),(60,3,'Djibouti',NULL,600),(61,3,'Dominica',NULL,610),(62,3,'Dominican Republic',NULL,620),(63,3,'Ecuador',NULL,630),(64,3,'Egypt',NULL,640),(65,3,'El Salvador',NULL,650),(66,3,'Equatorial Guinea',NULL,660),(67,3,'Eritrea',NULL,670),(68,3,'Estonia',NULL,680),(69,3,'Ethiopia',NULL,690),(70,3,'Falkland Islands (Malvinas)',NULL,700),(71,3,'Faroe Islands',NULL,710),(72,3,'Fiji',NULL,720),(73,3,'Finland',NULL,730),(74,3,'France',NULL,740),(75,3,'French Guiana',NULL,750),(76,3,'French Polynesia',NULL,760),(77,3,'French Southern Territories',NULL,770),(78,3,'Gabon',NULL,780),(79,3,'Gambia',NULL,790),(80,3,'Georgia',NULL,800),(81,3,'Germany',NULL,810),(82,3,'Ghana',NULL,820),(83,3,'Gibraltar',NULL,830),(84,3,'Greece',NULL,840),(85,3,'Greenland',NULL,850),(86,3,'Grenada',NULL,860),(87,3,'Guadeloupe',NULL,870),(88,3,'Guam',NULL,880),(89,3,'Guatemala',NULL,890),(90,3,'Guernsey',NULL,900),(91,3,'Guinea',NULL,910),(92,3,'Guinea-Bissau',NULL,920),(93,3,'Guyana',NULL,930),(94,3,'Haiti',NULL,940),(95,3,'Heard Island And Mcdonald Islands',NULL,950),(96,3,'Holy See (Vatican City State)',NULL,960),(97,3,'Honduras',NULL,970),(98,3,'Hong Kong',NULL,980),(99,3,'Hungary',NULL,990),(100,3,'Iceland',NULL,1000),(101,3,'India',NULL,1010),(102,3,'Indonesia',NULL,1020),(103,3,'Iran - Islamic Republic Of',NULL,1030),(104,3,'Iraq',NULL,1040),(105,3,'Ireland',NULL,1050),(106,3,'Isle Of Man',NULL,1060),(107,3,'Israel',NULL,1070),(108,3,'Italy',NULL,1080),(109,3,'Jamaica',NULL,1090),(110,3,'Japan',NULL,1100),(111,3,'Jersey',NULL,1110),(112,3,'Jordan',NULL,1120),(113,3,'Kazakhstan',NULL,1130),(114,3,'Kenya',NULL,1140),(115,3,'Kiribati',NULL,1150),(116,3,'Korea - Democratic People\'s Republic Of',NULL,1160),(117,3,'Korea - Republic Of',NULL,1170),(118,3,'Kuwait',NULL,1180),(119,3,'Kyrgyzstan',NULL,1190),(120,3,'Lao People\'s Democratic Republic',NULL,1200),(121,3,'Latvia',NULL,1210),(122,3,'Lebanon',NULL,1220),(123,3,'Lesotho',NULL,1230),(124,3,'Liberia',NULL,1240),(125,3,'Libyan Arab Jamahiriya',NULL,1250),(126,3,'Liechtenstein',NULL,1260),(127,3,'Lithuania',NULL,1270),(128,3,'Luxembourg',NULL,1280),(129,3,'Macao',NULL,1290),(130,3,'Macedonia - The Former Yugoslav Republic Of',NULL,1300),(131,3,'Madagascar',NULL,1310),(132,3,'Malawi',NULL,1320),(133,3,'Malaysia',NULL,1330),(134,3,'Maldives',NULL,1340),(135,3,'Mali',NULL,1350),(136,3,'Malta',NULL,1360),(137,3,'Marshall Islands',NULL,1370),(138,3,'Martinique',NULL,1380),(139,3,'Mauritania',NULL,1390),(140,3,'Mauritius',NULL,1400),(141,3,'Mayotte',NULL,1410),(142,3,'Mexico',NULL,1420),(143,3,'Micronesia - Federated States Of',NULL,1430),(144,3,'Moldova - Republic Of',NULL,1440),(145,3,'Monaco',NULL,1450),(146,3,'Mongolia',NULL,1460),(147,3,'Montenegro',NULL,1470),(148,3,'Montserrat',NULL,1480),(149,3,'Morocco',NULL,1490),(150,3,'Mozambique',NULL,1500),(151,3,'Myanmar',NULL,1510),(152,3,'Namibia',NULL,1520),(153,3,'Nauru',NULL,1530),(154,3,'Nepal',NULL,1540),(155,3,'Netherlands',NULL,1550),(156,3,'Netherlands Antilles',NULL,1560),(157,3,'New Caledonia',NULL,1570),(158,3,'New Zealand',NULL,1580),(159,3,'Nicaragua',NULL,1590),(160,3,'Niger',NULL,1600),(161,3,'Nigeria',NULL,1610),(162,3,'Niue',NULL,1620),(163,3,'Norfolk Island',NULL,1630),(164,3,'Northern Mariana Islands',NULL,1640),(165,3,'Norway',NULL,1650),(166,3,'Oman',NULL,1660),(167,3,'Pakistan',NULL,1670),(168,3,'Palau',NULL,1680),(169,3,'Palestinian Territory - Occupied',NULL,1690),(170,3,'Panama',NULL,1700),(171,3,'Papua New Guinea',NULL,1710),(172,3,'Paraguay',NULL,1720),(173,3,'Peru',NULL,1730),(174,3,'Philippines',NULL,1740),(175,3,'Pitcairn',NULL,1750),(176,3,'Poland',NULL,1760),(177,3,'Portugal',NULL,1770),(178,3,'Puerto Rico',NULL,1780),(179,3,'Qatar',NULL,1790),(180,3,'RÃ©union',NULL,1800),(181,3,'Romania',NULL,1810),(182,3,'Russian Federation',NULL,1820),(183,3,'Rwanda',NULL,1830),(184,3,'Saint BarthÃ©lemy',NULL,1840),(185,3,'Saint Helena',NULL,1850),(186,3,'Saint Kitts And Nevis',NULL,1860),(187,3,'Saint Lucia',NULL,1870),(188,3,'Saint Martin',NULL,1880),(189,3,'Saint Pierre And Miquelon',NULL,1890),(190,3,'Saint Vincent And The Grenadines',NULL,1900),(191,3,'Samoa',NULL,1910),(192,3,'San Marino',NULL,1920),(193,3,'Sao Tome And Principe',NULL,1930),(194,3,'Saudi Arabia',NULL,1940),(195,3,'Senegal',NULL,1950),(196,3,'Serbia',NULL,1960),(197,3,'Seychelles',NULL,1970),(198,3,'Sierra Leone',NULL,1980),(199,3,'Singapore',NULL,1990),(200,3,'Slovakia',NULL,2000),(201,3,'Slovenia',NULL,2010),(202,3,'Solomon Islands',NULL,2020),(203,3,'Somalia',NULL,2030),(204,3,'South Africa',NULL,2040),(205,3,'South Georgia And The South Sandwich Islands',NULL,2050),(206,3,'Spain',NULL,2060),(207,3,'Sri Lanka',NULL,2070),(208,3,'Sudan',NULL,2080),(209,3,'Suriname',NULL,2090),(210,3,'Svalbard And Jan Mayen',NULL,2100),(211,3,'Swaziland',NULL,2110),(212,3,'Sweden',NULL,2120),(213,3,'Switzerland',NULL,2130),(214,3,'Syrian Arab Republic',NULL,2140),(215,3,'Taiwan - Province Of China',NULL,2150),(216,3,'Tajikistan',NULL,2160),(217,3,'Tanzania - United Republic Of',NULL,2170),(218,3,'Thailand',NULL,2180),(219,3,'Timor-Leste',NULL,2190),(220,3,'Togo',NULL,2200),(221,3,'Tokelau',NULL,2210),(222,3,'Tonga',NULL,2220),(223,3,'Trinidad And Tobago',NULL,2230),(224,3,'Tunisia',NULL,2240),(225,3,'Turkey',NULL,2250),(226,3,'Turkmenistan',NULL,2260),(227,3,'Turks And Caicos Islands',NULL,2270),(228,3,'Tuvalu',NULL,2280),(229,3,'Uganda',NULL,2290),(230,3,'Ukraine',NULL,2300),(231,3,'United Arab Emirates',NULL,2310),(232,3,'United Kingdom',NULL,2320),(233,3,'United States',NULL,2330),(234,3,'United States Minor Outlying Islands',NULL,2340),(235,3,'Uruguay',NULL,2350),(236,3,'Uzbekistan',NULL,2360),(237,3,'Vanuatu',NULL,2370),(238,3,'Venezuela - Bolivarian Republic Of',NULL,2380),(239,3,'Viet Nam',NULL,2390),(240,3,'Virgin Islands - British',NULL,2400),(241,3,'Virgin Islands - U.S.',NULL,2410),(242,3,'Wallis And Futuna',NULL,2420),(243,3,'Western Sahara',NULL,2430),(244,3,'Yemen',NULL,2440),(245,3,'Zambia',NULL,2450),(246,3,'Zimbabwe',NULL,2460),(247,54,'Digital Camera',NULL,20),(248,54,'Scanned Negative',NULL,30),(249,54,'Scanned Photo',NULL,40);
/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_keyword`
--

DROP TABLE IF EXISTS `node_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_keyword` (
  `node` int(11) DEFAULT NULL,
  `keyword` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_keyword`
--

LOCK TABLES `node_keyword` WRITE;
/*!40000 ALTER TABLE `node_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `node_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `descrip` text,
  `author` varchar(100) DEFAULT NULL,
  `update_url` varchar(100) DEFAULT NULL,
  `info_url` varchar(100) DEFAULT NULL,
  `inst_version` float DEFAULT NULL,
  `config` longblob,
  `config_json` mediumtext,
  `config_url` varchar(100) DEFAULT NULL,
  `enabled_groups` varchar(200) DEFAULT NULL,
  `priority` int(11) DEFAULT '999',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES ('rse_version','ResourceSpace Enterprise - Version Control','Montala Limited','','',1,NULL,NULL,'',NULL,100),('transform','Enables creation of cropped and scaled alternative images (jCrop w/Mobile support)','David Dwiggins','','',1.4,NULL,NULL,'/plugins/transform/pages/setup.php',NULL,998);
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preview_size`
--

DROP TABLE IF EXISTS `preview_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preview_size` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `id` char(3) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `padtosize` int(11) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `internal` int(11) DEFAULT '0',
  `allow_preview` int(11) DEFAULT '0',
  `allow_restricted` int(11) DEFAULT '0',
  `quality` int(3) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preview_size`
--

LOCK TABLES `preview_size` WRITE;
/*!40000 ALTER TABLE `preview_size` DISABLE KEYS */;
INSERT INTO `preview_size` VALUES (1,'thm',150,150,0,'Thumbnail',1,0,0,0),(2,'pre',700,450,0,'Preview',1,0,1,0),(3,'scr',1400,800,0,'Screen',0,1,0,0),(4,'lpr',2000,2000,0,'Low resolution print',0,0,0,0),(5,'hpr',999999,999999,0,'High resolution print',0,0,0,0),(6,'col',75,75,0,'Collection',1,0,0,0);
/*!40000 ALTER TABLE `preview_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `query` text,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (1,'Keywords used in resource edits','select k.keyword \'Keyword\',sum(count) \'Entered Count\' from keyword k,daily_stat d where k.ref=d.object_ref and d.activity_type=\'Keyword added to resource\'\n\n# --- date ranges\n# Make sure date is greater than FROM date\nand \n(\nd.year>[from-y]\nor \n(d.year=[from-y] and d.month>[from-m])\nor\n(d.year=[from-y] and d.month=[from-m] and d.day>=[from-d])\n)\n# Make sure date is less than TO date\nand\n(\nd.year<[to-y]\nor \n(d.year=[to-y] and d.month<[to-m])\nor\n(d.year=[to-y] and d.month=[to-m] and d.day<=[to-d])\n)\n\n\ngroup by k.ref order by \'Entered Count\' desc limit 100;\n'),(2,'Keywords used in searches','select k.keyword \'Keyword\',sum(count) Searches from keyword k,daily_stat d where k.ref=d.object_ref and d.activity_type=\'Keyword usage\'\n\n# --- date ranges\n# Make sure date is greater than FROM date\nand \n(\nd.year>[from-y]\nor \n(d.year=[from-y] and d.month>[from-m])\nor\n(d.year=[from-y] and d.month=[from-m] and d.day>=[from-d])\n)\n# Make sure date is less than TO date\nand\n(\nd.year<[to-y]\nor \n(d.year=[to-y] and d.month<[to-m])\nor\n(d.year=[to-y] and d.month=[to-m] and d.day<=[to-d])\n)\n\n\ngroup by k.ref order by Searches desc\n'),(3,'Resource download summary','select r.ref \'Resource ID\',r.view_title_field \'Title\',count(*) Downloads \n\nfrom\n\nresource_log rl\njoin resource r on rl.resource=r.ref\nwhere\nrl.type=\'d\'\nand rl.date>=date(\'[from-y]-[from-m]-[from-d]\') and rl.date<=adddate(date(\'[to-y]-[to-m]-[to-d]\'),1)\ngroup by r.ref order by \'Downloads\' desc'),(4,'Resource views','select r.ref \'Resource ID\',r.view_title_field \'Title\',sum(count) Views from resource r,daily_stat d where r.ref=d.object_ref and d.activity_type=\'Resource view\'\n\n# --- date ranges\n# Make sure date is greater than FROM date\nand \n(\nd.year>[from-y]\nor \n(d.year=[from-y] and d.month>[from-m])\nor\n(d.year=[from-y] and d.month=[from-m] and d.day>=[from-d])\n)\n# Make sure date is less than TO date\nand\n(\nd.year<[to-y]\nor \n(d.year=[to-y] and d.month<[to-m])\nor\n(d.year=[to-y] and d.month=[to-m] and d.day<=[to-d])\n)\n\n\ngroup by r.ref order by Views desc;\n'),(5,'Resources sent via e-mail','select r.ref \'Resource ID\',r.view_title_field \'Title\',sum(count) Sent from resource r,daily_stat d where r.ref=d.object_ref and d.activity_type=\'E-mailed resource\'\n\n# --- date ranges\n# Make sure date is greater than FROM date\nand \n(\nd.year>[from-y]\nor \n(d.year=[from-y] and d.month>[from-m])\nor\n(d.year=[from-y] and d.month=[from-m] and d.day>=[from-d])\n)\n# Make sure date is less than TO date\nand\n(\nd.year<[to-y]\nor \n(d.year=[to-y] and d.month<[to-m])\nor\n(d.year=[to-y] and d.month=[to-m] and d.day<=[to-d])\n)\n\n\ngroup by r.ref order by Sent desc;\n'),(6,'Resources added to collection','select r.ref \'Resource ID\',r.view_title_field \'Title\',sum(count) Added from resource r,daily_stat d where r.ref=d.object_ref and d.activity_type=\'Add resource to collection\'\n\n# --- date ranges\n# Make sure date is greater than FROM date\nand \n(\nd.year>[from-y]\nor \n(d.year=[from-y] and d.month>[from-m])\nor\n(d.year=[from-y] and d.month=[from-m] and d.day>=[from-d])\n)\n# Make sure date is less than TO date\nand\n(\nd.year<[to-y]\nor \n(d.year=[to-y] and d.month<[to-m])\nor\n(d.year=[to-y] and d.month=[to-m] and d.day<=[to-d])\n)\n\n\ngroup by r.ref order by Added desc;\n'),(7,'Resources created','select\nrl.date \'Date / Time\',\nconcat(u.username,\' (\',u.fullname,\' )\') \'Created By User\',\ng.name \'User Group\',\nr.ref \'Resource ID\',\nr.view_title_field \'Resource Title\'\n\nfrom\nresource_log rl\njoin resource r on r.ref=rl.resource\nleft outer join user u on rl.user=u.ref\nleft outer join usergroup g on u.usergroup=g.ref\nwhere\nrl.type=\'c\'\nand\nrl.date>=date(\'[from-y]-[from-m]-[from-d]\') and rl.date<=adddate(date(\'[to-y]-[to-m]-[to-d]\'),1)\norder by rl.date'),(8,'Resources with zero downloads','select ref \'Resource ID\',view_title_field \'Title\' from resource where ref not in \n\n(\n#Previous query to fetch resource downloads\nselect r.ref from resource r,daily_stat d where r.ref=d.object_ref and d.activity_type=\'Resource download\'\n\n# --- date ranges\n# Make sure date is greater than FROM date\nand \n(\nd.year>[from-y]\nor \n(d.year=[from-y] and d.month>[from-m])\nor\n(d.year=[from-y] and d.month=[from-m] and d.day>=[from-d])\n)\n# Make sure date is less than TO date\nand\n(\nd.year<[to-y]\nor \n(d.year=[to-y] and d.month<[to-m])\nor\n(d.year=[to-y] and d.month=[to-m] and d.day<=[to-d])\n)\n\n\ngroup by r.ref\n)'),(9,'Resources with zero views','select ref \'Resource ID\',view_title_field \'Title\' from resource where ref not in \n\n(\n#Previous query to fetch resource views\nselect r.ref from resource r,daily_stat d where r.ref=d.object_ref and d.activity_type=\'Resource view\'\n\n# --- date ranges\n# Make sure date is greater than FROM date\nand \n(\nd.year>[from-y]\nor \n(d.year=[from-y] and d.month>[from-m])\nor\n(d.year=[from-y] and d.month=[from-m] and d.day>=[from-d])\n)\n# Make sure date is less than TO date\nand\n(\nd.year<[to-y]\nor \n(d.year=[to-y] and d.month<[to-m])\nor\n(d.year=[to-y] and d.month=[to-m] and d.day<=[to-d])\n)\n\ngroup by r.ref\n)'),(10,'Resource downloads by group','select\ng.name \'Group Name\',\ncount(rl.resource) \'Resource Downloads\'\n\nfrom\nresource_log rl\nleft outer join user u on rl.user=u.ref\nleft outer join usergroup g on u.usergroup=g.ref\nwhere\nrl.type=\'d\'\nand rl.date>=date(\'[from-y]-[from-m]-[from-d]\') and rl.date<=adddate(date(\'[to-y]-[to-m]-[to-d]\'),1)\ngroup by g.ref order by \'Resource Downloads\' desc'),(11,'Resource download detail','select\nrl.date \'Date / Time\',\nconcat(u.username,\' (\',u.fullname,\' )\') \'Downloaded By User\',\ng.name \'User Group\',\nr.ref \'Resource ID\',\nr.title \'Resource Title\',\nrt.name \'Resource Type\'\n\nfrom\nresource_log rl\njoin resource r on r.ref=rl.resource\nleft outer join user u on rl.user=u.ref\nleft outer join usergroup g on u.usergroup=g.ref\nleft outer join resource_type rt on r.resource_type=rt.ref\nwhere\nrl.type=\'d\'\nand\nrl.date>=date(\'[from-y]-[from-m]-[from-d]\') and rl.date<=adddate(date(\'[to-y]-[to-m]-[to-d]\'),1)\norder by rl.date'),(12,'User details including group allocation','select \nu.username \'Username\',\nu.email \'E-mail address\',\nu.fullname \'Full Name\',\nu.created \'Created\',\nu.last_active \'Last Seen\',\ng.name \'Group name\'\n\nfrom user u join usergroup g on u.usergroup=g.ref\n\norder by username;'),(13,'Expired Resources','select distinct resource.ref \'Resource ID\',resource.field8 \'Resource Title\',resource_data.value \'Expires\' from resource join resource_data on resource.ref=resource_data.resource join resource_type_field on resource_data.resource_type_field=resource_type_field.ref where resource_type_field.type=6 and value>=date(\'[from-y]-[from-m]-[from-d]\') and value<=adddate(date(\'[to-y]-[to-m]-[to-d]\'),1) and length(value)>0 and resource.ref>0 order by resource.ref;'),(14,'Resources created - with thumbnails','select\nr.ref \'thumbnail\',\nrl.date \'Date / Time\',\nconcat(u.username,\' (\',u.fullname,\' )\') \'Created By User\',\ng.name \'User Group\',\nr.ref \'Resource ID\',\nr.view_title_field \'Resource Title\'\n\nfrom\nresource_log rl\njoin resource r on r.ref=rl.resource\nleft outer join user u on rl.user=u.ref\nleft outer join usergroup g on u.usergroup=g.ref\nwhere\nrl.type=\'c\'\nand\nrl.date>=date(\'[from-y]-[from-m]-[from-d]\') and rl.date<=adddate(date(\'[to-y]-[to-m]-[to-d]\'),1)\norder by rl.date;'),(15,'Keywords used in searches (with no results counter)','\n      SELECT k.keyword AS \'Keyword\',\n                  (\n                      SELECT sum(daily_stat.count)\n                         FROM daily_stat\n                       WHERE activity_type = \'Keyword usage\'\n                           AND object_ref = k.ref\n                                  # Date conditions\n                           AND (daily_stat.year > [from-y] OR (daily_stat.year = [from-y] AND daily_stat.month > [from-m]) OR (daily_stat.year = [from-y] AND daily_stat.month = [from-m] AND daily_stat.day >= [from-d]))\n                           AND (daily_stat.year < [to-y] OR (daily_stat.year = [to-y] AND daily_stat.month < [to-m]) OR (daily_stat.year = [to-y] AND daily_stat.month = [to-m] AND daily_stat.day <= [to-d]))\n                  ) AS \'Searches\',\n                  sum(d.count) AS \'No results searches\'\n         FROM keyword AS k\nINNER JOIN daily_stat AS d\n       WHERE k.ref = d.object_ref \n           AND d.activity_type = \'Keyword usage - no results found\' \n                  # Date conditions\n           AND (d.year > [from-y] OR (d.year = [from-y] AND d.month > [from-m]) OR (d.year = [from-y] AND d.month = [from-m] AND d.day >= [from-d]))\n           AND (d.year < [to-y] OR (d.year = [to-y] AND d.month < [to-m]) OR (d.year = [to-y] AND d.month = [to-m] AND d.day <= [to-d]))\n   GROUP BY k.ref\n   ORDER BY Searches DESC;'),(16,'Database statistics','\nselect \n(select count(*) from resource) as \'Total resources\',\n(select count(*) from keyword) \'Total keywords\',\n(select count(*) from resource_keyword) as \'Resource keyword relationships\',\n(select count(*) from collection) as \'Total collections\',\n(select count(*) from collection_resource) as \'Collection resource relationships\',\n(select count(*) from user) as \'Total users\';\n');
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_periodic_emails`
--

DROP TABLE IF EXISTS `report_periodic_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_periodic_emails` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `send_all_users` int(11) DEFAULT NULL,
  `user_groups` varchar(255) DEFAULT NULL,
  `report` int(11) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `email_days` int(11) DEFAULT NULL,
  `last_sent` datetime DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_periodic_emails`
--

LOCK TABLES `report_periodic_emails` WRITE;
/*!40000 ALTER TABLE `report_periodic_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_periodic_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_periodic_emails_unsubscribe`
--

DROP TABLE IF EXISTS `report_periodic_emails_unsubscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_periodic_emails_unsubscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `periodic_email_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_periodic_emails_unsubscribe`
--

LOCK TABLES `report_periodic_emails_unsubscribe` WRITE;
/*!40000 ALTER TABLE `report_periodic_emails_unsubscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_periodic_emails_unsubscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `collection` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `request_mode` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `comments` text,
  `expires` date DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `reason` text,
  `reasonapproved` text,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `research_request`
--

DROP TABLE IF EXISTS `research_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `research_request` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `description` text,
  `deadline` datetime DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `finaluse` text,
  `resource_types` varchar(50) DEFAULT NULL,
  `noresources` int(11) DEFAULT NULL,
  `shape` varchar(50) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `collection` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`),
  KEY `research_collections` (`collection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `research_request`
--

LOCK TABLES `research_request` WRITE;
/*!40000 ALTER TABLE `research_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `research_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `resource_type` int(11) DEFAULT NULL,
  `has_image` int(11) DEFAULT '0',
  `is_transcoding` int(11) DEFAULT '0',
  `hit_count` int(11) DEFAULT '0',
  `new_hit_count` int(11) DEFAULT '0',
  `creation_date` datetime DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `user_rating` int(11) DEFAULT NULL,
  `user_rating_count` int(11) DEFAULT NULL,
  `user_rating_total` int(11) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `file_extension` varchar(10) DEFAULT NULL,
  `preview_extension` varchar(10) DEFAULT NULL,
  `image_red` int(11) DEFAULT NULL,
  `image_green` int(11) DEFAULT NULL,
  `image_blue` int(11) DEFAULT NULL,
  `thumb_width` int(11) DEFAULT NULL,
  `thumb_height` int(11) DEFAULT NULL,
  `archive` int(11) DEFAULT '0',
  `access` int(11) DEFAULT '0',
  `colour_key` varchar(5) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `file_path` varchar(500) DEFAULT NULL,
  `file_modified` datetime DEFAULT NULL,
  `file_checksum` varchar(32) DEFAULT NULL,
  `request_count` int(11) DEFAULT '0',
  `expiry_notification_sent` int(11) DEFAULT '0',
  `preview_tweaks` varchar(50) DEFAULT NULL,
  `geo_lat` double DEFAULT NULL,
  `geo_long` double DEFAULT NULL,
  `mapzoom` int(11) DEFAULT NULL,
  `disk_usage` bigint(11) DEFAULT NULL,
  `disk_usage_last_updated` datetime DEFAULT NULL,
  `file_size` bigint(11) DEFAULT NULL,
  `preview_attempts` int(11) DEFAULT NULL,
  `field12` varchar(200) DEFAULT NULL,
  `field8` varchar(200) DEFAULT NULL,
  `field3` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ref`),
  KEY `hit_count` (`hit_count`),
  KEY `resource_archive` (`archive`),
  KEY `resource_access` (`access`),
  KEY `resource_type` (`resource_type`),
  KEY `resource_creation_date` (`creation_date`),
  KEY `rating` (`rating`),
  KEY `colour_key` (`colour_key`),
  KEY `has_image` (`has_image`),
  KEY `file_checksum` (`file_checksum`),
  KEY `geo_lat` (`geo_lat`),
  KEY `geo_long` (`geo_long`),
  KEY `disk_usage` (`disk_usage`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_alt_files`
--

DROP TABLE IF EXISTS `resource_alt_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_alt_files` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `resource` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_extension` varchar(10) DEFAULT NULL,
  `file_size` bigint(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `unoconv` int(11) DEFAULT NULL,
  `alt_type` varchar(100) DEFAULT NULL,
  `page_count` int(11) DEFAULT NULL,
  `transform_scale_w` int(11) DEFAULT NULL,
  `transform_scale_h` int(11) DEFAULT NULL,
  `transform_flop` int(11) DEFAULT NULL,
  `transform_rotation` int(11) DEFAULT NULL,
  `transform_crop_w` int(11) DEFAULT NULL,
  `transform_crop_h` int(11) DEFAULT NULL,
  `transform_crop_x` int(11) DEFAULT NULL,
  `transform_crop_y` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_alt_files`
--

LOCK TABLES `resource_alt_files` WRITE;
/*!40000 ALTER TABLE `resource_alt_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_alt_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_custom_access`
--

DROP TABLE IF EXISTS `resource_custom_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_custom_access` (
  `resource` int(11) DEFAULT NULL,
  `usergroup` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `access` int(11) DEFAULT NULL,
  `user_expires` date DEFAULT NULL,
  KEY `resource` (`resource`),
  KEY `usergroup` (`usergroup`),
  KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_custom_access`
--

LOCK TABLES `resource_custom_access` WRITE;
/*!40000 ALTER TABLE `resource_custom_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_custom_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_data`
--

DROP TABLE IF EXISTS `resource_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_data` (
  `resource` int(11) DEFAULT NULL,
  `resource_type_field` int(11) DEFAULT NULL,
  `value` mediumtext,
  KEY `resource` (`resource`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_data`
--

LOCK TABLES `resource_data` WRITE;
/*!40000 ALTER TABLE `resource_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_dimensions`
--

DROP TABLE IF EXISTS `resource_dimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_dimensions` (
  `resource` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT '0',
  `height` int(11) DEFAULT '0',
  `file_size` bigint(11) DEFAULT NULL,
  `resolution` int(11) DEFAULT '0',
  `unit` varchar(11) DEFAULT '0',
  `page_count` int(11) DEFAULT NULL,
  KEY `resource` (`resource`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_dimensions`
--

LOCK TABLES `resource_dimensions` WRITE;
/*!40000 ALTER TABLE `resource_dimensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_dimensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_keyword`
--

DROP TABLE IF EXISTS `resource_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_keyword` (
  `resource` int(11) DEFAULT NULL,
  `keyword` int(11) DEFAULT NULL,
  `hit_count` int(11) DEFAULT '0',
  `position` int(11) DEFAULT '0',
  `resource_type_field` int(11) DEFAULT '0',
  `new_hit_count` int(11) DEFAULT '0',
  KEY `resource_keyword` (`resource`,`keyword`),
  KEY `resource` (`resource`),
  KEY `keyword` (`keyword`),
  KEY `resource_type_field` (`resource_type_field`),
  KEY `rk_all` (`resource`,`keyword`,`resource_type_field`,`hit_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_keyword`
--

LOCK TABLES `resource_keyword` WRITE;
/*!40000 ALTER TABLE `resource_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_log`
--

DROP TABLE IF EXISTS `resource_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_log` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `resource` int(11) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `resource_type_field` int(11) DEFAULT NULL,
  `notes` text,
  `diff` text,
  `usageoption` int(11) DEFAULT NULL,
  `purchase_size` varchar(10) DEFAULT NULL,
  `purchase_price` decimal(10,2) DEFAULT '0.00',
  `access_key` char(50) DEFAULT NULL,
  `previous_value` text,
  `previous_file_alt_ref` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`),
  KEY `resource` (`resource`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_log`
--

LOCK TABLES `resource_log` WRITE;
/*!40000 ALTER TABLE `resource_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_node`
--

DROP TABLE IF EXISTS `resource_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_node` (
  `resource` int(11) DEFAULT NULL,
  `node` int(11) DEFAULT NULL,
  `hit_count` int(11) DEFAULT '0',
  `new_hit_count` int(11) DEFAULT '0',
  KEY `resource_node` (`resource`,`node`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_node`
--

LOCK TABLES `resource_node` WRITE;
/*!40000 ALTER TABLE `resource_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_related`
--

DROP TABLE IF EXISTS `resource_related`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_related` (
  `resource` int(11) DEFAULT NULL,
  `related` int(11) DEFAULT NULL,
  KEY `resource_related` (`resource`),
  KEY `related` (`related`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_related`
--

LOCK TABLES `resource_related` WRITE;
/*!40000 ALTER TABLE `resource_related` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_related` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_type`
--

DROP TABLE IF EXISTS `resource_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_type` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `allowed_extensions` text,
  `order_by` int(11) DEFAULT NULL,
  `config_options` text,
  `tab_name` varchar(50) DEFAULT NULL,
  `push_metadata` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_type`
--

LOCK TABLES `resource_type` WRITE;
/*!40000 ALTER TABLE `resource_type` DISABLE KEYS */;
INSERT INTO `resource_type` VALUES (1,'Photo',NULL,NULL,NULL,NULL,NULL),(2,'Document',NULL,NULL,NULL,NULL,NULL),(3,'Video',NULL,NULL,NULL,NULL,NULL),(4,'Audio',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `resource_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_type_field`
--

DROP TABLE IF EXISTS `resource_type_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_type_field` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `title` varchar(400) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `order_by` int(11) DEFAULT '0',
  `keywords_index` int(11) DEFAULT '0',
  `partial_index` int(11) DEFAULT '0',
  `resource_type` int(11) DEFAULT '0',
  `resource_column` varchar(50) DEFAULT NULL,
  `display_field` int(11) DEFAULT '1',
  `use_for_similar` int(11) DEFAULT '1',
  `iptc_equiv` varchar(20) DEFAULT NULL,
  `display_template` text,
  `tab_name` varchar(50) DEFAULT NULL,
  `required` int(11) DEFAULT '0',
  `smart_theme_name` varchar(200) DEFAULT NULL,
  `exiftool_field` varchar(200) DEFAULT NULL,
  `advanced_search` int(11) DEFAULT '1',
  `simple_search` int(11) DEFAULT '0',
  `help_text` text,
  `display_as_dropdown` int(11) DEFAULT '0',
  `external_user_access` int(11) DEFAULT '1',
  `autocomplete_macro` text,
  `hide_when_uploading` int(11) DEFAULT '0',
  `hide_when_restricted` int(11) DEFAULT '0',
  `value_filter` text,
  `exiftool_filter` text,
  `omit_when_copying` int(11) DEFAULT '0',
  `tooltip_text` text,
  `regexp_filter` varchar(400) DEFAULT NULL,
  `sync_field` int(11) DEFAULT NULL,
  `display_condition` varchar(400) DEFAULT NULL,
  `onchange_macro` text,
  PRIMARY KEY (`ref`),
  KEY `resource_type` (`resource_type`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_type_field`
--

LOCK TABLES `resource_type_field` WRITE;
/*!40000 ALTER TABLE `resource_type_field` DISABLE KEYS */;
INSERT INTO `resource_type_field` VALUES (1,'keywords','Keywords',1,30,1,0,0,NULL,1,1,'2#025',NULL,NULL,0,NULL,'Keywords,Subject',1,0,NULL,0,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'country','Country',9,60,1,0,0,'country',1,1,'2#101',NULL,NULL,0,NULL,'category,country',1,0,NULL,0,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'title','Title',0,10,1,0,0,'title',0,1,'2#005',NULL,NULL,1,NULL,'Title',1,0,NULL,0,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'extract','Document extract',1,7,0,0,2,NULL,1,0,NULL,'<div class=\"RecordStory\">\n\n  <h1>[title]</h1>\n\n  <p>[value]</p>\n\n</div>',NULL,0,NULL,NULL,1,0,NULL,0,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'credit','Credit',0,90,1,0,0,NULL,1,1,'2#080',NULL,NULL,0,NULL,'Source,Creator,Credit,By-line',1,0,NULL,0,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'date','Date',4,80,1,0,0,'creation_date',1,1,'2#055',NULL,NULL,0,NULL,'DateTimeOriginal',0,0,NULL,0,1,NULL,0,0,'if ($value!=\'\'){$value=nicedate($value,false);}',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'caption','Caption',1,40,1,0,0,NULL,1,0,'2#120','<div class=\"item\"><h3>[title]</h3><p>[value]</p></div>\n\n<div class=\"clearerleft\"> </div>',NULL,0,NULL,'Caption-Abstract,Description,ImageDescription',1,0,NULL,0,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,NULL,'Notes',1,110,0,0,0,NULL,1,0,'2#103','<div class=\"RecordStory\">\n\n  <h1>[title]</h1>\n\n  <p>[value]</p>\n\n</div>',NULL,0,NULL,'JobID',1,0,NULL,0,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'person','Named person(s)',0,70,1,0,0,NULL,1,1,NULL,NULL,NULL,0,NULL,'People',1,0,NULL,0,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,'originalfilename','Original filename',0,20,1,0,0,'file_path',0,1,NULL,NULL,NULL,0,NULL,NULL,1,0,NULL,0,1,NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,'camera','Camera make / model',0,1600,0,0,1,NULL,1,0,NULL,NULL,NULL,0,NULL,'Model',1,0,NULL,0,1,NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'source','Source',3,1601,0,0,1,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,1,0,NULL,0,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,'text','Extracted text',5,50,1,0,0,NULL,0,0,NULL,'<div class=\"item\"><h3>[title]</h3><p>[value]</p></div><div class=\"clearerleft\"> </div>',NULL,0,NULL,NULL,1,0,NULL,0,1,NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `resource_type_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_text`
--

DROP TABLE IF EXISTS `site_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_text` (
  `page` varchar(50) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `text` text,
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(10) DEFAULT NULL,
  `ignore_me` int(11) DEFAULT NULL,
  `specific_to_group` int(11) DEFAULT NULL,
  `custom` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_text`
--

LOCK TABLES `site_text` WRITE;
/*!40000 ALTER TABLE `site_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysvars`
--

DROP TABLE IF EXISTS `sysvars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysvars` (
  `name` varchar(50) DEFAULT NULL,
  `value` text,
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysvars`
--

LOCK TABLES `sysvars` WRITE;
/*!40000 ALTER TABLE `sysvars` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysvars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `usergroup` int(11) DEFAULT NULL,
  `last_active` datetime DEFAULT NULL,
  `logged_in` int(11) DEFAULT NULL,
  `last_browser` text,
  `last_ip` varchar(100) DEFAULT NULL,
  `current_collection` int(11) DEFAULT NULL,
  `accepted_terms` int(11) DEFAULT '0',
  `account_expires` datetime DEFAULT NULL,
  `comments` text,
  `session` varchar(50) DEFAULT NULL,
  `ip_restrict` text,
  `search_filter_override` text,
  `password_last_change` datetime DEFAULT NULL,
  `login_tries` int(11) DEFAULT '0',
  `login_last_try` datetime DEFAULT NULL,
  `approved` int(11) DEFAULT '1',
  `lang` varchar(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hidden_collections` text,
  `password_reset_hash` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ref`),
  KEY `session` (`session`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','b2c5665888d7d2898a8608c85d44fda5869e3d25f73f4063b757f8d77bca0899','Admin user','aut@naturalis.nl',3,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,'2016-06-06 14:11:36',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_collection`
--

DROP TABLE IF EXISTS `user_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_collection` (
  `user` int(11) DEFAULT NULL,
  `collection` int(11) DEFAULT NULL,
  `request_feedback` int(11) DEFAULT '0',
  KEY `collection` (`collection`),
  KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_collection`
--

LOCK TABLES `user_collection` WRITE;
/*!40000 ALTER TABLE `user_collection` DISABLE KEYS */;
INSERT INTO `user_collection` VALUES (1,1,0);
/*!40000 ALTER TABLE `user_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_dash_tile`
--

DROP TABLE IF EXISTS `user_dash_tile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_dash_tile` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `dash_tile` int(11) DEFAULT NULL,
  `order_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_dash_tile`
--

LOCK TABLES `user_dash_tile` WRITE;
/*!40000 ALTER TABLE `user_dash_tile` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_dash_tile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_message`
--

DROP TABLE IF EXISTS `user_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_message` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL DEFAULT '0',
  `message` int(11) NOT NULL DEFAULT '0',
  `seen` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ref`,`user`,`message`,`seen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_message`
--

LOCK TABLES `user_message` WRITE;
/*!40000 ALTER TABLE `user_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preferences` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `parameter` varchar(150) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rating`
--

DROP TABLE IF EXISTS `user_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rating` (
  `user` int(11) DEFAULT '0',
  `rating` int(11) DEFAULT '0',
  `ref` int(11) DEFAULT '0',
  KEY `ref` (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rating`
--

LOCK TABLES `user_rating` WRITE;
/*!40000 ALTER TABLE `user_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_userlist`
--

DROP TABLE IF EXISTS `user_userlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_userlist` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `userlist_name` varchar(50) DEFAULT NULL,
  `userlist_string` text,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userlist`
--

LOCK TABLES `user_userlist` WRITE;
/*!40000 ALTER TABLE `user_userlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_userlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup`
--

DROP TABLE IF EXISTS `usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `permissions` text,
  `fixed_theme` varchar(50) DEFAULT NULL,
  `parent` varchar(50) DEFAULT NULL,
  `search_filter` text,
  `edit_filter` text,
  `derestrict_filter` text,
  `ip_restrict` text,
  `resource_defaults` text,
  `config_options` text,
  `welcome_message` text,
  `request_mode` int(11) DEFAULT '0',
  `allow_registration_selection` int(11) DEFAULT '0',
  `group_specific_logo` text,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup`
--

LOCK TABLES `usergroup` WRITE;
/*!40000 ALTER TABLE `usergroup` DISABLE KEYS */;
INSERT INTO `usergroup` VALUES (1,'Administrators','s,g,c,e,t,h,r,u,i,e-2,e-1,e0,e1,e3,v,o,m,q,n,f*,j*,k,R,Ra,Rb,x,dta',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL),(2,'General Users','s,e-1,e-2,g,d,q,n,f*,j*',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(3,'Super Admin','s,g,c,e,a,t,h,hdt_ug,u,r,i,e-2,e-1,e0,e1,e2,e3,o,m,g,v,q,n,f*,j*,k,R,Ra,x,dta,ex',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL),(4,'Archivists','s,g,c,e,t,h,r,u,i,e1,e2,e3,v,q,n,f*,j*',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL),(5,'Restricted User - Requests Emailed (manual fulfilment)','s,f*,j*,q,dtu',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL),(6,'Restricted User - Requests Managed','s,f*,j*,q,dtu',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL),(7,'Restricted User - Payment Immediate','s,f*,j*,q,dtu',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,NULL),(8,'Restricted User - Payment Invoice','s,f*,j*,q,dtu',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,0,NULL);
/*!40000 ALTER TABLE `usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_collection`
--

DROP TABLE IF EXISTS `usergroup_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_collection` (
  `usergroup` int(11) NOT NULL DEFAULT '0',
  `collection` int(11) NOT NULL DEFAULT '0',
  `request_feedback` int(11) DEFAULT '0',
  PRIMARY KEY (`usergroup`,`collection`),
  KEY `usergroup` (`usergroup`),
  KEY `collection` (`collection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_collection`
--

LOCK TABLES `usergroup_collection` WRITE;
/*!40000 ALTER TABLE `usergroup_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_dash_tile`
--

DROP TABLE IF EXISTS `usergroup_dash_tile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_dash_tile` (
  `ref` int(11) NOT NULL AUTO_INCREMENT,
  `usergroup` int(11) DEFAULT NULL,
  `dash_tile` int(11) DEFAULT NULL,
  `default_order_by` tinyint(4) DEFAULT NULL,
  `order_by` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_dash_tile`
--

LOCK TABLES `usergroup_dash_tile` WRITE;
/*!40000 ALTER TABLE `usergroup_dash_tile` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup_dash_tile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-06 14:13:15

