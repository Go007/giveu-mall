/*
Navicat MySQL Data Transfer

Source Server         : dafy_shop
Source Server Version : 50716
Source Host           : 10.12.11.185:3306
Source Database       : dafy_shop

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-09-14 16:21:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE `t_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `cert_no` varchar(50) DEFAULT NULL COMMENT '身份证',
  `device_id` varchar(255) DEFAULT NULL COMMENT '设备id',
  `type` int(11) DEFAULT NULL COMMENT '类型 1绑定 0 解绑',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间,绑定解绑时间',
  `status` int(11) DEFAULT NULL COMMENT '1 可用 0  禁用',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  `ip` varchar(50) DEFAULT NULL COMMENT ' ip地址',
  `platform` varchar(20) DEFAULT NULL COMMENT '平台 iso android',
  PRIMARY KEY (`id`),
  KEY `device_cert_name` (`device_id`,`cert_no`,`name`) USING BTREE COMMENT '设备ID-身份证-姓名索引'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='设备登录流水记录';
