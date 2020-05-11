/*
Navicat MySQL Data Transfer

Source Server         : test--app-聪兴
Source Server Version : 50719
Source Host           : 10.12.11.86:3306
Source Database       : dafy_shop

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-10-18 10:40:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_advert
-- ----------------------------
DROP TABLE IF EXISTS `t_advert`;
CREATE TABLE `t_advert` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ad_name` varchar(255) DEFAULT NULL COMMENT '广告名称',
  `type` int(11) DEFAULT NULL COMMENT '广告类型： 1 app入口广告 2 banner广告',
  `ad_img_url` varchar(255) DEFAULT NULL COMMENT '广告图片地址',
  `ad_link_url` varchar(255) DEFAULT NULL COMMENT '点击广告跳转url',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `status` int(11) DEFAULT NULL COMMENT '状态 0 禁用 1启用',
  `width` int(11) DEFAULT NULL COMMENT '主图宽度',
  `height` int(11) DEFAULT NULL COMMENT '主图高度',
  `start_time` bigint(20) DEFAULT NULL COMMENT '广告开始时间',
  `expire_time` bigint(20) DEFAULT NULL COMMENT '广告过期时间',
  `create_time` bigint(20) DEFAULT NULL COMMENT '数据创建时间创建时间',
  `show_second` int(11) DEFAULT NULL COMMENT '广告持续时间 单位：秒',
  `update_time` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `scope` int(11) DEFAULT NULL COMMENT '范围 1 安卓 2 ios 12 全平台',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of t_advert
-- ----------------------------
INSERT INTO `t_advert` VALUES ('1', '首页开机广告', '1', 'https://my-server-879.b0.upaiyun.com/giveu_mall/img/start_page_ad/app_start-2.jpg', 'http://www.test.com', null, '1', '0', '12', '23', '1504667357667', '1504667357667', '1504667357667', '2', null, '12');
