package com.issac.react.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.stereotype.Repository;

import com.issac.react.entity.AppUser;

import jakarta.persistence.LockModeType;

@Repository
public interface UserRepo extends JpaRepository<AppUser, String> {
	@Override
	@Lock(LockModeType.OPTIMISTIC)
	Optional<AppUser> findById(String id);

	AppUser findByEmail(String email);
}
