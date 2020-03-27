package kr.co.jhta.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jhta.dto.UserDTO;
import kr.co.jhta.service.ArticleService;
import kr.co.jhta.service.MemberService;
import lombok.Setter;

@Controller
public class CommonController {
	// JdbcUserDetailsManager judm;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Setter(onMethod=@__({@Autowired}))
	MemberService ms;
	
	@RequestMapping(value="/signUp", method = RequestMethod.GET)
	public String signUpForm() {
		return "common/signUpMember";
	}
	
	@RequestMapping(value="/signUp", method = RequestMethod.POST)
	public String signUpUser(@ModelAttribute UserDTO dto) {
		dto.setPassword(this.bcryptPasswordEncoder.encode(dto.getPassword()));
		ms.wrtieOneMember(dto);
		return "redirect:/home";
	}
	
	@RequestMapping(value="/common/login")
	public void login(String error, String logout, Model model) {//@RequestParam HashMap map
		if(error != null)
			model.addAttribute("error", "log : error");
		else if(logout != null)
			model.addAttribute("logout", "log : logout");
//		System.out.println("username : "+map.get("username")+" password : "+map.get("password"));
//		System.out.println("err/logout : "+error+"/"+logout);
	}
	
	@RequestMapping(value="/common/logout")
	public void logoutGet() {
		logger.info("logout");
	}
}
