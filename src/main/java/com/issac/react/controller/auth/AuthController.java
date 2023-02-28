package com.issac.react.controller.auth;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.issac.react.controller.job.JobController;
import com.issac.react.dto.system.AppUserDTO;
import com.issac.react.dto.system.UserLoginDTO;
import com.issac.react.dto.system.UserRegisterRespDTO;
import com.issac.react.service.system.UserService;
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
	public ResponseEntity<UserRegisterRespDTO> createUser(@Valid @RequestBody AppUserDTO userInfo) {
		AppUserDTO dto = userService.createUser(userInfo);
		String token = jwtUtil.createJWT(dto.getId(), dto.getLastName(), dto.getEmail(), "Admin", 100);
		logger.info("token: " + token);
		UserRegisterRespDTO resp = new UserRegisterRespDTO(dto, token);
		return new ResponseEntity<>(resp, HttpStatus.OK);
	}

	@PostMapping("/login")
	public ResponseEntity<UserRegisterRespDTO> login(@Valid @RequestBody UserLoginDTO userLoginDTO) {
		AppUserDTO dto = userService.validateLogin(userLoginDTO.getEmail(), userLoginDTO.getPassword());
		String token = jwtUtil.createJWT(dto.getId(), dto.getLastName(), dto.getEmail(), "Admin", 100);
		logger.info("token: " + token);
		UserRegisterRespDTO resp = new UserRegisterRespDTO(dto, token);
		return new ResponseEntity<>(resp, HttpStatus.OK);
	}

}
