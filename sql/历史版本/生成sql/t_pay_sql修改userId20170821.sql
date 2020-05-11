-- 修改字段
ALTER TABLE `t_pay_payment`
MODIFY COLUMN `user_id`  bigint(20) NULL DEFAULT NULL COMMENT '用户id' AFTER `biz_type`;
