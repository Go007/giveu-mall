--  新增PPMoney开户字段
ALTER TABLE `t_shop_order_detail` ADD COLUMN `is_ppm_open` int NULL COMMENT 'ppmoney是否开户: 0-未开户, 1-开户, 2-开户失败';
ALTER TABLE `t_shop_order_detail` ADD COLUMN `is_sale_on_credit` int NULL COMMENT '是否赊销模式现行: 1-是 0-不是';
ALTER TABLE `t_shop_order_detail` ADD COLUMN `is_recharge_callback` int NULL COMMENT '是否充值回调: 0-充值未回调, 1-已回调';
alter table t_shop_order_contract_log change creditType credit_type varchar(12);
