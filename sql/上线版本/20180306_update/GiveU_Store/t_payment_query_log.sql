/*
Navicat MySQL Data Transfer

Source Server         : 开发环境--dafy_shop
Source Server Version : 50719
Source Host           : 10.12.11.185:3306
Source Database       : dafy_shop

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-01-31 17:44:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_payment_query_log
-- ----------------------------
DROP TABLE IF EXISTS `t_payment_query_log`;
CREATE TABLE `t_payment_query_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pay_id` varchar(50) DEFAULT NULL COMMENT '支付id',
  `source` varchar(20) DEFAULT NULL COMMENT '来源 安卓 ios',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `status` int(11) DEFAULT NULL COMMENT '状态 1启用 0禁用',
  `req_pay_status` varchar(20) DEFAULT NULL COMMENT '支付请求状态',
  `res_pay_status` varchar(20) DEFAULT NULL COMMENT '响应状态',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `pay_type` varchar(20) DEFAULT NULL COMMENT '类型:支付宝：alipay，微信:wechatpay,qq支付：qqpay,京东：jdpay',
  PRIMARY KEY (`id`),
  KEY `t_idx_payid` (`pay_id`) USING BTREE COMMENT '支付id索引'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='支付查询日志表';
