
DROP TABLE IF EXISTS `t_user_address`;
CREATE TABLE `t_user_address` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT 't_user id',
  `id_person` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'fn�û�id',
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '�ͻ�����',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '��ϵ�绰',
  `province` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'ʡ��',
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '����',
  `region` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '��',
  `street` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '�ֵ�',
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '��ϸ��ַ',
  `address_type` int(11) DEFAULT NULL COMMENT '��ַ����',
  `is_default` int(11) DEFAULT NULL COMMENT 'Ĭ�ϵ�ַ(1:��;0:��)',
  `state` int(11) DEFAULT NULL COMMENT '״̬(1:��Ч;0:��Ч)',
  `gmt_create` datetime(3) DEFAULT NULL,
  `gmt_modified` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='�û���ַ';
