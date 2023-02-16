package com.issac.react.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "app_policy_endpoint_mapping")
public class AppPolicyEndpointMapping {
	@Id
	@GeneratedValue(strategy = GenerationType.UUID)
	private String id;
	
	private String endpointUrl;
	private String endpointMethod;
	private String endpointData;
	private String rolePolicy;
	private String rolePolicyState;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEndpointUrl() {
		return endpointUrl;
	}
	public void setEndpointUrl(String endpointUrl) {
		this.endpointUrl = endpointUrl;
	}
	public String getEndpointMethod() {
		return endpointMethod;
	}
	public void setEndpointMethod(String endpointMethod) {
		this.endpointMethod = endpointMethod;
	}
	public String getEndpointData() {
		return endpointData;
	}
	public void setEndpointData(String endpointData) {
		this.endpointData = endpointData;
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
	
}
