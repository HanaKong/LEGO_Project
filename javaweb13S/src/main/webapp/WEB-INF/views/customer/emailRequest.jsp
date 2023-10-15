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
    <link rel="stylesheet" href="${ctp}/css/emailRequest.css">
    <title>문의하기 | LEGO SHOP</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    <div class="inquiry-container">
        <div class="title">레고 전문가에게 문의하기</div>
        <div class="img-box">
            <a href="">
                <img src="${ctp}/images/customer/emailRequest.webp" alt="이메일 문의 사진">
            </a>
        </div>
        <div class="sub-box">
            <div class="left-box">
                <div class="title-1">전화 문의</div>
                <div class="text">LEGO® 고객 서비스</div>
                <div class="text">000-0000-0000</div>
                <div class="text">오전 9시-오후 6시 (월요일-금요일)</div>
                <div class="text">무료 번호는 일부 공급자에 의해 차단될 수 있습니다.<br> 휴대폰으로 통화 시 요금이 부과될 수 있습니다. 자세한 내용은 제공업체에 문의하세요.
                </div>
            </div>
            <div class="right-box">
                <div class="title-1">편지 문의</div>
                <div class="text">현재 귀하의 지역에서는 서면 서신을 지원하지 않지만 <a href="">이메일을 보내주시면</a> 최선을 다해 도와 드리겠습니다.</div>
            </div>
        </div>
    </div>
    <div class="data-text">
        <div class="title">저희가 고객님의 데이터를 안전하게 보관하는 방법</div>
        <div class="text">당사는 귀하의 개인 정보를 주의, 신뢰 및 존중으로 취급하기 위해 최선을 다하고 있습니다.</div>
        <div class="text"> 우리는 관행과 정책에 투명성을 제공하기 위해 개인 정보 보호 정책을 만들었습니다.</div>
        <div class="active-text"><a href="${ctp}/customer/aboutPrivacy">더 알아보기</a></div>
    </div>
    <div class="inquiry-margin-top"></div>    
</body>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</html>