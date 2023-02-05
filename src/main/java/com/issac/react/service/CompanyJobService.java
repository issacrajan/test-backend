package com.issac.react.service;

import org.springframework.stereotype.Service;

import com.issac.react.dto.CompanyJobDTO;
import com.issac.react.entity.CompanyJob;
import com.issac.react.exception.RecordNotFoundException;
import com.issac.react.repo.CompanyJobRepo;

@Service
public class CompanyJobService {
	private CompanyJobRepo companyJobRepo;

	public CompanyJobService(CompanyJobRepo companyJobRepo) {
		this.companyJobRepo = companyJobRepo;
	}

	public CompanyJobDTO createJob(CompanyJobDTO job) {
		CompanyJob savedEntity = companyJobRepo.save(CompanyJobDTO.buildEntity(job));
		return CompanyJobDTO.buildDTO(savedEntity);
	}

	public CompanyJobDTO updateJob(CompanyJobDTO job) {
		CompanyJob companyJob = companyJobRepo.getReferenceById(job.getId());
		if (companyJob == null) {
			throw new RecordNotFoundException("no company job record with id " + job.getId() + " found");
		}
		
		job.copyToEntity(companyJob);
		CompanyJob savedEntity = companyJobRepo.save(companyJob);

		return CompanyJobDTO.buildDTO(savedEntity);
	}
}
