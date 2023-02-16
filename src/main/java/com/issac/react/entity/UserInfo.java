package com.issac.react.entity;

import java.time.LocalDateTime;
import java.util.Objects;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.Table;

@Entity
@Table(name = "user_info", indexes = {
		@Index(name = "idx_user_info_email", columnList = "email", unique = true) })
public class UserInfo {

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

	@CreationTimestamp
	private LocalDateTime createdTs;

	@UpdateTimestamp
	private LocalDateTime updatedTs;

	private String createdBy;
	private String updatedBy;

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
		UserInfo other = (UserInfo) obj;
		return Objects.equals(email, other.email);
	}

	@Override
	public String toString() {
		return "UserInfo [id=" + id + ", name=" + name + ", lastname=" + lastname + ", email=" + email
				+ ", password=" + password + ", location=" + location + ", createdTs=" + createdTs
				+ ", updatedTs=" + updatedTs + ", createdBy=" + createdBy + ", updatedBy=" + updatedBy + "]";
	}

}
