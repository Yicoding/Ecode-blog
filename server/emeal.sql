-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: emeal
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collect`
--

LOCK TABLES `collect` WRITE;
/*!40000 ALTER TABLE `collect` DISABLE KEYS */;
INSERT INTO `collect` VALUES (5,5,16),(6,4,16),(13,3,23),(15,1,23),(17,1,17),(18,1,16),(19,1,47);
/*!40000 ALTER TABLE `collect` ENABLE KEYS */;
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
  `descript` longtext,
  `picture` longtext,
  `createTime` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'米饭',2,1,'优质东北大米','static/img/rice-img.jpg','2017-12-01 09:30'),(2,'宫保鸡丁',30,2,'北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈','static/img/jiding-img.jpg','2017-11-15 10:30'),(3,'千叶豆腐',25,3,'千页豆腐，味道鲜美','static/img/千页豆腐-img.jpg','2017-10-05 16:30'),(4,'烤鱼',130,4,'鱼类经过烤制之后然后进行烹饪的一种方法','static/img/烤鱼-img.jpg','2017-02-15 19:30'),(5,'美容养颜养生八宝粥',199,5,'八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用','static/img/八宝粥自制-img.jpg','2017-12-05 07:30'),(6,'安然盒饭',300,6,'安然自制盒饭，色香味俱全','static/img/安然盒饭-img.jpg','2017-11-23 09:30'),(7,'七夕虐狗',200,1,'七夕狂欢','static/menucover/1512999985554qixi.png','2017-12-11 21:47:35'),(8,'天空之城',50,1,'想象的星空','static/menucover/1513000442922想象.jpg','2017-12-11 21:54:50'),(9,'是的撒',1223,1,'213','static/menucover/1513000567786logo.jpg','2017-12-11 21:56:19'),(10,'剑姬',45,1,'圣斗士','static/menucover/1516533153180menu1.jpg','2017-12-11 22:00:45'),(11,'头像',15,1,'回眸','static/menucover/1513000900572null5c45cb615341b156.jpg','2017-12-11 22:04:03'),(13,'美妙的餐厅',60,1,'一起来进餐吧','static/menucover/1513007348072mmexport1512865225974.jpg','2017-12-11 23:49:34'),(14,'双肩包',100,1,'亲笔签名双肩包','static/menucover/1513236062448login.png','2017-12-13 20:43:21'),(15,'二次元',50,1,'我们不一样，每个人都有不同的境遇','static/menucover/1516628068566menu2.jpg','2018-01-22 21:35:03');
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
  `src` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuimg`
--

LOCK TABLES `menuimg` WRITE;
/*!40000 ALTER TABLE `menuimg` DISABLE KEYS */;
INSERT INTO `menuimg` VALUES (1,1,'static/img/rice-1.jpg'),(2,1,'static/img/rice-2.jpg'),(3,1,'static/img/rice-3.jpg'),(4,1,'static/img/rice-4.jpg'),(5,2,'static/img/宫保鸡丁-1.jpg'),(6,2,'static/img/宫保鸡丁-2.jpg'),(7,2,'static/img/宫保鸡丁-3.jpg'),(8,2,'static/img/宫保鸡丁-4.jpg'),(9,3,'static/img/千叶豆腐-1.jpg'),(10,3,'static/img/千叶豆腐-2.jpg'),(11,3,'static/img/千叶豆腐-3.jpg'),(12,3,'static/img/千叶豆腐-4.jpg'),(13,4,'static/img/烤鱼-1.jpg'),(14,4,'static/img/烤鱼-2.jpg'),(15,4,'static/img/烤鱼-3.jpg'),(16,4,'static/img/烤鱼-4.jpg'),(17,5,'static/img/八宝粥-1.jpg'),(18,5,'static/img/八宝粥-2.jpg'),(19,5,'static/img/八宝粥-3.jpg'),(20,6,'static/img/安然盒饭-1.jpg'),(35,13,'static/menulist/1513007386338mmexport1512865197381.jpg'),(40,11,'static/menulist/1513045001053null5c45cb615341b156.jpg'),(41,11,'static/menulist/1513045011327跨域3.png'),(42,13,'static/menulist/15130478639121512964503074.jpg'),(43,13,'static/menulist/15130478685601512963882994.jpg'),(44,13,'static/menulist/15130478724981512963844318.jpg'),(45,13,'static/menulist/15130478779241512963803484.jpg'),(47,11,'static/menulist/1513235973139oo.png'),(48,14,'static/menulist/1516533195697menu7.jpg'),(49,14,'static/menulist/1516533199773menu3.jpg'),(50,15,'static/menulist/1516628112418Ecode易小林.png'),(51,15,'static/menulist/1516628115061menu3.jpg'),(52,15,'static/menulist/1516628117828menu4.jpg'),(53,15,'static/menulist/1516628120712menu6.jpg');
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
  `content` longtext,
  `menuNum` int(11) DEFAULT NULL,
  `priceAll` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlist`
--

LOCK TABLES `orderlist` WRITE;
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
INSERT INTO `orderlist` VALUES (25,23,'2017-12-09 22:06:08',2,'2017-12-10 18:12:16','2017-12-10 18:13:51','[{\"id\":3,\"menu_id\":3,\"total\":2,\"isCheck\":\"true\",\"name\":\"千叶豆腐\",\"price\":25,\"type_id\":3,\"desc\":\"千页豆腐，味道鲜美\",\"picture\":\"static/img/千页豆腐-img.jpg\"},{\"id\":85,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"}]',3,'52'),(26,23,'2017-12-09 22:06:16',2,'2017-12-10 18:12:19','2017-12-10 18:13:53','[{\"id\":86,\"menu_id\":2,\"total\":1,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"},{\"id\":87,\"menu_id\":4,\"total\":1,\"isCheck\":\"true\",\"name\":\"烤鱼\",\"price\":130,\"type_id\":4,\"desc\":\"鱼类经过烤制之后然后进行烹饪的一种方法\",\"picture\":\"static/img/烤鱼-img.jpg\"},{\"id\":88,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"},{\"id\":89,\"menu_id\":6,\"total\":1,\"isCheck\":\"true\",\"name\":\"安然盒饭\",\"price\":300,\"type_id\":6,\"desc\":\"安然自制盒饭，色香味俱全\",\"picture\":\"static/img/安然盒饭-img.jpg\"}]',4,'659'),(27,16,'2017-12-09 22:06:41',2,'2017-12-10 18:13:30','2017-12-13 17:07:07','[{\"id\":81,\"menu_id\":3,\"total\":1,\"isCheck\":\"true\",\"name\":\"千叶豆腐\",\"price\":25,\"type_id\":3,\"desc\":\"千页豆腐，味道鲜美\",\"picture\":\"static/img/千页豆腐-img.jpg\"}]',1,'25'),(28,16,'2017-12-09 22:06:50',2,'2017-12-10 18:13:32','2017-12-13 17:18:02','[{\"id\":79,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"},{\"id\":80,\"menu_id\":2,\"total\":1,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"},{\"id\":82,\"menu_id\":4,\"total\":1,\"isCheck\":\"true\",\"name\":\"烤鱼\",\"price\":130,\"type_id\":4,\"desc\":\"鱼类经过烤制之后然后进行烹饪的一种方法\",\"picture\":\"static/img/烤鱼-img.jpg\"},{\"id\":83,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"},{\"id\":84,\"menu_id\":6,\"total\":1,\"isCheck\":\"true\",\"name\":\"安然盒饭\",\"price\":300,\"type_id\":6,\"desc\":\"安然自制盒饭，色香味俱全\",\"picture\":\"static/img/安然盒饭-img.jpg\"}]',5,'661'),(29,16,'2017-12-09 23:00:14',2,'2017-12-14 10:33:07','2018-01-23 10:09:54','[{\"id\":90,\"menu_id\":3,\"total\":1,\"isCheck\":\"true\",\"name\":\"千叶豆腐\",\"price\":25,\"type_id\":3,\"desc\":\"千页豆腐，味道鲜美\",\"picture\":\"static/img/千页豆腐-img.jpg\"},{\"id\":91,\"menu_id\":4,\"total\":1,\"isCheck\":\"true\",\"name\":\"烤鱼\",\"price\":130,\"type_id\":4,\"desc\":\"鱼类经过烤制之后然后进行烹饪的一种方法\",\"picture\":\"static/img/烤鱼-img.jpg\"},{\"id\":92,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"},{\"id\":93,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"},{\"id\":94,\"menu_id\":2,\"total\":1,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"},{\"id\":95,\"menu_id\":6,\"total\":1,\"isCheck\":\"true\",\"name\":\"安然盒饭\",\"price\":300,\"type_id\":6,\"desc\":\"安然自制盒饭，色香味俱全\",\"picture\":\"static/img/安然盒饭-img.jpg\"}]',6,'686'),(30,16,'2017-12-09 23:01:51',1,'2017-12-14 10:33:05',NULL,'[{\"id\":96,\"menu_id\":3,\"total\":1,\"isCheck\":\"true\",\"name\":\"千叶豆腐\",\"price\":25,\"type_id\":3,\"desc\":\"千页豆腐，味道鲜美\",\"picture\":\"static/img/千页豆腐-img.jpg\"},{\"id\":97,\"menu_id\":4,\"total\":1,\"isCheck\":\"true\",\"name\":\"烤鱼\",\"price\":130,\"type_id\":4,\"desc\":\"鱼类经过烤制之后然后进行烹饪的一种方法\",\"picture\":\"static/img/烤鱼-img.jpg\"},{\"id\":98,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"},{\"id\":99,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"},{\"id\":100,\"menu_id\":2,\"total\":1,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"},{\"id\":101,\"menu_id\":6,\"total\":1,\"isCheck\":\"true\",\"name\":\"安然盒饭\",\"price\":300,\"type_id\":6,\"desc\":\"安然自制盒饭，色香味俱全\",\"picture\":\"static/img/安然盒饭-img.jpg\"}]',6,'686'),(31,16,'2017-12-09 23:20:07',1,'2017-12-14 10:33:04',NULL,'[{\"id\":110,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"},{\"id\":111,\"menu_id\":2,\"total\":1,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"},{\"id\":112,\"menu_id\":4,\"total\":1,\"isCheck\":\"true\",\"name\":\"烤鱼\",\"price\":130,\"type_id\":4,\"desc\":\"鱼类经过烤制之后然后进行烹饪的一种方法\",\"picture\":\"static/img/烤鱼-img.jpg\"},{\"id\":113,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"},{\"id\":114,\"menu_id\":6,\"total\":1,\"isCheck\":\"true\",\"name\":\"安然盒饭\",\"price\":300,\"type_id\":6,\"desc\":\"安然自制盒饭，色香味俱全\",\"picture\":\"static/img/安然盒饭-img.jpg\"}]',5,'661'),(32,16,'2017-12-10 16:06:01',1,'2017-12-14 10:33:02',NULL,'[{\"id\":124,\"menu_id\":2,\"total\":2,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"},{\"id\":125,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"},{\"id\":126,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"}]',4,'261'),(33,16,'2017-12-10 16:10:39',1,'2017-12-14 10:33:01',NULL,'[{\"id\":124,\"menu_id\":2,\"total\":2,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"},{\"id\":125,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"},{\"id\":126,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"}]',4,'261'),(34,16,'2017-12-10 16:13:41',1,'2017-12-14 10:33:00',NULL,'[{\"id\":127,\"menu_id\":2,\"total\":1,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"}]',1,'30'),(35,16,'2017-12-10 16:14:42',1,'2017-12-14 10:32:59',NULL,'[{\"id\":124,\"menu_id\":2,\"total\":2,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"},{\"id\":125,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"},{\"id\":126,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"}]',4,'261'),(36,16,'2017-12-10 16:14:59',2,'2017-12-14 10:32:58','2018-01-23 10:10:24','[{\"id\":127,\"menu_id\":2,\"total\":1,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"}]',1,'30'),(37,16,'2017-12-10 16:16:23',2,'2017-12-10 18:13:46','2017-12-13 17:17:50','[{\"id\":110,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"},{\"id\":111,\"menu_id\":2,\"total\":1,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"},{\"id\":112,\"menu_id\":4,\"total\":1,\"isCheck\":\"true\",\"name\":\"烤鱼\",\"price\":130,\"type_id\":4,\"desc\":\"鱼类经过烤制之后然后进行烹饪的一种方法\",\"picture\":\"static/img/烤鱼-img.jpg\"},{\"id\":113,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"},{\"id\":114,\"menu_id\":6,\"total\":1,\"isCheck\":\"true\",\"name\":\"安然盒饭\",\"price\":300,\"type_id\":6,\"desc\":\"安然自制盒饭，色香味俱全\",\"picture\":\"static/img/安然盒饭-img.jpg\"}]',5,'661'),(38,16,'2017-12-10 16:18:00',2,'2017-12-10 18:13:44','2017-12-13 17:05:42','[{\"id\":124,\"menu_id\":2,\"total\":2,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"},{\"id\":125,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"},{\"id\":126,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\",\"hasRate\":\"exit\"}]',4,'261'),(39,16,'2017-12-10 16:21:03',2,'2017-12-10 18:13:43','2017-12-10 18:15:33','[{\"id\":124,\"menu_id\":2,\"total\":2,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\",\"hasRate\":\"exit\"},{\"id\":125,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\",\"hasRate\":\"exit\"},{\"id\":126,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\",\"hasRate\":\"exit\"}]',4,'261'),(40,16,'2017-12-10 16:49:58',2,'2017-12-10 18:13:26','2017-12-10 18:13:39','[{\"id\":131,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\",\"hasRate\":\"exit\"}]',1,'2'),(41,23,'2017-12-10 16:51:07',2,'2017-12-10 18:13:21','2017-12-10 18:13:39','[{\"id\":132,\"menu_id\":2,\"total\":1,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"},{\"id\":133,\"menu_id\":3,\"total\":1,\"isCheck\":\"true\",\"name\":\"千叶豆腐\",\"price\":25,\"type_id\":3,\"desc\":\"千页豆腐，味道鲜美\",\"picture\":\"static/img/千页豆腐-img.jpg\"}]',2,'55'),(42,23,'2017-12-10 16:51:37',2,'2017-12-10 18:00:59','2017-12-10 18:13:37','[{\"id\":3,\"menu_id\":3,\"total\":2,\"isCheck\":\"true\",\"name\":\"千叶豆腐\",\"price\":25,\"type_id\":3,\"desc\":\"千页豆腐，味道鲜美\",\"picture\":\"static/img/千页豆腐-img.jpg\"},{\"id\":85,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"}]',3,'52'),(43,23,'2017-12-10 17:56:59',2,'2017-12-10 17:59:54','2017-12-10 17:59:59','[{\"id\":86,\"menu_id\":2,\"total\":1,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"desc\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\",\"hasRate\":\"exit\"},{\"id\":87,\"menu_id\":4,\"total\":1,\"isCheck\":\"true\",\"name\":\"烤鱼\",\"price\":130,\"type_id\":4,\"desc\":\"鱼类经过烤制之后然后进行烹饪的一种方法\",\"picture\":\"static/img/烤鱼-img.jpg\"},{\"id\":88,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"},{\"id\":89,\"menu_id\":6,\"total\":1,\"isCheck\":\"true\",\"name\":\"安然盒饭\",\"price\":300,\"type_id\":6,\"desc\":\"安然自制盒饭，色香味俱全\",\"picture\":\"static/img/安然盒饭-img.jpg\"}]',4,'659'),(44,17,'2017-12-10 20:34:37',2,'2017-12-10 20:35:26','2017-12-10 20:35:48','[{\"id\":136,\"menu_id\":1,\"total\":2,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"desc\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\",\"hasRate\":\"exit\"},{\"id\":137,\"menu_id\":3,\"total\":3,\"isCheck\":\"true\",\"name\":\"千叶豆腐\",\"price\":25,\"type_id\":3,\"desc\":\"千页豆腐，味道鲜美\",\"picture\":\"static/img/千页豆腐-img.jpg\",\"hasRate\":\"exit\"},{\"id\":138,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"desc\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"}]',6,'278'),(45,16,'2017-12-10 20:53:53',2,'2017-12-10 20:54:08','2017-12-10 20:54:26','[{\"id\":139,\"menu_id\":6,\"total\":3,\"isCheck\":\"true\",\"name\":\"安然盒饭\",\"price\":300,\"type_id\":6,\"desc\":\"安然自制盒饭，色香味俱全\",\"picture\":\"static/img/安然盒饭-img.jpg\",\"hasRate\":\"exit\"}]',3,'900'),(46,16,'2017-12-10 20:58:34',2,'2017-12-14 10:32:57','2018-01-21 19:20:51','[{\"id\":140,\"menu_id\":6,\"total\":1,\"isCheck\":\"true\",\"name\":\"安然盒饭\",\"price\":300,\"type_id\":6,\"desc\":\"安然自制盒饭，色香味俱全\",\"picture\":\"static/img/安然盒饭-img.jpg\"}]',1,'300'),(47,45,'2017-12-12 11:00:29',1,'2017-12-14 10:32:52',NULL,'[{\"id\":143,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"descript\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"},{\"id\":144,\"menu_id\":2,\"total\":2,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"descript\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"}]',3,'62'),(48,46,'2017-12-12 21:58:58',2,'2017-12-12 21:59:16','2017-12-12 21:59:30','[{\"id\":145,\"menu_id\":4,\"total\":1,\"isCheck\":\"true\",\"name\":\"烤鱼\",\"price\":130,\"type_id\":4,\"descript\":\"鱼类经过烤制之后然后进行烹饪的一种方法\",\"picture\":\"static/img/烤鱼-img.jpg\",\"hasRate\":\"exit\"}]',1,'130'),(49,23,'2017-12-13 18:05:27',1,'2017-12-14 10:32:51',NULL,'[{\"id\":147,\"menu_id\":1,\"total\":1,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"descript\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"}]',1,'2'),(50,47,'2017-12-13 18:13:17',1,'2017-12-14 10:32:50',NULL,'[{\"id\":149,\"menu_id\":1,\"total\":2,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"descript\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"},{\"id\":150,\"menu_id\":4,\"total\":2,\"isCheck\":\"true\",\"name\":\"烤鱼\",\"price\":130,\"type_id\":4,\"descript\":\"鱼类经过烤制之后然后进行烹饪的一种方法\",\"picture\":\"static/img/烤鱼-img.jpg\"},{\"id\":151,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"descript\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"}]',5,'463'),(51,47,'2017-12-13 18:13:27',1,'2017-12-14 10:32:48',NULL,'[{\"id\":149,\"menu_id\":1,\"total\":2,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"descript\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"},{\"id\":150,\"menu_id\":4,\"total\":2,\"isCheck\":\"true\",\"name\":\"烤鱼\",\"price\":130,\"type_id\":4,\"descript\":\"鱼类经过烤制之后然后进行烹饪的一种方法\",\"picture\":\"static/img/烤鱼-img.jpg\"},{\"id\":151,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"descript\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"}]',5,'463'),(52,47,'2017-12-13 18:18:40',1,'2017-12-14 10:32:47',NULL,'[{\"id\":152,\"menu_id\":1,\"total\":2,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"descript\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\"},{\"id\":154,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"descript\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"},{\"id\":155,\"menu_id\":13,\"total\":1,\"isCheck\":\"true\",\"name\":\"美妙的餐厅\",\"price\":60,\"type_id\":1,\"descript\":\"一起来进餐吧\",\"picture\":\"static/menucover/1513007348072mmexport1512865225974.jpg\"}]',4,'263'),(53,47,'2017-12-13 18:25:01',2,'2017-12-13 18:27:08','2017-12-14 10:33:13','[{\"id\":153,\"menu_id\":4,\"total\":2,\"isCheck\":\"true\",\"name\":\"烤鱼\",\"price\":130,\"type_id\":4,\"descript\":\"鱼类经过烤制之后然后进行烹饪的一种方法\",\"picture\":\"static/img/烤鱼-img.jpg\"},{\"id\":157,\"menu_id\":3,\"total\":2,\"isCheck\":\"true\",\"name\":\"千叶豆腐\",\"price\":25,\"type_id\":3,\"descript\":\"千页豆腐，味道鲜美\",\"picture\":\"static/img/千页豆腐-img.jpg\"},{\"id\":158,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"descript\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"}]',5,'509'),(54,47,'2017-12-13 18:25:10',2,'2017-12-13 18:27:04','2017-12-13 18:27:28','[{\"id\":153,\"menu_id\":4,\"total\":2,\"isCheck\":\"true\",\"name\":\"烤鱼\",\"price\":130,\"type_id\":4,\"descript\":\"鱼类经过烤制之后然后进行烹饪的一种方法\",\"picture\":\"static/img/烤鱼-img.jpg\",\"hasRate\":\"exit\"},{\"id\":157,\"menu_id\":3,\"total\":2,\"isCheck\":\"true\",\"name\":\"千叶豆腐\",\"price\":25,\"type_id\":3,\"descript\":\"千页豆腐，味道鲜美\",\"picture\":\"static/img/千页豆腐-img.jpg\"},{\"id\":158,\"menu_id\":5,\"total\":1,\"isCheck\":\"true\",\"name\":\"美容养颜养生八宝粥\",\"price\":199,\"type_id\":5,\"descript\":\"八宝粥内种类杂粮对人体需要的各种元素有很好的补充作用\",\"picture\":\"static/img/八宝粥自制-img.jpg\"}]',5,'509'),(55,47,'2017-12-14 10:38:21',2,'2017-12-14 10:38:31','2017-12-14 10:41:04','[{\"id\":157,\"menu_id\":13,\"total\":1,\"isCheck\":\"true\",\"name\":\"美妙的餐厅\",\"price\":60,\"type_id\":1,\"descript\":\"一起来进餐吧\",\"picture\":\"static/menucover/1513007348072mmexport1512865225974.jpg\"},{\"id\":158,\"menu_id\":14,\"total\":1,\"isCheck\":\"true\",\"name\":\"双肩包\",\"price\":100,\"type_id\":1,\"descript\":\"亲笔签名双肩包\",\"picture\":\"static/menucover/1513168978220null5c45cb615341b156.jpg\",\"hasRate\":\"exit\"}]',2,'160'),(56,16,'2018-01-21 19:19:18',2,'2018-01-21 19:19:45','2018-01-21 19:20:18','[{\"id\":141,\"menu_id\":1,\"total\":6,\"isCheck\":\"true\",\"name\":\"米饭\",\"price\":2,\"type_id\":1,\"descript\":\"优质东北大米\",\"picture\":\"static/img/rice-img.jpg\",\"hasRate\":\"exit\"},{\"id\":142,\"menu_id\":2,\"total\":4,\"isCheck\":\"true\",\"name\":\"宫保鸡丁\",\"price\":30,\"type_id\":2,\"descript\":\"北方宫保鸡丁，，绝对不甜，欢迎下次继续订购哈\",\"picture\":\"static/img/jiding-img.jpg\"}]',10,'132');
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
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordermenu`
--

LOCK TABLES `ordermenu` WRITE;
/*!40000 ALTER TABLE `ordermenu` DISABLE KEYS */;
INSERT INTO `ordermenu` VALUES (103,1,1),(104,2,1),(105,3,1),(106,3,2),(107,1,1),(108,2,1),(109,4,1),(110,6,1),(111,5,1),(112,1,2),(113,3,3),(114,5,1),(115,6,3),(116,6,1),(117,1,1),(118,2,2),(119,4,1),(120,4,1),(121,1,1),(122,1,2),(123,4,2),(124,5,1),(125,1,2),(126,4,2),(127,5,1),(128,1,2),(129,5,1),(130,13,1),(131,4,2),(132,3,2),(133,5,1),(134,4,2),(135,3,2),(136,5,1),(137,13,1),(138,14,1),(139,1,6),(140,2,4);
/*!40000 ALTER TABLE `ordermenu` ENABLE KEYS */;
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
  `content` longtext,
  `star` int(11) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `picture` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratelist`
--

LOCK TABLES `ratelist` WRITE;
/*!40000 ALTER TABLE `ratelist` DISABLE KEYS */;
INSERT INTO `ratelist` VALUES (1,1,'粒粒青白，粒粒醇香',5,'2017-12-07 12:00',16,'static/img/rice-img.jpg'),(2,1,'昔日帝王膳，今朝百姓餐',4,'2017-12-07 16:00',23,'static/img/rice-img.jpg'),(4,1,'感觉在吃糟糠，差评',2,'2017-12-01 18:00',7,'static/img/rice-img.jpg'),(5,1,'怎么这么少，太烂了',1,'2017-12-03 21:00',11,'static/img/rice-img.jpg'),(6,5,'此粥只应天上有，人间哪能喝得到',5,'2017-12-08 16:33',16,'static/img/八宝粥自制-img.jpg'),(7,1,'人间美味，难以言表',5,'2017-12-08 16:37',25,'static/img/rice-img.jpg'),(8,2,'very good',4,'2017-12-10 19:08:13',16,'static/img/jiding-img.jpg'),(9,2,'挺好的',4,'2017-12-10 19:16:01',16,'static/img/jiding-img.jpg'),(10,2,'非常意外',5,'2017-12-10 19:17:28',16,'static/img/jiding-img.jpg'),(11,2,'撒大声地',4,'2017-12-10 19:20:32',16,'static/img/jiding-img.jpg'),(12,1,'有点不好吃啊',2,'2017-12-10 19:24:54',16,'static/img/rice-img.jpg'),(13,1,'带图片的评论',4,'2017-12-10 19:41:50',16,'static/img/rice-img.jpg'),(14,2,'还不错呦',4,'2017-12-10 20:03:57',23,'static/img/jiding-img.jpg'),(15,1,'米饭太难吃了吧',1,'2017-12-10 20:36:26',17,'static/img/rice-img.jpg'),(16,3,'我是第二次评价了',5,'2017-12-10 20:36:45',17,'static/img/千页豆腐-img.jpg'),(17,5,'哈哈',2,'2017-12-10 20:45:18',16,'static/img/八宝粥自制-img.jpg'),(18,6,'昔日帝王膳，今朝百姓餐',5,'2017-12-10 20:55:57',16,'static/img/安然盒饭-img.jpg'),(19,4,'我',4,'2017-12-12 21:59:53',46,'static/img/烤鱼-img.jpg'),(20,4,'very good',5,'2017-12-13 18:27:46',47,'static/img/烤鱼-img.jpg'),(21,14,'流星雨',5,'2017-12-14 10:42:04',47,'static/menucover/1513168978220null5c45cb615341b156.jpg'),(22,5,'超好吃',5,'2018-01-14 18:30:42',16,'static/img/八宝粥自制-img.jpg'),(23,1,'谁知盘中餐，粒粒皆大米',4,'2018-01-23 10:16:21',16,'static/img/rice-img.jpg');
/*!40000 ALTER TABLE `ratelist` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` VALUES (157,16,1,6,'true'),(159,16,4,2,'false'),(160,16,2,2,'false'),(161,16,7,1,'false'),(162,16,8,2,'false'),(163,16,13,2,'false'),(207,47,1,1,'true'),(215,23,6,1,'true'),(216,23,1,6,'true');
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
  `phone` varchar(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `minesign` longtext,
  `artsign` longtext,
  `avatar` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'18063229116','root','123','商户',20,NULL,NULL,NULL),(2,'18063229112','Ecode','123','客户',20,NULL,NULL,NULL),(11,'18063229111','nini','123','商户',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-03 17:45:32
