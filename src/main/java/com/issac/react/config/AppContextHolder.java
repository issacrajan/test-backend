package com.issac.react.config;

import org.springframework.util.Assert;

public class AppContextHolder {
	private static final ThreadLocal<AppContext> contextHolder = new InheritableThreadLocal<>();
	
	public static void clearContext() {
		contextHolder.remove();
	}

	public static AppContext getContext() {
		AppContext result = contextHolder.get();
		if (result == null) {
			result= createEmptyContext();
			contextHolder.set(result);
		}
		return result;
	}

	public static void setContext(AppContext context) {
		Assert.notNull(context, "Only non-null SecurityContext instances are permitted");
		contextHolder.set(context);
	}

	private static AppContext createEmptyContext() {
		return new AppContext();
	}
}
