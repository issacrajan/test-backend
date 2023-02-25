package com.issac.react.dto.system;

import java.util.ArrayList;
import java.util.List;

import com.issac.react.dto.BaseDTO;
import com.issac.react.entity.AppRole;
import com.issac.react.entity.AppRolePolicy;

public class AppRoleDTO extends BaseDTO {

	private String id;
	private String roleName;
	private String roleDesc;
	private String enabled;
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

	public void addRolePolicy(AppRolePolicyDTO rolePolicy) {
		if (rolePolicyList == null) {
			rolePolicyList = new ArrayList<>();
		}
		this.rolePolicyList.add(rolePolicy);
	}
}
