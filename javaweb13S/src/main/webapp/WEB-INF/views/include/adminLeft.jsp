<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
<link rel="stylesheet" href="${ctp}/css/default.css">
<style type="text/css">
	@font-face {
	    font-family: 'SUITE-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
	    font-weight: 400;
	    font-style: normal;
	}
	* {
        font-family: 'SUITE-Regular';
        color: #555;
        font-weight: 400;
    }
    .admin-container {
    	display : grid;
    }
    .admin-left-container {
        position: fixed;
        width: 250px;
        height: 100vh;
        background-color: #f8f8f8;
    }
    .admin-left-container h4 {
        padding-top: 50px;
        font-size: 1.3rem;
        font-weight : 600;
    }
    .admin-left-container hr {
        width: 180px;
        text-align: center;
        margin: 20px auto 20px;
        border-color: #333;
        display: block;
    }
    .admin-left-container p {
        margin: 20px auto 20px;
        font-size: 1.1rem;
    }
</style>
<title>관리자 페이지 왼쪽</title>
</head>
<body>
	<div class="admin-container">
		<div class="text-center admin-left-container">
	        <h4><a href="${ctp}/admin/adminMain">관리자메뉴</a></h4>
	        <hr/>
	        <p><a href="${ctp}/admin/memberList">회원 관리</a></p>
	        <hr/>
	        <p><a href="${ctp}/admin/category" >카테고리 등록</a></p>
	        <p><a href="${ctp}/admin/regProduct" >상품 등록</a></p>
	        <p><a href="${ctp}/admin/productImg" >상품 이미지 등록</a></p>
	        <p><a href="${ctp}/admin/productList" >상품 리스트</a></p>
	        <hr/>
	        <p><a href="" >브릭(누락/파손)신청</a></p>
	        <p><a href="" >1:1 문의</a></p>
	        <p><a href="${ctp}/admin/storeMap" >스토어 지도 관리</a></p>
	        <p><a href="${ctp}/admin/qnaReply" >Q&amp;A 답변</a></p>
	        <p><a href="" >리뷰 관리</a></p>
	        <p><a href="" >Q&amp;A 관리</a></p>
	        <p><a href="" >구독 이메일 전송</a></p>
	        <hr/>
	        <p><a href="${ctp}/" >메인페이지로</a></p>
	        <p><a href="${ctp}/member/memberLogout" >로그아웃</a></p>
	    </div>
    </div>
</body>
</html>