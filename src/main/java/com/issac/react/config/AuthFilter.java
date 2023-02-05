package com.issac.react.config;

import java.io.IOException;
import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.issac.react.util.StringUtil;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * authentication filter
 * 
 * @author issac
 *
 */
public class AuthFilter implements Filter {
	private static final String MESSAGE_UNAUTHORIZED = "{\"message\": \"unauthorized\"}";

	private static final Logger logger = LoggerFactory.getLogger(TxnFilter.class);
	
	private static String BEARER = "Bearer ";

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String authHeader = req.getHeader("Authorization");
		if (StringUtil.isEmpty(authHeader)) {
			send401Resp(res);
			return;
		}
		String token = null;
		if (authHeader.startsWith(BEARER)) {
			token = authHeader.substring(7);
		}
		if (StringUtil.isEmpty(token)) {
			send401Resp(res);
			return;
		}
		
		logger.info("token " + token);
		
		chain.doFilter(request, response);

	}
	
	private void send401Resp(HttpServletResponse res) throws IOException {
		res.sendError(401);
		PrintWriter out = res.getWriter();
		res.setContentType("application/json");
		res.setCharacterEncoding("UTF-8");
        out.print(MESSAGE_UNAUTHORIZED);
        out.flush();   
	}

}
