package com.issac.react.controller;

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

import jakarta.validation.Valid;

@RestController
@RequestMapping("/auth")
@CrossOrigin
public class AuthController {
	private UserService userService;

	public AuthController(UserService userService) {
		this.userService = userService;
	}

	@PostMapping("/register")
	public ResponseEntity<UserRegisterRespDTO> createUser(@Valid @RequestBody UserInfoDTO userInfo) {
		UserInfoDTO dto = userService.createUser(userInfo);
		UserRegisterRespDTO resp = new UserRegisterRespDTO(dto, "1234");
		return new ResponseEntity<>(resp, HttpStatus.OK);
	}

	@PostMapping("/login")
	public ResponseEntity<UserRegisterRespDTO> login(@Valid @RequestBody UserLoginDTO userLoginDTO) {
		UserInfoDTO dto = userService.validateLogin(userLoginDTO.getEmail(), userLoginDTO.getPassword());
		UserRegisterRespDTO resp = new UserRegisterRespDTO(dto, "1234");
		return new ResponseEntity<>(resp, HttpStatus.OK);
	}

}
