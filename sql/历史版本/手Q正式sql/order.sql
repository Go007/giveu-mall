alter table t_shop_order_detail add src_ip varchar(60);
alter table t_shop_order_detail add second_category_id bigint;
alter table t_shop_order_detail add first_category_id bigint;
alter table t_shop_order_detail add lates_repay_date varchar(60);
alter table t_shop_order_detail add id_credit varchar(60);
alter table t_shop_order_detail add safeguard_names varchar(360);
alter table t_shop_order_detail add insurancefeemax bigint;
alter table t_shop_order_detail change column is_iphone is_phone tinyint;
alter table t_shop_order_detail drop column interest_rate;  
alter table t_shop_order_detail drop column fn_insurance_id;  

alter table t_shop_orders add channel varchar(60);
alter table t_shop_orders add openid varchar(120);
alter table t_shop_orders add user_level int(2);
alter table t_shop_orders add random_code varchar(30);


DROP TABLE IF EXISTS `t_shop_order_buy_log`;
CREATE TABLE `t_shop_order_buy_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `order_no` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单号',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '物流信息',
  `operator` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作人',
  `id_person` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户id',
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '渠道类型：qq-手Q，sc-商城,cz-充值',
  `indexs` tinyint(1) DEFAULT NULL COMMENT '顺序: 京东产生物流前=1，之后=2',
  PRIMARY KEY (`id`),
  KEY `order_no` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单购买记录日志表';


DROP TABLE IF EXISTS `t_shop_order_repayment_plan`;
CREATE TABLE `t_shop_order_repayment_plan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `periods` int(11) DEFAULT NULL COMMENT '期数',
  `amount` bigint(18) DEFAULT NULL COMMENT '月供',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `order_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单号',
  `repay_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '还款日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单还款计划';