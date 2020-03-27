<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="./signUp" method="post">
		<br> username <input type="text" name="username" id="" value="guest9999" />
		<br> password <input type="text" name="password" id="" value=1234 />
		<br> email <input type="text" name="email" id="" value="guest9999@gmail.com"/>
		<br> name <input type="text" name="name" id="" value="나그네"/>
		<br> nickname <input type="text" name="nickname" id="" value="나그넧" />
		<br> gender <input type="text" name="gender" id="" value='1'/>
		<br> birth <input type="text" name="birth" id="" value="990130"/>	
		<br> age_group <input type="text" name="ageGroup" id="" value='3'/>	
		<br> register_date <input type="text" name="registerDate" id=""/>	
		<br> platform_status <input type="hidden" name="platformStatus" id="" value="1" />	
		<br> right_status <input type="text" name="rightStatus" id="" value="1" />	
		<br> grade_status <input type="text" name="gradeStatus" id="" value="1" />	
		<input type="submit" value="회원등록하기" />
	</form>
</body>
</html>