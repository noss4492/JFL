package kr.co.jhta.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import kr.co.jhta.service.MemberService;
import lombok.Setter;

public class LogoutSuccessHandler implements AuthenticationSuccessHandler {
	private String defaultUrl; // redirect stratgy를 세워 보낼 url을 결정할 수 있다.
	private String filedir;
	private String filename;
	private String userDevice; // spring mobile device module을 pom에 추가해서 쓰면 되는데 시간없으므로 패스함
	private String userIP;
	private String loginUsername;
	
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
		
//		session.setAttribute("userId", udtoX.getUserId()); 안되네요 안되는 이유가 있을텐데

		response.sendRedirect("/jhtaLibrary/");
	}


}
