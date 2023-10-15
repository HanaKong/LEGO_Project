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
    <link rel="stylesheet" href="${ctp}/css/memberDel.css">
    <script>
    	function userDelChk() {
    		if(document.querySelector('.confirmDel').checked) {
    			location.href = "${ctp}/member/memberDelOk";
    		}
    		else {
    			alert('회원탈퇴 동의버튼을 클릭하셔야 탈퇴하실 수 있습니다.');
    			return false;
    		}
    	}
    </script>
    <title>회원 탈퇴 | LEGO SHOP</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    <div class="user-del-container">
        <div class="user-del-title">회원 탈퇴</div>
        <div class="del-sub-box">
            <div class="sub-box-title">회원탈퇴 시 개인정보 및 레고사이트에서 만들어진 모든 데이터는 삭제됩니다.</div>
            <div class="sub-box-title-1">(단, 아래 항목은 표기된 벌률에 따라 특정 기간 동안 보관됩니다.)</div>
            <div class="sub-content">1. 계약 또는 청약철회 등에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자 보호에 관한 법률 / 보존 기간 : 5년</div>
            <div class="sub-content">2. 대금결제 및 재화 등의 공급에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 벌률 / 보존 기간 : 5년</div>
            <div class="sub-content">3. 전자금융 거래에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 보존 기간 / 3년</div>
            <div class="sub-content">4. 소비자의 불만 또는 분쟁처리에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 보존기간 / 3년</div>
            <div class="sub-content">5. 신용정보의 수집/처리 및 이용 등에 관한 기록 보존 이유 : 신용정보의 이용 및 보호에 관한 법률 보존기간 / 3년</div>
            <div class="sub-content">6. 전자(세금)계산서 시스템 구축 운영하는 사업자가 지켜야 할 사항 고시(국세청 고시 제 2016-3호) (전자세금계산서 사용자에 한함): 5년
                (단,(세금)계산서 내 개인식별번호는 3년 경과후 파기)</div>
        </div>
        <div class="chk-box">
            <input type="checkbox" class="confirmDel" id="chk-box-1" value="0" />
            <label for="chk-box-1">해당 내용을 모두 확인했으며, 회원탈퇴에 동의합니다.</label>
        </div>
        <div class="btn-box">
            <input type="button" class="btn" value="취소" onclick="location.href='${ctp}/member/mypage';">
            <input type="button" class="btn" value="회원탈퇴" onclick="userDelChk()">
        </div>
    </div>
    <div class="user-del-margin-top"></div>
</body>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</html>