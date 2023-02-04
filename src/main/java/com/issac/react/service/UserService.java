package com.issac.react.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.issac.react.dto.UserInfoDTO;
import com.issac.react.entity.UserInfo;
import com.issac.react.exception.RecordAlreadyExists;
import com.issac.react.exception.RecordNotFoundException;
import com.issac.react.repo.UserRepo;

@Service
public class UserService {

	private UserRepo userRepo;

	public UserService(UserRepo userRepo) {
		this.userRepo = userRepo;
	}

	public UserInfoDTO getUser(String email) {
		return UserInfoDTO.build(userRepo.findByEmail(email));
	}

	public UserInfoDTO validateLogin(String email, String password) {
		UserInfo user = userRepo.findByEmail(email);
		if (user == null) {
			throw new RecordNotFoundException("user not found / invalid password");
		}
		boolean pwdMatch = user.getPassword().equals(password);
		if (!pwdMatch) {
			throw new RecordNotFoundException("user not found / invalid password");
		}
		return UserInfoDTO.build(user);
	}

	public List<UserInfoDTO> getAllUsers() {
		List<UserInfo> list = userRepo.findAll();
		List<UserInfoDTO> dtos = new ArrayList<>();
		for (UserInfo u : list) {
			dtos.add(UserInfoDTO.build(u));
		}
		return dtos;
	}

	public UserInfoDTO createUser(UserInfoDTO dto) {
		UserInfo userInfo = userRepo.findByEmail(dto.getEmail());
		if (userInfo != null) {
			throw new RecordAlreadyExists("user with email " + dto.getEmail() + " already exists");
		}
		UserInfo user = new UserInfo();
		user.setName(dto.getName());
		user.setLastname(dto.getLastname());
		user.setEmail(dto.getEmail());
		user.setPassword(dto.getPassword());
		user.setLocation(dto.getLocation());

		UserInfo savedRec = userRepo.save(user);
		return UserInfoDTO.build(savedRec);
	}

	public UserInfoDTO updateUser(UserInfoDTO dto) {
		UserInfo userInfo = userRepo.findByEmail(dto.getEmail());
		if (userInfo == null) {
			throw new RecordNotFoundException("user with id " + dto.getId() + " not found");
		}
		UserInfo user = userRepo.getReferenceById(dto.getId());
		user.setName(dto.getName());
		user.setLastname(dto.getLastname());
		// user.setEmail(dto.getEmail());
		user.setPassword(dto.getPassword());
		user.setLocation(dto.getLocation());

		UserInfo savedRec = userRepo.save(user);
		return UserInfoDTO.build(savedRec);
	}
}
