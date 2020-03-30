<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Navi Form</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">



    <style type="text/css">
        body {
            font-family: 'Noto Sans', '나눔고딕', 'Nanum Gothic', 'Helvetica', sans-serif;
        }

        /*전체 폰트 설정*/

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
        /*margin padding 0 설정*/

        .all_Main_Container{
            width: 1200px;
            margin: auto;
        }

        .navArea {
            width: 270px;
            float: left;

        }
        /*왼쪽 네비게이션 바 전체*/

        .navArea h2 {
            font-weight: normal;
            font-size: 2.188em;
            line-height: 160px;
            color: #fff;
            text-align: center;
            background
            margin: 0px;
        }

        /*네비게이션 상단바*/




        ul.lnb {
            width: 270px;
            height: 152px;
            border: 1px solid #E2E2E2;
            overflow: hidden;
            word-break: keep-all;
            padding: 0px;
        }

        /*네비게이션 하단바*/

        li.Nav_li_login {
            width: 270px;
            height: 50px;
            padding: 10px 20px;
            font-size: 20px;
            border: 1px solid #E2E2E2;
            background: #46B7D9;

        }

        /*로그인 텍스트 폼*/



        li.Nav_li_findId {
            width: 270px;
            height: 50px;
            padding: 10px 20px;
            font-size: 20px;
            color: #464646;
            border: 1px solid #E2E2E2;
        }


        li.Nav_li_pwdRei {
            width: 270px;
            height: 50px;
            padding: 10px 20px;
            font-size: 20px;
            color: #464646;
            border: 1px solid #E2E2E2;
        }


        a.Nav_login {
            width: 270px;
            height: 50px;
            font-size: 20px;
            padding: 10px 20px;
            text-decoration-color: black;
            color: white;
        }

        a.Nav_findId {
            width: 270px;
            height: 50px;
            font-size: 20px;
            padding: 10px 20px;
            text-decoration-color: black;
            color: #464646;
        }


        a.Nav_pwdRei {
            width: 270px;
            height: 50px;
            font-size: 20px;
            padding: 10px 20px;
            text-decoration-color: black;
            color: #464646;
        }

        .glyph-m {
            float: right;
            color: white;
        }

        .glyph-p {
            float: right;
            color: #464646;
        }
        /* 사이드 설정 끝 */

        /* 내부 상단 */
        .logoPw_nav {
            position: absolute;
            bottom: 0;
            width: 100%;
            height: 50px;
            line-height: 50px;
            color: #666;
            border-top: 1px solid #e2e2e2
        }
        /*비밀번호 분실 아래 회색선*/

        .content_core{
            width: 880px;
            float: right;
        }

        .content_title {
            overflow: hidden;
            position: relative;
            min-height: 160px;
            width: 880px;
            height: 161px;
            padding: 0;
            border-bottom: 1px solid #e2e2e2;
        }
        /*로그인 아이콘 감싸주는 폼 CSS*/


        .content_title h3::before {
            content: "";
            position: absolute;
            top: 30px;
            width: 25px;
            height: 4px;
            background: #333;
        }
        /*로그인 위에 선 CSS */

        .content_title h3 {
            font-size: 30px;
            width: 880px;
            height: 50px;
            margin: 30px 0px 0px;
            padding: 20px 0px 0px;
        }
        /*로그인 텍스트 CSS*/



        .login_pw_title {
            width: 880px;
            height: 25px;
            font-size: 25px;
            color: #46B7D9;
            margin: 0px 0px 30px 0px;
        }
        /*본인인증으로 비밀번호 분실 찾기 CSS*/
    </style>
</head>

<body>
	<%@ include file="./header.jsp"%>
    <div class="all_Main_Container">
        <div class="navArea">
            <h2>회원정보</h2>
            <ul class="lnb">
                <li class="Nav_li_login">
                    <span class="glyph-m">
                        <div class="glyphicon glyphicon-minus"></div>
                    </span>
                    <a href="/hwado/menu/10487/program/30006/memberLogin.do" class="Nav_login">로그인</a>

                </li>

                <li class="Nav_li_findId">
                    <span class="glyph-p">
                        <div class="glyphicon glyphicon-plus"></div>
                    </span>
                    <a href="/hwado/menu/10488/program/30008/memberFindIdCertify.do" class="Nav_findId">아이디찾기</a>

                </li>
                <li class="Nav_li_pwdRei">
                    <span class="glyph-p">
                        <div class="glyphicon glyphicon-plus"></div>
                    </span>
                    <a href="/hwado/menu/10491/program/30010/memberFindPwdCertify.do" class="Nav_pwdRei">비밀번호재발급</a>

                </li>
            </ul>
            <!--네비게이션 하단바 끝-->
        </div>
        <!--네비게이션 전체 -->
        <div class="content_core">
            <div class="content_title">
                <h3>비밀번호재발급</h3>

                <div class="logoPw_nav">
                    <a href=""><i class="xi-home"></i></a>

                    <span>
                        <i class="xi-angle-right-thin"></i>

                        <em>회원정보</em>
                        <i class="xi-angle-right-thin"></i>
                        <span>비밀번호 재발급</span>
                    </span>
                </div>
            </div>
            <!--로그인 타이틀 바  -->
            <!-- 여기에 이제 불러와서 값 집어넣으면 될것 -->
            <div class="content_body">
				<%@ include file="./contentBody.jsp"%>
            </div>
        </div>
    </div>
</body>

</html>