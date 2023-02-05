package com.issac.react.util;

public class StringUtil {

	public static boolean isEmpty(String str) {
		return str == null || str.isBlank();
	}
	
	public static boolean hasContent(String str) {
		return str != null && !str.isBlank();
	}
}
