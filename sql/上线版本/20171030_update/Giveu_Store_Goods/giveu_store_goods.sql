-- 给商品Sku添加是否二手标识 
ALTER TABLE `t_goods_sku`
ADD COLUMN `is_secondhand`  int NULL DEFAULT 0 COMMENT '1：二手商品，0：不是二手商品' AFTER `classify`;


-- 给商品SkuChannel添加标签
ALTER TABLE `t_goods_sku_channel`
ADD COLUMN `channel_tag`  varchar(1024) NULL COMMENT '标签：优惠券（100-30），逗号分隔' AFTER `last_modify`;

-- 给收藏添加是否二手标识和标签字段和是否促销字段
ALTER TABLE `t_goods_collect`
ADD COLUMN `is_promotion`  int(11) NULL COMMENT '是否促销' AFTER `channel`,
ADD COLUMN `channel_tag`  varchar(1024) NULL COMMENT '标签：优惠券（100-30），逗号分隔' AFTER `is_promotion`,
ADD COLUMN `is_secondhand`  int(11) NULL COMMENT '1：二手商品，0：不是二手商品' AFTER `channel_tag`;

-- 给收藏添加供应商字段
ALTER TABLE `t_goods_collect`
ADD COLUMN `supplier`  varchar(50) NULL COMMENT '供应商' AFTER `is_secondhand`;

-- 给收藏添加user_id
ALTER TABLE `t_goods_collect`
ADD COLUMN `user_id`  bigint(20) NULL COMMENT '用户ID' AFTER `supplier`;

-- 更新收藏数据
UPDATE t_goods_collect SET supplier = "京东" WHERE `status` = 0;

-- 初始化商品sku二手字段
UPDATE t_goods_sku SET is_secondhand = 0 WHERE is_secondhand IS NULL;

-- 新增热词排序码
ALTER TABLE t_goods_hotword ADD COLUMN sort int(11);

-- 初始化品牌数据
INSERT INTO t_goods_brand(name)
SELECT DISTINCT t.brand_name FROM t_goods_sku t

-- 创建es同步视图 
CREATE VIEW dafy_es_update_1030 AS 

SELECT
	CONCAT(
		t1.id,'-',
		t2.id,'-',
		t3.id,'-',
		t4.id,'-',
		t6.id
	) AS search_id,
	t1.spu_code AS spu_code,
	t1.adwords AS adwords,
	t1.keywords AS keywords,
	t1.`status` AS spu_status,
	t1.last_modify AS t1_last_modify,
	t2.sku_code AS sku_code,
	t2.`name` AS sku_name,
	t2.sales_volume AS sales_volume,
	t2.real_sales_volume AS real_sales_volume,
	t2.supplier AS supplier,
	t2.`status` AS goods_sku_status,
	t2.brand_name AS brand_name,
  t2.is_secondhand AS is_secondhand,
	t2.last_modify AS t2_last_modify,
	t3.is_installments AS is_installments,
	t3.channel_value AS installments_channel_value,
	t3.last_modify AS t3_last_modify,
	t4.sku_default AS sku_default,
	t4.sku_status AS sku_channel_status,
	t4.sale_price AS sale_price,
	t4.channel AS sku_channel,
  t4.channel_tag AS channel_tag,
	t4.last_modify AS t4_last_modify,
	t5.f_default AS f_default,
	t5.src AS sku_img_src,
	t5.`status` AS sku_img_status,
	t5.last_modify AS t5_last_modify,
	t6.month_amount AS month_amount,
	t6.credit_value AS credit_value,
	t6.channel_value AS month_snapshot_channel,
	t6.`status` AS month_snapshot_status,
	t6.last_modify AS t6_last_modify,
	GREATEST(t1.last_modify,t2.last_modify,t3.last_modify,t4.last_modify,t6.last_modify) AS max_last_modify
FROM
	t_goods_spu AS t1
INNER JOIN t_goods_sku AS t2 ON t1.id = t2.spu_id
INNER JOIN t_goods_spu_installments AS t3 ON t1.id = t3.spu_id
INNER JOIN t_goods_sku_channel AS t4 ON t2.id = t4.sku_id
INNER JOIN t_goods_sku_img AS t5 ON t2.id = t5.sku_id
INNER JOIN t_goods_sku_month_snapshot AS t6 ON t2.id = t6.sku_id
WHERE
	t5.f_default = 0
AND t5.`status` = 0