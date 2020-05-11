
-- 余额阈值预警
-- 删除hongwei
UPDATE t_shop_alert_contact SET status = 0 WHERE email = 'hongwei@dafycredit.com' and status = 1;

-- 胡栋柱
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, phone, email, status, gmt_create, gmt_modified) VALUES (12, 'JD报告服务异常', '13026602991', 'hudongzhu@dafycredit.com', 1, now(3), now(3));
