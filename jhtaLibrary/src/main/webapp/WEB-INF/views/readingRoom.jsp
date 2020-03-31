<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>studyRoom.jsp</title>
<link rel="stylesheet" href="resources/css/readingRoom.css" />
<script>
		window.onload=setInterval(function printTime(){
			var today = new Date();
			
			var year = today.getFullYear();
			var month = today.getMonth();
			var date = today.getDate();
//	 		var day = today.Day();
			var hours = today.getHours();
			var minutes = today.getMinutes();
			var seconds = today.getSeconds();
			document.getElementById("currentTime").innerHTML = year+"년 "+(month+1)+"월 "+date+"일 | "+hours+":"+
																minutes+":"+seconds;
		});
	
		

</script>
<style>
#reserveSeatWrapper{
	width: 1920px;
	height: 800px;
	background: black;
	background-color: black;
	position: relative;
	z-index: 9999;
	
	
/* 	display: hidden; */
}
#reserveSeat{
	width: 800px;
	height: 500px;
}
</style>
</head>
<body>
	<div id="reserveSeatWrapper">
		<div id="reserveSeat">
			
		</div>
	</div>
	<div id="readingRoomWholeWrapper">
		<div id="readingRoomWrapper">
			<div id="readingRoomHeadWrapper">
				<div id="libLogo">
                    <img src="../image/logo.png" alt="">
                </div>
				<div id="readingRoomTitle">
                   		 화도도서관 제1열람실
                </div>
				<div id="right">
                    <div id="userInfo">
                       <sec:authentication var="principal" property="principal" />
						${principal.username}님
                    </div>
                    <div id="currentTime">
                      
                    </div>
                </div>
			</div>
                    <div id="seatInfo">
                        <div id="seatStatus">
                            총좌석   164  사용중   0  사용가능   164 좌석
                        </div>
                        <div id="seatType">
                            배정가능좌석사용중장애인석수리중
                        </div>
                    </div>


			<div id="readingRoomBodyWrapper">
				<div id="seatChart">
                    <div class="seatChartGroup">
                        <div class="seatNum">1</div>
                        <div class="seatNum">24</div>
                        <div class="seatNum">2</div>
                        <div class="seatNum">23</div>
                        <div class="seatNum">3</div>
                        <div class="seatNum">22</div>
                    </div>
                    <div class="seatChartGroup">
                        <div class="seatNum">25</div>
                        <div class="seatNum">48</div>
                        <div class="seatNum">26</div>
                        <div class="seatNum">47</div>
                        <div class="seatNum">27</div>
                        <div class="seatNum">46</div>
                    </div>
                    <div class="seatChartGroup">
                        <div class="seatNum">49</div>
                        <div class="seatNum">66</div>
                        <div class="seatNum">50</div>
                        <div class="seatNum">65</div>
                        <div class="seatNum">51</div>
                        <div class="seatNum">64</div>
                    </div>
                    <div class="seatChartGroup">
                        <div class="seatNum">4</div>
                        <div class="seatNum">21</div>
                        <div class="seatNum">5</div>
                        <div class="seatNum">20</div>
                        <div class="seatNum">6</div>
                        <div class="seatNum">19</div>
                    </div>
                    <div class="seatChartGroup">
                        <div class="seatNum">28</div>
                        <div class="seatNum">45</div>
                        <div class="seatNum">29</div>
                        <div class="seatNum">44</div>
                        <div class="seatNum">30</div>
                        <div class="seatNum">43</div>
                    </div>
                    <div class="seatChartGroup">
                        <div class="seatNum">52</div>
                        <div class="seatNum">63</div>
                        <div class="seatNum">53</div>
                        <div class="seatNum">62</div>
                        <div class="seatNum">54</div>
                        <div class="seatNum">61</div>
                    </div>
                    <div class="seatChartGroup">
                        <div class="seatNum">7</div>
                        <div class="seatNum">18</div>
                        <div class="seatNum">8</div>
                        <div class="seatNum">17</div>
                        <div class="seatNum">9</div>
                        <div class="seatNum">16</div>
                    </div>
                    <div class="seatChartGroup">
                        <div class="seatNum">31</div>
                        <div class="seatNum">42</div>
                        <div class="seatNum">32</div>
                        <div class="seatNum">42</div>
                        <div class="seatNum">33</div>
                        <div class="seatNum">40</div>
                    </div>
                    <div class="seatChartGroup">
                        <div class="seatNum">55</div>
                        <div class="seatNum">60</div>
                        <div class="seatNum">56</div>
                        <div class="seatNum">59</div>
                        <div class="seatNum">57</div>
                        <div class="seatNum">58</div>
                    </div>
                    <div class="seatChartGroup">
                        <div class="seatNum">10</div>
                        <div class="seatNum">15</div>
                        <div class="seatNum">11</div>
                        <div class="seatNum">14</div>
                        <div class="seatNum">12</div>
                        <div class="seatNum">13</div>
                    </div>
                    <div class="seatChartGroup">
                        <div class="seatNum">34</div>
                        <div class="seatNum">39</div>
                        <div class="seatNum">35</div>
                        <div class="seatNum">38</div>
                        <div class="seatNum">36</div>
                        <div class="seatNum">37</div>
                    </div>
                    <div id="selectSeat">
                    	<form action="#">
                    	<input type="text" value="" name="selectedSeat"/>
                    	<input type="submit" value="예약하기" />
                    	</form>
                    </div>
                </div>             
    
				<div id="miniMap">
				</div>
			</div>



            





		</div><!-- 	studyRoomWrapper -->
	</div><!-- readingRoomWholeWrapper -->
</body>
</html>