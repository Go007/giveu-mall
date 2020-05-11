create TABLE
--用户文件存储表
CREATE TABLE `t_user_file` (
  `id` bigint(20) NOT NULL COMMENT '主键Id',
  `user_id` bigint(20) NOT NULL COMMENT '用户Id',
  `file_type` varchar(64) DEFAULT NULL COMMENT '文件类型',
  `file_name` varchar(64) DEFAULT NULL COMMENT '文件名称',
  `fast_url` varchar(128) NOT NULL COMMENT 'FAST地址Url',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间(时间戳)',
  PRIMARY KEY (`id`),
  KEY `idx_user_file_fast_url` (`fast_url`),
  KEY `idx_user_file_user_id` (`user_id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户文件存储信息表'

alter table t_user_file comment '用户文件存储信息表';