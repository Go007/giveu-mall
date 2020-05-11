/*
Navicat MySQL Data Transfer

Source Server         : test--app-聪兴
Source Server Version : 50719
Source Host           : 10.12.11.86:3306
Source Database       : dafy_shop

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-10-27 09:56:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_msg_content
-- ----------------------------
DROP TABLE IF EXISTS `t_msg_content`;
CREATE TABLE `t_msg_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '消息内容表',
  `msg_no` varchar(50) DEFAULT NULL COMMENT '消息业务内容编号',
  `title` varchar(255) DEFAULT NULL COMMENT '消息标题',
  `content` varchar(500) DEFAULT NULL COMMENT '消息内容',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `msg_level` int(11) DEFAULT NULL COMMENT '消息级别：1：非常重要--存库-不存消息队列-同步发送2：重要--存库-存消息队列-异步发送3：一般重要--不存库-存消息队列-异步发送4：普通--不存库-不存消息队列-直接发送',
  `send_type` int(11) DEFAULT NULL COMMENT '发送类型 1 app推送 2 短信 3邮件 4站内消息',
  `redirect_url` varchar(255) DEFAULT NULL COMMENT '跳转地址',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(11) DEFAULT '1' COMMENT '0 禁用 1 启用',
  `type` int(11) DEFAULT NULL COMMENT '类型 1 简单内容 2 富文本内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `msg_no` (`msg_no`) USING BTREE COMMENT '消息编号 唯一'
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='消息内容表';
