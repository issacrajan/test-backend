package com.issac.react.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.issac.react.util.JwtUtil;

/**
 * 
 * @author issac
 *
 */
@Configuration
public class ProjectConfig {

	@Bean
	public JwtUtil jwtUtil() {
		return new JwtUtil();
	}

	@Bean
	public FilterRegistrationBean<AuthFilter> authenticationFilter() {
		FilterRegistrationBean<AuthFilter> registrationBean = new FilterRegistrationBean<>();

		registrationBean.setFilter(new AuthFilter(jwtUtil()));
		registrationBean.addUrlPatterns("/api/v1/*");
		registrationBean.setOrder(2);

		return registrationBean;
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
