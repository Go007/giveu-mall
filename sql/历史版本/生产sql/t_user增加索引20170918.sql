-- t_user  增加索引
ALTER TABLE `t_user`
ADD INDEX `cert_no_realname` (`cert_no`, `real_name`) USING BTREE ;