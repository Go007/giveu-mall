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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='京东商品池';

-- 唯一索引
create unique index uk_sku on t_jd_goods_sku(sku);
