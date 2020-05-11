-- 增加身份证作为联合唯一索引
ALTER TABLE `t_user`
DROP INDEX `idx_t_user_unique` ,
ADD UNIQUE INDEX `idx_t_user_unique` (`login_name`, `cert_no`, `status`, `uid`) USING BTREE ;
