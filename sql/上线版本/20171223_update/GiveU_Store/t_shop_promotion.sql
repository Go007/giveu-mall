--优惠券表新增优惠券数量类型字段
ALTER TABLE t_promotion_coupon ADD coupon_num_type int(4) DEFAULT '0' COMMENT '优惠券数量类型（0：有限，1：无限）';

--修改备注
ALTER TABLE t_promotion_coupon modify column distribution_channel varchar(64) COMMENT '发放渠道[0:App,1:手Q,2:微信,3微信公众号]多选通过,分割';
ALTER TABLE t_promotion_coupon modify column coupon_type int(11) COMMENT '优惠券类型[1:满减券,2:立减券,3:运费减免券,4:赠品券,5:抵用券]';
ALTER TABLE t_promotion_coupon modify column payment_limit int(11) COMMENT '支付限制[0:无限制,1:仅借记卡使用,2:仅钱包额度使用]单选';

--修改之前的优惠券支付限制为无限制
UPDATE t_promotion_coupon SET payment_limit=0 WHERE coupon_num_type  <> 5;

--关键字表新增渠道字段
ALTER TABLE t_promotion_coupon_keyword ADD distribution_channel varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发放渠道[0:App,1:手Q,2:微信,3微信公众号]';

--关键字表新增渠道字段设值
UPDATE t_promotion_coupon_keyword t1
INNER JOIN t_promotion_coupon t2
	ON t1.id_coupon=t2.id SET t1.distribution_channel=t2.distribution_channel
WHERE t2.use_threshold=4;


--修改索引为唯一索引
ALTER TABLE t_promotion_coupon
DROP INDEX udx_t_promotion_coupon_coupon_code;
CREATE UNIQUE INDEX udx_t_promotion_coupon_coupon_code ON t_promotion_coupon(coupon_code);