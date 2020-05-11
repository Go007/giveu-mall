-- 修改表结构
ALTER TABLE `t_goods_call_traffic_supplier`
MODIFY COLUMN `denomination`  varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '面额' AFTER `name`,
MODIFY COLUMN `discount_rate`  decimal(10,5) NULL DEFAULT NULL COMMENT '折扣x100' AFTER `official_price`,
MODIFY COLUMN `limit_discount_rate`  decimal(10,5) NULL DEFAULT NULL COMMENT '限制折扣率x100' AFTER `discount_rate`;

INSERT INTO `t_goods_call_traffic_supplier` VALUES (1, '10M流量', '10', 285, 2715, 300, 0.90500, 0.95000, 0, 1, 100, 0, 0, 0, 1, NULL, 1);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (2, '30M流量', '30', 475, 4525, 500, 0.90500, 0.95000, 0, 1, 100, 0, 0, 26, 2, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (3, '70M流量', '70', 950, 9050, 1000, 0.90500, 0.95000, 0, 1, 100, 0, 0, 0, 3, NULL, 1);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (4, '150M流量', '150', 1900, 18100, 2000, 0.90500, 0.95000, 0, 1, 100, 0, 0, 28, 4, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (5, '500M流量', '500', 2850, 27150, 3000, 0.90500, 0.95000, 0, 1, 100, 0, 0, 29, 5, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (6, '1G流量', '1000', 4750, 45250, 5000, 0.90500, 0.95000, 0, 1, 100, 0, 0, 30, 6, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (7, '2G流量', '2000', 6650, 63350, 7000, 0.90500, 0.95000, 0, 1, 100, 0, 0, 31, 7, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (8, '3G流量', '3000', 9500, 90500, 10000, 0.90500, 0.95000, 0, 1, 100, 0, 0, 0, 8, NULL, 1);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (9, '4G流量', '4000', 12350, 117650, 13000, 0.90500, 0.95000, 0, 1, 100, 0, 0, 0, 9, NULL, 1);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (10, '6G流量', '6000', 17100, 162900, 18000, 0.90500, 0.95000, 0, 1, 100, 0, 0, 0, 10, NULL, 1);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (11, '11G流量', '11000', 26600, 253400, 28000, 0.90500, 0.95000, 0, 1, 100, 0, 0, 0, 11, NULL, 1);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (12, '20M流量', '20', 285, 2790, 300, 0.93000, 0.00000, 1, 1, 100, 0, 0, 0, 12, NULL, 1);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (13, '50M流量', '50', 570, 5580, 600, 0.93000, 0.00000, 1, 1, 100, 0, 0, 37, 13, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (14, '100M流量', '100', 950, 9300, 1000, 0.93000, 0.00000, 1, 1, 100, 0, 0, 38, 14, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (15, '200M流量', '200', 1425, 13950, 1500, 0.93000, 0.00000, 1, 1, 100, 0, 0, 39, 15, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (16, '500M流量', '500', 2850, 27900, 3000, 0.93000, 0.00000, 1, 1, 100, 0, 0, 40, 16, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (17, '1G流量', '1024', 4750, 47250, 5000, 0.94500, 0.00000, 1, 1, 100, 0, 0, 41, 17, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (18, '5M流量', '5', 95, 780, 100, 0.78000, 0.95000, 2, 1, 100, 0, 0, 0, 18, NULL, 1);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (19, '10M流量', '10', 190, 1560, 200, 0.78000, 0.95000, 2, 1, 100, 0, 0, 0, 19, NULL, 1);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (20, '30M流量', '30', 475, 3900, 500, 0.78000, 0.95000, 2, 1, 100, 0, 0, 44, 20, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (21, '50M流量', '50', 665, 5460, 700, 0.78000, 0.95000, 2, 1, 100, 0, 0, 45, 21, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (22, '100M流量', '100', 950, 7800, 1000, 0.78000, 0.95000, 2, 1, 100, 0, 0, 46, 22, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (23, '200M流量', '200', 1425, 11700, 1500, 0.78000, 0.95000, 2, 1, 100, 0, 0, 47, 23, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (24, '500M流量', '500', 2850, 23400, 3000, 0.78000, 0.95000, 2, 1, 100, 0, 0, 48, 24, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (25, '1G流量', '1000', 4750, 39000, 5000, 0.78000, 0.95000, 2, 1, 100, 0, 0, 49, 25, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (51, '10元', '10', 1000, 10000, 1000, 0.00000, 0.00000, 0, 0, 100, 1, 0, 0, 26, NULL, 1);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (52, '20元', '20', 2000, 20000, 2000, 0.00000, 0.00000, 0, 0, 100, 1, 0, 0, 27, NULL, 1);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (53, '30元', '30', 3000, 30000, 3000, 0.00000, 0.00000, 0, 0, 100, 1, 0, 14, 28, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (54, '50元', '50', 4998, 49950, 5000, 0.00000, 0.00000, 0, 0, 100, 1, 0, 15, 29, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (55, '100元', '100', 9998, 99500, 10000, 0.00000, 0.00000, 0, 0, 100, 1, 0, 16, 30, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (56, '10元', '10', 1000, 10200, 1000, 0.00000, 0.00000, 1, 0, 100, 1, 0, 0, 31, NULL, 1);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (57, '20元', '20', 2000, 19900, 2000, 0.00000, 0.00000, 1, 0, 100, 1, 0, 0, 32, NULL, 1);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (58, '30元', '30', 3000, 29900, 3000, 0.00000, 0.00000, 1, 0, 100, 1, 0, 18, 33, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (59, '50元', '50', 4998, 49800, 5000, 0.00000, 0.00000, 1, 0, 100, 1, 0, 19, 34, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (60, '100元', '100', 9998, 99700, 10000, 0.00000, 0.00000, 1, 0, 100, 1, 0, 20, 35, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (61, '10元', '10', 1000, 9840, 1000, 0.00000, 0.00000, 2, 0, 100, 1, 0, 0, 36, NULL, 1);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (62, '20元', '20', 2000, 19680, 2000, 0.00000, 0.00000, 2, 0, 100, 1, 0, 0, 37, NULL, 1);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (63, '30元', '30', 3000, 29500, 3000, 0.00000, 0.00000, 2, 0, 100, 1, 0, 21, 38, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (64, '50元', '50', 4998, 49300, 5000, 0.00000, 0.00000, 2, 0, 100, 1, 0, 22, 39, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (65, '100元', '100', 9998, 98500, 10000, 0.00000, 0.00000, 2, 0, 100, 1, 0, 23, 40, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (66, '200元', '200', 19998, 199500, 20000, 0.00000, 0.00000, 0, 0, 100, 1, 0, 17, 41, NULL, 0);
INSERT INTO `t_goods_call_traffic_supplier` VALUES (67, '200元', '200', 19998, 198400, 20000, 0.00000, 0.00000, 2, 0, 100, 1, 0, 24, 42, NULL, 0);
