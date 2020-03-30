<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form Css</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<!--스타일 시트 글꼴 적용-->


<style type="text/css">
body {
	font-family: 'Noto Sans', '나눔고딕', 'Nanum Gothic', 'Helvetica',
		sans-serif;
}
/*폰트 적용*/
h1, h2, h3, h4, h5, p, div, span, ul, li, ol, img, a, a:visited {
	margin: 0px;
	padding: 0px;
}
/*h 태그 초기화*/
.login_contents {
	width: 880px;
	height: 894px;
	padding: 50px 0px;
	position: relative;
	padding: 50px 0;
	word-break: keep-all;
}
/*타이틀 아래 감싸주는 폼*/
.login_Wrap {
	width: 880px;
	height: 422px;
	padding: 7px;
	text-align: center;
	background:
		url(https://lib.nyj.go.kr/include/image/contents/bg_pattern.png) 0 0;
}
/*로그인 텍스트 폼 바깥 테두리 */
.login_form {
	width: 866px;
	height: 408px;
	color: #464646;
	background: white;
}
/*로그인 Wrap 안쪽 영역*/
.login_group {
	display: inline-block;
	width: 660px;
	height: 275px;
	padding: 70px 0px 50px;
}
/*로그인 Wrap 가운데 영역 정렬*/
.login_Area {
	width: 660px;
	height: 155px;
	position: relative;
	min-width: 480px;
	padding: 0px 0px 0px 180px;
	background: url(/img/login.png) no-repeat 0 0;
}
/*로그인 사진과 버튼 영역*/
.inpArea {
	width: 350px;
	height: 50px;
	margin-bottom: 11px;
	margin-right: 10px;
	color: #464646;
	resize: none;
}
/*로그인,비밀번호 아이콘,텍스트 박스 감싸주는 폼*/
#login_btn {
	display: block;
	position: absolute;
	top: 0;
	right: 0;
	padding: 10px;
	width: 120px;
	height: 110px;
	padding: 0;
	font-size: 1.500em;
	line-height: 110px;
	background: #46B7D9;
	text-align: center;
}
/*로그인 버튼 css*/
.loginWrap.checkArea {
	overflow: hidden;
	max-width: 700px;
	margin: 0px 130px 0 0;
	font: 16px;
	text-align: center;
}
/* 로그인 영역  */
div.glyphicon.glyphicon-user::before {
	width: 30px;
	height: 30px;
	margin: -15px 0px 0px;
}
/*사용자 아이콘*/
div.glyphicon.glyphicon-lock::before {
	width: 30px;
	height: 30px;
	margin: -15px 0px 0px;
}

/*비밀번호 아이콘 */
input#login_userId {
	width: 298px;
	height: 48px;
	padding: 0px 10px 0px 5px;
}
/*로그인 텍스트 박스 css*/
input#login_password {
	width: 298px;
	height: 48px;
	padding: 0px 10px 0px 5px;
}
/*비밀번호 텍스트 박스 css*/
div.checkArea_clearfix>a {
	color: #666666;
	font-size: 17px;
	text-decoration: none;
}
/*아이디 찾기 | 비밀번호 재발급 | 회원가입 css*/
div.loginDesc {
	clear: both;
	padding: 25px 20px;
	text-align: left;
	background-color: #f2f2f2;
	border: solid 10px #fff;
	font-size: 1.063em;
	color: #555;
}

.pwd_rei::before {
	content: "";
	display: inline-block;
	width: 1px;
	height: 13px;
	margin: 2px 7px;
	vertical-align: middle;
	background: #ccc;
}
/*비밀번호 찾기 텍스트에 | 추가 정렬 css*/
.log_register::before {
	content: "";
	display: inline-block;
	width: 1px;
	height: 13px;
	margin: 2px 7px;
	vertical-align: middle;
	background: #ccc;
}
/*회원가입 텍스트에 | 추가 정렬 css*/
</style>
</head>
<body>
	<div class="login_contents">
		<div class="login_Wrap">
			<div class="login_form">
				<div class="login_group clearfix">
					<div class="login_Area">
						<!--아이디 아이콘,텍스트 감싸주는 폼 -->
						<div class="inpArea">
							<div class="input-group input-group-lg">
								<span class="input-group-addon" id="">
									<div class="glyphicon glyphicon-user"></div>

								</span> <input type="text" id="login_userId" placeholder="아이디"
									aria-describedby="sizing-addon1">
							</div>
						</div>
						<!--아이디 아이콘,텍스트 감싸주는 폼 끝-->


						<!--비밀번호 아이콘,텍스트 감싸주는 폼-->
						<div class="inpArea">
							<div class="input-group input-group-lg">
								<span class="input-group-addon" id="">
									<div class="glyphicon glyphicon-lock"></div>
								</span> <input type="password" id="login_password" placeholder="비밀번호"
									aria-describedby="sizing-addon1">
							</div>
						</div>
						<!--비밀번호 아이콘,텍스트 감싸주는 폼 끝-->




						<button type="submit" class="btn btn-primary btn-block"
							id="login_btn">로그인</button>
						<!------------------로그인 버튼 ------------------->

						<!--checkArea 영역-->
						<div class="checkArea_clearfix">
							<a href="" class="id_find">아이디 찾기</a> <a href="" class="pwd_rei">비밀번호
								재발급</a> <a href="" class="log_register">회원가입</a>
						</div>
						<!--checkArea 영역 끝-->
					</div>
					<!----로그인 Area 끝 ---->
				</div>
				<!--로그인  group clearfix 끝  -->



				<!--로그인 Desc 영역  -->
				<div class="loginDesc">
					<ul class="dot-list">
						<li>로그인이 안되시는 경우 한/영 키와 Caps Lock 키가 눌러져 있지 않은지 확인하세요.</li>
						<li>계속해서 로그인이 안되시는 경우 관리자에게 문의하시기 바랍니다.</li>
					</ul>
				</div>
				<!--로그인 Desc 끝  -->
			</div>
			<!--로그인 폼 끝  -->
		</div>
		<!--로그인 Wrap 끝  -->
	</div>
	<!--로그인 content 끝  -->

</body>
</html>

