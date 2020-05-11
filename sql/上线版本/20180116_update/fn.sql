ALTER TABLE t_user_equipment_info_log ADD COLUMN name VARCHAR(64) DEFAULT NULL COMMENT '姓名';

ALTER TABLE t_user_equipment_info_log add COLUMN ident VARCHAR(64) DEFAULT NULL COMMENT '身份证';

ALTER TABLE t_user_equipment_info_log ADD COLUMN phone VARCHAR(64) DEFAULT null COMMENT '手机号码';

ALTER TABLE t_user_equipment_info_log add column bank_card_no VARCHAR(64) DEFAULT null COMMENT '银行卡号';

ALTER Table t_user_equipment_info_log ADD COLUMN longitude VARCHAR(64) DEFAULT null COMMENT '经度';

ALTER TABLE t_user_equipment_info_log ADD COLUMN latitude VARCHAR(64) DEFAULT null COMMENT '纬度';

ALTER TABLE t_user_equipment_info_log ADD INDEX idx_t_user_equipment_info_log_name(name);

ALTER TABLE t_user_equipment_info_log ADD INDEX idx_t_user_equipment_info_log_ident(ident);

ALTER TABLE t_user_equipment_info_log ADD INDEX idx_t_user_equipment_info_log_imei(imei);

INSERT into t_config_setting(cache_key,val,remark,enabled,gmt_create, gmt_modified)VALUES('setting:fn:open_equipment','true','是否上报招联设备信息',1,now(3), now(3));

INSERT into t_config_setting(cache_key,val,remark,enabled,gmt_create, gmt_modified)VALUES('setting:fn:fn:enchashment:hasSqProduct','true','是否分期取现',1,now(3), now(3));