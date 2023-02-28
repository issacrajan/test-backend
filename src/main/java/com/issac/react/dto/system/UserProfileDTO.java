package com.issac.react.dto.system;

import jakarta.validation.constraints.NotBlank;

/**
 * 
 * @author issac
 *
 */
public class UserProfileDTO {
	private String id;

	@NotBlank(message = "email should not be empty")
	private String email;

	@NotBlank(message = "name should not be empty")
	private String lastName;

	private String firstName;
	private String location;

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

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "UserProfileDTO [id=" + id + ", email=" + email + ", lastName=" + lastName + ", firstName="
				+ firstName + ", location=" + location + "]";
	}

}
