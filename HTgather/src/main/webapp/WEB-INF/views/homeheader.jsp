<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<%@ include file="./join/login_modal.jsp" %>

<div class="headerbox">
	<div class="logo"><!-- logo -->
		<a href="${root}/">
		<img src="${root}/resources/img/logoSample.png" width="180px" />	
		</a>
	</div><!-- logo -->
	<div class="category"><!-- category -->
		<nav>
			<ul>
				<li class="header"><a href="#">ABOUT US</a></li>
				<li class="header"><a href="#">DIARY</a></li>
				<li class="header"><a href="#">test</a></li>
				<li class="header"><a href="#">BOARD</a></li>
			</ul>
		</nav>
	</div><!-- category -->
	<div class="register"><!-- register -->
		<nav>
			<ul>
				<c:choose>
					<c:when
						test="${login_dto.mno != null}">
						<li class="nav-item"><a
							class="nav-link text-muted font-weight-bold" id="btn_logout"
							href="${root}/inout/out">LogOut</a></li>
					</c:when>
					<c:otherwise>
						<li class="header nav-item"><a class="nav-link"
							href="${root}/jform">JOIN</a></li>
						<li class="header nav-item"><a class="nav-link"
							data-toggle="modal" data-target="#login_modal"
							href="${root}/inout/in">LogIn</a></li>
					</c:otherwise>
	
				</c:choose>
			</ul>
		</nav>
	</div><!-- register -->
</div>




