<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="${ctp}/css/default.css">
<link rel="stylesheet" href="${ctp}/css/customerInfo.css">
<link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<script>
	const autoHyphen = (target) => {
		target.value = target.value
		   .replace(/[^0-9]/g, '')
		   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}

	function customerChk() {
		let name = myform.nameInput.value.trim();
		let tel = myform.telInput.value.trim();
		let email = myform.emailInput.value.trim();
		
		let regName = /[a-zA-Z가-힣]{2,20}$/;
		let regTel = /\d{2,3}-\d{3,4}-\d{4}/;
		let regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		
		if(!regName.test(name) || name == "") {
			alert("이름을 다시 확인해주세요.");
			myform.nameInput.focus();
			return false;
		}
		else if(!regTel.test(tel) || tel == "") {
			alert("전화번호를 다시 확인해주세요.");
			myform.telInput.focus();
			return false;
		}
		else if(!regEmail.test(email) || email == "") {
			alert("이메일을 다시 확인해주세요.");
			myform.emailInput.focus();
			return false;
		}
		else {
			opener.document.querySelector('#openerName').textContent = document.getElementById("nameInput").value;
			opener.document.querySelector('#openerTel').textContent = document.getElementById("telInput").value;
			opener.document.querySelector('#openerEmail').textContent = document.getElementById("emailInput").value;
			window.close();
		}
	}
</script>
<title>주문자 정보 수정 | LEGO SHOP</title>
</head>
<body>
	<form name="myform">
        <div class="customerInfo-box">
            <div class="customerInfo-box-1">
                <div class="input-text-box">
                    <div class="input-text-1">
                        주문자 정보 수정
                    </div>
                    <div class="email-input-box">
                        <div class="input-head">이름</div>
                        <input type="text" class="email-input" name="nameInput" id="nameInput" placeholder="이름"
                            autocomplete="off" required />
                    </div>
                    <div class="email-input-box">
                        <div class="input-head">연락처</div>
                        <input type="text" class="email-input" name="telInput" id="telInput" oninput="autoHyphen(this)" maxlength="13" placeholder="전화번호"
                            autocomplete="off" required />
                    </div>
                    <div class="email-input-box">
                        <div class="input-head">연락처 이메일</div>
                        <input type="text" class="email-input" name="emailInput" id="emailInput" placeholder="이메일"
                            autocomplete="off" required />
                    </div>
                    <div class="customerInfo-close-box">
                        <div><input type="button" class="customerInfo-submit" value="확인" onclick="javascript:customerChk()" /></div>
                        <div><input type="button" class="customerInfo-close" onclick="window.close()" value="닫기" />
                        </div>
                    </div>
                </div>
            </div>
		</div>
    </form>	
</body>
</html>