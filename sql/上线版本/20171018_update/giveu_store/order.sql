-- 供应商渠道、配送方式

-- 20170916
-- 订单详情添加退款申请中
alter table t_shop_order_detail add refund_applying int(1) DEFAULT '0' COMMENT '退款申请中:0-未申请,1-申请中';

-- 20170926
-- 订单添加售后提交时间
alter table t_shop_orders add sale_apply_time bigint(20) COMMENT '售后提交时间';

-- 20170929
-- 订单添加用户id
alter table t_shop_orders add user_id bigint(20) COMMENT '系统用户id';
-- 供应商渠道
alter table t_shop_orders add delivery_id varchar(20) COMMENT '配送类型';
alter table t_shop_orders add supplier_id varchar(20) COMMENT '供应商类型';
alter table t_shop_orders add supplier_name varchar(60) COMMENT '供应商名称';


-- 订单详情添加协议价
-- alter table t_shop_order_detail add agreement_price bigint(20) COMMENT '商品协议价';
alter table t_shop_order_detail add interest_free int(1) COMMENT '免息:0-否, 1-是';
alter table t_shop_order_detail add discount int(3) COMMENT '金融折扣率';
alter table t_shop_order_detail add is_service varchar(120) COMMENT '是否购买保险, 多个用逗号隔开';
alter table t_shop_order_detail add is_order_goods_detail int(1) DEFAULT '0' COMMENT '是否有商详子表:0-无，1-有';


-- 订单保险
CREATE TABLE `t_shop_order_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单详情id',
  `order_no` varchar(30) DEFAULT NULL COMMENT '订单号',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `service_id` int(4) DEFAULT NULL COMMENT '服务id',
  `service_name` varchar(255) DEFAULT NULL COMMENT '服务名称',
  `service_price` bigint(20) DEFAULT NULL COMMENT '服务价格',
  `service_url` varchar(255) DEFAULT NULL COMMENT '服务地址',
  `is_select` int(1) DEFAULT NULL COMMENT '是否购买: 0-未购买, 1-购买',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单增值服务表';

-- 订单json记录
CREATE TABLE `t_shop_order_json_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `order_no` varchar(30) DEFAULT NULL COMMENT '订单号',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单详情id',
  `status` int(1) DEFAULT NULL COMMENT '是否购买：0-未购买，1-购买',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `order_json` varchar(3000) DEFAULT NULL COMMENT '订单json',
  `pay_status` int(1) DEFAULT NULL COMMENT '支付状态: 0-待付款，1-付款中，2-第三方支付成功，第三方购物下单中，3-第三方下单成功',
  `pay_id` varchar(255) DEFAULT NULL COMMENT '支付id',
  `pay_type` int(1) DEFAULT NULL COMMENT '支付类型:0-钱包，1-微信，2-支付宝',
  `fn_contract_no` varchar(255) DEFAULT NULL COMMENT '蜂鸟合同号',
  `fn_contract_no_type` int(1) DEFAULT NULL COMMENT '状态: 0-生成，1-现行，2-取消',
  `id_credit` varchar(30) DEFAULT NULL COMMENT '合同id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单json记录';


-- 订单商详
CREATE TABLE `t_shop_order_goods_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单表id',
  `order_detail_id` bigint(20) NOT NULL COMMENT '订单详情表id',
  `order_no` varchar(255) DEFAULT NULL COMMENT '订单号',
  `sku_code` varchar(255) DEFAULT NULL COMMENT '即有skuCode',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `brand` varchar(255) DEFAULT NULL COMMENT '品牌',
  `price` bigint(20) DEFAULT NULL COMMENT '价格',
  `mkt_price` bigint(20) DEFAULT NULL COMMENT '市场价',
  `count` int(11) DEFAULT NULL COMMENT '订购数量',
  `sale_price` bigint(20) DEFAULT NULL COMMENT '销售价',
  `purchase` bigint(20) DEFAULT NULL COMMENT '采购价(协议价)',
  `member_price` bigint(20) DEFAULT NULL COMMENT '会员价',
  `discount_amount` bigint(20) DEFAULT NULL COMMENT '优惠金额',
  `amount` bigint(20) DEFAULT NULL COMMENT '总金额',
  `weight` decimal(18,3) DEFAULT NULL COMMENT '重量',
  `src_ip` varchar(255) DEFAULT NULL COMMENT '图片前缀',
  `sku_src` varchar(255) DEFAULT NULL COMMENT 'sku图片',
  `is_phone` int(11) DEFAULT NULL COMMENT '是否为苹果手机 ',
  `interest_free` int(11) DEFAULT NULL COMMENT '免息:0-否, 1-是',
  `reserving_date` int(11) DEFAULT NULL COMMENT '大家电配送日期 默认值为-1，0表示当天，1表示明天，2：表示后天; 如果为-1表示不使用大家电预约日历',
  `reserving_str` varchar(255) DEFAULT NULL COMMENT '大家电配送日期',
  `install_date` int(11) DEFAULT NULL COMMENT '大家电安装日期 不支持默认按-1处理，0表示当天，1表示明天，2：表示后天',
  `install_str` varchar(255) DEFAULT NULL COMMENT '大家电安装日期',
  `need_install` int(255) DEFAULT NULL COMMENT '大家电是否选择了安装 1 - true, 0 - false, null - 忽略 是否选择了安装，默认为true，选择了“暂缓安装”，此为必填项，必填值为false',
  `is_home_application` int(11) DEFAULT NULL COMMENT '是否大家电: 0-是, 1-否',
  `is_installments` int(11) DEFAULT NULL COMMENT '是否为分期商品',
  `first_category_id` bigint(20) DEFAULT NULL COMMENT '商品大类',
  `second_category_id` bigint(20) DEFAULT NULL COMMENT '商品小类',
  `agreement_price` bigint(20) DEFAULT NULL COMMENT '商品协议价',
  `discount` int(11) DEFAULT NULL COMMENT '金融折扣率',
  `color` varchar(255) DEFAULT NULL COMMENT '颜色',
  `capacity` varchar(255) DEFAULT NULL COMMENT '容量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

