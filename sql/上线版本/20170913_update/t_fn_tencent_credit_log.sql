/*
Navicat MySQL Data Transfer

Source Server         : dafy_shop
Source Server Version : 50716
Source Host           : 10.12.11.185:3306
Source Database       : dafy_shop

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-09-13 16:36:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_fn_tencent_credit_log
-- ----------------------------
DROP TABLE IF EXISTS `t_fn_tencent_credit_log`;
CREATE TABLE `t_fn_tencent_credit_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(4) DEFAULT NULL COMMENT '我方类型：1:申请通过，2:申请拒绝，3:催收中,4:已还款,5,逾期,6:负面撤销',
  `identifier` varchar(50) DEFAULT NULL COMMENT '身份证',
  `sence_desc` varchar(50) DEFAULT NULL COMMENT '场景描述',
  `business` varchar(20) DEFAULT NULL COMMENT '业务类型id',
  `business_seq` varchar(100) DEFAULT NULL COMMENT '流水号',
  `status` varchar(10) DEFAULT NULL COMMENT '状态',
  `status_start_time` varchar(50) DEFAULT NULL COMMENT '状态开始时间',
  `status_amount` bigint(20) DEFAULT NULL COMMENT '状态金额，单位:分',
  `status_des` varchar(50) DEFAULT NULL COMMENT '状态描述',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `trans_start_time` varchar(50) DEFAULT NULL COMMENT '开户时间',
  `product_id` varchar(50) DEFAULT NULL COMMENT '产品标识',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `id_bisseq` (`identifier`,`business_seq`) USING BTREE COMMENT '身份证，业务流水'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
