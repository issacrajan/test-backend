package com.issac.react.dto.system;

import java.util.Objects;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.issac.react.dto.BaseDTO;
import com.issac.react.entity.AppRolePolicy;

import jakarta.validation.constraints.NotBlank;

@JsonInclude(Include.NON_NULL)
/**
 * 
 * @author issac
 *
 */
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
		BaseDTO.build(dto, rolePolicy);

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
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AppRolePolicyDTO other = (AppRolePolicyDTO) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "AppRolePolicyDTO [id=" + id + ", rolePolicy=" + rolePolicy + ", rolePolicyState="
				+ rolePolicyState + "]";
	}

}
