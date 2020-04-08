<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanumgothic.css">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="<c:url value="resources/css/applicationService/facilityRentForm/facilityRentForm2.css"/>" />
    <link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
   href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
   src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<link
   href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
   rel="stylesheet">
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
</style>
</head>
<body>
	<%@include file="../../header.jsp"%>
   <div id="mainWrapper">
      <%@include file="../../sideBar.jsp"%>
      <div class="all_contents">
         <%@include file="../../contentTitle.jsp"%>
     
            <div id="generalWrapper">
              
                <div id="generalCore">
                    <div id="tabNav">
                        <ul id="tabNavContents">
                            
                            <li><a href=""> <strong>대관안내</strong></a></li>
                            <li><a href=""><strong>시설안내</strong></a></li>   
                             <li><a href=""><strong>신청현황/신청하기</strong></a></li>
                        </ul>
                    </div>
                    <form action="" id="placeInfo" name="placeInfo">
                        <div id="placeSearchDiv">
                            <div id="placeSearchInput">

                                <select id="searchSelect" name="">
                                    <option value="문화강좌실" selected="selected">문화강좌실</option>
                                    <option value="대강당">대강당</option>
                                    <option value="공연장">공연장</option>
                                    <option value="전시실">전시실</option>
                                    <option value="과학실">과학실</option>
                                </select>
                                <input id="searchText" type="text" name="" id="" placeholder="시설명 입력">
                                <input id="searchSubmit" type="submit" value="검색">
                            </div>
                        
                        </div>

                    </form>
                    
                    <form action="신청하기 누르면 선택한 시설 정보 넘겨줘야함">
                        <div id="placeInfoDetailWrapper1">
                            <div id="placeInfoDetailWrapper2">
                            <div id="placeThumnailDiv"><img id="placeThumnail" src="" alt=""></div>
                            <div id="placeDetail">
                                <h4>시설명</h4>
                                <ul>
                                    <li>위치</li>
                                    <li>시설용도</li>
                                    <li>좌석수</li>
                                    <li>수용가능인원</li>
                                    <li>이용가능장비</li>
                                </ul>
                            </div>
                        </div>
                            <input id="bookPlace" type="submit" value="신청하기">
                    </div>
                </form>
                </div><!-- applyformCore-->
            </div><!-- applyFormWrapper -->
        </div>
            </div>
            <%@include file="../../footer.jsp"%>
        
</body>
</html>