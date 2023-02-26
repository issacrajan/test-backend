package com.issac.react.dto.system;

import jakarta.validation.constraints.NotBlank;

/**
 * 
 * @author issac
 *
 */
public class UserProfileDTO {
	private String id;

	@NotBlank(message = "name should not be empty")
	private String name;
	private String lastname;
	@NotBlank(message = "email should not be empty")
	private String email;

	private String location;

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

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "UserProfileDTO [id=" + id + ", name=" + name + ", lastname=" + lastname + ", email=" + email
				+ ", location=" + location + "]";
	}

}
