package com.issac.react.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "user_role")
public class UserRole extends BaseEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.UUID)
	private String id;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private UserInfo user;

	@ManyToOne
	@JoinColumn(name = "role_id")
	private AppRole role;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public UserInfo getUser() {
		return user;
	}

	public void setUser(UserInfo user) {
		this.user = user;
	}

	public AppRole getRole() {
		return role;
	}

	public void setRole(AppRole role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "UserRole [id=" + id + ", user=" + user + ", role=" + role + "]";
	}

}
