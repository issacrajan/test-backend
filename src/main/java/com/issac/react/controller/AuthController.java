package com.issac.react.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.issac.react.dto.UserInfoDTO;
import com.issac.react.dto.UserLoginDTO;
import com.issac.react.dto.UserRegisterRespDTO;
import com.issac.react.service.UserService;
import com.issac.react.util.JwtUtil;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/auth")
@CrossOrigin
public class AuthController {
	private static final Logger logger = LoggerFactory.getLogger(JobController.class);
	
	private UserService userService;
	private JwtUtil jwtUtil;
	
	public AuthController(UserService userService, JwtUtil jwtUtil) {
		this.userService = userService;
		this.jwtUtil = jwtUtil;
	}

	@PostMapping("/register")
	public ResponseEntity<UserRegisterRespDTO> createUser(@Valid @RequestBody UserInfoDTO userInfo) {
		UserInfoDTO dto = userService.createUser(userInfo);
		String token = jwtUtil.createJWT(dto.getName(), dto.getEmail(), "Admin", 10);
		logger.info("token: " + token);
		UserRegisterRespDTO resp = new UserRegisterRespDTO(dto, token);
		return new ResponseEntity<>(resp, HttpStatus.OK);
	}

	@PostMapping("/login")
	public ResponseEntity<UserRegisterRespDTO> login(@Valid @RequestBody UserLoginDTO userLoginDTO) {
		UserInfoDTO dto = userService.validateLogin(userLoginDTO.getEmail(), userLoginDTO.getPassword());
		String token = jwtUtil.createJWT(dto.getName(), dto.getEmail(), "Admin", 10);
		logger.info("token: " + token);
		UserRegisterRespDTO resp = new UserRegisterRespDTO(dto, token);
		return new ResponseEntity<>(resp, HttpStatus.OK);
	}

}
