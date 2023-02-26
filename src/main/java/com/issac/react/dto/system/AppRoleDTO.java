package com.issac.react.dto.system;

import java.util.ArrayList;
import java.util.List;

import com.issac.react.config.AppContext;
import com.issac.react.config.AppContextHolder;
import com.issac.react.dto.BaseDTO;
import com.issac.react.entity.AppRole;
import com.issac.react.entity.AppRolePolicy;

import jakarta.validation.constraints.NotBlank;

public class AppRoleDTO extends BaseDTO {

	private String id;
	@NotBlank(message = "role name is required")
	private String roleName;

	@NotBlank(message = "role description is required")
	private String roleDesc;

	private String enabled = "Y";

	private List<AppRolePolicyDTO> rolePolicyList;

	public static AppRoleDTO build(AppRole role) {
		AppRoleDTO dto = new AppRoleDTO();
		dto.setId(role.getId());
		dto.setRoleName(role.getRoleName());
		dto.setRoleDesc(role.getRoleDesc());
		List<AppRolePolicy> policyList = role.getRolePolicyList();
		for (AppRolePolicy rp : policyList) {
			dto.addRolePolicy(AppRolePolicyDTO.build(rp));
		}

		return dto;
	}

	public AppRole buildEntity() {
		AppRole role = new AppRole();
		role.setRoleName(roleName);
		role.setRoleDesc(roleDesc);

		// add role policies
		if (rolePolicyList != null) {
			for (AppRolePolicyDTO rolePolicyDTO : rolePolicyList) {
				AppRolePolicy entity = rolePolicyDTO.buildEntity();
				role.addRolePolicy(entity);
			}
		}

		return role;
	}

	public void updateEntity(AppRole role) {
		role.setRoleName(roleName);
		role.setRoleDesc(roleDesc);
		List<AppRolePolicy> entityRolePolicyList = role.getRolePolicyList();

		// add role policies
		if (rolePolicyList != null) {
			for (AppRolePolicyDTO rolePolicyDTO : rolePolicyList) {
				AppRolePolicy entity = rolePolicyDTO.buildEntity();
				role.addRolePolicy(entity);
			}
		}
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public List<AppRolePolicyDTO> getRolePolicyList() {
		return rolePolicyList;
	}

	public void setRolePolicyList(List<AppRolePolicyDTO> rolePolicyList) {
		this.rolePolicyList = rolePolicyList;
	}

	public boolean isAppRolePolicyValid() {
		if (rolePolicyList == null || rolePolicyList.isEmpty()) {
			return false;
		}
		List<String> names = new ArrayList<>();
		AppContext context = AppContextHolder.getContext();
		for (AppRolePolicyDTO dto : rolePolicyList) {
			if (names.contains(dto.getRolePolicy())) {
				context.addError("Duplicate", "Duplicate Role policy found");
				return false;
			}
		}
		return true;
	}

	public void addRolePolicy(AppRolePolicyDTO rolePolicy) {
		if (rolePolicyList == null) {
			rolePolicyList = new ArrayList<>();
		}
		this.rolePolicyList.add(rolePolicy);
	}
}
