<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<%@ page session="false"%>
<html>
<head>
<title>join</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="${root}/resources/js/join.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/login.css">
<link rel="stylesheet" type="text/css" href="${root}/resources/css/homeheader.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&family=Staatliches&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<style type="text/css">

</style>
</head>
<body>
	<div class="sheet">
		<%@ include file="../homeheader.jsp"%>
	</div>
	<!-- container -->
	<form id="loginForm" method="post" action="${root}/login">
	
		<div class="wrap wd668">
			<div class="container">
				<div class="form_txtInput">
					<h2 class="sub_tit_txt">로그인</h2>
					
					<!-- 바꾸기 -->
					<div class="join_form">
						<table>
							<colgroup>
								<col width="30%" />
								<col width="auto" />
							</colgroup>
							<tbody>
								<tr>
									<td><input id="mb_login_id" name="mb_login_id" type="text" placeholder="아이디를 입력해주세요."></td>
								</tr>
								<tr>
									<td><input id="mb_login_pwd" name="mb_login_pwd" type="text" placeholder="비밀번호를 입력해주세요."></td>
								</tr>							
							</tbody>
						</table>
					</div>
					<button type="button" class="btn_wrap" id= "btn_join">로그인
					</button>
				</div><!-- form_txtInput E -->
			</div><!-- content E-->
		</div><!-- container E -->
	</form>
</body>
</html>
