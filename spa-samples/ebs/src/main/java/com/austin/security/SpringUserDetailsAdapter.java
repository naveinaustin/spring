package com.austin.security;

import java.util.ArrayList;
import java.util.List;

public class SpringUserDetailsAdapter {
	public SpringUserDetailsAdapter(String userName) {
		
	}
	
	public List getAuthorities() {
		return new ArrayList();
	}
}
