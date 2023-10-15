<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<title>회원가입 | LEGO SHOP</title>
<link rel="stylesheet" href="${ctp}/css/join.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
let idChkFlag = 0;
let emailChkFlag = 0;

function uidCheck() {
	$('#uid').on("keyup", function() {
		let uid = this.value;
		let regUid = /^[a-zA-Z0-9]{4,20}$/;
		
		if(uid == "") {
			$('.input-uid.active').css("border-bottom-color", "#bbb");
			$('.chk-id-re').css("display", "none");
			$('.chk-id-no').css("display", "none");
			$('.chk-id-ok').css("display", "none");
			idChkFlag = 0;
		}
		
		else if(!regUid.test(uid) || (uid.length < 4 || uid.length > 20)) {
			$('.input-uid.active').css("border-bottom-color", "#d01012");
			$('.chk-id-re').css("display", "block");
			$('.chk-id-no').css("display", "none");
			$('.chk-id-ok').css("display", "none");
			idChkFlag = 0;
		}
		else {
			$.ajax({
				url : '${ctp}/member/uidCheck',
				type : 'post',
				data : {uid : uid},
				success : function(res) {
					if(res == 1) {
						$('.input-uid.active').css("border-bottom-color", "#4ebf3c");
						$('.chk-id-ok').css("display", "block");
						$('.chk-id-re').css("display", "none");
						$('.chk-id-no').css("display", "none");
						idChkFlag = 1;
					}
					else {
						$('.input-uid.active').css("border-bottom-color", "#d01012");
						$('.chk-id-no').css("display", "block");
						$('.chk-id-re').css("display", "none");
						$('.chk-id-ok').css("display", "none");
						idChkFlag = 0;
					}
				},
				error : function() {
					alert("전송 오류입니다.");
				}
			});
		}
	});
}

function emailCheck() {
	$('#email').on("keyup", function() {
		let email = this.value;
		let regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		
		if(email == "") {
			$('.input-email.active').css("border-bottom-color", "#bbb");
			$('.chk-email-re').css("display", "none");
			$('.chk-email-no').css("display", "none");
			$('.chk-email-ok').css("display", "none");
			emailChkFlag = 0;
		}
		
		else if(!regEmail.test(email)) {
			$('.input-email.active').css("border-bottom-color", "#d01012");
			$('.chk-email-re').css("display", "block");
			$('.chk-email-no').css("display", "none");
			$('.chk-email-ok').css("display", "none");
			emailChkFlag = 0;
		}
		else {
			$.ajax({
				url : '${ctp}/member/emailCheck',
				type : 'post',
				data : {email : email},
				success : function(res) {
					if(res == 1) {
						$('.input-email.active').css("border-bottom-color", "#4ebf3c");
						$('.chk-email-ok').css("display", "block");
						$('.chk-email-re').css("display", "none");
						$('.chk-email-no').css("display", "none");
						emailChkFlag = 1;
					}
					else {
						$('.input-email.active').css("border-bottom-color", "#d01012");
						$('.chk-email-no').css("display", "block");
						$('.chk-email-re').css("display", "none");
						$('.chk-email-ok').css("display", "none");
						emailChkFlag = 0;
					}
				},
				error : function() {
					alert("전송 오류입니다.");
				}
			});
		}
	});
}
function pwdCheck() {
	$('#pwd').on("keyup", function() {
		var pwd = this.value;
		let regPwd = /^[a-zA-Z0-9_]{4,20}$/;
		
		if(pwd == "") {
			$('.chk-pwd-re').css("display", "none");
			$('.chk-pwd-ok').css("display", "none");
			$('.input-pwd.active').css("border-bottom-color", "#bbb");
		}
		
		else if(!regPwd.test(pwd)) {
			$('.chk-pwd-re').css("display", "block");
			$('.chk-pwd-ok').css("display", "none");
			$('.input-pwd.active').css("border-bottom-color", "#d01012");
		}
		else {
			$('.input-pwd.active').css("border-bottom-color", "#4ebf3c");
			$('.chk-pwd-ok').css("display", "block");
			$('.chk-pwd-re').css("display", "none");
		}
	});
}
function joinSubmitChk() {
	let regUid = /^[a-zA-Z0-9_]{4,20}$/;
	let regEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	let regPwd = /^[a-zA-Z0-9_]{4,20}$/;

	let uid = myform.uid.value.trim();
	let email = myform.email.value.trim();
	let pwd = myform.pwd.value.trim();

	let submitFlag = 0;
	
	if(idChkFlag != 1 || !regUid.test(uid)) {
		alert("아이디를 다시 확인해주세요.");
		myform.uid.focus();
		return false;
	}
	else if(!regPwd.test(pwd)) {
		alert("비밀번호를 다시 확인해주세요.");
		myform.pwd.focus();
		return false;
	}
	else if(!regEmail.test(email) || emailChkFlag != 1) {
        alert("이메일을 다시 확인해주세요.");
        myform.email.focus();
        return false;
    }
	else {
		submitFlag = 1;
	}
	if(submitFlag == 1) {
		myform.submit();
	}
	else {
		alert("회원가입에 실패하였습니다. \n입력하신 정보를 다시 확인해주세요.");
	}
}

</script>
</head>
<body>
<main>
	<div class="box">
		<div class="inner-box">
			<div class="forms-wrap">
				<form autocomplete="off" name="myform" class="sign-up-mode" method="post">
					<div class="logo">
						<h4></h4>
					</div>
			
					<div class="heading">
						<h2>회원가입</h2>
						<h6>이미 계정이 있으신가요?</h6>
						<a href="${ctp}/member/memberLogin" class="toggle">로그인 하러가기</a>
					</div>
			
					<div class="actual-form">
						<div class="input-wrap">
							<input type="text" class="input-field input-uid" name="uid" id="uid" oninput="uidCheck()" autocomplete="off" required />
							<label class="input-tag">아이디</label>
							<div class="chk-id-ok">사용 가능한 아이디입니다.</div>
							<div class="chk-id-no">이미 사용중인 아이디입니다.</div>
							<div class="chk-id-re">아이디는 4-20자의 영문,숫자 조합만 가능합니다.</div>
						</div>
			
						<div class="input-wrap">
							<input type="email" class="input-field input-email" name="email" id="email" oninput="emailCheck()" autocomplete="off" required />
							<label class="input-tag">이메일</label>
							<div class="chk-email-ok">사용 가능한 이메일입니다.</div>
							<div class="chk-email-no">이미 사용중인 이메일입니다.</div>
							<div class="chk-email-re">이메일 형식을 확인해주세요.</div>
						</div>
			
						<div class="input-wrap">
							<input type="password" class="input-field input-pwd" name="pwd" id="pwd" oninput="pwdCheck()" autocomplete="off" required />
							<label class="input-tag">비밀번호</label>
          					<div class="chk-pwd-ok">사용 가능한 비밀번호입니다.</div>
							<div class="chk-pwd-re">비밀번호는 4-20자의 영문,숫자 조합만 가능합니다</div>
						</div>
			
						<input type="button" value="회원가입" onclick="joinSubmitChk()" class="sign-btn" />
					</div>
				</form>
			</div>
			<div class="carousel">
				<a href="${ctp}/"><div class="images-wrapper">
					<img src="${ctp}/resources/images/lego.png" class="image img-1 show" alt="레고 로고" />
				</div></a>
			</div>
		</div>
	</div>
</main>

<script>
 	const inputs = document.querySelectorAll(".input-field");
	
	inputs.forEach((inp) => {
	  inp.addEventListener("focus", () => {
	    inp.classList.add("active");
	  });
	  inp.addEventListener("blur", () => {
	    if (inp.value != "") return;
	    inp.classList.remove("active");
	  });
	});
	
</script>
</body>
</html>