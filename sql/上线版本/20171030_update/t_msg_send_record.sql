/*
Navicat MySQL Data Transfer

Source Server         : test--app-聪兴
Source Server Version : 50719
Source Host           : 10.12.11.86:3306
Source Database       : dafy_shop

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-10-27 09:59:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_msg_send_record
-- ----------------------------
DROP TABLE IF EXISTS `t_msg_send_record`;
CREATE TABLE `t_msg_send_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `send_user_id` bigint(20) DEFAULT NULL COMMENT '发送人user_id(用户表id) 0代表系统平台发送',
  `receive_user_id` bigint(20) DEFAULT NULL COMMENT '接收者id 接收者用户 id',
  `msg_no` varchar(50) DEFAULT NULL COMMENT '消息编号 业务编号',
  `mark_as_read` int(11) DEFAULT NULL COMMENT '标识:已读 1 未读 0',
  `msg_del` int(11) DEFAULT NULL COMMENT '0 未删除 1 已删除',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `push_time` bigint(20) DEFAULT NULL COMMENT '推送时间',
  `channel` int(11) DEFAULT NULL COMMENT '发送渠道 1 消息推送 2 短信 3 私信--站内信 4 邮件',
  `send_identify` varchar(255) DEFAULT NULL COMMENT '推送标识 App推送：存客户端registerId 短信：存号码 邮件推送：存邮件id',
  `scope` int(11) DEFAULT NULL COMMENT '消息范围 1 广播消息 2点对点消息',
  `level` int(11) DEFAULT NULL COMMENT '消息重要级别 1 非常重要 2重要',
  `status` int(11) DEFAULT NULL COMMENT '消息状态:1：已受理 2：已推送第三方 3：推送成功4：推送失败5：已通知6：通知成功7：通知失败',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `receive_platform` varchar(11) DEFAULT NULL COMMENT '指定接收 消息平台 Android iOS all',
  PRIMARY KEY (`id`),
  KEY `sen_del` (`send_user_id`,`msg_del`) USING BTREE COMMENT '发送索引',
  KEY `rec_sen_del` (`receive_user_id`,`send_user_id`,`msg_del`) USING BTREE COMMENT '接收索引'
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='点对点消息表，系统消息表';
