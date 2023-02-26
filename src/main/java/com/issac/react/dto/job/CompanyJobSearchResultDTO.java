package com.issac.react.dto.job;

import java.util.List;

public class CompanyJobSearchResultDTO  {
	private List<CompanyJobDTO> jobs;
	private int totalJobs;
	private int numOfPages;
	
	private List<JobStatusCntDTO> jobStatusCntList ;
	
	public CompanyJobSearchResultDTO(List<CompanyJobDTO> jobs) {
		this.jobs = jobs;
		this.totalJobs = jobs.size();
	}
	public List<CompanyJobDTO> getJobs() {
		return jobs;
	}
	public void setJobs(List<CompanyJobDTO> jobs) {
		this.jobs = jobs;
	}
	public int getTotalJobs() {
		return totalJobs;
	}
	public void setTotalJobs(int totalJobs) {
		this.totalJobs = totalJobs;
	}
	public int getNumOfPages() {
		return numOfPages;
	}
	public void setNumOfPages(int numOfPages) {
		this.numOfPages = numOfPages;
	}
	public List<JobStatusCntDTO> getJobStatusCntList() {
		return jobStatusCntList;
	}
	public void setJobStatusCntList(List<JobStatusCntDTO> jobStatusCntList) {
		this.jobStatusCntList = jobStatusCntList;
	}
	
}
