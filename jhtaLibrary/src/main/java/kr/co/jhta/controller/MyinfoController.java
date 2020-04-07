package kr.co.jhta.controller;


import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;


	@Setter(onMethod = @__({ @Autowired }))
	MemberService ms;

	@RequestMapping(value = { "/mypage" }, method = RequestMethod.GET)
	public String mypage(Model model, Principal principal) {
		UserDTO dto = memberServiceImple.readOneMemberByName(principal.getName());
		model.addAttribute("dto", dto);

		ModelAndView mv = new ModelAndView();
		model.addAttribute("category", "회원정보");
		model.addAttribute("menu", "내정보");		
		return "/mypage";

	}	
	
	@RequestMapping(value = { "/infochange" }, method = RequestMethod.GET)
	public String infochange(Model model, Principal principal) {
		UserDTO dto = memberServiceImple.readOneMemberByName(principal.getName());
		model.addAttribute("dto", dto);
		ModelAndView mv = new ModelAndView();
		model.addAttribute("category", "회원정보");
		model.addAttribute("menu", "정보변경");		
		return "/infochange";

	}	
	
	@RequestMapping(value="/changeOk", method = RequestMethod.POST)
	public String changeOk(@ModelAttribute UserDTO dto, HttpServletRequest request,
			HttpServletResponse response_equals) {
		String addr1 = request.getParameter("add1");
		String addr2 = request.getParameter("add1");
		String addr3 = request.getParameter("add1");
		String address = addr1 + "," + addr2 +","+addr3;
		
		
//		dto.setBirth(dto.getBirth().replace("/", ""));
		dto.setAddress(address);
		System.out.println("생년월일(자른 후) :" + dto.getBirth());
		dto.setPassword(this.bcryptPasswordEncoder.encode(dto.getPassword()));
		System.out.println("비밀번호(인코딩 후) : " + dto.getPassword());
		ms.changeOneMember(dto);
		return "/main";
	}
}
