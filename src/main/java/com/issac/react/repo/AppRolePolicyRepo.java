package com.issac.react.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.issac.react.entity.AppRolePolicy;

@Repository
public interface AppRolePolicyRepo extends JpaRepository<AppRolePolicy, String> {

}
