<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanumgothic.css">
    <link rel="stylesheet" href="/cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<style>
		
h3{
	margin-bottom: 20px;
}
#tabNav{
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
			background-color:#46B7D9;
			color: white;
			 
		}
		.info li{
			height: 30px;
			font-size: 16px;
			color: #666666;
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
</head>
<body>
	
	
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
			
			
			
			
			</div><!-- sideBardiv -->
			
			<div id="coreContentWrapper">
				
				
				<div id="navAndTitleWrapper">
                    <h2>신청안내</h2>
                    <div id="navAndTitleBar">
                        <a href="">
                            <i class="xi-home xi-1x" style="padding-top:5px; line-height: 10px; color:darkgray"></i>
                        </a>
                        <span><i class="xi-angle-right-thin"></i>신청서비스 <i class="xi-angle-right-thin"></i>도서관견학신청 <i class="xi-angle-right-thin"></i>신청안내</span>
                    </div>
				</div><!-- navAndTitleWrapper -->
				
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
                        <dd><a href=""><button id="rentLinkBtn1">신청내역 조회</button> </a> <a href=""><button id="rentLinkBtn2"><i class="xi-pen-o xi-1x"></i>신청하기</button></a></dd>
                    </dl>
                
                
				
				
			
			
					
			
		
		
		
	
			</div><!--  coreContentWrapper -->
		</div><!--  basicFormWrapper1 -->
	</div><!--  basicFormWrapper2 -->
	
	
</body>
</html>