package com.issac.react.controller.job;

import java.util.Collections;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.issac.react.config.AppContext;
import com.issac.react.config.AppContextHolder;
import com.issac.react.dto.SimpleResponseDTO;
import com.issac.react.dto.job.CompanyJobDTO;
import com.issac.react.dto.job.CompanyJobSearchDTO;
import com.issac.react.dto.job.CompanyJobSearchResultDTO;
import com.issac.react.dto.job.JobStatsContainer;
import com.issac.react.dto.job.JobStatsDTO;
import com.issac.react.dto.job.JobStatusCntDTO;
import com.issac.react.dto.job.MonthlyAppDTO;
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

	@GetMapping("/stats")
	public ResponseEntity<JobStatsContainer> getstats() {
		AppContext ctx = AppContextHolder.getContext();
		String userName = ctx.getUserName();
		List<JobStatusCntDTO> countByJobStatusDTO = companyJobService.getCountByJobStatus(userName);
		JobStatsContainer statsContainer = new JobStatsContainer();
		JobStatsDTO stat = new JobStatsDTO();
		for (JobStatusCntDTO d : countByJobStatusDTO) {
			if ("pending".equals(d.getJobStatus())) {
				stat.setPendingCnt(d.getCnt());
			} else if ("interview".equals(d.getJobStatus())) {
				stat.setInterviewCnt(d.getCnt());
			}
			if ("declined".equals(d.getJobStatus())) {
				stat.setDeclinedCnt(d.getCnt());
			}
		}

		statsContainer.setStats(stat);

		// monthly app
		List<MonthlyAppDTO> monthlyApp = companyJobService.getMonthlyApp(userName, 10);
		Collections.reverse(monthlyApp);
		statsContainer.setMonthlyApp(monthlyApp);
		return new ResponseEntity<>(statsContainer, HttpStatus.OK);
	}

	@GetMapping("/getjobs")
	public ResponseEntity<CompanyJobSearchResultDTO> getJobs() {
		List<CompanyJobDTO> jobs = companyJobService.getJobs(null);

		AppContext ctx = AppContextHolder.getContext();
		String userName = ctx.getUserName();

		List<JobStatusCntDTO> countByJobStatusDTO = companyJobService.getCountByJobStatus(userName);
		CompanyJobSearchResultDTO companyJobSearchResultDTO = new CompanyJobSearchResultDTO(jobs);
		companyJobSearchResultDTO.setJobStatusCntList(countByJobStatusDTO);

		return new ResponseEntity<>(companyJobSearchResultDTO, HttpStatus.OK);
	}

	@PostMapping("/searchjobs")
	public ResponseEntity<CompanyJobSearchResultDTO> searchJobs(@RequestBody CompanyJobSearchDTO dto) {
		List<CompanyJobDTO> jobs = companyJobService.search(dto);

		AppContext ctx = AppContextHolder.getContext();
		String userName = ctx.getUserName();

		List<JobStatusCntDTO> countByJobStatusDTO = companyJobService.getCountByJobStatus(userName);
		CompanyJobSearchResultDTO companyJobSearchResultDTO = new CompanyJobSearchResultDTO(jobs);
		companyJobSearchResultDTO.setJobStatusCntList(countByJobStatusDTO);

		return new ResponseEntity<>(companyJobSearchResultDTO, HttpStatus.OK);
	}

	@PostMapping("/createjob")
	public ResponseEntity<CompanyJobDTO> createJob(@Valid @RequestBody CompanyJobDTO jobDTO) {
		logger.info("createjob start:");
		CompanyJobDTO createJob = companyJobService.createJob(jobDTO);

		return new ResponseEntity<>(createJob, HttpStatus.OK);
	}

	@PatchMapping("/updatejob/{id}")
	public ResponseEntity<CompanyJobDTO> updateJob(@PathVariable String id,
			@Valid @RequestBody CompanyJobDTO jobDTO) {
		CompanyJobDTO updateJob = companyJobService.updateJob(id, jobDTO);
		return new ResponseEntity<>(updateJob, HttpStatus.OK);
	}

	@DeleteMapping("/deletejob/{id}")
	public ResponseEntity<SimpleResponseDTO> delete(@PathVariable String id) {
		companyJobService.deleteJob(id);
		return new ResponseEntity<>(new SimpleResponseDTO("deleted"), HttpStatus.OK);
	}

}
