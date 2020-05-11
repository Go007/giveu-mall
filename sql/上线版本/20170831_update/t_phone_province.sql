CREATE TABLE `t_phone_province` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` int(10) NOT NULL,
  `province` varchar(220) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `t_phone_province` (`code`, `province`) VALUES (0, '全国');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (1, '北京');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (2, '新疆');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (3, '重庆');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (4, '广东');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (5, '浙江');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (6, '天津');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (7, '广西');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (8, '内蒙古');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (9, '宁夏');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (10, '江西');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (11, '安徽');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (12, '贵州');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (13, '陕西');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (14, '辽宁');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (15, '山西');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (16, '青海');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (17, '四川');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (18, '江苏');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (19, '河北');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (20, '西藏');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (21, '福建');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (22, '吉林');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (23, '云南');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (24, '上海');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (25, '湖北');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (26, '海南');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (27, '甘肃');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (28, '湖南');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (29, '山东');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (30, '河南');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (31, '黑龙江');
INSERT INTO `t_phone_province` (`code`, `province`) VALUES (32, '中国');
