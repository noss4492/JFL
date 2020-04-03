<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
	<div class="navArea">
		<h2>${category}</h2>
		<input type="hidden" id="hidden_title" name="hidden_title" value="${title}"  />
		<c:if test="${menu ne null}">
			<input type="hidden" id="hidden_menu" name="hidden_menu" value="${menu}"  />
		</c:if>
		<ul class="lnb">
		<!-- /////////////////////////////////////////////////////////////////////// -->
		<c:if test="${category eq '도서관소개' }">
			<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">도서관안내</a>
					<ul class="submenu" >
						<li><a href="">조직/직원정보</a></li>
						<li><a href="">시설안내</a></li>
						<li><a href="">자료현황</a></li>
						<li><a href="">찾아오시는길</a></li>
					</ul>
				</li>

			<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">이용안내</a></li>
		</c:if>
		<!-- /////////////////////////////////////////////////////////////////////// -->
		<c:if test="${category eq '자료검색' }">
			<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">로그인</a></li>

			<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">아이디찾기</a></li>
				
			<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">비밀번호재발급</a></li>
		</c:if>
		<!-- /////////////////////////////////////////////////////////////////////// -->
		<c:if test="${category eq '신청서비스' }">
			<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">로그인</a></li>

			<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">아이디찾기</a></li>
				
			<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">비밀번호재발급</a></li>
		</c:if>
		<!-- /////////////////////////////////////////////////////////////////////// -->
		<c:if test="${category eq '도서관소식' }">
			<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">공지사항</a></li>

			<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">열린소리함</a></li>
				
			<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">자주하는질문</a></li>
				
				<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">기증도서알림</a></li>
				
				<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">설문조사</a></li>
		</c:if>
		<!-- /////////////////////////////////////////////////////////////////////// -->
		<c:if test="${category eq '나만의도서관' }">
			<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">로그인</a></li>

			<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">아이디찾기</a></li>
				
			<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">비밀번호재발급</a></li>
		</c:if>
		<!-- /////////////////////////////////////////////////////////////////////// -->
		<c:if test="${category eq '회원정보' }">
			<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">로그인</a></li>

			<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">아이디찾기</a></li>
				
			<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">비밀번호재발급</a></li>
		</c:if>
		<!-- /////////////////////////////////////////////////////////////////////// -->
		<c:if test="${category eq '도서관소개라면' }">
			<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">로그인</a></li>

			<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">아이디찾기</a></li>
				
			<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">비밀번호재발급</a></li>
		</c:if>
		<!-- /////////////////////////////////////////////////////////////////////// -->
		<c:if test="${category eq '홈페이지이용안내' }">
			<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">로그인</a></li>

			<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">아이디찾기</a></li>
				
			<li class="Nav_li_off"><span class="glyph-p">
					<div class="glyphicon glyphicon-plus"></div>
			</span> <a href=""
				class="Nav_non">비밀번호재발급</a></li>
		</c:if>
		</ul>
		<!--네비게이션 하단바 끝-->
	</div>
	<!--네비게이션 전체 -->
</body>