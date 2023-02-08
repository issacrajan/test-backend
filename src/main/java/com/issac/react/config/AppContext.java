package com.issac.react.config;

import com.issac.react.util.StringUtil;

public class AppContext {

	private String userName;
	private String email;
	private String roleName;
	
	public String getUserName() {
		return getUserName("UNKNOWN");
	}
	public String getUserName(String defaultName) {
		if (StringUtil.isEmpty(userName)) {
			return defaultName;
		}
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	
}
