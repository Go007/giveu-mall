package com.dafycredit.common.util;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;

/**
 * 发送短信工具类
 * 
 * @author 513416
 */
public class SmsUtils {
	
	public static final String _MOBILE = "mobile";
	public static final String _MSG = "msg";
	public static final String _SECURITY_MSG = "security_msg";
	public static final String _SERVICE_ID = "service_id";
	public static final String _MD5_KEY = "md5_key";
	public static final String _SIGN = "sign";
	public static final String _CODE = "utf-8"; 
	
	/**
	 * 发送短信消息
	 * @param content	短信内容
	 * @param phone		手机号码
	 * @return sentStatus ok-发送成功, error:statusNotOk-发送不成功 			
	 * @throws Exception
	 */
	public static String sendBySMSBiz(String content, String phone) throws Exception {
		String serviceId = GetPropertiesVal.getLabel("sms.serviceid");
		String md5Key = GetPropertiesVal.getLabel("sms.md5key");
		String apiUrl = GetPropertiesVal.getLabel("sms.biz.send.url");
		content = URLEncoder.encode(content, _CODE);
		String securityMsg = "0";
		StringBuffer sb = new StringBuffer();
		sb.append(_MOBILE).append("=").append(phone)
		  .append("&").append(_MSG).append("=").append(content)
		  .append("&").append(_SECURITY_MSG).append("=").append(securityMsg)
		  .append("&").append(_SERVICE_ID).append("=").append(serviceId)
		  .append("&").append(_MD5_KEY).append("=").append(md5Key);
		String raw = sb.toString();
		String sign = MD5.md5Hex(raw, _CODE).toUpperCase();
		Map<String, String> reqParams = new HashMap<String, String>();
		reqParams.put(_MOBILE, phone);
		reqParams.put(_MSG, content);
		reqParams.put(_SECURITY_MSG, securityMsg);
		reqParams.put(_SERVICE_ID, serviceId);
		reqParams.put(_MD5_KEY, md5Key);
		reqParams.put(_SIGN, sign);
		String json = HttpClientUtil.post(apiUrl, reqParams, null);
		String sentStatus = "ok";
		JSONObject obj = JSONObject.parseObject(json);
		if (obj.getInteger("code") != 0) {
			sentStatus = "error:statusNotOk";
		}
		return sentStatus;
	}
	
	public static void main(String[] args) throws Exception {
//		System.out.println(sendBySMSBiz("这是测试短袖", "13416954996"));
	}
}
