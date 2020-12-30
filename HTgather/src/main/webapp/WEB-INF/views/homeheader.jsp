<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>


<div class="headerbox">
	<div class="logo"><!-- logo -->
		<a href="${root}/">
		<img src="${root}/resources/img/logoSample.png" width="180px" />	
		</a>
	</div><!-- logo -->
	<div class="category"><!-- category -->
		<nav>
			<ul>
				<li><a href="#">ABOUT US</a></li>
				<li><a href="#">DIARY</a></li>
				<li><a href="#">TIPS</a></li>
				<li><a href="#">BOARD</a></li>
			</ul>
		</nav>
	</div><!-- category -->
	<div class="register"><!-- register -->
	<nav>
		<ul>
			<c:choose>
				<c:when test="">
					<li><a href="${root}/jform">MY PAGE</a></li>
					<li><a href="${root}/inout/out">LOGOUT</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${root}/jform">JOIN</a></li>
					<li><a data-toggle="modal"
					data-target="login_modal" 
					href="${root}/inout/in">LOGIN</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
	</div><!-- register -->
</div>