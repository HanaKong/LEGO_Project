<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ctp}/css/default.css">
<link rel="stylesheet" href="${ctp}/css/idView.css">
<link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<title>아이디 찾기 | LEGO SHOP</title>
</head>
<body>
	<div class="idView-box">
		<div class="inner-box">
			<h2 class="inner-box-text1">아이디찾기</h2>
			<div class="inner-box-text2">개인정보 도용에 대한 피해를 방지하기 위하여<br> 아이디 끝 두자리에서 네자리는 **처리합니다.</div>
			<hr class="text-under" />
			<div class="inner-box-text3">회원님의 아이디는<br>
				<span style="color:#333; font-weight: 700; text-decoration: underline;">${IdFound}</span>(으)로<br>
				등록되어있습니다.
			</div>
			<hr class="text-under" />
			<div><input type="button" class="findUid-close" onclick="window.close()" value="닫기" /></div>
		</div>
	</div>
</body>
</html>