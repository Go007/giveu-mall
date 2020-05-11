ALTER TABLE `t_goods_decoration`
DROP INDEX `idx_t_goods_decoration_code`;

CREATE TABLE `t_goods_decoration_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `code` varchar(64) NOT NULL COMMENT '关键词',
  `name` varchar(128) DEFAULT NULL,
  `description` text COMMENT '描述该关键词',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态 0：启用，1：禁用，2：删除',
  `create_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_t_goods_decoration_code_code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


