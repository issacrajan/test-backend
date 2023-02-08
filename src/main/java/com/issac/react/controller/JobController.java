package com.issac.react.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.issac.react.dto.CompanyJobDTO;
import com.issac.react.service.CompanyJobService;

import jakarta.validation.Valid;

@RequestMapping("/api/v1/job")
@RestController
@CrossOrigin
public class JobController {
	private static final Logger logger = LoggerFactory.getLogger(JobController.class);
	private CompanyJobService companyJobService;

	public JobController(CompanyJobService companyJobService) {
		this.companyJobService = companyJobService;
	}

	@PostMapping("/createjob")
	public ResponseEntity<CompanyJobDTO> createJob(@Valid @RequestBody CompanyJobDTO jobDTO) {
		logger.info("createjob start:");
		CompanyJobDTO createJob = companyJobService.createJob(jobDTO);
		return new ResponseEntity<>(createJob, HttpStatus.OK);
	}

	@PatchMapping("/updatejob")
	public ResponseEntity<CompanyJobDTO> updateJob(@Valid @RequestBody CompanyJobDTO jobDTO) {
		CompanyJobDTO updateJob = companyJobService.updateJob(jobDTO);
		return new ResponseEntity<>(updateJob, HttpStatus.OK);
	}

}
