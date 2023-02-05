package com.issac.react.dto;

import com.issac.react.entity.CompanyJob;

import jakarta.validation.constraints.NotBlank;

public class CompanyJobDTO extends BaseDTO {
	
	private String id;
	
	@NotBlank(message = "job company should not be empty")
	private String jobCmpany;
	
	@NotBlank(message = "job position should not be empty")
	private String jobPosition;
	
	@NotBlank(message = "job location should not be empty")
	private String jobLocation;
	private String jobStatus;
	private String jobType;
	private String jobPostedBy;
	
	public static CompanyJobDTO buildDTO(CompanyJob c) {
		CompanyJobDTO dto = new CompanyJobDTO();
		
		dto.setId(c.getId());
		dto.setJobCmpany(c.getJobCmpany());
		dto.setJobPosition(c.getJobPosition());
		dto.setJobLocation(c.getJobLocation());
		dto.setJobStatus(c.getJobStatus());
		dto.setJobType(c.getJobType());
		dto.setJobPostedBy(c.getJobPostedBy());
		BaseDTO.build(dto, c);;
		
		return dto;
	}
	
	public static CompanyJob buildEntity(CompanyJobDTO dto) {
		CompanyJob e = new CompanyJob();
		
		e.setId(dto.getId());
		e.setJobCmpany(dto.getJobCmpany());
		e.setJobPosition(dto.getJobPosition());
		e.setJobLocation(dto.getJobLocation());
		e.setJobStatus(dto.getJobStatus());
		e.setJobType(dto.getJobType());
		e.setJobPostedBy(dto.getJobPostedBy());
		
		return e;
	}
	public void copyToEntity(CompanyJob e) {
		
		e.setJobCmpany(getJobCmpany());
		e.setJobPosition(getJobPosition());
		e.setJobLocation(getJobLocation());
		e.setJobStatus(getJobStatus());
		e.setJobType(getJobType());
		
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getJobCmpany() {
		return jobCmpany;
	}
	public void setJobCmpany(String jobCmpany) {
		this.jobCmpany = jobCmpany;
	}
	public String getJobPosition() {
		return jobPosition;
	}
	public void setJobPosition(String jobPosition) {
		this.jobPosition = jobPosition;
	}
	public String getJobStatus() {
		return jobStatus;
	}
	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getJobLocation() {
		return jobLocation;
	}
	public void setJobLocation(String jobLocation) {
		this.jobLocation = jobLocation;
	}
	public String getJobPostedBy() {
		return jobPostedBy;
	}
	public void setJobPostedBy(String jobPostedBy) {
		this.jobPostedBy = jobPostedBy;
	}
	

}
