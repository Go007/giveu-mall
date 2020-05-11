DROP TABLE IF EXISTS `t_user_potential`;
CREATE TABLE `t_user_potential` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `p_id_person` bigint(20) NOT NULL COMMENT '假idPerson',
  `user_id` bigint(20) NOT NULL COMMENT 't_user id',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户姓名',
  `ident` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '身份证',
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `card_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '银行卡号',
  `bank_code` int(11) DEFAULT NULL COMMENT '发卡行蜂鸟编码',
  `bank_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发卡行名称',
  `status` int(11) NOT NULL COMMENT '激活状态;未激活，激活成功，激活失败',
  `fn_id_person` bigint(20) DEFAULT NULL COMMENT '蜂鸟idPerson',
  `trad_pwd` varchar(50) DEFAULT NULL COMMENT '交易密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商城未激活用户';
