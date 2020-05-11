
-- 供应商对账日志表
CREATE TABLE `t_goods_call_traffic_supplier_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `third_serial_number` varchar(64) NOT NULL COMMENT '第三方订单号',
  `serial_number` varchar(64) DEFAULT NULL COMMENT '商品流水号',
  `supplier_type` int(11) NOT NULL COMMENT '供应商类型：0：大汉，1：合赢',
  `denomination` varchar(32) DEFAULT NULL COMMENT '充值面额',
  `mobile` varchar(16) DEFAULT NULL COMMENT '手机号码',
  `cost_money` varchar(16) DEFAULT NULL COMMENT '进货价',
  `supplier_status` varchar(16) NOT NULL COMMENT '供应商状态',
  `status` int(11) NOT NULL COMMENT '订单状态:0：订单创建成功，1：订单创建失败，2：订单交易成功，3：订单交易失败',
  `order_create_time` bigint(20) DEFAULT NULL COMMENT '订单创建时间',
  `create_time` bigint(20) NOT NULL COMMENT '记录时间',
  `last_modify` bigint(20) NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_t_goods_call_traffic_supplier_log_tsn_supplier_type` (`third_serial_number`,`supplier_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- App首页任务表
CREATE TABLE `t_homepage_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL COMMENT '组件类型',
  `model_code` varchar(32) NOT NULL COMMENT '组件编码',
  `begin_time` bigint(20) NOT NULL COMMENT '展示开始时间',
  `end_time` bigint(20) NOT NULL COMMENT '展示结束时间',
  `status` int(4) NOT NULL COMMENT '0发布已展示，1禁用，2删除，3预览，4发布未展示',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `last_modify` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
ALTER TABLE `t_homepage_task`
ADD INDEX `idx_t_homepage_task_model_code` (`model_code`) USING BTREE ;


-- App首页数据表
CREATE TABLE `t_homepage_app` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `home_content` text COMMENT '卖场内容',
  `status` int(11) DEFAULT '1' COMMENT '状态 0 发布，1禁用 ，2删除，3预览',
  `is_official` int(11) DEFAULT NULL COMMENT '正式或审核  0正式  1审核',
  `creat_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `last_modify` bigint(255) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_t_homepage_app_statOffic` (`status`,`is_official`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;



-- App首页编辑数据表
DROP TABLE IF EXISTS `t_goods_app_home`;
CREATE TABLE `t_goods_app_home` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `home_code` varchar(255) DEFAULT NULL COMMENT '主页唯一标识',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `home_content` text COMMENT '卖场内容',
  `status` int(11) DEFAULT '1' COMMENT '状态 0 发布，1禁用 ，2删除，3预览',
  `url` varchar(255) DEFAULT NULL COMMENT '发布路径',
  `preview_url` varchar(255) DEFAULT NULL COMMENT '预览路径',
  `is_official` int(11) DEFAULT NULL COMMENT '正式或审核  0正式  1审核',
  `creat_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `last_modify` bigint(255) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;


-- 二级卖场数据表
DROP TABLE IF EXISTS `t_goods_second_store`;
CREATE TABLE `t_goods_second_store` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mall_code` varchar(255) DEFAULT NULL COMMENT '卖场唯一标识',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `color` varchar(255) DEFAULT NULL COMMENT '背景色',
  `begin_time` bigint(20) DEFAULT NULL COMMENT '网页有效起始时间',
  `end_time` bigint(20) DEFAULT NULL COMMENT '网页有效结束时间',
  `background_img` varchar(255) DEFAULT NULL COMMENT '背景图片',
  `share_img` varchar(255) DEFAULT NULL COMMENT '分享图片',
  `share_title` varchar(255) DEFAULT NULL COMMENT '分享标题',
  `share_basic` varchar(255) DEFAULT NULL COMMENT '分享摘要',
  `store_content` text COMMENT '卖场内容',
  `url` varchar(255) DEFAULT NULL COMMENT '卖场链接',
  `preview_url` varchar(255) DEFAULT NULL COMMENT '预览路径',
  `channel` int(11) DEFAULT NULL COMMENT '渠道值：0:APP,1:QQ,2:WX,3微信公众号',
  `is_release` int(11) DEFAULT '1' COMMENT '是否发布 0 发布 1未发布',
  `status` int(11) DEFAULT '1' COMMENT '0 发布，1禁用 ，2删除，3预览 （4可更新字段不存库）',
  `creat_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_t_goods_second_store_mall_code` (`mall_code`) COMMENT '唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;


-- 同步上下架日志表
DROP TABLE IF EXISTS `t_goods_sync_shelve_log`;
CREATE TABLE `t_goods_sync_shelve_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplier_type` varchar(8) NOT NULL COMMENT '供应商类型',
  `supplier_code` varchar(32) NOT NULL COMMENT '供应商编码',
  `supplier_status` varchar(16) NOT NULL COMMENT '供应商状态',
  `sku_code` varchar(50) DEFAULT NULL COMMENT '供应商编码',
  `name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `spu_code` varchar(50) DEFAULT NULL COMMENT 'spu编码',
  `app_status` varchar(16) DEFAULT NULL COMMENT 'app渠道状态',
  `qq_status` varchar(16) DEFAULT NULL COMMENT 'qq渠道状态',
  `wx_status` varchar(16) DEFAULT NULL COMMENT 'wx渠道状态',
  `oa_status` varchar(16) DEFAULT NULL COMMENT '微信公众号渠道状态',
  `sync_date` bigint(20) DEFAULT NULL COMMENT '同步时间',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_t_goods_sync_shelve_log_sync_date` (`sync_date`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- 同步商品池日志表
DROP TABLE IF EXISTS `t_goods_sync_pool_log`;
CREATE TABLE `t_goods_sync_pool_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplier_type` varchar(8) NOT NULL COMMENT '供应商类型',
  `supplier_code` varchar(32) NOT NULL COMMENT '供应商编码',
  `supplier_status` varchar(16) NOT NULL COMMENT '供应商状态',
  `sku_code` varchar(50) DEFAULT NULL COMMENT '供应商编码',
  `name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `spu_code` varchar(50) DEFAULT NULL COMMENT 'spu编码',
  `app_status` varchar(16) DEFAULT NULL COMMENT 'app渠道状态',
  `qq_status` varchar(16) DEFAULT NULL COMMENT 'qq渠道状态',
  `wx_status` varchar(16) DEFAULT NULL COMMENT 'wx渠道状态',
  `oa_status` varchar(16) DEFAULT NULL COMMENT '微信公众号渠道状态',
  `sync_date` bigint(20) DEFAULT NULL COMMENT '同步时间',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_t_goods_sync_pool_log_sync_date` (`sync_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- 供应商价格变更日志表
CREATE TABLE `t_goods_sync_price_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `sku_code` varchar(50) DEFAULT NULL COMMENT '即有Sku编码',
  `spu_code` varchar(50) DEFAULT NULL COMMENT '即有Spu编码',
  `app_sale_price` bigint(20) DEFAULT NULL COMMENT 'app渠道价格',
  `qq_sale_price` bigint(20) DEFAULT NULL COMMENT 'qq渠道售价',
  `wx_sale_price` bigint(20) DEFAULT NULL COMMENT 'wx渠道价格',
  `oa_sale_price` bigint(20) DEFAULT NULL COMMENT '公众号渠道价格',
  `supplier_type` varchar(8) NOT NULL COMMENT '供应商类型',
  `supplier_code` varchar(32) NOT NULL,
  `old_purchase_price` bigint(20) DEFAULT NULL COMMENT '老协议价',
  `new_purchase_price` bigint(20) DEFAULT NULL COMMENT '新协议价',
  `sync_date` bigint(20) DEFAULT NULL COMMENT '同步日期',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_t_goods_sync_price_log_sync_date` (`sync_date`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4;








