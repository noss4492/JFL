<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>studyRoom.jsp</title>

<link rel="stylesheet" href="resources/css/readingRoom.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"
	integrity="sha256-4iQZ6BVL4qNKlQ27TExEhBN1HFPvAvAMbFavKKosSWQ="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script>
	var timeH = 0;
	var timeM = 0;
	var cntMin = 0;
	var currentTime;
	var today = new Date();
	var nowT;
	var year = today.getFullYear();
	var month = today.getMonth();
	var date = today.getDate();
	var hours = today.getHours();
	var minutes = today.getMinutes();
	var seconds = today.getSeconds();

	function addTime(h, m) {
		var addedTime = moment(moment().add(h, 'h').add(m, 'm')).format(
				'YYYY-MM-DD HH:mm:ss');
		return addedTime;
	}

	function subTime(h, m) {
		var subtractedTime = moment(moment().subtract(h, 'h').subtract(m, 'm'))
				.format('YYYY-MM-DD HH:mm:ss');
		return subtractedTime;
	}

	$(function() {

		$(".rClockBtn1, .rClockBtn2").on("click", function() {
			if ($(this).attr("class") == "rClockBtn1") {
				cntMin <= (240 - 30) ? cntMin += 30 : cntMin;
			} else if ($(this).attr("class") == "rClockBtn2") {
				cntMin >= 30 ? cntMin -= 30 : cntMin;
			}
			$(".hour").val(Math.floor(cntMin / 60) + "시간");
			$(".minute").val(cntMin % 60 + "분")
			$(".endTime").val("사용시간 : "+addTime(Math.floor(cntMin / 60), cntMin % 60));
		});

		$(".regBtn1").on("click", function() {
			console.log(cntMin);
			nowT = moment().format('YYYY-MM-DD HH:mm:ss');
			$(".currentTime2").val(nowT);
			$(".endTime").val(addTime(Math.floor(cntMin / 60), cntMin % 60));
			if(cntMin<30){
				console.log("시간을 설정해 주세요");
				return;
			
			}else {
				document.frm.action = "selectSeat";
				document.frm.method = "get";
				document.frm.submit();
			}
			alert(addTime(Math.floor(cntMin / 60), cntMin % 60)+" 까지 사용 하실 수 있습니다.");
		})
	});

	window.onload = setInterval(function printTime() {
		 today = new Date();

		 year = today.getFullYear();
		 month = today.getMonth();
		 date = today.getDate();
		 hours = today.getHours();
		 minutes = today.getMinutes();
		 seconds = today.getSeconds();
		// 			currentTime = $("#currentTime").val(year+"년 "+(month+1)+"월 "+date+"일 | "+hours+":"+
		// 					minutes+":"+seconds);
		// 			currentTime = year+"년 "+(month+1)+"월 "+date+"일 | "+hours+":"+
		// 					minutes+":"+seconds;
		currentTime = "" + year + (month + 1) + date + hours + minutes
				+ seconds;
		
		nowT = moment().format('YYYY-MM-DD HH:mm:ss');
		
		$(".currentTime1").val("현재시간 : "+nowT);
		$(".currentTime2").val("현재시간 : "+nowT);
		
		// 사용중인 좌석 색깔 표시
		var data = "";
		<c:forEach var="rdto" items="${list}">
		data = ${rdto.seatId};
		
		$("#seat" + data).css("background", "#bb0000");
			
		
		</c:forEach>
		
		//사용가능 좌석수 
		var list = ${fn:length(list)};
		$("#seatStatus").html("총 좌석 : 66석 || 사용가능 좌석 : "+(66-list));
	});

	$(function() {
		$(".seatNum").click(function() {
			var seatNum;
			var seatId;
			var rCount = ${rCount};
			seatNum = $(this).text();
			 
			 <c:forEach var="rdto" items="${list }">
			// 현재 내가 누른 div의 text

			seatId = ${rdto.seatId};
			if(parseInt(seatNum) == seatId){
 				alert("다른 회원이 좌석을 사용중입니다");
 				return;
			}else if(rCount>=1){
				alert("이미 자리를 사용중입니다")
				return;
			}
 			</c:forEach>	
 			$("#selectSeatWrapper").animate({
 				width : 1900
 			}, 250);
 			$("#selectSeat").animate({
 				width : 600,
 				height : 500
 			},0);
 			$("#selectSeat").css("display", "block");
		})
	});

// 	자리 사용 div 없애는 메소드
	$(function() {
		$(".xi-close-square-o").click(function() {
			$("#selectSeatWrapper").animate({
				width : 0
			}, 250);
			$("#selectSeat").animate({
				width : 0
			}, 500);
			$("#selectSeat").css("display", "none");
			
			cntMin = 0;
			$(".hour").val("0시간");
			$("minute").val("0분");
		})
	})
	
	$(function() {
// 		자리 선택시 새div에 자리 번호 주는 메소드
		var userId="";
		$(".seatNum").on("click", function() {
			var seatNum = $(this).text();
			$("#selectedSeatNum").val(+seatNum);
						 
		});
		$("#signOutWrapper").on("click",function(){
			
		})
	});
</script>


</head>
<body>

	<sec:authentication var="principal" property="principal" />
	<div id="readingRoomWholeWrapper">
		<form action="selectSeat" name="frm" method="GET">
			<div id="selectSeatWrapper">
				<div id="selectSeat">
					<div id="selectSeatTop">
						<div id="selectedSeat">
						<label for="userName"> 사용자 : </label>
						<input type="text" id="userName" class="userName" name="userName"
							value="${principal.username}" /> 
						<label for="selectedSeatNum">자리 번호 : </label>
						<input type="text" id="selectedSeatNum" name="seatId" readonly="readonly" />
						</div>
						<div id="closeIcon">
							<i class="xi-close-square-o xi-3x"></i>
						</div>
					</div>
					<div id="selectSeatBody">
							<div id="selectSeatBodyTop">
							<div class="hourDiv"><input type="text" class="hour" readonly="readonly" value="0시간"/></div>
							<div class="colonDiv"><input type="text" class="colon" value=" : " readonly="readonly" /></div>
							<div class="minuteDiv"><input type="text" class="minute" readonly="readonly" value="0분"/></div>
							<div class="rClockBtnDiv">
								<input type="button" class="rClockBtn1" value="up" />
								<input type="button" class="rClockBtn2" value="down" /> 
							</div>
							</div>
							
							<div id="selectSeatBodySETime">
							<div class="currentTimeDiv"><input type="text" id="selectSeatCurrentTime" class="currentTime2" name="startTime" readonly="readonly"/></div> 
							<div class="endTimeDiv"><input type="text" id="selectSeatEndTime" class="endTime" name="endTime" readonly="readonly" value="사용시간 : 2020-00-00 00:00:00"/></div>
							</div>
							
							<div class="regBtn1Div">
							<input type="button" class="regBtn1" value="사용하기" />
							</div>
							
							
							<input type="hidden" name="status" value="1" />
							<input type="hidden" name="rentSeatId" value="1" />

					</div>
				</div>
			</div>
		</form>
		<div id="readingRoomWrapper">
			<div id="readingRoomHeadWrapper">
				<div id="libLogo">
				  <a href="main"> <img src="img/mainPage/logo1.png" alt="errrr"></a>
				</div>
				<div id="readingRoomTitle">중앙 도서관 제1열람실</div>
				<div id="right">
					<div id="userInfo">${principal.username}님</div>
					<div id="currentTimeWrapper">
						<input id="currentTime" type="text" class="currentTime1" />
					</div>
				</div>
			</div>
			<div id="seatInfo">
				<div id="seatStatus">"총좌석 : 66 &nbsp;|| 사용 가능좌석: "</div>
				<div id="seatType">사용 가능 : <input type="text" id="seatAvail"/>&nbsp;&nbsp;|| 사용 중 : <input type="text" id="seatNotAvail"/></div>
			</div>


			<div id="readingRoomBodyWrapper">

				<div id="seatChart">
					<div class="seatChartGroup">
						<div class="seatNum" id="seat1">1</div>
						<div class="seatNum" id="seat24">24</div>
						<div class="seatNum" id="seat2">2</div>
						<div class="seatNum" id="seat23">23</div>
						<div class="seatNum" id="seat3">3</div>
						<div class="seatNum" id="seat22">22</div>
					</div>
					<div class="seatChartGroup">
						<div class="seatNum" id="seat25">25</div>
						<div class="seatNum" id="seat48">48</div>
						<div class="seatNum" id="seat26">26</div>
						<div class="seatNum" id="seat47">47</div>
						<div class="seatNum" id="seat27">27</div>
						<div class="seatNum" id="seat46">46</div>
					</div>
					<div class="seatChartGroup">
						<div class="seatNum" id="seat49">49</div>
						<div class="seatNum" id="seat66">66</div>
						<div class="seatNum" id="seat50">50</div>
						<div class="seatNum" id="seat65">65</div>
						<div class="seatNum" id="seat51">51</div>
						<div class="seatNum" id="seat64">64</div>
					</div>
					<div class="seatChartGroup">
						<div class="seatNum" id="seat4">4</div>
						<div class="seatNum" id="seat21">21</div>
						<div class="seatNum" id="seat5">5</div>
						<div class="seatNum" id="seat20">20</div>
						<div class="seatNum" id="seat6">6</div>
						<div class="seatNum" id="seat19">19</div>
					</div>
					<div class="seatChartGroup">
						<div class="seatNum" id="seat28">28</div>
						<div class="seatNum" id="seat45">45</div>
						<div class="seatNum" id="seat29">29</div>
						<div class="seatNum" id="seat44">44</div>
						<div class="seatNum" id="seat30">30</div>
						<div class="seatNum" id="seat43">43</div>
					</div>
					<div class="seatChartGroup">
						<div class="seatNum" id="seat52">52</div>
						<div class="seatNum" id="seat63">63</div>
						<div class="seatNum" id="seat53">53</div>
						<div class="seatNum" id="seat62">62</div>
						<div class="seatNum" id="seat54">54</div>
						<div class="seatNum" id="seat61">61</div>
					</div>
					<div class="seatChartGroup">
						<div class="seatNum" id="seat7">7</div>
						<div class="seatNum" id="seat18">18</div>
						<div class="seatNum" id="seat8">8</div>
						<div class="seatNum" id="seat17">17</div>
						<div class="seatNum" id="seat9">9</div>
						<div class="seatNum" id="seat16">16</div>
					</div>
					<div class="seatChartGroup">
						<div class="seatNum" id="seat31">31</div>
						<div class="seatNum" id="seat42">42</div>
						<div class="seatNum" id="seat32">32</div>
						<div class="seatNum" id="seat42">42</div>
						<div class="seatNum" id="seat33">33</div>
						<div class="seatNum" id="seat40">40</div>
					</div>
					<div class="seatChartGroup">
						<div class="seatNum" id="seat55">55</div>
						<div class="seatNum" id="seat60">60</div>
						<div class="seatNum" id="seat56">56</div>
						<div class="seatNum" id="seat59">59</div>
						<div class="seatNum" id="seat57">57</div>
						<div class="seatNum" id="seat58">58</div>
					</div>
					<div class="seatChartGroup">
						<div class="seatNum" id="seat10">10</div>
						<div class="seatNum" id="seat15">15</div>
						<div class="seatNum" id="seat11">11</div>
						<div class="seatNum" id="seat14">14</div>
						<div class="seatNum" id="seat12">12</div>
						<div class="seatNum" id="seat13">13</div>
					</div>
					<div class="seatChartGroup">
						<div class="seatNum" id="seat34">34</div>
						<div class="seatNum" id="seat39">39</div>
						<div class="seatNum" id="seat35">35</div>
						<div class="seatNum" id="seat38">38</div>
						<div class="seatNum" id="seat36">36</div>
						<div class="seatNum" id="seat37">37</div>
					</div>
					<div id="signOutWrapper">
						<a href="rCancel">퇴실</a>
					</div>

				</div>


			</div>







		</div>
		<!-- 	studyRoomWrapper -->
	</div>

	<!-- readingRoomWholeWrapper -->

</body>
</html>