-- 修改t_user唯一索引
ALTER TABLE `t_user`
DROP INDEX `idx_t_wxmall_user_unique` ,
ADD UNIQUE INDEX `idx_t_wxmall_user_unique` (`wx_mall_login_name`, `platform`, `status`, `uid`, `cert_no`) USING BTREE COMMENT '微信商城账号唯一索引';