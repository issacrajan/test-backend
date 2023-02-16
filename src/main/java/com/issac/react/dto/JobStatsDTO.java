package com.issac.react.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class JobStatsDTO {

	@JsonProperty("pending")
	private long pendingCnt;
	
	@JsonProperty("interview")
	private long interviewCnt;
	
	@JsonProperty("declined")
	private long declinedCnt;
	
	public long getPendingCnt() {
		return pendingCnt;
	}
	public void setPendingCnt(long pendingCnt) {
		this.pendingCnt = pendingCnt;
	}
	public long getInterviewCnt() {
		return interviewCnt;
	}
	public void setInterviewCnt(long interviewCnt) {
		this.interviewCnt = interviewCnt;
	}
	public long getDeclinedCnt() {
		return declinedCnt;
	}
	public void setDeclinedCnt(long declinedCnt) {
		this.declinedCnt = declinedCnt;
	}
	
	
}
