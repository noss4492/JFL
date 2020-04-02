<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인인포</title>
</head>
<body>
    <!-- 세션에서 token을 가져와서 출력한다. 이것이 있으면 카카오로 로그인한 사용자임을 알 수 있음. if문 조건에 이거를 거는 것이 좋아보임-->
    session에 담긴 token값 : ${sessionScope.token} <br>
    session scope : ${sessionScope } <br>
<%--     ${k_userInfo}<br>
    ${id}<br>
    ${email}<br>
    ${nickname}<br>
    ${image}<br>
 --%>
    
</body>
</html>