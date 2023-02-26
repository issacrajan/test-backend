package com.issac.react.entity;

import java.time.LocalDate;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OrderColumn;

/**
 * 
 * @author issac
 *
 */
@Entity
public class Employee extends BaseEntityVer {

	@Id
	@GeneratedValue(strategy = GenerationType.UUID)
	private String id;

	private String firstName;
	private String lastName;
	private LocalDate birthDate;
	private String gender;

	@OneToMany(mappedBy = "employee")
	@OrderColumn(name = "dep_seq_num")
	private List<Dependent> dependents;

	@OneToMany(mappedBy = "employee")
	private List<EmployeeProduct> products;

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

	public LocalDate getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(LocalDate birthDate) {
		this.birthDate = birthDate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public List<Dependent> getDependents() {
		return dependents;
	}

	public void setDependents(List<Dependent> dependents) {
		this.dependents = dependents;
	}

	@Override
	public String toString() {
		return "Employee [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", birthDate="
				+ birthDate + ", gender=" + gender + ", dependents=" + dependents + "]";
	}

}
