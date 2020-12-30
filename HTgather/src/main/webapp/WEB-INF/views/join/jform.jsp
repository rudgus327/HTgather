<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/jform.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${root}/resources/css/homeheader.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&family=Staatliches&display=swap" rel="stylesheet">
</head>
<script type="text/javascript">
	$(document).ready(function() {
		var ck = 0; //아이디 중복 체크 변수
		
		$("#btn_idChk").click(function() {
			if ($.trim( $("#mbr_id").val()) == "") {
				alert("아이디를 입력해주세요.");
				return false;
			}// 아이디 적지 않고 중복체크 버튼 누름
			$.get(
				"./idChk"
				,{mbr_id:$("#mbr_id").val()}
				,function(data,status){
					if (status == "success")
						if (data == 0) {
							$("#id_desc").text("사용 가능한 아이디입니다.");
							$("#id_desc").css({
								padding:"12px 0 19px 0",
							 	"text-align": "right",
							  	color: "#9a9a9a",
							  	"font-size": "13px",
							 	"border-bottom": "1px solid #ececec"
							});
							$("#id_desc").focus();
							ck = 1;
						}else {
							$("#id_desc").text("사용 중인 아이디 입니다.");
							$("#id_desc").css({
								padding:"12px 0 19px 0",
							 	"text-align": "right",
							  	color: "red",
							  	"font-size": "13px",
							 	"border-bottom": "1px solid #ececec"
							});
							$("#id_desc").focus();
						}
				}//function
			);//get : 아이디 중복체크
		});//click : btn_idChk
		
		////////////////////////////////////////////////////////
		//중복 체크 후 다시 아이디 변경 할 때
		$("#mbr_id").keydown(function() {
			ck = 0;
		});//keydown
		$(".mbr_id").keyup(function() {
			let tmpElement = event.target;
			let tmpValue = tmpElement.value;
			tmpElement.value
			=tmpValue.replace(/[^ A-Z a-z 0-9 \.]/g, '');
		});//keyup: 키 입력 후 발생 이벤트: 알파벳, 숫자만 입력 가능
		$(".tel").keyup(function() {
			let tmpElement = event.target;
			let tmpValue = tmpElement.value;
			tmpElement.value = tmpValue.replace(/[^ 0-9\.]/g,'');
		});//keyup: 키 입력 후 발생 이벤트 : 숫자만 입력가능
		
		////////////////////////////////////////////////////////
		
		$("#btn_join").click(function() {
			if($.trim( $("#mbr_id").val() ) == ""){
				alert("아이디를 입력해 주세요.");
				return;
			}
			if($.trim( $("#mbr_pwd").val() ) == ""){
				alert("비밀번호를 입력해 주세요");
				return;
			}
			if($.trim( $("#mbr_pwdre").val() ) == ""){
				alert("비밀번호 확인을 입력해주세요.");
				return;
			}
			if ($("#mbr_pwd").val() != $("#mbr_pwdre").val() ) {
				alert("비밀번호와 비밀번호 확인이 서로 다릅니다.\n 비밀번호를 확인해 주세요.");
			}
			if ($.trim( $("#mbr_name").val() ) == "") {
				alert("이름을 입력해주세요.");
				return;
			}
			if ($.trim( $("#email1").val()) ==""
					||$.trim($("#email2").val()) =="") {
				alert("이메일을 확인해주세요.");
			}
			if ($.trim($("#tel1").val()) == "" 
					||$.trim($("#tel2").val()) == ""
					||$.trim($("#tel3").val()) == "") {
				alert("휴대폰 번호를 확인해주세요.");
				return;
			}
			if (ck == 0) {
				alert("아이디 중복 여부를 확인해 주세요.");
				return false;
			}
		
			$.ajax({
				type:"POST"
				, url:"./register"
				, dataType:"JSON"
				, data : {mbr_id : $("#mbr_id").val()
					,mbr_pwd:$("#mbr_pwd").val()
					,mbr_name:$("#mbr_name").val()
					,mb_gen : $('input:radio[name=mb_gen]:checked').val()
					,tel1 : $("#tel1").val(), tel2 : $("#tel2").val(), tel3 : $("#tel3").val()
					,email1 : $("#email1").val(), email2 : $("#email2").val()
					,weight:$("#weight").val()
					,height:$("#height").val()}
				,success : function(data) {
					if (data == "1") {
						alert("회원가입을 축하드립니다.");
						location.href = "${root}/";//회원가입 성공시 홈화면으로 돌아감
					}else if (data == "-1") {
						alert("회원가입을 다시 시도해 주세요.")
					}
				}//success
				,error: function(xhr, status, error) {
				}//error
				
			});//ajax	
		});//btn_join
	});//ready
</script>
<body>
	<div class="sheet">
		<%@ include file="../homeheader.jsp"%>
	</div>
	<div class="wrap wd668">
		<div class="container">
			<div class="form_txtInput">
				<h2 class="sub_tit_txt">회원가입</h2>
				<p class="exTxt">회원가입 시, 이름은 별명으로 입력하셔도 됩니다.</p>
				<!-- 바꾸기 -->
				<div class="join_form">
					<table>
						<colgroup>
							<col width="30%" />
							<col width="auto" />
						</colgroup>
						<tbody>
							<tr>
								<th><span class="essential">아이디</span><span id="id_desc"></span></th>
								<td><input class="mbr_id" id="mbr_id" type="text" placeholder="ID 를 입력하세요.">
								<div class="btn_idChk" id= "btn_idChk">
								<a href="#">중복확인</a>
								</div>
								</td>
								
							</tr>
							<tr>
								<th><span class="essential">비밀번호</span></th>
								<td><input id="mbr_pwd" type="text" placeholder="비밀번호를 입력해주세요."></td>
							</tr>
							<tr>
								<th><span class="essential">비밀번호 확인</span></th>
								<td><input id="mbr_pwdre" type="text" placeholder="비밀번호를 확인하세요"></td>
							</tr>
							<tr>
								<th><span class="essential">이름</span></th>
								<td><input id="mbr_name" type="text" placeholder=""></td>
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
								<input type="text" class="email" id="email1">
								<span class="mar10">@</span> 
								<input type="text" class="email email2" id="email2"></td>
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
								<input type="text" class="weh" id="weight" name="weh"> 
								<span class="mar10">kg</span>
								</td>
							</tr>
							<tr>
								<th><span>신장 (단위: cm )</span></th>
								<td>
								<input type="text" class="weh" id="height" name="hei"> 
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
				<button type="button" class="btn_wrap" id= "btn_join">
					회원가입
				</button>
			</div>
			<!-- form_txtInput E -->
		</div>
		<!-- content E-->
	</div>
	<!-- container E -->
</body>
</html>