/*
Navicat MySQL Data Transfer

Source Server         : 开发环境--dafy_shop
Source Server Version : 50719
Source Host           : 10.12.11.185:3306
Source Database       : dafy_shop

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-01-30 10:40:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_tencent_wechat_qq_post_log
-- ----------------------------
DROP TABLE IF EXISTS `t_tencent_wechat_qq_post_log`;
CREATE TABLE `t_tencent_wechat_qq_post_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `open_id` varchar(100) DEFAULT NULL COMMENT 'openId',
  `id_card` varchar(50) DEFAULT NULL COMMENT '身份证',
  `platform` varchar(10) DEFAULT NULL COMMENT '平台,微信、手Q',
  `deposit_limit` varchar(20) DEFAULT NULL COMMENT '额度,单位为分',
  `is_order` int(11) DEFAULT NULL COMMENT '是否下单，0 未下单 1已下单',
  `active_status` int(11) DEFAULT NULL COMMENT '激活状态',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_idx_uid_cert_no` (`open_id`,`id_card`) USING BTREE COMMENT 'openId和身份证索引'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='腾讯手Q，微信回传日志';
