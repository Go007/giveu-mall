
alter table `t_fn_repayment_jrn` add column `bank_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '蜂鸟银行编码';
alter table `t_fn_repayment_jrn` add column `bank` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '银行名称';
alter table `t_fn_repayment_jrn` add column `bank_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '银行卡号';
alter table `t_fn_repayment_jrn` add column `bank_person` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '持卡人姓名';
alter table `t_fn_repayment_jrn` add column `id_credit` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '合同ID';
alter table `t_fn_repayment_jrn` add column `open_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '第三方open id';

