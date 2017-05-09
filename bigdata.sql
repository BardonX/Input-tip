/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.15-log : Database - bigdata
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bigdata` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `bigdata`;

/*Table structure for table `library` */

DROP TABLE IF EXISTS `library`;

CREATE TABLE `library` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(10) COLLATE utf8_bin NOT NULL,
  `spell` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `library` */

insert  into `library`(`id`,`text`,`spell`) values (1,'你','ni'),(2,'你好','nihao'),(3,'你是','nishi'),(4,'春','chun'),(5,'春天','chuntian'),(6,'春季','chunji'),(7,'春暖花开','chunnuanhuakai'),(8,'衣服','yifu'),(9,'秋衣','qiuyi'),(10,'ajax','ajax'),(11,'blue','blue'),(12,'衣服女','yifunv'),(13,'衣服男','yifunan'),(14,'衣服男夏','yifunanxia'),(15,'java','java'),(16,'javase','javase'),(17,'javaee','javaee'),(18,'view','view');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
