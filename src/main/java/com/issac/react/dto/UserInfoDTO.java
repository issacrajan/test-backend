package com.issac.react.dto;

import java.time.LocalDateTime;

import com.issac.react.entity.UserInfo;

import jakarta.validation.constraints.NotBlank;

/**
 * 
 * @author issac
 *
 */
public class UserInfoDTO {
	private String id;

	@NotBlank(message = "name should not be empty")
	private String name;
	private String lastname;

	@NotBlank(message = "email should not be empty")
	private String email;
	@NotBlank(message = "password should not be empty")
	private String password;
	private String location;

	private LocalDateTime createdTs;
	private LocalDateTime updatedTs;
	private String createdBy;
	private String updatedBy;
	
	public static UserInfoDTO build(UserInfo u) {
		if (u == null) {
			return null;
		}
		
		UserInfoDTO dto = new UserInfoDTO();
		dto.setId(u.getId());
		dto.setName(u.getName());
		dto.setLastname(u.getLastname());
		dto.setEmail(u.getEmail());
		//dto.setPassword(u.getPassword());
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

	public LocalDateTime getCreatedTs() {
		return createdTs;
	}

	public void setCreatedTs(LocalDateTime createdTs) {
		this.createdTs = createdTs;
	}

	public LocalDateTime getUpdatedTs() {
		return updatedTs;
	}

	public void setUpdatedTs(LocalDateTime updatedTs) {
		this.updatedTs = updatedTs;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

	@Override
	public String toString() {
		return "UserInfoDTO [id=" + id + ", name=" + name + ", lastname=" + lastname + ", email=" + email
				+ ", password=" + password + ", location=" + location + ", createdTs=" + createdTs + ", updatedTs="
				+ updatedTs + ", createdBy=" + createdBy + ", updatedBy=" + updatedBy + "]";
	}
	
	
}
