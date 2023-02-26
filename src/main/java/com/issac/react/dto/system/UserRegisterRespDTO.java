package com.issac.react.dto.system;

/**
 * 
 * @author issac
 *
 */
public class UserRegisterRespDTO {

	private AppUserDTO user;
	private String token;
	private String location;
	
	public UserRegisterRespDTO(AppUserDTO user, String token) {
		this.user = user;
		this.token = token;
		this.location = user.getLocation();
	}
	
	public AppUserDTO getUser() {
		return user;
	}
	public void setUser(AppUserDTO user) {
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
