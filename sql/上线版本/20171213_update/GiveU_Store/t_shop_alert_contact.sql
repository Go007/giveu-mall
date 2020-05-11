-- 去掉短信的不必要告警
UPDATE t_shop_alert_contact SET phone = null, gmt_modified = now(3) WHERE biz_code IN (1, 2, 3, 4, 5, 14, 20, 21) AND email = 'hudongzhu@dafycredit.com';
-- 还款健康检查
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, phone, email, status, gmt_create, gmt_modified) VALUES (23, '还款订单创建失败(状态init)', null, 'hudongzhu@dafycredit.com', 1, now(3), now(3));
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, phone, email, status, gmt_create, gmt_modified) VALUES (24, '还款订单FN还款失败', null, 'hudongzhu@dafycredit.com', 1, now(3), now(3));
-- JD余额不足实时告警
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, email, status, gmt_create, gmt_modified) VALUES (4, 'JD余额不足实时告警', 'chenzhonghao@dafycredit.com', 1, now(3), now(3));
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, email, status, gmt_create, gmt_modified) VALUES (4, 'JD余额不足实时告警', 'yuanzhijun@dafycredit.com', 1, now(3), now(3));
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, email, status, gmt_create, gmt_modified) VALUES (4, 'JD余额不足实时告警', 'zhangmeifang@dafycredit.com', 1, now(3), now(3));
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, email, status, gmt_create, gmt_modified) VALUES (11, 'JD余额不足实时告警-抄送', 'wangxiaoxue@dafycredit.com', 1, now(3), now(3));
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, email, status, gmt_create, gmt_modified) VALUES (11, 'JD余额不足实时告警-抄送', 'liumingxing@dafycredit.com', 1, now(3), now(3));
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, email, status, gmt_create, gmt_modified) VALUES (11, 'JD余额不足实时告警-抄送', 'wudan@dafycredit.com', 1, now(3), now(3));
-- JD余额预警--定时查询
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, email, status, gmt_create, gmt_modified) VALUES (5, '余额阈值预警', 'zhangmeifang@dafycredit.com', 1, now(3), now(3));
