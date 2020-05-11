/*
Navicat MySQL Data Transfer

Source Server         : dafyshop-dev(10.12.11.185)
Source Server Version : 50719
Source Host           : 10.12.11.185:3306
Source Database       : dafy_shop

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-01-02 18:51:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_checking_call_traffic_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_checking_call_traffic_goods`;
CREATE TABLE `t_checking_call_traffic_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '供应商ID',
  `mobile` varchar(11) DEFAULT NULL COMMENT '电话号码',
  `order_no` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `serial_number` varchar(64) DEFAULT NULL,
  `third_serial_number` varchar(64) DEFAULT NULL COMMENT '第三方流水号',
  `supplier` int(11) DEFAULT NULL COMMENT '供应商类型：0 大汉，1 合赢',
  `supplier_status` varchar(16) DEFAULT NULL COMMENT '供应商状态',
  `status` int(11) DEFAULT NULL COMMENT '订单状态 0:订单创建成功，1：订单创建失败，2：订单交易成功，3：订单交易失败，4：订单预生成成功 ',
  `purchase_price` bigint(10) DEFAULT NULL COMMENT '采购价',
  `sale_price` bigint(10) DEFAULT NULL COMMENT '售价',
  `denomination` varchar(32) DEFAULT NULL COMMENT '面额',
  `create_time` bigint(20) DEFAULT NULL COMMENT ' 订单创建时间',
  `checking_date` bigint(20) DEFAULT NULL COMMENT '检查日期',
  PRIMARY KEY (`id`),
  KEY `idx_t_checking_call_traffic_goods_order_no` (`order_no`),
  KEY `idx_t_checking_call_traffic_goods_serial_number` (`serial_number`),
  KEY `idx_t_checking_call_traffic_goods_third_serial_number` (`third_serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='充值日志表';



/*
Navicat MySQL Data Transfer

Source Server         : dafyshop-dev(10.12.11.185)
Source Server Version : 50719
Source Host           : 10.12.11.185:3306
Source Database       : dafy_shop

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-01-02 18:51:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_checking_call_traffic_log
-- ----------------------------
DROP TABLE IF EXISTS `t_checking_call_traffic_log`;
CREATE TABLE `t_checking_call_traffic_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `checking_date` bigint(20) NOT NULL COMMENT '检查日期',
  `supplier_type` int(11) NOT NULL COMMENT '供应商类型',
  `serial_number` varchar(64) DEFAULT NULL COMMENT '商品流水号',
  `third_serial_number` varchar(64) DEFAULT NULL COMMENT '供应商流水',
  `order_number` varchar(64) DEFAULT NULL COMMENT '订单号',
  `goods_with_supplier_status` varchar(32) NOT NULL COMMENT '商品流水 -> 供应商订单 状态',
  `goods_with_order_status` varchar(32) NOT NULL COMMENT '即有订单 -> 商品流水 状态',
  `status` varchar(32) NOT NULL COMMENT '总状态',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `last_modify` bigint(20) NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_t_checking_call_traffic_log_serial_number` (`serial_number`),
  KEY `idx_t_checking_call_traffic_log_third_serial_number` (`third_serial_number`),
  KEY `idx_t_checking_call_traffic_log_order_number` (`order_number`),
  KEY `idx_t_checking_call_traffic_log_checking_date` (`checking_date`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;



/*
Navicat MySQL Data Transfer

Source Server         : dafyshop-dev(10.12.11.185)
Source Server Version : 50719
Source Host           : 10.12.11.185:3306
Source Database       : dafy_shop

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-01-02 18:51:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_checking_call_traffic_order
-- ----------------------------
DROP TABLE IF EXISTS `t_checking_call_traffic_order`;
CREATE TABLE `t_checking_call_traffic_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '供应商ID',
  `mobile` varchar(11) DEFAULT NULL COMMENT '电话号码',
  `order_no` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `serial_number` varchar(64) DEFAULT NULL,
  `goods_status` varchar(16) DEFAULT NULL COMMENT '订单状态 0:订单创建成功，1：订单创建失败，2：订单交易成功，3：订单交易失败，4：订单预生成成功',
  `status` int(11) DEFAULT NULL COMMENT '订单状态',
  `supplier` int(11) DEFAULT NULL COMMENT '供应商类型：0 大汉，1 合赢',
  `purchase_price` bigint(10) DEFAULT NULL COMMENT '采购价',
  `sale_price` bigint(10) DEFAULT NULL COMMENT '售价',
  `create_time` bigint(20) DEFAULT NULL COMMENT '订单创建时间',
  `checking_date` bigint(20) DEFAULT NULL COMMENT '检查日期',
  PRIMARY KEY (`id`),
  KEY `idx_t_goods_call_traffic_log_order_no` (`order_no`),
  KEY `idx_t_goods_call_traffic_log_serial_number` (`serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='充值日志表';



/*
Navicat MySQL Data Transfer

Source Server         : dafyshop-dev(10.12.11.185)
Source Server Version : 50719
Source Host           : 10.12.11.185:3306
Source Database       : dafy_shop

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-01-02 18:51:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_checking_call_traffic_supplier
-- ----------------------------
DROP TABLE IF EXISTS `t_checking_call_traffic_supplier`;
CREATE TABLE `t_checking_call_traffic_supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `third_serial_number` varchar(64) DEFAULT NULL COMMENT '供应商流水',
  `serial_number` varchar(64) DEFAULT NULL COMMENT '商品订单流水号',
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '供应商ID',
  `denomination` varchar(64) DEFAULT NULL COMMENT '面额',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `cost_money` varchar(32) DEFAULT NULL COMMENT '进货价',
  `status` varchar(16) DEFAULT NULL COMMENT '供应商状态',
  `supplier_type` int(11) DEFAULT NULL COMMENT '供应商类型',
  `goods_status` int(11) DEFAULT NULL COMMENT '转换后的状态',
  `create_time` bigint(20) DEFAULT NULL COMMENT '订单创建时间',
  `checking_date` bigint(20) DEFAULT NULL COMMENT '检查日期',
  PRIMARY KEY (`id`),
  KEY `idx_t_checking_call_traffic_supplier_third_serial_number` (`third_serial_number`),
  KEY `idx_t_checking_call_traffic_supplier_serial_number` (`serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


