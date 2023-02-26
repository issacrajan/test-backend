package com.issac.react.service.system;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.issac.react.config.AppContext;
import com.issac.react.config.AppContextHolder;
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
			if (!isValid(appRoleDTO)) {
				throw new InvalidInputException("validation errors");
			}
			AppRole appRole = appRoleDTO.buildNewEntity();
			AppRole saved = appRoleRepo.save(appRole);
			return AppRoleDTO.build(saved);
		} else if (RecordMode.EDIT == appRoleDTO.getRecordMode()) {
			AppRole appRole = appRoleRepo.getReferenceById(appRoleDTO.getId());
			appRoleDTO.updateEntity(appRole);
			AppRole saved = appRoleRepo.save(appRole);
			return AppRoleDTO.build(saved);

		} else {
			throw new InvalidInputException("invalid record type " + appRoleDTO.getRecordMode());
		}

	}

	private boolean isValid(AppRoleDTO appRoleDTO) {
		boolean isValid = true;
		if (appRoleDTO.getRolePolicyList() == null || appRoleDTO.getRolePolicyList().isEmpty()) {
			AppContext context = AppContextHolder.getContext();
			context.addError("RolePolicy", "role policy is missing");
			isValid = false;
		} else {
			isValid = appRoleDTO.isAppRolePolicyValid();
		}

		return isValid;
	}
}
