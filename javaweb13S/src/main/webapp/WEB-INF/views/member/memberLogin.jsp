<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="${ctp}/css/login.css" />
<link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<title>로그인 | LEGO SHOP</title>
<script>
	function memberIdFind() {
		let url = "${ctp}/member/memberIdSearch";
		var idPopUp = window.open(url,"nWin","width=480px, height=480px, left=700px, top=200px, resizable=no, toolbars=no, menubar=no");
	}
	function memberPwdFind() {
		let url = "${ctp}/member/memberPwdSearch";
		var pwdPopUp = window.open(url,"nWin","width=480px, height=480px, left=700px, top=200px, resizable=no, toolbars=no, menubar=no");
	}
</script>
</head>
<body>
<main>
	<div class="box">
		<div class="inner-box">
			<div class="forms-wrap">
				<form autocomplete="off" class="sign-in-form" method="post">
					<div class="logo">
						<h4></h4>
					</div>

					<div class="heading">
						<h2>로그인</h2>
						<h6>회원이 아니신가요?</h6>
						<a href="${ctp}/member/memberJoin" class="toggle">회원가입 하러가기</a>
					</div>

					<div class="actual-form">
						<div class="input-wrap">
							<input type="text" class="input-field" name="uid" id="uid" value="${uid}" autocomplete="off" required autofocus />
							<label class="input-tag">아이디</label>
						</div>

						<div class="input-wrap">
							<input type="password" class="input-field" name="pwd" id="pwd" autocomplete="off" required />
							<label class="input-tag">비밀번호</label>
						</div>

						<div class="chk_id-box">
							<input type="checkbox" name="chk_id" id="chk_id" <c:if test="${!empty uid}">checked</c:if> />
							<label	for="chk_id" class="chk_id-btn"></label>
							<span class="chk_id-text">아이디 저장</span>
						</div>

						<input type="submit" value="로그인" class="sign-btn" />

						<p class="text" style="text-align:center;">
							<a href="#" onclick="memberIdFind()">아이디 찾기</a>
							<a href="#" onclick="memberPwdFind()">비밀번호 찾기</a>
						</p>
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