package com.issac.react;

import java.security.Principal;

import org.hibernate.envers.event.spi.EnversPostInsertEventListenerImpl;
import org.hibernate.event.spi.PostUpdateEventListener;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class TestBackendApplication {

	public static void main(String[] args) {
		Principal p;
		EnversPostInsertEventListenerImpl i;
		PostUpdateEventListener pp;
		SpringApplication.run(TestBackendApplication.class, args);
	}

}
