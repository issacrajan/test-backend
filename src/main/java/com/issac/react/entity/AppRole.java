package com.issac.react.entity;

import java.util.Set;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "approle")
public class AppRole extends BaseEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.UUID)
	private String id;

	private String roleName;
	private String roleDesc;
	private String enabled;

	@OneToMany( mappedBy = "user")
	private Set<UserRole> users;

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


	public Set<UserRole> getUsers() {
		return users;
	}

	public void setUsers(Set<UserRole> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "AppRole [id=" + id + ", roleName=" + roleName + ", roleDesc=" + roleDesc + ", enabled="
				+ enabled + ", users=" + users + "]";
	}

}
