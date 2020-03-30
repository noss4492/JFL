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
	href="/cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="<c:url value="resources/css/applicationService/tourApplication/tourApplication1.css"/>" />
<style>
</style>
</head>
<body>




	<!-- =========================CORE START========================== -->
	<div id="tabNav">
		<ul id="tabNavContents">
			<li><a href=""> <strong>신청안내</strong></a></li>
			<li><a href=""><strong>신청현황/신청하기</strong></a></li>
		</ul>
	</div>

	<h3>신청 안내</h3>

	<ul class="info">
		<li>견학대상 : 남양주시민(유아,초등)</li>
		<li>운영기간 : 연중(이용자가 많은 방학기간 제외)</li>
		<li>신청방법 : 홈페이지 온라인 접수</li>
		<li>신청기간 : 매월 1-10일에 다음달 견학 신청 열림</li>
		<li>견학내용 : 자유견학, 동극 관람, 동화구연</li>
	</ul>

	<h3>유의사항</h3>
	<ul class="info">
		<li class="kk">한 기관에서 주 1회, 최대 월 4회까지 신청할 수 있습니다.</li>
		<li class="kk">관리자 승인 후에는 홈페이지에서 취소가 불가능합니다.</li>
	</ul>

	<h3>문의처</h3>
	<ul class="info">
		<li>전화번호 : 031-590-4586</li>
		<li>팩스번호 : 031-590-4588</li>
		<li>신청양식 : 도서관 견학 신청서(양식) [다운로드↓]</li>
	</ul>

	<dl id="rentLink">
		<dt>신청조회 또는 신청하기 버튼을 누르세요</dt>
		<dd>
			<a href=""><button id="rentLinkBtn1">신청내역 조회</button> </a> <a href=""><button
					id="rentLinkBtn2">
					<i class="xi-pen-o xi-1x"></i>신청하기
				</button></a>
		</dd>
	</dl>















</body>
</html>