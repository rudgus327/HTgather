<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8">
	<style type="text/css">
	.container { max-width:1200; margin:0 auto; }
	.pTitle {height: 100px; background-color: salmon; }
	ul li {
		list-style: none;
		float: right;
		padding: 5px;
	}
	a{text-decoration: none;}
	</style>
</head>
<body>
<div class="container">
	<nav>
		<ul>
			<li><a href="#">로그인</a></li>
			<li><a href="${root}/join/jform">회원가입</a></li>
		</ul>
	</nav>
	<div class="pTitle">
		<h1>Hello world!</h1>
		<P>  The time on the server is ${serverTime}. </P>
	</div><!-- pTitle -->
</div><!-- container -->
</body>
</html>
