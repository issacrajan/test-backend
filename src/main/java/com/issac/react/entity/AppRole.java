package com.issac.react.entity;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "app_role")
public class AppRole extends BaseEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.UUID)
	private String id;

	private String roleName;
	private String roleDesc;
	private String enabled;

	@OneToMany(mappedBy = "appRole")
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

	public void addRolePolicy(AppRolePolicy rolePolicy) {
		if (rolePolicyList == null) {
			rolePolicyList = new ArrayList<>();
		}
		rolePolicyList.add(rolePolicy);
		rolePolicy.setAppRole(this);
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
