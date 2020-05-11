-- 订单表详情字段
alter table t_shop_order_recharge_refund_record add user_id bigint(20) COMMENT '系统用户id';

-- 未激活用户下单次数
DROP TABLE IF EXISTS `t_shop_order_user_frequency`;
CREATE TABLE `t_shop_order_user_frequency` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号id',
  `order_no` varchar(30) DEFAULT NULL COMMENT '订单号id',
  `order_detail_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='未激活用户下单次数';

-- 订单商品属性表
DROP TABLE IF EXISTS `t_shop_order_goods_attr`;
CREATE TABLE `t_shop_order_goods_attr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单详情id',
  `order_goods_detail_id` bigint(20) DEFAULT NULL COMMENT '订单商品详情id',
  `order_no` varchar(255) DEFAULT NULL COMMENT '订单号',
  `goods_attr_name` varchar(255) DEFAULT NULL COMMENT '商品属性名称',
  `goods_attr_value` varchar(255) DEFAULT NULL COMMENT '商品属性值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单商品属性表';

-- 充值上限添加user_id
alter table t_user_month_recharge_cumulative add user_id bigint(20) COMMENT '系统用户ID';
-- 订单添加免单字段
alter table t_shop_orders add is_free tinyint(1) COMMENT '是否免单';