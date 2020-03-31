<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
<!--datatimepicker 사용-->



<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 주소 api -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
* {
	margin: 0;
	padding: 0;
}

/* css초기화 */
/* html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed,
figure, figcaption, footer, header, hgroup,
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
/* article, aside, details, figcaption, figure,
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
	line-height: 1;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
} */
/* css초기화 */
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

.idCh, .pwCh, .nCh {
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



<script type="text/javascript" src="../js/httpRequest.js"></script>

<script type="text/javascript">
//모든 공백 체크 정규식
var empJ = /\s/g;
//아이디 정규식
var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
// 비밀번호 정규식
var pwJ = /^[A-Za-z0-9]{4,12}$/;
// 이름 정규식
var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
// 이메일 검사 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 휴대폰 번호 정규식
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/
var birthJ = false;
var address = $('#mem_detailaddress');
$(document).ready(function() {
var address = $('#mem_detailaddress');
//아이디 중복확인
$("#mem_id").blur(function() {
if($('#mem_id').val()==''){
$('#id_check').text('아이디를 입력하세요.');
$('#id_check').css('color', 'red');
} else if(idJ.test($('#mem_id').val())!=true){
$('#id_check').text('4~12자의 영문, 숫자만 사용 가능합니다.');
$('#id_check').css('color', 'red');
} else if($('#mem_id').val()!=''){
var mem_id=$('#mem_id').val();
$.ajax({
async : true,
type : 'POST',
data : mem_id,//mem_id라는 이름으로 mem_id라는 데이터를 @WebServlet("/idsearch.do")에 보내겠다
url : 'idcheck.do',
dateType: 'json',
contentType: "application/json; charset=UTF-8",
success : function(data) {
if(data.cnt > 0){
$('#id_check').text('중복된 아이디 입니다.');
$('#id_check').css('color', 'red');
$("#usercheck").attr("disabled", true);
}else{
if(idJ.test(mem_id)){
$('#id_check').text('사용가능한 아이디 입니다.');
$('#id_check').css('color', 'blue');
$("#usercheck").attr("disabled", false);
}
else if(mem_id==''){
$('#id_check').text('아이디를 입력해주세요.');
$('#id_check').css('color', 'red');
$("#usercheck").attr("disabled", true);
}
else{
$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
$('#id_check').css('color', 'red');
$("#usercheck").attr("disabled", true);
}
}
}
});//ajax///
}//else if
});//blur
$('form').on('submit',function(){
var inval_Arr = new Array(8).fill(false);
if (idJ.test($('#mem_id').val())) {
inval_Arr[0] = true;
} else {
inval_Arr[0] = false;
alert('아이디를 확인하세요.');
return false;
}
// 비밀번호가 같은 경우 && 비밀번호 정규식
if (($('#mem_pw').val() == ($('#mem_pw2').val()))
&& pwJ.test($('#mem_pw').val())) {
inval_Arr[1] = true;
} else {
inval_Arr[1] = false;
alert('비밀번호를 확인하세요.');
return false;
}
// 이름 정규식
if (nameJ.test($('#mem_name').val())) {
inval_Arr[2] = true;
} else {
inval_Arr[2] = false;
alert('이름을 확인하세요.');
return false;
}
// 생년월일 정규식
if (birthJ) {
console.log(birthJ);
inval_Arr[3] = true;
} else {
inval_Arr[3] = false;
alert('생년월일을 확인하세요.');
return false;
}
// 이메일 정규식
if (mailJ.test($('#mem_email').val())){
console.log(phoneJ.test($('#mem_email').val()));
inval_Arr[4] = true;
} else {
inval_Arr[4] = false;
alert('이메일을 확인하세요.');
return false;
}
// 휴대폰번호 정규식
if (phoneJ.test($('#mem_phone').val())) {
console.log(phoneJ.test($('#mem_phone').val()));
inval_Arr[5] = true;
} else {
inval_Arr[5] = false;
alert('휴대폰 번호를 확인하세요.');
return false;
}
//성별 확인
if(member.mem_gender[0].checked==false&&member.mem_gender[1].checked==false){
inval_Arr[6] = false;
alert('성별을 확인하세요.');
return false;
} else{
inval_Arr[6] = true;
}
//주소확인
if(address.val() == ''){
inval_Arr[7] = false;
alert('주소를 확인하세요.');
return false;
}else
inval_Arr[7] = true;
//전체 유효성 검사
var validAll = true;
for(var i = 0; i < inval_Arr.length; i++){
if(inval_Arr[i] == false){
validAll = false;
}
}
if(validAll == true){ // 유효성 모두 통과
alert(' 감사합니다.');
} else{
alert('정보를 다시 확인하세요.')
}
});
$('#mem_id').blur(function() {
if (idJ.test($('#mem_id').val())) {
console.log('true');
$('#id_check').text('');
} else {
console.log('false');
$('#id_check').text('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.');
$('#id_check').css('color', 'red');
}
});
$('#mem_pw').blur(function() {
if (pwJ.test($('#mem_pw').val())) {
console.log('true');
$('#pw_check').text('');
} else {
console.log('false');
$('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
$('#pw_check').css('color', 'red');
}
});
//1~2 패스워드 일치 확인
$('#mem_pw2').blur(function() {
if ($('#mem_pw').val() != $(this).val()) {
$('#pw2_check').text('비밀번호가 일치하지 않습니다.');
$('#pw2_check').css('color', 'red');
} else {
$('#pw2_check').text('');
}
});
//이름에 특수문자 들어가지 않도록 설정
$("#mem_name").blur(function() {
if (nameJ.test($(this).val())) {
console.log(nameJ.test($(this).val()));
$("#name_check").text('');
} else {
$('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
$('#name_check').css('color', 'red');
}
});
$("#mem_email").blur(function() {
if (mailJ.test($(this).val())) {
$("#email_check").text('');
} else {
$('#email_check').text('이메일 양식을 확인해주세요.');
$('#email_check').css('color', 'red');
}
});
// 생일 유효성 검사
var birthJ = false;
// 생년월일 birthJ 유효성 검사
$('#mem_birth').blur(function(){
var dateStr = $(this).val();
var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
var today = new Date(); // 날짜 변수 선언
var yearNow = today.getFullYear(); // 올해 연도 가져옴
if (dateStr.length <=8) {
// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
if (year > yearNow || year < 1900 ){
$('#birth_check').text('생년월일을 확인해주세요');
$('#birth_check').css('color', 'red');
}
else if (month < 1 || month > 12) {
$('#birth_check').text('생년월일을 확인해주세요 ');
$('#birth_check').css('color', 'red');
}else if (day < 1 || day > 31) {
$('#birth_check').text('생년월일을 확인해주세요 ');
$('#birth_check').css('color', 'red');
}else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
$('#birth_check').text('생년월일을 확인해주세요 ');
$('#birth_check').css('color', 'red');
}else if (month == 2) {
var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
if (day>29 || (day==29 && !isleap)) {
$('#birth_check').text('생년월일을 확인해주세요 ');
$('#birth_check').css('color', 'red');
}else{
$('#birth_check').text('');
birthJ = true;
}
}else{
$('#birth_check').text('');
birthJ = true;
}//end of if
}else{
//1.입력된 생년월일이 8자 초과할때 : auth:false
$('#birth_check').text('생년월일을 확인해주세요 ');
$('#birth_check').css('color', 'red');
}
}); //End of method /*
// 휴대전화
$('#mem_phone').blur(function(){
if(phoneJ.test($(this).val())){
console.log(nameJ.test($(this).val()));
$("#phone_check").text('');
} else {
$('#phone_check').text('휴대폰번호를 확인해주세요 ');
$('#phone_check').css('color', 'red');
}
});
});


	//------------------------------------------------------------------

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

				//참고 항목은 지웠음.
				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.

				// if(data.userSelectedType === 'R'){
				//     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				//     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				//     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				//         extraAddr += data.bname;
				//     }
				//     // 건물명이 있고, 공동주택일 경우 추가한다.
				//     if(data.buildingName !== '' && data.apartment === 'Y'){
				//         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				//     }
				//     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				//     if(extraAddr !== ''){
				//         extraAddr = ' (' + extraAddr + ')';
				//     }
				//     // 조합된 참고항목을 해당 필드에 넣는다.
				//     document.getElementById("sample6_extraAddress").value = extraAddr;

				// } else {
				//     document.getElementById("sample6_extraAddress").value = '';
				// }

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('addr1').value = data.zonecode;
				document.getElementById("addr2").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("addr3").focus();
			}
		}).open();
	}

	
</script>

</head>
<body>
	<div id="wrap" class="wrap">
		<!-- <div id="header">이부분은 헤더</div> -->
		<!-- <div id="container" class="sub"> -->
		<!-- <div id="contents"></div> -->
		<div class="contentGroup">
			<div class="terms">
				<div class="contentcore">
					<h3>회원가입</h3>
					<hr class="one">
					<div>네비게이션</div>
					<hr class="one">
					<div class="joinStep">
						<ul class="list-group list-group-horizontal">

							<li class="list-group-item">가입확인</li>
							<li class="list-group-item">본인확인</li>
							<li class="list-group-item">약관동의</li>
							<li class="list-group-item active" id="active">정보입력</li>

						</ul>
					</div>


					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

<!-- 					<form action="pregisterOk.jsp" id="register" name="frm"> -->
					<form action="registerOk.do" id="registerChk" name="frm">

						<div id="rcontainer">
							<table>

								<tr>
									<th>이름</th>
									<td>
										<div class="input">
											<input type="text" name="name" id="name" max-width="220"
												maxlength="5">
										</div>
										<div class=nameCheck></div>
									</td>
								</tr>
								<tr>
									<th>아이디</th>
									<td>
										<div class="input">
											<input type="text" name="id" id="user_m_id" max-width="220" />&nbsp;&nbsp;
											<input type="button" value="중복확인" id="btn" /> <span id="id_check"></span>
										</div>
									</td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td>
										<div class="input">
											<input type="password" NAME="uPw" id="uPw" max-width="220"
												height="5px">
										</div>
									</td>
								</tr>
								<tr>
									<th>비밀번호 확인</th>
									<td>
										<div class="input">
											<input type="password" id="uPwch" max-width="220"> <span
												class="pwCh"></span>
										</div>

									</td>
								</tr>
								<tr>
									<th>닉네임</th>
									<td>
										<div class="input">
											<input type="text" name="nick" id="nick" max-width="220" />&nbsp;&nbsp;
											<input type="button" value="닉네임중복확인" id="btn" />
										</div>
									</td>
								</tr>
								<tr>
									<th>성별</th>
									<td>
										<div class="input">
											<input type="radio" name="gender" id="mail" class="frm_input">남
											&nbsp;&nbsp; <input type="radio" name="gender" id="femail"
												class="frm_input">여
											<!-- <select class="form-control" id="gender">
                    <option value="M">남</option>
                    <option value="F">여</option>
                  </select> -->
										</div>
									</td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td>
										<div class="input-group date" id="datet">
											<div class="input">
												<input type="text" name="bd" id="bd" max-width="220" />
											</div>
											<div class="input-group-addon" id="gbutton" name="btn">
												<div class="glyphicon-calendar glyphicon"></div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th rowspan="2">주소</th>
									<td rowspan="2">
										<div class="input">
											<input type="text" id="addr1" max-width="220"
												placeholder="우편번호" />&nbsp;&nbsp; <input type="button"
												onclick="postCode()" value="우편번호 찾기" id="btn" /><br>
										</div>
										<div>
											<input type="text" id="addr2" placeholder="주소"
												class="addr1input mv" /> <input type="text" id="addr3"
												placeholder="상세주소 " class="mv" />
										</div>
										</div>
									</td>
								</tr>
								<tr>								</tr>
							</table>
							<div class=btnfield>
								<input type="button" id="btn1" class="btn btn-primary"
									value="가입신청" onclick=> <input type="button" id="btn2"
									class="btn btn-warning" value="취소"
									onclick="window.location='main.jsp'">
							</div>

						</div>


					</form>
				</div>
			</div>
		</div>

	</div>
	</div>
</body>
</html>