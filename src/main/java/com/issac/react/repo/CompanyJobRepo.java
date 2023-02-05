package com.issac.react.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.issac.react.entity.CompanyJob;

@Repository
public interface CompanyJobRepo extends JpaRepository<CompanyJob, String>  {

}
