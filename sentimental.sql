/*
SQLyog Community v11.31 Beta1 (32 bit)
MySQL - 5.1.30-community : Database - sentimental
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sentimental` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `sentimental`;

/*Table structure for table `comments` */

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(25) DEFAULT NULL,
  `uname` varchar(35) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  `rating` bigint(11) DEFAULT NULL,
  KEY `id` (`id`),
  KEY `pid` (`pid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

/*Data for the table `comments` */

insert  into `comments`(`id`,`pid`,`uname`,`uid`,`comments`,`rating`) values (13,'1393320848424','Supriya',2,'This mobile screen resolution is very nice . Nice ear phones.',NULL),(15,'1393320698063','Supriya',2,'This is not good product.',NULL),(16,'1393320698063','Supriya',2,'This product is great',NULL),(17,'1393320698063','Supriya',2,'Great',NULL),(18,'1393320848424','Supriya',2,'this mobile is bad .',NULL),(19,'1393320848424','Supriya',2,'this mobile is good . but having bad apps .',NULL),(20,'1393320698063','Supriya',2,'this product is very bad .',NULL),(23,'1393320698063','Supriya',2,'this mobile is awesome . this mobile is bad .',NULL),(24,'1393347800454','Praveenkumar',5,'this product is very nice .',NULL),(25,'1393347800454','Praveenkumar',5,'this is not good .',NULL),(26,'1393320698063','rajesh reddy',6,'good',NULL),(27,'1393320698063','rajesh reddy',6,'good',NULL),(28,'1393320698063','aaaaaa',7,'aaa',NULL),(29,'1393320698063','aaaaaa',7,'good',NULL),(30,'1393320698063','aaaaaa',7,'good',NULL),(31,'1393320698063','aaaaaa',7,'good',NULL),(32,'1393320698063','aaaaaa',7,'bad',NULL),(33,'1393320698063','aaaaaa',7,'bad',NULL),(34,'1393320910408','Praveenkumar',5,'this product is not good',NULL),(35,'1393320910408','Praveenkumar',5,'this product is not bad',NULL),(36,'1393320910408','Praveenkumar',5,'',NULL),(37,'1393320910408','Praveenkumar',5,'this product is not bad',NULL),(38,'1393320910408','Praveenkumar',5,'this is not good',NULL),(39,'1393320910408','Praveenkumar',5,'this is not bad',NULL),(40,'1393320910408','Praveenkumar',5,'is not bad',NULL),(41,'1393320910408','Praveenkumar',5,'not good',NULL),(42,'1393347532198','Praveenkumar',5,'this mobile is nice',NULL),(43,'1393347532198','Praveenkumar',5,'this mobile is bad',NULL),(44,'1393320910408','Supriya',2,'this product is so nice',NULL),(45,'1393347532198','Praveenkumar',5,'Awesome mobile',NULL),(46,'1393347532198','Praveenkumar',5,'Awesome mobile but bad features',NULL),(47,'1393347532198','Praveenkumar',5,'this is good',NULL),(48,'1393347532198','Praveenkumar',5,'this is not good\r\n',NULL),(49,'1393347532198','Praveenkumar',5,'i like this mobile but some of the features are bad',NULL),(50,'1393320848424','Supriya',2,'this mobile is not good',NULL),(51,'1393320848424','Supriya',2,'this mobile features are good but look is bad',NULL),(52,'1393320848424','Supriya',2,'this mobile is very good',NULL),(53,'1393320848424','Supriya',2,'this mobile is looks good but features are bad',NULL),(54,'1393320848424','Supriya',2,'this mobile is not good',NULL),(55,'1393320910408','Admin',1,';lkhgfcx',NULL);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `pid` varchar(25) NOT NULL,
  `pname` varchar(40) DEFAULT NULL,
  `acost` double(7,2) DEFAULT NULL,
  `dcost` double(7,2) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `image` tinyblob,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `product` */

insert  into `product`(`pid`,`pname`,`acost`,`dcost`,`description`,`image`) values ('1393320698063',' APPLE IPHONE 4',28000.00,25000.00,'The featured Music Player supports MP3, WAV and WMA formats. Various games can be downloaded and played along with games that are already there in the handset. Power Management The iPhone 4 has a standard Li-Po 1420mAh battery that gives a talk time up to 14 hours and standby time of about 300 hours on 2G networks.','C:\\Users\\Praveen\\Documents\\NetBeansProjects\\SentimentalAnalasys\\web\\images/apple-iphone-4-400x400-imadknfx36wrgvug_1_.jpeg'),('1393320848424','Samsung Galaxy Tab 3 ',27030.00,22500.00,'You will experience no lag with the powerful 1.5GHz Dual Core Processor and generous 1.5GB RAM. Multi-task without hesitation! To maximize powerful experience, the brilliant display offers WXGA resolution for eye-popping color and crystal clear clarity. Also Samsung Sound AliveTM and Dolby Sound Effect produce superior sound so dialogue is clear.','C:\\Users\\Praveen\\Documents\\NetBeansProjects\\SentimentalAnalasys\\web\\images/samsung.jpg'),('1393320910408','NOKIA LUMIA 520',11020.00,8900.00,'Connectivity and Features The Nokia Lumia 520 brings the world of internet right to your fingertips with connectivity options like GPRS, EDGE, 3G and Wi-Fi which can also be used as a hotspot for tethering. The phone comes with a microUSB connector and allows you to transfer media and data from and to compatible devices via bluetooth as well. Allow the phone to draw you into a more convenient and entertaining world with apps like Facebook, Twitter and even Assisted GPS, GLONASS.','C:\\Users\\Praveen\\Documents\\NetBeansProjects\\SentimentalAnalasys\\web\\images/nokia-lumia.jpeg'),('1393347532198','Nokia Lumia 925 ',31499.00,28000.00,'The Nokia Lumia 925 (Grey) is a Windows 8 phone that comes with a lighter and thinner body, an improved camera, and an aluminium frame that replaces plastic on the sides when compared to the Lumia 920. The Qualcomm dual core 1.5 GHz processor combined with 1 GB of RAM offer high speed multitasking and allow the apps to function better. Microsoft Office, Nokia HERE Maps, HERE Drive,.','C:\\Users\\Praveen\\Documents\\NetBeansProjects\\SentimentalAnalasys\\web\\images/nokia-lumia-925-grey-.jpg');

/*Table structure for table `rolls` */

DROP TABLE IF EXISTS `rolls`;

CREATE TABLE `rolls` (
  `rollid` int(2) NOT NULL,
  `rollname` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`rollid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rolls` */

insert  into `rolls`(`rollid`,`rollname`) values (1,'admin'),(2,'user');

/*Table structure for table `user_details` */

DROP TABLE IF EXISTS `user_details`;

CREATE TABLE `user_details` (
  `uid` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `rollid` int(2) NOT NULL,
  `mail` varchar(40) NOT NULL,
  `password` varchar(15) DEFAULT NULL,
  `mobile` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`uid`,`mail`),
  KEY `rollid` (`rollid`),
  CONSTRAINT `user_details_ibfk_1` FOREIGN KEY (`rollid`) REFERENCES `rolls` (`rollid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `user_details` */

insert  into `user_details`(`uid`,`name`,`rollid`,`mail`,`password`,`mobile`) values (1,'Admin',1,'admin','admin','9959583869'),(2,'Supriya',2,'supriya@gmail.com','123456','8888999911'),(3,'Ram',2,'ram@gmail.com','12345','9991112223'),(5,'Praveenkumar',2,'praveen@gmail.com','12345','9959585869'),(6,'rajesh reddy',2,'10b61a0514@gmail.com','12345','9988776655'),(7,'aaaaaa',2,'aaa','aaa','9959585869');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
