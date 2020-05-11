CREATE TABLE `t_sms_user_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `channel` varchar(20) NOT NULL COMMENT '来源渠道值：0:APP,1:QQ,2:WX,3:公众号',
  `limit_type` varchar(20) NOT NULL COMMENT '额度类型：0:无授信额度,1:有授信额度,2:有取现额度,3:有消费额度',
  `send_time` bigint(20) NOT NULL COMMENT '发送时间',
  `app_content` text COMMENT 'app发送内容',
  `gzh_content` text COMMENT '公众号发送内容',
  `qq_content` text COMMENT '手Q发送内容',
  `wx_content` text COMMENT '微信发送内容',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态：0 可用，1 禁用，2 删除',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `last_modify` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;