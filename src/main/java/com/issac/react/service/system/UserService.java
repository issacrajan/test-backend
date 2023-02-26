package com.issac.react.service.system;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.issac.react.dto.system.AppUserDTO;
import com.issac.react.dto.system.UserProfileDTO;
import com.issac.react.entity.AppUser;
import com.issac.react.exception.RecordAlreadyExists;
import com.issac.react.exception.RecordNotFoundException;
import com.issac.react.repo.UserRepo;

@Service
public class UserService {

	private UserRepo userRepo;

	public UserService(UserRepo userRepo) {
		this.userRepo = userRepo;
	}

	public AppUserDTO getUserById(String userId) {
		return AppUserDTO.build(userRepo.getReferenceById(userId));
	}
	public AppUserDTO getUser(String email) {
		return AppUserDTO.build(userRepo.findByEmail(email));
	}

	public AppUserDTO validateLogin(String email, String password) {
		AppUser user = userRepo.findByEmail(email);
		if (user == null) {
			throw new RecordNotFoundException("user not found / invalid password");
		}
		boolean pwdMatch = user.getPassword().equals(password);
		if (!pwdMatch) {
			throw new RecordNotFoundException("user not found / invalid password");
		}
		return AppUserDTO.build(user);
	}

	public List<AppUserDTO> getAllUsers() {
		List<AppUser> list = userRepo.findAll();
		List<AppUserDTO> dtos = new ArrayList<>();
		for (AppUser u : list) {
			dtos.add(AppUserDTO.build(u));
		}
		return dtos;
	}

	public AppUserDTO createUser(AppUserDTO dto) {
		AppUser userInfo = userRepo.findByEmail(dto.getEmail());
		if (userInfo != null) {
			throw new RecordAlreadyExists("user with email " + dto.getEmail() + " already exists");
		}
		AppUser user = new AppUser();
		user.setName(dto.getName());
		user.setLastname(dto.getLastname());
		user.setEmail(dto.getEmail());
		user.setPassword(dto.getPassword());
		user.setLocation(dto.getLocation());

		AppUser savedRec = userRepo.save(user);
		return AppUserDTO.build(savedRec);
	}

	public AppUserDTO updateUser(AppUserDTO dto) {
		AppUser userInfo = userRepo.findByEmail(dto.getEmail());
		if (userInfo == null) {
			throw new RecordNotFoundException("user with id " + dto.getId() + " not found");
		}
		AppUser user = userRepo.getReferenceById(dto.getId());
		user.setName(dto.getName());
		user.setLastname(dto.getLastname());
		// user.setEmail(dto.getEmail());
		user.setPassword(dto.getPassword());
		user.setLocation(dto.getLocation());

		AppUser savedRec = userRepo.save(user);
		return AppUserDTO.build(savedRec);
	}
	
	public AppUserDTO updateUserProfile(UserProfileDTO dto) {
		AppUser user = userRepo.findByEmail(dto.getEmail());
		if (user == null) {
			throw new RecordNotFoundException("user with email " + dto.getEmail() + " not found");
		}
		user.setName(dto.getName());
		user.setLastname(dto.getLastname());
		user.setLocation(dto.getLocation());

		AppUser savedRec = userRepo.save(user);
		return AppUserDTO.build(savedRec);
	}
}
