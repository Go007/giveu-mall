-- 促销新增两个领取时间字段
ALTER TABLE `t_promotion_coupon`
ADD COLUMN `get_begin_time`  bigint NULL COMMENT '领取的开始时间' AFTER `coupon_num_type`,
ADD COLUMN `get_end_time`  bigint NULL COMMENT '领取的结束时间' AFTER `get_begin_time`;

-- Excel模板文件配置表
DROP TABLE IF EXISTS `t_system_excel_template`;
CREATE TABLE `t_system_excel_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `biz_type` varchar(255) NOT NULL COMMENT '业务类型',
  `src` varchar(1024) NOT NULL COMMENT '模板资源位置',
  `max_line` bigint(20) NOT NULL COMMENT '最大记录行',
  `status` tinyint(4) NOT NULL COMMENT '状态 0：可用，2：删除',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `last_modify` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_t_system_excel_template_biz_type` (`biz_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- 上下架/添加商品池/价格变更模板数据
INSERT INTO `t_system_excel_template` VALUES ('1', 'GOODS_SUPPLIER_POOL', 'group2/M0C/90/F1/CgsMMVpycxeAX3YWAAAobV_OK9g12.xlsx', '2', '0', '1508901809327', '1508901809327');
INSERT INTO `t_system_excel_template` VALUES ('2', 'GOODS_SUPPLIER_SHELVE', 'group2/M0B/91/06/CgsMMFpydbWAZ0MBAAAoZcljH3078.xlsx', '2', '0', '1508901809327', '1508901809327');
INSERT INTO `t_system_excel_template` VALUES ('3', 'GOODS_SUPPLIER_PRICE', 'group2/M0E/8D/0F/CgsML1pxXNGACUhVAAAoggBytDU67.xlsx', '2', '0', '1508901809327', '1508901809327');

-- 邮件日志表
DROP TABLE IF EXISTS `t_mail_log`;
CREATE TABLE `t_mail_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `subject` varchar(1024) DEFAULT NULL COMMENT '主题',
  `content` text COMMENT '内容',
  `from` varchar(128) DEFAULT NULL COMMENT '发件人',
  `to` varchar(1024) DEFAULT NULL COMMENT '收件人',
  `cc` varchar(1024) DEFAULT NULL COMMENT '抄送人',
  `add_attach` tinyint(4) DEFAULT NULL COMMENT '是否添加附件',
  `attachment` varchar(2048) DEFAULT NULL COMMENT '附件路径',
  `source_type` tinyint(255) DEFAULT NULL COMMENT '资源类型 0：本地资源，1：网络资源',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_t_mail_log_subject` (`subject`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

-- 商品信息同步测试开关
INSERT INTO `t_config_setting` (
	`cache_key`,
	`val`,
	`remark`,
	`enabled`,
	`gmt_create`,
	`gmt_modified`
)
VALUES
	(
		'setting:manage:goods:sync:pool',
		'false',
		'供应商商品池同步',
		'1',
		'2018-01-10 15:32:40.000',
		'2018-01-10 15:32:40.000'
	),
	(
		'setting:manage:goods:sync:shelve',
		'false',
		'供应商上下架同步',
		'1',
		'2018-01-10 15:32:40.000',
		'2018-01-10 15:32:40.000'
	),
	(
		'setting:manage:goods:sync:price',
		'false',
		'供应商价格同步',
		'1',
		'2018-01-10 15:32:40.000',
		'2018-01-10 15:32:40.000'
	);

