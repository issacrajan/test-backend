package com.issac.react.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.issac.react.config.AppContext;
import com.issac.react.config.AppContextHolder;
import com.issac.react.dto.UserInfoDTO;
import com.issac.react.dto.UserProfileDTO;
import com.issac.react.dto.UserRegisterRespDTO;
import com.issac.react.exception.RecordNotFoundException;
import com.issac.react.service.UserService;

import jakarta.validation.Valid;
@RequestMapping("/api/v1/user")
@RestController
@CrossOrigin
public class UserController {
	private UserService userService;
	
	public UserController(UserService userService) {
		this.userService = userService;
	}

	@GetMapping("/all")
	public ResponseEntity<List<UserInfoDTO>> getAllUsers() {
		List<UserInfoDTO> dtos = userService.getAllUsers();
		
		return new ResponseEntity<>(dtos, HttpStatus.OK);
	}
	
	@GetMapping("/getcurrentuser")
	public ResponseEntity<UserInfoDTO> getCurrentUser() {
		AppContext appContext = AppContextHolder.getContext();
		
		UserInfoDTO dto = userService.getUserById(appContext.getUserId());
		if (dto == null) {
			throw new RecordNotFoundException("no user record with user id: " + appContext.getUserId());
		}
		return new ResponseEntity<>(dto, HttpStatus.OK);
	}
	
	@GetMapping("/getuser/{email}")
	public ResponseEntity<UserInfoDTO> getUser(@PathVariable String email) {
		UserInfoDTO dto = userService.getUser(email);
		if (dto == null) {
			throw new RecordNotFoundException("no user record with email: " + email);
		}
		return new ResponseEntity<>(dto, HttpStatus.OK);
	}

	@PostMapping("/createuser")
	public ResponseEntity<UserInfoDTO> createUser(@Valid @RequestBody UserInfoDTO userInfo) {
		UserInfoDTO dto = userService.createUser(userInfo);
		return new ResponseEntity<>(dto, HttpStatus.OK);
	}
	
	@PatchMapping("/updateprofile")
	public ResponseEntity<UserRegisterRespDTO> updateUserProfile(@Valid @RequestBody UserProfileDTO userInfo) {
		UserInfoDTO dto = userService.updateUserProfile(userInfo);
		UserRegisterRespDTO r = new UserRegisterRespDTO(dto, "1234");
		return new ResponseEntity<>(r, HttpStatus.OK);
	}

}
