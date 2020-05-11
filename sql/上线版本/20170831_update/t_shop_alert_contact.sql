-- JD余额阈值预警
-- delete old
DELETE FROM t_shop_alert_contact WHERE biz_code = 5 OR biz_code = 8;

-- 收件人
-- 胡栋柱
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, phone, email, status, gmt_create, gmt_modified) VALUES (5, '余额阈值预警', '13026602991', 'hudongzhu@dafycredit.com', 1, now(3), now(3));
-- 喻赛
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, phone, email, status, gmt_create, gmt_modified) VALUES (5, '余额阈值预警', null, 'yusai@dafycredit.com', 1, now(3), now(3));
-- 苏坚生
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, phone, email, status, gmt_create, gmt_modified) VALUES (5, '余额阈值预警', null, 'sujiansheng@dafycredit.com', 1, now(3), now(3));
-- 陈忠灏
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, phone, email, status, gmt_create, gmt_modified) VALUES (5, '余额阈值预警', null, 'chenzhonghao@dafycredit.com', 1, now(3), now(3));
-- 袁志军
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, phone, email, status, gmt_create, gmt_modified) VALUES (5, '余额阈值预警', null, 'yuanzhijun@dafycredit.com', 1, now(3), now(3));

-- 抄送人
-- 王晓雪
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, phone, email, status, gmt_create, gmt_modified) VALUES (8, 'JD余额阈值预警-抄送', null, 'wangxiaoxue@dafycredit.com', 1, now(3), now(3));
-- 刘明星
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, phone, email, status, gmt_create, gmt_modified) VALUES (8, 'JD余额阈值预警-抄送', null, 'liumingxing@dafycredit.com', 1, now(3), now(3));
-- 吴丹
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, phone, email, status, gmt_create, gmt_modified) VALUES (8, 'JD余额阈值预警-抄送', null, 'wudan@dafycredit.com', 1, now(3), now(3));
-- 洪伟
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, phone, email, status, gmt_create, gmt_modified) VALUES (8, 'JD余额阈值预警-抄送', null, 'hongwei@dafycredit.com', 1, now(3), now(3));


-- JD接口异常
-- 收件人
-- 胡栋柱
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, phone, email, status, gmt_create, gmt_modified) VALUES (9, 'JD接口异常', null, 'hudongzhu@dafycredit.com', 1, now(3), now(3));
-- 喻赛
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, phone, email, status, gmt_create, gmt_modified) VALUES (9, 'JD接口异常', null, 'yusai@dafycredit.com', 1, now(3), now(3));
-- 苏坚生
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, phone, email, status, gmt_create, gmt_modified) VALUES (9, 'JD接口异常', null, 'sujiansheng@dafycredit.com', 1, now(3), now(3));
-- 陈忠灏
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, phone, email, status, gmt_create, gmt_modified) VALUES (9, 'JD接口异常', null, 'chenzhonghao@dafycredit.com', 1, now(3), now(3));
-- 袁志军
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, phone, email, status, gmt_create, gmt_modified) VALUES (9, 'JD接口异常', null, 'yuanzhijun@dafycredit.com', 1, now(3), now(3));

-- 抄送人
-- 王晓雪
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, phone, email, status, gmt_create, gmt_modified) VALUES (10, 'JD接口异常-抄送', null, 'wangxiaoxue@dafycredit.com', 1, now(3), now(3));
-- 刘明星
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, phone, email, status, gmt_create, gmt_modified) VALUES (10, 'JD接口异常-抄送', null, 'liumingxing@dafycredit.com', 1, now(3), now(3));
-- 洪伟
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, phone, email, status, gmt_create, gmt_modified) VALUES (10, 'JD接口异常-抄送', null, 'hongwei@dafycredit.com', 1, now(3), now(3));
-- 钱远鹏
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, phone, email, status, gmt_create, gmt_modified) VALUES (10, 'JD接口异常-抄送', null, 'qianyuanpeng@dafycredit.com', 1, now(3), now(3));
-- 吴丹
INSERT INTO t_shop_alert_contact (biz_code, biz_desc, phone, email, status, gmt_create, gmt_modified) VALUES (10, 'JD接口异常-抄送', null, 'wudan@dafycredit.com', 1, now(3), now(3));
