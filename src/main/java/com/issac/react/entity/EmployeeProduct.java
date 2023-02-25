package com.issac.react.entity;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class EmployeeProduct extends BaseEntityVer {

	@Id
	@GeneratedValue(strategy = GenerationType.UUID)
	private String id;

	@Column(updatable = false)
	private LocalDate effectiveDate;

	@ManyToOne
	@JoinColumn(name = "employee_id")
	private Employee employee;

	@ManyToOne
	@JoinColumn(name = "product_id")
	private Product productId;

}
