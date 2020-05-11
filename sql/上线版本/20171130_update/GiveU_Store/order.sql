--白名单信息
--INSERT into t_config_white (type, val, remark, enabled, gmt_create, gmt_modified) VALUES ('white:order:idPerson', '600000',  '订单支付(购物充值)白名单', 1, now(3), now(3));

--订单校验日志记录表
CREATE TABLE `t_shop_order_check_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` bigint(20) COMMENT '订单id',
	`order_detail_id` bigint(20) COMMENT '订单详情id',
  `order_no` varchar(50) COMMENT '订单号',
  `order_status` int(11) DEFAULT NULL COMMENT '订单状态:0-订单创建中,1-待付款,2-待首付,3-待发货,4-待收货,5-已完成,6-已关闭,7-退款成功,20-充值中,21-充值成功,22-充值失败',
  `order_amt` bigint(18) DEFAULT NULL COMMENT '订单结算金额',
  `order_pay_amt` bigint(18) DEFAULT NULL COMMENT '订单支付金额',
  `order_goods_amt` bigint(18) DEFAULT NULL COMMENT '订单商品货款',
  `order_dis_amt` bigint(18) DEFAULT NULL COMMENT '订单优惠金额',
  `order_down_amt` bigint(18) DEFAULT NULL COMMENT '订单首付金额',
  `order_freight` bigint(6) DEFAULT NULL COMMENT '运费',
  `order_pay_type` int(1) DEFAULT NULL COMMENT '支付类型:0-钱包，1-微信，2-支付宝',
  `order_create_time` bigint(20) DEFAULT NULL COMMENT '订单创建时间',
  `pay_id` varchar(40) COLLATE utf8mb4_unicode_ci COMMENT '支付Id',
  `pay_third_trade_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方交易号',
  `pay_amt` bigint(11) DEFAULT NULL COMMENT '支付订单金额(分)',
  `pay_create_time` bigint(20) DEFAULT NULL COMMENT '支付创建时间',
  `pay_status` int(11) DEFAULT NULL COMMENT '支付状态：0 等待付款，1：支付成功',
  `pay_retry_count` int(6) DEFAULT NULL COMMENT '支付重试次数',
  `log_status` int(11) DEFAULT NULL COMMENT '日志状态:0-正常 1-状态异常 2-次数异常 3-金额异常 4-优惠券异常',
  `log_create_time` bigint(20) DEFAULT NULL COMMENT '日志创建时间',
	`remark` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日志备注信息',
	`card_price` bigint(20) DEFAULT NULL COMMENT '价格',
  `card_status` int(1) DEFAULT NULL COMMENT '状态: 0-无效，1-有效',
  `card_is_use` int(1) DEFAULT NULL COMMENT '是否使用优惠券: 0-否，1-是',
  PRIMARY KEY (`id`),
  KEY `idx_t_check_log_order_id` (`order_id`),
  KEY `idx_t_check_log_order_no` (`order_no`),
  KEY `idx_t_check_log_order_detail_id` (`order_detail_id`),
  KEY `idx_t_check_log_pay_id` (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单校验日志记录表';