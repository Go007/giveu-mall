
-- 商城数据库 GiveU_Store

-- 自营预警
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, phone, email, status, gmt_create, gmt_modified) VALUES (14, 'JD报告自营订单异常', '13026602991', 'hudongzhu@dafycredit.com', 1, now(3), now(3));

-- t_jd_orders
alter table `t_jd_orders` add column `supplier` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '供应商';
alter table `t_jd_orders` add column `gmt_create` datetime(3) DEFAULT NULL COMMENT '创建时间';
alter table `t_jd_orders` add column `gmt_modified` datetime(3) DEFAULT NULL COMMENT '修改时间';

-- t_jd_order_detail
alter table `t_jd_order_detail` add column `shop_order_id` bigint(20) unsigned DEFAULT NULL COMMENT 't_jd_orders id';
alter table `t_jd_order_detail` add column `gmt_create` datetime(3) DEFAULT NULL COMMENT '创建时间';
alter table `t_jd_order_detail` add column `gmt_modified` datetime(3) DEFAULT NULL COMMENT '修改时间';

