<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커스텀 로그인 페이지</title>
</head>
<%-- ${sessionScope.kakaoRedirectFlag == null} --%>
<body>
	<h1>시큐리티 로그인</h1>
	<h2>
		이 경로는 무조건 고정이어야만함. 여기 경로로 보냄
		<c:url value="/login" />
	</h2>

	<h2>
		<c:out value="${error}" />
	</h2>
	<h2>
		<c:out value="${logout}" />
	</h2>
	
	in-memory
	<br>
	admin/1234/$2a$10$uAg4YEdYpinoyaur2SZ0eekqhmf8RE44cwaDxMl.F1JHtIkNy5RTG
	<br> jdbc-auth
	<br>
	guest9/1234/$2a$10$vmCTa5xC/OhbXM8XcyDXyu76G0yFj2mRFqUP.7/Zt1OR8wBUfABau
	<br> 카카오 유저 로그인 경우가 아닌 경우 그냥 값을 입력하게 만듬
	<form action='<c:url value="/login" />' method="post">
		<!-- 이게 로그인페이지 주소가 무조건 고정되어 있다고? -->
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="username" value="admin" id="" /></td>
			</tr>
			<tr>
				<th>password</th>
				<td><input type="text" name="password" value="1234" id="" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" name="로그인" id="" /> <input
					type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /></td>
			</tr>
		</table>
	</form>
<!-- c:remove var="kakaoRedirectFlag" scope="session" -->
	<!-- case : sessionScope.kakaoRedirectFlag == "true" -->
	<!--이거 대신 js로 보냄 response.sendRedirect("/jhta/login");-->
</body>
</html>