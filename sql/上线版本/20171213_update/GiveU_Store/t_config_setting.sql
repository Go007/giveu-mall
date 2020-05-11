-- 新增京东对账抄送人员
UPDATE t_config_setting
SET val = 'wudan@dafycredit.com;wangxiaoxue@dafycredit.com;fanlimin@dafycredit.com;linmiaomiao@dafycredit.com'
WHERE
	cache_key = 'setting:order:jd:check:mailTo';