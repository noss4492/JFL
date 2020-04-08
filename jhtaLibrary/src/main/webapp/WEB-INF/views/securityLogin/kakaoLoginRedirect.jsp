<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="hideOnRedirecting">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.hideOnRedirecting{
		display:none;
	}
</style>
<body>
<script type="text/javascript">
	function calls() {
		document.submitKakaoLogin.submit();
	}
</script>
        카카오 유저 로그인 Ok인 경우 해당 정보를 기입 후 바로 redirect하게 만듬
        <body onload="calls();">
			<form action='<c:url value="/login" />' method="post" name="submitKakaoLogin">
				<!-- 이게 로그인페이지 주소가 무조건 고정되어 있다고? -->
				<table>
					<tr>
						<th>ID</th>
						<td><input type="hidden" name="username" value="${udto.username }" id="" /></td>
					</tr>
					<tr>
						<th>password</th>
						<td><input type="hidden" name="password" value="${udto.password }" id="" /></td>
					</tr>
				
					<tr>
						<td colspan="2">
							<input type="submit" value="안보이는 등록버튼"/> 
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</td>
					</tr>
				</table>
			</form>
		</body>
</body>
</html>