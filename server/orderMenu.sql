-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: myblog
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `collect`
--

DROP TABLE IF EXISTS `collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collect`
--

LOCK TABLES `collect` WRITE;
/*!40000 ALTER TABLE `collect` DISABLE KEYS */;
INSERT INTO `collect` VALUES (5,5,16),(6,4,16),(9,1,16),(13,3,23),(15,1,23),(17,1,17);
/*!40000 ALTER TABLE `collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginfo`
--

DROP TABLE IF EXISTS `loginfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginfo` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rolekey_idx` (`rid`),
  CONSTRAINT `rolekey` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginfo`
--

LOCK TABLES `loginfo` WRITE;
/*!40000 ALTER TABLE `loginfo` DISABLE KEYS */;
INSERT INTO `loginfo` VALUES (1,'root',19,'123',1,4),(16,'易小林',23,'123',3,1),(23,'admin-a',20,'123',2,1);
/*!40000 ALTER TABLE `loginfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `desc` varchar(256) DEFAULT NULL,
  `picture` varchar(45) DEFAULT NULL,
  `createTime` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'米饭',2,1,'优质东北大米','static/img/rice-img.jpg','2017-12-01 09:30'),(2,'宫保鸡丁',30,2,'北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈','static/img/jiding-img.jpg','2017-11-15 10:30'),(3,'千叶豆腐',25,3,'千页豆腐，味道鲜美','static/img/千页豆腐-img.jpg','2017-10-05 16:30'),(4,'烤鱼',130,4,'鱼类经过烤制之后然后进行烹饪的一种方法','static/img/烤鱼-img.jpg','2017-02-15 19:30'),(5,'美容养颜养生八宝粥',199,5,'八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用','static/img/八宝粥自制-img.jpg','2017-12-05 07:30'),(6,'安然盒饭',300,6,'安然自制盒饭，色香味俱全','static/img/安然盒饭-img.jpg','2017-11-23 09:30');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuimg`
--

DROP TABLE IF EXISTS `menuimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menuimg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `src` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuimg`
--

LOCK TABLES `menuimg` WRITE;
/*!40000 ALTER TABLE `menuimg` DISABLE KEYS */;
INSERT INTO `menuimg` VALUES (1,1,'static/img/rice-1.jpg'),(2,1,'static/img/rice-2.jpg'),(3,1,'static/img/rice-3.jpg'),(4,1,'static/img/rice-4.jpg'),(5,2,'static/img/宫保鸡丁-1.jpg'),(6,2,'static/img/宫保鸡丁-2.jpg'),(7,2,'static/img/宫保鸡丁-3.jpg'),(8,2,'static/img/宫保鸡丁-4.jpg'),(9,3,'static/img/千叶豆腐-1.jpg'),(10,3,'static/img/千叶豆腐-2.jpg'),(11,3,'static/img/千叶豆腐-3.jpg'),(12,3,'static/img/千叶豆腐-4.jpg'),(13,4,'static/img/烤鱼-1.jpg'),(14,4,'static/img/烤鱼-2.jpg'),(15,4,'static/img/烤鱼-3.jpg'),(16,4,'static/img/烤鱼-4.jpg'),(17,5,'static/img/八宝粥-1.jpg'),(18,5,'static/img/八宝粥-2.jpg'),(19,5,'static/img/八宝粥-3.jpg'),(20,6,'static/img/安然盒饭-1.jpg');
/*!40000 ALTER TABLE `menuimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderlist`
--

DROP TABLE IF EXISTS `orderlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `createdTime` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `acceptTime` varchar(45) DEFAULT NULL,
  `completeTime` varchar(45) DEFAULT NULL,
  `content` varchar(21000) DEFAULT NULL,
  `menuNum` int(11) DEFAULT NULL,
  `priceAll` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlist`
--

LOCK TABLES `orderlist` WRITE;
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
INSERT INTO `orderlist` VALUES (25,23,'2017-12-09 22:06:08',2,'2017-12-10 18:12:16','2017-12-10 18:13:51','[{\"id\":3,\"menu_id\":3,\"total\":2,\"isCheck\":\"true\",\"name\":\"千叶豆腐\",\"price\":25,\"type_id\":3,\"desc\":\"千页豆腐，味道鲜美\",\"picture\":\"static/img/千页豆腐-img.jpg\"},{\"id\":85,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"}]',3,'52'),(26,23,'2017-12-09 22:06:16',2,'2017-12-10 18:12:19','2017-12-10 18:13:53','[{\"id\":86,\"menu_id\":2,\"total\":1,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"},{\"id\":87,\"menu_id\":4,\"total\":1,\"isCheck\":\"true\",\"name\":\"烤鱼\",\"price\":130,\"type_id\":4,\"desc\":\"鱼类经过烤制之后然后进行烹饪的一种方法\",\"picture\":\"static/img/烤鱼-img.jpg\"},{\"id\":88,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"},{\"id\":89,\"menu_id\":6,\"total\":1,\"isCheck\":\"true\",\"name\":\"安然盒饭\",\"price\":300,\"type_id\":6,\"desc\":\"安然自制盒饭，色香味俱全\",\"picture\":\"static/img/安然盒饭-img.jpg\"}]',4,'659'),(27,16,'2017-12-09 22:06:41',1,'2017-12-10 18:13:30',NULL,'[{\"id\":81,\"menu_id\":3,\"total\":1,\"isCheck\":\"true\",\"name\":\"千叶豆腐\",\"price\":25,\"type_id\":3,\"desc\":\"千页豆腐，味道鲜美\",\"picture\":\"static/img/千页豆腐-img.jpg\"}]',1,'25'),(28,16,'2017-12-09 22:06:50',1,'2017-12-10 18:13:32',NULL,'[{\"id\":79,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"},{\"id\":80,\"menu_id\":2,\"total\":1,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"},{\"id\":82,\"menu_id\":4,\"total\":1,\"isCheck\":\"true\",\"name\":\"烤鱼\",\"price\":130,\"type_id\":4,\"desc\":\"鱼类经过烤制之后然后进行烹饪的一种方法\",\"picture\":\"static/img/烤鱼-img.jpg\"},{\"id\":83,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"},{\"id\":84,\"menu_id\":6,\"total\":1,\"isCheck\":\"true\",\"name\":\"安然盒饭\",\"price\":300,\"type_id\":6,\"desc\":\"安然自制盒饭，色香味俱全\",\"picture\":\"static/img/安然盒饭-img.jpg\"}]',5,'661'),(29,16,'2017-12-09 23:00:14',0,NULL,NULL,'[{\"id\":90,\"menu_id\":3,\"total\":1,\"isCheck\":\"true\",\"name\":\"千叶豆腐\",\"price\":25,\"type_id\":3,\"desc\":\"千页豆腐，味道鲜美\",\"picture\":\"static/img/千页豆腐-img.jpg\"},{\"id\":91,\"menu_id\":4,\"total\":1,\"isCheck\":\"true\",\"name\":\"烤鱼\",\"price\":130,\"type_id\":4,\"desc\":\"鱼类经过烤制之后然后进行烹饪的一种方法\",\"picture\":\"static/img/烤鱼-img.jpg\"},{\"id\":92,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"},{\"id\":93,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"},{\"id\":94,\"menu_id\":2,\"total\":1,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"},{\"id\":95,\"menu_id\":6,\"total\":1,\"isCheck\":\"true\",\"name\":\"安然盒饭\",\"price\":300,\"type_id\":6,\"desc\":\"安然自制盒饭，色香味俱全\",\"picture\":\"static/img/安然盒饭-img.jpg\"}]',6,'686'),(30,16,'2017-12-09 23:01:51',0,NULL,NULL,'[{\"id\":96,\"menu_id\":3,\"total\":1,\"isCheck\":\"true\",\"name\":\"千叶豆腐\",\"price\":25,\"type_id\":3,\"desc\":\"千页豆腐，味道鲜美\",\"picture\":\"static/img/千页豆腐-img.jpg\"},{\"id\":97,\"menu_id\":4,\"total\":1,\"isCheck\":\"true\",\"name\":\"烤鱼\",\"price\":130,\"type_id\":4,\"desc\":\"鱼类经过烤制之后然后进行烹饪的一种方法\",\"picture\":\"static/img/烤鱼-img.jpg\"},{\"id\":98,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"},{\"id\":99,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"},{\"id\":100,\"menu_id\":2,\"total\":1,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"},{\"id\":101,\"menu_id\":6,\"total\":1,\"isCheck\":\"true\",\"name\":\"安然盒饭\",\"price\":300,\"type_id\":6,\"desc\":\"安然自制盒饭，色香味俱全\",\"picture\":\"static/img/安然盒饭-img.jpg\"}]',6,'686'),(31,16,'2017-12-09 23:20:07',0,NULL,NULL,'[{\"id\":110,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"},{\"id\":111,\"menu_id\":2,\"total\":1,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"},{\"id\":112,\"menu_id\":4,\"total\":1,\"isCheck\":\"true\",\"name\":\"烤鱼\",\"price\":130,\"type_id\":4,\"desc\":\"鱼类经过烤制之后然后进行烹饪的一种方法\",\"picture\":\"static/img/烤鱼-img.jpg\"},{\"id\":113,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"},{\"id\":114,\"menu_id\":6,\"total\":1,\"isCheck\":\"true\",\"name\":\"安然盒饭\",\"price\":300,\"type_id\":6,\"desc\":\"安然自制盒饭，色香味俱全\",\"picture\":\"static/img/安然盒饭-img.jpg\"}]',5,'661'),(32,16,'2017-12-10 16:06:01',0,NULL,NULL,'[{\"id\":124,\"menu_id\":2,\"total\":2,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"},{\"id\":125,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"},{\"id\":126,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"}]',4,'261'),(33,16,'2017-12-10 16:10:39',0,NULL,NULL,'[{\"id\":124,\"menu_id\":2,\"total\":2,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"},{\"id\":125,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"},{\"id\":126,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"}]',4,'261'),(34,16,'2017-12-10 16:13:41',0,NULL,NULL,'[{\"id\":127,\"menu_id\":2,\"total\":1,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"}]',1,'30'),(35,16,'2017-12-10 16:14:42',0,NULL,NULL,'[{\"id\":124,\"menu_id\":2,\"total\":2,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"},{\"id\":125,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"},{\"id\":126,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"}]',4,'261'),(36,16,'2017-12-10 16:14:59',0,NULL,NULL,'[{\"id\":127,\"menu_id\":2,\"total\":1,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"}]',1,'30'),(37,16,'2017-12-10 16:16:23',1,'2017-12-10 18:13:46',NULL,'[{\"id\":110,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"},{\"id\":111,\"menu_id\":2,\"total\":1,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"},{\"id\":112,\"menu_id\":4,\"total\":1,\"isCheck\":\"true\",\"name\":\"烤鱼\",\"price\":130,\"type_id\":4,\"desc\":\"鱼类经过烤制之后然后进行烹饪的一种方法\",\"picture\":\"static/img/烤鱼-img.jpg\"},{\"id\":113,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"},{\"id\":114,\"menu_id\":6,\"total\":1,\"isCheck\":\"true\",\"name\":\"安然盒饭\",\"price\":300,\"type_id\":6,\"desc\":\"安然自制盒饭，色香味俱全\",\"picture\":\"static/img/安然盒饭-img.jpg\"}]',5,'661'),(38,16,'2017-12-10 16:18:00',1,'2017-12-10 18:13:44',NULL,'[{\"id\":124,\"menu_id\":2,\"total\":2,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"},{\"id\":125,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"},{\"id\":126,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"}]',4,'261'),(39,16,'2017-12-10 16:21:03',2,'2017-12-10 18:13:43','2017-12-10 18:15:33','[{\"id\":124,\"menu_id\":2,\"total\":2,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\",\"hasRate\":\"exit\"},{\"id\":125,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\",\"hasRate\":\"exit\"},{\"id\":126,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\",\"hasRate\":\"exit\"}]',4,'261'),(40,16,'2017-12-10 16:49:58',2,'2017-12-10 18:13:26','2017-12-10 18:13:39','[{\"id\":131,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\",\"hasRate\":\"exit\"}]',1,'2'),(41,23,'2017-12-10 16:51:07',2,'2017-12-10 18:13:21','2017-12-10 18:13:39','[{\"id\":132,\"menu_id\":2,\"total\":1,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"},{\"id\":133,\"menu_id\":3,\"total\":1,\"isCheck\":\"true\",\"name\":\"千叶豆腐\",\"price\":25,\"type_id\":3,\"desc\":\"千页豆腐，味道鲜美\",\"picture\":\"static/img/千页豆腐-img.jpg\"}]',2,'55'),(42,23,'2017-12-10 16:51:37',2,'2017-12-10 18:00:59','2017-12-10 18:13:37','[{\"id\":3,\"menu_id\":3,\"total\":2,\"isCheck\":\"true\",\"name\":\"千叶豆腐\",\"price\":25,\"type_id\":3,\"desc\":\"千页豆腐，味道鲜美\",\"picture\":\"static/img/千页豆腐-img.jpg\"},{\"id\":85,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"}]',3,'52'),(43,23,'2017-12-10 17:56:59',2,'2017-12-10 17:59:54','2017-12-10 17:59:59','[{\"id\":86,\"menu_id\":2,\"total\":1,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\",\"hasRate\":\"exit\"},{\"id\":87,\"menu_id\":4,\"total\":1,\"isCheck\":\"true\",\"name\":\"烤鱼\",\"price\":130,\"type_id\":4,\"desc\":\"鱼类经过烤制之后然后进行烹饪的一种方法\",\"picture\":\"static/img/烤鱼-img.jpg\"},{\"id\":88,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"},{\"id\":89,\"menu_id\":6,\"total\":1,\"isCheck\":\"true\",\"name\":\"安然盒饭\",\"price\":300,\"type_id\":6,\"desc\":\"安然自制盒饭，色香味俱全\",\"picture\":\"static/img/安然盒饭-img.jpg\"}]',4,'659'),(44,17,'2017-12-10 20:34:37',2,'2017-12-10 20:35:26','2017-12-10 20:35:48','[{\"id\":136,\"menu_id\":1,\"total\":2,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\",\"hasRate\":\"exit\"},{\"id\":137,\"menu_id\":3,\"total\":3,\"isCheck\":\"true\",\"name\":\"千叶豆腐\",\"price\":25,\"type_id\":3,\"desc\":\"千页豆腐，味道鲜美\",\"picture\":\"static/img/千页豆腐-img.jpg\",\"hasRate\":\"exit\"},{\"id\":138,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"}]',6,'278'),(45,16,'2017-12-10 20:53:53',2,'2017-12-10 20:54:08','2017-12-10 20:54:26','[{\"id\":139,\"menu_id\":6,\"total\":3,\"isCheck\":\"true\",\"name\":\"安然盒饭\",\"price\":300,\"type_id\":6,\"desc\":\"安然自制盒饭，色香味俱全\",\"picture\":\"static/img/安然盒饭-img.jpg\",\"hasRate\":\"exit\"}]',3,'900'),(46,16,'2017-12-10 20:58:34',0,NULL,NULL,'[{\"id\":140,\"menu_id\":6,\"total\":1,\"isCheck\":\"true\",\"name\":\"安然盒饭\",\"price\":300,\"type_id\":6,\"desc\":\"安然自制盒饭，色香味俱全\",\"picture\":\"static/img/安然盒饭-img.jpg\"}]',1,'300');
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordermenu`
--

DROP TABLE IF EXISTS `ordermenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordermenu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordermenu`
--

LOCK TABLES `ordermenu` WRITE;
/*!40000 ALTER TABLE `ordermenu` DISABLE KEYS */;
INSERT INTO `ordermenu` VALUES (103,1,1),(104,2,1),(105,3,1),(106,3,2),(107,1,1),(108,2,1),(109,4,1),(110,6,1),(111,5,1),(112,1,2),(113,3,3),(114,5,1),(115,6,3),(116,6,1);
/*!40000 ALTER TABLE `ordermenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part`
--

DROP TABLE IF EXISTS `part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `admin` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `admin_UNIQUE` (`admin`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part`
--

LOCK TABLES `part` WRITE;
/*!40000 ALTER TABLE `part` DISABLE KEYS */;
INSERT INTO `part` VALUES (1,'星钧部','admin-a'),(2,'项目部','admin-b'),(3,'财务部','admin-c'),(4,'后勤部','root'),(5,'未分配',NULL);
/*!40000 ALTER TABLE `part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratelist`
--

DROP TABLE IF EXISTS `ratelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratelist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `content` varchar(21000) DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `picture` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratelist`
--

LOCK TABLES `ratelist` WRITE;
/*!40000 ALTER TABLE `ratelist` DISABLE KEYS */;
INSERT INTO `ratelist` VALUES (1,1,'粒粒青白，粒粒醇香',5,'2017-12-07 12:00',16,NULL),(2,1,'昔日帝王膳，今朝百姓餐',4,'2017-12-07 16:00',23,NULL),(4,1,'感觉在吃糟糠，差评',2,'2017-12-01 18:00',7,NULL),(5,1,'怎么这么少，太烂了',1,'2017-12-03 21:00',11,NULL),(6,5,'此粥只应天上有，人间哪能喝得到',5,'2017-12-08 16:33',16,NULL),(7,1,'人间美味，难以言表',5,'2017-12-08 16:37',25,NULL),(8,2,'very good',4,'2017-12-10 19:08:13',16,NULL),(9,2,'挺好的',4,'2017-12-10 19:16:01',16,NULL),(10,2,'非常意外',5,'2017-12-10 19:17:28',16,NULL),(11,2,'撒大声地',4,'2017-12-10 19:20:32',16,NULL),(12,1,'有点不好吃啊',2,'2017-12-10 19:24:54',16,NULL),(13,1,'带图片的评论',4,'2017-12-10 19:41:50',16,'static/img/rice-img.jpg'),(14,2,'还不错呦',4,'2017-12-10 20:03:57',23,'static/img/jiding-img.jpg'),(15,1,'米饭太难吃了吧',1,'2017-12-10 20:36:26',17,'static/img/rice-img.jpg'),(16,3,'我是第二次评价了',5,'2017-12-10 20:36:45',17,'static/img/千页豆腐-img.jpg'),(17,5,'哈哈',2,'2017-12-10 20:45:18',16,'static/img/八宝粥自制-img.jpg'),(18,6,'昔日帝王膳，今朝百姓餐',5,'2017-12-10 20:55:57',16,'static/img/安然盒饭-img.jpg');
/*!40000 ALTER TABLE `ratelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `fullname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'root','超级系统管理员'),(2,'admin','部门管理员'),(3,'general','普通员工');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `isCheck` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `part_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'root',19,'123',1,4),(7,'ez',25,'123',3,2),(11,'semb',28,'123',3,1),(12,'faker',21,'123',3,1),(14,'uzi',25,'123',3,2),(15,'zzr',24,'123',3,2),(16,'易小林',23,'123',3,1),(17,'伊泽',18,'123',3,2),(18,'走A怪',18,'123',3,3),(19,'kky',25,'123',3,2),(20,'axios',19,'123',3,3),(21,'aay',18,'123',3,1),(22,'age',20,'123',3,2),(23,'admin-a',20,'123',2,1),(24,'admin-b',23,'123',2,2),(25,'admin-c',24,'123',2,3),(35,'fzq',23,'123',3,3),(36,'Ecode',24,'123',3,1),(37,'Ecode易小林',23,'123',3,1),(38,'hash',12,'123',2,1),(39,'Ey',20,'123',3,1),(40,'KY',20,'123',3,1),(43,'aaa',24,'123',3,5),(44,'eeeaa',26,'123',3,5);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'myblog'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-11 10:57:23
