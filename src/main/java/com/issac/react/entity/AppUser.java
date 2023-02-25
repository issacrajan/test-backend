package com.issac.react.entity;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "app_user", indexes = {
		@Index(name = "idx_app_user_email", columnList = "email", unique = true) })
public class AppUser extends BaseEntityVer {

	@Id
	@GeneratedValue(strategy = GenerationType.UUID)
	private String id;

	private String name;
	private String lastname;

	@Column(nullable = false)
	private String email;

	@Column(nullable = false)
	private String password;

	private String location;

	@ManyToOne
	@JoinColumn(name = "role_id")
	private AppRole userRole;

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

	@Override
	public int hashCode() {
		return Objects.hash(email);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AppUser other = (AppUser) obj;
		return Objects.equals(email, other.email);
	}

	@Override
	public String toString() {
		return "AppUser [id=" + id + ", name=" + name + ", lastname=" + lastname + ", email=" + email
				+ ", password=" + password + ", location=" + location + "]";
	}

}
