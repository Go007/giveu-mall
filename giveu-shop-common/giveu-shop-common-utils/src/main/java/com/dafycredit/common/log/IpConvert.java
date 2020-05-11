package com.dafycredit.common.log;

import ch.qos.logback.classic.pattern.ClassicConverter;
import ch.qos.logback.classic.spi.ILoggingEvent;

import java.net.InetAddress;

public class IpConvert extends ClassicConverter {
	
	private static String ip = null;
	
	static {
		try {
			ip = new StringBuffer(InetAddress.getLocalHost().getHostName()).append("#").append(InetAddress.getLocalHost().getHostAddress()).toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String convert(ILoggingEvent event) {
		return ip;
	}

}
