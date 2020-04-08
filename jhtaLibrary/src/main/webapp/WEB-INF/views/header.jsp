<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<header id="header">
	<div id="headerTopWrapper">
		<div id="headerTop">
			<div id="siteUtilGroup">
				<div id="libraryShortcut" class="dropdown">
					<button class="dropdownbtn">
						<a href="">도서관바로가기 </a>
					</button>
					<div id="dropdown-content">
						<a href="">123123</a> <a href="">123123123</a> <a href="">12312312</a>
						<a href="">3123213</a>
					</div>

				</div>
				<div id="siteMenu" class="siteMenu">
					<ul>
						<sec:authorize access="isAnonymous()">
							<li class="login"><a href='<c:url value="/login"/>'>로그인</a></li>
							<li class="register"><a href="register1">회원가입</a></li>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<li class="login">
								<form action="<c:url value="/securityLogin/logout" />"
									name="logout" method="post">
									<input type="hidden" name="${_csrf.parameterName }"
										value="${_csrf.token }" /> <input type="submit"
										class="headerlogout" value="로그아웃" />
								</form>
							</li>

							<li class="userinfoform"><a href="">정보수정</a></li>
						</sec:authorize>
						<li class="sitemap"><a href="">사이트맵</a></li>
					</ul>
				</div>
			</div>

		</div>
	</div>

	<div id="headerMid">
		<div id=logo>

			<a href='<c:url value="/"/>'><img src='<c:url value="/img/headerLogo.png"/>' alt=""></a>
		</div>
		<div id="topSearchBarDiv">
			<input type="text" name="topSearchBar" id="topSearchBarInput"
				placeholder="도서명 또는 저자명 입력"> <a href="" id="topSearchBtn"><img
				id="searchBtn" src='<c:url value="/img/searchImg.png"/>' alt=""></a>
		</div>
	</div>
	<div id="navBarWrapper">

		<div id="navBar1">
			<ul id="navBarMain">
				<li class="navBarLi"><a href="">도서관소개</a>

					<ul class="navBarSub">
						<li class="navBarLiSub"><a href="">도서관안내</a></li>
						<li class="navBarLiSub"><a href="">이용안내</a></li>
					</ul></li>
				<li class="navBarLi"><a href="">자료검색</a>


					<ul class="navBarSub">
						<li class="navBarLiSub"><a href="<c:url value='book/simpleSearch'/>">통합검색</a></li>
						<li class="navBarLiSub"><a href="">주제별검색</a></li>
						<li class="navBarLiSub"><a href="">신착자료검색</a></li>
						<li class="navBarLiSub"><a href="">대출베스트</a></li>
						<li class="navBarLiSub"><a href="">공공도서관 인기도서</a></li>
						<li class="navBarLiSub"><a href="">희망도서신청</a></li>
					</ul></li>


				<li class="navBarLi"><a href="./facilityRentForm1">신청서비스</a>

					<ul class="navBarSub">
						<li class="navBarLiSub"><a href="./facilityRentForm1">시설대관신청</a></li>
						<li class="navBarLiSub"><a href="./tourApplication1">도서관견학신청</a></li>
						<li class="navBarLiSub"><a href="">자원봉사신청</a></li>
					</ul></li>
				<li class="navBarLi"><a href="">도서관소식</a>

					<ul class="navBarSub">
						<li class="navBarLiSub"><a href='<c:url value="/notice"/>'>공지사항</a></li>
						<li class="navBarLiSub"><a href='<c:url value="/list"/>'>열린소리함</a></li>
						<li class="navBarLiSub"><a href="">자주하는질문</a></li>
						<li class="navBarLiSub"><a href="">기증도서알림</a></li>
						<li class="navBarLiSub"><a href="">설문조사</a></li>
					</ul></li>
				<li class="navBarLi"><a href="">나만의도서관</a>

					<ul class="navBarSub">
						<li class="navBarLiSub"><a href="">기본정보</a></li>
						<li class="navBarLiSub"><a href="">나의신청정보</a></li>
						<li class="navBarLiSub"><a href="">도서이용정보</a></li>
						<li class="navBarLiSub"><a href="">상호대차조회</a></li>
						<li class="navBarLiSub"><a href="">관심자료목록</a></li>
						<li class="navBarLiSub"><a href="">도서추천서비스</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</header>
