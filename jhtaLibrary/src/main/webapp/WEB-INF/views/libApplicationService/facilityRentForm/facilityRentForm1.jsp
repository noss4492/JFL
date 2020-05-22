<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanumgothic.css">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!--     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
    <link rel="stylesheet" href="<c:url value="resources/css/applicationService/facilityRentForm/facilityRentForm1.css"/>" />
    
    
    
<!-- <!-- 부가적인 테마 --> -->
<!-- <link rel="stylesheet" -->
<!--    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- <!-- 합쳐지고 최소화된 최신 자바스크립트 --> -->
<!-- <script -->
<!--    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" -->
<!--    href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"> -->

<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
   src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<link
   href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
   rel="stylesheet">
<link rel="stylesheet" href="css/header.css">
<script src="js/viewjs/header.js" type="text/javascript"></script>

<title>Insert title here</title>
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
</style>
</head>
<body>
	 <%@include file="../../header.jsp"%>
   <div id="mainWrapper">
      <%@include file="../../sideBar.jsp"%>
      <div class="all_contents">
         <%@include file="../../contentTitle.jsp"%>
         

        

            
            <div id="applyFormWrapper">
                
                
                
                <div id="applyformCore">
                    <div id="tabNav">
                        <ul id="tabNavContents">
                            <li><a href="#"> <strong>대관안내</strong></a></li>
                            <li><a href="./facilityRentForm2"><strong>시설안내</strong></a></li>   
                             <li><a href="./facilityRentForm3"><strong>신청현황/신청하기</strong></a></li>
                        </ul>
                    </div>
                    <h3 id="rentPolicy">대관 규정 안내</h3>
                    <ul id="rendPolicyDetail">
                        <li>대관대상 : 중앙시 시민 및 단체</li>
                        <li>신청방법 : 홈페이지 온라인 접수</li>
                        <li>신청취소 : 관리자 승인 전까지(승인 후 별도 연락 후 취소 가능)</li>
                    </ul>
                    <h3 id="rentInfo">대관정보</h3>
                    <div id="rentInfoTableWrapper">
                        <table id="rentInfoTable">
                            <colgroup>
                                <col>
                                <col>
                                <col>
                                <col>
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col" id="rentInfoTableth1">시설구분</th>
                                    <th scope="col" id="rentInfoTableth2">문화강연실</th>
                                    <th scope="col" id="rentInfoTableth3">다목적강당</th>
                                    <th scope="col" id="rentInfoTableth4">공연장</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>    
                                    
                                    <td>운영시간</td>
                                    <td>평일 10:00 ~ 21:00 <br>주말 10:00 ~ 17:00</td>
                                    <td>평일 10:00 ~ 21:00 <br>주말 10:00 ~ 17:00</td>
                                    <td>평일 10:00 ~ 21:00 <br>주말 10:00 ~ 17:00</td>
                                </tr>
                                <tr>
                                    <td>대관시간</td>
                                    <td>일 최대 3시간(월4회 / 주 1회까지) <br>(30분 단위로 신청)</td>
                                    <td>일 최대 8시간(월 4회까지) <br>(1시간 단위로 신청)</td>
                                    <td>일 최대 8시간(월 4회까지) <br>(1시간 단위로 신청)</td>
                                </tr>
                                <tr>
                                    <td>접수기간</td>
                                    <td>대관희망일 30일전부터~3일전까지</td>
                                    <td>대관희망일 60일전부터~10일전까지</td>
                                    <td>대관희망일 60일전부터~10일전까지</td>
                                </tr>
                                <tr>
                                    <td>이용제한</td>
                                    <td colspan="3">상업적,종교적 목적의 대관을 제한합니다.</td>
                                </tr>
                            </tbody>
                        </table>
                    </div><!--rentInfoTableWrapper-->
                    <h3 id="howToUse">이용 방법</h3>
                   <ol id="howToUseList">
                       <li>도서관 홈페이지 로그인 후 [신청현황/신청하기] 페이지로 이동</li>
                       <li>달력에서 대관 희망 날짜 선택</li>
                       <li>신청 항목 작성 후 신청완료</li>
                       <li>대관 당일 신청자(단체 대표자)는 신분증(회원증) 지참 후 안내실 방문</li>
                       <li>신분증 확인 및 담당직원 안내</li>
                       <li>대관 시설 이용</li>
                   </ol>
                    <dl id="rentLink">
                        <dt>신청조회 또는 신청하기 버튼을 누르세요</dt>
                        <dd><a href=""><button id="rentLinkBtn1">신청내역 조회</button> </a> <a href="./facilityRentForm3"><button id="rentLinkBtn2"><i class="xi-pen-o xi-1x"></i>신청하기</button></a></dd>
                    </dl>
                </div><!-- applyformCore-->
            </div><!-- applyFormWrapper -->
        </div><!-- allContents-->
    </div><!-- mainWrapper -->
   
         
     
   <%@include file="../../footer.jsp"%>
    
</body>
</html>