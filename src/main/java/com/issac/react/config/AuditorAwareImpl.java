package com.issac.react.config;

import java.util.Optional;

import org.springframework.data.domain.AuditorAware;

public class AuditorAwareImpl implements AuditorAware<String> {

	@Override
	public Optional<String> getCurrentAuditor() {
		AppContext context = AppContextHolder.getContext();
		return Optional.of(context.getUserName());
	}

}
