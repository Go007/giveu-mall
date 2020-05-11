/*
Navicat MySQL Data Transfer

Source Server         : test--app-聪兴
Source Server Version : 50719
Source Host           : 10.12.11.86:3306
Source Database       : dafy_shop

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-10-27 09:56:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_msg_read_record
-- ----------------------------
DROP TABLE IF EXISTS `t_msg_read_record`;
CREATE TABLE `t_msg_read_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `msg_no` varchar(50) DEFAULT NULL COMMENT '消息编号 业务编号',
  `mark_as_read` int(11) DEFAULT NULL COMMENT '0 未读 1 已读',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `read_time` bigint(20) DEFAULT NULL COMMENT '接受者阅读时间',
  `msg_del` int(11) DEFAULT NULL COMMENT '是否删除 0 未删除 1 已删除',
  PRIMARY KEY (`id`),
  KEY `uid_msgno_del` (`user_id`,`msg_no`,`msg_del`) USING BTREE COMMENT 'userId 和消息编号联合索引'
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COMMENT='系统消息表,存储消息已读记录';
