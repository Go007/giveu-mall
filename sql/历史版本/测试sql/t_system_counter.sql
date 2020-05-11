/*
Navicat MySQL Data Transfer

Source Server         : 10.10.11.140_8066
Source Server Version : 50629
Source Host           : 10.10.11.140:8066
Source Database       : TESTDB

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2017-07-13 11:44:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_system_counter
-- ----------------------------
DROP TABLE IF EXISTS `t_system_counter`;
CREATE TABLE `t_system_counter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务编码名称',
  `prefix` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '前缀,两位作为标识：如02、23、等',
  `is_date` int(11) unsigned zerofill DEFAULT NULL COMMENT '包含日期 0不包含 1包含',
  `date_format` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日期格式',
  `min` bigint(20) DEFAULT NULL COMMENT '起始数',
  `current` bigint(20) DEFAULT NULL COMMENT '当前数',
  `max` bigint(20) DEFAULT NULL COMMENT '最大数',
  `is_loop` int(11) DEFAULT NULL COMMENT '是否循环',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `step_size` int(11) DEFAULT NULL COMMENT '步长',
  `length` int(11) DEFAULT NULL COMMENT '生成序列长度',
  PRIMARY KEY (`id`),
  UNIQUE KEY `biz_name` (`biz_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='单号生成器';

-- ----------------------------
-- Records of t_system_counter
-- ----------------------------
INSERT INTO `t_system_counter` VALUES ('1', 'pay', '08', '00000000001', 'yyyyMMdd', '34329', null, '35329', null, null, '1499670337361', '1000', '20');
INSERT INTO `t_system_counter` VALUES ('2', 'order', '02', '00000000001', 'yyyyMMdd', '21222', null, '22222', null, null, '1499674084201', '1000', '20');
INSERT INTO `t_system_counter` VALUES ('3', 'SHOP_SPU', 'P', '00000000000', null, '42477', null, '42487', null, null, '1498210525266', '10', '9');
INSERT INTO `t_system_counter` VALUES ('5', 'SHOP_SKU', 'K', '00000000000', null, '2680', null, '2690', null, null, '1498298962602', '10', '9');
INSERT INTO `t_system_counter` VALUES ('6', 'refund', '80', '00000000001', 'yyyyMMdd', '1', null, '1001', null, null, '1495078114328', '1000', '15');
INSERT INTO `t_system_counter` VALUES ('7', 'jdOrder', 'JD', '00000000000', null, '11012', null, '12012', null, null, '1499485542698', '1000', '9');
INSERT INTO `t_system_counter` VALUES ('8', 'test', 'aa', '00000000000', null, '10011', null, '11011', null, null, '1495782328649', '1000', '8');
INSERT INTO `t_system_counter` VALUES ('9', 'RP_ORD', 'RP', '00000000000', null, '23024', null, '24024', null, null, '1499420381901', '1000', '10');
INSERT INTO `t_system_counter` VALUES ('10', 'rechargeOrder', 'cz', '00000000001', 'yyyyMMdd', '1', null, '1001', null, null, '1498465991449', '1000', '10');
INSERT INTO `t_system_counter` VALUES ('12', 'Enchashment', 'qx', '00000000001', 'yyyyMMddHHmmss', '323', null, '423', null, null, '1499914754258', '100', '8');
INSERT INTO `t_system_counter` VALUES ('13', 'phone', 'ph', '00000000001', 'yyyyMMddHHmmss', '151', null, '251', null, null, '1499736447891', '100', '20');
INSERT INTO `t_system_counter` VALUES ('14', 'recharge', 'CZ', '00000000000', null, '1', null, '10001', null, null, '1499827955755', '10000', '9');
