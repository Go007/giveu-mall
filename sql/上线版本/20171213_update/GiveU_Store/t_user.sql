--  合并相关t_user 脚本
-- t_user表增加微信公众号登录名字段、银行卡、银行卡名称、类别，唯一索引
ALTER TABLE `t_user`
ADD COLUMN `wx_mall_login_name`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信商城登录名' AFTER `login_name`,
ADD COLUMN `bank_no`  varchar(50) CHARACTER SET utf8 NULL COMMENT '银行卡' AFTER `cert_no`,
ADD COLUMN `bank_code`  int(11) NULL COMMENT '银行卡类别' AFTER `bank_no`,
ADD COLUMN `bank_name`  varchar(50) CHARACTER SET utf8 NULL COMMENT '银行卡名称' AFTER `bank_code`,
ADD UNIQUE INDEX `idx_t_wxmall_user_unique` (`wx_mall_login_name`, `platform`,`status`, `uid`) USING BTREE COMMENT '微信商城账号唯一索引';
