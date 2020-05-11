-- 增加ip地址字段
ALTER TABLE `t_user_token`
ADD COLUMN `ip_address`  varchar(50) NULL COMMENT 'IP地址' AFTER `update_time`;

