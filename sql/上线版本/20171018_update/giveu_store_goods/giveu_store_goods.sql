-- 请在服务器10.12.11.185服务器中的GiveU_Store_Goods数据库执行以下sql：

-- 设置默认值
ALTER TABLE `t_goods_spu_installments`
MODIFY COLUMN `is_installments`  int(11) NULL DEFAULT 0 COMMENT '是否分期：1：分期，0：不分期' AFTER `spu_id`;

-- 设置促销
ALTER TABLE `t_goods_spu_installments`
ADD COLUMN `is_promotion`  int NULL COMMENT '是否是促销商品：0：无促销，1：有促销' AFTER `channel_value`;

