package com.issac.react.controller.system;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.issac.react.dto.system.AppRoleDTO;
import com.issac.react.service.system.AppRoleService;

import jakarta.validation.Valid;

@RestController("/system")
public class AppRoleController {

	private AppRoleService appRoleService;

	public AppRoleController(AppRoleService appRoleService) {
		this.appRoleService = appRoleService;
	}

	@GetMapping("/role/{roleName}")
	public AppRoleDTO getAppRole(@PathVariable String roleName) {
		return appRoleService.getRole(roleName);
	}

	@PostMapping("/saverole/")
	public AppRoleDTO create(@Valid AppRoleDTO appRole) {
		return appRoleService.save(appRole);
	}
}
