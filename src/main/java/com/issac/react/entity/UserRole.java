package com.issac.react.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name =  "app_user_role")
public class UserRole extends BaseEntity{
	@Id
	@GeneratedValue(strategy = GenerationType.UUID)
	private String id;
	
	private String userId;
	private String roleId;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	
	@Override
	public String toString() {
		return "UserRole [id=" + id + ", userId=" + userId + ", roleId=" + roleId + "]";
	}
	
	
}
