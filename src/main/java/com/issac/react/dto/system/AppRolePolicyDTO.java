package com.issac.react.dto.system;

import com.issac.react.dto.BaseDTO;
import com.issac.react.entity.AppRolePolicy;

import jakarta.validation.constraints.NotBlank;

public class AppRolePolicyDTO extends BaseDTO {
	private String id;

	@NotBlank(message = "role policy is required")
	private String rolePolicy;

	@NotBlank(message = "role policy state is required")
	private String rolePolicyState;

	public static AppRolePolicyDTO build(AppRolePolicy rolePolicy) {
		AppRolePolicyDTO dto = new AppRolePolicyDTO();
		dto.setId(rolePolicy.getId());
		dto.setRolePolicy(rolePolicy.getRolePolicy());
		dto.setRolePolicyState(rolePolicy.getRolePolicyState());

		return dto;
	}

	public AppRolePolicy buildEntity() {
		AppRolePolicy entity = new AppRolePolicy();
		entity.setId(id);
		entity.setRolePolicy(rolePolicy);
		entity.setRolePolicyState(rolePolicyState);

		return entity;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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
		return "AppRolePolicyDTO [id=" + id + ", rolePolicy=" + rolePolicy + ", rolePolicyState="
				+ rolePolicyState + "]";
	}

}
