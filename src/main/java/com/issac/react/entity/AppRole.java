package com.issac.react.entity;

import java.util.ArrayList;
import java.util.List;

import com.issac.react.dto.system.AppRolePolicyDTO;
import com.issac.react.util.StringUtil;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

/**
 * 
 * @author issac
 *
 */
@Entity
@Table(name = "app_role")
public class AppRole extends BaseEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.UUID)
	private String id;

	private String roleName;
	private String roleDesc;
	private String enabled;

	@OneToMany(mappedBy = "appRole", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<AppRolePolicy> rolePolicyList;

	@OneToMany(mappedBy = "userRole")
	private List<AppUser> users;

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

	public List<AppRolePolicy> getRolePolicyList() {
		return rolePolicyList;
	}

	public void setRolePolicyList(List<AppRolePolicy> rolePolicyList) {
		this.rolePolicyList = rolePolicyList;
	}

	public void updateRolePolicyFromDTO(List<AppRolePolicyDTO> rolePoliciesDTO) {
		// no record is received from UI, delete all
		if (rolePoliciesDTO == null || rolePoliciesDTO.isEmpty()) {
			removeAllRolePolicy();
			return;
		}

		// existing records, if not present in UI list, remove it
		AppRolePolicyDTO tmpDTO = new AppRolePolicyDTO();
		List<AppRolePolicy> removeList = new ArrayList<>();
		getRolePolicyList().stream().filter(rec -> StringUtil.hasContent(rec.getId())).forEach(rec -> {
			tmpDTO.setId(rec.getId());
			if (!rolePoliciesDTO.contains(tmpDTO)) {
				removeList.add(rec);
			}
		});
		for (AppRolePolicy remove : removeList) {
			removeRolePolicy(remove);
		}

		// Add or update
		for (AppRolePolicyDTO rolePolicyDTO : rolePoliciesDTO) {
			if (StringUtil.hasContent(rolePolicyDTO.getId())) {
				// edit
				for (AppRolePolicy policy : rolePolicyList) {
					if (policy.getId().equals(rolePolicyDTO.getId())) {
						policy.updateFromDTO(rolePolicyDTO);
						break;
					}
				}
			} else {
				// add
				AppRolePolicy entity = rolePolicyDTO.buildEntity();
				addRolePolicy(entity);
			}

		}

	}

	public void addRolePolicy(AppRolePolicy rolePolicy) {
		if (rolePolicyList == null) {
			rolePolicyList = new ArrayList<>();
		}
		rolePolicyList.add(rolePolicy);
		rolePolicy.setAppRole(this);
	}

	public void removeAllRolePolicy() {
		if (rolePolicyList == null) {
			return;
		}
		for (AppRolePolicy policy : rolePolicyList) {
			policy.setAppRole(null);
		}
		rolePolicyList.clear();
	}

	public void removeRolePolicy(AppRolePolicy rolePolicy) {
		if (rolePolicyList == null) {
			rolePolicyList = new ArrayList<>();
		}
		rolePolicyList.remove(rolePolicy);
		rolePolicy.setAppRole(null);
	}

	public List<AppUser> getUsers() {
		return users;
	}

	public void setUsers(List<AppUser> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "AppRole [id=" + id + ", roleName=" + roleName + ", roleDesc=" + roleDesc + ", enabled="
				+ enabled + "]";
	}

}
