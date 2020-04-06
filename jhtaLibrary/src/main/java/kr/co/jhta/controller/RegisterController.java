package kr.co.jhta.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jhta.dto.UserDTO;
import kr.co.jhta.service.MemberService;
import lombok.Setter;

@Controller
public class RegisterController {
	String dicetemp;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@Setter(onMethod = @__({ @Autowired }))
	MemberService ms;

	@RequestMapping(value = { "/register1" }, method = RequestMethod.GET)
	public String register1(Model model) {
	      model.addAttribute("category", "회원정보");
//	      model.addAttribute("title", "로그인");
	      model.addAttribute("menu", "회원가입");
		return "/securityLogin/registerMemberForm/register1";

	}

	@RequestMapping(value = { "/register2" }, method = RequestMethod.GET)
	public String register2(Model model) {
		
	      model.addAttribute("category", "회원정보");
//	      model.addAttribute("title", "로그인");
	      model.addAttribute("menu", "회원가입");

		return "/securityLogin/registerMemberForm/register2";

	}

	@RequestMapping(value = { "/register3" }, method = RequestMethod.GET)
	public String register3(Model model) {
		System.out.println("들어갑니다");
	      model.addAttribute("category", "회원정보");
//	      model.addAttribute("title", "로그인");
	      model.addAttribute("menu", "회원가입");
		return "/securityLogin/registerMemberForm/register3";

		
	}

	
//	@RequestMapping(value="/registerOk", method = RequestMethod.POST)
//	public String registerOk(@ModelAttribute UserDTO dto) {
//		System.out.println("들어갑니다2");
//		dto.setPassword(this.bcryptPasswordEncoder.encode(dto.getPassword()));
//		ms.wrtieOneMember(dto);
//		return "/";
//	}
	@RequestMapping(value = "/registerOk", method = RequestMethod.POST)
	public String registerOk(@ModelAttribute UserDTO dto, HttpServletRequest request,
			HttpServletResponse response_equals) {
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr3 = request.getParameter("addr3");
		String address = addr1 + "," + addr2 + "," + addr3;
		System.out.println("합친 주소" + address);
		System.out.println("ageGroup :" + dto.getAgeGroup());

		System.out.println("생년월일(자르기 전) :" + dto.getBirth());

		System.out.println("이메일 :" + dto.getEmail());

		System.out.println("성별 : " + dto.getGender());

		System.out.println("회원등급 :" + dto.getGradeStatus());

		System.out.println("이름 :" + dto.getName());

		System.out.println("닉네임 :" + dto.getNickname());

		System.out.println("비밀번호(인코딩 전) : " + dto.getPassword());

		System.out.println("플랫폼 :" + dto.getPlatformStatus());

		System.out.println("가입일 :" + dto.getRegisterDate());

		System.out.println("사용가능등급 :" + dto.getRightStatus());

		System.out.println("회원번호 :" + dto.getUserId());

		System.out.println("아이디 :" + dto.getUsername());

//		System.out.println("주소 : " +dto.getAddress());

		dto.setBirth(dto.getBirth().replace("/", ""));
		dto.setAddress(address);
		System.out.println("생년월일(자른 후) :" + dto.getBirth());
		dto.setPassword(this.bcryptPasswordEncoder.encode(dto.getPassword()));
		System.out.println("비밀번호(인코딩 후) : " + dto.getPassword());
		ms.wrtieOneMember(dto);
		return "/securityLogin/login";
	}

//	 아이디 중복 체크

	@RequestMapping("idCheck.do")
	@ResponseBody
	public String idCheck(@RequestBody String username) {
		String checkRst;
		System.out.println("체크컨트롤러왔음");
		int idCnt = ms.idChk(username);
		if (idCnt > 0)
			checkRst = "F";
		else
			checkRst = "S";
		return checkRst;
	}

//	//----------------------------------메일 인증----------------------------

	@Inject // 서비스를 호출하기 위해 의존성을 주입
	JavaMailSender mailSender; // 메일 서비스를 사용하기 위해 의존성을 주입함.
//	MemberService memberservice; //서비스를 호출하기 위해 의존성을 주입

	// 로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);
	private static final String String = null;

	// mailSending 코드
	@RequestMapping(value = "/auth.do", method = RequestMethod.POST)
	public ModelAndView mailSending(HttpServletRequest request, String e_mail, HttpServletResponse response_email,
			String email, Model model, HttpSession session) throws IOException {

		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)
		dicetemp = Integer.toString(dice);

		String regExp = "[a-zA-Z0-9.%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z] {2,6}$";
		String em1 = request.getParameter("em1");
		String em2 = request.getParameter("em2");
		String tomail = em1 + "@" + em2; // 받는 사람 이메일
		
		
		
		if(tomail.matches(regExp)) {
		
			System.out.println("맞음");
		}else {
			System.out.println("안맞음");
		}
		
		
		
		System.out.println(tomail);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/securityLogin/registerMemberForm/register1");

		String checkRst;
		System.out.println("이메일 체크");
		int mailCnt = ms.mailChk(tomail);
		if (mailCnt > 0) {
			System.out.println("메일있음");
			String sendKey = "가입된 이메일 주소입니다.";
			request.setAttribute("sendKey", sendKey);
		
//			return mv;
		} else {
			System.out.println("메일없음");
			ModelAndView mv2 = new ModelAndView();

//			mv2.setViewName("/securityLogin/registerMemberForm/auth.do");

			session.setAttribute("tomail", tomail);
			session.setAttribute("em1", em1);
			session.setAttribute("em2", em2);

			String setfrom = "jhta4@nn.com";

			String title = "회원가입 인증 이메일 입니다."; // 제목
			String content =

					System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성

							System.getProperty("line.separator") +

							"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"

							+ System.getProperty("line.separator") +

							System.getProperty("line.separator") +

							" 인증번호는 " + dice + " 입니다. "

							+ System.getProperty("line.separator") +

							System.getProperty("line.separator") +

							"받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용
				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e);
			}

			ModelAndView mv3 = new ModelAndView(); // ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
			mv3.setViewName("/securityLogin/registerMemberForm/register1"); // 뷰의이름
			mv3.addObject("dice", dice);
			System.out.println(e_mail);
			System.out.println(tomail);
			System.out.println("mv3 : " + mv3);

			model.addAttribute(em1, em1);
			model.addAttribute(em2, em2);

			response_email.setContentType("text/html; charset=UTF-8");
			PrintWriter out_email = response_email.getWriter();
			String sendKey = "이메일이 발송되었습니다. 인증번호를 입력해주세요.";
			request.setAttribute("sendKey", sendKey);

			out_email.flush();

			return mv3;
		}
		return mv;

	}
//        }

	// 이메일 인증 페이지 맵핑 메소드
	@RequestMapping("/register1.do")
	public String redirect() {
		return "redirect:/securityLogin/registerMemberForm/register1";
	}

	// 이메일 인증 페이지 맵핑 메소드
	@RequestMapping("/securityLogin/registerMemberForm/register1")
	public String email() {
		return "/securityLogin/registerMemberForm/register1";
	}

	// 이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
	// 내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
	// 틀리면 다시 원래 페이지로 돌아오는 메소드
	@RequestMapping(value = "/join_injeung.do", method = RequestMethod.POST)
	public ModelAndView join_injeung(HttpServletRequest request, HttpServletResponse response_equals)
			throws IOException {
		String dice = dicetemp;

		String email_injeung = request.getParameter("email_injeung");
		System.out.println(dice);
		System.out.println("마지막 : email_injeung : " + email_injeung);

		System.out.println("마지막 : dice : " + dice);

		// 페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음

		ModelAndView mv = new ModelAndView();

		mv.setViewName("/securityLogin/registerMemberForm/register2");

		mv.addObject("e_mail", email_injeung);

		if (email_injeung.equals(dice)) {

			// 인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함

//            mv.setViewName("register2"); //석근씨가 빼라함

			mv.addObject("e_mail", email_injeung);

			// 만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
			// 한번더 입력할 필요가 없게 한다.

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();

			out_equals.flush();

			return mv;

		} else if (email_injeung != dice) {

			ModelAndView mv2 = new ModelAndView();
			mv2.setViewName("/securityLogin/registerMemberForm/register1");
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			String keych = "일치하지 않습니다. 다시 확인해주세요";
			request.setAttribute("keych", keych);
//            out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.');</script>");
			out_equals.flush();

			return mv2;

		}
		return mv;

	}

}
