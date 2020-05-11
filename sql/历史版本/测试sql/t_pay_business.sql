/*
Navicat MySQL Data Transfer

Source Server         : 10.10.11.140_8066
Source Server Version : 50629
Source Host           : 10.10.11.140:8066
Source Database       : TESTDB

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2017-07-12 16:52:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_pay_business
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_business`;
CREATE TABLE `t_pay_business` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '编码',
  `secret_key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密钥',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='支付业务接入';

-- ----------------------------
-- Records of t_pay_business
-- ----------------------------

-- ----------------------------
-- Table structure for t_pay_channel
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_channel`;
CREATE TABLE `t_pay_channel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `channel_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '支付渠道',
  `channel_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道名称',
  `source` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '来源：Android;IOS;PC;H5等',
  `orders` int(11) NOT NULL COMMENT '展示顺序,排序显示',
  `status` int(11) NOT NULL COMMENT '状态：0无效；1有效',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '详细描述',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_pay_channel
-- ----------------------------
INSERT INTO `t_pay_channel` VALUES ('2', 'WECHAT_APP', '微信支付', 'IOS', '4', '1', '微信支付', '20170421161612', '20170421161614');
INSERT INTO `t_pay_channel` VALUES ('3', 'ALIPAY_APP', '支付宝支付', 'IOS', '2', '1', '支付宝支付', '20170421161631', '20170421161633');
INSERT INTO `t_pay_channel` VALUES ('4', 'ALIPAY_APP', '支付宝支付', 'ANDROID', '0', '1', '', '20170421161650', '20170421161652');
INSERT INTO `t_pay_channel` VALUES ('5', 'ALIPAY_WEB', '支付宝', 'PC', '0', '1', 'pc端支付', '20170421161650', '20170421161650');
INSERT INTO `t_pay_channel` VALUES ('6', 'ALIPAY_WAP', '支付宝', 'H5', '0', '1', 'H5支付', '20170421161650', '20170421161650');
INSERT INTO `t_pay_channel` VALUES ('7', 'WECHAT_APP', '微信支付', 'ANDROID', '1', '1', '微信支付', '20170421161650', '20170421161650');

-- ----------------------------
-- Table structure for t_pay_payment
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_payment`;
CREATE TABLE `t_pay_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `pay_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '支付Id',
  `order_no` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务订单号',
  `order_amt` bigint(11) DEFAULT NULL COMMENT '订单金额(分)',
  `channel_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付渠道类型,扫码支付，公众号支付等',
  `third_trade_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方交易号',
  `source` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '来源 Android ios pc',
  `biz_type` int(11) DEFAULT NULL COMMENT '业务类型 具体哪个业务系统的支付 1、购物 2还款',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `client_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户端ip',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `status` int(11) DEFAULT NULL COMMENT '状态：0 等待付款，1：支付成功',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `trade_time` bigint(20) DEFAULT NULL COMMENT '交易时间',
  `retry_count` int(6) DEFAULT NULL COMMENT '重试次数',
  `extraData` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '附加数据扩展',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pay_id` (`pay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_pay_payment
-- ----------------------------
INSERT INTO `t_pay_payment` VALUES ('1', '08201707010000021359', '02201707010000009233', '1', 'WECHAT_JSAPI', null, 'Android', '1', '123', '121.34.253.189', '订单支付', '0', '1498901929995', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('2', '08201707030000016396', 'JD0009010', '1', 'WECHAT_APP', null, 'IOS', '4', '1', '121.34.253.189', 'remark001', '0', '1499078829511', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('3', '08201707030000016397', 'JD0009011', '1', 'WECHAT_APP', null, 'IOS', '4', '1', '121.34.253.189', 'remark001', '0', '1499079289697', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('4', '08201707030000016398', 'JD0009012', '1', 'WECHAT_APP', null, 'IOS', '4', '1', '121.34.253.189', 'remark001', '0', '1499080971785', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('5', '08201707030000016410', 'JD0009013', '1', 'WECHAT_APP', null, 'Android', '1', '123', '121.34.253.189', '订单支付', '0', '1499084716761', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('6', '08201707030000016412', 'JD0009013', '1', 'ALIPAY_APP', null, 'APP', '1', '123', '121.34.253.189', '订单支付', '0', '1499084726839', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('7', '08201707030000016417', 'JD0009013', '1', 'WECHAT_JSAPI', null, 'Android', '1', '123', '121.34.253.189', '订单支付', '0', '1499085142017', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('8', '08201707030000016418', 'JD0009013', '1', 'WECHAT_JSAPI', null, 'Android', '1', '123', '121.34.253.189', '订单支付', '0', '1499085170870', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('9', '08201707030000016419', 'JD0009013', '1', 'WECHAT_JSAPI', null, 'Android', '1', '123', '121.34.253.189', '订单支付', '0', '1499085216563', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('10', '08201707030000016420', 'JD0009013', '1', 'WECHAT_JSAPI', null, 'Android', '1', '123', '121.34.253.189', '订单支付', '0', '1499085248297', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('11', '08201707030000016421', 'JD0009013', '1', 'WECHAT_JSAPI', null, 'Android', '1', '123', '121.34.253.189', '订单支付', '0', '1499085289771', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('12', '08201707030000016422', 'JD0009013', '1', 'WECHAT_JSAPI', null, 'Android', '1', '123', '121.34.253.189', '订单支付', '0', '1499086268355', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('13', '08201707030000016423', 'JD0009013', '1', 'WECHAT_JSAPI', '4006722001201707038748606676', 'Android', '1', '123', '121.34.253.189', '订单支付', '1', '1499086686576', '1499086692000', null, null);
INSERT INTO `t_pay_payment` VALUES ('14', '08201707040000022317', '02201707040000013215', '1', 'WECHAT_JSAPI', null, 'Android', '1', '123', '121.34.253.189', '订单支付', '0', '1499173506806', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('15', '08201707040000022318', '02201707040000013215', '1', 'WECHAT_JSAPI', null, 'Android', '1', '123', '121.34.253.189', '订单支付', '0', '1499173529891', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('16', '08201707040000022319', '02201707040000013215', '1', 'WECHAT_JSAPI', null, 'Android', '1', '123', '121.34.253.189', '订单支付', '0', '1499173656987', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('17', '08201707040000022320', '02201707040000013215', '1', 'WECHAT_JSAPI', null, 'Android', '1', '123', '121.34.253.189', '订单支付', '0', '1499173659379', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('18', '08201707040000022322', '02201707040000013216', '1', 'WECHAT_JSAPI', null, 'Android', '1', '123', '121.34.253.189', '订单支付', '0', '1499174216377', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('19', '08201707040000022323', '02201707040000013221', '1', 'WECHAT_JSAPI', '4006722001201707048915177960', 'Android', '1', '123', '121.34.253.189', '订单支付', '1', '1499174349531', '1499174397000', null, null);
INSERT INTO `t_pay_payment` VALUES ('20', '08201707050000023318', '02201707050000014217', '1', 'WECHAT_JSAPI', '4006722001201707058968235465', 'Android', '1', '123', '121.34.253.189', '订单支付', '1', '1499219438105', '1499219444000', null, null);
INSERT INTO `t_pay_payment` VALUES ('21', '08201707050000024319', '02201707050000015217', '1', 'WECHAT_JSAPI', null, 'Android', '1', '123', '121.34.253.189', '订单支付', '0', '1499219897778', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('22', '08201707050000024320', '02201707050000015219', '1', 'WECHAT_JSAPI', '4006722001201707058976592335', 'Android', '1', '123', '121.34.253.189', '订单支付', '1', '1499220946053', '1499220951000', null, null);
INSERT INTO `t_pay_payment` VALUES ('23', '08201707050000025320', '02201707050000016218', '1', 'WECHAT_JSAPI', '4006722001201707058975558513', 'Android', '1', '123', '121.34.253.189', '订单支付', '1', '1499221700003', '1499221706000', null, null);
INSERT INTO `t_pay_payment` VALUES ('24', '08201707050000025321', '02201707050000016218', '1', 'WECHAT_JSAPI', '4006722001201707058975676928', 'Android', '1', '123', '121.34.253.189', '订单支付', '1', '1499221836757', '1499221842000', null, null);
INSERT INTO `t_pay_payment` VALUES ('25', '08201707050000025322', '02201707050000016218', '1', 'WECHAT_JSAPI', null, 'Android', '1', '123', '121.34.253.189', '订单支付', '0', '1499221866699', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('26', '08201707050000025323', '02201707050000016218', '1', 'WECHAT_JSAPI', null, 'Android', '1', '123', '121.34.253.189', '订单支付', '0', '1499221882295', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('27', '08201707050000026321', '02201707050000017218', '1', 'WECHAT_JSAPI', '4006722001201707058989404299', 'Android', '1', '123', '121.34.253.189', '订单支付', '1', '1499226179147', '1499226183000', null, null);
INSERT INTO `t_pay_payment` VALUES ('28', '08201707050000026322', '02201707050000017219', '1', 'WECHAT_JSAPI', '4006722001201707058988120308', 'Android', '1', '123', '121.34.253.189', '订单支付', '1', '1499226429153', '1499226433000', null, null);
INSERT INTO `t_pay_payment` VALUES ('29', '08201707050000027322', '02201707050000018223', '1', 'WECHAT_JSAPI', null, 'Android', '1', '123', '121.34.253.189', '订单支付', '0', '1499235493127', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('30', '08201707050000027323', '02201707050000018225', '1', 'WECHAT_JSAPI', null, 'Android', '1', '123', '121.34.253.189', '订单支付', '0', '1499235596892', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('31', '08201707050000027324', '02201707050000018225', '1', 'WECHAT_JSAPI', '4006722001201707059013809469', 'Android', '1', '123', '121.34.253.189', '订单支付', '1', '1499235598752', '1499235604000', null, null);
INSERT INTO `t_pay_payment` VALUES ('32', '08201707050000028323', '02201707050000019221', '1', 'WECHAT_JSAPI', '4006722001201707059024167587', 'Android', '1', '123', '121.34.253.189', '订单支付', '1', '1499241629165', '1499241654000', null, null);
INSERT INTO `t_pay_payment` VALUES ('33', '08201707060000016426', 'RP00014146', '100', 'WECHAT_APP', null, 'Android', '2', '11413705', '192.168.31.1', null, '0', '1499323440509', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('34', '08201707060000016427', 'RP00014147', '100', 'WECHAT_APP', null, 'Android', '2', '11413705', '192.168.31.1', null, '0', '1499323446891', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('35', '08201707060000029324', 'RP00022024', '100', 'WECHAT_APP', null, 'Android', '2', '11413705', '192.168.31.1', null, '0', '1499324255496', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('36', '08201707060000029325', 'RP00022025', '100', 'WECHAT_APP', null, 'Android', '2', '11413705', '192.168.31.1', null, '0', '1499324267153', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('37', '08201707060000030339', 'JD0010017', '1', 'WECHAT_APP', null, 'android', '3', '10103773', '10.10.73.76', '50元', '0', '1499330420991', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('38', '08201707060000030340', 'JD0010018', '1', 'WECHAT_APP', null, 'android', '3', '10103773', '10.10.73.76', '50元', '0', '1499330601756', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('39', '08201707070000031327', 'RP00023025', '100', 'WECHAT_APP', null, 'Android', '2', '10103773', '192.168.31.1', null, '0', '1499421273087', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('40', '08201707070000031328', 'RP00023026', '100', 'WECHAT_APP', null, 'Android', '2', '10103773', '192.168.31.1', null, '0', '1499421457741', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('41', '08201707070000031329', 'RP00023028', '100', 'WECHAT_APP', null, 'Android', '2', '10103773', '192.168.31.1', null, '0', '1499421547550', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('42', '08201707070000031330', 'RP00023029', '100', 'WECHAT_APP', null, 'Android', '2', '10103773', '192.168.31.1', null, '0', '1499421563470', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('43', '08201707070000031331', 'RP00023030', '100', 'WECHAT_APP', null, 'Android', '2', '10103773', '192.168.31.1', null, '0', '1499421605098', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('44', '08201707070000031332', 'RP00023033', '1267', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499421730134', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('45', '08201707070000031333', 'RP00023034', '1267', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499421764245', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('46', '08201707070000031334', 'RP00023036', '100', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499421807792', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('47', '08201707070000031335', 'RP00023037', '100', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499421913566', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('48', '08201707070000031337', 'RP00023039', '1267', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499422037779', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('49', '08201707070000031336', 'RP00023038', '1267', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499422037784', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('50', '08201707070000031338', 'RP00023040', '1267', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499422038805', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('51', '08201707070000031339', 'RP00023041', '1267', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499422446156', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('52', '08201707070000031341', 'RP00023043', '1267', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499422655031', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('53', '08201707070000031340', 'RP00023042', '1267', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499422655038', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('54', '08201707070000031342', 'RP00023044', '1267', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499422655728', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('55', '08201707080000016428', 'RP00014148', '1000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499499484054', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('56', '08201707080000016429', 'RP00014149', '1000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499499534363', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('57', '08201707080000016430', 'RP00014150', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499503537131', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('58', '08201707080000016431', 'RP00014151', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499503727392', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('59', '08201707080000031343', 'JD0011043', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499503737392', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('60', '08201707080000031344', 'JD0011043', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499503737389', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('61', '08201707080000016432', 'RP00014152', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499503833173', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('62', '08201707080000016433', 'RP00014153', '20000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499503955087', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('63', '08201707080000031345', 'JD0011044', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499504228069', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('64', '08201707080000031346', 'JD0011044', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499504228131', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('65', '08201707080000031347', 'JD0011045', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499504323459', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('66', '08201707080000031348', 'JD0011046', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499504364847', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('67', '08201707080000031349', 'JD0011047', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499504628208', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('68', '08201707080000016434', 'RP00014154', '20000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499504630991', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('69', '08201707080000031350', 'JD0011048', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499504949012', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('70', '08201707080000031351', 'JD0011049', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499505002621', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('71', '08201707080000031352', 'JD0011051', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499505300126', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('72', '08201707080000031353', 'JD0011053', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499505451860', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('73', '08201707080000031354', 'JD0011053', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499505451842', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('74', '08201707080000031355', 'JD0011054', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499505991996', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('75', '08201707080000031356', 'JD0011055', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499506191737', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('76', '08201707080000031357', 'JD0011056', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499506545060', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('77', '08201707080000016435', 'RP00014155', '20000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499506631445', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('78', '08201707080000031358', 'JD0011057', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499506666197', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('79', '08201707080000031359', 'JD0011057', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499506666244', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('80', '08201707080000031360', 'JD0011058', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499506812725', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('81', '08201707080000031361', 'JD0011058', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499506812762', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('82', '08201707080000031362', 'JD0011059', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499507445359', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('83', '08201707080000016436', 'RP00014156', '20000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499507544892', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('84', '08201707080000031363', 'JD0011060', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499507580173', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('85', '08201707080000031364', 'JD0011060', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499507580180', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('86', '08201707080000031365', 'JD0011061', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499507807863', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('87', '08201707080000031366', 'JD0011062', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499508029633', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('88', '08201707080000032329', 'APP_TEST123456712116778589', '1', 'WECHAT_APP', null, 'IOS', '1', '1', '121.34.253.189', 'remark001', '0', '1499508097511', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('89', '08201707080000031367', 'JD0011063', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499508332393', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('90', '08201707080000016437', 'RP00014157', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499509035249', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('91', '08201707080000031368', 'JD0011067', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499509259336', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('92', '08201707080000031369', 'JD0011067', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499509259336', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('93', '08201707080000031370', 'JD0011068', '990', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499509465059', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('94', '08201707080000016438', 'RP00014158', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499509660928', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('95', '08201707080000016439', 'RP00014159', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499509817552', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('96', '08201707100000031371', 'RP00023045', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499653595379', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('97', '08201707100000031372', 'JD0011092', '990', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '20元', '0', '1499653750319', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('98', '08201707100000031373', 'JD0011092', '990', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '20元', '0', '1499653750650', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('99', '08201707100000031375', 'JD0011093', '990', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '20元', '0', '1499653828068', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('100', '08201707100000031374', 'JD0011093', '990', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '20元', '0', '1499653828232', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('101', '08201707100000031376', 'RP00023046', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499653945796', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('102', '08201707100000031377', 'RP00023049', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499654459481', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('103', '08201707100000031378', 'RP00023050', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499654579379', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('104', '08201707100000031379', 'JD0011096', '990', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '30元', '0', '1499654581921', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('105', '08201707100000031380', 'RP00023060', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499654882784', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('106', '08201707100000031381', 'RP00023061', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499654898891', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('107', '08201707100000031382', 'JD0011096', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '30元', '0', '1499655052439', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('108', '08201707100000031383', 'JD0011096', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '30元', '0', '1499655052720', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('109', '08201707100000031384', 'RP00023062', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499655269511', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('110', '08201707100000031385', 'RP00023064', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499655492961', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('111', '08201707100000031386', 'JD0011097', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '20元', '0', '1499655581659', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('112', '08201707100000031387', 'JD0011097', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '20元', '0', '1499655602754', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('113', '08201707100000031388', 'RP00023065', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499656325845', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('114', '08201707100000031389', 'RP00023066', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499656565542', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('115', '08201707100000031390', 'RP00023067', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499656697622', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('116', '08201707100000031392', 'RP00023069', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499656823756', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('117', '08201707100000031391', 'RP00023068', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499656823760', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('118', '08201707100000031393', 'RP00023070', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499656828298', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('119', '08201707100000031394', 'JD0011101', '1', 'ALIPAY_APP', null, null, '3', '10103773', '10.10.71.162', '200M流量', '0', '1499656846884', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('120', '08201707100000031395', 'RP00023071', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499657362793', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('121', '08201707100000031396', 'RP00023072', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499657545673', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('122', '08201707100000031397', 'RP00023073', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499657968938', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('123', '08201707100000031398', 'RP00023074', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499657968947', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('124', '08201707100000031399', 'RP00023075', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499658066410', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('125', '08201707100000031400', 'RP00023076', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499658416957', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('126', '08201707100000031402', 'RP00023080', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.0.2.15', null, '0', '1499665548592', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('127', '08201707100000033328', 'APP_TEST12345671211677858912', '1', 'WECHAT_APP', null, 'IOS', '1', '1', '121.34.253.189', 'remark001', '0', '1499665715070', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('128', '08201707100000031403', 'RP00023081', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.0.2.15', null, '0', '1499665741441', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('129', '08201707100000031404', 'RP00023082', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499666072217', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('130', '08201707100000031405', 'RP00023083', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.0.2.15', null, '0', '1499667279356', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('131', '08201707100000031406', 'JD0011109', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '10M流量', '0', '1499667641293', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('132', '08201707100000031408', 'RP00023085', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499667820736', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('133', '08201707100000031407', 'RP00023084', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499667820741', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('134', '08201707100000031409', 'RP00023086', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499667821706', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('135', '08201707100000031410', 'JD0011111', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '100M流量', '0', '1499668235594', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('136', '08201707100000031411', 'RP00023087', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499668306847', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('137', '08201707100000031412', 'JD0011113', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '30元', '0', '1499668742429', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('138', '08201707100000031413', 'JD0011114', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '30元', '0', '1499669467316', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('139', '08201707100000031414', 'RP00023090', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.0.2.15', null, '0', '1499669758238', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('140', '08201707100000031415', 'RP00023091', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.0.2.15', null, '0', '1499669761099', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('141', '08201707100000016440', 'RP00014160', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499669826237', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('142', '08201707100000031416', 'RP00023092', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.0.2.15', null, '0', '1499669841947', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('143', '08201707100000031417', 'RP00023093', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.0.2.15', null, '0', '1499669845613', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('144', '08201707100000016441', 'RP00014161', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499669849372', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('145', '08201707100000016442', 'RP00014162', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499670011207', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('146', '08201707100000016443', 'RP00014163', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499670020551', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('147', '08201707100000031418', 'RP00023094', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.0.2.15', null, '0', '1499670510184', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('148', '08201707100000034330', 'APP_TEST12345671211677858912', '1', 'WECHAT_APP', null, 'IOS', '1', '1', '121.34.253.189', 'remark001', '0', '1499670692389', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('149', '08201707100000016444', 'RP00014164', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499671097289', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('150', '08201707100000034331', 'APP_TEST12345671211677858912', '1', 'WECHAT_APP', null, 'IOS', '1', '1', '121.34.253.189', 'remark001', '0', '1499671253225', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('151', '08201707100000016445', 'RP00014165', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499671413762', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('152', '08201707100000016446', 'RP00014168', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499671575981', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('153', '08201707100000016447', 'RP00014170', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499671634848', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('154', '08201707100000016448', 'RP00014171', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499671647867', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('155', '08201707100000016449', 'RP00014173', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499671725505', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('156', '08201707100000034332', 'APP_TEST123456712116778589124', '1', 'WECHAT_APP', null, 'IOS', '1', '1', '121.34.253.189', 'remark001', '0', '1499671771235', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('157', '08201707100000016450', 'RP00014174', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499671817047', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('158', '08201707100000016451', 'RP00014175', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499672385515', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('159', '08201707100000034333', 'JSAPI_TEST123456712116778589124', '1', 'WECHAT_JSAPI', null, 'IOS', '1', '1', '121.34.253.189', 'remark001', '0', '1499676491405', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('160', '08201707100000016452', 'RP00014176', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499676909697', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('161', '08201707100000016453', 'RP00014178', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499676977298', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('162', '08201707100000031419', 'RP00023099', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499677058143', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('163', '08201707100000031420', 'RP00023100', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499677058148', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('164', '08201707100000031421', 'RP00023101', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499677058237', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('165', '08201707100000016454', 'RP00014179', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499677144572', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('166', '08201707100000031423', 'RP00023103', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.0.2.15', null, '0', '1499678665654', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('167', '08201707100000031422', 'RP00023102', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.0.2.15', null, '0', '1499678665659', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('168', '08201707100000031424', 'RP00023104', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.0.2.15', null, '0', '1499678671978', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('169', '08201707100000016455', 'RP00014180', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499679201288', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('170', '08201707100000016456', 'RP00014182', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499679231871', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('171', '08201707100000031425', 'RP00023106', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.0.2.15', null, '0', '1499679517308', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('172', '08201707100000031426', 'RP00023107', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.0.2.15', null, '0', '1499679579718', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('173', '08201707100000031427', 'RP00023108', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.0.2.15', null, '0', '1499679709349', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('174', '08201707100000031428', 'RP00023109', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.0.2.15', null, '0', '1499679711419', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('175', '08201707100000031430', 'JD0011143', '1', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499682493187', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('176', '08201707100000031429', 'JD0011143', '1', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499682493187', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('177', '08201707100000031431', 'JD0011145', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '50元', '0', '1499683862690', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('178', '08201707100000031433', 'JD0011146', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '50元', '0', '1499684105519', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('179', '08201707100000031432', 'JD0011146', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '50元', '0', '1499684105504', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('180', '08201707100000031434', 'JD0011146', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '50元', '0', '1499684188460', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('181', '08201707100000031435', 'JD0011146', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '50元', '0', '1499684259819', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('182', '08201707100000031436', 'JD0011147', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '20元', '0', '1499684715958', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('183', '08201707100000031437', 'JD0011148', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '30元', '0', '1499685001882', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('184', '08201707100000031438', 'JD0011149', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '50M流量', '0', '1499685607223', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('185', '08201707100000031439', 'JD0011150', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '200M流量', '0', '1499685844326', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('186', '08201707100000031440', 'JD0011150', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '200M流量', '0', '1499685844372', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('187', '08201707100000031441', 'JD0011151', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '5M流量', '0', '1499686002652', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('188', '08201707100000031442', 'JD0011151', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '5M流量', '0', '1499686053255', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('189', '08201707100000031443', 'JD0011152', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '20元', '0', '1499686178493', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('190', '08201707100000031444', 'JD0011152', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '20元', '0', '1499686193825', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('191', '08201707100000031445', 'JD0011153', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '50元', '0', '1499686425373', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('192', '08201707100000031446', 'JD0011154', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '500M流量', '0', '1499686969536', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('193', '08201707100000031447', 'JD0011154', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '500M流量', '0', '1499686999047', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('194', '08201707100000031448', 'JD0011154', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '500M流量', '0', '1499687019564', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('195', '08201707100000031449', 'JD0011154', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '500M流量', '0', '1499687036550', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('196', '08201707100000031450', 'JD0011154', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '500M流量', '0', '1499687067474', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('197', '08201707100000031451', 'JD0011155', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '50M流量', '0', '1499687496076', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('198', '08201707100000031452', 'JD0011155', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '50M流量', '0', '1499687505255', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('199', '08201707100000031453', 'JD0011155', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '50M流量', '0', '1499687512993', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('200', '08201707100000031454', 'JD0011156', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '30元', '0', '1499688007915', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('201', '08201707100000031455', 'JD0011156', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '30元', '0', '1499688089176', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('202', '08201707100000031456', 'JD0011156', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '30元', '0', '1499688089315', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('203', '08201707100000016457', 'RP00014183', '10000', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499688503795', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('204', '08201707100000031457', 'JD0011159', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '200M流量', '0', '1499690969221', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('205', '08201707100000031458', 'JD0011160', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '50元', '0', '1499691035664', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('206', '08201707100000031459', 'JD0011161', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '50元', '0', '1499691171666', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('207', '08201707100000031460', 'JD0011161', '1', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '50元', '0', '1499691171731', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('208', '08201707100000016470', 'RP00014204', '1', 'WECHAT_APP', null, 'Android', '2', '10103773', '10.10.73.77', null, '0', '1499692109061', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('209', '08201707100000016471', 'RP00014205', '1', 'WECHAT_APP', null, 'Android', '2', '10103773', '10.10.73.77', null, '0', '1499692123598', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('210', '08201707100000016472', 'RP00014206', '1', 'WECHAT_APP', null, 'Android', '2', '10103773', '10.10.73.77', null, '0', '1499692201073', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('211', '08201707110000031461', 'JD0011162', '1', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499735710915', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('212', '08201707110000031462', 'JD0011163', '1', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499736211184', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('213', '08201707110000031463', 'JD0011164', '1', 'WECHAT_APP', null, null, '3', '11413713', '10.10.82.87', '10元', '0', '1499736391150', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('214', '08201707110000031466', 'RP00023124', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499737210507', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('215', '08201707110000031467', 'RP00023125', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.0.2.15', null, '0', '1499737215578', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('216', '08201707110000031468', 'RP00023126', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499737305333', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('217', '08201707110000031469', 'RP00023127', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.0.2.15', null, '0', '1499737700134', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('218', '08201707110000031470', 'RP00023128', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499737960779', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('219', '08201707110000031471', 'RP00023129', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.0.2.15', null, '0', '1499737960810', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('220', '08201707110000031472', 'RP00023130', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.0.2.15', null, '0', '1499737961038', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('221', '08201707110000031473', 'RP00023131', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499737964080', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('222', '08201707110000031474', 'RP00023135', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '127.0.0.1', null, '0', '1499738150974', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('223', '08201707110000031476', 'RP00023137', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.10.82.87', null, '0', '1499738434208', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('224', '08201707110000031475', 'RP00023136', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.10.82.87', null, '0', '1499738434381', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('225', '08201707110000031477', 'RP00023138', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.10.82.87', null, '0', '1499738487714', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('226', '08201707110000031478', 'RP00023139', '1', 'WECHAT_APP', null, 'Android', '2', '10103773', '10.10.73.77', null, '0', '1499738492724', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('227', '08201707110000031479', 'RP00023141', '1', 'WECHAT_APP', null, 'Android', '2', '10103773', '10.10.73.77', null, '0', '1499738558567', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('228', '08201707110000031480', 'RP00023143', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499739043846', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('229', '08201707110000031481', 'RP00023144', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499739193975', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('230', '08201707110000031482', 'RP00023146', '1', 'WECHAT_APP', null, 'Android', '2', '10103773', '10.10.73.77', null, '0', '1499739246047', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('231', '08201707110000031483', 'RP00023148', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499739308060', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('232', '08201707110000031484', 'RP00023149', '1', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499739391643', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('233', '08201707110000031485', 'JD0011167', '990', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '1G流量', '0', '1499740473477', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('234', '08201707110000031486', 'RP00023150', '6', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499740828038', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('235', '08201707110000031487', 'RP00023155', '5', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.10.82.87', null, '0', '1499741175388', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('236', '08201707110000031488', 'JD0011168', '990', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '30元', '0', '1499741242044', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('237', '08201707110000031489', 'RP00023165', '6', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499741588979', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('238', '08201707110000031490', 'RP00023166', '6', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499742174236', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('239', '08201707110000031491', 'RP00023167', '6', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499742244499', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('240', '08201707110000031492', 'RP00023173', '6', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499742360652', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('241', '08201707110000031493', 'RP00023174', '6', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499742360664', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('242', '08201707110000031494', 'RP00023175', '6', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499742361234', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('243', '08201707110000031495', 'RP00023176', '6', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499742474903', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('244', '08201707110000031496', 'RP00023177', '6', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499742474908', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('245', '08201707110000031497', 'RP00023178', '6', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499742475963', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('246', '08201707110000031498', 'JD0011169', '990', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '50元', '0', '1499742518976', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('247', '08201707110000031499', 'JD0011169', '990', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '50元', '0', '1499742547100', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('248', '08201707110000031500', 'RP00023193', '6', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499742608484', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('249', '08201707110000031501', 'RP00023201', '6', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499742744294', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('250', '08201707110000031502', 'RP00023202', '6', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499742744473', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('251', '08201707110000031503', 'RP00023203', '6', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499742745141', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('252', '08201707110000031504', 'RP00023205', '6', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499742904751', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('253', '08201707110000031505', 'JD0011171', '990', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '20元', '0', '1499743149010', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('254', '08201707110000031506', 'JD0011171', '990', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '20元', '0', '1499743149207', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('255', '08201707110000031507', 'JD0011171', '990', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '20元', '0', '1499743168545', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('256', '08201707110000031508', 'RP00023206', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.10.82.87', null, '0', '1499743274037', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('257', '08201707110000031509', 'JD0011173', '990', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '30元', '0', '1499743797467', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('258', '08201707110000016473', 'RP00014208', '1', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.1.1', null, '0', '1499744026949', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('259', '08201707110000031510', 'RP00023207', '148326', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.10.82.87', null, '0', '1499744111499', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('260', '08201707110000031511', 'RP00023220', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.10.82.87', null, '0', '1499744172235', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('261', '08201707110000031513', 'RP00023223', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.10.82.87', null, '0', '1499744250228', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('262', '08201707110000031512', 'RP00023222', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.10.82.87', null, '0', '1499744250233', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('263', '08201707110000031514', 'RP00023224', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.10.82.87', null, '0', '1499744253536', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('264', '08201707110000031515', 'RP00023225', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.10.82.87', null, '0', '1499744355245', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('265', '08201707110000031516', 'RP00023227', '1', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.10.82.87', null, '0', '1499744446217', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('266', '08201707110000016474', 'RP00014211', '1', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.1.1', null, '0', '1499744540685', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('267', '08201707110000031517', 'RP00023228', '5', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.10.82.87', null, '0', '1499744753081', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('268', '08201707110000016475', 'RP00014212', '1', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.1.1', null, '0', '1499744830460', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('269', '08201707110000016476', 'RP00014213', '1', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.1.1', null, '0', '1499744856196', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('270', '08201707110000031519', 'RP00023230', '148326', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.10.82.87', null, '0', '1499744971245', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('271', '08201707110000031518', 'RP00023229', '148326', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.10.82.87', null, '0', '1499744971254', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('272', '08201707110000031520', 'RP00023231', '148326', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.10.82.87', null, '0', '1499744977082', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('273', '08201707110000031521', 'RP00023234', '10', 'WECHAT_APP', null, 'Android', '2', '11413713', '10.10.82.87', null, '0', '1499745037878', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('274', '08201707110000031522', 'RP00023235', '6', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499753392486', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('275', '08201707110000031523', 'JD0011182', '990', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '50元', '0', '1499753803567', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('276', '08201707110000031524', 'RP00023237', '100', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499754088986', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('277', '08201707110000031525', 'RP00023238', '100', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499754089004', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('278', '08201707110000031526', 'RP00023239', '100', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499754089426', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('279', '08201707110000031527', 'RP00023240', '100', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499754092464', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('280', '08201707110000031528', 'RP00023241', '100', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499754093671', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('281', '08201707110000031529', 'RP00023242', '100', 'WECHAT_APP', null, 'IOS', '2', '10103773', '192.168.31.1', null, '0', '1499754094856', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('282', '08201707110000031530', 'JD0011183', '990', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '200M流量', '0', '1499754245096', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('283', '08201707110000031531', 'RP00023243', '6', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499758105800', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('284', '08201707110000031532', 'RP00023244', '6', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499758105844', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('285', '08201707110000031533', 'RP00023245', '6', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499758106582', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('286', '08201707110000031534', 'RP00023246', '77414', 'WECHAT_APP', null, 'Android', '2', '10103773', '10.10.82.87', null, '0', '1499761572816', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('287', '08201707110000031535', 'RP00023247', '128514', 'WECHAT_APP', null, 'Android', '2', '10103773', '10.10.82.87', null, '0', '1499762636802', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('288', '08201707110000031536', 'RP00023248', '128514', 'WECHAT_APP', null, 'Android', '2', '10103773', '10.10.82.87', null, '0', '1499762646563', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('289', '08201707110000031537', 'RP00023249', '8', 'WECHAT_APP', null, 'Android', '2', '10103773', '10.10.82.87', null, '0', '1499762656313', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('290', '08201707110000031538', 'RP00023250', '6', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.162', null, '0', '1499767817508', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('291', '08201707120000031544', 'JD0011228', '3000', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '30元', '0', '1499827269388', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('292', '08201707120000031543', 'JD0011228', '3000', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '30元', '0', '1499827269810', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('293', '08201707120000031545', 'JD0011229', '190', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '10M流量', '0', '1499827352168', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('294', '08201707120000031546', 'JD0011229', '190', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '10M流量', '0', '1499827444782', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('295', '08201707120000031547', 'JD0011231', '26600', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.162', '11G流量', '0', '1499842704818', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('296', '08201707120000031548', 'JD0011235', '3000', 'WECHAT_APP', null, null, '3', '10103773', '10.10.71.125', '30元', '0', '1499845333591', null, null, null);
INSERT INTO `t_pay_payment` VALUES ('297', '08201707120000031549', 'RP00023251', '6', 'WECHAT_APP', null, 'iOS', '2', '10103773', '10.10.71.67', null, '0', '1499845366464', null, null, null);

-- ----------------------------
-- Table structure for t_pay_payment_config
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_payment_config`;
CREATE TABLE `t_pay_payment_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `business_id` bigint(20) DEFAULT NULL COMMENT '业务ID',
  `payment` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付方式',
  `app_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mch_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商务号',
  `seller_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收款账号',
  `app_secret` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密钥',
  `app_key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付密钥',
  `type` int(11) DEFAULT NULL COMMENT '支付类型',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `rsa_private` text COLLATE utf8mb4_unicode_ci COMMENT '支付宝私钥',
  `rsa_public` text COLLATE utf8mb4_unicode_ci COMMENT '支付宝公钥',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='支付方式配置';

-- ----------------------------
-- Records of t_pay_payment_config
-- ----------------------------

-- ----------------------------
-- Table structure for t_pay_refund
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_refund`;
CREATE TABLE `t_pay_refund` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `refund_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '退款号（与第三方支付交互，如alipay的batchNo）',
  `pay_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付号',
  `refund_type` int(11) DEFAULT NULL COMMENT '退款类型 那个业务系统 1、购物退款 2 还款退款',
  `refund_no` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '退款单号',
  `refund_amt` bigint(11) DEFAULT NULL COMMENT '退款金额',
  `refund_rate` int(11) DEFAULT NULL COMMENT '退款费率',
  `refund_reason` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '退款原因',
  `third_refund_no` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方退款号',
  `status` int(11) DEFAULT NULL COMMENT '退款状态：0退款处理中；1退款成功；2退款失败；',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `trade_time` bigint(20) DEFAULT NULL COMMENT '交易时间',
  `retry_count` int(11) DEFAULT NULL COMMENT '重试次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `refund_id` (`refund_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_pay_refund
-- ----------------------------
INSERT INTO `t_pay_refund` VALUES ('1', '54545', '12121', '1', '3232', '123', '12', '支付退款', '2323232323', '1', null, '1232', '3343', '2');
