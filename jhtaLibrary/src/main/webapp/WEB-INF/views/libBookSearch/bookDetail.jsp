<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        물건을 사고파는 곳 시장(우리 알고 세계 보고 3)(양장본 HardCover)
                    </h4>
                </div>
                <div class="book_detail">
                    <div class="thumb">
                        <span>
                            <img src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F546190%3Ftimestamp%3D20200324133440" alt="">
                        </span>
                    </div>
                    <div class="bookData">
                        <table>
                            <tbody>
                                <tr>
                                    <th>장르</th>
                                    <td>어린이(초등)</td>
                                </tr>
                                <tr>
                                    <th>제목</th>
                                    <td>물건을 사고파는 곳 시장(우리 알고 세계 보고 3)(양장본 HardCover)</td>
                                </tr>
                                <tr>
                                    <th>상세사이트</th>
                                    <td><a href="https://search.daum.net/search?w=bookpage&bookId=546190&q=%EB%AC%BC%EA%B1%B4%EC%9D%84+%EC%82%AC%EA%B3%A0%ED%8C%8C%EB%8A%94+%EA%B3%B3+%EC%8B%9C%EC%9E%A5%28%EC%9A%B0%EB%A6%AC+%EC%95%8C%EA%B3%A0+%EC%84%B8%EA%B3%84+%EB%B3%B4%EA%B3%A0+3%29%28%EC%96%91%EC%9E%A5%EB%B3%B8+HardCover%29">이동</a></td>
                                </tr>
                                <tr>
                                    <th>출간일</th>
                                    <td>12/01/15</td>
                                </tr>
                                <tr>
                                    <th>출판사</th>
                                    <td>아이세움</td>
                                </tr>
                                <tr>
                                    <th>저자명</th>
                                    <td>강범석</td>
                                </tr>
                                <tr>
                                    <th>표준번호</th>
                                    <td>9788937845529</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    
                </div>
            </div>
            <div class="bookDesc">
                <h4 calss="descTitle">상세 정보</h4>
                <div class="desc">
                    우리 역사와 문화를 알아 현대사회를 이해할 수 있도록 도움을 주는 「우리알고 세계보고」 시리즈 제3권 『시장(물건을 사고파는 곳)』. 이 책은 물건을 사고 파는 시장이 어떻게 생겨났을지, 시장에서는 어떤 일들이 일어나는지, 시장의 모습은 어떻게 바뀌어 왔는지 소개한다. 왁자지껄한 사람 냄새가 풍기고, 시끌벅적한 시장의 문화를 어린이들에게 친근한 구어체로 들려주고 있다.
                </div>
            </div>
            <h4 class="descTitle">소장정보</h4>
            <div class="tblWrap">
                <table>
                    <thead>
                        <tr>
                            <th>선택</th>
                            <th class="tth">대출상태</th>
                            <th class="tth">청구기호</th>
                            <th class="tth">등록번호</th>
                            <th class="tth">반납예정일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td class="tth">대출가능</td>
                            <td class="tth">594.54-김64수 </td>
                            <td class="tth">HM0000070277</td>
                            <td class="tth">-</td>
                        </tr>
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