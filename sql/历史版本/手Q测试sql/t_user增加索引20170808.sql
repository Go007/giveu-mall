-- 增加索引
ALTER TABLE `t_user`
ADD INDEX `uid_cert_no` (`uid`, `cert_no`) ;