-- 优惠券新增三个字段
alter table `t_shop_order_card_record` add column `card_type` int(1) DEFAULT NULL COMMENT '	1:满减券,2:立减券,3:运费减免券,4:赠品券；5:抵用券';
alter table `t_shop_order_card_record` add column `paymentLimit` int(1) DEFAULT NULL COMMENT '0:所有,1:仅三方支付使用,2:仅钱包额度使用';
alter table `t_shop_order_card_record` add column `cancel` int(1) DEFAULT NULL COMMENT '是否可取消(0:不可以,1:可以)';
