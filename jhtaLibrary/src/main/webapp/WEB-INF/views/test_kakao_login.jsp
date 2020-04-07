<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 배포한 후에는 이것을 쓰시오
<a href = 
"https://kauth.kakao.com/oauth/authorize?client_id=788b6c819d4b6c6e2e83afa567cfd156&redirect_uri=http://ec2-54-180-124-92.ap-northeast-2.compute.amazonaws.com:8080/jhtaLibrary/kakaoOauth&response_type=code">
 -->
 <a href = "https://kauth.kakao.com/oauth/authorize?
			client_id=788b6c819d4b6c6e2e83afa567cfd156&
			redirect_uri=http://localhost:8080/jhta/kakaoOauth&
			response_type=code">
        카카오톡으로 로그인
</a>
</body>
</html>