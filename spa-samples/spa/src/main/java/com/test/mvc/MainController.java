package com.test.mvc;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.main.secimpl.TokenManagerSingle;

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
	
	@Autowired
	TokenManagerSingle tokenManagerSingle;

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
	
	@RequestMapping(value="/public/test", method = RequestMethod.POST, produces="application/json")
	public @ResponseBody String restPublicCheck() {
		System.out.println(" *** MainRestController.rest");
		return "{\"a\":1, \"b\":\"public\"}";
	}
	
	@RequestMapping(value="/restricted/test", method = RequestMethod.POST, produces="application/json")
	public @ResponseBody String restRestrictedCheck() {
		System.out.println(" *** MainRestController.rest");
		return "{\"a\":1, \"b\":\"restricted\"}";
	}
	
	@RequestMapping(value="/restricted/message", method = RequestMethod.GET, produces="application/json")
	public @ResponseBody String restRestrictedMessage() {
		System.out.println(" *** MainRestController.message");
		return "{\"message\":\"Test Message\"}";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST, produces="application/json")
	public @ResponseBody String login() {
		System.out.println(" *** MainRestController.message");
		return "{\"token\":123456789}";
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.POST, produces="application/json")
	public @ResponseBody String logout() {
		System.out.println(" *** MainRestController.logout");
		System.out.println(tokenManagerSingle.getValidUsers());
		tokenManagerSingle.clearAll();
		SecurityContextHolder.getContext().setAuthentication(null);
		return "{\"token\":null}";
	}
}
