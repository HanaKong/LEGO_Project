<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ctp}/css/default.css">
<link rel="stylesheet" href="${ctp}/css/pwdSearch.css">
<link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<title>비밀번호 찾기 | LEGO SHOP</title>
</head>
<body>
<form name="myform" method="post">
	<div class="pwdFind-box">
		<div class="pwdFind-box-1">
			<div class="input-text-box">
				<div class="input-text-1">
					이메일로<br>
					임시 비밀번호를 발송합니다.
				</div>
				<div class="input-text-2">
    				레고 서비스 가입 시 이용한 계정의 연락처 이메일로<br>임시 비밀번호를 발송합니다.
  				</div>
			</div>
			<div class="email-input-box" style="margin-bottom: 20px;">
				<div class="input-head">아이디</div>
				<input type="text" class="email-input" name="uid-input" id="uid-input" placeholder="아이디을 입력하세요." autocomplete="off" required />
			</div>
			<div class="email-input-box">
				<div class="input-head">연락처 이메일</div>
				<input type="email" class="email-input" name="email-input" id="email-input" placeholder="이메일을 입력하세요." autocomplete="off" required />
			</div>
			<div class="pwd-close-box">
				<div><input type="submit" class="findPwd-submit" value="확인" /></div>
				<div><input type="button" class="findPwd-close" onclick="window.close()" value="닫기" /></div>
			</div>
		</div>
	</div>
</form>
</body>
</html>