package com.issac.react.dto.system;

import jakarta.validation.constraints.NotBlank;

/**
 * 
 * @author issac
 *
 */
public class UserLoginDTO {

	@NotBlank(message = "email should not be empty")
	private String email;
	@NotBlank(message = "password should not be empty")
	private String password;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "UserLoginDTO [email=" + email + ", password=" + password + "]";
	}
	
	
}
