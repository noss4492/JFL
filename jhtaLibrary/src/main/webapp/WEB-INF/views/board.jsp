<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>board</title>
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
<style>
body {
	font-family: 'Noto Sans', '나눔고딕', 'Nanum Gothic', 'Helvetica',
		sans-serif;
}

h1, h2, h3, h4, h5, p, div, span, ul, li, ol, img, a, a:visited {
	margin: 0px;
	padding: 0px;
}

a {
	text-decoration: none;
	color: inherit;
}

a:hover {
	text-decoration: none;
	color: inherit;
}

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

.board {
	width: 880px;
	position: relative;
}

.innerDesc {
	width: 880px;
	height: 140px;
	position: relative;
	background-image: url(img/bg_pattern.png);
	padding: 7px;
	margin-bottom: 35px;
}

.innerBox {
	width: 100%;
	height: 126px;
	background-color: white;
	padding: 13px 0;
	display: table;
}

.imgBox {
	position: absolute;
	top: 50%;
	left: 30px;
	margin-top: -50px;
}

.innerImg {
	vertical-align: middle;
	image-rendering: auto;
	float: left;
	max-width: 100%;
	max-height: 100%;
	display: table-cell;
	width: 100%;
	height: 100px;
}

.textBox {
	word-break: keep-all;
	vertical-align: middle;
	color: #777;
	display: table-cell;
	width: 100%;
	height: 100px;
	padding-left: 150px;
	word-break: keep-all;
}

.innerText {
	font-size: 17px;
	font-weight: bold;
	color: #464646;
}

/* 검색 바 */
.SearchBar {
	overflow: hidden;
	margin-bottom: 35px;
	padding: 10px;
	text-align: center;
	background-color: #f2f2f2;
}

.searchForm {
	display: inline-block;
	vertical-align: top;
}

.searchForm>select {
	height: 36px;
	padding-right: 26px;
	padding-left: 10px;
	line-height: 36px;
	border: 1px solid #ddd;
	border-radius: 0;
	box-sizing: border-box;
	vertical-align: middle;
	-webkit-appearance: none;
}

.searchForm>select>option {
	font-weight: normal;
	display: block;
	white-space: pre;
	min-height: 1.2em;
	padding: 0px 2px 1px;
}

.searchForm>input {
	height: 36px;
	min-width: 480px;
	padding: 0 4px;
	line-height: 34px;
	border: 1px solid #ddd;
	vertical-align: middle;
	box-sizing: border-box;
}

.searchForm>a {
	display: inline-block;
	min-width: 75px;
	padding: 0 10px;
	line-height: 36px;
	border: 0;
	color: #fff;
	text-align: center;
	letter-spacing: -1px;
	vertical-align: middle;
	box-sizing: border-box;
	background-color: #555;
}
/* 보드 바디 */
.tableWrapper {
	width: 880px;
	table-layout: fixed;
	border-top: 2px solid #666;
	empty-cells: show;
}

.tableWrapper>table>tr>th {
	text-align: center;
}

.tableWrapper>table tr>th:nth-child(1) {
	width: 60px;
}

.tableWrapper>table tr>th:nth-child(2) {
	width: 396px;
}

.tableWrapper>table tr>th:nth-child(3) {
	width: 114px;
}

.tableWrapper>table tr>th:nth-child(4) {
	width: 120px;
}

.tableWrapper>table tr>th:nth-child(5) {
	width: 120px;
}

.tableWrapper>table tr>th:nth-child(6) {
	width: 70px;
}

.tableWrapper th, .tableWrapper td {
	padding: 7px 5px;
}

.tableWrapper th {
	border-bottom: 1px solid #666;
	font-size: 17px;
	height: 51px;
	color: #464646;
	text-align: center;
}

.tableWrapper td {
	text-align: center;
	font-size: 16px;
	height: 51px;
	border-bottom: 1px solid #e2e2e2;
	color: #777;
}

.tableWrapper td:nth-child(2) {
	text-align: left;
}

.pagingWrapper {
	margin-top: 40px;
}

.paging {
	text-align: center;
	position: relative;
}

.paging a, .paging span {
	display: inline-block;
	width: 32px;
	font-size: 18px;
	color: #777;
	line-height: 32px;
	text-align: center;
	vertical-align: top;
}

.p-first, .p-prev, .p-next, .p-last {
	width: 30px;
	height: 30px;
	line-height: 30px;
	border: 1px solid #ddd;
	background: url(./img/arr_sp.png) 50% 0 no-repeat;
}

.p-prev {
	margin-right: 5px;
	background-position-y: -27px;
}

.p-next {
	margin-left: 5px;
	background-position-y: -51px;
}

.p-last {
	background-position-y: -77px;
}

.write {
	width: 98px;
	height: 32px;
	font-size: 16px;
	bottom: 0;
	right: 0;
	color: #fff;
	background-color: #46B7D9;
	text-align: center;
	letter-spacing: -1px;
	vertical-align: middle;
	box-sizing: border-box;
	text-align: center;
	letter-spacing: -1px;
	vertical-align: middle;
	box-sizing: border-box;
	padding: 0 15px;
	line-height: 32px;
	position: absolute;
}
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<div id="mainWrapper">
		<%@include file="sideBar.jsp"%>
		<div class="all_contents">
			<%@include file="contentTitle.jsp"%>
			<div class="board">
				<div class="innerDesc">
					<div class="innerBox">
						<div class="imgBox">
							<img class="innerImg" src="img/ico_summary_customer.png" alt="">
						</div>
						<div class="textBox">
							<p class="innerText">
								도서관 이용 시 궁금한 사항 또는 건의사항을 작성하는 곳입니다. <br> 타인의 명예훼손, 욕설, 비방과
								상업적 광고, 홍보 등의 글은 사전 통보 없이 삭제될 수 있습니다.
							</p>
						</div>
					</div>
				</div>
				<div class="SearchBar">
					<div class="searchForm">
						<select name="" id="">
							<option value="title">제목</option>
							<option value="contents">내용</option>
						</select> <input type="text" name="" id="" placeholder="검색어를 입력해 주세요">
						<a href="" id="searchBtn">검색</a>
					</div>
				</div>
				<div class="tableWrapper">
					<table>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>조회수</th>
							<th>답변</th>
						</tr>
						<tr>
							<td>451</td>
							<td><a href="#">홈페이지 개편 후 교보문고 전자도서관 이용불가</a></td>
							<td>심**</td>
							<td>2020-02-26</td>
							<td>9</td>
							<td>완료</td>
						</tr>
						<tr>
							<td>451</td>
							<td><a href="#">홈페이지 개편 후 교보문고 전자도서관 이용불가</a></td>
							<td>심**</td>
							<td>2020-02-26</td>
							<td>9</td>
							<td>완료</td>
						</tr>
					</table>
				</div>
				<div class="pagingWrapper">
					<p class="paging">
						<a href="" class="p-first"></a> <a href="" class="p-prev"></a> <span>1</span>
						<a href="">2</a> <a href="">3</a> <a href="">4</a> <a href="">5</a>
						<a href="">6</a> <a href="">7</a> <a href="">8</a> <a href="">9</a>
						<a href="">10</a> <a href="" class="p-next"></a> <a href=""
							class="p-last"></a>
					</p>
				</div>
				<a href="" class="write"><span class="xi-pen"></span>글쓰기</a>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>