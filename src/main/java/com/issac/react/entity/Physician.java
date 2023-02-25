package com.issac.react.entity;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;

@Entity
public class Physician extends BaseEntityVer {

	@Id
	@GeneratedValue(strategy = GenerationType.UUID)
	private String id;

	private String firstName;
	private String lastName;

	@ManyToMany(mappedBy = "physicians")
	private List<Facility> facilityList;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public List<Facility> getFacilityList() {
		return facilityList;
	}

	public void setFacilityList(List<Facility> facilityList) {
		this.facilityList = facilityList;
	}

	@Override
	public String toString() {
		return "Physician [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", facilityList=" + facilityList + "]";
	}

}
