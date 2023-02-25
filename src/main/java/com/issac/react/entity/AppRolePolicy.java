package com.issac.react.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "app_role_policy")
public class AppRolePolicy extends BaseEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.UUID)
	private String id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "app_roleid")
	private AppRole appRole;

	private String rolePolicy;
	private String rolePolicyState; // E - enabled, D - Disabled;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public AppRole getAppRole() {
		return appRole;
	}

	public void setAppRole(AppRole appRole) {
		this.appRole = appRole;
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
		return "AppRolePolicy [id=" + id + ", appRole=" + appRole + ", rolePolicy=" + rolePolicy
				+ ", rolePolicyState=" + rolePolicyState + "]";
	}

}
