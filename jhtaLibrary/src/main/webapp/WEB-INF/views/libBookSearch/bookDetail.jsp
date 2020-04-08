<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
<link rel="stylesheet" href="../css/header.css">
<script src="../js/viewjs/header.js" type="text/javascript"></script>
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

    .book_detail_wrapper{
        width: 880px;
        padding-top: 50px;
    }
    .resultViewDetail{
        border: 2px solid black;
        border-radius: 5px;
        background-color: white;
        margin-bottom: 30px;
        position: relative;
    }
    .book_title{
        position: relative;
        padding: 10px 15px;
        background-color: #f4f4f4;
    }   
    .cate{
        display: inline-block;
        min-width: 40px;
        margin: 0 4px 0 0;
        padding: 0 3px;
        font-size: 15px;
        line-height: 22px;
        text-align: center;
        border: 1px solid #c8c8c8;
        background: linear-gradient(to bottom, #f2f2f2 0%,#ffffff 100%);
    }
    .book_title>h4{
        display: inline-block;
    }
    .book_detail{
        position: relative;
        min-height: 210px;
        padding: 20px;
    }
    .bookData{
        margin-left: 190px;
        margin-right: 90px;
    }
    .thumb{
        position: absolute;
        top: 20px;
        left: 20px;
    }
    .bookData table{
        width: 100%;
        font-size: 16px;
    }
    .bookData th{
        width: 20%;
        font-weight: 300;
        color: #333;
        text-align: left;
    }
    .bookData td{
        padding: 3px 0;
        line-height: 1.3;
        vertical-align: text-top;
        word-break: normal;
    }
    .btngroup{
        text-align: center;
        padding: 40px 0;
    }
    .descTitle{
        margin-top: 30px;
        margin-bottom: 8px;
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
            line-height: 30px;
        
        }
    .tblWrap{
        border-top: 2px solid #666;
        width: 100%;
    }
    .tblWrap table{
        width: 100%;
        font-size: 16px;
        color: #464646;
    }
    .tblWrap th, .tblWrap td{
            padding: 10px 5px;
            color: #464646;
            text-align: center;
            border-bottom: 1px solid #e2e2e2;
        width: 20%;
    }
    .tblWrap th{
            font-weight: normal;
    background-color: #f8f8f8;
    }
    .tth{
            border-left: 1px solid #e2e2e2;
    }
        .modify, .delete{
            width: auto;
           border: none;
        }
        .modify{
           background-color: #4DA5FF;
        }
        .delete{
           background-color: #44BBFF;
        }
</style>
</head>
<body>
   <%@include file="../header.jsp"%>
   <div id="mainWrapper">
      <%@include file="../sideBar.jsp"%>
      <div class="all_contents">
         <%@include file="../contentTitle.jsp"%>
         <div class="book_detail_wrapper">
            <div class="resultViewDetail">
                <div class="book_title">
                    <span class="cate">
                        도서
                    </span>
                    <h4>
                        ${gbdto.title }
                    </h4>
                </div>
                <div class="book_detail">
                    <div class="thumb">
                        <span>
                            <img src="${gbdto.thumbnailUrl}" alt="">
                        </span>
                    </div>
                    <div class="bookData">
                        <table>
                            <tbody>
                                <tr>
                                    <th>장르</th>
                                    <td>${gbdto.genre }</td>
                                </tr>
                                <tr>
                                    <th>제목</th>
                                    <td>${gbdto.title }</td>
                                </tr>
                                <tr>
                                    <th>상세사이트</th>
                                    <td><a href="${gbdto.detailUrl }">이동</a></td>
                                </tr>
                                <tr>
                                    <th>출간일</th>
                                    <td>${gbdto.publicationDate }</td>
                                </tr>
                                <tr>
                                    <th>출판사</th>
                                    <td>${gbdto.publisher }</td>
                                </tr>
                                <tr>
                                    <th>저자명</th>
                                    <td>
							        <c:forEach items="${aList }" var="authorName" varStatus="ix">
										${authorName } 
										<%-- <c:if test="${ix+1} != ${fn:length(aList)}">, </c:if> --%>
									</c:forEach>
									</td>
                                </tr>
                                <tr>
                                    <th>표준번호</th>
                                    <td>${gbdto.generalBookId }</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    
                </div>
            </div>
            <div class="bookDesc">
                <h4 class="descTitle">상세 정보</h4>
                <div class="desc">
                    ${gbdto.description }
                </div>
            </div>
            <h4 class="descTitle">소장정보</h4>
            <div class="tblWrap">       
             <table>
                    <thead>
                        <tr>
                            <th>선택</th>
                            <th class="tth">대출상태</th>
                            <th class="tth">등록번호</th>
                            <th class="tth">반납예정일</th>
                            <th class="tth">등록일</th>
                            <th>대여하기</th>                            
                        </tr>
                    </thead>
                    <tbody>
                    <!-- 요 폼 액션은 즐겨찾기로 보내야하고 바로 대여 버튼은 링크로 보내야하겠음. 밥먹고 수정 ㄱㄱ -->
                    	<form action="<c:url value="/book/borrow"/>" onsubmit="call();" name="frm">
						<input type="hidden" name="isbn" value="${gbdto.generalBookId }" />
						<c:forEach items="${lbdtoList }" var="lbdto" varStatus="idx" begin="0" step="1">
                    	<tr>
							<th class="tth">  <input type="checkbox" name="libraryBookId" value="${lbdto.libraryBookId }" /> </th>
		                    <td class="tth">
		                    <c:choose>
								<c:when test="${lbdto.status == 1 }">
								대여중
								</c:when>
								<c:when test="${lbdto.status == 2 }">
								대여중(연체)
								</c:when>
								<c:when test="${lbdto.status == 3 }">
								대여중(예약)
								</c:when>
								<c:when test="${lbdto.status == 4 }">
								분실
								</c:when>
								<c:otherwise>
								대여가능
								</c:otherwise>
							</c:choose>
							</td>
							<th class="tth"> ${lbdto.libraryBookId } </th>	 
							<th class="tth"> - </th>	
							<!-- 
							<c:choose>
								<c:when test="${borrowedBookEndDate eq null }">
									<th class="tth"> 보유중 </th>							
								</c:when>
								<c:otherwise>
									<th class="tth"> <c:out value="${borrowedBookEndDate.get(idx)}"/> }</th>															
								</c:otherwise>
							</c:choose>			
							 -->
							<th class="tth"> ${lbdto.registrationDate } </th>							
							<th class="tth"> <input type="submit" value="책 대여하기" /> </th>
                        </tr>
		            </c:forEach>
					</form>
                    </tbody>
                </table>
            </div>
                            
		
		
			

		
               
                          
                            
            <div class="btngroup">
               <input type="button" class="list-btn modify" value="관심자료담기"/>
                <a class="list-btn delete">관심자료보기</a>
                <a href="" class="list-btn">목록</a>
            </div>
         </div>
      </div>
   </div>
   <%@include file="../footer.jsp"%>
</body>
</html>