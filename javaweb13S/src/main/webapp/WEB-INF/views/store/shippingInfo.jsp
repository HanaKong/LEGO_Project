<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<script src="${ctp}/js/daumAddr.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="${ctp}/css/default.css">
<link rel="stylesheet" href="${ctp}/css/shippingInfo.css">
<link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<script>
const autoHyphen = (target) => {
	target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}

function shippingInfoChk() {
	let name = myform.nameInput.value.trim();
	let tel = myform.telInput.value.trim();
	let postCode = myform.postcode.value.trim();
	let roadAddress = myform.roadAddress.value.trim();
	let detailAddress = myform.detailAddress.value.trim();
	
	let regName = /[a-zA-Z가-힣]{2,20}$/;
	let regTel = /\d{2,3}-\d{3,4}-\d{4}/;
	
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
	else if(postCode == "" || roadAddress == "" || detailAddress == "") {
		alert("주소를 다시 확인해주세요.");
		return false;
	}
	else {
		opener.document.querySelector('#opener2Name').textContent = document.getElementById("nameInput").value;
		opener.document.querySelector('#opener2Tel').textContent = document.getElementById("telInput").value;
		opener.document.querySelector('#opener2RoadAddr').textContent = document.getElementById('sample6_address').value;
		opener.document.querySelector('#opener2DetailAddr').textContent = document.getElementById("sample6_detailAddress").value;
		opener.document.querySelector('#opener2Postcode').textContent = document.getElementById("sample6_postcode").value;
		window.close();
	}
}
</script>
<title>배송정보 변경 | LEGO SHOP</title>
</head>
<body>
<form name="myform">
	<div class="customerInfo-box">
	    <div class="customerInfo-box-1">
	        <div class="input-text-box">
	            <div class="input-text-1">
	                배송 정보 수정
	            </div>
	            <div class="email-input-box">
	                <div class="input-head">이름</div>
	                <input type="text" class="email-input" name="nameInput" id="nameInput" placeholder="이름" autocomplete="off" required />
	            </div>
	            <div class="email-input-box">
	                <div class="input-head">연락처</div>
	                <input type="text" class="email-input" name="telInput" id="telInput" oninput="autoHyphen(this)" maxlength="13" placeholder="전화번호" autocomplete="off" required />
	            </div>
	            <div class="email-input-box">
	                <div class="input-head">우편번호</div>
	                <div class="content-box">
	                    <input type="text" class="email-input" name="postcode" id="sample6_postcode" placeholder="우편번호" autocomplete="off" required />
	                    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary" />
	                </div>
	            </div>
	            <div class="email-input-box">
	                <div class="input-head">주소</div>
	                <input type="text" class="email-input" name="roadAddress" id="sample6_address" size="50" placeholder="주소" />
	            </div>
	            <div class="email-input-box">
	                <div class="input-head">상세주소</div>
	                <div class="content-box">
	                    <input type="text" class="email-input" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" />
	                    <input type="text" class="email-input" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" />
	                </div>
	            </div>
	            <div class="customerInfo-close-box">
	                <div><input type="submit" class="customerInfo-submit" value="확인" onclick="shippingInfoChk()" /></div>
	                <div><input type="button" class="customerInfo-close" onclick="window.close()" value="닫기" />
	                </div>
	                <input type="hidden" name="customerInfoFlag" value="1" />
	            </div>
	        </div>
	    </div>
	</div>
</form>
</body>
</html>