-- 自营订单邮箱配置
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:order:self:subject', '自营订单每日导出', '自营订单每日导出邮件主题', 1, now(3), now(3));
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:order:self:mailTo', 'wudan@dafycredit.com;wangxiaoxue@dafycredit.com;chenzhonghao@szqk-tech.com;zhaoqi@szqk-tech.com;yuanzhijun@szqk-tech.com;zhangmeifang@szqk-tech.com;hefangqing@junyikeji.net', '自营订单发送邮箱', 1, now(3), now(3));
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:order:self:mailCc', 'xienengyan@dafycredit.com;wengwangmu@dafycredit.com', '自营订单抄送邮箱', 1, now(3), now(3));

--配置是否打开爱用钱包额度迁移
INSERT into t_config_setting(cache_key,val,remark,enabled,gmt_create, gmt_modified)VALUES('setting:fn:open_limit_removal','true','是否打开爱用钱包额度迁移',1,now(3), now(3));

--配置相关服务公告
INSERT INTO t_config_setting (`cache_key`, `val`, `remark`, `enabled`, `gmt_create`, `gmt_modified`) VALUES ('setting:system:maintenance:switch', 'false', '系统维护开关,true维护,false未维护', '1', '2018-01-10 15:32:40.000', '2018-01-10 15:32:44.000');
INSERT INTO t_config_setting (`cache_key`, `val`, `remark`, `enabled`, `gmt_create`, `gmt_modified`) VALUES ('setting:system:maintenance:switch:msg', '为了提高服务水平,即有商城于今晚进行升级,由此给您带来的不便,敬请谅解。', '系统维护内容', '1', '2018-01-10 15:32:40.000', '2018-01-10 15:32:44.000');
