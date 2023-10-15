<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${ctp}/css/default.css">
<link rel="stylesheet" href="${ctp}/css/companyProfile.css">
<link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<title>브랜드 소개 | LEGO SHOP</title>
</head>
<body>
<body>
	<div class="head-main">
        <div class="main-left">
            <span><a class="main-logo" href="${ctp}/">
                <img class="main-logo" src="${ctp}/images/main/lego-main.png" alt="레고로고(홈으로)" />    
            </a></span>
        </div>
        <div class="head-center">
            <span class="main-brand"><a href="${ctp}/companyProfile">브랜드 소개</a></span>
            <span class="main-shopping"><a href="${ctp}/store/storeMain">레고 쇼핑</a></span>
            <span class="main-support"><a href="${ctp}/customer/customerMain">고객지원</a></span>
        </div>
        <div class="head-right">
            <div class="main-mypage">
                <div class="main-mypage-box">
                    <svg width="20" height="22" viewBox="0 0 20 22" aria-hidden="true"
                        xmlns="http://www.w3.org/2000/svg"
                        class="Icon__StyledSVG-lm07h6-0 cnHyRF UtilityBarstyles__AccountIcon-sc-1uwh8t8-5 KHcEY svg-img"
                        data-di-rand="1687786397998" data-di-res-id="16b7fdac-bc02bc2e">
                        <g transform="translate(1 1)" fill-rule="nonzero" fill="none">
                            <rect stroke="#2C2C2C" stroke-width="1.5" fill="#FFCF00" x="4.875" width="8.25"
                                height="6.038" rx=".729">
                            </rect>
                            <rect stroke="#2C2C2C" stroke-width="1.2" fill="#FFCF00" x="3.75" y="14.34" width="10.5"
                                height="5.66" rx=".729"></rect>
                            <path
                                d="M14.25 17.736H3.75C0 17.736 0 14.717 0 14.717v-8.68S0 3.02 3.75 3.02h10.5C18 3.019 18 6.038 18 6.038v8.679s0 3.019-3.75 3.019z"
                                stroke="#2C2C2C" stroke-width="1.5" fill="#FFCF00"></path>
                            <path
                                d="M7.125 8.868a.94.94 0 00-.938-.943.94.94 0 00-.937.943c0 .52.42.943.938.943a.94.94 0 00.937-.943zm4.688-.943a.94.94 0 00-.938.943c0 .52.42.943.938.943a.94.94 0 00.937-.943.94.94 0 00-.938-.943zm.293 3.86a.452.452 0 00-.649.21c-.005.008-.461.84-2.463.84-1.953 0-2.437-.793-2.462-.84a.446.446 0 00-.638-.234.618.618 0 00-.215.761c.063.147.69 1.446 3.315 1.446s3.25-1.299 3.313-1.446a.609.609 0 00-.201-.738z"
                                fill="#2C2C2C"></path>
                        </g>
                    </svg>
                    <div class="mypage-text">MY ACCOUNT</div>
                    <div class="hamburger">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                </div>
                <ul class="options">
		            <li class="option">
		                <a <c:if test="${sUid != null}">href="${ctp}/member/mypage"</c:if> <c:if test="${sUid == null}">href="${ctp}/member/memberLogin"</c:if>><span class="option-text">마이 페이지</span></a>
		            </li>
	            <c:if test="${empty sLevel}">
		            <li class="option">
		                <a href="${ctp}/member/memberLogin"><span class="option-text">로그인</span></a>
		            </li>
	            </c:if>
	            <c:if test="${!empty sLevel}">
		            <li class="option">
		                <a href="${ctp}/member/memberLogout"><span class="option-text">로그아웃</span></a>
		            </li>
	            </c:if>
	            <c:if test="${sLevel == 0}">
		            <li class="option">
		                <a href="${ctp}/admin/adminMain"><span class="option-text">관리자페이지</span></a>
		            </li>
	            </c:if>
		        </ul>
            </div>
            <span class="main-cart-box">
                <a <c:if test="${sUid != null}">href="${ctp}/store/cart"</c:if> <c:if test="${sUid == null}">href="${ctp}/member/memberLogin"</c:if>>
                    <div class="cart-name">BAG</div>
                    <div class="cart-num">${sCnt}</div>
                </a>
            </span>
        </div>
    </div>

	<div class="profile-img-box">
		<img alt="회사 소개 이미지" src="${ctp}/images/main/profile.webp" />
	</div>
	<div class="profile-margin"></div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	<a><img id="back-to-top" src="${ctp}/images/main/up-to-top.png" /></a>
</body>
<script>
//MY ACCOUNT 메뉴창
const optionMenu = document.querySelector(".main-mypage"),
    selectBtn = optionMenu.querySelector(".main-mypage-box"),
    options = optionMenu.querySelectorAll(".option"),
    mypage_text = optionMenu.querySelector(".mypage-text");

selectBtn.addEventListener("click", () => optionMenu.classList.toggle("active"));

document.addEventListener("click", e => {
	const target = event.target;
	if(!optionMenu.contains(target) && target != selectBtn) {
        optionMenu.classList.remove("active");
	}
})

$(function() {
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