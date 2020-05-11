-- 腾讯增加平台
ALTER TABLE `t_tencent_credit_log`
DROP COLUMN `platform`,
ADD COLUMN `platform`  varchar(20) NULL COMMENT '平台' AFTER `ip_address`;