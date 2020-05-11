-- 优惠券信息
CREATE TABLE t_promotion_coupon(
id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键唯一标识',
coupon_code VARCHAR(64) NOT NULL COMMENT '优惠券编码',
coupon_name VARCHAR(255) NOT NULL COMMENT '优惠券名称',
coupon_number BIGINT(20) DEFAULT NULL COMMENT '优惠券数量',
coupon_sup_number BIGINT(20) DEFAULT NULL COMMENT '优惠券剩余数量',
coupon_type INT(11) DEFAULT NULL COMMENT '优惠券类型[1:满减券,2:立减券,3:运费减免券,4:赠品券]',
begin_time BIGINT(20) DEFAULT NULL COMMENT '开始时间',
end_time BIGINT(20) DEFAULT NULL COMMENT '结束时间',
use_threshold INT(11) DEFAULT NULL COMMENT '使用门槛[1:全平台,2:品类,3:品牌,4:自定义]',
coupon_denomination BIGINT(20) DEFAULT NULL COMMENT '优惠券面额',
coupon_quota BIGINT(20) DEFAULT NULL COMMENT '优惠券限额',
distribution_channel VARCHAR(64) DEFAULT NULL COMMENT '发放渠道[0:App,1:手Q,2:微信]多选通过,分割',
payment_limit INT(11) DEFAULT NULL COMMENT '支付限制[1:仅借记卡使用,2:仅钱包额度使用]单选',
user_limit INT(11) DEFAULT NULL COMMENT '用户限制[1:注册用户可用,2:激活用户可用,3:黑名单无法使用]单选',
risk_level INT(11) DEFAULT NULL COMMENT '风险等级[1:1级,2:2级,3:3级,4:4级]',
id_promotion_keyword BIGINT(20) DEFAULT NULL COMMENT '促销关键字id',
id_activity int(11) DEFAULT NULL COMMENT '活动ID',
restricted_remark varchar(2000) DEFAULT NULL COMMENT '优惠券限制描述',
remark varchar(2000) DEFAULT NULL COMMENT '优惠券描述',
status int(4) NOT NULL DEFAULT '0' COMMENT '状态 0 启用，1禁用 ，2删除',
create_time BIGINT(20) DEFAULT NULL COMMENT '创建时间',
create_user BIGINT(20) NOT NULL DEFAULT '0' COMMENT '创建人',
update_time BIGINT(20) DEFAULT NULL COMMENT '更新时间',
update_user BIGINT(20) DEFAULT '0' COMMENT '更新人',
PRIMARY KEY (id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='促销优惠券信息表';

-- 优惠券类目
CREATE TABLE t_promotion_coupon_category(
id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键唯一标识',
id_coupon BIGINT(20) DEFAULT NULL COMMENT '优惠券id',
id_one_goods_type BIGINT(20) DEFAULT NULL COMMENT '一级商品分类id',
id_two_goods_type BIGINT(20) DEFAULT NULL COMMENT '二级商品分类id',
id_three_goods_type BIGINT(20) DEFAULT NULL COMMENT '三级商品分类id',
status int(4) NOT NULL DEFAULT '0' COMMENT '状态 0 启用，1禁用 ，2删除',
PRIMARY KEY (id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='促销优惠券类目表';

-- 优惠券品牌
CREATE TABLE t_promotion_coupon_brand(
id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键唯一标识',
id_coupon BIGINT(20) DEFAULT NULL COMMENT '优惠券id',
id_goods_brand BIGINT(20) DEFAULT NULL COMMENT '品牌id',
brand_name VARCHAR(64) DEFAULT NULL COMMENT '品牌名称',
status int(11) NOT NULL DEFAULT '0' COMMENT '状态 0 启用，1禁用 ，2删除',
PRIMARY KEY (id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='促销优惠券品牌表';

-- 优惠券关键词
CREATE TABLE t_promotion_coupon_keyword(
id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键唯一标识',
id_coupon BIGINT(20) DEFAULT NULL COMMENT '优惠券id',
id_goods_decoration BIGINT(20) DEFAULT NULL COMMENT '关键词id',
status int(11) NOT NULL DEFAULT '0' COMMENT '状态 0 启用，1禁用 ，2删除',
PRIMARY KEY (id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='优惠券关键词表';

ALTER TABLE act_courtesy_card ADD obtain_type int(11) DEFAULT '1' COMMENT '获取类型[1:用户领取，2:后台发放]';