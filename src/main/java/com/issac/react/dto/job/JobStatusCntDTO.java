package com.issac.react.dto.job;

public class JobStatusCntDTO {

	private String jobStatus;
	private long cnt;
	
	public JobStatusCntDTO() {
	}
	public JobStatusCntDTO(String jobStatus, long cnt) {
		this.jobStatus = jobStatus;
		this.cnt = cnt;
	}
	public String getJobStatus() {
		return jobStatus;
	}
	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus;
	}
	public long getCnt() {
		return cnt;
	}
	public void setCnt(long cnt) {
		this.cnt = cnt;
	}
	
}
