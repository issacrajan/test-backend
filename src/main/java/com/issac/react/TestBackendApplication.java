package com.issac.react;

import java.security.Principal;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class TestBackendApplication {

	public static void main(String[] args) {
		Principal p;
		SpringApplication.run(TestBackendApplication.class, args);
	}

}
