package com.test.mvc;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * This controller is not part of RESTful API, but rather goes to normal JSP views.
 */
@Controller
public class MainController {

	@Autowired
	private ApplicationContext applicationContext;

	@PostConstruct
	public void init() {
		System.out.println(" *** MainController.init with: " + applicationContext);
	}

	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/public")
	public String publicView() {
		System.out.println(" *** MainRestController.admin");
		return "public/random";
	}
	
	@RequestMapping("/restricted")
	public String restrictedView() {
		System.out.println(" *** MainRestController.admin");
		return "restricted/random";
	}
}
