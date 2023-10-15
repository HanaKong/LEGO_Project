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
    <link rel="stylesheet" href="${ctp}/css/memberPwdEdit.css">
    <script>
    	function memberPwdEditChk() {
    		let pwdNow = myform.pwdNow.value.trim();
	    	let pwdNew = myform.pwdNew.value.trim();
	    	let pwdNewRe = myform.pwdNewRe.value.trim();
	    	let regPwd = /^[a-zA-Z0-9_]{4,20}$/;
			
	    	
	    	if(pwdNow == "") {
	    		alert('비밀번호를 입력해주세요');
	    		myform.pwdNow.focus();
	    		return false;
	    	}
	    	else if(pwdNew == "") {
	    		alert('비밀번호를 입력해주세요');
	    		myform.pwdNew.focus();
	    		return false;
	    	}
	    	else if(pwdNewRe == "") {
	    		alert('비밀번호를 입력해주세요');
	    		myform.pwdNewRe.focus();
	    		return false;
	    	}
	    	else if(!regPwd.test(pwdNow)) {
	    		alert("비밀번호를 다시 확인해주세요. \n비밀번호는 영문,숫자 4-20자리만 가능합니다.");
	    		myform.pwdNow.focus();
	    		return false;
	    	}
	    	else if(!regPwd.test(pwdNew)) {
	    		alert("비밀번호를 다시 확인해주세요. \n비밀번호는 영문,숫자 4-20자리만 가능합니다.");
	    		myform.pwdNew.focus();
	    		return false;
	    	}
	    	else if(pwdNew != pwdNewRe) {
	    		alert("비밀번호가 일치하지 않습니다.");
	    		myform.pwdNewRe.focus();
	    	}
	    	else if(pwdNow == pwdNew) {
	    		alert("바꾸려는 비밀번호가 현재 비밀번호와 일치합니다.");
	    		myform.pwdNew.focus();
	    	}
	    	else {
	    		myform.submit();
	    	}
    	}
    </script>
    <title>비밀번호 변경 | LEGO SHOP</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    <div class="pwd-change-box">
        <div class="pwd-change-title">비밀번호 변경하기</div>
        <div class="helper-box">
            <div class="head-text-box">
                <div class="title">현재 비밀번호를 입력한 후 새로 사용할 비밀번호를 입력하세요</div>
                <div class="content">회원님, 비밀번호를 다음과 같이 설정하시면 유출될 위험이 높습니다.</div>
                <div class="content-1">- 아이디와 동일한 비밀번호</div>
                <div class="content-1">- 주민등록번호/사업자등록번호/생일/학번/전화번호 등 회원정보와 관련된 숫자로 된 비밀번호</div>
                <div class="content-1">- 연속된 숫자, 동일 반복된 숫자 등 다른사람이 쉽게 알아 낼 수 있는 비밀번호</div>
            </div>
            <div class="head-sub-text-box">
                <img src="${ctp}/images/member/exclamation1.webp" alt="주의">
                <div class="content">여러 사이트에 동일한 비밀번호를 사용하면 도용되기 쉬우므로 비밀번호를 주기적으로 변경해주는 것이 안전합니다.</div>
            </div>
        </div> 
        <div class="content-line-top"></div>
        <form name="myform" method="post">
            <div class="pwd-content-box">
                <div class="content-1">
                    <div><label for="pwdNow">현재 비밀번호</label></div>
                    <div><input type="password" class="pwd-input" name="pwdNow" id="pwdNow" /></div>
                </div>
                <div class="content-2">
                    <div><label for="pwdNew">새 비밀번호</label></div>
                    <div><input type="password" class="pwd-input" name="pwdNew" id="pwdNew"/></div>
                </div>
                <div class="content-3">
                    <div><label for="pwdNewRe">새 비밀번호 확인</label></div>
                    <div><input type="password" class="pwd-input" name="pwdNewRe" id="pwdNewRe" /></div>
                </div>
            </div>
            <div class="content-line-btm"></div>
            <div class="btn-box">
                <input type="button" value="변경하기" onclick="memberPwdEditChk()" />
            </div>
        </form>
    </div>
    <div class="memberPwdEdit-margin-top"></div>
    <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>