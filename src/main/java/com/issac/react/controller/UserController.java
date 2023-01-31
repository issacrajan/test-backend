package com.issac.react.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.issac.react.dto.UserInfoDTO;
import com.issac.react.exception.RecordNotFoundException;
import com.issac.react.service.UserService;

import jakarta.validation.Valid;

@RestController
public class UserController {
	private UserService userService;
	
	public UserController(UserService userService) {
		this.userService = userService;
	}

	@GetMapping("/user/{email}")
	public ResponseEntity<UserInfoDTO> getUser(@PathVariable String email) {
		UserInfoDTO dto = userService.getUser(email);
		if (dto == null) {
			throw new RecordNotFoundException("no user record with email: " + email);
		}
		return new ResponseEntity<>(dto, HttpStatus.OK);
	}

	@PostMapping("/user")
	public ResponseEntity<UserInfoDTO> createUser(@Valid @RequestBody UserInfoDTO userInfo) {
		UserInfoDTO dto = userService.createUser(userInfo);
		return new ResponseEntity<>(dto, HttpStatus.OK);
	}
	
	@PutMapping("/user")
	public ResponseEntity<UserInfoDTO> updateUser(@Valid @RequestBody UserInfoDTO userInfo) {
		UserInfoDTO dto = userService.updateUser(userInfo);
		return new ResponseEntity<>(dto, HttpStatus.OK);
	}

}
