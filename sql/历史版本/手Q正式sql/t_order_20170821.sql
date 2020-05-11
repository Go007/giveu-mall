-- 增加索引
ALTER  TABLE  `t_shop_order_detail`  ADD  INDEX order_id (`order_id`);
ALTER  TABLE  `t_shop_order_detail`  ADD  INDEX serial_number (`serial_number`);

alter table t_shop_order_refunds_pay_log add channel varchar(60);
