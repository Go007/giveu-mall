/*
Navicat MySQL Data Transfer

Source Server         : test--app-聪兴
Source Server Version : 50719
Source Host           : 10.12.11.86:3306
Source Database       : dafy_shop

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-10-27 09:56:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_msg_push_client
-- ----------------------------
DROP TABLE IF EXISTS `t_msg_push_client`;
CREATE TABLE `t_msg_push_client` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '类型  1激光推送',
  `device_id` varchar(255) DEFAULT NULL COMMENT '设备Id',
  `push_id` varchar(255) DEFAULT NULL COMMENT '在第三方推送中心(如:激光推送)的唯一标识',
  `platform` varchar(50) DEFAULT NULL COMMENT '平台 安卓 ios ',
  `create_Time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `remark` varchar(255) DEFAULT NULL COMMENT '标记 userId 附加在最后',
  `update_Time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_deviceId_pushId` (`device_id`,`push_id`) USING BTREE COMMENT '设备id索引 '
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='记录推送的设备id,设备在激光的唯一标识';
