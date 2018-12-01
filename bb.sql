/*
SQLyog Ultimate v12.3.1 (64 bit)
MySQL - 5.5.20 : Database - djangoshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`djangoshop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `djangoshop`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_log'),
(2,'Can change log entry',1,'change_log'),
(3,'Can delete log entry',1,'delete_log'),
(4,'Can add Bookmark',2,'add_bookmark'),
(5,'Can change Bookmark',2,'change_bookmark'),
(6,'Can delete Bookmark',2,'delete_bookmark'),
(7,'Can add User Setting',3,'add_usersettings'),
(8,'Can change User Setting',3,'change_usersettings'),
(9,'Can delete User Setting',3,'delete_usersettings'),
(10,'Can add User Widget',4,'add_userwidget'),
(11,'Can change User Widget',4,'change_userwidget'),
(12,'Can delete User Widget',4,'delete_userwidget'),
(13,'Can view Bookmark',2,'view_bookmark'),
(14,'Can view log entry',1,'view_log'),
(15,'Can view User Setting',3,'view_usersettings'),
(16,'Can view User Widget',4,'view_userwidget'),
(17,'Can add log entry',5,'add_logentry'),
(18,'Can change log entry',5,'change_logentry'),
(19,'Can delete log entry',5,'delete_logentry'),
(20,'Can view log entry',5,'view_logentry'),
(21,'Can add permission',6,'add_permission'),
(22,'Can change permission',6,'change_permission'),
(23,'Can delete permission',6,'delete_permission'),
(24,'Can add group',7,'add_group'),
(25,'Can change group',7,'change_group'),
(26,'Can delete group',7,'delete_group'),
(27,'Can view group',7,'view_group'),
(28,'Can view permission',6,'view_permission'),
(29,'Can add content type',8,'add_contenttype'),
(30,'Can change content type',8,'change_contenttype'),
(31,'Can delete content type',8,'delete_contenttype'),
(32,'Can view content type',8,'view_contenttype'),
(33,'Can add session',9,'add_session'),
(34,'Can change session',9,'change_session'),
(35,'Can delete session',9,'delete_session'),
(36,'Can view session',9,'view_session'),
(37,'Can add 商品信息',10,'add_goods'),
(38,'Can change 商品信息',10,'change_goods'),
(39,'Can delete 商品信息',10,'delete_goods'),
(40,'Can add 首页轮播图',11,'add_indexbanner'),
(41,'Can change 首页轮播图',11,'change_indexbanner'),
(42,'Can delete 首页轮播图',11,'delete_indexbanner'),
(43,'Can add 商品轮播图',12,'add_goodsimage'),
(44,'Can change 商品轮播图',12,'change_goodsimage'),
(45,'Can delete 商品轮播图',12,'delete_goodsimage'),
(46,'Can add 商品类别',13,'add_goodscategory'),
(47,'Can change 商品类别',13,'change_goodscategory'),
(48,'Can delete 商品类别',13,'delete_goodscategory'),
(49,'Can view 商品信息',10,'view_goods'),
(50,'Can view 商品类别',13,'view_goodscategory'),
(51,'Can view 商品轮播图',12,'view_goodsimage'),
(52,'Can view 首页轮播图',11,'view_indexbanner'),
(53,'Can add 订单商品',14,'add_ordergoods'),
(54,'Can change 订单商品',14,'change_ordergoods'),
(55,'Can delete 订单商品',14,'delete_ordergoods'),
(56,'Can add 签收地址',15,'add_addressmodel'),
(57,'Can change 签收地址',15,'change_addressmodel'),
(58,'Can delete 签收地址',15,'delete_addressmodel'),
(59,'Can add 订单信息',16,'add_orderinfo'),
(60,'Can change 订单信息',16,'change_orderinfo'),
(61,'Can delete 订单信息',16,'delete_orderinfo'),
(62,'Can view 签收地址',15,'view_addressmodel'),
(63,'Can view 订单商品',14,'view_ordergoods'),
(64,'Can view 订单信息',16,'view_orderinfo'),
(65,'Can add 用户信息',17,'add_user'),
(66,'Can change 用户信息',17,'change_user'),
(67,'Can delete 用户信息',17,'delete_user'),
(68,'Can view 用户信息',17,'view_user'),
(69,'Can add 用户信息',18,'add_userfav'),
(70,'Can change 用户信息',18,'change_userfav'),
(71,'Can delete 用户信息',18,'delete_userfav'),
(72,'Can add 购物车',19,'add_addcarmodel'),
(73,'Can change 购物车',19,'change_addcarmodel'),
(74,'Can delete 购物车',19,'delete_addcarmodel'),
(75,'Can view 购物车',19,'view_addcarmodel'),
(76,'Can view 用户信息',18,'view_userfav'),
(77,'Can add Token',20,'add_token'),
(78,'Can change Token',20,'change_token'),
(79,'Can delete Token',20,'delete_token'),
(80,'Can view Token',20,'view_token'),
(81,'Can add user social auth',21,'add_usersocialauth'),
(82,'Can change user social auth',21,'change_usersocialauth'),
(83,'Can delete user social auth',21,'delete_usersocialauth'),
(84,'Can add nonce',22,'add_nonce'),
(85,'Can change nonce',22,'change_nonce'),
(86,'Can delete nonce',22,'delete_nonce'),
(87,'Can add partial',23,'add_partial'),
(88,'Can change partial',23,'change_partial'),
(89,'Can delete partial',23,'delete_partial'),
(90,'Can add association',24,'add_association'),
(91,'Can change association',24,'change_association'),
(92,'Can delete association',24,'delete_association'),
(93,'Can add code',25,'add_code'),
(94,'Can change code',25,'change_code'),
(95,'Can delete code',25,'delete_code');

/*Table structure for table `authtoken_token` */

DROP TABLE IF EXISTS `authtoken_token`;

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `authtoken_token` */

insert  into `authtoken_token`(`key`,`created`,`user_id`) values 
('4f5d393e6f0bfefafc1e4cd9e8c70ca72611dc44','2018-11-08 20:37:19',1);

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(5,'admin','logentry'),
(7,'auth','group'),
(6,'auth','permission'),
(20,'authtoken','token'),
(8,'contenttypes','contenttype'),
(10,'goods','goods'),
(13,'goods','goodscategory'),
(12,'goods','goodsimage'),
(11,'goods','indexbanner'),
(9,'sessions','session'),
(24,'social_django','association'),
(25,'social_django','code'),
(22,'social_django','nonce'),
(23,'social_django','partial'),
(21,'social_django','usersocialauth'),
(15,'trade','addressmodel'),
(14,'trade','ordergoods'),
(16,'trade','orderinfo'),
(17,'user','user'),
(19,'user_operation','addcarmodel'),
(18,'user_operation','userfav'),
(2,'xadmin','bookmark'),
(1,'xadmin','log'),
(3,'xadmin','usersettings'),
(4,'xadmin','userwidget');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2018-11-08 20:35:01'),
(2,'contenttypes','0002_remove_content_type_name','2018-11-08 20:35:01'),
(3,'auth','0001_initial','2018-11-08 20:35:01'),
(4,'auth','0002_alter_permission_name_max_length','2018-11-08 20:35:01'),
(5,'auth','0003_alter_user_email_max_length','2018-11-08 20:35:01'),
(6,'auth','0004_alter_user_username_opts','2018-11-08 20:35:01'),
(7,'auth','0005_alter_user_last_login_null','2018-11-08 20:35:01'),
(8,'auth','0006_require_contenttypes_0002','2018-11-08 20:35:01'),
(9,'auth','0007_alter_validators_add_error_messages','2018-11-08 20:35:01'),
(10,'auth','0008_alter_user_username_max_length','2018-11-08 20:35:01'),
(11,'auth','0009_alter_user_last_name_max_length','2018-11-08 20:35:01'),
(12,'user','0001_initial','2018-11-08 20:35:01'),
(13,'admin','0001_initial','2018-11-08 20:35:01'),
(14,'admin','0002_logentry_remove_auto_add','2018-11-08 20:35:01'),
(15,'authtoken','0001_initial','2018-11-08 20:35:01'),
(16,'authtoken','0002_auto_20160226_1747','2018-11-08 20:35:01'),
(17,'goods','0001_initial','2018-11-08 20:35:01'),
(18,'sessions','0001_initial','2018-11-08 20:35:01'),
(19,'default','0001_initial','2018-11-08 20:35:02'),
(20,'social_auth','0001_initial','2018-11-08 20:35:02'),
(21,'default','0002_add_related_name','2018-11-08 20:35:02'),
(22,'social_auth','0002_add_related_name','2018-11-08 20:35:02'),
(23,'default','0003_alter_email_max_length','2018-11-08 20:35:02'),
(24,'social_auth','0003_alter_email_max_length','2018-11-08 20:35:02'),
(25,'default','0004_auto_20160423_0400','2018-11-08 20:35:02'),
(26,'social_auth','0004_auto_20160423_0400','2018-11-08 20:35:02'),
(27,'social_auth','0005_auto_20160727_2333','2018-11-08 20:35:02'),
(28,'social_django','0006_partial','2018-11-08 20:35:02'),
(29,'social_django','0007_code_timestamp','2018-11-08 20:35:02'),
(30,'social_django','0008_partial_timestamp','2018-11-08 20:35:02'),
(31,'trade','0001_initial','2018-11-08 20:35:02'),
(32,'user_operation','0001_initial','2018-11-08 20:35:02'),
(33,'xadmin','0001_initial','2018-11-08 20:35:02'),
(34,'xadmin','0002_log','2018-11-08 20:35:02'),
(35,'xadmin','0003_auto_20160715_0100','2018-11-08 20:35:02'),
(36,'social_django','0001_initial','2018-11-08 20:35:02'),
(37,'social_django','0003_alter_email_max_length','2018-11-08 20:35:02'),
(38,'social_django','0004_auto_20160423_0400','2018-11-08 20:35:02'),
(39,'social_django','0002_add_related_name','2018-11-08 20:35:02'),
(40,'social_django','0005_auto_20160727_2333','2018-11-08 20:35:02');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('dm79qagno46npet8bmcwee82ouvvcnwk','MjhlMzBhZWE0YTAwMDAzMjVkZjAzY2ZmNTFmZTJmZjcyNjc0ZjI4Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1sidXNlciIsInVzZXIiXSwiIl0sIl9hdXRoX3VzZXJfaGFzaCI6IjNmYWY4NDVlOTUyNGViYWM0ZGIzYzFiNDc4NWM2ZjEzNmI4ZDgwMTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2VyLnZpZXdzLkN1c3RvbUJhY2tlbmQifQ==','2018-11-22 21:48:09'),
('p37s8dgw8d7yf8m27vuf94gizoviwxas','ZTA5NDIwMzBkMTIzNjY3ZWQ2ZjQ4YzY1NzgzYWJmMTg3YTgzZTA5MDp7IndlaWJvX3N0YXRlIjoiNFFlTWY1QkVwQ1gxZ0hGRE9ldnFoMXFqMExSaVhvaW4ifQ==','2018-11-22 20:38:05');

/*Table structure for table `goods_goods` */

DROP TABLE IF EXISTS `goods_goods`;

CREATE TABLE `goods_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_sn` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `click_num` int(11) NOT NULL,
  `sold_num` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `goods_num` int(11) NOT NULL,
  `market_price` double NOT NULL,
  `shop_price` double NOT NULL,
  `goods_brief` longtext NOT NULL,
  `goods_desc` longtext NOT NULL,
  `ship_free` tinyint(1) NOT NULL,
  `goods_front_image` varchar(100) DEFAULT NULL,
  `is_new` tinyint(1) NOT NULL,
  `is_hot` tinyint(1) NOT NULL,
  `add_time` datetime NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goods_category_id_da3507dd_fk_goods_goodscategory_id` (`category_id`),
  CONSTRAINT `goods_goods_category_id_da3507dd_fk_goods_goodscategory_id` FOREIGN KEY (`category_id`) REFERENCES `goods_goodscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

/*Data for the table `goods_goods` */

insert  into `goods_goods`(`id`,`goods_sn`,`name`,`click_num`,`sold_num`,`fav_num`,`goods_num`,`market_price`,`shop_price`,`goods_brief`,`goods_desc`,`ship_free`,`goods_front_image`,`is_new`,`is_hot`,`add_time`,`category_id`) values 
(1,'','新鲜水果甜蜜香脆单果约800克',0,0,0,0,232,156,'食用百香果可以增加胃部饱腹感，减少余热量的摄入，还可以吸附胆固醇和胆汁之类有机分子，抑制人体对脂肪的吸收。因此，长期食用有利于改善人体营养吸收结构，降低体内脂肪，塑造健康优美体态。','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/1_P_1449024889889.jpg',0,0,'2018-11-08 20:36:01',20),
(2,'','田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛',0,0,0,0,106,88,'前腿+后腿+羊排共8斤，原生态大山放牧羊羔，曾经的皇室贡品，央视推荐，2005年北京招待全球财金首脑。五层专用包装箱+真空包装+冰袋+保鲜箱+顺丰冷链发货，路途保质期8天','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/2_P_1448945810202.jpg',0,0,'2018-11-08 20:36:01',7),
(3,'','酣畅家庭菲力牛排10片澳洲生鲜牛肉团购套餐',0,0,0,0,286,238,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/7_P_1448945104883.jpg',0,0,'2018-11-08 20:36:01',15),
(4,'','日本蒜蓉粉丝扇贝270克6只装',0,0,0,0,156,108,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/47_P_1448946213263.jpg',0,0,'2018-11-08 20:36:01',20),
(5,'','内蒙新鲜牛肉1斤清真生鲜牛肉火锅食材',0,0,0,0,106,88,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/10_P_1448944572085.jpg',0,0,'2018-11-08 20:36:01',7),
(6,'','乌拉圭进口牛肉卷特级肥牛卷',0,0,0,0,90,75,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/4_P_1448945381985.jpg',0,0,'2018-11-08 20:36:01',21),
(7,'','五星眼肉牛排套餐8片装原味原切生鲜牛肉',0,0,0,0,150,125,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/8_P_1448945032810.jpg',0,0,'2018-11-08 20:36:01',23),
(8,'','澳洲进口120天谷饲牛仔骨4份原味生鲜',0,0,0,0,31,26,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/11_P_1448944388277.jpg',0,0,'2018-11-08 20:36:01',7),
(9,'','潮香村澳洲进口牛排家庭团购套餐20片',0,0,0,0,239,199,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/6_P_1448945167279.jpg',0,0,'2018-11-08 20:36:01',22),
(10,'','爱食派内蒙古呼伦贝尔冷冻生鲜牛腱子肉1000g',0,0,0,0,202,168,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/9_P_1448944791617.jpg',0,0,'2018-11-08 20:36:01',20),
(11,'','澳洲进口牛尾巴300g新鲜肥牛肉',0,0,0,0,306,255,'新鲜羊羔肉整只共15斤，原生态大山放牧羊羔，曾经的皇室贡品，央视推荐，2005年北京招待全球财金首脑。五层专用包装箱+真空包装+冰袋+保鲜箱+顺丰冷链发货，路途保质期8天','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/3_P_1448945490837.jpg',0,0,'2018-11-08 20:36:01',2),
(12,'','新疆巴尔鲁克生鲜牛排眼肉牛扒1200g',0,0,0,0,126,88,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/48_P_1448943988970.jpg',0,0,'2018-11-08 20:36:01',7),
(13,'','澳洲进口安格斯牛切片上脑牛排1000g',0,0,0,0,144,120,'澳大利亚是国际公认的没有疯牛病和口蹄疫的国家。为了保持澳大利亚产品的高标准，澳大利亚牛肉业和各级政府共同努力简历了严格的标准和体系，以保证生产的整体化和产品的可追溯性','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/5_P_1448945270390.jpg',0,0,'2018-11-08 20:36:01',12),
(14,'','帐篷出租',0,0,0,0,120,100,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'images/201705/goods_img/53_P_1495068879687.jpg',0,0,'2018-11-08 20:36:01',21),
(15,'','52度茅台集团国隆双喜酒500mlx6',0,0,0,0,23,19,'贵州茅台酒厂（集团）保健酒业有限公司生产，是以“龙”字打头的酒水。中国龙文化上下8000年，源远而流长，龙的形象是一种符号、一种意绪、一种血肉相联的情感。','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/16_P_1448947194687.jpg',0,0,'2018-11-08 20:36:01',37),
(16,'','52度水井坊臻酿八號500ml',0,0,0,0,43,36,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/14_P_1448947354031.jpg',0,0,'2018-11-08 20:36:01',36),
(17,'','53度茅台仁酒500ml',0,0,0,0,190,158,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/12_P_1448947547989.jpg',0,0,'2018-11-08 20:36:01',32),
(18,'','双响炮洋酒JimBeamwhiskey美国白占边',0,0,0,0,38,28,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/46_P_1448946598711.jpg',0,0,'2018-11-08 20:36:01',29),
(19,'','西夫拉姆进口洋酒小酒版',0,0,0,0,55,46,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/21_P_1448946793276.jpg',0,0,'2018-11-08 20:36:01',36),
(20,'','茅台53度飞天茅台500ml',0,0,0,0,22,18,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/15_P_1448947257324.jpg',0,0,'2018-11-08 20:36:01',30),
(21,'','52度兰陵·紫气东来1600mL山东名酒',0,0,0,0,42,35,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/13_P_1448947460386.jpg',0,0,'2018-11-08 20:36:01',29),
(22,'','JohnnieWalker尊尼获加黑牌威士忌',0,0,0,0,24,20,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/50_P_1448946543091.jpg',0,0,'2018-11-08 20:36:01',36),
(23,'','人头马CLUB特优香槟干邑350ml',0,0,0,0,31,26,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/51_P_1448946466595.jpg',0,0,'2018-11-08 20:36:01',30),
(24,'','张裕干红葡萄酒750ml*6支',0,0,0,0,54,45,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/17_P_1448947102246.jpg',0,0,'2018-11-08 20:36:01',31),
(25,'','原瓶原装进口洋酒烈酒法国云鹿XO白兰地',0,0,0,0,46,38,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/20_P_1448946850602.jpg',0,0,'2018-11-08 20:36:01',29),
(26,'','法国原装进口圣贝克干红葡萄酒750ml',0,0,0,0,82,68,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/19_P_1448946951581.jpg',0,0,'2018-11-08 20:36:01',25),
(27,'','法国百利威干红葡萄酒AOP级6支装',0,0,0,0,67,56,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/18_P_1448947011435.jpg',0,0,'2018-11-08 20:36:01',25),
(28,'','芝华士12年苏格兰威士忌700ml',0,0,0,0,71,59,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/22_P_1448946729629.jpg',0,0,'2018-11-08 20:36:01',30),
(29,'','深蓝伏特加巴维兰利口酒送预调酒',0,0,0,0,31,18,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/45_P_1448946661303.jpg',0,0,'2018-11-08 20:36:01',36),
(30,'','赣南脐橙特级果10斤装',0,0,0,0,43,36,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/32_P_1448948525620.jpg',0,0,'2018-11-08 20:36:01',62),
(31,'','泰国菠萝蜜16-18斤1个装',0,0,0,0,11,9,'【懒人吃法】菠萝蜜果肉，冰袋保鲜，收货就吃，冰爽Q脆甜，2斤装，全国顺丰空运包邮，发出后48小时内可达，一线城市基本隔天可达','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/30_P_1448948663450.jpg',0,0,'2018-11-08 20:36:01',66),
(32,'','四川双流草莓新鲜水果礼盒2盒',0,0,0,0,22,18,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/31_P_1448948598947.jpg',0,0,'2018-11-08 20:36:01',70),
(33,'','新鲜头茬非洲冰草冰菜',0,0,0,0,67,56,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/35_P_1448948333610.jpg',0,0,'2018-11-08 20:36:01',58),
(34,'','仿真蔬菜水果果蔬菜模型',0,0,0,0,6,5,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/36_P_1448948234405.jpg',0,0,'2018-11-08 20:36:01',58),
(35,'','现摘芭乐番石榴台湾珍珠芭乐',0,0,0,0,28,23,'海南产精品释迦果,\n        释迦是水果中的贵族,\n        产量少,\n        味道很甜,\n        奶香十足,\n        非常可口,\n        果裹果园顺丰空运,\n        保证新鲜.果子个大,\n        一斤1-2个左右,\n        大个头的果子更尽兴!\n        ','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/33_P_1448948479966.jpg',0,0,'2018-11-08 20:36:01',62),
(36,'','潍坊萝卜5斤/箱礼盒',0,0,0,0,46,38,'脐橙规格是65-90MM左右（标准果果径平均70MM左右，精品果果径平均80MM左右），一斤大概有2-4个左右，脐橙产自江西省赣州市信丰县安西镇，全过程都是采用农家有机肥种植，生态天然','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/34_P_1448948399009.jpg',0,0,'2018-11-08 20:36:01',70),
(37,'','休闲零食膨化食品焦糖/奶油/椒麻味',0,0,0,0,154,99,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/43_P_1448948762645.jpg',0,0,'2018-11-08 20:36:01',74),
(38,'','蒙牛未来星儿童成长牛奶骨力型190ml*15盒',0,0,0,0,84,70,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/38_P_1448949220255.jpg',0,0,'2018-11-08 20:36:01',105),
(39,'','蒙牛特仑苏有机奶250ml×12盒',0,0,0,0,70,32,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/44_P_1448948850187.jpg',0,0,'2018-11-08 20:36:01',103),
(40,'','1元支付测试商品',0,0,0,0,1,1,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'images/201511/goods_img/49_P_1448162819889.jpg',0,0,'2018-11-08 20:36:01',102),
(41,'','德运全脂新鲜纯牛奶1L*10盒装整箱',0,0,0,0,70,58,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/40_P_1448949038702.jpg',0,0,'2018-11-08 20:36:01',103),
(42,'','木糖醇红枣早餐奶即食豆奶粉538g',0,0,0,0,38,32,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/39_P_1448949115481.jpg',0,0,'2018-11-08 20:36:01',106),
(43,'','高钙液体奶200ml*24盒',0,0,0,0,26,22,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/41_P_1448948980358.jpg',0,0,'2018-11-08 20:36:01',107),
(44,'','新西兰进口全脂奶粉900g',0,0,0,0,720,600,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/37_P_1448949284365.jpg',0,0,'2018-11-08 20:36:01',104),
(45,'','伊利官方直营全脂营养舒化奶250ml*12盒*2提',0,0,0,0,43,36,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/42_P_1448948895193.jpg',0,0,'2018-11-08 20:36:01',103),
(46,'','维纳斯橄榄菜籽油5L/桶',0,0,0,0,187,156,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/27_P_1448947771805.jpg',0,0,'2018-11-08 20:36:01',51),
(47,'','糙米450gx3包粮油米面',0,0,0,0,18,15,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/23_P_1448948070348.jpg',0,0,'2018-11-08 20:36:01',41),
(48,'','精炼一级大豆油5L色拉油粮油食用油',0,0,0,0,54,45,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/26_P_1448947825754.jpg',0,0,'2018-11-08 20:36:01',56),
(49,'','橄榄玉米油5L*2桶',0,0,0,0,31,26,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/28_P_1448947699948.jpg',0,0,'2018-11-08 20:36:01',54),
(50,'','山西黑米农家黑米4斤',0,0,0,0,11,9,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/24_P_1448948023823.jpg',0,0,'2018-11-08 20:36:01',55),
(51,'','稻园牌稻米油粮油米糠油绿色植物油',0,0,0,0,14,12,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/25_P_1448947875346.jpg',0,0,'2018-11-08 20:36:01',47),
(52,'','融氏纯玉米胚芽油5l桶',0,0,0,0,14,12,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/29_P_1448947631994.jpg',0,0,'2018-11-08 20:36:01',41);

/*Table structure for table `goods_goodscategory` */

DROP TABLE IF EXISTS `goods_goodscategory`;

CREATE TABLE `goods_goodscategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `code` varchar(30) NOT NULL,
  `desc` longtext NOT NULL,
  `category_type` int(11) NOT NULL,
  `is_tab` tinyint(1) NOT NULL,
  `add_time` datetime NOT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodscategory_parent_category_id_ccec2509_fk_goods_goo` (`parent_category_id`),
  CONSTRAINT `goods_goodscategory_parent_category_id_ccec2509_fk_goods_goo` FOREIGN KEY (`parent_category_id`) REFERENCES `goods_goodscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

/*Data for the table `goods_goodscategory` */

insert  into `goods_goodscategory`(`id`,`name`,`code`,`desc`,`category_type`,`is_tab`,`add_time`,`parent_category_id`) values 
(1,'生鲜食品','sxsp','',1,0,'2018-11-08 20:35:54',NULL),
(2,'精品肉类','jprl','',2,0,'2018-11-08 20:35:54',1),
(3,'羊肉','yr','',3,0,'2018-11-08 20:35:54',2),
(4,'禽类','ql','',3,0,'2018-11-08 20:35:54',2),
(5,'猪肉','zr','',3,0,'2018-11-08 20:35:54',2),
(6,'牛肉','nr','',3,0,'2018-11-08 20:35:54',2),
(7,'海鲜水产','hxsc','',2,0,'2018-11-08 20:35:54',1),
(8,'参鲍','cb','',3,0,'2018-11-08 20:35:54',7),
(9,'鱼','yu','',3,0,'2018-11-08 20:35:54',7),
(10,'虾','xia','',3,0,'2018-11-08 20:35:54',7),
(11,'蟹/贝','xb','',3,0,'2018-11-08 20:35:54',7),
(12,'蛋制品','dzp','',2,0,'2018-11-08 20:35:54',1),
(13,'松花蛋/咸鸭蛋','xhd_xyd','',3,0,'2018-11-08 20:35:54',12),
(14,'鸡蛋','jd','',3,0,'2018-11-08 20:35:54',12),
(15,'叶菜类','ycl','',2,0,'2018-11-08 20:35:54',1),
(16,'生菜','sc','',3,0,'2018-11-08 20:35:54',15),
(17,'菠菜','bc','',3,0,'2018-11-08 20:35:54',15),
(18,'圆椒','yj','',3,0,'2018-11-08 20:35:54',15),
(19,'西兰花','xlh','',3,0,'2018-11-08 20:35:54',15),
(20,'根茎类','gjl','',2,0,'2018-11-08 20:35:54',1),
(21,'茄果类','qgl','',2,0,'2018-11-08 20:35:54',1),
(22,'菌菇类','jgl','',2,0,'2018-11-08 20:35:54',1),
(23,'进口生鲜','jksx','',2,0,'2018-11-08 20:35:54',1),
(24,'酒水饮料','jsyl','',1,0,'2018-11-08 20:35:54',NULL),
(25,'白酒','bk','',2,0,'2018-11-08 20:35:54',24),
(26,'五粮液','wly','',3,0,'2018-11-08 20:35:54',25),
(27,'泸州老窖','lzlj','',3,0,'2018-11-08 20:35:54',25),
(28,'茅台','mt','',3,0,'2018-11-08 20:35:54',25),
(29,'葡萄酒','ptj','',2,0,'2018-11-08 20:35:54',24),
(30,'洋酒','yj','',2,0,'2018-11-08 20:35:54',24),
(31,'啤酒','pj','',2,0,'2018-11-08 20:35:54',24),
(32,'其他酒品','qtjp','',2,0,'2018-11-08 20:35:54',24),
(33,'其他品牌','qtpp','',3,0,'2018-11-08 20:35:54',32),
(34,'黄酒','hj','',3,0,'2018-11-08 20:35:54',32),
(35,'养生酒','ysj','',3,0,'2018-11-08 20:35:54',32),
(36,'饮料/水','yls','',2,0,'2018-11-08 20:35:54',24),
(37,'红酒','hj','',2,0,'2018-11-08 20:35:54',24),
(38,'白兰地','bld','',3,0,'2018-11-08 20:35:54',37),
(39,'威士忌','wsj','',3,0,'2018-11-08 20:35:54',37),
(40,'粮油副食','粮油副食','',1,0,'2018-11-08 20:35:54',NULL),
(41,'食用油','食用油','',2,0,'2018-11-08 20:35:54',40),
(42,'其他食用油','其他食用油','',3,0,'2018-11-08 20:35:54',41),
(43,'菜仔油','菜仔油','',3,0,'2018-11-08 20:35:54',41),
(44,'花生油','花生油','',3,0,'2018-11-08 20:35:54',41),
(45,'橄榄油','橄榄油','',3,0,'2018-11-08 20:35:54',41),
(46,'礼盒','礼盒','',3,0,'2018-11-08 20:35:54',41),
(47,'米面杂粮','米面杂粮','',2,0,'2018-11-08 20:35:54',40),
(48,'面粉/面条','面粉/面条','',3,0,'2018-11-08 20:35:54',47),
(49,'大米','大米','',3,0,'2018-11-08 20:35:54',47),
(50,'意大利面','意大利面','',3,0,'2018-11-08 20:35:54',47),
(51,'厨房调料','厨房调料','',2,0,'2018-11-08 20:35:54',40),
(52,'调味油/汁','调味油/汁','',3,0,'2018-11-08 20:35:54',51),
(53,'酱油/醋','酱油/醋','',3,0,'2018-11-08 20:35:54',51),
(54,'南北干货','南北干货','',2,0,'2018-11-08 20:35:54',40),
(55,'方便速食','方便速食','',2,0,'2018-11-08 20:35:54',40),
(56,'调味品','调味品','',2,0,'2018-11-08 20:35:54',40),
(57,'蔬菜水果','蔬菜水果','',1,0,'2018-11-08 20:35:54',NULL),
(58,'有机蔬菜','有机蔬菜','',2,0,'2018-11-08 20:35:54',57),
(59,'西红柿','西红柿','',3,0,'2018-11-08 20:35:54',58),
(60,'韭菜','韭菜','',3,0,'2018-11-08 20:35:54',58),
(61,'青菜','青菜','',3,0,'2018-11-08 20:35:54',58),
(62,'精选蔬菜','精选蔬菜','',2,0,'2018-11-08 20:35:54',57),
(63,'甘蓝','甘蓝','',3,0,'2018-11-08 20:35:54',62),
(64,'胡萝卜','胡萝卜','',3,0,'2018-11-08 20:35:54',62),
(65,'黄瓜','黄瓜','',3,0,'2018-11-08 20:35:54',62),
(66,'进口水果','进口水果','',2,0,'2018-11-08 20:35:54',57),
(67,'火龙果','火龙果','',3,0,'2018-11-08 20:35:54',66),
(68,'菠萝蜜','菠萝蜜','',3,0,'2018-11-08 20:35:54',66),
(69,'奇异果','奇异果','',3,0,'2018-11-08 20:35:54',66),
(70,'国产水果','国产水果','',2,0,'2018-11-08 20:35:54',57),
(71,'水果礼盒','水果礼盒','',3,0,'2018-11-08 20:35:54',70),
(72,'苹果','苹果','',3,0,'2018-11-08 20:35:54',70),
(73,'雪梨','雪梨','',3,0,'2018-11-08 20:35:54',70),
(74,'休闲食品','休闲食品','',1,0,'2018-11-08 20:35:54',NULL),
(75,'休闲零食','休闲零食','',2,0,'2018-11-08 20:35:54',74),
(76,'果冻','果冻','',3,0,'2018-11-08 20:35:54',75),
(77,'枣类','枣类','',3,0,'2018-11-08 20:35:54',75),
(78,'蜜饯','蜜饯','',3,0,'2018-11-08 20:35:54',75),
(79,'肉类零食','肉类零食','',3,0,'2018-11-08 20:35:54',75),
(80,'坚果炒货','坚果炒货','',3,0,'2018-11-08 20:35:54',75),
(81,'糖果','糖果','',2,0,'2018-11-08 20:35:54',74),
(82,'创意喜糖','创意喜糖','',3,0,'2018-11-08 20:35:54',81),
(83,'口香糖','口香糖','',3,0,'2018-11-08 20:35:54',81),
(84,'软糖','软糖','',3,0,'2018-11-08 20:35:54',81),
(85,'棒棒糖','棒棒糖','',3,0,'2018-11-08 20:35:54',81),
(86,'巧克力','巧克力','',2,0,'2018-11-08 20:35:54',74),
(87,'夹心巧克力','夹心巧克力','',3,0,'2018-11-08 20:35:54',86),
(88,'白巧克力','白巧克力','',3,0,'2018-11-08 20:35:54',86),
(89,'松露巧克力','松露巧克力','',3,0,'2018-11-08 20:35:54',86),
(90,'黑巧克力','黑巧克力','',3,0,'2018-11-08 20:35:54',86),
(91,'肉干肉脯/豆干','肉干肉脯/豆干','',2,0,'2018-11-08 20:35:54',74),
(92,'牛肉干','牛肉干','',3,0,'2018-11-08 20:35:54',91),
(93,'猪肉脯','猪肉脯','',3,0,'2018-11-08 20:35:54',91),
(94,'牛肉粒','牛肉粒','',3,0,'2018-11-08 20:35:54',91),
(95,'猪肉干','猪肉干','',3,0,'2018-11-08 20:35:54',91),
(96,'鱿鱼丝/鱼干','鱿鱼丝/鱼干','',2,0,'2018-11-08 20:35:54',74),
(97,'鱿鱼足','鱿鱼足','',3,0,'2018-11-08 20:35:54',96),
(98,'鱿鱼丝','鱿鱼丝','',3,0,'2018-11-08 20:35:54',96),
(99,'墨鱼/乌贼','墨鱼/乌贼','',3,0,'2018-11-08 20:35:54',96),
(100,'鱿鱼仔','鱿鱼仔','',3,0,'2018-11-08 20:35:54',96),
(101,'鱿鱼片','鱿鱼片','',3,0,'2018-11-08 20:35:54',96),
(102,'奶类食品','奶类食品','',1,0,'2018-11-08 20:35:54',NULL),
(103,'进口奶品','进口奶品','',2,0,'2018-11-08 20:35:54',102),
(104,'国产奶品','国产奶品','',2,0,'2018-11-08 20:35:54',102),
(105,'奶粉','奶粉','',2,0,'2018-11-08 20:35:54',102),
(106,'有机奶','有机奶','',2,0,'2018-11-08 20:35:54',102),
(107,'原料奶','原料奶','',2,0,'2018-11-08 20:35:54',102),
(108,'天然干货','天然干货','',1,0,'2018-11-08 20:35:54',NULL),
(109,'菌菇类','菌菇类','',2,0,'2018-11-08 20:35:54',108),
(110,'腌干海产','腌干海产','',2,0,'2018-11-08 20:35:54',108),
(111,'汤料','汤料','',2,0,'2018-11-08 20:35:54',108),
(112,'豆类','豆类','',2,0,'2018-11-08 20:35:54',108),
(113,'干菜/菜干','干菜/菜干','',2,0,'2018-11-08 20:35:54',108),
(114,'干果/果干','干果/果干','',2,0,'2018-11-08 20:35:54',108),
(115,'豆制品','豆制品','',2,0,'2018-11-08 20:35:54',108),
(116,'腊味','腊味','',2,0,'2018-11-08 20:35:54',108),
(117,'精选茗茶','精选茗茶','',1,0,'2018-11-08 20:35:54',NULL),
(118,'白茶','白茶','',2,0,'2018-11-08 20:35:54',117),
(119,'红茶','红茶','',2,0,'2018-11-08 20:35:54',117),
(120,'绿茶','绿茶','',2,0,'2018-11-08 20:35:54',117);

/*Table structure for table `goods_goodsimage` */

DROP TABLE IF EXISTS `goods_goodsimage`;

CREATE TABLE `goods_goodsimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodsimage_goods_id_08cb23b1_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `goods_goodsimage_goods_id_08cb23b1_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `goods_goodsimage` */

insert  into `goods_goodsimage`(`id`,`image`,`goods_id`) values 
(1,'goods/banner/2_20170719161405_249_e3I645S.jpg',1),
(2,'goods/banner/2_P_1448945810202_xH50pdF.jpg',2),
(3,'goods/banner/3_P_1448945490837_780QDRw.jpg',3),
(4,'goods/banner/4_P_1448945381985_iXIc6vy.jpg',4),
(5,'goods/banner/4_P_1448945381985_paWDzkw.jpg',5),
(6,'goods/banner/10_P_1448944572085_uZztDKy.jpg',6),
(7,'goods/banner/16_P_1448947194687_FIsy1Gf.jpg',15),
(8,'goods/banner/14_P_1448947354031_VNOpC1J.jpg',16),
(9,'goods/banner/15_P_1448947257324_jsj6U7n.jpg',15),
(10,'',18);

/*Table structure for table `goods_indexbanner` */

DROP TABLE IF EXISTS `goods_indexbanner`;

CREATE TABLE `goods_indexbanner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `index` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_indexbanner_goods_id_56bc0d49_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `goods_indexbanner_goods_id_56bc0d49_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `goods_indexbanner` */

insert  into `goods_indexbanner`(`id`,`index`,`image`,`goods_id`) values 
(1,1,'banner/banner2.jpg',1),
(2,2,'banner/banner3.jpg',2),
(3,3,'banner/banner3_NKq5ADo.jpg',3);

/*Table structure for table `social_auth_association` */

DROP TABLE IF EXISTS `social_auth_association`;

CREATE TABLE `social_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `social_auth_association` */

/*Table structure for table `social_auth_code` */

DROP TABLE IF EXISTS `social_auth_code`;

CREATE TABLE `social_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `social_auth_code` */

/*Table structure for table `social_auth_nonce` */

DROP TABLE IF EXISTS `social_auth_nonce`;

CREATE TABLE `social_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `social_auth_nonce` */

/*Table structure for table `social_auth_partial` */

DROP TABLE IF EXISTS `social_auth_partial`;

CREATE TABLE `social_auth_partial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `next_step` smallint(5) unsigned NOT NULL,
  `backend` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `social_auth_partial` */

/*Table structure for table `social_auth_usersocialauth` */

DROP TABLE IF EXISTS `social_auth_usersocialauth`;

CREATE TABLE `social_auth_usersocialauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_user_user_id` (`user_id`),
  CONSTRAINT `social_auth_usersocialauth_user_id_17d28448_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `social_auth_usersocialauth` */

insert  into `social_auth_usersocialauth`(`id`,`provider`,`uid`,`extra_data`,`user_id`) values 
(1,'weibo','6827271401','{\"profile_image_url\": \"http://tvax2.sinaimg.cn/default/images/default_avatar_male_50.gif\", \"token_type\": null, \"username\": \"asfdsagfdsaf\", \"access_token\": \"2.00fKXC9HbUgT5Cdc41efc1c0ZViWbB\", \"id\": 6827271401, \"auth_time\": 1541680852, \"gender\": \"m\"}',2);

/*Table structure for table `trade_addressmodel` */

DROP TABLE IF EXISTS `trade_addressmodel`;

CREATE TABLE `trade_addressmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `district` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `signer_name` varchar(100) NOT NULL,
  `signer_mobile` varchar(100) NOT NULL,
  `add_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trade_addressmodel_user_id_b6397ac4_fk_user_user_id` (`user_id`),
  CONSTRAINT `trade_addressmodel_user_id_b6397ac4_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `trade_addressmodel` */

/*Table structure for table `trade_ordergoods` */

DROP TABLE IF EXISTS `trade_ordergoods`;

CREATE TABLE `trade_ordergoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_num` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trade_ordergoods_goods_id_e77dc520_fk_goods_goods_id` (`goods_id`),
  KEY `trade_ordergoods_order_id_e046f633_fk_trade_orderinfo_id` (`order_id`),
  CONSTRAINT `trade_ordergoods_goods_id_e77dc520_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `trade_ordergoods_order_id_e046f633_fk_trade_orderinfo_id` FOREIGN KEY (`order_id`) REFERENCES `trade_orderinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `trade_ordergoods` */

/*Table structure for table `trade_orderinfo` */

DROP TABLE IF EXISTS `trade_orderinfo`;

CREATE TABLE `trade_orderinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(30) DEFAULT NULL,
  `nonce_str` varchar(50) DEFAULT NULL,
  `trade_no` varchar(100) DEFAULT NULL,
  `pay_status` varchar(30) NOT NULL,
  `pay_type` varchar(10) NOT NULL,
  `post_script` varchar(200) NOT NULL,
  `order_mount` double NOT NULL,
  `pay_time` datetime DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `signer_name` varchar(20) NOT NULL,
  `singer_mobile` varchar(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  UNIQUE KEY `nonce_str` (`nonce_str`),
  UNIQUE KEY `trade_no` (`trade_no`),
  KEY `trade_orderinfo_user_id_08ffa22c_fk_user_user_id` (`user_id`),
  CONSTRAINT `trade_orderinfo_user_id_08ffa22c_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `trade_orderinfo` */

/*Table structure for table `user_operation_addcarmodel` */

DROP TABLE IF EXISTS `user_operation_addcarmodel`;

CREATE TABLE `user_operation_addcarmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nums` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_operation_addcarmodel_user_id_goods_id_0efd69be_uniq` (`user_id`,`goods_id`),
  KEY `user_operation_addcarmodel_goods_id_78eab363_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `user_operation_addcarmodel_goods_id_78eab363_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `user_operation_addcarmodel_user_id_f60bd807_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_operation_addcarmodel` */

/*Table structure for table `user_operation_userfav` */

DROP TABLE IF EXISTS `user_operation_userfav`;

CREATE TABLE `user_operation_userfav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_operation_userfav_user_id_goods_id_2dbadda7_uniq` (`user_id`,`goods_id`),
  KEY `user_operation_userfav_goods_id_57fc554f_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `user_operation_userfav_goods_id_57fc554f_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `user_operation_userfav_user_id_4e4de070_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_operation_userfav` */

/*Table structure for table `user_user` */

DROP TABLE IF EXISTS `user_user`;

CREATE TABLE `user_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user_user` */

insert  into `user_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`,`name`,`birthday`,`gender`,`mobile`) values 
(1,'pbkdf2_sha256$100000$9YTKzJ9Ja0Yy$kGyTSBeMRzj1NOANk0MBXfMR66H41B8sE8BbkGt8gqk=','2018-11-08 21:39:12',1,'xuezenghui','','','1759455090@qq.com',1,1,'2018-11-08 20:37:08',NULL,NULL,'female','15037244351'),
(2,'!G8on6bwnubevyjedxTSY5gaxfGSkrIe0mTgy8QM5','2018-11-08 20:40:52',0,'asfdsagfdsaf','asfdsagfdsaf','','',0,1,'2018-11-08 20:38:05',NULL,NULL,'female',NULL);

/*Table structure for table `user_user_groups` */

DROP TABLE IF EXISTS `user_user_groups`;

CREATE TABLE `user_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_user_groups_user_id_group_id_bb60391f_uniq` (`user_id`,`group_id`),
  KEY `user_user_groups_group_id_c57f13c0_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_user_groups_group_id_c57f13c0_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_user_groups_user_id_13f9a20d_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_user_groups` */

/*Table structure for table `user_user_user_permissions` */

DROP TABLE IF EXISTS `user_user_user_permissions`;

CREATE TABLE `user_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq` (`user_id`,`permission_id`),
  KEY `user_user_user_permi_permission_id_ce49d4de_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_user_user_permissions_user_id_31782f58_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`),
  CONSTRAINT `user_user_user_permi_permission_id_ce49d4de_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_user_user_permissions` */

/*Table structure for table `xadmin_bookmark` */

DROP TABLE IF EXISTS `xadmin_bookmark`;

CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_user_user_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xadmin_bookmark` */

/*Table structure for table `xadmin_log` */

DROP TABLE IF EXISTS `xadmin_log`;

CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_user_user_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `xadmin_log` */

insert  into `xadmin_log`(`id`,`action_time`,`ip_addr`,`object_id`,`object_repr`,`action_flag`,`message`,`content_type_id`,`user_id`) values 
(1,'2018-11-08 21:42:26','127.0.0.1','1','新鲜水果甜蜜香脆单果约800克','create','已添加。',11,1),
(2,'2018-11-08 21:42:38','127.0.0.1','2','田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛','create','已添加。',11,1),
(3,'2018-11-08 21:43:34','127.0.0.1','3','酣畅家庭菲力牛排10片澳洲生鲜牛肉团购套餐','create','已添加。',11,1),
(4,'2018-11-08 21:44:59','127.0.0.1','1','新鲜水果甜蜜香脆单果约800克','create','已添加。',12,1),
(5,'2018-11-08 21:45:09','127.0.0.1','2','田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛','create','已添加。',12,1),
(6,'2018-11-08 21:45:19','127.0.0.1','3','酣畅家庭菲力牛排10片澳洲生鲜牛肉团购套餐','create','已添加。',12,1),
(7,'2018-11-08 21:45:31','127.0.0.1','4','日本蒜蓉粉丝扇贝270克6只装','create','已添加。',12,1),
(8,'2018-11-08 21:45:40','127.0.0.1','5','内蒙新鲜牛肉1斤清真生鲜牛肉火锅食材','create','已添加。',12,1),
(9,'2018-11-08 21:45:57','127.0.0.1','6','乌拉圭进口牛肉卷特级肥牛卷','create','已添加。',12,1),
(10,'2018-11-08 21:46:14','127.0.0.1','7','52度茅台集团国隆双喜酒500mlx6','create','已添加。',12,1),
(11,'2018-11-08 21:46:31','127.0.0.1','8','52度水井坊臻酿八號500ml','create','已添加。',12,1),
(12,'2018-11-08 21:46:50','127.0.0.1','9','52度茅台集团国隆双喜酒500mlx6','create','已添加。',12,1),
(13,'2018-11-08 21:47:06','127.0.0.1','10','双响炮洋酒JimBeamwhiskey美国白占边','create','已添加。',12,1);

/*Table structure for table `xadmin_usersettings` */

DROP TABLE IF EXISTS `xadmin_usersettings`;

CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_user_user_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `xadmin_usersettings` */

insert  into `xadmin_usersettings`(`id`,`key`,`value`,`user_id`) values 
(1,'dashboard:home:pos','',1);

/*Table structure for table `xadmin_userwidget` */

DROP TABLE IF EXISTS `xadmin_userwidget`;

CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_user_user_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xadmin_userwidget` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
