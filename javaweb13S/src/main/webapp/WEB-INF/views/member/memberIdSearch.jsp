<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ctp}/css/idSearch.css">
<link rel="stylesheet" href="${ctp}/css/default.css">
<link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<script>
if(${sUuid != null}) {
var setTime = 180;
function timeCount() {      
    time = String(Math.floor(setTime / 60)).padStart(2,0) + " : " +  String((setTime % 60)).padStart(2,0);         
    document.all.idSearchTimer.innerHTML = time;                  
    setTime--; 
    if (setTime < 0) {        
        clearInterval(timerEnd);
        alert("시간이 초과되었습니다.");
        location.href = window.close();
    }       
}
window.onload = function TimerStart(){timerEnd = setInterval('timeCount()',1000)};
}

function NotReload(){
    if((event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116)) {
        event.keyCode = 0;
        event.cancelBubble = true;
        event.returnValue = false;
    } 
}
</script>
<title>아이디 찾기 | LEGO SHOP</title>
</head>
<body>
<form name="myform" method="post">
	<div class="idFind-box">
		<div class="idFind-box-1">
			<div class="input-text-box">
				<div class="input-text-1">
					이메일로<br>
					계정을 찾습니다.
				</div>
				<div class="input-text-2">
					레고 서비스 가입 시 사용한 계정의 연락처인<br> 이메일로 계정을 찾습니다.
				</div>
			</div>
			<c:if test="${sUuid == null}">
				<div class="email-input-box">
					<div class="input-head">연락처 이메일</div>
					<input type="email" class="email-input" name="email-input" id="email-input" placeholder="이메일" autocomplete="off" required />
				</div>
				<div class="uid-close-box">
					<div><input type="submit" class="findUid-submit" value="확인" /></div>
					<div><input type="button" class="findUid-close" onclick="window.close()" value="닫기" /></div>
					<input type="hidden" name="IdFindFlag" value="1" />
				</div>
			</c:if>
			<c:if test="${sUuid != null}">
				<div class="email-input-box">
					<div class="input-head">인증 번호 확인</div>
					<input type="text" class="email-input" name="email-input" id="email-input" placeholder="인증번호 6자리" autocomplete="off" required />
					<span id="idSearchTimer"></span>
				</div>
				<div class="uid-close-box">
					<div><input type="submit" class="findUid-submit" value="확인" /></div>
					<div><input type="button" class="findUid-close" onclick="window.close()" value="닫기" /></div>
					<input type="hidden" name="IdFindFlag" value="${sUuid}" />
					<input type="hidden" name="IdFound" value="${sIdFound}" />
				</div>
			</c:if>
		</div>
	</div>
</form>
</body>
</html>