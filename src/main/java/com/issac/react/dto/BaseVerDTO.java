package com.issac.react.dto;

import java.time.LocalDateTime;

import com.issac.react.entity.BaseEntityVer;
import com.issac.react.util.RecordMode;

public class BaseVerDTO {
	protected RecordMode recordMode;
	protected LocalDateTime createdTs;
	protected LocalDateTime updatedTs;
	protected String createdBy;
	protected String updatedBy;
	protected int versionNum;

	public static void build(BaseVerDTO dto, BaseEntityVer e) {
		dto.setCreatedBy(e.getCreatedBy());
		dto.setCreatedTs(e.getCreatedTs());
		dto.setUpdatedBy(e.getUpdatedBy());
		dto.setUpdatedTs(e.getUpdatedTs());
		dto.setVersionNum(e.getVersionNum());
	}

	public RecordMode getRecordMode() {
		return recordMode;
	}

	public void setRecordMode(RecordMode recordMode) {
		this.recordMode = recordMode;
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

	public LocalDateTime getUpdatedTs() {
		return updatedTs;
	}

	public void setUpdatedTs(LocalDateTime updatedTs) {
		this.updatedTs = updatedTs;
	}

	public int getVersionNum() {
		return versionNum;
	}

	public void setVersionNum(int versionNum) {
		this.versionNum = versionNum;
	}

}
