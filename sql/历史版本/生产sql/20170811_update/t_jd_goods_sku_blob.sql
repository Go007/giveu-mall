DROP TABLE IF EXISTS `t_jd_goods_sku_blob`;
CREATE TABLE `t_jd_goods_sku_blob` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) unsigned NOT NULL COMMENT '详细表id',
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `param` text COLLATE utf8mb4_unicode_ci,
  `app_introduce` mediumtext COLLATE utf8mb4_unicode_ci,
  `introduction` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='京东商品池扩展表';

-- 唯一索引
create unique index uk_sku_id on t_jd_goods_sku_blob(sku_id);
-- 唯一索引
create unique index uk_sku on t_jd_goods_sku_blob(sku);
