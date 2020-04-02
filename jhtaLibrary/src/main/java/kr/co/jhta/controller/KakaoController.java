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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.jhta.util.kakaoRestApi;

@Controller
public class KakaoController {

	private final static String K_CLIENT_ID = "788b6c819d4b6c6e2e83afa567cfd156";
	private final static String K_REDIRECT_URI = "/kakakoOAuth";

	@RequestMapping(value = "/kakaoLogin")
	public String kakaologinpage() {
		System.out.println("[카카오로그인] 끼아앙앙아ㅏ아아아아앙ㅇ아ㅏ아ㅏ");
		return "test_kakao_login";
	}

	@RequestMapping(value = "/kakaoLogout", produces = "application/json")
	public String Logout(HttpSession session) {
		// kakao restapi 객체 선언
		kakaoRestApi kra = new kakaoRestApi();
		// 노드에 로그아웃한 결과값음 담아줌 매개변수는 세션에 잇는 token을 가져와 문자열로 변환
		JsonNode node = Logout(session.getAttribute("token").toString());
		// 결과 값 출력
		System.out.println("로그인 후 반환되는 아이디 : " + node.get("id"));
		return "redirect:/";
	}

	@RequestMapping(value = "/kakaoOauth", produces = "application/json")
	public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) {

		// 해당 유저에 대해 발급한 authorize code를 사용하여 인증서버에서 받아온 access token 정보를 node에 담는다.
		kakaoRestApi kra = new kakaoRestApi();
		JsonNode accessTokenNode = getAccessToken(code);
		String accessToken = accessTokenNode.get("access_token").toString();

		JsonNode userinfoNode = getKakaoUserInfo(accessToken);

		String id = userinfoNode.get("id").asText();
		String nickname = userinfoNode.get("properties").get("nickname").asText();
		String email = userinfoNode.get("kakao_account").get("email").asText();

		System.out.println("id : " + id);
		System.out.println("nickname : " + nickname);
		System.out.println("email : " + email);

		model.addAttribute("id", id);
		model.addAttribute("email", email);
		model.addAttribute("nickname", nickname);
		model.addAttribute("authorizeCode", code);

		return "test_kakao_loginfo";
	}

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
 
        return returnNode;
    }
	

}