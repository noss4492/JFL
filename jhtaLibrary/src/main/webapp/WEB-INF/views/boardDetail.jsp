<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
body {
            font-family: 'Noto Sans', '나눔고딕', 'Nanum Gothic', 'Helvetica', sans-serif;
        }

        h1,
        h2,
        h3,
        h4,
        h5,
        p,
        div,
        span,
        ul,
        li,
        ol,
        img,
        a,
        a:visited {
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
        .board{
            width: 880px;    
            position: relative;
        }
        .innerDesc{
            width: 880px;
            height: 140px;
            position: relative;
            background-image: url(img/bg_pattern.png);
            padding: 7px;
            margin-bottom: 35px;
        }
        .innerBox{
            width: 100%;
            height: 126px;
            background-color: white;
            padding: 13px 0;
            display: table;
        }
        .imgBox{
            position: absolute;
            top: 50%;
            left: 30px;
            margin-top: -50px;
        }
        .innerImg{
            vertical-align: middle;
            image-rendering: auto;
            float: left;
            max-width: 100%;
            max-height: 100%;
            display: table-cell;
            width: 100%;
            height: 100px;
        }
        .textBox{
            word-break: keep-all;
            vertical-align: middle;
            color: #777;
            display: table-cell;
            width: 100%;
            height: 100px;
            padding-left: 150px;
            word-break: keep-all;
        }
        .innerText{
            font-size: 17px;
            font-weight: bold;
            color: #464646;
        }
        .board{
            position:relative;
        }
        .boardTable{
            table-layout: fixed;
            width: 880px;
            border-top: 2px solid #666;
            empty-cells: show;
        }
        .boardTable tr{
            border-bottom: 1px solid #E2E2E2;
        }
        .board>h4{
            font-size: 25px;
            color: #002828;
            margin-bottom: 20px;
        }
        .boardTable tr>th{
            padding:10px 6px;
            text-align: center;
            width: 164px;
            font-size: 17px;
            color: #464646;
        }
        .boardTable tr>td{
            padding:10px 6px;
            font-size: 17px;
            color: #777777;
            width: 704px;
            padding: 10px 6px 10px 20px;
        }
        .boardTable .content{
            padding: 20px;
            word-wrap: break-word;
        }
        .btn-group{
            width: 100%;
            height: 38px;
            margin: 40px auto;
            text-align: center;
        }
        .list-btn{
            display: inline-block;
            padding: 5px 15px;
            color: #fff;
            text-align: center;
            letter-spacing: -1px;
            vertical-align: middle;
            box-sizing: border-box;
            border-radius: 0%;
            width: 105px;
            height: 38px;
            font-size: 18px;
            background-color: #555;
        }
        
        .modify, .delete{
        	width: 80px;
        	border: none;
        }
        .modify{
        	background-color: #4DA5FF;
        }
        .delete{
        	background-color: #44BBFF;
        }
        
</style>
<script>

	function del(seq){
		var chk = confirm("정말 삭제하시겠습니까?");
		if(chk){
			location.href="./delete?bno="+seq;
		}
	}
	function modify(bno){
		var chk = confirm("수정하시겠습니까?");
		if(chk){
			location.href="./modifyForm?bno="+bno;
		}
	}

</script>
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
                    <img class = "innerImg" src="img/ico_summary_customer.png" alt="">
                </div>
                <div class="textBox">
                    <p class="innerText">
                        도서관 이용 시 궁금한 사항 또는 건의사항을 작성하는 곳입니다.
                        <br>
                        타인의 명예훼손, 욕설, 비방과 상업적 광고, 홍보 등의 글은 사전 통보 없이 삭제될 수 있습니다.
                    </p>
                </div>
            </div>
        </div>
        <h4>문의글</h4>
        <div class="boardWrap">
            <table class="boardTable">
                <tr>
                    <th>등록일</th>
                    <td>${dto.createdDate }</td>
                </tr>
                <tr>
                    <th>글쓴이</th>
                    <td>${dto.name }</td>
                </tr>
                <!-- <tr>
                    <th>첨부파일</th>
                    <td></td>
                </tr> -->
                <tr>
                    <th>제목</th>
                    <td>${dto.title }</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td class="content">${dto.content}</td>
                </tr>
            </table>
        </div>
        <div class="btn-group">
            <a href="./list?currentPageNo=${currentPageNo }" class="list-btn">목록</a>
            <c:if test="${boardUserId eq userId }">
	            <input type="button" onclick="modify(${dto.articleId})" class="list-btn modify" value="수정"/>
	            <input type="button" onclick="del(${dto.articleId})" class="list-btn delete" value="삭제"/>
            </c:if>
        </div>
        <!-- <h4>답변</h4>
        <div class="boardWrap">
            <table class="boardTable">
                <tr>
                    <th>답변일</th>
                    <td>2019-12-06</td>
                </tr>
                <tr>
                    <th>답변내용</th>
                    <td class="content">안녕하세요?

                        화도도서관입니다.
                        
                         
                        
                        1월 희망도서는 구입되어 소장중입니다.  기재상 누락되어  "소장중" 상태로 변경되지 못한 점 대단히 죄송하게 생각합니다.
                        
                        신청하신 희망도서는 지난 2월에 구입되어 시스템상 "대출" 안내 문자가 선생님께 발송되었고, 현재 도서관에 소장중입니다.
                        
                         
                        
                        앞으로 지적해주신 사항에 대해서 개선하여 보다 나은 서비스를 제공하도록 하겠습니다.
                        
                        감사합니다.
                    </td>
                </tr>
            </table>
        </div> -->
    </div>
   
         
      </div>
   </div>
   <%@include file="footer.jsp"%>
</body>
</html>