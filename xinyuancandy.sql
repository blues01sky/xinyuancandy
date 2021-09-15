-- MySQL dump 10.13  Distrib 5.5.34, for Win32 (x86)
--
-- Host: localhost    Database: xinyuancandy
-- ------------------------------------------------------
-- Server version	5.5.34

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
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `priority` int(3) DEFAULT '1',
  `temp1` varchar(50) DEFAULT NULL,
  `temp2` varchar(50) DEFAULT NULL,
  `temp3` varchar(50) DEFAULT NULL,
  `temp4` varchar(50) DEFAULT NULL,
  `temp5` varchar(50) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1235 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1234,'root','root','15111515115','河南省郑州市金水区文苑西路6号',1,NULL,NULL,NULL,NULL,NULL,'2021-04-13 20:43:22',NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dingdan`
--

DROP TABLE IF EXISTS `dingdan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dingdan` (
  `id` varchar(50) DEFAULT NULL,
  `orderid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `goodsname` varchar(50) DEFAULT NULL,
  `singleprice` double(15,2) DEFAULT NULL,
  `goodsnum` int(10) DEFAULT NULL,
  `sumprice` double(15,2) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `zhushi` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `temp1` varchar(50) DEFAULT 'test',
  `temp2` varchar(50) DEFAULT 'test',
  `temp3` varchar(50) DEFAULT 'test',
  `temp4` varchar(50) DEFAULT 'test',
  `temp5` varchar(50) DEFAULT 'test',
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dingdan`
--

LOCK TABLES `dingdan` WRITE;
/*!40000 ALTER TABLE `dingdan` DISABLE KEYS */;
/*!40000 ALTER TABLE `dingdan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` varchar(50) CHARACTER SET utf8 NOT NULL,
  `coursename` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `singleprice` double(10,2) DEFAULT NULL,
  `youhui` double(10,2) DEFAULT NULL,
  `fenlei` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `img` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `kucunliang` int(10) DEFAULT '1000',
  `jinjia` double(10,2) DEFAULT NULL,
  `jianjie` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `temp1` varchar(50) CHARACTER SET utf8 DEFAULT 'test',
  `temp2` varchar(50) CHARACTER SET utf8 DEFAULT 'test',
  `temp3` varchar(50) CHARACTER SET utf8 DEFAULT 'test',
  `temp4` varchar(50) CHARACTER SET utf8 DEFAULT 'test',
  `temp5` varchar(50) CHARACTER SET utf8 DEFAULT 'test',
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liuyan`
--

DROP TABLE IF EXISTS `liuyan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liuyan` (
  `id` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `neirong` varchar(255) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `isread` varchar(255) DEFAULT NULL,
  `temp1` varchar(255) DEFAULT NULL,
  `temp2` varchar(255) DEFAULT NULL,
  `temp3` varchar(255) DEFAULT NULL,
  `temp4` varchar(255) DEFAULT NULL,
  `temp5` varchar(255) DEFAULT NULL,
  `temp6` varchar(255) DEFAULT NULL,
  `temp7` varchar(255) DEFAULT NULL,
  `temp8` varchar(255) DEFAULT NULL,
  `temp9` varchar(255) DEFAULT NULL,
  `temp10` varchar(255) DEFAULT NULL,
  `temp11` varchar(255) DEFAULT NULL,
  `temp12` varchar(255) DEFAULT NULL,
  `temp13` varchar(255) DEFAULT NULL,
  `temp14` varchar(255) DEFAULT NULL,
  `temp15` varchar(255) DEFAULT NULL,
  `temp16` varchar(255) DEFAULT NULL,
  `temp17` varchar(255) DEFAULT NULL,
  `temp18` varchar(255) DEFAULT NULL,
  `temp19` varchar(255) DEFAULT NULL,
  `temp20` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liuyan`
--

LOCK TABLES `liuyan` WRITE;
/*!40000 ALTER TABLE `liuyan` DISABLE KEYS */;
/*!40000 ALTER TABLE `liuyan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `id` varchar(50) NOT NULL,
  `adminname` varchar(50) DEFAULT NULL,
  `pagetype` varchar(50) DEFAULT NULL,
  `startpage` int(30) DEFAULT NULL,
  `count` int(10) DEFAULT NULL,
  `gonggao` varchar(200) DEFAULT NULL,
  `footgoogao` varchar(200) DEFAULT NULL,
  `footphone` varchar(50) DEFAULT NULL,
  `footaddress` varchar(100) DEFAULT NULL,
  `footemail` varchar(50) DEFAULT NULL,
  `quicklinik` varchar(100) DEFAULT NULL,
  `userquick` varchar(100) DEFAULT NULL,
  `quickaddress` varchar(50) DEFAULT NULL,
  `temp1` varchar(50) DEFAULT NULL,
  `temp2` varchar(50) DEFAULT NULL,
  `temp3` varchar(50) DEFAULT NULL,
  `temp4` varchar(50) DEFAULT NULL,
  `temp5` varchar(50) DEFAULT NULL,
  `temp6` varchar(50) DEFAULT NULL,
  `temp7` varchar(50) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES ('0d42517f-9c4d-11eb-8730-e0d55e187683','root',NULL,NULL,NULL,'今天是周三',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-04-13 20:43:51',NULL);
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address` varchar(80) DEFAULT NULL,
  `consignee` varchar(30) DEFAULT NULL,
  `sex` varchar(30) DEFAULT NULL,
  `temp1` varchar(100) DEFAULT NULL,
  `temp2` varchar(100) DEFAULT NULL,
  `temp3` varchar(100) DEFAULT NULL,
  `temp4` varchar(100) DEFAULT NULL,
  `temp5` varchar(100) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_list`
--

DROP TABLE IF EXISTS `user_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_list` (
  `sessionid` varchar(40) NOT NULL,
  `listid` int(15) DEFAULT NULL,
  `userid` varchar(30) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `remoteaddress` varchar(50) DEFAULT NULL,
  `remotehost` varchar(50) DEFAULT NULL,
  `serverport` varchar(50) DEFAULT NULL,
  `actives` varchar(50) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `temp1` varchar(30) DEFAULT NULL,
  `temp2` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sessionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_list`
--

LOCK TABLES `user_list` WRITE;
/*!40000 ALTER TABLE `user_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-25 11:39:38
