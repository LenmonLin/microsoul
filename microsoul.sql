/*
Navicat MySQL Data Transfer

Source Server         : 灵微网远程连接
Source Server Version : 50721
Source Host           : 120.79.211.216:3306
Source Database       : microsoul

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-03-06 17:13:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for adminitrator_table
-- ----------------------------
DROP TABLE IF EXISTS `adminitrator_table`;
CREATE TABLE `adminitrator_table` (
  `ID` int(255) NOT NULL,
  `ACOUNT_NAME` varchar(255) NOT NULL,
  `QQ` int(255) DEFAULT NULL,
  `REAL_NAME` varchar(255) NOT NULL,
  `TELEPHONE` int(255) DEFAULT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of adminitrator_table
-- ----------------------------

-- ----------------------------
-- Table structure for ad_info_table
-- ----------------------------
DROP TABLE IF EXISTS `ad_info_table`;
CREATE TABLE `ad_info_table` (
  `ID` int(11) NOT NULL,
  `PUBLISH_TIME` datetime NOT NULL,
  `IMAGE_URL` varchar(255) NOT NULL,
  `STATE` int(2) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ad_info_table
-- ----------------------------

-- ----------------------------
-- Table structure for buyer
-- ----------------------------
DROP TABLE IF EXISTS `buyer`;
CREATE TABLE `buyer` (
  `BUYER_ID` int(15) NOT NULL AUTO_INCREMENT,
  `ACCOUNT_NAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `ZHIFUBAO_ACCOUNT` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `QQ_ACCOUNT` varchar(15) DEFAULT NULL,
  `REAL_NAME` varchar(255) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `TELEPHONE` varchar(15) NOT NULL,
  `STATE` int(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`BUYER_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of buyer
-- ----------------------------
INSERT INTO `buyer` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '01');
INSERT INTO `buyer` VALUES ('2', '密码123', '202cb962ac59075b964b07152d234b70', null, '是问问', null, null, null, '12', '01');
INSERT INTO `buyer` VALUES ('3', 'hlf', '202cb962ac59075b964b07152d234b70', null, '123', null, '林强', null, '123', '01');

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CREATETIME` datetime NOT NULL,
  `BUYER_ID` int(15) NOT NULL,
  `GOODS_ID` int(15) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of collection
-- ----------------------------

-- ----------------------------
-- Table structure for contenttable
-- ----------------------------
DROP TABLE IF EXISTS `contenttable`;
CREATE TABLE `contenttable` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内容类目id',
  `category_id` int(11) DEFAULT NULL COMMENT '分类id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `subTitle` varchar(100) DEFAULT NULL COMMENT '子标题',
  `titleDesc` varchar(500) DEFAULT NULL COMMENT '标题描述',
  `url` varchar(100) DEFAULT NULL COMMENT '内容链接',
  `pic` varchar(500) DEFAULT NULL COMMENT '图片绝对路径',
  `pic2` varchar(500) DEFAULT NULL COMMENT '图片2',
  `content` text COMMENT '内容',
  `content_price` int(11) DEFAULT NULL COMMENT '内容价格',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contenttable
-- ----------------------------
INSERT INTO `contenttable` VALUES ('1', '89', null, null, null, null, null, null, null, null, '2018-03-03 18:03:45', '2018-03-03 18:03:45');
INSERT INTO `contenttable` VALUES ('2', '89', '额外', '温柔', '玩额', 'https://github.com/LenmonLin/microsoul/commit/1cd97f7aa84db7e075eaee999c93d740f469f801', '的', 'd\'s\'f', '的萨芬', null, '2018-03-03 18:05:30', '2018-03-03 18:05:30');
INSERT INTO `contenttable` VALUES ('3', '89', 'fdsfd', 'dsfsdf', '玩额', 'https://github.com/LenmonLin/microsoul/commit/1cd97f7aa84db7e075eaee999c93d740f469f801', '的', 'd\'s\'f', '的萨芬', null, '2018-03-03 18:14:19', '2018-03-05 15:10:22');
INSERT INTO `contenttable` VALUES ('4', '90', '23', '23', '344', '424', '432', '343', '4343', null, null, null);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `GOODS_ID` int(16) NOT NULL AUTO_INCREMENT COMMENT '商品Id',
  `GOODS_NAME` varchar(255) NOT NULL COMMENT '商品名称',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '商品标题',
  `SELLPOINT` varchar(255) DEFAULT NULL COMMENT '商品卖点',
  `UNIT_PRICE` int(16) NOT NULL COMMENT '商品单价',
  `PURCHASE_QUANTITY` int(16) DEFAULT NULL COMMENT '商品购买数量',
  `BARCODE` int(32) DEFAULT NULL COMMENT '商品条形码',
  `IMAGE_URL` varchar(255) DEFAULT NULL COMMENT '商品图片链接',
  `CATEGORY` int(32) NOT NULL COMMENT '商品分类：\r\n女装 1\r\n男装 2\r\n美妆 3\r\n手机数码 4\r\n母婴玩具 5\r\n零食茶酒 6\r\n家电 7\r\n汽车配件用品 8\r\n图书音像 9\r\n其他 10',
  `STORE` int(32) NOT NULL COMMENT '商品库存',
  `DETAIL` varchar(255) DEFAULT NULL COMMENT '商品详情',
  `DISCOUNT` int(16) DEFAULT NULL COMMENT '商品折扣',
  `STATUS` int(8) DEFAULT NULL COMMENT '商品状态：1在售2下架3删除',
  `CREATED` datetime(6) DEFAULT NULL,
  `UPDATED` datetime(6) DEFAULT NULL,
  `COLLECTION_ID` int(15) DEFAULT NULL,
  `SELLER_ID` int(16) NOT NULL,
  PRIMARY KEY (`GOODS_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '更新1', '鱼缸', null, '1', '1', null, '1', '1', '1', '1', '1', null, null, '2018-03-05 15:15:26.518000', '1', '1');
INSERT INTO `goods` VALUES ('2', '1233', '大鱼缸', null, '123', '5', null, '122', '123', '123', '12', '45', null, null, null, '56', '2');
INSERT INTO `goods` VALUES ('3', '手机', '武昌鱼', null, '34', null, null, null, '4', '12', null, null, '1', '2018-02-28 16:52:52.931000', '2018-02-28 16:52:52.931000', null, '1');
INSERT INTO `goods` VALUES ('4', '手机', '鱼', null, '34', null, null, null, '4', '12', null, null, '1', '2018-03-03 16:20:05.048000', '2018-03-03 16:20:05.048000', null, '1');

-- ----------------------------
-- Table structure for goods_desc
-- ----------------------------
DROP TABLE IF EXISTS `goods_desc`;
CREATE TABLE `goods_desc` (
  `good_id` bigint(20) NOT NULL,
  `good_desc` text,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`good_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_desc
-- ----------------------------
INSERT INTO `goods_desc` VALUES ('1', '<div class=\"content_tpl\"><div class=\"formwork_bt\"><div class=\"formwork_bt_dz\"><span>产品信息</span><span class=\"s2\">Product Information</span></div></div><div class=\"formwork\">\n<div class=\"formwork_img\"><img src=\"http://img20.360buyimg.com/vc/g10/M00/15/13/rBEQWFFs8f0IAAAAAAHFPOz_CGgAAEN-QNc74wAAcVU467.jpg\" /></div>\n</div><div class=\"formwork_bt\"><div class=\"formwork_bt_dz\"><span>产品功能</span><span class=\"s2\">Product Function</span></div></div><div class=\"formwork\">\n<div class=\"formwork_img\"><img src=\"http://img20.360buyimg.com/vc/g10/M00/15/13/rBEQWFFs8nsIAAAAAAInrOyorY4AAEN_wK_3mEAAifE337.jpg\" /></div>\n</div><div class=\"formwork\">\n<div class=\"formwork_img\"><img src=\"http://img20.360buyimg.com/vc/g10/M00/15/13/rBEQWFFs8m8IAAAAAAE5-CgRgakAAEN_wBCe7MAAToQ358.jpg\" /></div>\n</div><div class=\"formwork\">\n<div class=\"formwork_img\"><img src=\"http://img20.360buyimg.com/vc/g10/M00/15/13/rBEQWVFs8oUIAAAAAADAVLbYtg8AAEOAACmPVAAAMBs533.jpg\" /></div>\n</div><div class=\"formwork_bt\"><div class=\"formwork_bt_dz\"><span>产品特色</span><span class=\"s2\">Selling Point</span></div></div><div class=\"formwork\">\n<div class=\"formwork_img\"><img src=\"http://img20.360buyimg.com/vc/g10/M00/15/13/rBEQWFFs8qQIAAAAAAHsS4_fTh8AAEOAQOXouAAAexj796.jpg\" /></div>\n</div><div class=\"formwork\">\n<div class=\"formwork_img\"><img src=\"http://img20.360buyimg.com/vc/g10/M00/15/13/rBEQWVFs8rkIAAAAAAEUxKnNGIIAAEOAgIRRx4AARTc870.jpg\" /></div>\n</div><div class=\"formwork\">\n<div class=\"formwork_img\"><img src=\"http://img20.360buyimg.com/vc/g10/M00/15/13/rBEQWFFs8vEIAAAAAAE1xNRq3zMAAEOBAJv6RoAATXc756.jpg\" /></div>\n</div><div class=\"formwork\">\n<div class=\"formwork_img\"><img src=\"http://img20.360buyimg.com/vc/g10/M00/15/13/rBEQWVFs8wYIAAAAAAFRdqJlDNEAAEOBQFxoA0AAVGO375.jpg\" /></div>\n</div><div class=\"formwork\">\n<div class=\"formwork_img\"><img src=\"http://img20.360buyimg.com/vc/g10/M00/15/13/rBEQWFFs9AUIAAAAAAG-foajBukAAEODwLk8EMAAb6W273.jpg\" /></div>\n</div><div class=\"formwork_bt\"><div class=\"formwork_bt_dz\"><span>尺寸信息</span><span class=\"s2\">Size Information</span></div></div><div class=\"formwork\">\n<div class=\"formwork_img\"><img src=\"http://img20.360buyimg.com/vc/g10/M00/15/13/rBEQWVFs9BgIAAAAAANwiiKd5KUAAEOEAHmD6sAA3Ci620.jpg\" /></div>\n</div><div class=\"formwork_bt\"><div class=\"formwork_bt_dz\"><span>品牌介绍</span><span class=\"s2\">Brand Introduction</span></div></div><div class=\"formwork\">\n<div class=\"formwork_img\"><img src=\"http://img20.360buyimg.com/vc/g10/M00/15/13/rBEQWVFs9EQIAAAAAADG7z2qRlAAAEOEgGswScAAMcH397.jpg\" /></div>\n</div><div class=\"formwork_bt\"><div class=\"formwork_bt_dz\"><span>品牌荣誉</span><span class=\"s2\">Brand Awards</span></div></div><div class=\"formwork\">\n<div class=\"formwork_img\"><img src=\"http://img20.360buyimg.com/vc/g15/M09/04/19/rBEhWFIMPPQIAAAAAAOcP0nAlmIAACEYADg_YwAA5xX040.jpg\" /></div>\n</div></div>', '2018-03-06 09:24:53', '2018-03-06 09:24:56');

-- ----------------------------
-- Table structure for order_goods_table
-- ----------------------------
DROP TABLE IF EXISTS `order_goods_table`;
CREATE TABLE `order_goods_table` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GOODS_ID` int(11) NOT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `NUM` int(11) NOT NULL,
  `GRADE` float(255,0) DEFAULT NULL COMMENT '评分',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order_goods_table
-- ----------------------------
INSERT INTO `order_goods_table` VALUES ('1', '1', '10', '2', '9');

-- ----------------------------
-- Table structure for order_table
-- ----------------------------
DROP TABLE IF EXISTS `order_table`;
CREATE TABLE `order_table` (
  `ORDER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'è®¢å•ID',
  `STATE` int(1) NOT NULL COMMENT 'è®¢å•çŠ¶æ€',
  `LOGISTIC_ID` varchar(11) DEFAULT NULL COMMENT 'ç‰©æµå•å·',
  `LOGISTIC_ID_REJECT` varchar(11) DEFAULT NULL COMMENT 'é€€è´§ç‰©æµå•å·',
  `BUYER_ID` int(11) NOT NULL COMMENT 'ä¹°å®¶ID',
  `SELLER_ID` int(11) NOT NULL COMMENT 'ä¹°å®¶ID',
  `ORDER_TIME` datetime NOT NULL COMMENT 'ä¸‹å•æ—¶é—´',
  `PAY_TIME` datetime DEFAULT NULL COMMENT 'ä»˜æ¬¾æ—¶é—´',
  `DELIVER_TIME` datetime DEFAULT NULL COMMENT 'å‘è´§æ—¶é—´',
  PRIMARY KEY (`ORDER_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order_table
-- ----------------------------
INSERT INTO `order_table` VALUES ('10', '0', '', '', '1', '1', '2018-01-24 16:11:39', '2018-01-24 16:11:41', '2018-01-24 16:11:43');
INSERT INTO `order_table` VALUES ('11', '0', '', '', '2', '1', '2018-01-24 16:11:39', '2018-01-24 16:11:41', '2018-01-24 16:11:43');
INSERT INTO `order_table` VALUES ('12', '0', '', '', '1', '2', '2018-01-24 16:11:39', '2018-01-24 16:11:41', '2018-01-24 16:11:43');
INSERT INTO `order_table` VALUES ('13', '0', '', '', '1', '3', '2018-01-24 16:11:39', '2018-01-24 16:11:41', '2018-01-24 16:11:43');
INSERT INTO `order_table` VALUES ('14', '0', '', '', '2', '2', '2018-01-24 16:11:39', '2018-01-24 16:11:41', '2018-01-24 16:11:43');

-- ----------------------------
-- Table structure for seller
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller` (
  `ID_SELLER` int(15) NOT NULL AUTO_INCREMENT,
  `ACCOUNT_NAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `ZHIFUBAO_ACCOUNT` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `QQ_ACCOUNT` int(15) DEFAULT NULL,
  `DISTRICT` varchar(255) DEFAULT NULL,
  `REAL_NAME` varchar(255) NOT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `TELEPHONE` int(20) DEFAULT NULL,
  `STATE` int(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`ID_SELLER`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of seller
-- ----------------------------
INSERT INTO `seller` VALUES ('1', 'zhangsan', 'zhangsan', '1', '1', '1', '1', '1', '1', '1', '01');
INSERT INTO `seller` VALUES ('2', 'hel', '1', null, null, null, null, '1', null, null, '01');
INSERT INTO `seller` VALUES ('3', '2', 'c4ca4238a0b923820dcc509a6f75849b', null, null, null, null, 'hello', null, null, '01');
INSERT INTO `seller` VALUES ('4', '45', 'c4ca4238a0b923820dcc509a6f75849b', null, null, null, null, 'hello', null, null, '01');
INSERT INTO `seller` VALUES ('5', '小明', '35f4a8d465e6e1edc05f3d8ab658c551', null, null, null, null, 'hello', null, null, '01');
INSERT INTO `seller` VALUES ('6', '小郝', '35f4a8d465e6e1edc05f3d8ab658c551', null, null, null, null, 'hello', null, null, '01');
INSERT INTO `seller` VALUES ('9', '密码123', '202cb962ac59075b964b07152d234b70', null, null, null, null, 'hello', null, null, '01');
INSERT INTO `seller` VALUES ('10', '密码1234', '81dc9bdb52d04dc20036dbd8313ed055', null, null, null, null, 'hello', null, null, '01');
INSERT INTO `seller` VALUES ('11', '密码12345', '827ccb0eea8a706c4c34a16891f84e7b', null, null, null, null, 'hello', null, null, '01');
INSERT INTO `seller` VALUES ('12', '密码1237', 'a9eb812238f753132652ae09963a05e9', null, null, null, null, 'hello', null, null, '01');
INSERT INTO `seller` VALUES ('13', '密码1235565', '7953bcdc416332990843fd95dbb9c493', null, null, null, null, 'hello', null, null, '01');
INSERT INTO `seller` VALUES ('14', '密码111', '698d51a19d8a121ce581499d7b701668', null, null, null, null, 'hello', null, null, '01');
INSERT INTO `seller` VALUES ('15', '0987', '8ae9c55967714bc6c45abe7333f227cc', 'swaddle', null, null, null, 'hello', null, null, '01');
INSERT INTO `seller` VALUES ('16', '密码09876', '9e1e06ec8e02f0a0074f2fcc6b26303b', null, null, null, null, 'hello', null, null, '01');
INSERT INTO `seller` VALUES ('17', 'mima0987', '9e1e06ec8e02f0a0074f2fcc6b26303b', null, null, null, null, 'hello', null, null, '01');
INSERT INTO `seller` VALUES ('18', 'mima09876', '6531401f9a6807306651b87e44c05751', 'dfsdf的萨芬', null, null, null, 'hello', null, null, '01');
INSERT INTO `seller` VALUES ('19', '密码098765', 'a8698009bce6d1b8c2128eddefc25aad', 'dfsdf的萨芬二', null, null, null, 'hello', null, null, '01');
