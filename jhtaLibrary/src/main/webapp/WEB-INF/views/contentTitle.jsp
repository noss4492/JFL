<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
	<div class="content_core">
		<div class="content_title">
				<c:if test="${menu != null}">
					<h3>${menu}</h3>
				</c:if>
				<c:if test="${menu == null}">
					<h3>${title}</h3>
				</c:if>
			<div class="logoPw_nav">
				<a href="./"><i class="xi-home"></i></a> <span> 
				<i class="xi-angle-right-thin"></i> <span>${category}</span> 
				<i class="xi-angle-right-thin"></i> <span>${title}</span>
				<c:if test="${menu != null}">
					<i class="xi-angle-right-thin"></i> <span>${menu}</span>
				</c:if>
				</span>
			</div>
		</div>
	</div>
</body>
