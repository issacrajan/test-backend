package com.issac.react.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.issac.react.entity.AppRole;

@Repository
public interface AppRoleRepo extends JpaRepository<AppRole, String> {

	Optional<AppRole> findByRoleName(String roleName);
}
