
DROP TABLE IF EXISTS `t_user_address`;
CREATE TABLE `t_user_address` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT 't_user id',
  `id_person` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'fn用户id',
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '客户姓名',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '联系电话',
  `province` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '省份',
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '城市',
  `region` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '区',
  `street` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '街道',
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '详细地址',
  `address_type` int(11) DEFAULT NULL COMMENT '地址类型',
  `is_default` int(11) DEFAULT NULL COMMENT '默认地址(1:是;0:否)',
  `state` int(11) DEFAULT NULL COMMENT '状态(1:有效;0:无效)',
  `gmt_create` datetime(3) DEFAULT NULL,
  `gmt_modified` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户地址';
