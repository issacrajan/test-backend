package com.issac.react.config;

import java.util.HashMap;
import java.util.Map;

import com.issac.react.util.StringUtil;

public class AppContext {
	private String tenentId;
	private String userId;
	private String userName;
	private String email;
	private String roleName;
	private Map<String, String> errors;

	public String getTenentId() {
		return tenentId;
	}

	public void setTenentId(String tenentId) {
		this.tenentId = tenentId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

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

	public Map<String, String> getErrors() {
		return errors;
	}

	public void addError(String errKey, String errVal) {
		if (errors == null) {
			errors = new HashMap<>();
		}
		errors.put(errKey, errVal);
	}

	@Override
	public String toString() {
		return "AppContext [tenentId=" + tenentId + ", userId=" + userId + ", userName=" + userName
				+ ", email=" + email + ", roleName=" + roleName + ", errors=" + errors + "]";
	}

}
