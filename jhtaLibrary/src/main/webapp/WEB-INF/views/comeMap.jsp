<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
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



<head>
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

#map {
	height: 400px;
	width: 100%;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%@include file="header.jsp"%>
	<div id="mainWrapper">
		<%@include file="sideBar.jsp"%>
		<div class="all_contents">
			<%@include file="contentTitle.jsp"%>

			<div id="map"></div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7395bf3a491cc0fc6d8f0aa2f098f13"></script>
			<script>
				var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
				var options = { //지도를 생성할 때 필요한 기본 옵션
					center : new kakao.maps.LatLng(37.5729361, 126.9922303), //지도의 중심좌표.
					level : 5
				//지도의 레벨(확대, 축소 정도)
				};
				var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
				// 마커를 표시할 위치와 title 객체 배열입니다 
				var positions = [
				    {
				        title: '도서관', 
				        latlng: new kakao.maps.LatLng(37.5729361, 126.9922303)
				    }
				];
				
				// 마커 이미지의 이미지 주소입니다
				var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
				    
				for (var i = 0; i < positions.length; i ++) {
				    
				    // 마커 이미지의 이미지 크기 입니다
				    var imageSize = new kakao.maps.Size(24, 35); 
				    
				    // 마커 이미지를 생성합니다    
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
				    
				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: positions[i].latlng, // 마커를 표시할 위치
				        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				        image : markerImage // 마커 이미지 
				    });
				}
			</script>

		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>