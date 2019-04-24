package cn.itcast.shop.utils;

import java.util.UUID;

public class UUIDUtil {
	public static String getUUID(){		//static必须有，否则servie层获取不到uuid
		return UUID.randomUUID().toString().replace("-", "");
	}
}
