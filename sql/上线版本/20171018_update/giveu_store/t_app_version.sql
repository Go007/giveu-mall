/*
Navicat MySQL Data Transfer

Source Server         : test--app-聪兴
Source Server Version : 50719
Source Host           : 10.12.11.86:3306
Source Database       : dafy_shop

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-10-18 10:40:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_app_version
-- ----------------------------
DROP TABLE IF EXISTS `t_app_version`;
CREATE TABLE `t_app_version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增',
  `platform` varchar(20) DEFAULT NULL COMMENT 'iOS,Android',
  `version_code` int(11) DEFAULT NULL COMMENT '版本号',
  `version_name` varchar(50) DEFAULT NULL COMMENT '版本名称',
  `app_url` varchar(255) DEFAULT NULL COMMENT 'app下载地址',
  `app_signature` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '版本更新提示标题',
  `content` varchar(500) DEFAULT NULL COMMENT '更新内容',
  `force_update` int(1) DEFAULT NULL COMMENT '是否需要强制更新 1 普通更新 2 强制更新',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `status` int(11) DEFAULT NULL COMMENT '状态 0禁用 1启用',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='app 版本表';

-- ----------------------------
-- Records of t_app_version
-- ----------------------------
INSERT INTO `t_app_version` VALUES ('1', 'Android', '10100', 'v1.1.0', 'https://my-server-879.b0.upaiyun.com/giveu_mall/app/mall_1.1.0_online_guanwang.apk', '1D09F767013046692D7A44F37002FB33', 'app-商城', '发现新版本1.1.0，更新内容：<br/> 1、即有商城上线啦！<br/> 2、优惠券可以使用啦！<br/> 3、程序猿GG修复了一些bug<br/>', '1', '1504667477115', '1', 'test ramak');
