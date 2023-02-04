package com.issac.react.util;

import java.security.Key;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Base64;
import java.util.Date;
import java.util.UUID;

import javax.crypto.spec.SecretKeySpec;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

public class JwtUtil {
	private static String secret = "asdfSFS34wfsdfsdfSDSD32dfsddDDerQSNCK34SOWEK5354fdgdf4";

	public String createJWT(String name, String email, String role, int expiresInMins) {
		Key hmacKey = new SecretKeySpec(Base64.getDecoder().decode(secret),
				SignatureAlgorithm.HS256.getJcaName());

		Instant now = Instant.now();
		// @formatter:off
		String jwtToken = Jwts.builder()
		        .claim("name", name)
		        .claim("email", email)
		        .claim("role", role)
		        .setSubject(name)
		        .setId(UUID.randomUUID().toString())
		        .setIssuedAt(Date.from(now))
		        .setExpiration(Date.from(now.plus(expiresInMins, ChronoUnit.MINUTES)))
		        .signWith(hmacKey)
		        .compact();
		// @formatter:on
		
		return jwtToken;
	}
	
	public Jws<Claims> parsetJWT(String jwtToken){
		Key hmacKey = new SecretKeySpec(Base64.getDecoder().decode(secret),
				SignatureAlgorithm.HS256.getJcaName());
		// @formatter:off
		Jws<Claims> jwt = Jwts.parserBuilder()
	            .setSigningKey(hmacKey)
	            .build()
	            .parseClaimsJws(jwtToken);
		// @formatter:on
		return jwt;
	}
	
	
}
