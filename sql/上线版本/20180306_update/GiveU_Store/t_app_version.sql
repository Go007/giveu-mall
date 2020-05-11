--  t_appversion 新增app更新频率控制字段
ALTER TABLE `t_app_version`
ADD COLUMN `frequency`  int(11) NULL COMMENT 'app 更新频率' AFTER `force_update`;

