package com.issac.react.dto.system;

import com.issac.react.dto.BaseVerDTO;
import com.issac.react.entity.AppUser;

import jakarta.validation.constraints.NotBlank;

/**
 * 
 * @author issac
 *
 */
public class AppUserDTO extends BaseVerDTO {
	private String id;

	@NotBlank(message = "email should not be empty")
	private String email;

//	@NotBlank(message = "password should not be empty")
	private String password;
	private String firstName;

	@NotBlank(message = "last name should not be empty")
	private String lastName;

	private String location;

	@NotBlank(message = "role name should not be empty")
	private String appRoleName;

	public static AppUserDTO build(AppUser u) {
		if (u == null) {
			return null;
		}

		AppUserDTO dto = new AppUserDTO();
		dto.setId(u.getId());
		dto.setEmail(u.getEmail());
		// dto.setPassword(u.getPassword());
		dto.setFirstName(u.getFirstName());
		dto.setLastName(u.getLastName());
		dto.setLocation(u.getLocation());
		dto.setAppRoleName(u.getUserRole().getRoleName());
		BaseVerDTO.build(dto, u);

		return dto;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

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

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getAppRoleName() {
		return appRoleName;
	}

	public void setAppRoleName(String appRoleName) {
		this.appRoleName = appRoleName;
	}

	@Override
	public String toString() {
		return "AppUserDTO [id=" + id + ", email=" + email + ", password=" + password + ", firstName="
				+ firstName + ", lastName=" + lastName + ", location=" + location + ", appRoleName="
				+ appRoleName + "]";
	}

}
