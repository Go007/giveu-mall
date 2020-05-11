DROP TABLE IF EXISTS `t_user_potential`;
CREATE TABLE `t_user_potential` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `p_id_person` bigint(20) NOT NULL COMMENT '��idPerson',
  `user_id` bigint(20) NOT NULL COMMENT 't_user id',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '�û�����',
  `ident` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '���֤',
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '�ֻ���',
  `card_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '���п���',
  `bank_code` int(11) DEFAULT NULL COMMENT '�����з������',
  `bank_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����������',
  `status` int(11) NOT NULL COMMENT '����״̬;δ�������ɹ�������ʧ��',
  `fn_id_person` bigint(20) DEFAULT NULL COMMENT '����idPerson',
  `trad_pwd` varchar(50) DEFAULT NULL COMMENT '��������',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='�̳�δ�����û�';
