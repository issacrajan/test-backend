package com.issac.react.dto.system;

import com.issac.react.dto.BaseDTO;
import com.issac.react.entity.AppUser;

import jakarta.validation.constraints.NotBlank;

/**
 * 
 * @author issac
 *
 */
public class AppUserDTO extends BaseDTO {
	private String id;

	@NotBlank(message = "name should not be empty")
	private String name;

	private String lastname;

	@NotBlank(message = "email should not be empty")
	private String email;

	@NotBlank(message = "password should not be empty")
	private String password;

	private String location;

	@NotBlank(message = "role should not be empty")
	private String appRole;

	public static AppUserDTO build(AppUser u) {
		if (u == null) {
			return null;
		}

		AppUserDTO dto = new AppUserDTO();
		dto.setId(u.getId());
		dto.setName(u.getName());
		dto.setLastname(u.getLastname());
		dto.setEmail(u.getEmail());
		// dto.setPassword(u.getPassword());
		dto.setLocation(u.getLocation());
		dto.setCreatedTs(u.getCreatedTs());
		dto.setCreatedBy(u.getCreatedBy());
		dto.setUpdatedTs(u.getUpdatedTs());
		dto.setUpdatedBy(u.getUpdatedBy());

		return dto;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
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

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getAppRole() {
		return appRole;
	}

	public void setAppRole(String appRole) {
		this.appRole = appRole;
	}

	@Override
	public String toString() {
		return "UserInfoDTO [id=" + id + ", name=" + name + ", lastname=" + lastname + ", email=" + email
				+ ", password=" + password + ", location=" + location + ", createdTs=" + createdTs
				+ ", updatedTs=" + updatedTs + ", createdBy=" + createdBy + ", updatedBy=" + updatedBy + "]";
	}

}
