DROP TABLE IF EXISTS `t_config_white`;
CREATE TABLE `t_config_white` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标识',
  `val` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '数据',
  `remark` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  `enabled` tinyint unsigned NOT NULL DEFAULT 1 COMMENT '开关状态，1开启，0关闭',
  `gmt_create` datetime(3) DEFAULT NULL,
  `gmt_modified` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='配置白名单表';

ALTER table t_config_white ADD INDEX idx_type(type);
ALTER table t_config_white ADD INDEX idx_enabled(enabled);

DROP TABLE IF EXISTS `t_config_setting`;
CREATE TABLE `t_config_setting` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cache_key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '数据库缓存key',
  `val` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '数据',
  `remark` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  `enabled` tinyint unsigned NOT NULL DEFAULT 1 COMMENT '开关状态，1开启，0关闭',
  `gmt_create` datetime(3) DEFAULT NULL,
  `gmt_modified` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='服务参数配置表';

ALTER table t_config_setting ADD INDEX idx_cache_key(cache_key);
ALTER table t_config_setting ADD INDEX idx_enabled(enabled);

--数据库配置信息
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:jd:enableConfirmOrder', 'true', 'JD确认预占库存开关', 1, now(3), now(3));
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:sys:enableSendSms', 'true', '短信发送开关', 1, now(3), now(3));
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:fn:enableThreeAndFourAuth', 'true', 'FN三四要素开关', 1, now(3), now(3));
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:goods:call:traffic:dahan:switch', 'false', '大汉充值测试开关', 1, now(3), now(3));
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:goods:call:traffic:heying:switch', 'false', '合赢充值测试开关', 1, now(3), now(3));
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:fn:fn_cache_hidden', 'true', '自动更新字段开关', 1, now(3), now(3));

--订单配置信息脚本
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:order:check:beginTime', '10800000', '开始时间(前3个小时)', 1, now(3), now(3));
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:order:check:endTime', '7200000', '结束时间(前2个小时)', 1, now(3), now(3));
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:order:jd:confirmPaySendMsg', 'true', '确认支付是否下发短信', 1, now(3), now(3));
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:order:jd:logisticsTime', '604800000', '7天物流时间', 1, now(3), now(3));
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:order:jd:payJdOrder', 'true', '京东是否支付开关', 1, now(3), now(3));
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:order:jd:payOverTime', '600000', '支付订单倒计时(10分钟)', 1, now(3), now(3));
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:order:jd:payPrice', 'true', '支付金额', 1, now(3), now(3));
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:order:jd:payTime', '600000', '支付订单倒计时(10分钟)', 1, now(3), now(3));
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:order:jd:submitJdOrder', 'true', '京东预下单开关', 1, now(3), now(3));
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:order:recharge:switch', 'true', '订单充值开关', 1, now(3), now(3));
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:order:jd:check:subject', '京东对账提醒', '京东对账邮件主题', 1, now(3), now(3));
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:order:jd:check:mailTo', 'wudan@dafycredit.com', '京东对账发送邮箱', 1, now(3), now(3));
INSERT INTO t_config_setting (cache_key, val, remark, enabled, gmt_create, gmt_modified) VALUES ('setting:order:jd:check:mailCc', 'xienengyan@dafycredit.com;wengwangmu@dafycredit.com;hudongzhu@dafycredit.com', '京东对账抄送邮箱', 1, now(3), now(3));
