<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="${ctp}/css/default.css">
	<link rel="stylesheet" href="${ctp}/css/footer.css">
<title>footer</title>
</head>
<body>
	<div class="footer">
        <div class="footer-item"><a href="#"><img src="${ctp}/images/main/lego-main.png"></a></div>
        <div class="footer-item">
            <div class="item-2">레고 사이트 이메일 구독하기</div>
            <input type="email" placeholder="이메일을 입력해주세요" class="item-2-1" />
            <div class="item-2-2">매주 새로운 <br>레고 소식을 전해드립니다.</div>
            <input type="button" value="전송" class="item-2-3" />
        </div>
        <div class="footer-item">
            <div class="item-3">소개</div>
            <a href="" class="item-3-1">브랜드 소개</a>
        </div>
        <div class="footer-item">
            <div class="item-4">고객 지원</div>
            <a href="" class="item-4-1">조립설명서</a>
            <a href="" class="item-4-2">레고 스토어 찾기</a>
            <a href="" class="item-4-3">1:1 문의</a>
            <a href="" class="item-4-4">배송,반품 관련</a>
            <a href="" class="item-4-5">누락,파손 브릭</a>
        </div>
        <div class="footer-item">
            <div class="item-5">만든이</div>
            <a class="item-5-1">정원빈</a>
            <a class="item-5-2">연락처 : -</a>
            <a class="item-5-3">이메일 : wonbin1301@gmail.com</a>
        </div>
        <div class="footer-item">
            <div class="item-6">그린아트컴퓨터학원(청주)</div>
            <div class="item-6-1">충청북도 청주시 서원구 사창동 148-7</div>
            <div class="item-6-2">연락처 : 043-225-2111</div>
        </div>
    </div>
</body>
</html>