package kr.co.jhta.controller;

import java.security.Principal;
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
	
	@RequestMapping("/showPrincipal")
	public String show(Principal principal, Model model) {
		System.out.println(">>>> info of principal : "+principal); 
//		return "redirect:"+principal;
		model.addAttribute("principal", principal);
		System.out.println("아 좀 빨리 바뀌지 그래 ㅡㅡ");
		return "securityLogin/principal";
	}
	
	@RequestMapping(value="/signUp", method = RequestMethod.GET)
	public String signUpForm() {
		System.out.println("가입폼으로왔고");
		return "/securityLogin/test-signUpMember";
	}

	@RequestMapping(value="/signUp", method = RequestMethod.POST)
	public String signUpUser(@ModelAttribute UserDTO dto) {
		System.out.println("디비에올리면되는데1");
		dto.setPassword(this.bcryptPasswordEncoder.encode(dto.getPassword()));
		ms.wrtieOneMember(dto);
//		return "/";
		System.out.println("디비에올리면되는데");
		return "redirect:/home";
	}
	
	
	@RequestMapping(value="/securityLogin/login")
	public String sli() {
		return "/securityLogin/login";
	}
	@RequestMapping(value="/securityLogin/logout")
	public String slo() {
		return "/securityLogin/logout";
	}
	
	@RequestMapping(value="/login")
	public void login(String error, String logout, Model model) {//@RequestParam HashMap map
		if(error != null)
			model.addAttribute("error", "log : error");
		else if(logout != null)
			model.addAttribute("logout", "log : logout");
		System.out.println("왜왜왜애ㅗ애ㅗ애ㅐ");
//		System.out.println("username : "+map.get("username")+" password : "+map.get("password"));
//		System.out.println("err/logout : "+error+"/"+logout);
	}
	
	@RequestMapping(value="/logout")
	public void logoutGet() {
		logger.info("logout");
	}
}
