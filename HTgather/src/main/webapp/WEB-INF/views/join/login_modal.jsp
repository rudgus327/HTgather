<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!-- login modal start -->

<div class="modal" id="login_modal">
 <div class="modal-dialog modal-sm">
 	<div class="modal-content">
 		<!-- modal header -->
 		<div class="modal-header">
 		<h4>LogIn</h4>
 		</div>
 		<!-- modal body -->
 		<div class="modal-body">
 			<div class="form-group">
 			 <label for="login_id">Your Id.</label>
 			 <input class="form-control" type="text" id="login_id">
 			</div>
 			<div class="form-group">
 			<label for="login_pwd">Your Password.</label>
 			<input class="form-control" type="password" id="login_pwd">
 			</div>
 		</div>
 		<!-- modal footer -->
 		<div class="modal-footer">
 		<button type="button" class="btn btn-danger" 
 			data-dismiss="modal">Close</button>
 		<button type="button" class="btn btn-primary" 
 			id="btn_login">LogIn</button>
 		</div>
 	</div>
 </div>
</div>
<script>
$(document).ready(function() {
	
	
	$("#login_pwd").keyup(function(){
		if (event.keyCode == 13) {
			$("#btn_login").click();
		}//if
	});//keyup function
	
	$("#btn_login").click(function() {
		if ( $.trim(  $("#login_id").val() ) == "") {
			alert("아이디를 확인하세요");
			return;
		}
		if ( $.trim(  $("#login_pwd").val() ) == "") {
			alert("비밀번호를 확인하세요");
			return;
		}
		$.get(
			"${root}/inout/in"
			,{ mbr_id : $("#login_id").val()
			,  mbr_pwd : $("#login_pwd").val()
			}
			,function(data, status){
				if (data == -1) {
					alert("아이디가 없습니다.\n회원가입을 해주세요.");
				}else if (data == -2) {
					alert("비밀번호가 올바르지 않습니다.\n비밀번호를 확인해주세요.");
				}else if (data > 0) {
					alert("로그인 되었습니다.");
					location.reload();
				}
			}//function
		);//btn_login click(get)

	});//btn_login click function
	
	$("#btn_logout").click(function() {
		$.get(
			"${root}/inout/out"//url
			,{} //data(key:value)
			,function(data, status){
				if (data == 1) {
					alert("로그아웃 되었습니다.");
					location.reload();
				}//if
			}//get(function)
		); //get method
	});//btn_logout click function
	
	
});//ready
</script>