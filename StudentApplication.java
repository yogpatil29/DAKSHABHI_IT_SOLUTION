package com.Boot;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;



@SpringBootApplication
public class StudentApplication {
	
	public static void main(String[] args) {
		SpringApplication.run(StudentApplication.class, args);	
		System.out.println("I am now in Spring Boot");
	}
}
