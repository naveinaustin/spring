package com.boot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Hello world!
 *
 */
//Mark the class as a Spring Boot Application
@SpringBootApplication
public class App 
{
    public static void main( String[] args )
    {
    	//Fires spring boot as an application
        SpringApplication.run(App.class, args);
    }
}
