package com.issac.react.config;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import com.issac.react.util.StringUtil;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * filter to count number of TXNs, to validate Tenant ID and set Tenant ID to
 * context
 * 
 * @author issac
 *
 */
@Component
@Order(1)
public class TxnFilter implements Filter {
	private static final Logger logger = LoggerFactory.getLogger(TxnFilter.class);
	private static final Object mutex = new Object();
	private Map<String, Integer> txnCnt = new HashMap<>();
	private static final String MESSAGE_UNAUTHORIZED = "{\"message\": \"unauthorized. no tenantID present in the request\"}";

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		logger.debug("Starting a TXN : {}", req.getRequestURI());

		synchronized (mutex) {
			Integer cnt = txnCnt.get(req.getRequestURI());
			if (cnt == null) {
				cnt = 1;
			} else {
				cnt = cnt + 1;
			}
			txnCnt.put(req.getRequestURI(), cnt);
		}

		AppContext appContext = AppContextHolder.getContext();
		String tenantID = req.getHeader("X-TenantID");
		if (StringUtil.isEmpty(tenantID)) {
			logger.error("No tenant ID for request {}", req.getRequestURI());
			HttpServletResponse resp = (HttpServletResponse) response;
			AuthFilter.send401Resp(resp, MESSAGE_UNAUTHORIZED);
			return;
		}
		appContext.setTenentId(tenantID);

		try {
			chain.doFilter(request, response);
		} finally {
			AppContextHolder.clearContext();
		}
	}

}
