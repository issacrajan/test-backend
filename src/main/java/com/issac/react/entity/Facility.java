package com.issac.react.entity;

import java.time.LocalDate;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;

@Entity
public class Facility extends BaseEntityVer {

	@Id()
	@GeneratedValue(strategy = GenerationType.UUID)
	private String id;

	private String facilityName;
	private LocalDate effectiveFromDate;

	@ManyToMany
	@JoinTable(
			name = "facility_phy_affl",
				joinColumns = @JoinColumn(name = "facility_id"),
				inverseJoinColumns = @JoinColumn(name = "physician_id"))
	private List<Physician> physicians;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFacilityName() {
		return facilityName;
	}

	public void setFacilityName(String facilityName) {
		this.facilityName = facilityName;
	}

	public LocalDate getEffectiveFromDate() {
		return effectiveFromDate;
	}

	public void setEffectiveFromDate(LocalDate effectiveFromDate) {
		this.effectiveFromDate = effectiveFromDate;
	}

	public List<Physician> getPhysicians() {
		return physicians;
	}

	public void setPhysicians(List<Physician> physicians) {
		this.physicians = physicians;
	}

	@Override
	public String toString() {
		return "Facility [id=" + id + ", facilityName=" + facilityName + ", effectiveFromDate="
				+ effectiveFromDate + ", physicians=" + physicians + "]";
	}

}
