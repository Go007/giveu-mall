-- ---------------------------------------------------------------------------------------------------------------------
-- t_jd_msg

DROP TABLE IF EXISTS `t_jd_msg`;
CREATE TABLE `t_jd_msg` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pull_status` varchar(10) DEFAULT '' COMMENT '拉取状态',
  `msg_id` bigint(20) unsigned NOT NULL COMMENT '推送id',
  `msg_type` tinyint unsigned DEFAULT NULL COMMENT '推送类型',
  `msg` varchar(1000) DEFAULT '' COMMENT '推送信息',
  `msg_time` datetime DEFAULT NULL COMMENT '推送时间',
  `bat_no` bigint(20) unsigned DEFAULT NULL COMMENT '批处理编号',
  `process_status` varchar(10) DEFAULT '' COMMENT '商城处理状态',
  `fail_times` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '失败次数',
  `gmt_create` datetime(3) DEFAULT NULL,
  `gmt_modified` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='JD推送信息表';

ALTER table t_jd_msg ADD UNIQUE KEY uk_msg_id(msg_id);
ALTER table t_jd_msg ADD INDEX idx_pull_status(pull_status);
ALTER table t_jd_msg ADD INDEX idx_msg_type(msg_type);
ALTER table t_jd_msg ADD INDEX idx_bat_no(bat_no);
ALTER table t_jd_msg ADD INDEX idx_process_status(process_status);

