<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 	String generalBookId;
	String genre;
	String title;
	String description;
	String detailUrl;
	String publicationDate;
	String publisher;
	String thumbnailUrl;
	byte status;
	byte recommendStatus;   -->
<c:choose>
	<c:when test="${gbdto} eq null">
		조회된 결과가 없음
	</c:when>
	<c:otherwise>
	<h2>조회된 값이 있음</h2><br>
		${gbdto.generalBookId }<br>
		${gbdto.genre }<br>
		${gbdto.title }<br>
		${gbdto.description }<br>
		${gbdto.detailUrl }<br>
		${gbdto.publicationDate }<br>
		${gbdto.publisher }<br>
		${gbdto.thumbnailUrl }<br>
		${gbdto.status }<br>
		${gbdto.recommendStatus }<br>
		<h2>Author list</h2><br>
		<c:forEach items="${aList }" var="authorName">
			${authorName }	
		</c:forEach>
		<h2>Translator list</h2><br>
		<c:forEach items="${tList }" var="translatorName">
			${translatorName }
		</c:forEach>
		<br><br>
		<h2>도서관 소장 도서</h2><br>
		<c:forEach items="${lbdtoList }" var="lbdto">
			libraryBookId : ${lbdto.libraryBookId } <br>
			generalBookId : ${lbdto.generalBookId } <br>
			registrationDate : ${lbdto.registrationDate } <br>
			rentalCnt : ${lbdto.rentalCnt } <br>
			status :  ${lbdto.status } <br>
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
				보유중
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</c:otherwise>
</c:choose>

</body>
</html>