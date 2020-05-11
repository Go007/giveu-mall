/*
Navicat MySQL Data Transfer

Source Server         : 10.10.11.140
Source Server Version : 50716
Source Host           : 10.10.11.140:3306
Source Database       : dafy_shop

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-08-04 19:56:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_crm_address
-- ----------------------------
DROP TABLE IF EXISTS `t_crm_address`;
CREATE TABLE `t_crm_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CRM地址信息\r\n（已修改字段，没改类型）';

-- ----------------------------
-- Table structure for t_crm_credit_card
-- ----------------------------
DROP TABLE IF EXISTS `t_crm_credit_card`;
CREATE TABLE `t_crm_credit_card` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CRM银行卡信息';

-- ----------------------------
-- Table structure for t_crm_user_basic
-- ----------------------------
DROP TABLE IF EXISTS `t_crm_user_basic`;
CREATE TABLE `t_crm_user_basic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CRM客户基础信息';

-- ----------------------------
-- Table structure for t_fn_enchashment_log
-- ----------------------------
DROP TABLE IF EXISTS `t_fn_enchashment_log`;
CREATE TABLE `t_fn_enchashment_log` (
  `en_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `id_product` bigint(20) DEFAULT NULL COMMENT '产品Id',
  `credit_amount` int(11) DEFAULT NULL COMMENT '贷款金额',
  `credit_type` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合同类型',
  `is_instalments` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否分期',
  `order_no` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '流水号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '调用状态',
  `contract_no` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合同号',
  `id_credit` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合同Id',
  PRIMARY KEY (`en_id`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for t_fn_repayment_jrn
-- ----------------------------
DROP TABLE IF EXISTS `t_fn_repayment_jrn`;
CREATE TABLE `t_fn_repayment_jrn` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `amount` bigint(20) unsigned NOT NULL COMMENT '还款(订单)金额',
  `order_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '支付业务订单号',
  `pay_channel` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '支付类型',
  `source` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '来源',
  `repay_time` datetime(3) NOT NULL COMMENT '下单时间，还款时间',
  `pay_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '与第三方支付交互id',
  `succ_time` datetime(3) DEFAULT NULL COMMENT '支付成功回调时间',
  `state` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态',
  `id_person` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'fn用户id',
  `product_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '合同类型',
  `bank_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '还款金额',
  `serial_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'fn订单流水号',
  `submit_status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'submit反馈',
  `submit_message` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'submit反馈',
  `gmt_create` datetime(3) DEFAULT NULL,
  `gmt_modified` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='蜂鸟还款流水';

-- ----------------------------
-- Table structure for t_goods_brand
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_brand`;
CREATE TABLE `t_goods_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '编码',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `status` int(4) DEFAULT '0',
  `icon_src` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品品牌';

-- ----------------------------
-- Table structure for t_goods_call_traffic
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_call_traffic`;
CREATE TABLE `t_goods_call_traffic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键唯一标识',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `sale_price` bigint(20) DEFAULT NULL COMMENT '售价',
  `operator` int(11) DEFAULT NULL COMMENT '0:中国移动，1：中国联通，2：中国电信',
  `product_type` int(11) DEFAULT NULL COMMENT '产品类型：0：话费，1：流量',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '最后修改时间',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for t_goods_call_traffic_supplier
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_call_traffic_supplier`;
CREATE TABLE `t_goods_call_traffic_supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键唯一标识',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `denomination` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '面额',
  `sale_price` bigint(20) DEFAULT NULL COMMENT '售价x100',
  `purchase_price` bigint(20) DEFAULT NULL COMMENT '进货价x1000',
  `official_price` bigint(20) DEFAULT NULL COMMENT '官方价格x100',
  `discount_rate` decimal(10,5) DEFAULT NULL COMMENT '折扣',
  `limit_discount_rate` decimal(10,5) DEFAULT NULL COMMENT '限制折扣率',
  `operator` int(11) DEFAULT NULL COMMENT '0:中国移动，1：中国联通，2：中国电信',
  `product_type` int(11) DEFAULT NULL COMMENT '产品类型：0：话费，1：流量',
  `proportion` int(11) DEFAULT NULL COMMENT '比例',
  `supplier_type` int(11) DEFAULT NULL COMMENT '供应商：0：大汉，1：合赢',
  `use_scope` int(11) DEFAULT '0' COMMENT '使用范围：0：全国，1：全省',
  `fn_call_id` bigint(20) DEFAULT NULL COMMENT '对应蜂鸟充值产品ID',
  `call_traffic_id` bigint(20) DEFAULT NULL COMMENT '即有的产品ID',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '最后修改时间',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for t_goods_collect
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_collect`;
CREATE TABLE `t_goods_collect` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku唯一标识',
  `sku_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'sku编码',
  `sku_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'sku商品名称',
  `sku_sale_price` bigint(20) DEFAULT NULL COMMENT 'sku售价',
  `sku_month_amount` bigint(20) DEFAULT NULL COMMENT 'sku月供',
  `sku_img_src` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'sku图片',
  `id_person` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收藏用户ID',
  `status` int(11) DEFAULT '0' COMMENT '状态：\r\n0：可用，\r\n1：不可用\r\n\r\n',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品收藏';

-- ----------------------------
-- Table structure for t_goods_consult
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_consult`;
CREATE TABLE `t_goods_consult` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `id_person` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户ID',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品咨询';

-- ----------------------------
-- Table structure for t_goods_consult_img
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_consult_img`;
CREATE TABLE `t_goods_consult_img` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `consult_id` bigint(20) DEFAULT NULL,
  `src` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品咨询图片';

-- ----------------------------
-- Table structure for t_goods_consult_reply
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_consult_reply`;
CREATE TABLE `t_goods_consult_reply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `consult_id` bigint(20) DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品咨询回复';

-- ----------------------------
-- Table structure for t_goods_hotword
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_hotword`;
CREATE TABLE `t_goods_hotword` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '热词',
  `status` int(4) DEFAULT NULL COMMENT '状态 0 启用，1禁用 ，2删除',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for t_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_sku`;
CREATE TABLE `t_goods_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `spu_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `sku_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品池编码',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '卖点',
  `sales_volume` bigint(20) DEFAULT NULL COMMENT '销量',
  `real_sales_volume` bigint(20) DEFAULT NULL COMMENT '实际销量',
  `mkt_price` bigint(20) DEFAULT NULL COMMENT '市场价',
  `sale_price` bigint(20) DEFAULT NULL COMMENT '售价',
  `default_sku_code` int(11) DEFAULT NULL COMMENT '默认sku：0：Spu默认sku，1：非Spu默认sku',
  `sort` int(11) DEFAULT NULL COMMENT '排序码',
  `supplier` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '供应商',
  `supplier_sku_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '供应商商品编码（供应商sku）',
  `purchase_price` bigint(20) DEFAULT NULL COMMENT '采购价',
  `supp_sale_price` bigint(20) DEFAULT NULL COMMENT '供应商售价',
  `status` int(11) DEFAULT NULL COMMENT '状态：0新增，1删除，4待上架，5定时上下架，6已上架',
  `barcode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '条码',
  `weight` decimal(18,3) DEFAULT NULL COMMENT '重量',
  `unit` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '单位',
  `detail_id` bigint(20) DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL COMMENT '商品品牌',
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '品牌名称',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `spec_json` text COLLATE utf8mb4_unicode_ci COMMENT '商品规格序列',
  `month_amount` bigint(20) DEFAULT NULL COMMENT '月供',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `supplier_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '供应商分类',
  `sliding_scale` int(11) DEFAULT NULL,
  `up_shelves_time` bigint(20) DEFAULT NULL,
  `down_shelves_time` bigint(20) DEFAULT NULL,
  `month_amount_vip_first` bigint(20) DEFAULT NULL COMMENT 'VIP1月供x1000',
  `month_amount_vip_second` bigint(20) DEFAULT NULL COMMENT 'VIP2月供x1000',
  `free_interest` int(11) DEFAULT NULL COMMENT '商品：0：全息，3：3期免息，6：6期免息，12：12期免息',
  `safeguard_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '服务保障ID集合,例如：1,2,3..(英文逗号隔开)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for t_goods_sku_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_sku_detail`;
CREATE TABLE `t_goods_sku_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `param` text COLLATE utf8mb4_unicode_ci COMMENT 'SKU参数信息',
  `intruction` text COLLATE utf8mb4_unicode_ci COMMENT 'SKU介绍信息',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '关联SKUID',
  `status` int(4) DEFAULT '0' COMMENT '状态：\r\n0：可用，\r\n1：不可用',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for t_goods_sku_img
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_sku_img`;
CREATE TABLE `t_goods_sku_img` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT NULL,
  `f_default` int(11) DEFAULT NULL COMMENT '主图默认是 0',
  `src` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资源路径',
  `sort` int(20) DEFAULT NULL,
  `status` int(4) NOT NULL DEFAULT '0' COMMENT '状态：\r\n0：可用，\r\n1：不可用',
  `last_modify` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品明细主图';

-- ----------------------------
-- Table structure for t_goods_sku_member_price
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_sku_member_price`;
CREATE TABLE `t_goods_sku_member_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT NULL,
  `level_id` bigint(20) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL COMMENT '价格',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品会员价';

-- ----------------------------
-- Table structure for t_goods_sku_stock
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_sku_stock`;
CREATE TABLE `t_goods_sku_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT NULL,
  `province_id` bigint(20) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  `stock` bigint(20) DEFAULT NULL COMMENT '总库存',
  `freez` bigint(20) DEFAULT NULL COMMENT '冻结库存',
  `valid` bigint(20) DEFAULT NULL COMMENT '可用库存',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品池库存';

-- ----------------------------
-- Table structure for t_goods_specification
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_specification`;
CREATE TABLE `t_goods_specification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `alias` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '别名',
  `sort` int(11) DEFAULT NULL COMMENT '顺序码',
  `spu_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `status` int(4) DEFAULT '0' COMMENT '状态：\r\n0： 可用，\r\n1：不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品规格属性';

-- ----------------------------
-- Table structure for t_goods_specification_value
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_specification_value`;
CREATE TABLE `t_goods_specification_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `spec_id` bigint(20) DEFAULT NULL COMMENT '商品属性ID',
  `spec_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spec_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '属性值',
  `spec_alias` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '别名',
  `sort` int(11) DEFAULT NULL COMMENT '顺序码',
  `f_default` int(11) DEFAULT NULL COMMENT '默认项',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'SKU唯一标识',
  `status` int(4) DEFAULT '6' COMMENT '状态：\r\n0: 新增，\r\n1:删除，\r\n2: 待审核，\r\n3:审核未通过，\r\n4:待上架，\r\n5:定时上架，\r\n6:已上架\r\n\r\n注：使用商品的状态码，暂时性的设计',
  `last_modify` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品规格属性值';

-- ----------------------------
-- Table structure for t_goods_spu
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_spu`;
CREATE TABLE `t_goods_spu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_level_type_id` bigint(20) DEFAULT NULL COMMENT '商品分类ID',
  `second_level_type_id` bigint(20) DEFAULT NULL,
  `third_level_type_id` bigint(20) DEFAULT NULL,
  `spu_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品编码',
  `adwords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关键词广告',
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关键词',
  `status` int(11) NOT NULL COMMENT '0: 新增，1:删除，2: 待审核，3:审核未通过，4:待上架，5:定时上架，6:已上架\r\n',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `cascade_type_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '级联类型名称',
  `up_shelves_time` bigint(20) DEFAULT NULL COMMENT '上架时间',
  `down_shelves_time` bigint(20) DEFAULT NULL COMMENT '下架时间',
  `create_time` bigint(20) DEFAULT NULL,
  `is_installments` int(11) DEFAULT NULL COMMENT '是否分期：1：分期，0：不分期',
  `interest_rate` int(20) DEFAULT NULL COMMENT '折扣率',
  `down_payment_rate` int(20) DEFAULT NULL COMMENT '首付比率',
  `periods` int(11) DEFAULT NULL COMMENT '分期数',
  `is_phone` int(11) DEFAULT NULL COMMENT '是否是手机:0：非手机，1：手机',
  `channel` int(11) DEFAULT NULL COMMENT '0:APP商城，1:手Q',
  `tag` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签：0：手机，1：数码，2：家电',
  `is_promotion` int(11) DEFAULT NULL COMMENT '是否是促销商品：0：无促销，1：有促销',
  `first_category_id` bigint(20) DEFAULT NULL COMMENT '一级分类：大分类',
  `second_category_id` bigint(20) DEFAULT NULL COMMENT '二级分类：小分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品表（SPU）';

-- ----------------------------
-- Table structure for t_goods_types
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_types`;
CREATE TABLE `t_goods_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父节点',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `full_num` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类路径',
  `sort_num` bigint(20) DEFAULT NULL COMMENT '顺序号',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品分类(后台)';

-- ----------------------------
-- Table structure for t_id_config
-- ----------------------------
DROP TABLE IF EXISTS `t_id_config`;
CREATE TABLE `t_id_config` (
  `biz_tag` varchar(128) NOT NULL,
  `max_id` bigint(20) NOT NULL,
  `step` int(11) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `updatetime` timestamp NOT NULL DEFAULT '2017-05-03 10:05:00' ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `biz_tag` (`biz_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_jd_accesstoken
-- ----------------------------
DROP TABLE IF EXISTS `t_jd_accesstoken`;
CREATE TABLE `t_jd_accesstoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `expires_in` bigint(20) DEFAULT NULL,
  `refresh_token_expires` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `gmt_create` datetime(3) DEFAULT NULL,
  `gmt_modified` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='京东accesstoken信息';

-- ----------------------------
-- Table structure for t_jd_adress
-- ----------------------------
DROP TABLE IF EXISTS `t_jd_adress`;
CREATE TABLE `t_jd_adress` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `full_num` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43468 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='京东地址';

-- ----------------------------
-- Table structure for t_jd_config
-- ----------------------------
DROP TABLE IF EXISTS `t_jd_config`;
CREATE TABLE `t_jd_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_secret` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='京东配置信息';

-- ----------------------------
-- Table structure for t_jd_goods_gift_conf
-- ----------------------------
DROP TABLE IF EXISTS `t_jd_goods_gift_conf`;
CREATE TABLE `t_jd_goods_gift_conf` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT NULL,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `county` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gift_type` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `max_num` int(11) DEFAULT NULL,
  `min_num` int(11) DEFAULT NULL,
  `promo_start_time` bigint(20) DEFAULT NULL,
  `promo_end_time` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='京东赠品配置';

-- ----------------------------
-- Table structure for t_jd_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `t_jd_goods_sku`;
CREATE TABLE `t_jd_goods_sku` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` bigint(20) unsigned DEFAULT NULL COMMENT '协议价格',
  `jd_price` bigint(20) unsigned DEFAULT NULL COMMENT '京东价格',
  `weight` decimal(18,3) DEFAULT NULL COMMENT '重量',
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jd_state` int(11) DEFAULT NULL,
  `gu_state` int(11) DEFAULT NULL,
  `brand_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_area` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upc` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_unit` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ware_qd` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_sku` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=2064 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='京东商品池';

-- ----------------------------
-- Table structure for t_jd_goods_sku_arealimit
-- ----------------------------
DROP TABLE IF EXISTS `t_jd_goods_sku_arealimit`;
CREATE TABLE `t_jd_goods_sku_arealimit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT NULL,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `county` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_area_restrict` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='京东商品区域限制购买配置';

-- ----------------------------
-- Table structure for t_jd_goods_sku_blob
-- ----------------------------
DROP TABLE IF EXISTS `t_jd_goods_sku_blob`;
CREATE TABLE `t_jd_goods_sku_blob` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) unsigned NOT NULL COMMENT '详细表id',
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `param` text COLLATE utf8mb4_unicode_ci,
  `app_introduce` mediumtext COLLATE utf8mb4_unicode_ci,
  `introduction` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_sku_id` (`sku_id`),
  UNIQUE KEY `uk_sku` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=2063 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='京东商品池扩展表';

-- ----------------------------
-- Table structure for t_jd_goods_sku_img
-- ----------------------------
DROP TABLE IF EXISTS `t_jd_goods_sku_img`;
CREATE TABLE `t_jd_goods_sku_img` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_primary` int(11) DEFAULT NULL,
  `order_sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sku_id` (`sku_id`),
  KEY `idx_sku` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=46253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='京东商品图片';

-- ----------------------------
-- Table structure for t_jd_goods_sku_service
-- ----------------------------
DROP TABLE IF EXISTS `t_jd_goods_sku_service`;
CREATE TABLE `t_jd_goods_sku_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT NULL,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_state` int(11) DEFAULT NULL,
  `is_can_VAT` int(11) DEFAULT NULL,
  `is7_to_return` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='京东商品服务';

-- ----------------------------
-- Table structure for t_jd_goods_sku_specification
-- ----------------------------
DROP TABLE IF EXISTS `t_jd_goods_sku_specification`;
CREATE TABLE `t_jd_goods_sku_specification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dim` int(11) DEFAULT NULL,
  `sale_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_value` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sku_id` (`sku_id`),
  KEY `idx_sku` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=1901 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for t_jd_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_jd_order_detail`;
CREATE TABLE `t_jd_order_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT NULL,
  `sku` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num` bigint(20) DEFAULT NULL,
  `b_need_annex` int(11) DEFAULT NULL,
  `b_need_gift` int(11) DEFAULT NULL,
  `price` bigint(18) DEFAULT NULL,
  `yanbao` text COLLATE utf8mb4_unicode_ci,
  `order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='京东下单明细';

-- ----------------------------
-- Table structure for t_jd_orders
-- ----------------------------
DROP TABLE IF EXISTS `t_jd_orders`;
CREATE TABLE `t_jd_orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `third_order` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `county` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_state` int(11) DEFAULT NULL,
  `invoice_type` int(11) DEFAULT NULL,
  `selected_invoice_title` int(11) DEFAULT NULL,
  `company_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_content` int(11) DEFAULT NULL,
  `payment_type` int(11) DEFAULT NULL,
  `is_use_balance` int(11) DEFAULT NULL,
  `submit_state` int(11) DEFAULT NULL,
  `invoice_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_provice` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_city` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_county` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `do_order_price_mode` int(11) DEFAULT NULL,
  `order_price_snap` text COLLATE utf8mb4_unicode_ci,
  `reserving_date` int(11) DEFAULT NULL,
  `install_date` int(11) DEFAULT NULL,
  `need_install` int(11) DEFAULT NULL,
  `promise_date` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promise_time_range` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promise_time_range_code` int(11) DEFAULT NULL,
  `order_status` int(11) DEFAULT '1' COMMENT '订单状态 1-下单成功 2-取消订单',
  `jd_order_id` bigint(20) DEFAULT NULL COMMENT '京东订单Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='京东下单记录';

-- ----------------------------
-- Table structure for t_pay_business
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_business`;
CREATE TABLE `t_pay_business` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '编码',
  `secret_key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密钥',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='支付业务接入';

-- ----------------------------
-- Table structure for t_pay_channel
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_channel`;
CREATE TABLE `t_pay_channel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `channel_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '支付渠道',
  `channel_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道名称',
  `source` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '来源：Android;IOS;PC;H5等',
  `orders` int(11) NOT NULL COMMENT '展示顺序,排序显示',
  `status` int(11) NOT NULL COMMENT '状态：0无效；1有效',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '详细描述',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for t_pay_payment
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_payment`;
CREATE TABLE `t_pay_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `pay_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '支付Id',
  `order_no` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务订单号',
  `order_amt` bigint(11) DEFAULT NULL COMMENT '订单金额(分)',
  `channel_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付渠道类型,扫码支付，公众号支付等',
  `third_trade_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方交易号',
  `source` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '来源 Android ios pc',
  `biz_type` int(11) DEFAULT NULL COMMENT '业务类型 具体哪个业务系统的支付 1、购物 2还款',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `client_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户端ip',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `status` int(11) DEFAULT NULL COMMENT '状态：0 等待付款，1：支付成功',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `trade_time` bigint(20) DEFAULT NULL COMMENT '交易时间',
  `retry_count` int(6) DEFAULT NULL COMMENT '重试次数',
  `extraData` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '附加数据扩展',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pay_id` (`pay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=460 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for t_pay_payment_config
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_payment_config`;
CREATE TABLE `t_pay_payment_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `business_id` bigint(20) DEFAULT NULL COMMENT '业务ID',
  `payment` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付方式',
  `app_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mch_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商务号',
  `seller_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收款账号',
  `app_secret` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密钥',
  `app_key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付密钥',
  `type` int(11) DEFAULT NULL COMMENT '支付类型',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `rsa_private` text COLLATE utf8mb4_unicode_ci COMMENT '支付宝私钥',
  `rsa_public` text COLLATE utf8mb4_unicode_ci COMMENT '支付宝公钥',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='支付方式配置';

-- ----------------------------
-- Table structure for t_pay_refund
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_refund`;
CREATE TABLE `t_pay_refund` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `refund_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '退款号（与第三方支付交互，如alipay的batchNo）',
  `pay_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付号',
  `refund_type` int(11) DEFAULT NULL COMMENT '退款类型 那个业务系统 1、购物退款 2 还款退款',
  `refund_no` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '退款单号',
  `refund_amt` bigint(11) DEFAULT NULL COMMENT '退款金额',
  `refund_rate` int(11) DEFAULT NULL COMMENT '退款费率',
  `refund_reason` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '退款原因',
  `third_refund_no` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方退款号',
  `status` int(11) DEFAULT NULL COMMENT '退款状态：0退款处理中；1退款成功；2退款失败；',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `trade_time` bigint(20) DEFAULT NULL COMMENT '交易时间',
  `retry_count` int(11) DEFAULT NULL COMMENT '重试次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `refund_id` (`refund_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for t_phone_segment
-- ----------------------------
DROP TABLE IF EXISTS `t_phone_segment`;
CREATE TABLE `t_phone_segment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `phone_segment` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isp` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `types` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phonesegment` (`phone_segment`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=344356 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for t_service_safeguard
-- ----------------------------
DROP TABLE IF EXISTS `t_service_safeguard`;
CREATE TABLE `t_service_safeguard` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `detail` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '详情',
  `src` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片地址',
  `sort` int(11) DEFAULT NULL COMMENT '顺序号',
  `status` int(11) DEFAULT NULL,
  `last_modify` bigint(20) DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for t_service_safeguard_sku
-- ----------------------------
DROP TABLE IF EXISTS `t_service_safeguard_sku`;
CREATE TABLE `t_service_safeguard_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `safeguard_id` bigint(20) DEFAULT NULL COMMENT '名称',
  `status` int(11) DEFAULT NULL,
  `sku_id` bigint(20) DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for t_shop_aftersales
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_aftersales`;
CREATE TABLE `t_shop_aftersales` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='售后服务单';

-- ----------------------------
-- Table structure for t_shop_alert_contact
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_alert_contact`;
CREATE TABLE `t_shop_alert_contact` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `biz_code` int(11) unsigned NOT NULL,
  `biz_desc` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `gmt_create` datetime(3) DEFAULT NULL,
  `gmt_modified` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商城告警联系人';

-- ----------------------------
-- Table structure for t_shop_cart
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_cart`;
CREATE TABLE `t_shop_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_ident` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户标识',
  `user_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku_id` bigint(20) DEFAULT NULL,
  `count` int(11) DEFAULT NULL COMMENT '数量',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `params` text COLLATE utf8mb4_unicode_ci COMMENT '参数',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='购物车';

-- ----------------------------
-- Table structure for t_shop_fn_sales
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_fn_sales`;
CREATE TABLE `t_shop_fn_sales` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `sku_id` bigint(20) DEFAULT NULL,
  `fn_credit_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '蜂鸟销售提单id',
  `fn_contract_number` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '蜂鸟合同号',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for t_shop_goods_type_map
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_goods_type_map`;
CREATE TABLE `t_shop_goods_type_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) DEFAULT NULL COMMENT '关联对象ID',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `shop_goods_type_id` bigint(20) DEFAULT NULL COMMENT '品类ID',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商城品类关联';

-- ----------------------------
-- Table structure for t_shop_goods_typs
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_goods_typs`;
CREATE TABLE `t_shop_goods_typs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父节点',
  `sort` bigint(20) DEFAULT NULL COMMENT '顺序号',
  `full_num` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类路径',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `icon_src` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商城品类';

-- ----------------------------
-- Table structure for t_shop_order_buy_log
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_order_buy_log`;
CREATE TABLE `t_shop_order_buy_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `order_no` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单号',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '物流信息',
  `operator` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作人',
  `id_person` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户id',
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '渠道类型：qq-手Q，sc-商城,cz-充值',
  `indexs` tinyint(1) DEFAULT NULL COMMENT '顺序: 京东产生物流前=1，之后=2',
  PRIMARY KEY (`id`),
  KEY `order_no` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单购买记录日志表';

-- ----------------------------
-- Table structure for t_shop_order_contract_log
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_order_contract_log`;
CREATE TABLE `t_shop_order_contract_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `order_no` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单号',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态: 0-取消合同失败, 1-取消合同成功, 2-现行合同失败, 3-现行合同成功',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `fn_contract_no` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '蜂鸟合同号',
  `id_person` bigint(255) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for t_shop_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_order_detail`;
CREATE TABLE `t_shop_order_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `sku_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `brand` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '品牌名称',
  `price` bigint(18) DEFAULT NULL COMMENT '实际单价',
  `mkt_price` bigint(18) DEFAULT NULL COMMENT '市场价',
  `count` int(11) DEFAULT NULL COMMENT '订购数量',
  `sale_price` bigint(18) DEFAULT NULL COMMENT '销售价',
  `purchase` bigint(18) DEFAULT NULL COMMENT '采购价',
  `member_price` bigint(18) DEFAULT NULL COMMENT '会员价',
  `discount_amount` bigint(20) DEFAULT NULL COMMENT '优惠金额',
  `amount` bigint(18) DEFAULT NULL COMMENT '总金额',
  `weight` decimal(18,3) DEFAULT NULL COMMENT '重量',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `sku_src` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'sku图片',
  `operator` int(11) unsigned DEFAULT NULL COMMENT '运营商：0:中国移动，1：中国联通，2：中国电信',
  `product_id` bigint(8) DEFAULT NULL COMMENT '产品id',
  `fn_product_id` bigint(8) DEFAULT NULL COMMENT '蜂鸟产品id',
  `supplier_product_id` bigint(8) DEFAULT NULL COMMENT '供应商id',
  `supplier_type` int(2) DEFAULT NULL COMMENT '供应商类型: 0：大汉，1：合赢',
  `mobile` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `third_serial_number` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方序列号',
  `serial_number` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '序列号（系统生成）',
  `goods_type` tinyint(2) DEFAULT NULL COMMENT '商品类型:　0-京东商品，1-流量，2-话费',
  `is_phone` tinyint(1) DEFAULT NULL COMMENT '是否为苹果手机',
  `insurancefeemax` bigint(20) DEFAULT NULL COMMENT '保险费用',
  `down_payment` bigint(20) DEFAULT NULL COMMENT '首付',
  `down_payment_rate` int(11) DEFAULT NULL COMMENT '首付比例',
  `month_payment` bigint(20) DEFAULT NULL COMMENT '月供',
  `periods` int(11) DEFAULT NULL COMMENT '期数',
  `safeguard_names` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品服名称集合',
  `is_installments` int(11) DEFAULT NULL COMMENT '是否为分期商品: 0-否，1-是',
  `fn_contract_no` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '蜂鸟合同号',
  `fn_contract_no_type` int(1) DEFAULT NULL COMMENT '状态: 0-生成，1-现行，2-取消',
  `id_credit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合同id',
  `lates_repay_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最迟还款日',
  `first_category_id` bigint(20) DEFAULT NULL,
  `second_category_id` bigint(20) DEFAULT NULL,
  `src_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细';

-- ----------------------------
-- Table structure for t_shop_order_logistics
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_order_logistics`;
CREATE TABLE `t_shop_order_logistics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单号',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单详情id',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '消息',
  `msg_time` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '消息时间',
  `operator` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for t_shop_order_pay
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_order_pay`;
CREATE TABLE `t_shop_order_pay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payment` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付方式',
  `pay_amount` bigint(18) DEFAULT NULL COMMENT '支付金额',
  `status` int(11) DEFAULT NULL COMMENT '状态: 0-预支付, 1-支付成功，2-支付失败',
  `trade_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付单号',
  `order_id` bigint(20) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `pay_time` bigint(20) DEFAULT NULL COMMENT '支付完成时间',
  `pay_type` int(11) DEFAULT NULL COMMENT '支付类型',
  `return_url` text COLLATE utf8mb4_unicode_ci COMMENT '支付回调地址',
  `notify_url` text COLLATE utf8mb4_unicode_ci COMMENT '支付通知地址',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `order_no` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单号: 更新用此字段, 可以减少查询',
  `third_transaction_no` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方支付号 微信支付宝 交易号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单支付方式';

-- ----------------------------
-- Table structure for t_shop_order_refunds_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_order_refunds_pay_log`;
CREATE TABLE `t_shop_order_refunds_pay_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `order_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单号',
  `status` int(11) DEFAULT NULL COMMENT '退款状态: 0-未退款，1-申请退款中，2-退款成功',
  `trade_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付单号',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `pay_type` int(11) DEFAULT NULL COMMENT '1-微信，2-支付宝',
  `pay_price` bigint(11) DEFAULT NULL COMMENT '退款金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for t_shop_order_repayment_plan
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_order_repayment_plan`;
CREATE TABLE `t_shop_order_repayment_plan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `periods` int(11) DEFAULT NULL COMMENT '期数',
  `amount` bigint(18) DEFAULT NULL COMMENT '月供',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `order_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单号',
  `repay_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '还款日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单还款计划';

-- ----------------------------
-- Table structure for t_shop_order_reviews
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_order_reviews`;
CREATE TABLE `t_shop_order_reviews` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `sku_id` bigint(20) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `content` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品评价';

-- ----------------------------
-- Table structure for t_shop_order_reviews_img
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_order_reviews_img`;
CREATE TABLE `t_shop_order_reviews_img` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `src` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cdn_src` text COLLATE utf8mb4_unicode_ci,
  `sort` int(11) DEFAULT NULL,
  `review_id` bigint(20) DEFAULT NULL,
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品评价图片';

-- ----------------------------
-- Table structure for t_shop_orders
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_orders`;
CREATE TABLE `t_shop_orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) DEFAULT NULL COMMENT '订单号',
  `id_person` bigint(50) DEFAULT NULL,
  `consignee` varchar(50) DEFAULT NULL COMMENT '收货人',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机',
  `province` varchar(20) DEFAULT NULL COMMENT '省份',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `county` varchar(50) DEFAULT NULL COMMENT '地区',
  `town` varchar(20) DEFAULT NULL COMMENT '乡镇',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `amount` bigint(18) DEFAULT NULL COMMENT '结算金额',
  `goods_amount` bigint(18) DEFAULT NULL COMMENT '商品货款',
  `discount_amount` bigint(18) DEFAULT NULL COMMENT '优惠金额',
  `down_payment` bigint(18) DEFAULT NULL COMMENT '首付金额',
  `periods` int(11) DEFAULT NULL COMMENT '期数',
  `payed_amount` bigint(18) DEFAULT NULL COMMENT '支付金额',
  `status` int(11) DEFAULT NULL COMMENT '状态:0-订单创建中,1-待付款,2-待首付,3-待发货,4-待收货,5-已完成,6-已关闭,7-退款成功,20-充值中,21-充值成功,22-充值失败',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `ip` varchar(20) DEFAULT NULL COMMENT '客户IP',
  `invoice` int(11) DEFAULT NULL COMMENT '是否开票',
  `invoice_type` int(11) DEFAULT NULL COMMENT '开票类型',
  `company` varchar(255) DEFAULT NULL COMMENT '开票抬头',
  `content` varchar(255) DEFAULT NULL COMMENT '开票内容',
  `source` varchar(50) DEFAULT NULL COMMENT '来源',
  `add` text COMMENT '扩展',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `order_finish_time` bigint(20) DEFAULT NULL COMMENT '订单完成时间',
  `sale_status` int(20) DEFAULT NULL COMMENT '售后状态',
  `supplier_order_no` varchar(50) DEFAULT NULL COMMENT '京东订单编号',
  `remark` text COMMENT '备注',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `user_mobile` varchar(20) DEFAULT NULL COMMENT '用户手机',
  `user_status` int(11) DEFAULT NULL COMMENT '用户状态',
  `delivery_method` varchar(20) DEFAULT NULL COMMENT '配送方式',
  `logistics_no` varchar(50) DEFAULT NULL COMMENT '物流单号',
  `deal_time` bigint(20) DEFAULT NULL COMMENT '成交时间',
  `freight` bigint(6) DEFAULT NULL COMMENT '运费',
  `goods_type` tinyint(2) DEFAULT '0' COMMENT '商品类型:　0-京东商品，1-流量，2-话费',
  `order_memo` varchar(255) DEFAULT NULL COMMENT '买家留言',
  `pay_type` int(1) DEFAULT NULL COMMENT '支付类型:0-钱包，1-微信，2-支付宝',
  `channel` varchar(20) DEFAULT NULL COMMENT '渠道: qq-手Q，sc-商城,cz-充值',
  `openid` varchar(60) DEFAULT NULL COMMENT 'qq的openid',
  `user_level` int(2) DEFAULT NULL COMMENT '用户等级',
  `random_code` varchar(255) DEFAULT NULL COMMENT '随机码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=utf8 COMMENT='订单';

-- ----------------------------
-- Table structure for t_system_counter
-- ----------------------------
DROP TABLE IF EXISTS `t_system_counter`;
CREATE TABLE `t_system_counter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务编码名称',
  `prefix` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '前缀,两位作为标识：如02、23、等',
  `is_date` int(11) unsigned zerofill DEFAULT NULL COMMENT '包含日期 0不包含 1包含',
  `date_format` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日期格式',
  `min` bigint(20) DEFAULT NULL COMMENT '起始数',
  `current` bigint(20) DEFAULT NULL COMMENT '当前数',
  `max` bigint(20) DEFAULT NULL COMMENT '最大数',
  `is_loop` int(11) DEFAULT NULL COMMENT '是否循环',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `step_size` int(11) DEFAULT NULL COMMENT '步长',
  `length` int(11) DEFAULT NULL COMMENT '生成序列长度',
  PRIMARY KEY (`id`),
  UNIQUE KEY `biz_name` (`biz_name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='单号生成器';

-- ----------------------------
-- Table structure for t_system_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `t_system_dictionary`;
CREATE TABLE `t_system_dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父节点',
  `full_num` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '节点路径',
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '编码',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `value` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '值',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='数据字典';

-- ----------------------------
-- Table structure for t_system_errorcode
-- ----------------------------
DROP TABLE IF EXISTS `t_system_errorcode`;
CREATE TABLE `t_system_errorcode` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '编码',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='错误码配置';

-- ----------------------------
-- Table structure for t_system_result_msg_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `t_system_result_msg_dictionaries`;
CREATE TABLE `t_system_result_msg_dictionaries` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型: 商城前端-app, 商城后台-back',
  `code` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '编码, 多个编码使用逗号隔开',
  `msg` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '编码对应前端展示的提示语',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for t_system_right
-- ----------------------------
DROP TABLE IF EXISTS `t_system_right`;
CREATE TABLE `t_system_right` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(128) NOT NULL COMMENT '描述',
  `url` varchar(128) NOT NULL,
  `seq` varchar(32) NOT NULL COMMENT '序号',
  `visible` tinyint(4) NOT NULL COMMENT '可见',
  `icon` varchar(32) NOT NULL COMMENT '图标',
  `parent_id` int(11) NOT NULL,
  `status` int(4) NOT NULL COMMENT '0:可用，\r\n1：不可用，\r\n2：删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建人',
  `update_user_id` int(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='管理后台权限表';

-- ----------------------------
-- Table structure for t_system_role
-- ----------------------------
DROP TABLE IF EXISTS `t_system_role`;
CREATE TABLE `t_system_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色表',
  `name` varchar(32) NOT NULL,
  `description` varchar(128) NOT NULL,
  `status` int(4) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理后台角色表';

-- ----------------------------
-- Table structure for t_system_role_right
-- ----------------------------
DROP TABLE IF EXISTS `t_system_role_right`;
CREATE TABLE `t_system_role_right` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `right_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `FK_Reference_40` (`role_id`,`right_id`) USING BTREE,
  KEY `FK_Reference_39` (`right_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
-- Table structure for t_system_sms_verification
-- ----------------------------
DROP TABLE IF EXISTS `t_system_sms_verification`;
CREATE TABLE `t_system_sms_verification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `phone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `sms_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '验证码',
  `sms_content` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发送内容',
  `sent_status` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发送状态',
  `verify_status` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '验证状态(默认0：未校验；1：校验通过；2：校验不通过)',
  `sent_time` datetime DEFAULT NULL COMMENT '发送时间',
  `virify_time` datetime DEFAULT NULL COMMENT '验证时间',
  `code_type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '验证码类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1287 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='短信验证码验证记录表';

-- ----------------------------
-- Table structure for t_system_user
-- ----------------------------
DROP TABLE IF EXISTS `t_system_user`;
CREATE TABLE `t_system_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表',
  `name` varchar(255) NOT NULL,
  `account` char(6) NOT NULL,
  `password` char(32) NOT NULL,
  `email` varchar(64) NOT NULL,
  `phone` char(11) NOT NULL,
  `status` int(4) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理后台用户表';

-- ----------------------------
-- Table structure for t_system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_system_user_role`;
CREATE TABLE `t_system_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `FK_Reference_41` (`user_id`,`role_id`) USING BTREE,
  KEY `FK_Reference_36` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Table structure for t_tencent_credit_log
-- ----------------------------
DROP TABLE IF EXISTS `t_tencent_credit_log`;
CREATE TABLE `t_tencent_credit_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '姓名',
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `qq_open_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '腾讯手Q openid',
  `id_card` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证',
  `tencent_credit_score` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '腾讯信用分',
  `tencent_xfjr_Score` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '腾讯消费金融分',
  `giveu_credit_score` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '即有分',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `ip_address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '邮编',
  `id_person` bigint(20) DEFAULT NULL COMMENT '对应蜂鸟接口 id_person',
  `login_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录用户名',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录密码',
  `status` int(11) DEFAULT NULL COMMENT '状态：1 启用；0 禁用;2钱包已激活',
  `register_time` bigint(20) DEFAULT NULL COMMENT '注册时间',
  `register_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '注册ip',
  `login_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录ip',
  `platform` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '注册平台 ',
  `uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方用',
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_modify` bigint(20) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL COMMENT '性别 0未知 1男 2女',
  `nick_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `user_pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱地址',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `cert_type` int(11) DEFAULT NULL COMMENT '证件类型 1 身份证 2军官证 ',
  `cert_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
  `real_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户真实姓名',
  `birthday` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生日',
  `post_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮编',
  `update_time` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '来源 h5 web android ios',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '权限名称 User Admin',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='登录账号信息';

-- ----------------------------
-- Table structure for t_user_month_recharge_cumulative
-- ----------------------------
DROP TABLE IF EXISTS `t_user_month_recharge_cumulative`;
CREATE TABLE `t_user_month_recharge_cumulative` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_person` int(60) DEFAULT NULL COMMENT 'idPerson',
  `month` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '格式为: 2017-05',
  `price` bigint(5) DEFAULT NULL COMMENT '已充值金额，单位分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for t_user_token
-- ----------------------------
DROP TABLE IF EXISTS `t_user_token`;
CREATE TABLE `t_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `access_token` varchar(255) DEFAULT NULL COMMENT '访问token',
  `refresh_token` varchar(255) DEFAULT NULL COMMENT '刷新token',
  `device_id` varchar(255) DEFAULT NULL COMMENT '设备id',
  `expires_time` bigint(20) DEFAULT NULL COMMENT '过期时间',
  `status` int(11) DEFAULT NULL COMMENT '状态：0 不可用，1：可用',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '最后修改时间',
  `ip_address` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `type` int(20) DEFAULT NULL COMMENT 'token 类型 type 1 带权限token(登录之后的token) 2 不带权限的token(访客token)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Procedure structure for prd_id_service
-- ----------------------------
DROP PROCEDURE IF EXISTS `prd_id_service`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `prd_id_service`(IN biz_name VARCHAR(128))
BEGIN 		DECLARE curr_max_id ,min_id_add,max_id_add BIGINT DEFAULT 0; 		DECLARE step_size INT DEFAULT 0; 		START TRANSACTION; 		SELECT max_id,step INTO curr_max_id, step_size from t_id_config where biz_tag=biz_name; 		SET max_id_add=curr_max_id+step_size;/*设置号段最大值*/ 		SET min_id_add=curr_max_id+1;/*设置号段最小值*/ 		UPDATE t_id_config set max_id=max_id_add,updatetime=now() where biz_tag=biz_name; 		SELECT biz_name,min_id_add as start_id,max_id_add as end_id,step_size; 		COMMIT; END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for PROCTEST
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROCTEST`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `PROCTEST`(IN biz_name VARCHAR(128))
BEGIN 		select * from t_id_config WHERE biz_tag = biz_name; END
;;
DELIMITER ;
