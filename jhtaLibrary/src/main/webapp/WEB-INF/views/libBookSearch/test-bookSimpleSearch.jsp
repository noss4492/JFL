<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>서치페이지입니다.</h1><br>
서치바와 검색결과 반환 테이블 필요함<br>
<div class="tableWrapper">
    <form action="">
        <input type="text" name="keyword" id="">
        <input type="submit" value="조회">
    	<table>
            <tr>
                <th>isbn</th>
                <th>장르</th>
                <th>제목</th>
                <th>출판사</th>
                <th>썸네일</th>
                <th>상태</th>
                <td>작가</td>
            </tr>
        	<c:forEach items="${gbMapList}" var="gbmap">
        		<tr>
        			<td>${gbmap.GENERALBOOKID}</td>
        			<td>${gbmap.GENRE}</td>
        			<td><a href='<c:url value="/book/detail?isbn=${gbmap.GENERALBOOKID}"/>'/>${gbmap.TITLE }</a></td>
        			<td>${gbmap.PUBLISHER }</td>
        			<td><img src="${gbmap.THUMBNAILURL }" alt=""/></td>
        			<td>${gbmap.STATUS }</td>
        			<td>${gbmap.AUTHORNAME}</td>
        		</tr>
        	</c:forEach>
    	</table>
    </form>
</div>
</body>
</html>