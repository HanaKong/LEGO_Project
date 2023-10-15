<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
    <link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <link rel="stylesheet" href="${ctp}/css/default.css">
    <link rel="stylesheet" href="${ctp}/css/verifyPwd.css">
    <script>
    	function pwdConfirm() {
    		if(document.querySelector('.pwd-input-text').value == "") {
    			alert('비밀번호를 입력해주세요.');
    			document.querySelector('.pwd-input-text').focus();
    			return false;
    		}
    		else {
    			myform.submit();	
    		}
    	}
    </script>
    <title>비밀번호 확인 | LEGO SHOP</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    <div class="pwdChk-box">
        <div class="pwdChk-title">회원정보 수정</div>
        <div class="title-btm"></div>
        <div class="content-box">
            <div class="content-title">비밀번호 확인</div>
            <div class="content-sub-title"><span>${sUid}</span>님의 회원정보를 안전하게 보호하기 위해 비밀번호를 한번 더 확인해주세요.</div>
            <form name="myform" method="post">
	            <div class="pwd-box">
	                <label for="pwd-input">비밀번호 입력 : </label>
	                <input type="password" class="pwd-input-text" name="pwd" id="pwd-input" />
	                <input type="hidden" name="sw" value="${SW}"/>
	                <input type="button" value="확인" onclick="javascript:pwdConfirm()" />
	            </div>
            </form>
        </div>
    </div>
    <div class="verifyPwd-margin"></div>
</body>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</html>