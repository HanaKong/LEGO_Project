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
    <link rel="stylesheet" href="${ctp}/css/vipAd.css">
    <title>title | LEGO SHOP</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    <div class="vip-container">
        <div class="left-box">
            <div class="title">레고® VIP가 되어 리워드를 누려보세요.</div>
            <div class="title">가입은 무료랍니다!</div>
            <div class="sub-title">기존 계정에 로그인하거나 신규 회원가입 후 포인트 적립 등 다양한 혜택을 누려 보세요!</div>
            <c:if test="${sLevel == 2}">
	            <div class="join">
	                <input type="button" value="VIP 가입하기" onclick="location.href='${ctp}/member/vipLevelUp';">
	            </div>
            </c:if>
            <div class="title-btm"></div>
            <div class="good"><span>◇</span>LEGO.com에서 쇼핑 시 포인트 적립</div>
            <div class="good"><span>◇</span>회원 전용 할인 혜택 및 경험</div>
            <div class="good"><span>◇</span>독점 제품 세트 얼리 액세스 구매</div>
            <div class="good"><span>◇</span>회원 전용 선물 등 다양한 혜택</div>
            <div class="good"><span>◇</span>VIP를 위한 월간 프로모션과 스폐셜 상품</div>
        </div>
        <div class="right-box">
            <img src="${ctp}/images/member/King_VIP_Guide-min.png" alt="vip 이미지">
        </div>
    </div>
    <div class="img-box">
    	<img alt="vip홍보문구" src="${ctp}/images/member/vip-img.webp">
    </div>
    
    <div class="vip-margin-top"></div>
</body>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</html>