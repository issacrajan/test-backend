package com.issac.react.entity;

import org.hibernate.envers.Audited;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Version;

/**
 * 
 * @author issac
 *
 */
@Entity
@Table(name = "company_job")
@Audited
public class CompanyJob extends BaseEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.UUID)
	private String id;

	private String jobCompany;
	private String jobPosition;
	private String jobLocation;
	private String jobStatus;
	private String jobType;
	private String jobPostedBy;

	@Version
	private long versionCol;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

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

	public String getJobPostedBy() {
		return jobPostedBy;
	}

	public void setJobPostedBy(String jobPostedBy) {
		this.jobPostedBy = jobPostedBy;
	}

	@Override
	public String toString() {
		return "CompanyJob [id=" + id + ", jobCompany=" + jobCompany + ", jobPosition=" + jobPosition
				+ ", jobLocation=" + jobLocation + ", jobStatus=" + jobStatus + ", jobType=" + jobType
				+ ", jobPostedBy=" + jobPostedBy + "]";
	}

}
