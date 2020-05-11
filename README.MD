1.端口
	config		1040
	eureka		1000
	gateway		1050
	monitor		1010
	turbine		1020(web port) & 1021(turbine.stream.port)
	zikpin		1030
	fn
	good
	good
	id
	jd
	order
	pay
	sys
	1000, 1030, 1040, 1050, 2010, 9021, 9989, 8041, 4011, 6010, 1090, 9011
spring boot打包	
	mvn clean package
	mvn clean package -P prod	
	

10.18上线版本说明:


tag说明：
1、app_v0.0.6 10.18号上线版本(使用域名: dafyshop03.dafysz.cn) http://10.11.11.251:10010/
2、app_v0.0.7 10.30号上线版本(使用域名: dafyshop04.dafysz.cn) http://10.11.11.252:10010/
3、app_v0.0.4 09.19号上线版本(使用域名: dafyshop02.dafysz.cn) http://10.11.11.253:10010/
4、app_v0.0.8 11.08号上线版本(使用域名: dafyshop04.dafysz.cn) http://10.11.11.252:10010/ (注:此版本直接覆盖10.30的版本)
5、app_v0.0.9 11.30号上线版本(使用域名: dafyshop05.dafysz.cn) http://10.11.11.246:10010/
6、app_v0.0.9.2 12.13号上线版本(使用域名: dafyshop05.dafysz.cn) http://10.11.11.247:10010/,http://10.11.11.248:10010/ (注:此版本直接覆盖11.30的版本)
7、 mobileqq_v0.0.9.2 12.13号上线版本(使用域名: dafyshop01.dafysz.cn) http://10.11.11.244:10010/,http://10.11.11.245:10010/
	7.1、 mobileqq_v0.0.9.2_bug_fix 12.21号上线版本,手Q修改远鹏,钱包用户跳转bug 
8、 app_v0.0.11.1 12.25号上线版本(使用域名: dafyshop06.dafysz.cn) http://10.11.11.37:10010/,http://10.11.11.89:10010/ (注: 此版本手Q和app6 tag是同样)
	8.1 app_v0.0.11.1_bug_fix 12.25号上线版本,修复兼容老支付宝支付回调bug
9、app_v0.0.12 01.16号上线版本(使用域名: dafyshop06.dafysz.cn) http://10.11.11.37:10010/,http://10.11.11.89:10010/ (注: 此版本手Q和app6 tag是同样)
	更新内容：
		1.jd对账发送邮件bug修复; 收货地址同步导致多个默认收货地址bug修复;
		2.招联设备信息上传; 增加取现模块分期产品控制开关; 蜂鸟错误码整理
		3.优惠券批量发放; 新增用户T+1进行短信群发
		4.订单确认支付添加是否已付款判断   
10、app_v0.0.13 02.01号上线版本(使用域名: dafyshop06.dafysz.cn) http://10.11.11.37:10010/,http://10.11.11.89:10010/ (注: 此版本手Q和app6 tag是同样)
	更新内容：
		详情请查看附件-（giveu-shop\上线内容\0201）	
	
问题
1.三方对账导出excel模板放在/home/tmp/下		
