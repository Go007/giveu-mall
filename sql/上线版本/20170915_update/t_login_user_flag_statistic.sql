/*
Navicat MySQL Data Transfer

Source Server         : dafy_shop
Source Server Version : 50716
Source Host           : 10.12.11.185:3306
Source Database       : dafy_shop

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-09-14 16:21:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_login_user_flag_statistic
-- ----------------------------
DROP TABLE IF EXISTS `t_login_user_flag_statistic`;
CREATE TABLE `t_login_user_flag_statistic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_flag` varchar(50) DEFAULT NULL COMMENT '身份证',
  `login_times` int(11) DEFAULT NULL COMMENT '绑定身份证次数',
  `login_device_id_desc` json DEFAULT NULL COMMENT '身份证绑定设备id描述 逗号分隔',
  `status` int(11) DEFAULT NULL COMMENT '1 可用 0 禁用',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_flag` (`user_flag`) USING BTREE COMMENT '身份证'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='设备、身份证登录统计';
