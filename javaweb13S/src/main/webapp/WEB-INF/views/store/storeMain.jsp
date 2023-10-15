<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
	<link rel="stylesheet" href="${ctp}/css/default.css">
	<link rel="stylesheet" href="${ctp}/css/header.css">
	<link rel="stylesheet" href="${ctp}/css/storeMain.css">
	<link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
	<link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>	
	<title>레고 쇼핑 | LEGO SHOP</title>
	<script>
		let link = document.location.href;
		//주소 꼭 바꿔줘야해요!!! 서버 주소로...
		if(link != 'http://49.142.157.251:9090/javaweb13S/store/storeMain') {
			window.addEventListener('load', () => {
		
			    const scrollMove = document.querySelector('.scrollToHere');
			    const top = scrollMove.getBoundingClientRect().top;
		
			    window.scrollTo(0, top);
			});
			if ('scrollRestoration' in history) {
			    history.scrollRestoration = 'manual';
			}
		}
		'use strict';
		function cartDirect(idx) {
			if(${sUid == null}) {
				let ans = confirm("로그인 후 이용 가능합니다. \n로그인창으로 이동하시겠습니까?");
				if(!ans) {
					return false;
				}
				else {
					location.href="${ctp}/member/memberLogin";
				}
			}
			else {
				let res = 0;
				$.ajax({
					url : '${ctp}/store/cartDirect',
					type : 'post',
					data : {idx : idx},
					success : function(res) {
							if(res == 1) {
								let ans = confirm("장바구니에 저장되었습니다.\n장바구니로 이동하시겠습니까?");
								if(!ans) location.reload();
								else {
									location.href = "${ctp}/store/cart";
								}
							}
							else {
								alert("장바구니 저장 실패! \n다시 시도하여주십시오.");
							}
					},
					error : function() {
						alert("전송 오류입니다.");
					}
				});
			}
		}
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<div class="store-main-container">
        <div class="head-banner">
            <div class="head-banner-img"><img src="${ctp}/images/store/store-banner.webp" /></div>
        </div>
        <span class="scrollToHere"></span>
        <div class="product-list-header">쇼핑하기</div>
        <div class="category-inner-box">
            <ul class="category-inner">
                <li><a href="${ctp}/store/storeMain?code=${code}&catN=${catN}&p=asc">낮은 가격순</a></li>
                <li><a href="${ctp}/store/storeMain?code=${code}&catN=${catN}&p=desc">높은 가격순</a></li>
            </ul>
        </div>
        <hr class="category-btm" />
        <div class="itemCount">${catN} (${productCount})</div>
        <div class="product-list-container">
            <div class="list-align-box">
                <div class="head">카테고리</div>
                <div class="text-box">
	                <c:forEach var="voc" items="${vosc}">
	                    <div class="text"><label><input type="checkbox" name="storeChk" value="${voc.categoryCode}" onclick="checkOnlyOne(this, '${voc.categoryName}')" <c:if test="${code == voc.categoryCode}">checked</c:if>>${voc.categoryName}</label></div>
	                </c:forEach>
                </div>
            </div>
            <div class="list-content-box">
                <!-- 반복 -->
                <c:forEach var="vo" items="${vos}" varStatus="st" >
                	<c:if test="${vo.switchItem != 0}">
		                <div class="list-content-item">
		                    <div class="cart-item">
		                        <a href="javascript:cartDirect(${vo.idx})">
		                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="20" viewBox="0 0 16 20" 
		                                aria-hidden="true" class="Icon__StyledSVG-lm07h6-0 uCSzk MainBarstyles__ActionIcon-sc-1cg7sjw-16 kfAPxF"
		                                data-di-res-id="b49257ca-b9e07780" data-di-rand="1688876890368">
		                                <g fill="currentColor" fill-rule="evenodd">
		                                    <path
		                                        d="M4 3.512v5.804c0 .377.349.684.779.684.43 0 .779-.307.779-.684V3.512C5.558 2.33 6.653 1.368 8 1.368c1.347 0 2.442.962 2.442 2.144v5.804c0 .377.35.684.78.684.43 0 .778-.307.778-.684V3.512C12 1.575 10.206 0 8 0S4 1.575 4 3.512z">
		                                    </path>
		                                    <path
		                                        d="M2.46 6.33c-.269 0-.489.194-.5.441L1.435 18.19a.436.436 0 00.131.332.52.52 0 00.348.149h12.151c.276 0 .501-.207.501-.462l-.525-11.436c-.011-.248-.23-.442-.5-.442H2.46zM14.448 20l-12.974-.001a1.591 1.591 0 01-1.064-.462 1.357 1.357 0 01-.408-1.03L.56 6.372C.595 5.602 1.277 5 2.11 5h11.78c.835 0 1.516.602 1.551 1.372l.56 12.197c0 .789-.697 1.431-1.553 1.431z">
		                                    </path>
		                                </g>
		                            </svg>
		                        </a>
		                    </div>
		                    <a href="${ctp}/store/storeContent?idx=${vo.idx}">
		                        <img src="${ctp}/data/admin/product/thumbnail/${vo.FName}">
		                    </a>
		                    <div class="content-inner">
		                        <div class="content-title">
		                            <div class="title-head">${vo.productName}
		                            </div>
		                            <c:if test="${vo.discountRate == 0}">
			                            <div class="title-price">
			                                <div class="price"><fmt:formatNumber value="${vo.productDiscountPrice}" type="number" />원</div>
			                            </div>
		                            </c:if>
		                            <c:if test="${vo.discountRate != 0}">
			                            <div class="title-price">
			                                <div class="price-box">
				                                <span class="price"><fmt:formatNumber value="${vo.price}" type="number" />원</span><span class="discountRate" style="color: coral;">${vo.discountRate}%</span>
	                                    		<div class="Aprice"><fmt:formatNumber value="${vo.productDiscountPrice}" type="number" />원</div>
	                                		</div>
			                            </div>
		                            </c:if>
		                        </div>
		                    </div>
		                </div>
	                </c:if>
                </c:forEach>
                <!-- 반복 -->
            </div>
        </div>
    </div>
    <div class="margin-index"></div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	<a><img id="back-to-top" src="${ctp}/images/main/up-to-top.png" /></a>
</body>
<script>
function checkOnlyOne(element, categoryName) {
    const checkboxes = document.getElementsByName("storeChk");
    checkboxes.forEach((cb) => {
        cb.checked = false;
    });
    element.checked = true;
    console.log(categoryName);
    
    location.href="${ctp}/store/storeMain?code="+element.value+"&catN="+categoryName;
}

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