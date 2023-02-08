package com.issac.react.entity;

import java.time.Instant;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import jakarta.persistence.EntityListeners;
import jakarta.persistence.MappedSuperclass;
@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public class BaseEntity {
	
	@CreatedBy
	private String createdBy;
	
	@CreatedDate
	private Instant createdTs;
	
	@LastModifiedBy
	private String updatedBy;
	
	@LastModifiedDate
	private String updatedTs;
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public Instant getCreatedTs() {
		return createdTs;
	}
	public void setCreatedTs(Instant createdTs) {
		this.createdTs = createdTs;
	}
	public String getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
	public String getUpdatedTs() {
		return updatedTs;
	}
	public void setUpdatedTs(String updatedTs) {
		this.updatedTs = updatedTs;
	}
	
	
}
