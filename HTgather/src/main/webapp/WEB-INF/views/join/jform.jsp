<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/jform.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
</head>
<body>
	<div class="wrap wd668">
		<div class="container">
			<div class="form_txtInput">
				<h2 class="sub_tit_txt">회원가입</h2>
				<p class="exTxt">회원가입시 이름은 별명으로 입력하셔도 됩니다.</p>
				<!-- 바꾸기 -->
				<div class="join_form">
					<table>
						<colgroup>
							<col width="30%" />
							<col width="auto" />
						</colgroup>
						<tbody>
							<tr>
								<th><span class="essential">아이디</span></th>
								<td><input type="text" placeholder="ID 를 입력하세요."></td>
							</tr>
							<tr>
								<th><span class="essential">이름</span></th>
								<td><input type="text" placeholder=""></td>
							</tr>
							<tr>
								<th><span class="essential">비밀번호</span></th>
								<td><input type="text" placeholder="비밀번호를 입력해주세요."></td>
							</tr>
							<tr>
								<th><span class="essential">비밀번호 확인</span></th>
								<td><input type="text" placeholder="비밀번호를 확인하세요"></td>
							</tr>
							<tr>
								<th><span>성별</span></th>
								<td>
									<ul>
										<li>
										<label for="mb_gen"> 
										<input type="radio" name="mb_gen" value="Male">남
										</label>
										</li>
										<li>
										<label for="mb_gen"> 
										<input type="radio" name="mb_gen" value="Female">여
										</label>
										</li>
									</ul>
								</td>
							</tr>
							<tr class="email">
								<th><span class="essential">이메일</span></th>
								<td>
								<input type="text" class="email">
								<span class="mar10">@</span> 
								<input type="text" class="email email2"></td>
							</tr>
							<tr class="tel">
								<th><span class="essential">휴대폰 번호</span></th>
								<td>
								<input type="text" class="tel tel1" id="tel1" name="tel1" size="3" maxlength="3"> 
								<span class="mar10">-</span>
								<input type="text" class="tel tel2"id="tel2" name="tel2" size="4" maxlength="4">
								<span class="mar10">-</span>
								<input type="text" class="tel tel3" id="tel3"name="tel3" size="4" maxlength="4">
								</td>
							</tr>
							<tr>
								<th><span>체중 (단위: kg )</span></th>
								<td>
								<input type="text" class="weh" id="weh" name="weh"> 
								<span class="mar10">kg</span>
								</td>
							</tr>
							<tr>
								<th><span>신장 (단위: cm )</span></th>
								<td>
								<input type="text" class="weh" id="hei" name="hei"> 
								<span class="mar10">cm</span>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="exform_txt">
						<span>표시는 필수적으로 입력해주셔야 가입이 가능합니다.</span>
					</div>
				</div>
				<!-- join_form E  -->

				<!-- 이메일 수신동의 -->
				<!--<div class="agree_wrap">
							<div class="checkbox_wrap">
								<input type="checkbox" id="news_letter" name="news_letter"
									class="agree_chk"> <label for="news_letter">[선택]이메일
									수신동의</label>
							</div>
						</div>-->
				<div class="btn_wrap">
					<a href="javascript:;">회원가입</a>
				</div>
			</div>
			<!-- form_txtInput E -->
		</div>
		<!-- content E-->
	</div>
	<!-- container E -->
</body>
</html>