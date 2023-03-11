package com.issac.react.config.multitenant;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

/**
 * 
 * @author issac
 *
 */
@Configuration
public class MultiTenantDS {
	private MultiTenantConfig multiTenantConfig;

	public MultiTenantDS(MultiTenantConfig multiTenantConfig) {
		this.multiTenantConfig = multiTenantConfig;
	}

	@Bean
	public DataSource dataSource() {

		Map<Object, Object> resolvedDataSources = new HashMap<>();
		Object defaultTenantName = null;
		List<TenantDetail> tenants = multiTenantConfig.getTenants();
		for (TenantDetail tenant : tenants) {
			DataSourceBuilder<?> builder = DataSourceBuilder.create();
			System.out.println(tenant);
			builder.driverClassName(tenant.getDbDriver());
			builder.username(tenant.getDbUser());
			builder.password(tenant.getDbPassword());
			builder.url(tenant.getDbUrl());
			resolvedDataSources.put(tenant.getName(), builder.build());

			defaultTenantName = tenant.getName();
		}

		AbstractRoutingDataSource dataSource = new MultitenantDatasource();
		dataSource.setDefaultTargetDataSource(resolvedDataSources.get(defaultTenantName));
		dataSource.setTargetDataSources(resolvedDataSources);

		dataSource.afterPropertiesSet();
		return dataSource;
	}

}
