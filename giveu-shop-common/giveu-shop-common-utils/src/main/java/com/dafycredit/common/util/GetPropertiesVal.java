package com.dafycredit.common.util;

import java.io.UnsupportedEncodingException;
import java.util.Locale;
import java.util.ResourceBundle;

import org.apache.commons.lang3.StringUtils;

/**
 * 自定义GetPropertiesVal返回properties内容
 */
public final class GetPropertiesVal {
	
	private static final String ENV = "prd_dev";

	// 该对象不支持实例化
	private GetPropertiesVal() {

	}

	private static ResourceBundle statusRes;

	static {
		String configEnv = ENV;
		if(System.getenv("config_env") != null) {
			configEnv = System.getenv("config_env");
		}
			
		statusRes = ResourceBundle.getBundle("config_" + configEnv, Locale.getDefault());
	}

	public static String getLabel(String key) {
		String res = "";
		try {
			res = new String(statusRes.getString(key).getBytes("ISO-8859-1"),
					"UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e);
		}
		return res;
	}

	public static String getProTheme(String themeKey) {
		return StringUtils.isBlank(getLabel(themeKey)) ? "default"
				: getLabel(themeKey);
	}


}
