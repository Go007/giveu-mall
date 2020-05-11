/*
Navicat MySQL Data Transfer

Source Server         : 开发环境--dafy_shop
Source Server Version : 50719
Source Host           : 10.12.11.185:3306
Source Database       : dafy_shop

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-02-09 09:51:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_system_maintenance
-- ----------------------------
DROP TABLE IF EXISTS `t_system_maintenance`;
CREATE TABLE `t_system_maintenance` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `channel` int(11) NOT NULL DEFAULT '-1' COMMENT '渠道：0:APP,1:QQ,2:WX,3:公众号',
  `content` varchar(300) NOT NULL DEFAULT '' COMMENT '维护内容',
  `start_time` bigint(15) NOT NULL DEFAULT '-1' COMMENT '开始展示时间',
  `end_time` bigint(15) NOT NULL DEFAULT '-1' COMMENT '结束展示时间',
  `status` int(11) NOT NULL DEFAULT '-1' COMMENT '状态:0 禁用，1启用',
  `create_time` bigint(15) NOT NULL DEFAULT '-1' COMMENT '创建时间',
  `last_modify` bigint(15) NOT NULL DEFAULT '-1' COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='系统公告表';
