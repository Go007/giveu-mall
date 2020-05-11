INSERT INTO t_system_result_msg_dictionaries(type, code, msg) VALUES('sc', '800718,800723,800724', '您暂时无法使用钱包。如有疑问，请拨打即有分期客服热线4001868888');
INSERT INTO t_system_result_msg_dictionaries(type, code, msg) VALUES('sc', '800717', '您的可用额度不足，仅能取额度内金额哦');
INSERT INTO t_system_result_msg_dictionaries(type, code, msg) VALUES('sc', '800721', '暂不支持该银行卡，请重新添加银行卡');
INSERT INTO t_system_result_msg_dictionaries(type, code, msg) VALUES('sc', '800105', '您的实名信息已经绑定过即有钱包，请使用已绑定的账号登陆');
INSERT INTO t_system_result_msg_dictionaries(type, code, msg) VALUES('sc', '800311', '还款金额不能大于随借随还待还总额');
INSERT INTO t_system_result_msg_dictionaries(type, code, msg) VALUES('sc', '800312', '还款金额不能大于分期产品待还期款总额');
INSERT INTO t_system_result_msg_dictionaries(type, code, msg) VALUES('sc', '800313', '合同代扣中，为避免重复还款，请稍后再试');
INSERT INTO t_system_result_msg_dictionaries(type, code, msg) VALUES('sc', '800314', '合同代扣失败，请重新进行还款操作');
INSERT INTO t_system_result_msg_dictionaries(type, code, msg) VALUES('sc', '800315', '您输入的还款金额有误，请重新输入');
INSERT INTO t_system_result_msg_dictionaries(type, code, msg) VALUES('sc', '803001', '暂时无法删除地址，请稍后再试吧');
INSERT INTO t_system_result_msg_dictionaries(type, code, msg) VALUES('sc', '803002', '暂时无法设置默认地址，请稍后再试吧');
INSERT INTO t_system_result_msg_dictionaries(type, code, msg) VALUES('sc', '803007', '暂时无法添加收货地址，请稍后再试吧');
INSERT INTO t_system_result_msg_dictionaries(type, code, msg) VALUES('sc', '200220', '活动还未开始哟');
INSERT INTO t_system_result_msg_dictionaries(type, code, msg) VALUES('sc', '200127', '收货地址好像有些问题，请重新确认');
INSERT INTO t_system_result_msg_dictionaries(type, code, msg) VALUES('sc', '100402,200124', '系统开小差了，稍后再试哟');
INSERT INTO t_system_result_msg_dictionaries(type, code, msg) VALUES('sc', '800731', '钱包支付金额不少于200元，请选择其他支付方式或者减少首付比例');
INSERT INTO t_system_result_msg_dictionaries(type, code, msg) VALUES('sc', '800732', '钱包支付金额不超过8000元，请选择其他支付方式或者增加首付比例');
UPDATE t_system_result_msg_dictionaries t SET t.`code` = 
'200000,200001,200002,200111,200200,200201,500108,500109,710101,200208,200211,200213,500101,500129,500118,500120,500121,500122,500123,100100,100101,100102,100103,100104,100105,100203,100500,100501,100502,800000,800001,800002,800003,800004,800107,800108,800110,800111,800300,800301,800302,800304,800305,800306,800307,800500,800501,800502,800603,800606,800608,800609,800610,800611,800612,800700,800701,800708,800709,800710,800706,800715,800504,800505,800506,100201,100204,200206,200210'
WHERE t.id = 172;
UPDATE t_system_result_msg_dictionaries t SET t.`code` = 
'801000,200112,200113,200115,100700,200104,200109,200118,200123'
WHERE t.id = 246;
INSERT INTO t_system_result_msg_dictionaries(type, code, msg) VALUES('sc', '200114', '钱包资质被冻结，请联系客服：40001868888');




