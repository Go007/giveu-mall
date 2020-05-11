-- 商品t_goods_spu表添加渠道、标签字段
ALTER TABLE `t_goods_spu`
ADD COLUMN `channel`  int(11) NULL COMMENT '0:APP商城，1:手Q' AFTER `is_iphone`,
ADD COLUMN `tag`  varchar(128) NULL COMMENT '标签：手机，数码，家电' AFTER `channel`;

-- 商品t_goods_sku表添加月供1、月供2、月供3字段
ALTER TABLE `t_goods_sku`
ADD COLUMN `month_amount_vip_first`  bigint NULL COMMENT 'VIP1月供' AFTER `down_shelves_time`,
ADD COLUMN `month_amount_vip_second`  bigint NULL COMMENT 'VIP2月供' AFTER `month_amount_vip_first`,
ADD COLUMN `month_amount_vip_third`  bigint NULL COMMENT 'VIP3月供' AFTER `month_amount_vip_second`;

-- 商品t_goods_sku表修改默认sku字段注释
ALTER TABLE `t_goods_sku`
MODIFY COLUMN `default_sku_code`  int(11) NULL DEFAULT NULL COMMENT '默认sku：1：Spu默认sku，0：非Spu默认sku' AFTER `sale_price`;

-- 商品t_goods_sku表添加服务保障ID字段
ALTER TABLE `t_goods_sku`
ADD COLUMN `safeguard_id`  varchar(64) NULL COMMENT '服务保障ID集合,例如：1,2,3..' AFTER `month_amount_vip_third`;

-- 商品t_goods_spu表添加是否是促销、大类目、小类目字段
ALTER TABLE `t_goods_spu`
ADD COLUMN `is_promotion`  int NULL COMMENT '是否是促销商品：0：无促销，1：有促销' AFTER `tag`,
ADD COLUMN `first_category_id`  bigint NULL COMMENT '一级分类：大分类' AFTER `is_promotion`,
ADD COLUMN `second_category_id`  bigint NULL COMMENT '二级分类：小分类' AFTER `first_category_id`;

-- 商品t_goods_spu表修改is_iphone字段
ALTER TABLE `t_goods_spu`
CHANGE COLUMN `is_iphone` `is_phone`  int(11) NULL DEFAULT NULL COMMENT '是否是手机:0：非手机，1：手机' AFTER `periods`;

-- 商品t_goods_sku表修改月供1、月供2、月供3字段
ALTER TABLE `t_goods_sku`
DROP COLUMN `month_amount_vip_third`,
MODIFY COLUMN `month_amount_vip_first`  bigint(20) NULL DEFAULT NULL COMMENT 'VIP1月供x1000' AFTER `down_shelves_time`,
MODIFY COLUMN `month_amount_vip_second`  bigint(20) NULL DEFAULT NULL COMMENT 'VIP2月供x1000' AFTER `month_amount_vip_first`,
ADD COLUMN `free_interest`  int NULL COMMENT '商品：0：全息，3：3期免息，6：6期免息，12：12期免息' AFTER `month_amount_vip_second`;

ALTER TABLE `t_goods_specification_value`
MODIFY COLUMN `status`  int(4) NULL DEFAULT 6 COMMENT '状态：\r\n0: 新增，\r\n1:删除，\r\n2: 待审核，\r\n3:审核未通过，\r\n4:待上架，\r\n5:定时上架，\r\n6:已上架\r\n\r\n注：使用商品的状态码，暂时性的设计' AFTER `sku_id`;



