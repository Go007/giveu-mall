/*
Navicat MySQL Data Transfer

Source Server         : 10.10.11.140_8066
Source Server Version : 50629
Source Host           : 10.10.11.140:8066
Source Database       : TESTDB

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2017-07-12 16:52:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_id_config
-- ----------------------------
DROP TABLE IF EXISTS `t_id_config`;
CREATE TABLE `t_id_config` (
  `biz_tag` varchar(128) NOT NULL,
  `max_id` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `updatetime` timestamp NOT NULL DEFAULT '2017-05-03 10:05:00' ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `biz_tag` (`biz_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_id_config
-- ----------------------------
INSERT INTO `t_id_config` VALUES ('order', '1400', '100', 'ordersystem', '2017-05-03 14:03:56');
INSERT INTO `t_id_config` VALUES ('pay', '21000', '1000', 'paysystem', '2017-05-03 18:05:18');
