package kr.co.jhta.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.jhta.dto.UserDTO;
import kr.co.jhta.service.MemberService;
import kr.co.jhta.util.kakaoRestApi;
import lombok.Setter;

@Controller
public class KakaoController {

	private final static String K_CLIENT_ID = "788b6c819d4b6c6e2e83afa567cfd156";
	private final static String K_REDIRECT_URI = "/kakakoOAuth";
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Setter(onMethod=@__({@Autowired}))
	MemberService ms;
	
	@RequestMapping(value = "/kakaoLogin")
	public String kakaologinpage() {
		System.out.println("[카카오로그인]");
		return "test_kakao_login";
	}

	
// Authorize code가 각 유저마다 고유하게 소유될 것이라 생각했으나 이는 잘못된 생각이었다.
// kakao logout api로 요청을 보내면 각 유저의 인증 코드가 소멸되며 재갱신된다. 따라서 이 인증코드를 비밀번호로 쓰기에는 무리가 있다.
// 그나마 추적이 되지 않는 유저 id값을 복호화하여 pw값으로 가지고 있게 해야겠다.
	@RequestMapping(value = "/kakaoLogout", produces = "application/json")
	public String Logout(HttpSession session) {
		// 노드에 로그아웃한 결과값음 담아줌 매개변수는 세션에 잇는 token을 가져와 문자열로 변환
		JsonNode node = Logout((String)session.getAttribute("accessToken"));
		// 결과 값 출력
		System.out.println("로그아웃 후 반환되는 아이디 : " + node.get("id"));
		session.removeAttribute("accessToken");
		return "redirect:/";
	}

	@RequestMapping(value = "/kakaoOauth", produces = "application/json")
	public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) {
		System.out.println(session);
		System.out.println("-----");
		// 회원가입을 위해 정보를 담기 위한 객체
		UserDTO udto = new UserDTO();
		
		// 해당 유저에 대해 발급한 authorize code를 사용하여 인증서버에서 받아온 access token 정보를 node에 담는다.
		JsonNode accessTokenNode = getAccessToken(code);
		String accessToken = accessTokenNode.get("access_token").toString();

		JsonNode userinfoNode = getKakaoUserInfo(accessToken);
		
		
		String id = userinfoNode.get("id").asText();
		String nickname = userinfoNode.get("properties").get("nickname").asText();
		String email = userinfoNode.get("kakao_account").get("email").asText();
		
		String modId = String.valueOf(Long.parseLong(id)%13121);
		
		
		//그냥 출력
		System.out.println("id : " + id);
		System.out.println("modId : " + modId);
		System.out.println("nickname : " + nickname);
		System.out.println("email : " + email);
		System.out.println("authorize code : " + code);

		//session.setAttribute("accessToken", accessToken);
		// 이 정보들을 가지고 유저 등록(accessTocken, code는 계속 재갱신 되기 때문에 배제하였음. id, email, nickname만 등록)
		
		// 카카오 유저의 경우에는 nickname+id값으로 가입하게 하자.
		// 만약 해당 닉네임으로 가입된 유저 아이디가 있다면 이미 가입된 것으로 간주하여 로그인 시켜줌
		// 없다면 디비에 등록후 로그인 시켜줌
		
		System.out.println("만들어질 아이디명 : "+(nickname+modId));
		System.out.println();
		
		// 해당 아이디 규칙으로 가입한 사람이 있다면 이미 가입해있다고 간주하여 그냥 로그인을 시켜주자
		UserDTO userDtoOnDB = ms.readOneMember(nickname+modId);
		
		// login form에서 우리가 쓸 때의 정보들
		String newUserId = nickname+modId;
		udto.setUsername(newUserId);
		udto.setPassword(modId);

		// 있다면 바로 회원가입 과정이 필요 없다. 로그인 시켜버리자
		if(userDtoOnDB!=null) {
			
		// 아직 가입하지 않았었더라면 우리 디비 회원에 맞는 규칙으로 회원가입 시켜준다.
		}else {
			// form가서 다시 저쪽 넘겨주는 컨트롤러에서 encode 해줌
			udto.setPassword(this.bcryptPasswordEncoder.encode(modId));
			udto.setEmail(email);
			udto.setNickname(nickname);
			udto.setPlatformStatus((byte)2);
			udto.setRightStatus((byte)1);
			udto.setGradeStatus((byte)2);
			ms.wrtieOneMember(udto);	
		}
		
		// session.setAttribute("kakaoRedirectFlag", "true");
		// 유저 정보를 기입 후 넘겨주어 login view로 넘겨서  로그인 할 수 있도록 함.
		model.addAttribute("udto", udto);
		System.out.println("[kakaocontroller] udto : "+udto.getUsername());
		return "/securityLogin/kakaoLoginRedirect";
	}
	
	@RequestMapping("/securityLogin/kakaoLoginRedirect")
	public String kakaoLoginRedirectToSpringSecurity() {
		System.out.println("자동으로 등록해주러 감");
		return "/securityLogin/kakaoLoginRedirect";
	}
	
	
	
//			return "/securityLogin/login";
	//return "test_kakao_loginfo";
//		if(!=null) {}
		
		
		// 회원가입

		
		//udto.setNickname(nickname);
		//System.out.println("code : "+code);
		
		// 이미 가입된 유저라면 바로 회원가입 ㄱㄱ
		
		
		
////////////////////////////////////////////////////////////////////////////////////////////////
// 이렇게 하면 될 것이라 예상합니다. 일단 막아둠	
//		ms.wrtieOneMember(udto);
////////////////////////////////////////////////////////////////////////////////////////////////
		


	public JsonNode getKakaoUserInfo(String accessToken) {

		final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		JsonNode returnNode = null;
		
		post.addHeader("Authorization", "Bearer " + accessToken);

		try {

			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();
			System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
			System.out.println("Response Code : " + responseCode);

			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// clear resources
		}
		return returnNode;
	}
	
	
	
	
	public JsonNode getAccessToken(String autorize_code) {

		final String RequestUrl = "https://kauth.kakao.com/oauth/token";
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();

		// 포스트 파라미터의 grant_type이라는 명칭에 authorization_code를 추가한다 아래도 동일
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id", "788b6c819d4b6c6e2e83afa567cfd156"));
		
// 배포한 후에는 이것을 쓰시오
//		postParams.add(new BasicNameValuePair("redirect_uri", "http://ec2-54-180-124-92.ap-northeast-2.compute.amazonaws.com:8080/jhtaLibrary/kakaoOauth")); 
		postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8080/jhta/kakaoOauth")); 
		postParams.add(new BasicNameValuePair("code", autorize_code));
		
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);

		JsonNode returnNode = null;

		try {

			post.setEntity(new UrlEncodedFormEntity(postParams));

			final HttpResponse response = client.execute(post);

			ObjectMapper mapper = new ObjectMapper();

			returnNode = mapper.readTree(response.getEntity().getContent());
			System.out.println("returnNode"+ returnNode);

		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();

		} catch (ClientProtocolException e) {

			e.printStackTrace();

		} catch (IOException e) {

			e.printStackTrace();

		} finally { 
			
		}
		return returnNode;
	}
	
	/*
	public String getAuthorizationUrl(HttpSession session) {

	    String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?"
+ "client_id=" + K_CLIENT_ID + "&redirect_uri="
+ K_REDIRECT_URI + "&response_type=code";
    return kakaoUrl;
	}*/

	
	public JsonNode Logout(String autorize_code) {
		
        final String RequestUrl = "https://kapi.kakao.com/v1/user/logout";
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);
        JsonNode returnNode = null;
 
        post.addHeader("Authorization", "Bearer " + autorize_code);
  
        try {
            final HttpResponse response = client.execute(post);
            ObjectMapper mapper = new ObjectMapper();
            returnNode = mapper.readTree(response.getEntity().getContent());
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }
        System.out.println("::::"+returnNode.asText());
        return returnNode;
    }
	

}