package kr.co.jhta.controller;


import java.security.Principal;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

import kr.co.jhta.dto.UserDTO;
import kr.co.jhta.service.MemberService;
import kr.co.jhta.service.MemberServiceImpl;
import lombok.Setter;

@Controller
public class MyinfoController {
	String dicetemp;
	
	// 인터페이스로 DI 해서 쓰는게 더 좋을거 같은디요....
	@Setter(onMethod=@__({@Autowired}))
	MemberServiceImpl memberServiceImple;
	

	@Setter(onMethod = @__({ @Autowired }))
	MemberService ms;

	@RequestMapping(value = { "/mypage" }, method = RequestMethod.GET)
	public String mypage(Model model, Principal principal) {
		UserDTO dto = memberServiceImple.readOneMember(principal.getName());
		model.addAttribute("dto", dto);
//		System.out.println("getname : " +principal.getName());
//		System.out.println("dto : "+  dto);
		ModelAndView mv = new ModelAndView();
		model.addAttribute("category", "회원정보");
		model.addAttribute("menu", "내정보");		
		return "/mypage";

	}	
	@RequestMapping(value = { "/infochange" }, method = RequestMethod.GET)
	public String infochange(Model model, Principal principal) {
		UserDTO dto = memberServiceImple.readOneMember(principal.getName());
		model.addAttribute("dto", dto);
//		System.out.println("getname : " +principal.getName());
//		System.out.println("dto : "+  dto);
		ModelAndView mv = new ModelAndView();
		model.addAttribute("category", "회원정보");
		model.addAttribute("menu", "정보변경");		
		return "/infochange";

	}	


}
