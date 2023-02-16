package com.issac.react.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Table;

@Entity
@Table(name="app_role_policy")
public class AppRolePolicy extends BaseEntity{
	@GeneratedValue(strategy = GenerationType.UUID)
	private String id;
	
	private String roleId;
	private String rolePolicy;
	private String rolePolicyState; //E - enabled, D - Disabled;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getRolePolicy() {
		return rolePolicy;
	}
	public void setRolePolicy(String rolePolicy) {
		this.rolePolicy = rolePolicy;
	}
	public String getRolePolicyState() {
		return rolePolicyState;
	}
	public void setRolePolicyState(String rolePolicyState) {
		this.rolePolicyState = rolePolicyState;
	}
	@Override
	public String toString() {
		return "AppRolePolicy [id=" + id + ", roleId=" + roleId + ", rolePolicy=" + rolePolicy
				+ ", rolePolicyState=" + rolePolicyState + "]";
	}
	

}
