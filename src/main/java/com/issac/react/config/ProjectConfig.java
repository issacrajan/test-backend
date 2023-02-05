package com.issac.react.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 
 * @author issac
 *
 */
@Configuration
public class ProjectConfig {

	@Bean
	public FilterRegistrationBean<AuthFilter> authenticationFilter() {
		FilterRegistrationBean<AuthFilter> registrationBean = new FilterRegistrationBean<>();

		registrationBean.setFilter(new AuthFilter());
		registrationBean.addUrlPatterns("/api/*");
		registrationBean.setOrder(2);

		return registrationBean;
	}
}
