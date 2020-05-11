-- 订单详情添加供应商sku字段
alter table t_shop_order_goods_detail add supplier_sku_code varchar(20) COMMENT '供应商sku';
update t_shop_orders t set t.supplier_id ='0' where t.supplier_id is null and t.goods_type =0;
update t_shop_orders o set o.last_modify = unix_timestamp(now()) * 1000  WHERE o.last_modify < 15100306780;