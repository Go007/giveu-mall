-- 大汉对账邮箱配置
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:order:recharge:check:subject', '充值对账提醒', '充值对账邮件主题', 1, now(3), now(3));
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:order:recharge:check:mailTo', 'wudan@dafycredit.com;wangxiaoxue@dafycredit.com;fanlimin@dafycredit.com;linmiaomiao@dafycredit.com;sujiansheng@dafycredit.com', '充值对账发送邮箱', 1, now(3), now(3));
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:order:recharge:check:mailCc', 'xienengyan@dafycredit.com;lvyongwen@dafycredit.com;wengwangmu@dafycredit.com', '充值对账抄送邮箱', 1, now(3), now(3));
