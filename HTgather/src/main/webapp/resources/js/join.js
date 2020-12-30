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