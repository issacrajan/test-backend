package com.issac.react.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.issac.react.dto.job.CompanyJobDTO;
import com.issac.react.dto.job.CompanyJobSearchDTO;
import com.issac.react.dto.job.JobStatusCntDTO;
import com.issac.react.dto.job.MonthlyAppDTO;
import com.issac.react.entity.CompanyJob;
import com.issac.react.exception.RecordNotFoundException;
import com.issac.react.repo.CompanyJobRepo;
import com.issac.react.util.StringUtil;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;

@Service
public class CompanyJobService {
	@PersistenceContext
	private EntityManager entityManager;

	private CompanyJobRepo companyJobRepo;

	public CompanyJobService(CompanyJobRepo companyJobRepo) {
		this.companyJobRepo = companyJobRepo;
	}

	public List<CompanyJobDTO> getJobs(CompanyJobSearchDTO search) {
		List<CompanyJob> allJobs = companyJobRepo.findAll();

		return allJobs.stream().map(job -> CompanyJobDTO.buildDTO(job)).collect(Collectors.toList());

	}

	public List<CompanyJobDTO> search(CompanyJobSearchDTO search) {
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<CompanyJob> query = cb.createQuery(CompanyJob.class);
		Root<CompanyJob> job = query.from(CompanyJob.class);

		query.select(job).where(cb.like(job.get("jobLocation"), search.getJobLocation()));
		if (StringUtil.hasContent(search.getJobStatus())) {
			query.where(cb.equal(job.get("jobStatus"), search.getJobStatus()));
		}
		TypedQuery<CompanyJob> createQuery = entityManager.createQuery(query);
		List<CompanyJob> resultList = createQuery.getResultList();

		return resultList.stream().map(jobRec -> CompanyJobDTO.buildDTO(jobRec)).collect(Collectors.toList());

	}

	public List<JobStatusCntDTO> getCountByJobStatus(String createdBy) {
		return companyJobRepo.getStatusCnt(createdBy);
	}

	public List<MonthlyAppDTO> getMonthlyApp(String createdBy, int limit) {
		return companyJobRepo.getMonthlyApp(createdBy, limit);
	}

	public CompanyJobDTO createJob(CompanyJobDTO job) {
		CompanyJob savedEntity = companyJobRepo.save(CompanyJobDTO.buildEntity(job));
		return CompanyJobDTO.buildDTO(savedEntity);
	}

	public CompanyJobDTO updateJob(String jobId, CompanyJobDTO job) {
		CompanyJob companyJob = companyJobRepo.getReferenceById(jobId);
		if (companyJob == null) {
			throw new RecordNotFoundException("no company job record with id " + jobId + " found");
		}

		job.copyToEntity(companyJob);
		CompanyJob savedEntity = companyJobRepo.save(companyJob);

		return CompanyJobDTO.buildDTO(savedEntity);
	}

	public void deleteJob(String jobId) {
		companyJobRepo.deleteById(jobId);

	}
}
