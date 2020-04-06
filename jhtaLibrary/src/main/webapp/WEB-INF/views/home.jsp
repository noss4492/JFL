<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
	<title>Home</title>
<%-- <link rel="stylesheet" type="text/css" href="<c:url value="css/lib/xeicon.min.css"/>" > --%>
</head>
<body>
<h1>home.jsp 테스트중</h1>

<P>  The time on the server is ${serverTime}. </P><br><br>
자원 끌어다 써보기<br><br>
리소스 경로 예시(img) : <c:url value="/resources/img/headerLogo.png"/><br><br>
test1 : <img src = "<c:url value="/resources/img/headerLogo.png"/>" /><br><br>
test2 : <img src="resources/img/headerLogo.png"/>
<!-- link test <i class="xi-face xi-5x"></i> xi-5x -->

<sec:authorize access="isAuthenticated()"><!-- 인증된 사용자들, role_ 있으면 ok -->
${principal}
<h1>로그인중</h1><br>

</sec:authorize>

login/logout 빼고는 아래 주소와 연결 시켜야함. <br><br>
<a href="./signUp">goto signUp form</a><br><br>
<a href="<c:url value="/kakaoLogin"/>">카카오로 로그인</a><br><br>
<a href="<c:url value="/securityLogin/login"/>">로그인주소 : contextpath<c:url value="/login"/> </a><br><br>
<a href="<c:url value="/securityLogin/logout"/>">로그아웃 버튼 누르러 가기</a><br><br>

<form action="<c:url value="/securityLogin/logout" />" method="post">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
	<input type="submit" value="바로 로그아웃" />
</form>

<br><a href="<c:url value="/showPrincipal"/>">유저개인정보</a><br><br>

principal: ${principal}<br><br><br>
csrf param : ${_csrf.token}<br><br>


<%-- <sec:authorize access=""></sec:authorize> --%>
<%--  <p> principal : <sec:authentication property="principal" /> </p>
<p> 어드민인지 확인 : <sec:authentication property="principal.authorities"/></p> --%>
</body>
</html>
