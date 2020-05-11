-- 修改channel表字段长度
ALTER TABLE `t_goods_sku_channel`
MODIFY COLUMN `channel_tag`  varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签：优惠券（100-30），逗号分隔' AFTER `last_modify`;