-- 未审核订单审核日志记录表
CREATE TABLE `t_shop_order_audit_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `id_person` bigint(50) DEFAULT NULL COMMENT '蜂鸟客户id',
  `order_no` varchar(50) COMMENT '订单号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `status` int(11) DEFAULT NULL COMMENT '订单状态:0-订单创建中,1-待付款,2-待首付,3-待发货,4-待收货,5-已完成,6-已关闭,7-退款成功,20-充值中,21-充值成功,22-充值失败',
  `create_time` bigint(20) DEFAULT NULL COMMENT '订单创建时间',
  `fn_contract_no` varchar(60) DEFAULT NULL COMMENT '蜂鸟合同号',
  `id_credit` varchar(255) DEFAULT NULL COMMENT '合同id',
  `is_ppm_open` int(11) DEFAULT NULL COMMENT 'ppmoney是否开户',
  `is_sale_on_credit` int(11) DEFAULT NULL COMMENT '是否赊销模式',
  `log_create_time` bigint(20) DEFAULT NULL COMMENT '日志创建时间',
  `log_status` int(11) DEFAULT NULL COMMENT '日志状态:0-正常 1-异常',
	`remark` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_t_audit_log_order_id` (`order_id`),
  KEY `idx_t_audit_log_order_no` (`order_no`),
  KEY `idx_t_audit_log_fn_contract_no` (`fn_contract_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='未审核订单审核日志记录表';