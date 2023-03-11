package com.issac.react.service.system;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.issac.react.dto.system.AppUserDTO;
import com.issac.react.dto.system.UserProfileDTO;
import com.issac.react.entity.AppRole;
import com.issac.react.entity.AppUser;
import com.issac.react.exception.RecordAlreadyExists;
import com.issac.react.exception.RecordNotFoundException;
import com.issac.react.repo.AppRoleRepo;
import com.issac.react.repo.UserRepo;

/**
 * 
 * @author issac
 *
 */
@Service
public class UserService {

	private UserRepo userRepo;
	private AppRoleRepo appRoleRepo;
	private PasswordEncoder encoder;

	public UserService(UserRepo userRepo, AppRoleRepo appRoleRepo, PasswordEncoder encoder) {
		this.userRepo = userRepo;
		this.appRoleRepo = appRoleRepo;
		this.encoder = encoder;
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
		boolean pwdMatch = encoder.matches(password, user.getPassword());
		// boolean pwdMatch = user.getPassword().equals(encodedPwd);
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
		user.setEmail(dto.getEmail());
		user.setPassword(encoder.encode(dto.getPassword()));
		user.setFirstName(dto.getFirstName());
		user.setLastName(dto.getLastName());
		user.setLocation(dto.getLocation());
		String roleName = dto.getAppRoleName();
		Optional<AppRole> appRole = appRoleRepo.findByRoleName(roleName);
		if (appRole.isEmpty()) {
			throw new RecordNotFoundException("role name " + dto.getAppRoleName() + " not found");
		}
		user.setUserRole(appRole.get());

		AppUser savedRec = userRepo.save(user);
		return AppUserDTO.build(savedRec);
	}

	public AppUserDTO updateUser(AppUserDTO dto) {
		Optional<AppUser> userObj = userRepo.findById(dto.getId());
		if (userObj == null || userObj.isEmpty()) {
			throw new RecordNotFoundException("user with id " + dto.getId() + " not found");
		}
		AppUser user = userObj.get();
//		user.setEmail(dto.getEmail());
//		user.setPassword(dto.getPassword());

		user.setFirstName(dto.getFirstName());
		user.setLastName(dto.getLastName());

		user.setLocation(dto.getLocation());
		user.setVersionNum(dto.getVersionNum());
		String roleName = dto.getAppRoleName();
		Optional<AppRole> appRole = appRoleRepo.findByRoleName(roleName);
		if (appRole.isEmpty()) {
			throw new RecordNotFoundException("role name " + dto.getAppRoleName() + " not found");
		}
		user.setUserRole(appRole.get());

		AppUser savedRec = userRepo.save(user);
		return AppUserDTO.build(savedRec);
	}

	public AppUserDTO updateUserProfile(UserProfileDTO dto) {
		AppUser user = userRepo.findByEmail(dto.getEmail());
		if (user == null) {
			throw new RecordNotFoundException("user with email " + dto.getEmail() + " not found");
		}
		user.setFirstName(dto.getFirstName());
		user.setLastName(dto.getLastName());
		user.setLocation(dto.getLocation());

		AppUser savedRec = userRepo.save(user);
		return AppUserDTO.build(savedRec);
	}
}
