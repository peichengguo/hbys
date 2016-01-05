package com.hbys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {

	@RequestMapping("to_header")
	public String toHeader(){
		
		return "header";
	}
	
}
