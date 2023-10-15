<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
	<link rel="stylesheet" href="${ctp}/css/default.css">
	<link rel="stylesheet" href="${ctp}/css/storeContent.css">
	<link rel="stylesheet" href="${ctp}/css/qna.css">
	<link rel="stylesheet" href="${ctp}/css/review.css">
	<link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
	<link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">	
	<!-- Link Swiper's CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>	
	<title>상품 상세보기 | LEGO SHOP</title>
	<script type="text/javascript">
		
	    let link = document.location.href;
		//주소 꼭 바꿔줘야해요!!! 서버 주소로...
		if(link != 'http://49.142.157.251:9090/javaweb13S/store/storeContent?idx='+${vo.idx}) {
			window.addEventListener('load', () => {
		
			    const scrollMove = document.querySelector('.review');
			    const top = (window.pageYOffset+170) + scrollMove.getBoundingClientRect().top; 
		
			    window.scrollTo(0, top);
			});
		}
		
		function imgToTop() {
			$('html,body').animate({scrollTop:0}, 600);
		}
		
		function watchList(idx) {
			let res = 0;
			$.ajax({
				url : '${ctp}/store/addWatchList',
				type : 'post',
				data : {idx, idx},
				success : function(res) {
					if(res == 1) {
						alert("관심상품으로 등록되었습니다.");
					}
					else if(res == 2) {
						alert("관심상품 해제되었습니다.");
					}
					else {
						alert("오류가 발생하였습니다.\n다시 시도하여주십시오.");
					}
				},
				error : function() {
					alert("전송 오류입니다.");
				}
			});
		}
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
		function regQNA(idx) {
			if(${sUid== null}) {
				let ans = confirm('로그인 후 이용하실 수 있습니다. \n로그인창으로 이동하시겠습니까?');
				if(ans) {
					location.href='${ctp}/member/memberLogin';
				}
				else {
					return false;
				}
			}
			else {
				let url = "${ctp}/store/regQNA?idx="+idx;
				let wName = "regQNA";
				let opt = "width=520px, height=550px, left=400px, top=100px, resizable=no, toolbars=no, menubar=no";
				let popUp = window.open(url,wName,opt);
			}
		}
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/headerNotFixed.jsp"></jsp:include>
	<form name="myform" method="post">
        <div class="reservation-content-box">
            <div class="img-box-container">
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide"><img src="${ctp}/data/admin/product/thumbnail/${vo.FName}"></div>
                        <c:if test="${vov != null}">
	                        <video autoplay muted loop controls width="450px" class="swiper-slide">
	                            <source src="${ctp}/data/admin/product/content/imgDB/${vov.FName}" type="video/mp4">
	                        </video>
                        </c:if>
                        <c:forEach var="imgVO" items="${vos}">
                        	<div class="swiper-slide"><img src="${ctp}/data/admin/product/content/imgDB/${imgVO.FName}"></div>
                        </c:forEach>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-pagination"></div>
                </div>
                <!-- Swiper JS -->
				<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
                <div class="content-box">
                    <div class="content-box-head">
                        <div class="content-box-title">${vo.productName}</div>
                    </div>
                    <c:if test="${vo.discountRate != 0}">
	                    <div class="price-before-box">
	                    	<div class="before-price"><fmt:formatNumber value="${vo.price}" type="number" />원</div>
	                    	<div class="before-discount">${vo.discountRate} %</div>
	                  	</div>
                  	</c:if>
                    <div class="price-box">
                        <div class="price">
                            <fmt:formatNumber value="${vo.productDiscountPrice}" type="number" />
                        </div>
                        <div class="price-tag"> 원</div>
                    </div>
                    <div class="price_chk-box">
                        <div class="price_chk-box-title">상품선택</div>
                        <div class="price_chk-box-content">
                            <div class="price_chk-box-content-title">${vo.productName}</div>
                            <div class="price_chk-box-pricebox">
                                <div class="price_chk-box-pricebox-title">
                                    <input type="button" class="minus-btn" value="-" />
                                    <div class="num-btn" id="num-btn" value="1">1</div>
                                    <input type="button" class="plus-btn" value="+" />
                                </div>
                                <div class="price_chk-box-pricebox-price">
                                    <fmt:formatNumber value="${vo.productDiscountPrice}" type="number" />
                                    <span style="margin-left: 2px;">원</span>
                                </div> <!--고정가-->
                            </div>
                        </div>
                    </div>
                    <div class="last-price-chk">
                        <div class="last-price-chk-title">총 상품금액 : </div>
                        <div class="last-price-chk-content total-btn">
                            <fmt:formatNumber value="${vo.productDiscountPrice}" type="number" />
                        </div>
                        <div class="last-price-chk-end">원</div>
                    </div>
                    <c:if test="${sUid != null}">
	                    <div class="cart-item">
	                        <input type="checkbox" id="chk_st" onclick="watchList(${vo.idx})" <c:if test="${heart == 1}">checked</c:if>/><label for="chk_st"></label>
	                        <input type="submit" class="cart-item-btn" value="장바구니 담기">
	                    </div>
                    </c:if>
                    <c:if test="${sUid == null}">
                    	<div class="loginChk"><a href="${ctp}/member/memberLogin">로그인 후 이용해주세요</a></div>
                    </c:if>
                </div>
            </div>
        </div>
        <hr class="content-btm-1" />

        
        <div class="product-sub-info-box">
            <div class="product-sub-info">
                <div class="product-sub-info-svg">
                    <svg width="34" height="40" viewBox="0 0 34 40" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" class="Icon__StyledSVG-lm07h6-0 fFzRmK"><g fill="currentColor" style="mix-blend-mode: darken;"><path d="M32.606 29.532c.319 0 .576.127.576.282v.585c0 .155-.257.281-.576.281H.895c-.32 0-.578-.126-.578-.281v-.585c0-.155.258-.282.578-.282h31.71zM15.737 14.597c.071 0 .129.126.129.281v.585c0 .155-.058.281-.13.281H8.63c-.072 0-.13-.126-.13-.281v-.585c0-.155.058-.281.13-.281h7.107zm9.713 0c.072 0 .13.126.13.281v.585c0 .155-.058.281-.13.281h-7.106c-.072 0-.13-.126-.13-.281v-.585c0-.155.058-.281.13-.281h7.107z"></path><path d="M1.821 21.572H32.18v16.606H1.82V21.572zM1.195 20A1.19 1.19 0 000 21.186v17.592a1.19 1.19 0 001.195 1.186h31.54a1.19 1.19 0 001.193-1.186V21.186A1.19 1.19 0 0032.734 20H1.195zM7.856 8.485c-.79.11-1.183.505-1.177 1.186v3.741c.342.047 1.524.09 1.524 1.559V9.885H25.9v3.874c.291-1.068.765-1.132 1.421-.193V9.671c0-.655-.527-1.186-1.177-1.186H7.856z"></path><path d="M7.34 18.919c-1.64 0-1.634-.814-1.634-1.042 0-1.052 1.071-3.36 1.614-3.48.593.12 1.665 2.428 1.666 3.48 0 .23-.005 1.042-1.646 1.042M7.3 12.12c-1.028.214-3.05 4.31-3.05 6.18 0 .403-.008 1.847 3.085 1.847 3.097 0 3.106-1.441 3.106-1.847-.004-1.869-2.025-5.968-3.142-6.178m9.66 6.797c-1.64 0-1.635-.814-1.635-1.042 0-1.052 1.072-3.36 1.615-3.48.593.12 1.664 2.428 1.666 3.48 0 .23-.005 1.042-1.646 1.042m-.042-6.798c-1.026.213-3.048 4.309-3.048 6.178 0 .403-.008 1.847 3.085 1.847 3.096 0 3.105-1.441 3.105-1.847-.004-1.869-2.025-5.968-3.142-6.178m9.729 6.798c-1.64 0-1.634-.814-1.634-1.042 0-1.052 1.072-3.36 1.614-3.48.593.12 1.665 2.428 1.667 3.48 0 .23-.005 1.042-1.647 1.042m-.041-6.798c-1.025.213-3.048 4.309-3.048 6.178 0 .403-.009 1.847 3.084 1.847 3.097 0 3.105-1.441 3.105-1.847-.002-1.869-2.024-5.968-3.141-6.178m-9.646-4.596c-1.64 0-1.635-.814-1.635-1.041 0-1.053 1.072-3.36 1.615-3.482.593.12 1.664 2.429 1.666 3.482 0 .228-.005 1.04-1.646 1.04M16.917.728C15.891.94 13.87 5.036 13.87 6.905c0 .404-.008 1.847 3.085 1.847 3.096 0 3.105-1.441 3.105-1.847-.004-1.869-2.025-5.968-3.142-6.178"></path></g></svg>
                </div>
                <div class="product-sub-info-text">
                    연령
                </div>
                <div class="product-sub-info-content">
                    ${vo.age}
                </div>
            </div>
            <div class="product-sub-info">
                <div class="product-sub-info-svg">
                    <svg width="33" height="40" viewBox="0 0 33 40" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" class="Icon__StyledSVG-lm07h6-0 fFzRmK"><g fill-rule="nonzero" stroke="currentColor" fill="none" style="mix-blend-mode: darken;"><path stroke-width="1.727" fill="#FFF" d="M1.184 9.433l15.224-7.281 15.59 7.194V30.49L17.418 39 1.184 30.577z"></path><path d="M23.23 3.544C22.864 2.141 19.925 1 16.526 1c-3.675 0-6.798 1.228-6.89 2.895 0 0 .184 4.124.184 4.211 0 2.018 3.307 3.422 6.798 3.422 3.582 0 6.797-1.404 6.797-3.422v-3.07s.184-.965-.183-1.492z" stroke-width="1.152" fill="#FFF"></path><path d="M10.094 4.334c.092-1.58 2.94-2.895 6.43-2.895 3.491 0 6.34 1.316 6.431 2.895.092 1.667-2.756 2.983-6.43 2.983-3.675 0-6.523-1.404-6.43-2.983h0z" stroke-width="1.152"></path><path stroke-width="1.727" d="M2 10l15 7.222V39M17 17l14.63-7.122"></path></g></svg>
                </div>
                <div class="product-sub-info-text">
                    부품수
                </div>
                <div class="product-sub-info-content">
                    ${vo.partsNumber}
                </div>
            </div>
            <div class="product-sub-info">
                <div class="product-sub-info-svg">
                    <svg xmlns="http://www.w3.org/2000/svg" width="37" height="25" viewBox="0 0 37 25" class="Icon__StyledSVG-lm07h6-0 fFzRmK" aria-label="VIP"><path d="M26.333 8.837L20.338 1h-3.669l-5.995 7.837L4.608 3.95H1v18.128L2.877 24l31.25-.03L36 22.048V3.95h-3.627l-6.04 4.888z" stroke="currentColor" stroke-width="2" fill="none"></path></svg>
                </div>
                <div class="product-sub-info-text">
                    VIP 포인트
                </div>
                <div class="product-sub-info-content">
                    ${vo.point}
                </div>
            </div>
            <div class="product-sub-info">
                <div class="product-sub-info-svg">
                    <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" aria-hidden="true" viewBox="0 0 36 36" class="Icon__StyledSVG-lm07h6-0 fFzRmK"><path d="M13.81 12.333l-2.833 11.334h11.216l2.834-11.334H13.81zm.945-3.777H25.97l1.53-6.124a1.89 1.89 0 013.668.914l-1.303 5.21h3.245c1.047 0 1.889.846 1.889 1.889a1.887 1.887 0 01-1.889 1.888h-4.19l-2.833 11.334h7.023c1.047 0 1.889.846 1.889 1.888a1.887 1.887 0 01-1.889 1.89h-7.967l-1.534 6.123a1.888 1.888 0 11-3.66-.914l1.299-5.21H10.033l-1.534 6.124a1.888 1.888 0 11-3.66-.914l1.299-5.21h-3.25a1.89 1.89 0 010-3.777h4.194l2.834-11.334H2.889a1.89 1.89 0 010-3.777h7.971l1.534-6.124a1.884 1.884 0 012.285-1.375 1.883 1.883 0 011.375 2.29l-1.3 5.209z" fill="currentColor" stroke="#FFF" fill-rule="evenodd"></path></svg>
                </div>
                <div class="product-sub-info-text">
                    제품코드
                </div>
                <div class="product-sub-info-content">
                    ${vo.productCode}
                </div>
            </div>
        </div>
        <div class="content-upper"></div>

        <div class="product-btm-title-box">
            <a class="product-btm-title moreInfo-top">상세정보</a>
            <a class="product-btm-title review-top">리뷰</a>
            <a class="product-btm-title QnA-top">Q&amp;A</a>
        </div>
        <div class="content-box1">
            <div class="box1-img moreInfo">
                ${vo.content}
            </div>
        </div>
        <input type="hidden" name="count" class="count_st" value="" /><!-- 수량 -->
    </form>
    
    <div class="review-container review">
        <div class="review-title">상품 리뷰</div>
        <div class="review-sub-title">상품을 구매하신 분들이 작성하신 리뷰입니다.</div>
        <c:if test="${voAvgReview.cntReview == 0}">
	        <div class="review-no-box">
	            <div class="no-review-btm"></div>
	            <div class="img-box"><img src="${ctp}/images/store/no-review.webp" alt=""></div>
	            <div class="no-content">아직 작성된 리뷰가 없습니다.</div>
	            <div class="no-review-btm"></div>
	        </div>
        </c:if>
        <c:if test="${voAvgReview.cntReview != 0}">
	        <div class="review-btm"></div>
	        <div class="review-main-box">
	            <div class="main-title-box">
	                <div class="title">사용자 총 평점</div>
	                <div class="title">전체 리뷰수</div>
	                <div class="title">다른 구매자들은 이렇게 평가했어요</div>
	            </div>
	            <div class="content-box">
	                <div class="rating-box">
	                    <span class="rating">
	                        ❤❤❤❤❤
	                        <span>❤❤❤❤❤</span>
	                        <input type="range" step="0.1" min="0" max="5">
	                    </span>
	                    <div class="rating-cnt">${voAvgReview.avgMain} <span>/ 5</span></div>
	                    <script>
						    document.querySelector('.rating span').style.width = `${voAvgReview.avgMain * 20}%`;
			            </script>
	                </div>
	    
	                <div class="review-cnt-box">
	                    <div class="img-box">
	                        <img src="${ctp}/images/store/comment-dot.webp" alt="">
	                    </div>
	                    <div class="cnt">${voAvgReview.cntReview}</div>
	                </div>
	    
	                <div class="eval-box">
	                    <div class="eval">
	                        <span class="title">조립난이도</span>
	                        <span class="content">
	                        <c:if test="${voAvgReview.avgSub1 >= 4}">
	                            <span class="content-title">어려워요</span>
	                        </c:if>
	                        <c:if test="${voAvgReview.avgSub1 < 4 and voAvgReview.avgSub1 > 3}">
	                            <span class="content-title">보통이에요</span>
	                        </c:if>
	                        <c:if test="${voAvgReview.avgSub1 <= 3}">
	                            <span class="content-title">쉬워요</span>
	                        </c:if>
	                            <spna class="content-value">${voAvgReview.avgSub1} /5 (${voAvgReview.cntReview}명)</spna>
	                        </span>
	                    </div>
	                    <div class="eval">
	                        <span class="title">추천정도</span>
	                        <span class="content">
	                        <c:if test="${voAvgReview.avgSub2 >= 4}">
	                            <span class="content-title">추천해요</span>
	                        </c:if>
	                        <c:if test="${voAvgReview.avgSub2 < 4 and voAvgReview.avgSub2 > 3}">
	                            <span class="content-title">보통이에요</span>
	                        </c:if>
	                        <c:if test="${voAvgReview.avgSub2 <= 3}">
	                            <span class="content-title">별로에요</span>
	                        </c:if>
	                            <spna class="content-value">${voAvgReview.avgSub2} /5 (${voAvgReview.cntReview}명)</spna>
	                        </span>
	                    </div>
	                    <div class="eval">
	                        <span class="title">만족도</span>
	                        <span class="content">
	                        <c:if test="${voAvgReview.avgSub3 >= 4}">
	                            <span class="content-title">만족해요</span>
	                        </c:if>
	                        <c:if test="${voAvgReview.avgSub3 < 4 and voAvgReview.avgSub3 > 3}">
	                            <span class="content-title">보통이에요</span>
	                        </c:if>
	                        <c:if test="${voAvgReview.avgSub3 <= 3}">
	                            <span class="content-title">별로에요</span>
	                        </c:if>
	                            <span class="content-value">${voAvgReview.avgSub3} /5 (${voAvgReview.cntReview}명)</span>
	                        </span>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="content-btm"></div>
	        <div class="review-box">
	            <div class="review-title">리뷰<span>${voAvgReview.cntReview}</span>건</div>
	            <div class="title-btm"></div>
	            <!--반복구간-->
	            <c:forEach var="voReview" items="${vosReview}">
		            <div class="review-repeat-box">
		                <div class="profile">
		                    <img src="${ctp}/images/store/icon-${voReview.randomNum}.webp" alt="레고 아이콘">
		                </div>
		                <div class="info-box">
		                    <div class="rating-info">
		                        <span class="info-rating${voReview.idx} info-rating">
		                            ❤❤❤❤❤
		                            <span>❤❤❤❤❤</span>
		                            <input type="range" step="1" min="0" max="5">
		                        </span>
		                    </div>
		                    <script>
			                    document.querySelector('.info-rating${voReview.idx} span').style.width = `${5 * 20}%`;
			                    $('.info-rating${voReview.idx} span').css("width", `${voReview.evaluateMain * 20}%`);            
		                    </script>
		                    <div class="user-info">
			                    <c:set var='reviewUidEncrypt' value="${fn:substring(voReview.uid,0,fn:length(voReview.uid)-3)}" />
		                        <span class="uid">${reviewUidEncrypt}***</span>
		                        <c:set var='reviewDate' value="${fn:replace(voReview.regDate,'-','.')}" />
		                        <span class="dateInfo">${fn:substring(reviewDate,0,10)}</span>
		                        <div class="product-info">구매상품 : ${voReview.productName}</div>
		                    </div>
		                    <div class="sub-info">
		                        <span class="title" style="margin-left: 0;">조립난이도</span>
		                        <span class="content">
		                            <span class="content-rating-1${voReview.idx} content-rating-1">
		                                ❤❤❤❤❤
		                                <span>❤❤❤❤❤</span>
		                                <input type="range" step="1" min="0" max="5">
		                            </span>
		                        </span>
		                        <script>
			                        document.querySelector('.content-rating-1${voReview.idx} span').style.width = `${3 * 20}%`;
			                        $('.content-rating-1${voReview.idx} span').css("width", `${voReview.evaluateSub1 * 20}%`);
			                    </script>
		                        <span class="title">추천정도</span>
		                        <span class="content">
		                            <span class="content-rating-2${voReview.idx} content-rating-2">
		                                ❤❤❤❤❤
		                                <span>❤❤❤❤❤</span>
		                                <input type="range" step="1" min="0" max="5">
		                            </span>
		                        </span>
		                        <script>
			                        document.querySelector('.content-rating-2${voReview.idx} span').style.width = `${3 * 20}%`;
			                        $('.content-rating-2${voReview.idx} span').css("width", `${voReview.evaluateSub2 * 20}%`);
			                    </script>
		                        <span class="title">만족도</span>
		                        <span class="content">
		                            <span class="content-rating-3${voReview.idx} content-rating-3">
		                                ❤❤❤❤❤
		                                <span>❤❤❤❤❤</span>
		                                <input type="range" step="1" min="0" max="5">
		                            </span>
		                        </span>
		                        <script>
			                        document.querySelector('.content-rating-3${voReview.idx} span').style.width = `${3 * 20}%`;
			                        $('.content-rating-3${voReview.idx} span').css("width", `${voReview.evaluateSub3 * 20}%`);
			                    </script>
		                    </div>
		                    <div class="text-content">
		                        ${voReview.content}
		                    </div>
		                </div>
		                <c:if test="${voReview.FName != '0'}">
			                <div class="img-box">
			                    <img src="${ctp}/images/store/icon-20.webp" alt="레고 사진">
			                </div>
		                </c:if>
		            </div>
		            <div class="repeat-btm"></div>
	            </c:forEach>
	            <!--반복구간-->
	        </div>
        </c:if>

        <div class="page_wrap">
            <div class="page_nation">
            	<c:if test="${pageReviewVO.curBlock > 0}">
	                <a class="arrow prev" href="${ctp}/store/storeContent?idx=${vo.idx}&pag=${(pageReviewVO.curBlock-1)*pageReviewVO.blockSize + 1}">이전</a>
	            </c:if>
	            <c:forEach var="i" begin="${(pageReviewVO.curBlock)*pageReviewVO.blockSize + 1}" end="${(pageReviewVO.curBlock)*pageReviewVO.blockSize + pageReviewVO.blockSize}">
	            	<c:if test="${i <= pageReviewVO.totPage && i == pageReviewVO.pag}">
                		<a href="${ctp}/store/storeContent?idx=${vo.idx}&pag=${i}" class="active">${i}</a>
            		</c:if>
            		<c:if test="${i <= pageReviewVO.totPage && i != pageReviewVO.pag}">
                		<a href="${ctp}/store/storeContent?idx=${vo.idx}&pag=${i}">${i}</a>
            		</c:if>	
        		</c:forEach>
        		<c:if test="${pageReviewVO.curBlock < pageReviewVO.lastBlock}">
                	<a class="arrow next" href="${ctp}/store/storeContent?idx=${vo.idx}&pag=${(pageReviewVO.curBlock+1)*pageReviewVO.blockSize + 1}">다음</a>
            	</c:if>
            </div>
        </div>
    </div>
    
    
    
    
    
    
	<div class="qna-container QnA">
	    <div class="qna-title">Q&amp;A</div>
	    <div class="qna-sub-title">구매하시려는 상품에 대해 궁금한 점이 있으신 경우 문의해주세요.</div>
	    <div class="menu">
			<div class="qna-box">
                <a class="regQna" href="javascript:regQNA(${vo.idx})">상품 Q&amp;A 작성하기</a>
                <c:if test="${searchItem == '' && sUid != null}" >
            		<a class="SeeMyQna" href="${ctp}/store/storeContent?idx=${vo.idx}&searchItem=${sUid}">나의 Q&amp;A 조회</a>
            	</c:if>
            	<c:if test="${searchItem != '' && sUid != null}" >
            		<a class="SeeMyQna" href="${ctp}/store/storeContent?idx=${vo.idx}&pag=1">전체 Q&amp;A 조회</a>
            	</c:if>
            </div>
        </div>
        <div class="menu-btm"></div>
        <div class="qna-body-box">
            <div class="qna-body-title">
                <div class="col">답변상태</div>
                <div class="col">제목</div>
                <div class="col">작성자</div>
                <div class="col">작성일</div>
            </div>
            <c:if test="${vosQ == '[]'}">
           	 	<div class="qna-no-body-content">
	                <img src="${ctp}/images/store/exclamation-no.webp" alt="느낌표">
	                <div class="text">작성된 상품 Q&amp;A가 없습니다.</div>
	            </div>
            </c:if>
            <c:forEach var="voQNA" items="${vosQ}">
            	<c:if test="${voQNA.lockSW != 1 || sUid == voQNA.uid || sLevel == 0}">
		            <div class="qna-body-content content-text-for-h">
		            	<c:if test="${voQNA.answerSW == 1}">
			                <div class="col">답변완료</div>
		            	</c:if>
		            	<c:if test="${voQNA.answerSW != 1}">
			                <div class="col">미답변</div>
		            	</c:if>
		                <div class="col">
		                    ${voQNA.content}
		                </div>
		                <c:set var='uidEncrypt' value="${fn:substring(voQNA.uid,0,fn:length(voQNA.uid)-3)}" />
		                <div class="col">${uidEncrypt}***</div>
		                <c:set var='fDate' value="${fn:replace(voQNA.regDate,'-','.')}" />
		                <div class="col">${fn:substring(fDate,0,10)}</div>
		            </div>
	            </c:if>
	            <c:if test="${sUid != voQNA.uid && voQNA.lockSW == 1 && sLevel != 0}">
		            <div class="qna-body-content">
		                <c:if test="${voQNA.answerSW == 1}">
			                <div class="col">답변완료</div>
		            	</c:if>
		            	<c:if test="${voQNA.answerSW != 1}">
			                <div class="col">미답변</div>
		            	</c:if>
		                <div class="col">
		                    비밀글입니다.<img src="${ctp}/images/store/lock.webp" style="margin-left:5px; margin-bottom:5px; width:14px; height: 14px">
		                </div>
		                <c:set var='uidEncrypt' value="${fn:substring(voQNA.uid,0,fn:length(voQNA.uid)-3)}" />
		                <div class="col">${uidEncrypt}***</div>
		                <c:set var='fDate' value="${fn:replace(voQNA.regDate,'-','.')}" />
		                <div class="col">${fn:substring(fDate,0,10)}</div>
		            </div>
	            </c:if>
	            <div class="anwser-box">
	            	<c:if test="${sUid != voQNA.uid && voQNA.lockSW == 1 && sLevel != 0}">
		                <div class="qna-body-content-1">
		                    <div class="col"></div>
		                    <div class="col">
		                        비밀글은 작성자와 관리자만 볼 수 있습니다.
		                    </div>
		                    <div class="col"></div>
		                    <div class="col"></div>
		                </div>
	                </c:if>
	            	<c:if test="${voQNA.lockSW != 1 || sUid == voQNA.uid || sLevel == 0}">
		                <div class="qna-body-content-1">
		                    <div class="col"></div>
		                    <div class="col">
		                        ${voQNA.content}
		                    </div>
		                    <div class="col"></div>
		                    <div class="col"></div>
		                </div>
	                </c:if>
	                <!--갭-->
	                <div class="qna-body-gap"> 
	                    <div class="col"></div>
	                    <div class="col"></div>
	                    <div class="col"></div>
	                    <div class="col"></div>
	                </div>
	                <!--갭-->
	                <c:forEach var="voQnaReply" items="${vosQR}">
						<c:if test="${voQNA.answerSW == 1 && voQnaReply.qnaIdx == voQNA.idx}">
							<c:if test="${sUid != voQNA.uid && voQNA.lockSW == 1 && sLevel != 0}">
				                <div class="qna-body-content-2">
				                    <div class="col"></div>
				                    <div class="col">
				                        <div class="answer-icon-box">
				                            <div class="check-icon-border"></div>
				                            <div class="answer">답변</div>
				                            <div class="answer-content">
				                            	비밀글은 작성자와 관리자만 볼 수 있습니다.
				                            </div>
				                        </div>
				                    </div>
				                    <div class="col">${voQnaReply.uid}</div>
				                    <c:set var='replyDate' value="${fn:replace(voQnaReply.regDate,'-','.')}" />
			                		<div class="col">${fn:substring(replyDate,0,10)}</div>
				                </div>
			                </c:if>
							<c:if test="${voQNA.lockSW != 1 || sUid == voQNA.uid || sLevel == 0}">
				                <div class="qna-body-content-2">
				                    <div class="col"></div>
				                    <div class="col">
				                        <div class="answer-icon-box">
				                            <div class="check-icon-border"></div>
				                            <div class="answer">답변</div>
				                            <div class="answer-content">
				                            	${voQnaReply.content}
				                            </div>
				                        </div>
				                    </div>
				                    <div class="col">${voQnaReply.uid}</div>
				                    <c:set var='replyDate' value="${fn:replace(voQnaReply.regDate,'-','.')}" />
			                		<div class="col">${fn:substring(replyDate,0,10)}</div>
				                </div>
			                </c:if>
		                </c:if>
	                </c:forEach>
	            </div>
            </c:forEach>
        </div>
        <div class="qna-body-btm"></div>
        <div class="page_wrap">
            <div class="page_nation">
            	<c:if test="${pageQnaVO.curBlock > 0}">
	                <a class="arrow prev" href="${ctp}/store/storeContent?idx=${vo.idx}&pag=${(pageQnaVO.curBlock-1)*pageQnaVO.blockSize + 1}&searchItem=${searchItem}">이전</a>
	            </c:if>
	            <c:forEach var="i" begin="${(pageQnaVO.curBlock)*pageQnaVO.blockSize + 1}" end="${(pageQnaVO.curBlock)*pageQnaVO.blockSize + pageQnaVO.blockSize}">
	            	<c:if test="${i <= pageQnaVO.totPage && i == pageQnaVO.pag}">
                		<a href="${ctp}/store/storeContent?idx=${vo.idx}&pag=${i}&searchItem=${searchItem}" class="active">${i}</a>
            		</c:if>
            		<c:if test="${i <= pageQnaVO.totPage && i != pageQnaVO.pag}">
                		<a href="${ctp}/store/storeContent?idx=${vo.idx}&pag=${i}&searchItem=${searchItem}">${i}</a>
            		</c:if>	
        		</c:forEach>
        		<c:if test="${pageQnaVO.curBlock < pageQnaVO.lastBlock}">
                	<a class="arrow next" href="${ctp}/store/storeContent?idx=${vo.idx}&pag=${(pageQnaVO.curBlock+1)*pageQnaVO.blockSize + 1}&searchItem=${searchItem}">다음</a>
            	</c:if>
            </div>
        </div>
    </div>
    
    
    <div class="gap-st-content"></div>
    <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
    
    
	<div class="item-header">
		<div class="header-top">
			<div class="img"><a href="javascript:imgToTop()"><img src="${ctp}/data/admin/product/thumbnail/${vo.FName}" alt="${vo.productName}"></a></div>
			<div class="title-box">
				<div class="title">${vo.productName}</div>
				<div class="price-box">
					<div class="discountPrice"><fmt:formatNumber value="${vo.productDiscountPrice}" type="number" />원</div>
					<c:if test="${vo.discountRate != 0}">
					<span class="price"><fmt:formatNumber value="${vo.price}" type="number" />원</span>
					</c:if>
				</div>
			</div>
			<div class="btn" onclick="javascript:cartDirect(${vo.idx})">장바구니 담기</div>
		</div>
		<div class="header-btm">
			<a class="header-btm-title moreInfo-top-1">상세정보</a>
			<a class="header-btm-title review-top-1">리뷰</a>
			<a class="header-btm-title QnA-top-1">Q&amp;A</a>
		</div>
		<div class="btm-line"></div>
	</div>
	<a><img id="back-to-top" src="${ctp}/images/main/up-to-top.png" /></a>
</body>

<script>
    var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1,
        spaceBetween: 30,
        loop: true,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
    });

    let i = 1;
    let plus = document.querySelector(".plus-btn");
    let minus = document.querySelector(".minus-btn");
    let result = document.querySelector("#num-btn");
    let total = document.querySelector(".total-btn");
    let totalCnt = document.querySelector(".count_st");
    totalCnt.textContent = result.textContent;

    function updateMinusBtn() {
        if (i == 1) {
            minus.disabled = true;
            minus.style.color = "#ddd";
        }
        else {
            minus.disabled = false;
            minus.style.color = "";
        }
    }
    updateMinusBtn();

    function itemCntChk() {
        if (i == ${vo.stock}) {
            alert("현재 주문하실 수 있는 상품의 최대 개수는 " + ${vo.stock} + "개입니다.");
            plus.disabled = true;
            plus.style.color = "#ddd";
        }
        else {
                plus.disabled = false;
                plus.style.color = "";
        }
    }
    itemCntChk();

    plus.addEventListener("click", () => {
        i += 1;
        result.textContent = i;
        let totalcost = i * ${vo.productDiscountPrice}; //여기
        total.textContent = totalcost.toLocaleString();

        itemCntChk();
        updateMinusBtn();

        totalCnt.value = i;
    });

    minus.addEventListener("click", () => {
        if (i > 1) {
            i -= 1;
            result.textContent = i;
            let totalcost = i * ${vo.productDiscountPrice}; //여기
            total.textContent = totalcost.toLocaleString();

            totalCnt.value = i;
        }
        itemCntChk();
        updateMinusBtn();
    });
    
    moreInfo = document.querySelector('.moreInfo-top');
    review = document.querySelector('.review-top');
    QnA = document.querySelector('.QnA-top');
    moreInfo1 = document.querySelector('.moreInfo-top-1');
    review1 = document.querySelector('.review-top-1');
    QnA1 = document.querySelector('.QnA-top-1');
    
    moreInfo.addEventListener("click", () => {
        const move = document.querySelector('.moreInfo');
        const top = (window.pageYOffset-170) + move.getBoundingClientRect().top;
        window.scrollTo(0, top);
    });
    review.addEventListener("click", () => {
        const move = document.querySelector('.review');
        const top = (window.pageYOffset-170) + move.getBoundingClientRect().top;
        window.scrollTo(0, top);
    });
    QnA.addEventListener("click", () => {
        const move = document.querySelector('.QnA');
        const top = (window.pageYOffset-170) + move.getBoundingClientRect().top;
        window.scrollTo(0, top);
    });
    moreInfo1.addEventListener("click", () => {
        const move = document.querySelector('.moreInfo');
        const top = (window.pageYOffset-170) + move.getBoundingClientRect().top;
        window.scrollTo(0, top);
    });
    review1.addEventListener("click", () => {
        const move = document.querySelector('.review');
        const top = (window.pageYOffset-170) + move.getBoundingClientRect().top;
        window.scrollTo(0, top);
    });
    QnA1.addEventListener("click", () => {
        const move = document.querySelector('.QnA');
        const top = (window.pageYOffset-170) + move.getBoundingClientRect().top;
        window.scrollTo(0, top);
    });

    window.addEventListener('scroll', () => {
        const itemHeader = document.querySelector('.item-header');
        const title = document.querySelector('.product-btm-title-box');
        const titleTop = window.pageYOffset + title.getBoundingClientRect().top;
        
        let scrollPosition = window.scrollY || document.documentElement.scrollTop;
        
        if(scrollPosition > titleTop) {
            itemHeader.style.display = "block";
        }
        else if(scrollPosition <= titleTop) {
            itemHeader.style.display = "none";
        }
    });
    
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
    
    $('.qna-body-content').on('click', function () {
        function slideDown(target) {
            slideUp();
            $(target).addClass('on').next().slideDown();
        }
        function slideUp() {
            $('.qna-body-content').removeClass('on').next().slideUp();
        }
        $(this).hasClass('on') ? slideUp() : slideDown(this);
    });
    
</script>
</body>
</html>