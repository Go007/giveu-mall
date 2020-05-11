-- 消息编号
INSERT INTO `t_system_counter` (`biz_name`, `prefix`, `is_date`, `date_format`, `min`, `current`, `max`, `is_loop`, `create_time`, `last_modify`, `step_size`, `length`) VALUES ( 'msgNo', '18', '00000000001', 'yyyyMMddHHmmss', '1', NULL, '1001', NULL, NULL, '1507780237677', '1000', '20');
--  优惠券
INSERT INTO `t_system_counter` (`biz_name`, `prefix`, `is_date`, `date_format`, `min`, `current`, `max`, `is_loop`, `create_time`, `last_modify`, `step_size`, `length`) VALUES ('coupon', 'CP', '00000000001', 'yyyyMMdd', '1002', NULL, '2002', NULL, NULL, '1508297764864', '1000', '20');
--  自营
INSERT INTO `t_system_counter` (`biz_name`, `prefix`, `is_date`, `date_format`, `min`, `current`, `max`, `is_loop`, `create_time`, `last_modify`, `step_size`, `length`) VALUES ( 'SELF_ORD_NO', '10', '00000000001', 'yyyyMMdd', '3004', NULL, '4004', NULL, NULL, '1509005338075', '1000', '10');
--  管理后台
INSERT INTO `t_system_counter` ( `biz_name`, `prefix`, `is_date`, `date_format`, `min`, `current`, `max`, `is_loop`, `create_time`, `last_modify`, `step_size`, `length`) VALUES ('SHOP_KEY', 'KEY', '00000000000', NULL, '1', NULL, '1001', NULL, NULL, '1509086492141', '1000', '9');
