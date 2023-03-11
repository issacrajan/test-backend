package com.issac.react.config.multitenant;

import java.util.List;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * 
 * @author issac
 *
 */
@Configuration
@ConfigurationProperties(prefix = "tenant-configuraion")
public class MultiTenantConfig {
	private List<TenantDetail> tenants;

	public List<TenantDetail> getTenants() {
		return tenants;
	}

	public void setTenants(List<TenantDetail> tenants) {
		this.tenants = tenants;
	}

	@Override
	public String toString() {
		return "MultiTenantConfig [tenants=" + tenants + "]";
	}

}
