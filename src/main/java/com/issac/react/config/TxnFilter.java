package com.issac.react.config;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;

/**
 * filter to count number of txns
 * 
 * @author issac
 *
 */
@Component
@Order(1)
public class TxnFilter implements Filter {
	private static final Logger logger = LoggerFactory.getLogger(TxnFilter.class);
	
	private Map<String, Integer> txnCnt = new HashMap<>();
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		logger.debug("Starting a TXN : {}", req.getRequestURI());
		Integer cnt = txnCnt.get(req.getRequestURI());
		if (cnt == null) {
			cnt = 1;
		} else {
			cnt = cnt + 1;
		}
		txnCnt.put(req.getRequestURI(), cnt);
		
		chain.doFilter(request, response);
	}

}
