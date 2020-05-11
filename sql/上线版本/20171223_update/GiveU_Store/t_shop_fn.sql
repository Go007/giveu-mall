alter table t_fn_enchashment_log add column coupon_amount int(11) DEFAULT NULL COMMENT '商城抵用券金额';
alter table t_fn_enchashment_log add column purpose int(11) DEFAULT NULL COMMENT '资金用途';
alter table t_fn_enchashment_log COMMENT='取现记录表'; 
INSERT into t_config_setting(cache_key,val,remark,enabled,gmt_create, gmt_modified)VALUES('setting:fn:fn:enchashment:hasShProduct','false','是否打开随借随还',1,now(3), now(3));