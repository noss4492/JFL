package kr.co.jhta.security;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import kr.co.jhta.dto.UserDTO;
import kr.co.jhta.service.MemberService;
import lombok.Setter;

// 로그인이 성공하고나서 바로 직후의 시점에 동작할 것들을 이곳에 작성.
// kakaoLogin User의 경우에는 디비에서의 조건 판별 필요. (이미 있는 유저인지 없는 유저인지)
// 일반 유저의 경우 로그인 하면 user_m_id의 값을 다른 컨트롤러와 매퍼에서 사용하기 편하도록 session에 userId로 추가해두자.
// 사실 테이블을 user_m_id를 그냥 uk로 두거나 user_m_id와 username을 둘 다 pk로 써서 테이블 설계를 했어야한다.
public class LoginSuccessHandler implements AuthenticationSuccessHandler{
	private String defaultUrl; // redirect stratgy를 세워 보낼 url을 결정할 수 있다.
	private String filedir;
	private String filename;
	private String userDevice; // spring mobile device module을 pom에 추가해서 쓰면 되는데 시간없으므로 패스함
	private String userIP;
	private String loginUsername;
	
	//private RedirectStrategy rs = new DefaultRedirectStrategy();
	@Setter(onMethod=@__({@Autowired}))
	MemberService ms;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		System.out.println("로그인 성공 후 부가 작업");
		
		HttpSession session = request.getSession(false);
		if(session == null) {
			return;
		}
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
		User user = (User) auth.getPrincipal();
		String username = user.getUsername();

		System.out.println("로그인시 성공직후 바로 받아온 유저 이름 : "+username);
		System.out.println("위 유저 이름으로 검색하여 나온 user_m_id(pk, seq)값을 세션에 등록함");
		
//		session.setAttribute("userId", ms.readOneMember(username).getUserId());
		UserDTO udtoX =  ms.readOneMember(username);
		System.out.println("이거 왜 안잡혀? 아 아직 readOneMemberByName이 없구나 "+udtoX);
		System.out.println("userId : "+udtoX.getUserId());
		System.out.println("session에 userId를 저장 :"+udtoX.getUserId());	
		session.setAttribute("userId", udtoX.getUserId());

		response.sendRedirect("/jhta/main");
	}
}


//		Principal principal = (Principal) prin;
//		principal.getName();
		
//		System.out.println("로그인석세스 핸들러 : "+principal.getName());
		
		
		// session.setAttribute("kakaoAuthFlag", "true");
		
		/*
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
		뭔가 더 있어보이는데 시간이 없으므로 지나가겠음
		*/
		
//		userIP = request.getRemoteAddr();
//		System.out.println("success user ip : "+userIP);
		
