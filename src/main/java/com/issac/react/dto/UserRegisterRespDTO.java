package com.issac.react.dto;

/**
 * 
 * @author issac
 *
 */
public class UserRegisterRespDTO {

	private UserInfoDTO user;
	private String token;
	private String location;
	
	public UserRegisterRespDTO(UserInfoDTO user, String token) {
		this.user = user;
		this.token = token;
		this.location = user.getLocation();
	}
	
	public UserInfoDTO getUser() {
		return user;
	}
	public void setUser(UserInfoDTO user) {
		this.user = user;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	@Override
	public String toString() {
		return "UserRegisterRespDTO [user=" + user + ", token=" + token + ", location=" + location + "]";
	}
	
}
