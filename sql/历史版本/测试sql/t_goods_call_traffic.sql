/*
Navicat MySQL Data Transfer

Source Server         : 10.10.11.140_8066
Source Server Version : 50629
Source Host           : 10.10.11.140:8066
Source Database       : TESTDB

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2017-07-13 11:25:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_goods_call_traffic
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_call_traffic`;
CREATE TABLE `t_goods_call_traffic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键唯一标识',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `sale_price` bigint(20) DEFAULT NULL COMMENT '售价',
  `operator` int(11) DEFAULT NULL COMMENT '0:中国移动，1：中国联通，2：中国电信',
  `product_type` int(11) DEFAULT NULL COMMENT '产品类型：0：话费，1：流量',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '最后修改时间',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_goods_call_traffic
-- ----------------------------
INSERT INTO `t_goods_call_traffic` VALUES ('1', '10M流量', '990', '0', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('2', '30M流量', '990', '0', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('3', '70M流量', '990', '0', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('4', '150M流量', '990', '0', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('5', '500M流量', '990', '0', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('6', '1G流量', '990', '0', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('7', '2G流量', '990', '0', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('8', '3G流量', '990', '0', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('9', '4G流量', '990', '0', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('10', '6G流量', '990', '0', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('11', '11G流量', '990', '0', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('12', '20M流量', '990', '1', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('13', '50M流量', '990', '1', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('14', '100M流量', '990', '1', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('15', '200M流量', '990', '1', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('16', '500M流量', '990', '1', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('17', '1G流量', '990', '1', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('18', '5M流量', '990', '2', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('19', '10M流量', '990', '2', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('20', '30M流量', '990', '2', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('21', '50M流量', '990', '2', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('22', '100M流量', '990', '2', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('23', '200M流量', '990', '2', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('24', '500M流量', '990', '2', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('25', '1G流量', '990', '2', '1', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('26', '10元', '1000', '0', '0', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('27', '20元', '2000', '0', '0', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('28', '30元', '3000', '0', '0', null, '0');
INSERT INTO `t_goods_call_traffic` VALUES ('29', '50元', '4998', '0', '0', null, '0');
INSERT INTO `t_goods_call_traffic` VALUES ('30', '100元', '9998', '0', '0', null, '0');
INSERT INTO `t_goods_call_traffic` VALUES ('31', '10元', '1000', '1', '0', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('32', '20元', '2000', '1', '0', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('33', '30元', '3000', '1', '0', null, '0');
INSERT INTO `t_goods_call_traffic` VALUES ('34', '50元', '4998', '1', '0', null, '0');
INSERT INTO `t_goods_call_traffic` VALUES ('35', '100元', '9998', '1', '0', null, '0');
INSERT INTO `t_goods_call_traffic` VALUES ('36', '10元', '1000', '2', '0', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('37', '20元', '2000', '2', '0', null, '1');
INSERT INTO `t_goods_call_traffic` VALUES ('38', '30元', '3000', '2', '0', null, '0');
INSERT INTO `t_goods_call_traffic` VALUES ('39', '50元', '4998', '2', '0', null, '0');
INSERT INTO `t_goods_call_traffic` VALUES ('40', '100元', '9998', '2', '0', null, '0');
INSERT INTO `t_goods_call_traffic` VALUES ('41', '200元', '19998', '0', '0', null, '0');
INSERT INTO `t_goods_call_traffic` VALUES ('42', '200元', '19998', '2', '0', null, '0');

-- ----------------------------
-- Table structure for t_goods_call_traffic_supplier
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_call_traffic_supplier`;
CREATE TABLE `t_goods_call_traffic_supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键唯一标识',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `denomination` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '面额',
  `sale_price` bigint(20) DEFAULT NULL COMMENT '售价x100',
  `purchase_price` bigint(20) DEFAULT NULL COMMENT '进货价x1000',
  `official_price` bigint(20) DEFAULT NULL COMMENT '官方价格x100',
  `discount_rate` decimal(10,5) DEFAULT NULL COMMENT '折扣',
  `limit_discount_rate` decimal(10,5) DEFAULT NULL COMMENT '限制折扣率',
  `operator` int(11) DEFAULT NULL COMMENT '0:中国移动，1：中国联通，2：中国电信',
  `product_type` int(11) DEFAULT NULL COMMENT '产品类型：0：话费，1：流量',
  `proportion` int(11) DEFAULT NULL COMMENT '比例',
  `supplier_type` int(11) DEFAULT NULL COMMENT '供应商：0：大汉，1：合赢',
  `use_scope` int(11) DEFAULT '0' COMMENT '使用范围：0：全国，1：全省',
  `fn_call_id` bigint(20) DEFAULT NULL COMMENT '对应蜂鸟充值产品ID',
  `call_traffic_id` bigint(20) DEFAULT NULL COMMENT '即有的产品ID',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '最后修改时间',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_goods_call_traffic_supplier
-- ----------------------------
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('1', '10M流量', '10', '285', '2715', '300', '0.90500', '0.95000', '0', '1', '100', '0', '0', '0', '1', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('2', '30M流量', '30', '475', '4525', '500', '0.90500', '0.95000', '0', '1', '100', '0', '0', '0', '2', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('3', '70M流量', '70', '950', '9050', '1000', '0.90500', '0.95000', '0', '1', '100', '0', '0', '0', '3', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('4', '150M流量', '150', '1900', '18100', '2000', '0.90500', '0.95000', '0', '1', '100', '0', '0', '0', '4', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('5', '500M流量', '500', '2850', '27150', '3000', '0.90500', '0.95000', '0', '1', '100', '0', '0', '0', '5', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('6', '1G流量', '1000', '4750', '45250', '5000', '0.90500', '0.95000', '0', '1', '100', '0', '0', '0', '6', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('7', '2G流量', '2000', '6650', '63350', '7000', '0.90500', '0.95000', '0', '1', '100', '0', '0', '0', '7', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('8', '3G流量', '3000', '9500', '90500', '10000', '0.90500', '0.95000', '0', '1', '100', '0', '0', '0', '8', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('9', '4G流量', '4000', '12350', '117650', '13000', '0.90500', '0.95000', '0', '1', '100', '0', '0', '0', '9', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('10', '6G流量', '6000', '17100', '162900', '18000', '0.90500', '0.95000', '0', '1', '100', '0', '0', '0', '10', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('11', '11G流量', '11000', '26600', '253400', '28000', '0.90500', '0.95000', '0', '1', '100', '0', '0', '0', '11', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('12', '20M流量', '20', '285', '2790', '300', '0.93000', '0.00000', '1', '1', '100', '0', '0', '0', '12', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('13', '50M流量', '50', '570', '5580', '600', '0.93000', '0.00000', '1', '1', '100', '0', '0', '0', '13', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('14', '100M流量', '100', '950', '9300', '1000', '0.93000', '0.00000', '1', '1', '100', '0', '0', '0', '14', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('15', '200M流量', '200', '1425', '13950', '1500', '0.93000', '0.00000', '1', '1', '100', '0', '0', '0', '15', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('16', '500M流量', '500', '2850', '27900', '3000', '0.93000', '0.00000', '1', '1', '100', '0', '0', '0', '16', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('17', '1G流量', '1024', '4750', '47250', '5000', '0.94500', '0.00000', '1', '1', '100', '0', '0', '0', '17', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('18', '5M流量', '5', '95', '780', '100', '0.78000', '0.95000', '2', '1', '100', '0', '0', '0', '18', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('19', '10M流量', '10', '190', '1560', '200', '0.78000', '0.95000', '2', '1', '100', '0', '0', '0', '19', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('20', '30M流量', '30', '475', '3900', '500', '0.78000', '0.95000', '2', '1', '100', '0', '0', '0', '20', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('21', '50M流量', '50', '665', '5460', '700', '0.78000', '0.95000', '2', '1', '100', '0', '0', '0', '21', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('22', '100M流量', '100', '950', '7800', '1000', '0.78000', '0.95000', '2', '1', '100', '0', '0', '0', '22', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('23', '200M流量', '200', '1425', '11700', '1500', '0.78000', '0.95000', '2', '1', '100', '0', '0', '0', '23', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('24', '500M流量', '500', '2850', '23400', '3000', '0.78000', '0.95000', '2', '1', '100', '0', '0', '0', '24', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('25', '1G流量', '1000', '4750', '39000', '5000', '0.78000', '0.95000', '2', '1', '100', '0', '0', '0', '25', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('51', '10元', '10', '990', '10000', '1000', '0.00000', '0.00000', '0', '0', '100', '1', '0', '0', '26', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('52', '20元', '20', '990', '20000', '2000', '0.00000', '0.00000', '0', '0', '100', '1', '0', '0', '27', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('53', '30元', '30', '3000', '30000', '3000', '0.00000', '0.00000', '0', '0', '100', '1', '0', '1', '28', null, '0');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('54', '50元', '50', '4998', '49950', '5000', '0.00000', '0.00000', '0', '0', '100', '1', '0', '2', '29', null, '0');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('55', '100元', '100', '9998', '99500', '10000', '0.00000', '0.00000', '0', '0', '100', '1', '0', '3', '30', null, '0');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('56', '10元', '10', '1020', '10200', '1000', '0.00000', '0.00000', '1', '0', '100', '1', '0', '0', '31', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('57', '20元', '20', '2000', '19900', '2000', '0.00000', '0.00000', '1', '0', '100', '1', '0', '0', '32', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('58', '30元', '30', '3000', '29900', '3000', '0.00000', '0.00000', '1', '0', '100', '1', '0', '5', '33', null, '0');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('59', '50元', '50', '4998', '49800', '5000', '0.00000', '0.00000', '1', '0', '100', '1', '0', '6', '34', null, '0');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('60', '100元', '100', '9998', '99700', '10000', '0.00000', '0.00000', '1', '0', '100', '1', '0', '7', '35', null, '0');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('61', '10元', '10', '1000', '9840', '1000', '0.00000', '0.00000', '2', '0', '100', '1', '0', '0', '36', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('62', '20元', '20', '2000', '19680', '2000', '0.00000', '0.00000', '2', '0', '100', '1', '0', '0', '37', null, '1');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('63', '30元', '30', '3000', '29500', '3000', '0.00000', '0.00000', '2', '0', '100', '1', '0', '8', '38', null, '0');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('64', '50元', '50', '4998', '49300', '5000', '0.00000', '0.00000', '2', '0', '100', '1', '0', '9', '39', null, '0');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('65', '100元', '100', '9998', '98500', '10000', '0.00000', '0.00000', '2', '0', '100', '1', '0', '10', '40', null, '0');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('66', '200元', '200', '19998', '199500', '20000', '0.00000', '0.00000', '0', '0', '100', '1', '0', '4', '41', null, '0');
INSERT INTO `t_goods_call_traffic_supplier` VALUES ('67', '200元', '200', '19998', '198400', '20000', '0.00000', '0.00000', '2', '0', '100', '1', '0', '11', '42', null, '0');
