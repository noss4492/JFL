<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
h3 {
	margin-bottom: 20px;
}

#tabNav {
	width: 880px;
	height: 50px;
	text-align: center;
}

#tabNavContents {
	list-style: none;
	vertical-align: middle;
}

#tabNavContents li {
	float: left;
	width: 49%;
	border: 1px solid rgb(226, 214, 214, 0.904);
	height: 50px;
	padding-top: 12px;
	display: block;
	font-size: 17px;
}

#tabNavContents li:first-child {
	background-color: #46B7D9;
	color: white;
}

.info li {
	height: 30px;
	font-size: 16px;
	color: #666666;
}

.kk {
	list-style: circle;
}

#rentLink {
	margin-top: 20px;
	padding: 10px 10px 10px 10px;
	background-color: rgb(221, 227, 233);
	height: 60px;
}

#rentLink dt {
	float: left;
	font-size: 20px;
	padding: 5px 5px 5px 5px;
}

#rentLink dd {
	float: right;
	display: block;
}

#rentLink a {
	text-decoration: none;
}

#rentLink dd button {
	width: 123px;
	height: 38px;
	font-weight: bolder;
	font-size: 14px;
	padding: 5px 15px 5px 15px;
}

#rentLinkBtn1, #rentLinkBtn2 {
	color: white;
}

#rentLinkBtn1 {
	background-color: RGB(100, 104, 109);
}

#rentLinkBtn2 {
	background-color: rgb(92, 119, 30);
}
</style>
<body>
	<div id="tabNav">
		<ul id="tabNavContents">
			<li><a href=""> <strong>신청안내</strong></a></li>
			<li><a href=""><strong>신청현황/신청하기</strong></a></li>
		</ul>
	</div>
	<h3>자원봉사 운영안내 – 학생 자원봉사</h3>

	<ul class="info">
		<li>대상 : 중학생~고등학생</li>
		<li>운영시간 : 오전 09:00~13:00 , 오후 14:00~18:00</li>
		<li>활동시간 : 1일 1회 4시간 이내 (최대 월 3회 참여)</li>
		<li>신청인원 : 오전 2명, 오후 2명</li>
		<li>신청기간 : 매월 21일 ~ 25일</li>
		<li>활동내용 : 도서정리, 도서 배가 작업, 훼손도서 수리, 도서관 환경정비 등</li>
	</ul>

	<h3>자원봉사 운영안내 – 성인 자원봉사</h3>
	<ul class="info">
		<li>대상 : 성인</li>
		<li>운영시간 : 09:00~22:00</li>
		<li>활동시간 : 1일 1회 4시간 이내 (최대 월 2회 참여)</li>
		<li>신청인원 : 1일 최대 2명</li>
		<li>신청기간 : 수시 접수(봉사희망일 10일 전 신청)</li>
		<li>활동내용 : 도서정리, 도서 배가 작업, 훼손도서 수리, 도서관 환경정비 등</li>
	</ul>

	<h3>유의사항</h3>
	<ul class="info">
		<li>불성실한 자 및 무단 불참자는 이후 1개월간 봉사활동 접수가 제한됩니다.</li>
		<li>1365 자원봉사포털 (1365.go.kr) 회원가입 필수 (직접 확인서 발급 가능)</li>
		<li>신청양식 : 도서관 견학 신청서(양식) [다운로드↓]</li>
	</ul>

	<dl id="rentLink">
		<dt>자원봉사 신청 또는 조회를 하려면 버튼을 누르세요</dt>
		<dd>
			<a href=""><button id="rentLinkBtn1">신청내역 조회</button> </a> <a href=""><button
					id="rentLinkBtn2">
					<i class="xi-pen-o xi-1x"></i>신청하기
				</button></a>
		</dd>
	</dl>
</body>
</html>