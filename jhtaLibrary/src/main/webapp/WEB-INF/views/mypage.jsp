<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
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
.myInner{
width:880px;
height: 300px;
border:1px dotted #44bbff;
padding-bottom: 50px;
margin-bottom : 30px;
}
.myState{
padding-top: 20px;
/* border:1px solid red; */
/* height:300px; */
}
.myState li{
float : left;
width: 25%;
margin-bottom : 5px;
}
.myState li div{
position : relative;
padding: 20px;
border:1px dotted #44bbff;
margin-left: 5px;
}
.myTop{
padding: 20px 140px 20px 20px;
background-color: 
}
.dot-list > li{
margin : 10px 0;
padding: 10px;
}
.myState li a{
position: absolute;
right: 20px;
margin-top: -15px;
font-weight: 700;
font-size: 1.750em;
line-height: 30px;
}
</style>
<title>Insert title here</title>
</head>
<body>
  <%@include file="header.jsp"%>
   <div id="mainWrapper">
      <%@include file="sideBar.jsp"%>
      <div class="all_contents">
         <%@include file="contentTitle.jsp"%>   
         <div class=myInner>
         	<div class=myTop>${dto.name }님, 안녕하세요</div>
         	<div class=myInfo>
         	<div class=myInfoList>
         	<ul class="dot-list">
         		<li>아이디 :  ${dto.username } </li>
         		<li>닉네임 : ${dto.nickname }</li>
         		<li>회원가입일 : ${dto.registerDate }</li>
         		<li>이메일 주소 : ${dto.email }</li>
         		<li></li>
         	</ul>
         	</div>
         	
         	</div>
         </div>
         
         <div class=myState>
         	<h4>아래부분</h4>
         	<ul class="myState clearfix">
         	<li><div><strong class="tit">대출중인 <br>도서 <a>2</a></strong></div></li>
  
         	<li><div><strong class="tit">연체중인<br> 도서 <a>0</a></strong></div></li>
         	<li><div><strong class="tit">예약중인<br> 도서 <a>1</a></strong></div></li>
         	<li><div><strong class="tit">반납완료<br> 도서 <a>5</a></strong></div></li>
         	<li><div><strong class="tit">열람실 <br>예약현황 <a>0</a></strong></div></li>
         	<li><div><strong class="tit">대관실<br> 예약현황 <a>0</a></strong></div></li>
         	<li><div><strong class="tit">희망신청<br> 도서 <a>0</a></strong></div></li>
         	<li><div><strong class="tit">등록한 <br>관심자료 <a>2</a></strong></div></li>

         	</ul>
         </div>
         
         
         
         
         
         
      </div>
   </div>
   <%@include file="footer.jsp"%>
</body>
</html>