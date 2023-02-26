package com.issac.react.entity;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

/**
 * 
 * @author issac
 *
 */
@Entity
public class Dependent extends BaseEntityVer {

	@Id
	@GeneratedValue(strategy = GenerationType.UUID)
	private String id;

	private String depFirstName;
	private String depLastName;
	private LocalDate birthDate;
	private String relationToEmp;
	@Column(name = "dep_seq_num")
	private int depSeqNum;

	@ManyToOne
	@JoinColumn(name = "employee_id")
	private Employee employee;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDepFirstName() {
		return depFirstName;
	}

	public void setDepFirstName(String depFirstName) {
		this.depFirstName = depFirstName;
	}

	public String getDepLastName() {
		return depLastName;
	}

	public void setDepLastName(String depLastName) {
		this.depLastName = depLastName;
	}

	public LocalDate getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(LocalDate birthDate) {
		this.birthDate = birthDate;
	}

	public String getRelationToEmp() {
		return relationToEmp;
	}

	public void setRelationToEmp(String relationToEmp) {
		this.relationToEmp = relationToEmp;
	}

	public int getDepSeqNum() {
		return depSeqNum;
	}

	public void setDepSeqNum(int depSeqNum) {
		this.depSeqNum = depSeqNum;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@Override
	public String toString() {
		return "Dependent [id=" + id + ", depFirstName=" + depFirstName + ", depLastName=" + depLastName
				+ ", birthDate=" + birthDate + ", relationToEmp=" + relationToEmp + ", depSeqNum=" + depSeqNum
				+ ", employee=" + employee + "]";
	}

}
