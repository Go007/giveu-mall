-- token表中增加平台字段
ALTER TABLE `t_user_token`
ADD COLUMN `platform`  varchar(20) NULL COMMENT '申请token 平台 ios Android 手Q' AFTER `expires_time`;