-- ---------------------------------------------------------------------------------------------------------------------
-- t_jd_check_order

DROP TABLE IF EXISTS `t_jd_check_order`;
CREATE TABLE `t_jd_check_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `jd_date` date DEFAULT NULL COMMENT '交易日期',
  `pull_state` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '拉取某一状态对账单',
  `jd_order_id` bigint(20) unsigned DEFAULT NULL COMMENT '京东订单编号',
  `jd_state` tinyint unsigned DEFAULT NULL COMMENT '订单状态; 0是新建, 1是妥投, 2是拒收',
  `hang_up_state` tinyint unsigned DEFAULT NULL COMMENT '是否挂起; 0为未挂起, 1为挂起',
  `invoice_state` tinyint unsigned DEFAULT NULL COMMENT '开票方式(1为随货开票，0为订单预借，2为集中开票 )',
  `order_price` bigint(20) unsigned DEFAULT NULL COMMENT '订单金额',
  `jd_time` datetime DEFAULT NULL COMMENT 'JD订单时间',
  `total` int(11) unsigned DEFAULT NULL COMMENT '订单总数',
  `total_page` int(11) unsigned DEFAULT NULL COMMENT '总页码数',
  `cur_page` int(11) unsigned DEFAULT NULL COMMENT '当前页码',
  `gmt_create` datetime(3) DEFAULT NULL,
  `gmt_modified` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='JD对账数据表';

ALTER table t_jd_check_order ADD INDEX idx_jd_order_id(jd_order_id);
ALTER table t_jd_check_order ADD INDEX idx_jd_date(jd_date);

-- ---------------------------------------------------------------------------------------------------------------------
-- t_check_jd_order

DROP TABLE IF EXISTS `t_check_jd_order`;
CREATE TABLE `t_check_jd_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `check_date` date DEFAULT NULL COMMENT '对账日期',
  `third_order` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '内部订单号',
  `jd_order_id` bigint(20) unsigned DEFAULT NULL COMMENT '京东订单编号',
  `supplier` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '供应商',
  `export_date` date DEFAULT NULL COMMENT '对账导出日期',
  `gu_check_status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '订单-JD对账状态',
  `jd_check_status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'JD-供应商对账状态',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '对账结果描述',
  `gmt_create` datetime(3) DEFAULT NULL,
  `gmt_modified` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='对账-JD订单互对结果表';

ALTER table t_check_jd_order ADD INDEX idx_third_order(third_order);
ALTER table t_check_jd_order ADD INDEX idx_check_date(check_date);
ALTER table t_check_jd_order ADD INDEX idx_export_date(export_date);

-- ---------------------------------------------------------------------------------------------------------------------
-- t_jd_orders
alter table `t_jd_orders` add column `order_create_time` datetime(3) DEFAULT NULL COMMENT '订单创建时间';
ALTER table t_jd_orders ADD INDEX idx_t_jd_orders_order_create_time(order_create_time);
ALTER table t_jd_orders ADD INDEX idx_t_jd_orders_gmt_create(gmt_create);
