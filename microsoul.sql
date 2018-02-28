/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : microsoul

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-02-28 15:57:42
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
  `EMAIL` varchar(255) DEFAULT NULL,
  `QQ_ACCOUNT` varchar(15) DEFAULT NULL,
  `REAL_NAME` varchar(255) NOT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `TELEPHONE` varchar(15) DEFAULT NULL,
  `STATE` int(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`BUYER_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of buyer
-- ----------------------------
INSERT INTO `buyer` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '01');

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CREATETIME` datetime NOT NULL,
  `BUYER_ID` int(15) NOT NULL,
  `GOODS_ID` int(15) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `BUYER_ID` (`BUYER_ID`) USING BTREE,
  KEY `GOODS_ID` (`GOODS_ID`) USING BTREE,
  CONSTRAINT `BUYER_ID` FOREIGN KEY (`BUYER_ID`) REFERENCES `buyer` (`BUYER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of collection
-- ----------------------------

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
  `PURCHASE_QUANTITY` int(16) NOT NULL COMMENT '商品购买数量',
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
  PRIMARY KEY (`GOODS_ID`) USING BTREE,
  KEY `SELLER_ID` (`SELLER_ID`) USING BTREE,
  KEY `COLLECTION_GOODS_ID` (`COLLECTION_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '1', null, null, '1', '1', null, '1', '1', '1', '1', '1', null, null, null, '1', '1');
INSERT INTO `goods` VALUES ('2', '1233', null, null, '123', '5', null, '122', '123', '123', '12', '45', null, null, null, '56', '2');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order_goods_table
-- ----------------------------

-- ----------------------------
-- Table structure for order_table
-- ----------------------------
DROP TABLE IF EXISTS `order_table`;
CREATE TABLE `order_table` (
  `ORDER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `STATE` int(1) NOT NULL COMMENT '订单状态',
  `LOGISTIC_ID` varchar(11) DEFAULT NULL COMMENT '物流单号',
  `BUYER_ID` int(11) NOT NULL COMMENT '买家ID',
  `SELLER_ID` int(11) NOT NULL COMMENT '买家ID',
  `ORDER_TIME` datetime NOT NULL COMMENT '下单时间',
  `PAY_TIME` datetime DEFAULT NULL COMMENT '付款时间',
  `DELIVER_TIME` datetime DEFAULT NULL COMMENT '发货时间',
  PRIMARY KEY (`ORDER_ID`) USING BTREE,
  KEY `1` (`BUYER_ID`) USING BTREE,
  CONSTRAINT `1` FOREIGN KEY (`BUYER_ID`) REFERENCES `buyer` (`BUYER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order_table
-- ----------------------------
INSERT INTO `order_table` VALUES ('1', '1', '1', '1', '1', '2018-01-24 16:11:39', '2018-01-24 16:11:41', '2018-01-24 16:11:43');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
