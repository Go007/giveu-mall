-- 增加库存唯一约束
ALTER TABLE `t_goods_sku_stock` ADD CONSTRAINT `uk_t_goods_sku_stock_sku_id` UNIQUE INDEX (`sku_id`);

-- 增加库存默认为0约束
ALTER TABLE `t_goods_sku_stock`
MODIFY COLUMN `freez`  bigint(20) NOT NULL DEFAULT 0 COMMENT '冻结库存' AFTER `stock`;


