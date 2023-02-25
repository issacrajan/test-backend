package com.issac.react.service;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.issac.react.dto.system.AppRoleDTO;
import com.issac.react.entity.AppRole;
import com.issac.react.exception.InvalidInputException;
import com.issac.react.exception.RecordNotFoundException;
import com.issac.react.repo.AppRoleRepo;
import com.issac.react.util.RecordMode;

@Service
public class AppRoleService {

	private AppRoleRepo appRoleRepo;

	public AppRoleService(AppRoleRepo appRoleRepo) {
		this.appRoleRepo = appRoleRepo;
	}

	public AppRoleDTO getRole(String roleName) {
		Optional<AppRole> appRole = appRoleRepo.findByRoleName(roleName);
		if (appRole.isEmpty()) {
			throw new RecordNotFoundException("no role with name " + roleName + " found");
		}
		return AppRoleDTO.build(appRole.get());
	}

	public AppRoleDTO save(AppRoleDTO appRoleDTO) {
		if (RecordMode.ADD == appRoleDTO.getRecordMode()) {

		} else if (RecordMode.EDIT == appRoleDTO.getRecordMode()) {

		} else {
			throw new InvalidInputException("invalid record type " + appRoleDTO.getRecordMode());
		}

//		Optional<AppRole> appRole = appRoleRepo.findByRoleName(roleName);
//		if (appRole.isEmpty()) {
//			throw new RecordNotFoundException("no role with name " + roleName + " found");
//		}
		return null;
	}

}
