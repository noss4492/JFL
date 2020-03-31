package kr.co.jhta.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ApplicationController {

	
	@RequestMapping(value ="/readingRoom" , method = RequestMethod.GET)
	public String readingRoom() {
		
		
		
		return "/readingRoom";
	}
}
