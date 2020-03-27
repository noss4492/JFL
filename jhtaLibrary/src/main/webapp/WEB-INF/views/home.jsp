<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<a href="./signUp">goto signUp form</a>
<a href='./common/login'>로그인</a>
<a href='./common/logout'>로그아웃</a>
principal: ${principal }<br>
<%--  <p> principal : <sec:authentication property="principal" /> </p>
<p> 어드민인지 확인 : <sec:authentication property="principal.authorities"/></p> --%>
<c:url value="/common/login" /><br>
<c:url value="/common/logout" /><br>
${_csrf.parameterName}<br>
	<sec:authorize access="isAuthenticated()">
		로그인중<br>
		<a href="<c:url value="/common/logout" />">로그아웃</a>
	</sec:authorize>
	<sec:authorize access=""></sec:authorize>t
	<c:url value="/common/logout" />
</body>
</html>
