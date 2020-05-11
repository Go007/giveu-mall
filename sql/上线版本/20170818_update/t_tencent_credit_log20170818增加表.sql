/*
Navicat MySQL Data Transfer

Source Server         : shop-qq
Source Server Version : 50719
Source Host           : 10.10.11.157:3306
Source Database       : dafy_shop

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-08-18 21:24:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_tencent_credit_log
-- ----------------------------
DROP TABLE IF EXISTS `t_tencent_credit_log`;
CREATE TABLE `t_tencent_credit_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '姓名',
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `qq_open_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '腾讯手Q openid',
  `id_card` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证',
  `tencent_credit_score` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '腾讯信用分',
  `tencent_xfjr_Score` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '腾讯消费金融分',
  `giveu_credit_score` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '即有分',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `ip_address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=987 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
