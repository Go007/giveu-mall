
ALTER TABLE `t_goods_sku`
MODIFY COLUMN `barcode`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '条码（保留）' AFTER `status`;
