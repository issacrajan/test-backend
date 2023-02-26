package com.issac.react.entity;

import java.util.Objects;

import com.issac.react.dto.system.AppRolePolicyDTO;

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

	public void updateFromDTO(AppRolePolicyDTO dto) {
		rolePolicy = dto.getRolePolicy();
		rolePolicyState = dto.getRolePolicyState();
	}

	@Override
	public int hashCode() {
		return Objects.hash(rolePolicy);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AppRolePolicy other = (AppRolePolicy) obj;
		return Objects.equals(rolePolicy, other.rolePolicy);
	}

	@Override
	public String toString() {
		return "AppRolePolicy [id=" + id + ", rolePolicy=" + rolePolicy + ", rolePolicyState="
				+ rolePolicyState + "]";
	}
}
