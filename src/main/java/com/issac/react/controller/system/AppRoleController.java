package com.issac.react.controller.system;

import java.net.URI;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.issac.react.dto.system.AppRoleDTO;
import com.issac.react.service.system.AppRoleService;

import jakarta.validation.Valid;

@RestController()
@RequestMapping("/system")
public class AppRoleController {

	private AppRoleService appRoleService;

	public AppRoleController(AppRoleService appRoleService) {
		this.appRoleService = appRoleService;
	}

	@GetMapping("/role/{roleName}")
	public AppRoleDTO getAppRole(@PathVariable String roleName) {
		return appRoleService.getRole(roleName);
	}

	@PostMapping("/saverole")
	public ResponseEntity<AppRoleDTO> create(@RequestBody @Valid AppRoleDTO appRole) {
		AppRoleDTO saved = appRoleService.save(appRole);

		if (saved == null) {
			return ResponseEntity.notFound().build();
		}
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(saved.getId())
				.toUri();

		return ResponseEntity.created(uri).body(saved);

	}
}
