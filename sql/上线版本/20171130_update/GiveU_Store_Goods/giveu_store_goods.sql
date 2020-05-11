-- -- excel配置信息表
-- CREATE TABLE `t_system_config_excel` (
--   `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
--   `name` varchar(64) NOT NULL DEFAULT '' COMMENT 'Excel标题名称',
--   `alias` varchar(64) NOT NULL COMMENT 'Excel标题别名',
--   `data_type` varchar(16) NOT NULL COMMENT '基本数据类型+Date类型+String类型',
--   `biz_name` varchar(32) NOT NULL COMMENT '业务名称',
--   `restrain_type` varchar(255) DEFAULT 'NOT_BLANK' COMMENT 'Excel限制类型：下拉选(OPTIONS),正小数(POSITIVE_NUM)等',
--   `restrain` varchar(255) DEFAULT NULL COMMENT 'Excel限制值',
--   `index` int(11) NOT NULL COMMENT '列索引',
--   `postil` varchar(1024) DEFAULT NULL COMMENT '批注',
--   `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态：0：启用，1：禁用',
--   `last_modify` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
--   `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
-- 
-- 
-- 
-- -- 供应商批次表
-- CREATE TABLE `t_supplier_goods_batch` (
--   `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
--   `number` varchar(64) NOT NULL COMMENT '批次编号',
--   `supplier` varchar(16) NOT NULL COMMENT '供应商类型',
--   `src` varchar(1024) NOT NULL COMMENT '资源路径',
--   `status` int(255) NOT NULL DEFAULT '0' COMMENT '状态 0：启用，2：删除',
--   `last_modify` bigint(20) NOT NULL COMMENT '最后更新时间',
--   `create_time` bigint(20) NOT NULL COMMENT '创建时间',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- 
-- 
-- -- 批次号
-- INSERT INTO `t_system_counter` VALUES ('22', 'ID_SHOP_SUPPLIER', 'SU', '00000000001', 'yyyyMMddHHmmss', '1', null, '100', null, null, '1510745861542', '100', '20');
-- 
-- -- 批次标识
-- ALTER TABLE `t_supplier_goods_sku`
-- ADD COLUMN `batch_id`  bigint NOT NULL COMMENT '批次标识' AFTER `is_join`;


-- 关键词新增channel标识
ALTER TABLE `t_goods_decoration_code`
ADD COLUMN `channel`  int NOT NULL COMMENT '渠道：0：App,1：手Q，2：微信' AFTER `last_modify`;

-- 添加上下架时间字段
ALTER TABLE `t_goods_sku_channel`
	ADD COLUMN `up_shelves_time`  bigint NULL DEFAULT NULL COMMENT '上架时间' AFTER `channel_tag`,
	ADD COLUMN `down_shelves_time`  bigint NULL DEFAULT NULL COMMENT '下架时间' AFTER `up_shelves_time`;

-- 添加冗余字段：spu_Id
ALTER TABLE `t_goods_sku_channel`
ADD COLUMN `spu_id`  bigint NULL COMMENT '关联字段' AFTER `down_shelves_time`;

-- 增加排序字段
ALTER TABLE `t_goods_decoration_spu`
ADD COLUMN `sort`  int NULL AFTER `last_modify`;

-- 更新二手商品
UPDATE t_goods_sku SET is_secondhand = 0 WHERE is_secondhand IS NULL;

-- 增加排序字段
ALTER TABLE `t_goods_decoration_spu`
MODIFY COLUMN `sort`  int(11) NULL DEFAULT 0 COMMENT '排序码' AFTER `last_modify`;
UPDATE t_goods_decoration_spu SET sort  = 0 WHERE sort IS NULL;

