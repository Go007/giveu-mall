
alter table `t_fn_repayment_jrn` add column `bank_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '�������б���';
alter table `t_fn_repayment_jrn` add column `bank` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '��������';
alter table `t_fn_repayment_jrn` add column `bank_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '���п���';
alter table `t_fn_repayment_jrn` add column `bank_person` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '�ֿ�������';
alter table `t_fn_repayment_jrn` add column `id_credit` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '��ͬID';
alter table `t_fn_repayment_jrn` add column `open_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '������open id';

