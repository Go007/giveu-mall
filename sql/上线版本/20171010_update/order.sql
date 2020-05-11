-- 订单详情添加协议价
alter table t_shop_order_detail add agreement_price bigint(20) COMMENT '商品协议价';