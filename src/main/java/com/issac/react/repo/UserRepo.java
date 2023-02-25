package com.issac.react.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.issac.react.entity.AppUser;

@Repository
public interface UserRepo extends JpaRepository<AppUser, String> {
	AppUser findByEmail(String email);
}
