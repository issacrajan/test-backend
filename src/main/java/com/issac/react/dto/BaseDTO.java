package com.issac.react.dto;

import java.time.Instant;
import java.time.LocalDateTime;

import com.issac.react.entity.BaseEntity;


public class BaseDTO {
	protected String createdBy;
	protected LocalDateTime createdTs;
	protected String updatedBy;

	protected Instant updatedTs;

	
	public static void build (BaseDTO dto , BaseEntity e) {
		dto.setCreatedBy(e.getCreatedBy());
		dto.setCreatedTs(e.getCreatedTs());
		dto.setUpdatedBy(e.getUpdatedBy());
		dto.setUpdatedTs(e.getUpdatedTs());
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public LocalDateTime getCreatedTs() {
		return createdTs;
	}
	public void setCreatedTs(LocalDateTime createdTs) {
		this.createdTs = createdTs;
	}
	public String getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

	public Instant getUpdatedTs() {
		return updatedTs;
	}
	public void setUpdatedTs(Instant updatedTs) {
		this.updatedTs = updatedTs;
	}
	
	
}
