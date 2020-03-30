<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//fonts.googleapis.com/earlyaccess/nanumgothic.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	
<!-- 	================주소값으로 들어가면 불러올 페이지의 css ===================-->
	<link rel="stylesheet"
	href="<c:url value="resources/css/applicationService/tourApplication/tourApplication2.css"/>" />
<!-- 	================주소값으로 들어가면 불러올 페이지의 css ===================-->	

<link rel="stylesheet"
	href="<c:url value="resources/css/basicForm.css"/>" />
	


</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<div id="basicFormWrapper1">

		<div id="basicFormWrapper2">

			<div id="sideBarWrapper">

				<div class="navArea">
					<h2>회원정보</h2>
					<ul class="lnb">
						<li class="Nav_li_login"><span class="glyph-m">
								<div class="glyphicon glyphicon-minus"></div>
						</span> <a href="/hwado/menu/10487/program/30006/memberLogin.do"
							class="Nav_login">로그인</a></li>

						<li class="Nav_li_findId"><span class="glyph-p">
								<div class="glyphicon glyphicon-plus"></div>
						</span> <a href="/hwado/menu/10488/program/30008/memberFindIdCertify.do"
							class="Nav_findId">아이디찾기</a></li>
						<li class="Nav_li_pwdRei"><span class="glyph-p">
								<div class="glyphicon glyphicon-plus"></div>
						</span> <a href="/hwado/menu/10491/program/30010/memberFindPwdCertify.do"
							class="Nav_pwdRei">비밀번호재발급</a></li>
					</ul>
					<!--네비게이션 하단바 끝-->
				</div>
				<!--네비게이션 전체 -->









			</div>
			<!-- sideBardiv -->

			<div id="coreContentWrapper">


				<div id="navAndTitleWrapper">
					<h3>대관안내</h3>
					<div id="navAndTitleBar">
						<a href=""> <i class="xi-home xi-1x"
							style="padding-top: 5px; line-height: 10px; color: darkgray"></i>
						</a> <span><i class="xi-angle-right-thin"></i>신청서비스 <i
							class="xi-angle-right-thin"></i>시설대관신청 <i
							class="xi-angle-right-thin"></i>대관안내</span>
					</div>
				</div>
				<!-- navAndTitleWrapper -->
				<%@ include file="/WEB-INF/views/libApplicationService/volunteerApplication/volunteerApplication1.jsp"%>



			</div>
			<!--  coreContentWrapper -->







		</div>
		<!--  basicFormWrapper1 -->
	</div>
	<!--  basicFormWrapper2 -->


</body>
</html>