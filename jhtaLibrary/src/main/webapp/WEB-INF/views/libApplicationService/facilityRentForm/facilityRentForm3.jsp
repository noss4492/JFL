<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanumgothic.css">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<c:url value="resources/css/applicationService/facilityRentForm/facilityRentForm3.css"/>" />
    
    
    

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/header.css">
<script src="js/viewjs/header.js" type="text/javascript"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"
	integrity="sha256-4iQZ6BVL4qNKlQ27TExEhBN1HFPvAvAMbFavKKosSWQ="
	crossorigin="anonymous"></script>
     
<title>facilityRentForm3.jsp</title>
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
a{
height: 80px;
width: 120px;
}
</style>
<script>
function dateToMyFormat(y, m, d){
    return ''+y+'/'+(m<10?'0'+m:m)+'/'+(d<10?'0'+d:d);
}

$(document).ready(function() {
    buildCalendar();
    
});

//        <li class="on"><a href="#bookBest">대출베스트</a></li>
//                    <li><a href="#newBook">신착도서</a></li>
//                    <li><a href="#publicBook">공공도서관 인기도서</a></li>
//공지사항 문화행사 탭변경

var today = new Date(); //오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
var date = new Date(); //today의 Date를 세어주는 역할
function prevCalendar() { //이전 달
    // 이전 달을 today에 값을 저장하고 달력에 today를 넣어줌
    //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
    //getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
    today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
    buildCalendar(); //달력 cell 만들어 출력 
}

function nextCalendar() { //다음 달
    // 다음 달을 today에 값을 저장하고 달력에 today 넣어줌
    //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
    //getMonth()는 현재 달을 받아 오므로 다음달을 출력하려면 +1을 해줘야함
    today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
    buildCalendar(); //달력 cell 만들어 출력
}

function buildCalendar() { //현재 달 달력 만들기
    var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
    //이번 달의 첫째 날,
    //new를 쓰는 이유 : new를 쓰면 이번달의 로컬 월을 정확하게 받아온다.     
    //new를 쓰지 않았을때 이번달을 받아오려면 +1을 해줘야한다. 
    //왜냐면 getMonth()는 0~11을 반환하기 때문
    var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
    //이번 달의 마지막 날
    //new를 써주면 정확한 월을 가져옴, getMonth()+1을 해주면 다음달로 넘어가는데
    //day를 1부터 시작하는게 아니라 0부터 시작하기 때문에 
    //대로 된 다음달 시작일(1일)은 못가져오고 1 전인 0, 즉 전달 마지막일 을 가져오게 된다
    var tbCalendar = document.getElementById("calendar");
    //날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
    var tbCalendarYM = document.getElementById("tbCalendarYM");
    //테이블에 정확한 날짜 찍는 변수
    //innerHTML : js 언어를 HTML의 권장 표준 언어로 바꾼다
    //new를 찍지 않아서 month는 +1을 더해줘야 한다. 
    tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월";

    /*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
    while (tbCalendar.rows.length > 2) {
        //열을 지워줌
        //기본 열 크기는 body 부분에서 2로 고정되어 있다.
        tbCalendar.deleteRow(tbCalendar.rows.length - 1);
        //테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지 
        //30일 이후로 담을달에 순서대로 열이 계속 이어진다.
    }
    var row = null;
    row = tbCalendar.insertRow();
    //테이블에 새로운 열 삽입//즉, 초기화
    var cnt = 0; // count, 셀의 갯수를 세어주는 역할
    // 1일이 시작되는 칸을 맞추어 줌
    for (i = 0; i < doMonth.getDay(); i++) {
        /*이번달의 day만큼 돌림*/
        cell = row.insertCell(); //열 한칸한칸 계속 만들어주는 역할
        cnt = cnt + 1; //열의 갯수를 계속 다음으로 위치하게 해주는 역할
    }
    /*달력 출력*/
    for (i = 1; i <= lastDate.getDate(); i++) {
        //1일부터 마지막 일까지 돌림
        cell = row.insertCell(); //열 한칸한칸 계속 만들어주는 역할
        cell.innerHTML = '<a href=root/rentroom/?'+i+'>'+i+'</a>'; //셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
        cnt = cnt + 1; //열의 갯수를 계속 다음으로 위치하게 해주는 역할
        if (cnt % 7 == 0) {
            /* 1주일이 7일 이므로 토요일 구하기*/
            //월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
            //7번째의 cell에만 색칠
            row = calendar.insertRow();
            //토요일 다음에 올 셀을 추가
        }
        
    }
    $(function info(){
    	$(".cal td").on("click",function(){
    	$("#pickTimeTitle input").val(today.getFullYear() + "년 " + (today.getMonth()+1) + "월"+$(this).text()+"일 대관현황");
    	var date = {
    			rentDate : dateToMyFormat(today.getFullYear(),(today.getMonth()+1),$(this).text())
//     				today.getFullYear()+""+(today.getMonth()+1)+""+$(this).text()
		
    	}
    	console.log(date);
    	$.ajax({
    		url:"facilityRentInfo",
    		type:"GET",
    		dataType:"json",
    		data:date,
    		success:function(data){
    			
    		},
    		error:function(){
    			alert("에러남");
    		}
    	
    		
    	})
    	//console.log(today.getFullYear()+"/"+(today.getMonth()+1)+"/"+$(this).text());
    	})
    	$(".availability").on("click",function(){
    		console.log("나오나")
    		
    	})
    	
    	})
    	$(function rent(){
    		var date = {
        			rentDate : dateToMyFormat(today.getFullYear(),(today.getMonth()+1),$(this).text())
        	}
    		var nowT = 
    		
    		${".placeId"}.val("");
    		${".userName"}.val(${principal.username});
    		${".rentDate"}.val(date);
    		${".startTime"}.val();
    		${".endTime"}.val(${".startTime"}.val()+1);
    		${".requestDate"}.val();
    		${".status"}.val();
    		
    	})
}



</script>
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
						
					<div class="schedule">
                    
                   
                        
                    
                    <div class="cal">
                        <table id="calendar" align="center" >
                            <tr id="calendarTr">
                                <!-- label은 마우스로 클릭을 편하게 해줌 -->
                                <th colspan="2"><i class="xi-angle-left caltitle" onclick="prevCalendar()"></i></th>
                                <th align="center" id="tbCalendarYM" class="caltitle" colspan="3"> 
                                <div class="topgroup">
                                <span>yyyy.mm</span>
                                </div>
                                </th>
                                <th colspan="2"><i class="xi-angle-right caltitle" onclick="nextCalendar()"></i></th>
                            </tr>
                            <tr>
                                <th align="center">일</th>
                                <th align="center">월</th>
                                <th align="center">화</th>
                                <th align="center">수</th>
                                <th align="center">목</th>
                                <th align="center">금</th>
                                <th align="center">토</th>
                            </tr>
                        </table>
                    <p class="cal_info">
                        <i class="redcircle"></i>
                        휴관일
                        <i class="bluesquare"></i>
                        행사일
                        <i class="greensquare"></i>
                        문화행사프로그램
                        
                    </p>
                </div>
                </div>	
						
						
				<div id="pickTime">
					<div id="pickTimeTitle">
					<input type="text" />
					</div>
					<div id="pickTimeTable">
					<input type="hidden" name="rentPlaceId" value="" />
					<input type="hidden" name="placeId" value="" />
					<input type="hidden" name="userName" value="" />
					<input type="hidden" name="rentDate" value="" />
					<input type="hidden" name="startTime" value="" />
					<input type="hidden" name="endTime" value="" />
					<input type="hidden" name="requestDate" value="" />
					<input type="hidden" name="status" value="" />
					<table>
						<tr>
							<td>10:00 <input type="button" value="123" class="availability"/></td>
							<td>11:00 <input type="button" value="" class="availability"/></td>
							<td>12:00 <input type="button" value="" class="availability"/></td>
							<td>13:00 <input type="button" value="" class="availability"/></td>
							<td>14:00 <input type="button" value="" class="availability"/></td>
						</tr>
						<tr>
							<td>15:00 <input type="button" value="" class="availability"/></td>
							<td>16:00 <input type="button" value="" class="availability"/></td>
							<td>17:00 <input type="button" value="" class="availability"/></td>
							<td>18:00 <input type="button" value="" class="availability"/></td>
							<td>19:00 <input type="button" value="" class="availability"/></td>
						</tr>					
					</table>
					</div>
				</div>		                        
                  <div id="kkk">
                  <input type="text" id="kkkk"/>
<%--                   <c:forEach var="rpidto" items="${list }"> --%>
<%--                   	${rpidto.rentPlaceId} --%>
<%--                   	${rpidto.startTime} --%>
<%--                   	${rpidto.rentDate} --%>
<%--                   </c:forEach>     --%>
                  </div>
                        
                        
                   
                
                
                
                
                
                    </div><!-- applyformCore-->
            </div><!-- applyFormWrapper -->
        </div><!-- all_contents-->
    </div><!-- mainWrapper -->
   
         
     
   <%@include file="../../footer.jsp"%>
</body>
</html>