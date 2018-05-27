package com.zsga.utils;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * 获取IP地址
 * @author quadcopter
 *
 */
public class GotLocalIP {
	
	private static InetAddress addr;
	
	public static String getLocalIP() {
		String ip = "";
		String hostName = "";
		try {
			addr = InetAddress.getLocalHost();
			ip=addr.getHostAddress().toString(); //获取本机ip  
			hostName=addr.getHostName().toString(); //获取本机计算机名称  
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} 
		return ip;
	}
}
