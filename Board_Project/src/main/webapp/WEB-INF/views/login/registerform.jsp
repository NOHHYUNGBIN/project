<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/bootstrap.css"/>"
	rel='stylesheet' />
<title>회원가입</title>
</head>
<style>
.form-control {
	width: 400px;
}
.form-group {
	margin-left: 450px;
	margin-bottom: 10px;
}
</style>

<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>	
	//아이디 중복체크 AJAX
	function id_check() {
		if ($("#userid").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#userid").focus();
		} else if ($("#check_result").text() == "사용 할 수 없는 아이디입니다. 다시 설정해주세요.") {
			alert("사용가능한 형식의 아이디로 입력해야 중복확인이 가능합니다.");
		}	
		else {
			$.ajax({
				url : "/login/idCheck",
				type : "post",
				dataType : "json",
				data : { "userid" : $("#userid").val()
				},
				success : function(data) {
					if (data == 1) {
						$("#check_result").text("이미 사용중인 아이디 입니다.");
						$('#check_result').css('color', 'red');
					} else if (data == 0) {
						$("#idCheck").attr("value", "Y");
						$("#check_result").text("사용가능한 아이디 입니다.");
						$('#check_result').css('color', 'green');
					}
				}
			})
		}
	}
	//별명중복체크 AJAX
	function nickname_check() {
		if ($("#nickname").val() == "") {
			alert("별명을 입력해주세요.");
			$("#nickname").focus();
		}
		else {
			$.ajax({
				url : "/login/nicknameCheck",
				type : "post",
				dataType : "json",
				data : { "nickname" : $("#nickname").val()
				},
				success : function(data) {
					if (data == 1) {
						$("#nicknameCheck_result").text("이미 사용중인 별명 입니다.");
						$('#nicknameCheck_result').css('color', 'red');
					} else if (data == 0) {
						$("#nicknameCheck").attr("value", "Y");
						$("#nicknameCheck_result").text("사용가능한 별명 입니다.");
						$('#nicknameCheck_result').css('color', 'green');
					}
				}
			})
		}
	}
	function email_check() {
		if ($("#email").val() == "") {
			alert("이메일주소를 입력해주세요.");
			$("#email").focus();
		} else if ($("#emailcheck_result").text() == "이메일 형식을 확인해주세요.") {
			alert("사용 가능한 형식의 이메일주소로 입력해야 중복확인이 가능합니다.");
		}
		else {
			$.ajax({
				url : "/login/emailCheck",
				type : "post",
				dataType : "json",
				data : { "email" : $("#email").val()
				},
				success : function(data) {
					if (data == 1) {
						$("#emailcheck_result").text("이미 사용중인 이메일주소 입니다.");
						$('#emailcheck_result').css('color', 'red');
					} else if (data == 0) {
						$("#emailCheck").attr("value", "Y");
						$("#emailcheck_result").text("사용가능한 이메일주소 입니다.");
						$('#emailcheck_result').css('color', 'green');
					}
				}
			})
		}
	}
	
	$(document).ready(function() {
		var empJ = /\s/g;
		//아이디 정규식  = a~z,0~9로 시작하는 4~12자리 아이디만 가능
		var idJ = /^[a-z0-9]{4,12}$/; 
		// 비밀번호 정규식  = 특수문자 / 문자 / 숫자 포함 형태의 4~12
		var pwJ =  /^.*(?=^.{4,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		// 이름 정규식 = 가~힣. 한글로 이뤄진 문자만으로 2~8자리 이름만 가능
		var nameJ = /^[가-힣]{2,8}$/;
		// 이메일 검사 정규식 = 특수문자가능 중앙에@ 필수 . 뒤에는 2~3글자 필요.
		var emailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		// 휴대폰 번호 정규식 = 하이폰 생략 
		var telJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;		
		// 취소
		$(".cencle").on("click", function() {
			location.href = "/login";
		})
	
		// 아이디 정규식 체크
 		$("#userid").blur(function() {
			if($("#userid").val() != "") {
				if (idJ.test($("#userid").val())) {
					$("#check_result").css("color", "green");
					$("#check_result").text("사용 가능한 형식의 아이디입니다. 중복확인을 해주세요.");
				} else {
					$("#check_result").css("color", "red");
					$("#check_result").text("사용 할 수 없는 아이디입니다. 다시 설정해주세요.");
				}
			}
		}); 

		// 비밀번호 정규식 체크
		$("#userpass").blur(function() {
			if($("#userpass").val() != "") {
				if (pwJ.test($("#userpass").val())) {
					$("#pw_check").css("color", "green");
					$("#pw_check").text("사용가능한 비밀번호 입니다.");
					$("#userpassCheck").attr("disabled", false);
				} else {
					$("#pw_check").css("color", "red");
					$("#pw_check").text("비밀번호가 약합니다. 다시 설정해주세요");
					$("#userpassCheck").attr("disabled", true);
				}
			}
		});
		//비밀번호 일치여부 체크
		$("#userpassCheck").blur(function() {
			if($("#userpassCheck").val() != "") {				
				if( $("#userpass").val() != $("#userpassCheck").val() ) {
					$("#pw2_check").css("color", "red");
					$("#pw2_check").text("비밀번호가 일치하지 않습니다.");
				} else {
					$("#pw2_check").css("color", "green");
					$("#pw2_check").text("비밀번호 확인 성공.");
				}
			}
		});
		//이름 정규식 테스트
		$("#username").blur(function() {
			if($("#username").val() != "") {
				if (nameJ.test($("#username").val())) {
					$("#username_check").text("");
				} else {
					$("#username_check").css("color", "red");
					$("#username_check").text("이름을 확인해주세요.");			
				}
			}
		});
		//이메일 정규식 테스트
		$("#email").blur(function() {
			if($("#email").val() != "") {
				if (emailJ.test($("#email").val())) {
					$("#emailcheck_result").text("");
				} else {
					$("#emailcheck_result").css("color", "red");
					$("#emailcheck_result").text("이메일 형식을 확인해주세요.");			
				}
			}
		});

		//전화번호 정규식 테스트
		$("#tel").blur(function(){
			if($("#tel").val() != "") {
				if(telJ.test($("#tel").val())){
					$("#tel_check").text("");
				} else {
					$("#tel_check").text("전화번호 형식을 확인해주세요.");
					$("#tel_check").css("color", "red");
				}
			}
		});

		$("#submit").on("click", function() {
			if ($("#userid").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#userid").focus();
				return false;
			}
			if ($("#userpass").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#userpass").focus();
				return false;
			}
			if ($("#userpassCheck").val() == "") {
				alert("비밀번호를 확인을 입력해주세요.");
				$("#userpassCheck").focus();
				return false;
			}
			if ($("#userpass").val() != $("#userpassCheck").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#userpass").focus();
				return false;
			}
			if ($("#nickname").val() == "") {
				alert("별명을 입력해주세요.");
				$("#nickname").focus();
				return false;
			}
			if ($("#username").val() == "") {
				alert("성명을 입력해주세요.");
				$("#username").focus();
				return false;
			}
			if ($("#email").val() == "") {
				alert("이메일을 입력해주세요.");
				$("#email").focus();
				return false;
			}
			if ($("#tel").val() == "") {
				alert("전화번호를 입력해주세요.");
				$("#tel").focus();
				return false;
			}
			if($("#idCheck").val() == "N"){
				alert("아이디 중복확인 버튼을 눌러주세요.");
				$("#userid").focus();
				return false;
			}
			if($("#nicknameCheck").val() == "N"){
				alert("별명 중복확인 버튼을 눌러주세요.");
				$("#nickname").focus();
				return false;
			}
			if($("#emailCheck").val() == "N"){
				alert("이메일 중복확인 버튼을 눌러주세요.");
				$("#email").focus();
				return false;
			}
			alert("회원가입이 완료 됐습니다.");
		});
	})
</script>
<body>

	<div class="container">
		<hr>
		<h1 style="text-align: center;">회원가입</h1>
		<hr>
		<form action="/login/insertUser" method="POST">
			<!-- 아이디 -->
			<div class="form-group">
				<label for="userid">아이디</label><br>
				<input type="text" id="userid" name="userid" 
				placeholder="영문 및 숫자 4~12자를 입력해주세요." required style="width:315px">
				<button type="button" id="idCheck" onclick="id_check();" value="N">중복확인</button><br>
				<div class="check_font" id="check_result"></div>
			</div>
			<!-- 비밀번호 -->
			<div class="form-group">
				<label for="userpass">비밀번호</label> 
				<input type="password"class="form-control" id="userpass" name="userpass" 
				placeholder="숫자와 특수문자가 포함된 4~12자로 설정하세요." required>
				<div class="check_font" id="pw_check"></div>
			</div>
			<!-- 비밀번호 재확인 -->
			<div class="form-group">
				<label for="userpassCheck">비밀번호 확인</label> 
				<input type="password" class="form-control" id="userpassCheck" name="userpassCheck" 
				placeholder="상단의 비밀번호가 유효할시 입력가능합니다." required disabled="disabled">
				<div class="check_font" id="pw2_check"></div>
			</div>
			<!-- 닉네임 -->
			<div class="form-group">
				<label for="nickname">별명</label><br>
				<input type="text" id="nickname" name="nickname" 
				placeholder="게시글 작성시 별명으로 표시됩니다." required style="width:315px">
				<button type="button" id="nicknameCheck" onclick="nickname_check();" value="N">중복확인</button><br>
				<div class="check_font" id="nicknameCheck_result"></div>
			</div>

			<!-- 이름 -->
			<div class="form-group required">
				<label for="username">이름</label> 
				<input type="text" class="form-control" id="username" name="username" 
				placeholder="ex)홍길동" required>
				<div class="check_font" id="username_check"></div>
			</div>
			<!-- 이메일 -->
			<div class="form-group">
				<label for="email">이메일주소</label><br>
				<input type="email" id="email" name="email" 
				placeholder="ex) fish@fish.com" required style="width:315px">
				<button type="button" id="emailCheck" onclick="email_check();" 
				value="N" >중복확인</button><br>
				<div class="check_font" id="emailcheck_result"></div>
			</div>
			<!-- 휴대전화 -->
			<div class="form-group">
				<label for="tel">휴대전화 ('-' 없이 번호만 입력해주세요)</label> 
				<input type="tel" class="form-control" id="tel" name="tel" 
				placeholder="ex) 01012341234" required>
				<div class="check_font" id="tel_check"></div>
			</div>
			<div class="form-group has-feedback" style="margin-left: 560px;">
				<button class="btn btn-success" type="submit" id="submit">회원가입</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
		</form>

	</div>
</body>


</html>