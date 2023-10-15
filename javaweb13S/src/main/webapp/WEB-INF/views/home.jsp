<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%-- <jsp:include page="/WEB-INF/views/include/bs4.jsp" /> --%>
	<link rel="stylesheet" href="${ctp}/css/default.css">
	<link rel="stylesheet" href="${ctp}/css/main.css">
	<link rel="stylesheet" href="${ctp}/css/header.css">
	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
	<link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
	<link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
	<title>홈 | LEGO SHOP</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
   	<div class="main-banner-box">
		<img class="main-banner" src="${ctp}/images/main/lego-banner1.webp" alt="스파이더맨 배너">
    </div>
    <div class="menu-box-container">
        <div class="menu-box">
            <div class="menu-item">
                <div class="item-text">
                    <div class="item-text-head">무한한 가능성을 담은</div>
                    <div class="item-text-head-2">레고로 세계를 만들어보세요!</div>
                    <div class="item-text-content-1">레고의 마법같은 조각들로</div>
                    <div class="item-text-content-2">현실과 상상의 경계를</div>
                    <div class="item-text-content-3">허물어보세요!</div>
                    <a href="${ctp}/store/storeMain" class="item-text-content-4" >더보기</a>
                </div>
            </div>
            <a href="${ctp}/store/storeMain?code=MINS" class="menu-item">
                <span class="item-text">미니언즈</span>
            </a>
            <a href="${ctp}/store/storeMain?code=DZNY" class="menu-item">
                <span class="item-text">디즈니</span>
            </a>
            <a href="${ctp}/store/storeMain?code=SUMA" class="menu-item">
                <span class="item-text">슈퍼 마리오</span>
            </a>
            <a href="${ctp}/store/storeMain?code=STWA" class="menu-item">
                <span class="item-text">스타워즈</span>
            </a>
            <a href="${ctp}/store/storeMain?code=HAPO" class="menu-item">
                <span class="item-text">해리포터</span>
            </a>
            <a href="${ctp}/store/storeMain?code=DRMS" class="menu-item">
                <span class="item-text">드림즈</span>
            </a>
            <a href="${ctp}/store/storeMain?code=TECH" class="menu-item">
                <span class="item-text">테크닉</span>
            </a>
        </div>
    </div>
    <div class="item-sort-box">
        <div class="sort-box-left">
            <div class="sort-text">다른 시리즈</div>
        </div>
        <div class="sort-box-right">
            <a href="${ctp}/store/storeMain?code=ARCH" class="sort-item">아키텍처</a>
            <a href="${ctp}/store/storeMain?code=NJGO" class="sort-item">닌자고</a>
            <a href="${ctp}/store/storeMain?code=MARV" class="sort-item">마블</a>
            <a href="${ctp}/store/storeMain?code=MICR" class="sort-item">마인크래프트</a>
            <a href="${ctp}/store/storeMain?code=LOTR" class="sort-item">반지의제왕</a>
            <a href="${ctp}/store/storeMain?code=ICNS" class="sort-item">아이콘즈</a>
            <a href="${ctp}/store/storeMain?code=INJO" class="sort-item">인디아나존스</a>
        </div>
    </div>
    
    <div class="support-box">
        <a href="${ctp}/customer/customerMain"><img class="support-box-img" src="${ctp}/images/main/support.webp" alt="문의하기" /></a>
    </div>
    
    <div class="app-list-box">
        <div class="app-list-left">
            <div class="app-list-text">레고 게임</div>
        </div>
        <div class="app-list-right">
            <a href="https://www.lego.com/ko-kr/kids/webgames" class="app-list list-left">
                <div class="app-list-1">레고 레이서</div>
                <img class="app-list-1-1" src="${ctp}/images/main/lego_racers.webp" alt="레고 레이서">
            </a>
            <a href="https://www.lego.com/ko-kr/kids/webgames" class="app-list list-right">
                <div class="app-list-1">레고 아일랜드</div>
                <img class="app-list-1-1" src="${ctp}/images/main/lego_Island.webp" alt="레고 아일랜드">
            </a>
            <a href="https://www.lego.com/ko-kr/kids/webgames" class="app-list list-left">
                <div class="app-list-1">레고 무비2</div>
                <img class="app-list-1-1" src="${ctp}/images/main/lego_movie2.webp" alt="">
            </a>
            <a href="https://www.lego.com/ko-kr/kids/webgames" class="app-list list-right">
                <div class="app-list-1">브릭 테일즈</div>
                <img class="app-list-1-1" src="${ctp}/images/main/lego-bricktales.webp" alt="">
            </a>
        </div>
    </div>
    <div class="more-game-btn">
        <a class="more-game" href="https://www.lego.com/ko-kr/kids/webgames">더 많은 게임 보러가기</a>
    </div>
    
    <div class="footer-gap">
    </div>
    <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
    <a><img id="back-to-top" src="${ctp}/images/main/up-to-top.png" /></a>
</body>
<script>

//맨위로 이동 (jQuery)
$(function(){
	$('#back-to-top').on('click',function(e){
	    e.preventDefault();
	    $('html,body').animate({scrollTop:0}, 600);
	});
	
	$(window).scroll(function() {
	    if ($(document).scrollTop() > 300) {
	        $('#back-to-top').addClass('show');
	    } else {
	        $('#back-to-top').removeClass('show');
	    }
	});
});
</script>
</html>
