<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
</head>


<style>
body {
	font-family: 'Noto Sans', '나눔고딕', 'Nanum Gothic', 'Helvetica',
		sans-serif;
}
/*전체 폰트 설정*/
h1, h2, h3, h4, h5, p, div, span, ul, li, ol, img, a, a:visited {
	margin: 0px;
	padding: 0px;
}
/*margin padding 0 설정*/
#footer_wrap {
	width: 1200px;
	margin: 0px auto;
}
/*footer 전체 감싸는 폼 CSS*/
.footer_container {
	width: 1200px;
}
/*footer 헤더 폼 CSS */
#footer_session_four {
	width: 1200px;
	height: 70px;
	color: #464646;
	font: 12px;
	background: #F5F5F5;
}

.footer_group_f::after {
	content: "";
	display: block;
	clear: both;
}

.footer_group_f {
	position: relative;
	max-width: 1200px;
	margin: 0 auto;
	height: 70px;
}

.footer_banner {
	width: 1200px;
	height: 70px;
	position: relative;
	padding: 20px 0 20px 90px;
	line-height: 28px;
}

.footer_banner h4 {
	position: absolute;
	top: 25px;
	left: 10px;
	width: 90px;
	color: #333;
	font-size: 1.286em;
	font-weight: normal;
}

.footer_Area {
	overflow: hidden;
	position: absolute;
	top: 20px;
	left: 90px;
	width: 98px;
	height: 34px;
}

.footer_Area a {
	color: #666666;
	float: left;
	width: 27px;
	height: 30px;
	margin: 0px auto;
}

.footer_Area
 
a
 
.{
color
:
 
#666666
;

	
float
:
 
left
;

	
width
:
 
29
px
;

	
height
:
 
30
px
;

	
margin
:
 
0
px
 
auto
;


}
.footer_zone {
	width: 990px;
	height: 30px;
	overflow: hidden;
	margin-left: 120px;
}

.footer_list {
	width: 1240px;
	height: 30px;
	margin-left: 0px;
}

#footer {
	width: 1200px;
	height: 192px;
	padding-bottom: 30px;
}

.footer_list {
	overflow: hidden;
	height: 30px;
}

.footer_list>li {
	float: left;
	padding: 0px 15px;
	list-style: none;
}

.footer_list>li+li {
	position: relative;
}

.footer_list li>a {
	color: #333333;
	font-size: 18px;
}

.fnb {
	width: 1200px;
	height: 62px;
	padding: 0;
	background: #fff;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	position: relative;
}

.fnb b {
	font-weight: bold;
	color: #000;
}

.fnb ul {
	position: relative;
	max-width: 1200px;
	margin: 0 auto;
	background: #fff;
	box-sizing: border-box
}

.fnb li {
	list-style: none;
	float: left;
	position: relative;
	line-height: 60px;
	font-size: 1.125em;
	vertical-align: top;
	color: #666;
}

.fnb li+li {
	margin-left: 13px;
	padding-left: 14px;
}

.footer_list a.footer_one::before {
	content: none;
}
/* 배너 모음 앞쪽에 나오는 | 제거 CSS*/
.footer_list a::before {
	content: "";
	display: block;
	position: absolute;
	top: 50%;
	left: 0;
	width: 1px;
	height: 12px;
	margin-top: -6px;
	background-color: #bebebe;
}
/*텍스트 사이에 | 추가 CSS*/
.fnb  li::before {
	content: "";
	position: absolute;
	top: 50%;
	left: 0;
	width: 1px;
	height: 10px;
	margin-top: -5px;
	background-color: #666;
}
/*fnd 텍스트 | 추가 CSS*/
.fnb  li.footer_li_info::before {
	content: none;
}
/*개인정보처리방침 앞에 | 제거 CSS*/
.footer_InnerClearfix {
	width: 1200px;
	height: 50px;
	position: relative;
}

.footer_familysite {
	width: 250px;
	height: 35px;
	position: absolute;
	left: 49%;
	top: 13px; margin-left : 350px;
	padding-right: 20px;
	font-size: 18px;
	margin-left: 350px;
}

.footer_familysite.blind {
	top: 0px;
}

.footer_familysite select {
	display: block;
	width: 230px;
	height: 35px;
	font-size: 18px;
	color: #666;
	line-height: 35px;
	border: 1px solid #666;
	box-sizing: border-box;
	border-radius: 17px;
	padding: 0 20px;
}

.footer_btnGo {
	display: block;
	position: absolute;
	top: 0;
	right: 0;
	width: 50px;
	font-size: 18px;
	color: white;
	line-height: 35.5px;
	text-align: center;
	background: #46B7D9;
	border-radius: 0 17px 17px 0;
	border-left: 1px solid #666;
	padding-right: 3px;
}

.footer_Add{
        width: 1200px;
        position: relative;
        max-width: 1200px;
        overflow: auto;
        margin: 0 auto;
        color: #999;
        box-sizing: border-box;
        margin-top: 50px;
        height: 42px;
        }

.footer_logo {
	position: absolute;
}

    .footer_Add ul.li {
    position: relative;
    margin-right: 1em;
    padding-left: 15px;
    }
    .footer_Add cite{
     display: block;
     line-height: normal;
     text-align: center;
     margin-right: 140px;
    }
.footer_ovh {
	overflow: hidden;
}

.footer_lib {
	text-align: center;
	padding: 0px 0px 0px 50px;
	margin-right: 30px;
}

.play_prev {
	width: 27px;
	height: 30px;
}

.play_pause {
	width: 29px;
	height: 30px;
}

#play_play {
	visibility: hidden;
}

.play_next {
	width: 28px;
	height: 30px;
}
</style>


<body>
	<div id="footer_wrap">
		<!--Footer 전체 아래 부분 -->
		<div class="footer_header"></div>
		<!--Footer 헤더-->
		<div class="footer_container">
			<!--Footer 컨테이너 -->
			<section id="footer_session_four">
				<!--Footer 세션 4 -->
				<div class="footer_group_f">
					<!--Footer 세션 내부-->



					<article class="footer_banner">
						<h4>배너 모음</h4>


						<div class="footer_Area">
							<button id="play_prev">
								<span class="glyphicon glyphicon-chevron-left"></span>
							</button>
							<button id="play_pause">
								<span class="glyphicon glyphicon-pause"></span>
							</button>
							<button id="play_next">
								<span class="glyphicon glyphicon-chevron-right"></span>
							</button>
						</div>
						<!--아이콘 감싸는 영역-->



						<div class="footer_zone">
							<ul class="footer_list">
								<li class="footer_li_one"><a href="" class="footer_one"
									target="_blank">국립중앙도서관</a></li>

								<li><a href="" class="footer_two" target="_blank">문화가있는날</a>
								</li>

								<li><a href="" class="footer_three" target="_blank">개인정보보호종합포털</a>
								</li>

								<li><a href="" class="footer_four" target="_blank">교보문고베스트셀러</a>
								</li>

								<li><a href="" clas="footer_five" target="_blank">중소기업옴부즈만</a>
								</li>

								<li><a href="" class="footer_six" target="_blank">남양주시청</a>
								</li>
							</ul>

						</div>
						<!--배너모음 텍스트 -->




					</article>
					<!--배너 끝-->

				</div>
				<footer id="footer">
					<div class="fnb">
						<ul class="footer_clearfix">
							<li class="footer_li_info"><b>개인정보처리방침</b></li>
							<li>이용약관</li>
							<li>이메일무단수집거부</li>
						</ul>
						<div class="footer_familysite">

							<select name="relatesite" id="relatesite">
								<option value="" selected="selected">관련사이트 바로가기</option>
								<option value="http://www.nl.go.kr/">국립중앙도서관</option>
								<option value="http://www.nanet.go.kr/">국회도서관</option>
							</select> <a href="" class="footer_btnGo">이동</a>

						</div>
					</div>


					<div class="footer_InnerClearfix">

						<div class="footer_Add">
							<div class="footer_logo">
								<img
									src='<c:url value="/img/footerLogo.jpg"/>'>
							</div>
							<ul>
								<li class="footer_ovh"><p class="footer_lib">화도도서관
										&nbsp;&nbsp; 경기도 남양주시 화도읍 수레로1260번길 33 &nbsp; &nbsp; TEL :
										031-590-4587</p>
							</ul>


							<cite>Copyright © 남양주시도서관. ALL RIGHTS RESERVED.</cite>

						</div>
						<!--Footer 텍스트부분-->
					</div>
				</footer>
				<!--Footer 끝-->
			</section>
		</div>
	</div>
</body>
</html>