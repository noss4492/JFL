package kr.co.jhta.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import kr.co.jhta.service.MemberService;
import kr.co.jhta.dto.UserDTO;
import kr.co.jhta.service.MemberServiceImpl;
import lombok.Setter;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Setter(onMethod=@__({@Autowired}))
	MemberService ms2;

	// 인터페이스로 DI 해서 쓰는게 더 좋을거 같은디요....
	@Setter(onMethod=@__({@Autowired}))
	MemberServiceImpl memberServiceImple;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value ="/" , method = RequestMethod.GET)
	public String main(Principal principal, Model model, HttpSession session) {
		if(principal!=null) {
			System.out.println("메인페이지로 왔는데 어쨋든 유저 정보가 있다면");
			System.out.println("userId를 가져온다.");
			UserDTO dto = memberServiceImple.readOneMemberByName(principal.getName());
			model.addAttribute("username", dto.getName());
			model.addAttribute("userno", dto.getUserId());
			session.setAttribute("userId", dto.getUserId());
			System.out.println("다음 뷰단에 전달 가능 username : "+dto.getName());
			System.out.println("다음 뷰단에 전달 가능 userno : "+dto.getUserId());
			System.out.println("세션에 유저 번호를 등록함 >>userId :"+dto.getUserId());
		}
		return "main";
	}
		@RequestMapping(value ="/main2" , method = RequestMethod.GET)
		public String main2(Principal principal, Model model) {
			if(principal!=null) {
				UserDTO dto = memberServiceImple.readOneMemberByName(principal.getName());
				model.addAttribute("username", dto.getName());
				model.addAttribute("userno", dto.getUserId());
			}
			return "main2";
		
	}
	@RequestMapping(value ="/content/loginForm" , method = RequestMethod.GET)
	public String loginForm(Model model) {
			model.addAttribute("content","");
		return "loginForm";
	}
	@RequestMapping(value ="/content" , method = RequestMethod.GET)
	public String content(Model model) {
			model.addAttribute("content","/loginForm");
		return "contentCore";
	}
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Principal principal) {
//		logger.info("Welcome home! The client locale is {}.", locale);
		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
//		String formattedDate = dateFormat.format(date);
		
//		model.addAttribute("serverTime", formattedDate );
		
//		model.addAttribute("principal", principal );
//		
//		System.out.println("getName : "+principal.getName());
//		ms2.readOneMember((String)principal.getName());
		
		//, Principal principal, Authentication authentication
//		Object principalX = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
//		UserDetails userDetails = (UserDetails)principalX; 
//		String username = userDetails.getUsername(); 
//		String password = userDetails.getPassword();

//		String pName = principal.getName();
//		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
//		model.addAttribute("pName", pName );
//		model.addAttribute("uDetail", userDetails );

//		String pName = principal.getName();
//		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
//		System.out.println(pName+"|");
		model.addAttribute("principal", principal);
		return "home";
	}
	
//	준영 start
	@RequestMapping(value ="/header" , method = RequestMethod.GET)
	public String header() {
		return "header";
	}
	@RequestMapping(value ="/header2" , method = RequestMethod.GET)
	public String header2() {
		return "header2";
	}
	@RequestMapping(value ="/facilityRentForm1" , method = RequestMethod.GET)
	public String facilityRentForm1(Model model) {
		  model.addAttribute("category", "신청서비스");
	      model.addAttribute("title", "시설대관신청");
	      model.addAttribute("menu", "대관안내");

		return "libApplicationService/facilityRentForm/facilityRentForm1";
	}
	@RequestMapping(value ="/facilityRentForm2" , method = RequestMethod.GET)
	public String facilityRentForm2(Model model) {
		model.addAttribute("category", "신청서비스");
	      model.addAttribute("title", "시설대관신청");
	      model.addAttribute("menu", "시설안내");
		return "/libApplicationService/facilityRentForm/facilityRentForm2";
	}
	@RequestMapping(value ="/facilityRentForm3" , method = RequestMethod.GET)
	public String facilityRentForm3(Model model) {
			model.addAttribute("category", "신청서비스");
	      model.addAttribute("title", "시설대관신청");
	      model.addAttribute("menu", "신청현황/신청하기");
		return "/libApplicationService/facilityRentForm/facilityRentForm3";
	}
	@RequestMapping(value ="/tourApplication1" , method = RequestMethod.GET)
	public String tourApplication1(Model model) {
			model.addAttribute("category", "신청서비스");
	      model.addAttribute("title", "도서관견학신청");
	      model.addAttribute("menu", "신청안내");
		return "/libApplicationService/tourApplication/tourApplication1";
	}
	@RequestMapping(value ="/tourApplication2" , method = RequestMethod.GET)
	public String tourApplication2(Model model) {
		model.addAttribute("category", "신청서비스");
	      model.addAttribute("title", "도서관견학신청");
	      model.addAttribute("menu", "신청현황/신청하기");
		return "/libApplicationService/tourApplication/tourApplication2";
	}
	@RequestMapping(value ="/volunteerApplication1" , method = RequestMethod.GET)
	public String volunteerApplication() {
		return "/libApplicationService/volunteerApplication/volunteerApplication1";
	}
	@RequestMapping(value ="/basicForm" , method = RequestMethod.GET)
	public String basicForm() {
		return "/basicForm";
	}
	
//	준영 end
}
