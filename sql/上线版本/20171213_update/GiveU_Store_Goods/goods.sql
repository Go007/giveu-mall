UPDATE t_goods_sku_channel
SET sku_status = 6
WHERE
	channel = 3
AND sku_id IN (
	SELECT
		sku_channel.*
	FROM
		(
			SELECT
				sku_id
			FROM
				t_goods_sku_channel
			WHERE
				channel = 0
			AND sku_status = 6
		) sku_channel
);