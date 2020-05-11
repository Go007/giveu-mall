CREATE TABLE `t_integral_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(20) DEFAULT NULL COMMENT '流水号-发放生成的流水号',
  `order_no` varchar(20) DEFAULT NULL COMMENT '订单号',
  `cert_no` varchar(20) NOT NULL COMMENT '身份证号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `id_person` bigint(20) DEFAULT NULL COMMENT '激活用户ID',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `integral_id` bigint(20) NOT NULL COMMENT '积分编码',
  `holiday_name` varchar(20) NOT NULL COMMENT '节假日名称  生日,春节,元宵节,端午节,五一劳动节,七夕节,中秋节,国庆节',
  `record_remark` varchar(200) NOT NULL COMMENT '记录备注',
  `operator_type` tinyint(1) NOT NULL COMMENT '操作类型：1-发放，2-使用，3-清除',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人：系统或者对应的user_id',
  `integral_num` int(20) NOT NULL COMMENT '积分数量',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_t_record_serial_number` (`serial_number`),
  KEY `idx_t_record_integral_code` (`integral_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='积分记录表';


CREATE TABLE `t_integral` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL COMMENT '状态: 0-禁用，1-启用',
  `holiday_id` bigint(20) NOT NULL COMMENT '节假日ID',
  `holiday_code` varchar(255) NOT NULL COMMENT '节假日编码',
  `holiday_name` varchar(20) NOT NULL COMMENT '节假日名称  生日,春节,元宵节,端午节,五一劳动节,七夕节,中秋节,国庆节',
  `holiday_date` varchar(10) NOT NULL COMMENT '节假日日期，例如：8-15',
  `is_solar` tinyint(1) NOT NULL COMMENT '是否阳历 1-是，0-不是',
  `holiday_period` varchar(8) NOT NULL DEFAULT '' COMMENT '触发周期：DAY,MONTH,YEAR',
  `integral_remark` varchar(200) NOT NULL COMMENT '积分备注',
  `integral_num` int(10) NOT NULL COMMENT '积分数量',
  `grant_time` int(2) NOT NULL COMMENT '积分发放日期：提前1天，3天，5天..',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `last_modify` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='积分定义表';


CREATE TABLE `t_user_integral` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cert_no` varchar(20) NOT NULL COMMENT '身份证号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `id_person` bigint(20) DEFAULT NULL COMMENT '激活用户ID',
  `integral_num` int(10) NOT NULL COMMENT '积分数量',
  PRIMARY KEY (`id`),
  KEY `idx_t_user_integral_cert_no` (`cert_no`),
  KEY `idx_t_user_integral_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户积分表';


CREATE TABLE `t_holiday` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) UNIQUE NOT NULL COMMENT '节假日编码',
  `name` varchar(20) NOT NULL COMMENT '节假日名称',
  `date` varchar(10) NOT NULL COMMENT '节假日日期，例如：8-15',
  `is_solar` tinyint(1) NOT NULL COMMENT '是否阳历 1-是，0-不是',
  `period` varchar(8) NOT NULL DEFAULT 'YEAR' COMMENT '触发周期：DAY,MONTH,YEAR',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='节假日表';