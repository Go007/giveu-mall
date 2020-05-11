-- 修改日志表中注释信息
ALTER TABLE `t_goods_call_traffic_log`
MODIFY COLUMN `status`  int(11) NULL DEFAULT NULL COMMENT '订单状态 0:订单创建成功，1：订单创建失败，2：订单交易成功，3：订单交易失败，4：订单预生成成功 ' AFTER `supplier_status`;

-- 删除重复非成功订单信息
DELETE FROM
	t_goods_call_traffic_log
WHERE
	order_no IN (
		SELECT
			order_no
		FROM
			(
				SELECT
					t1.order_no,
					COUNT(t1.order_no)
				FROM	
					t_goods_call_traffic_log t1
				GROUP BY
					t1.order_no
				HAVING
					COUNT(t1.order_no) > 1
			) AS temp
	)
AND (`status` != 2 OR `status` != 0);

-- 修改日志表为order_no建立唯一索引
ALTER TABLE `t_goods_call_traffic_log`
DROP INDEX `idx_t_goods_call_traffic_log_order_no` ,
ADD UNIQUE INDEX `idx_t_goods_call_traffic_log_order_no` (`order_no`) USING BTREE ;




