package com.issac.react.dto;

import java.time.Instant;

import com.issac.react.entity.BaseEntity;


public class BaseDTO {
	protected String createdBy;
	protected Instant createdTs;
	protected String updatedBy;
	protected String updatedTs;
	
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
