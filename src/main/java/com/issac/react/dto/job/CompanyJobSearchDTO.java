package com.issac.react.dto.job;

import com.issac.react.dto.BaseDTO;

public class CompanyJobSearchDTO extends BaseDTO {
	private String jobCompany;
	private String jobPosition;
	private String jobLocation;
	private String jobStatus;
	private String jobType;
	
	public String getJobCompany() {
		return jobCompany;
	}

	public void setJobCompany(String jobCompany) {
		this.jobCompany = jobCompany;
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

	@Override
	public String toString() {
		return "CompanyJobSearchDTO [jobCompany=" + jobCompany + ", jobPosition=" + jobPosition
				+ ", jobLocation=" + jobLocation + ", jobStatus=" + jobStatus + ", jobType=" + jobType + "]";
	}
	

}
