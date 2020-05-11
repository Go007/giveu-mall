-- 20170909 
-- 购买记录添加操作渠道
alter table t_shop_order_buy_log add oper_channel varchar(60) comment '操作渠道';

-- 订单详情添加支付宝支付Id
alter table t_shop_order_detail add pay_id varchar(300) comment '支付Id';

-- 充值退款记录表
DROP TABLE IF EXISTS `t_shop_order_recharge_refund_record`;
CREATE TABLE `t_shop_order_recharge_refund_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单详情id',
  `order_no` varchar(255) DEFAULT NULL COMMENT '订单号',
  `order_status` int(2) DEFAULT NULL COMMENT '订单状态',
  `apply_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '申请时间',
  `id_person` varchar(12) DEFAULT NULL COMMENT '用户id',
  `third_no` varchar(60) DEFAULT NULL COMMENT '充值供应商单号',
  `product_id` int(11) DEFAULT NULL COMMENT '充值产品id',
  `refund_price` bigint(10) DEFAULT NULL COMMENT '退款金额',
  `channel` varchar(10) DEFAULT NULL COMMENT '渠道',
  `refund_channel` varchar(10) DEFAULT NULL COMMENT '退款渠道',
  `pay_type` int(2) DEFAULT NULL COMMENT '支付方式:0-即有钱包，1-微信，2-支付宝',
  `pay_id` varchar(120) DEFAULT NULL COMMENT '支付id',
  `fn_contract_no` varchar(30) DEFAULT NULL COMMENT 'FN合同号',
  `refund_status` int(1) DEFAULT NULL COMMENT '退款状态:0-未退款，1-退款中，2-退款成功，3-退款失败',
  `operate_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值退款记录表';


-- 20170913
-- 添加手机渠道
alter table t_shop_orders add mobile_channel varchar(30) comment '手机渠道: 1-android, 2-ios';
-- 添加大家电
alter table t_shop_order_detail add is_home_application int(1) comment '是否大家电: 0-是, 1-否';
alter table t_shop_order_detail add reserving_date varchar(30) comment '大家电配送日期 默认值为-1，0表示当天，1表示明天，2：表示后天; 如果为-1表示不使用大家电预约日历';
alter table t_shop_order_detail add reserving_str varchar(30) comment '大家电配送日期';
alter table t_shop_order_detail add install_date varchar(30) comment '大家电安装日期 不支持默认按-1处理，0表示当天，1表示明天，2：表示后天';
alter table t_shop_order_detail add install_str varchar(30) comment '大家电安装日期';
alter table t_shop_order_detail add need_install varchar(30) comment '大家电是否选择了安装 1 - true, 0 - false, null - 忽略 是否选择了安装，默认为true，选择了“暂缓安装”，此为必填项，必填值为false。';
-- 订单使用优惠券记录表
DROP TABLE IF EXISTS `t_shop_order_card_record`;
CREATE TABLE `t_shop_order_card_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `order_no` varchar(255) DEFAULT NULL COMMENT '订单号',
  `card_id` bigint(20) DEFAULT NULL COMMENT '优惠券id',
  `card_name` varchar(300) DEFAULT NULL COMMENT '优惠券名称',
  `card_price` bigint(20) DEFAULT NULL COMMENT '价格',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `status` int(1) DEFAULT NULL COMMENT '状态: 0-无效，1-有效',
  `is_sync` int(1) DEFAULT NULL COMMENT '是否使用优惠券: 0-否，1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单使用优惠券记录表(第三方支付才能使用优惠券)';


-- 20170917
-- 京东下单失败记录
DROP TABLE IF EXISTS `t_shop_order_jd_fail_record`;
CREATE TABLE `t_shop_order_jd_fail_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `order_no` varchar(255) DEFAULT NULL COMMENT '订单号',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单详情id',
  `supplier_order_no` varchar(255) DEFAULT NULL COMMENT '京东单号',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `times` int(1) DEFAULT NULL COMMENT '次数',
  `result` varchar(255) DEFAULT NULL COMMENT '操作结果',
  `status` int(1) DEFAULT NULL COMMENT '状态：0-失败，1-成功',
  `pay_id` varchar(120) DEFAULT NULL COMMENT '支付id',
  `channel` varchar(30) DEFAULT NULL COMMENT '渠道',
  `id_person` varchar(12) DEFAULT NULL COMMENT '用户idPerson',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='京东下单失败记录';

-- 20170916
-- 订单详情添加退款申请中
alter table t_shop_order_detail add refund_applying int(1) DEFAULT '0' COMMENT '退款申请中:0-未申请,1-申请中';