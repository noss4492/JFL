<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- csrf토큰 -->
<meta id="_csrf" name="_csrf" content="${_csrf.token}" /> 
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<title>Insert title here</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!--font-->
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<!--datatimepicker 사용-->
<link
	href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.css"
	rel="stylesheet" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css"
	rel="stylesheet" />
<!--아래에서 올림-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
<!--datatimepicker 사용-->

	<link rel="stylesheet"
   href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
   <link rel="stylesheet"
   href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
   src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>


<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 주소 api -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="css/header.css">
<script src="js/viewjs/header.js" type="text/javascript"></script>
<style>
#mainWrapper {
   width: 1200px;
   margin: auto;
   display: flex;
}

.all_contents {
   width: 880px;
   padding: 20px 0;
   margin-left: 50px;
   word-break: keep-all;
}
* {
	margin: 0;
	padding: 0;
}

body {
	font-family: 'Noto Sans', '나눔고딕', 'Nanum Gothic', 'Helvetica',
		sans-serif;
	font-size: 20px;
}

h1, h2, h3, h4, h5, p, div, span, ul, li, ol, img, a, a:visited {
	margin: 0px;
	padding: 0px;
}

/* 아래는 클래스 input */
.input {
	display: inline;
	text-align: right;
	position: relative;
	/* padding-bottom: 10px; */
	/* border-radius: 0ex; */
	/* margin-left: 100px; */
	/* left: 100px; */
	border: none;
	/* border:0px 0px 0px 90px; */
}

.joinStep {
	overflow: hidden;
	margin-bottom: 40px;
	text-align: center;
}

.joinStep li {
	margin-left: 80px;
}

#container {
	border: 1px solid red;
	margin: 0;
	padding: 0;
	border: 0;
}

tr
    .contentGroup {
	margin: auto;
}

.terms {
	top: 0;
	left: 0;
	width: 880px;
	position: relative;
	margin: 0 auto;
}

#rcontainer {
	width: 880px;
	display: table;
	border-top: 1px solid black;
	margin-top: 80px;
}

.wrap {
	width: 100%;
	margin: auto;
}

.temp {
	padding-top: 20px;
	padding-bottom: 20px;
	border-top: 1px dotted gray;
}

.fieldText {
	padding-right: 20px;
	font-weight: bold;
	font-size: 20px;
	display: table-cell;
}

#bd {
	/* display: block; */
	margin: 0;
	padding: 0;
	text-align: left;
	/* width: 140px; */
	height: 36px;
}

.idCh, .nCh {
	padding-left: 95px;
}

td {
	padding-left: 50px;
}

th, td {
	margin-left: 30px;
	padding-top: 10px;
	padding-bottom: 10px;
	border-bottom: 1px solid rgb(195, 190, 190);
}

th {
	background-color: rgb(239, 255, 255);
}

ul li {
	float: left;
	margin-left: 6px;
	margin-right: 6px;
	border-radius: 10px;
}

.noct1 {
	padding-left: 40px;
	padding-top: 50px;
}

#active {
	background: #46B7D9;
	border-color: #46B7D9;
}

.fieldTexta {
	clear: both;
}

#btn1, input button {
	border-radius: 0px;
	background: #46B7D9;
	border-color: #46B7D9;
	height: 50px;
}

#btn2 {
	border-radius: 0px;
	background: rgb(19, 97, 121);
	border-color: #46B7D9;
	height: 50px;
}

#btn {
	background-color: rgb(240, 241, 175);
	border: 4;
	/* outline: 0; */
}

#gbutton {
	background-color: aqua;
}

.btnfield {
	margin-top: 80px;
	text-align: center;
}

#gbutton {
	border: 1px solid #ccc;
	position: relative;
	top: 0;
	left: 15px;
	width: 50px;
}

.contentcore {
	width: 880px;
}

.mv {
	margin-top: 5px;
}

.leftLabel {
	display: inline-block;
	width: 140px;
	height: 100%;
	/* height:36px; */
	border: 1px solid black;
	/* height: 100px; */
	/* clear: initial; */
}

.addr1input {
	/* margin-left: 145px; */
	width: 343px;
}
</style>




</head>
<body>
<%@include file="../../header.jsp"%>
   <div id="mainWrapper">
      <%@include file="../../sideBar.jsp"%>
      <div class="all_contents">
         <%@include file="../../contentTitle.jsp"%>
	<div id="wrap" class="wrap">
		<!-- <div id="header">이부분은 헤더</div> -->
		<!-- <div id="container" class="sub"> -->
		<!-- <div id="contents"></div> -->
		<div class="contentGroup">
			<div class="terms">
				<div class="contentcore">
<!-- 					<h3>회원가입</h3> -->
<!-- 					<hr class="one"> -->
<!-- 					<div>네비게이션</div> -->
<!-- 					<hr class="one"> -->
					<div class="joinStep">
						<ul class="list-group list-group-horizontal">

<!-- 							<li class="list-group-item">가입확인</li> -->
							<li class="list-group-item">본인확인</li>
							<li class="list-group-item">약관동의</li>
							<li class="list-group-item active" id="active">정보입력</li>

						</ul>
					</div>


					<form name = "f" action="./registerOk" id="registerChk" name="frm" method="post">

						<div id="rcontainer">
							<table>
								<tr>
									<th>이름</th>
									<td>
										<div class="input">
											<input type="text" name="name" id="name" max-width="220"
												maxlength="5">
										</div>
										<span id="name_check"></span>
									</td>
								</tr>
								<tr>
									<th>아이디</th>
									<td>
										<div class="input">
											<input type="text" name="username" id="user_m_id" max-width="220" />&nbsp;&nbsp;
<!-- 											<input type="button" value="중복확인" id="btn" /> -->
											 <span id="id_check"></span>
										</div>
									</td>
								</tr>
											<tr>
									<th>비밀번호</th>
									<td>
										<div class="input">
											<input type="password" name="password" id="uPw" max-width="220"
												height="5px" >
										</div>
										<span class="pwjCh"></span>
									
									</td>
								</tr>
						
								<tr>
									<th>비밀번호 확인</th>
									<td>
										<div class="input">
											<input type="password" id="uPwch" max-width="220"> 
											<span class="pwCh"></span>
										</div>

									</td>
								</tr>
								<tr>
									<th>닉네임</th>
									<td>
										<div class="input">
											<input type="text" name="nickname" id="nick" max-width="220" />&nbsp;&nbsp;
												 <span id="nick_check"></span>
										</div>
									</td>
								</tr>
								<tr>
									<th>성별</th>
									<td>
										<div class="input">
											<input type="radio" name="gender" id="mail" class="frm_input" value="1">남
											&nbsp;&nbsp; <input type="radio" name="gender" id="femail" class="frm_input" value="2">여
					
										</div>
									</td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td>
										<div class="input-group date" id="datet">
											<div class="input">
												<input type="text" name="birth" id="bd" max-width="220" />
											</div>
											<div class="input-group-addon" id="gbutton" name="btn">
												<div class="glyphicon-calendar glyphicon"></div>
												
											</div>
										</div>
										
									</td>
								</tr>
										<tr>
									<th>이메일</th>
									<td>
										<div class="input">
											<input type="text" name="email" id="email" max-width="220"
												height="5px" value="${tomail}" readonly="readonly">
										</div>
									</td>
								</tr>
								<tr>
									<th rowspan="2">주소</th>
									<td rowspan="2">
										<div class="input">
											<input type="text" name="addr1" id="addr1" max-width="220"
												placeholder="우편번호" />&nbsp;&nbsp; <input type="button"
												onclick="postCode()" value="우편번호 찾기" id="btn" /><br>
										</div>
										<div>
											<input type="text" name="addr2" id="addr2" placeholder="주소"
												class="addr1input mv" /> 
												<input type="text" name="addr3" id="addr3" placeholder="상세주소 " class="mv" />
										</div>
									</td>
								</tr>
							</table>
							<div class=btnfield>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<input type="button" id="btn1" class="btn btn-primary" value="가입신청" >								
								 <input type="button" id="btn2"	class="btn btn-warning" value="취소"	onclick="window.location='main.jsp'">
							</div>

						</div>


					</form>
				</div>
			</div>
		</div>

	</div>
	 </div>
   </div>
   <%@include file="../../footer.jsp"%>
	
<script type="text/javascript">
	var idflag = 0; // id확인 논리값
	var pwflag = 0; // 비밀번호 재입력 확인 논리값
	var pwflag2 = 0;
	var nameflag = 0; //이름 논리값
	var nickflag= 0;
	var nickflag22= 333;
	var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
	var pwJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
	console.log(pwflag);
	console.log(idflag);
	console.log(nameflag);
	console.log(nickflag);

	//////////////////////////////////////닉네임 중복 확인 및 아이디 중복 확인 버튼 클릭시//////////////////////////////////
	$(function() {
		$('#datet').datetimepicker({
			viewMode : 'years',
			format : 'DD/MM/YYYY',
			showClear : true

		});
	});



$(document).ready(function(){

		$("#user_m_id").blur(function() {

			var username=$('#user_m_id').val();
			
			

			
			$.ajax({
			async : false,
			type : "POST",
			url : "idCheck.do",
			data : username,
			beforeSend: function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); //시큐리티 때문에 필요
			},
			success : function(data) {
				if($('#user_m_id').val()==''){		
					$('#id_check').text('아이디를 입력하세요.');
					$('#id_check').css('color', 'red');
					idflag=2;
					} 
					else if(idJ.test($('#user_m_id').val())!=true){
					$('#id_check').text('4~12자의 영문, 숫자만 사용 가능합니다.');
					$('#id_check').css('color', 'red');
					idflag=2;
					} 
					else if($('#user_m_id').val()!=''){		
						$('#id_check').text('');
						if(data == "S") {
							$('#id_check').text('사용가능한 아이디입니다.');
							$('#id_check').css('color', 'red');
							idflag = 1;
						} else {

						$('#id_check').text('아이디가 존재합니다. 다른 아이디를 입력해주세요');
						$('#id_check').css('color', 'red');
						idflag=2;

						}						
					}			

			},
			error: function(req, status, errThrown) {

			}
			
			})//ajax///		
			//else if
			});//blur			
			
});
	
	////////////////////////////////////////////비밀번호 체크/////////////////////////////////
	$(function() {
		$('#uPw').keyup(function() {
// 			$('.pwjCh').html('');
			if(pwJ.test($('#uPw').val())!=true){
				$('.pwjCh').html('최소 8자, 하나의 숫자 및 특수 문자가 포함되어야 합니다.');
				pwflag = 0;
			
			}else{
				$('.pwjCh').html('');
				pwflag = 1;
			}				
		});

		$('#uPwch').keyup(function() {				
				if ($('#uPw').val() != $('#uPwch').val()) {
				$('.pwCh').html('비밀번호가 일치하지 않습니다.');
				pwflag2 = 0;
				} else{
				$('.pwCh').html("");
				pwflag2 = 1;
				}
			
		});
	
	});


	function postCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}		

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('addr1').value = data.zonecode;
				document.getElementById("addr2").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("addr3").focus();
			}
		}).open();
	}

	///////////////////////////////////////최종검사///////////////////////////////////////////////////////
window.onload = function() {

		var frm = document.frm;
		var btn1 = document.getElementById("btn1");
		var btn2 = document.getElementById("chCosend");
		var nickname=$('#nick').val();
	

// 		btn1.disabled = true; //가입신청 버튼 숨기기.  보류

		btn1.onclick = function() {
		
			for (var i = 0; i < $("#name").val().length; i++) {
				var chk = $("#name").val().substring(i, i + 1);
				if (chk.match(/[0-9]|[a-z]|[A-Z]/)) {
					$('#name_check').text('이름에는 영문 및 특수문자,숫자를 사용하실 수 없습니다.');
					$('#name_check').css('color', 'red');
					nameflag = 0;					
					return;				
				}
				if (chk.match(/([^가-힣\x7])/i)) {
					$('#name_check').text('이름을 정확히 입력해주세요');
					$('#name_check').css('color', 'red');
					nameflag= 0;
					return;
				}else if ($("#name").val() == '') {
					$('#name_check').text('이름을 입력해주세요');
					$('#name_check').css('color', 'red');
					nameflag = 0;
					return;
				}
				else {
					$('#name_check').text('');
					nameflag = 1;
					}
				}			
				if($("#nick").val() == null || $("#nick").val() == ''){
					nickflag = 0;
				}
				else{
					nickflag = 1;
				}
					
					
			if ( nameflag == 0 || idflag == 0 || idflag == 2 || pwflag == 0 || pwflag == 2 || nickflag == 0 || pwflag2 == 0 || pwflag2 == 2) {

					 if(nameflag == 0){
					 alert("이름을 확인해주세요.")
					 }
					 else if (idflag == 0 || idflag == 2) {
					alert("아이디를 확인해주세요.")
					}
				 
					else if (pwflag == 0 || pwflag == 2 || pwflag2 == 0 || pwflag2 == 2) {
					alert("패스워드를 확인해주세요")
					}else if(nickflag == 0){
					alert("닉네임 확인");
					}
				 
					}
				else if (nameflag == 1 && pwflag == 1 && idflag == 1 && nickflag == 1 && pwflag2 == 1) {	
				document.f.submit();
				}		
				
	}
	}
console.log(pwflag);
console.log(idflag);
console.log(nameflag);
</script>
</body>
</html>