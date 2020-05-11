-- 字典表更新描述信息
ALTER TABLE `t_system_dictionary`
MODIFY COLUMN `value`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '废弃，参见code字段' AFTER `name`;