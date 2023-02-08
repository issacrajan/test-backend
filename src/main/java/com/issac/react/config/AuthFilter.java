package com.issac.react.config;

import java.io.IOException;
import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.issac.react.util.JwtUtil;
import com.issac.react.util.StringUtil;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jws;
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
	private JwtUtil jwtUtil;

	public AuthFilter(JwtUtil jwtUtil) {
		this.jwtUtil = jwtUtil;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		logger.info("AuthFilter start:" + req.getRequestURI());

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
		Jws<Claims> parsetJWT = null;
		try {
			parsetJWT = jwtUtil.parsetJWT(token);
		} catch (ExpiredJwtException expiredExc) {
			logger.info("ExpiredJwtException " + req.getRequestURI());
			send401Resp(res);
			return;
		} catch (Exception e) {
			logger.error("error while parsing ", e);
			send401Resp(res);
			return;
		}
		AppContext appContext = AppContextHolder.getContext();
		Claims claims = parsetJWT.getBody();
		appContext.setUserName((String) claims.get(JwtUtil.CLAIM_NAME));
		appContext.setEmail((String) claims.get(JwtUtil.CLAIM_EMAIL));
		appContext.setRoleName((String) claims.get(JwtUtil.CLAIM_ROLE));

		try {
			chain.doFilter(request, response);
		} finally {
			AppContextHolder.clearContext();
		}
		logger.info("AuthFilter processed:" + req.getRequestURI());
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
