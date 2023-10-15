<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
    <link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <link rel="stylesheet" href="${ctp}/css/default.css">
    <link rel="stylesheet" href="${ctp}/css/myPayment.css">
    <script>
	    function regReview(productIdx) {
			let url = "${ctp}/store/regReview?productIdx="+productIdx;
			let wName = "customerInfo";
			let opt = "width=570px, height=800px, left=400px, top=50px, resizable=no, toolbars=no, menubar=no";
			let popUp = window.open(url,wName,opt);
		}
    </script>
    <title>구매내역 | LEGO SHOP</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    <div class="mypage-container">
		<div class="mypage-left">
			<div class="menu"><a href="${ctp}/member/mypage">계정 개요</a></div>
			<div class="menu"><a href="${ctp}/member/myPayment">내 주문</a></div>
			<div class="menu"><a href="${ctp}/member/verifyPwd?SW=0">회원정보 수정</a></div>
			<div class="menu"><a href="${ctp}/member/verifyPwd?SW=1">비밀번호 수정</a></div>
			<div class="menu"><a href="">상품 Q&amp;A</a></div>
			<div class="menu"><a href="${ctp}/member/watchList">관심목록</a></div>
			<div class="menu" style="margin-top:40px;"><a href="${ctp}/member/memberLogout">로그아웃</a></div>
			<div class="menu last-menu"><a href="${ctp}/member/memberDel">회원 탈퇴</a></div>
		</div>
	    <div class="mypage-right">
	        <div class="myPayment-title">구매내역</div>
	        <div class="title-btm"></div>
<%-- 	        <c:if test="${orderVOS.get(0).getOrderCnt() == 0}">
		        <div class="no-payment-info">
		            <div class="no-payment-line"></div>
		            <div class="img-box"><img src="${ctp}/images/member/x-mark.jpg" alt="x표시"></div>
		            <div class="no-payment-title">구매 내역이 존재하지 않습니다.</div>
		            <div class="go-to-shopping"><a href="${ctp}/store/storeMain">쇼핑하러 가기</a></div>
		            <div class="no-payment-line"></div>
		        </div> 
	        </c:if>
	         --%>
	        <!--반복-->
	        <!--한개짜리-->
        	<c:forEach var="orderCntVO" items="${orderCntVOS}">
	        	<c:forEach var="orderVO" items="${orderVOS}">
	        		<c:if test="${orderCntVO.merchant_uidCnt == 1 && orderCntVO.merchant_uid == orderVO.merchant_uid}">
			        	<a href="">
				            <div class="content-box">
					            <c:if test="${orderVO.orderSW == 0}">
					                <div class="title-status">결제완료</div>
					            </c:if>
					            <c:if test="${orderVO.orderSW == 1}">
					            	<div class="title-status">배송중</div>
					            </c:if>
					            <c:if test="${orderVO.orderSW == 2}">
					            	<div class="title-status" style="color: #777;">구매확정</div>
				            	</c:if>
					            <c:if test="${orderVO.orderSW == 3}">
					            	<div class="title-status" style="color: #D01012;">환불/취소</div>
				            	</c:if>
				                <div class="status-btm">
				                    <div class="img-box">
				                        <img src="${ctp}/data/admin/product/thumbnail/${orderVO.FName}" alt="상품사진">
				                    </div>
				                    <div class="content-one-box">
				                    <c:set var='paymentDate' value="${fn:replace(orderVO.payment_date,'-','.')}" />
				                        <div class="date-box">${fn:substring(paymentDate,5,10)} 결제</div>
				                        <div class="content-title">${orderVO.productName}</div>
				                        <div class="price"><fmt:formatNumber value="${orderVO.price}" type="number" />원</div>
				                        <span class="go-to-detail">결제상세</span>
				                    </div>
				                </div>
				                <c:if test="${orderVO.orderSW == 0}">
					                <div class="btn-box">
					                    <input type="button" value="환불/취소" />
					                    <input type="button" value="구매확정" />
					                </div>
				                </c:if>
				                <c:if test="${orderVO.orderSW == 1}">
					                <div class="btn-box">
					                    <input type="button" value="구매확정" />
					                </div>
				                </c:if>
				                <c:if test="${orderVO.orderSW == 2}">
					                <div class="btn-box">
					                    <input type="button" value="리뷰작성" onclick="regReview(${orderVO.productIdx})" />
					                    <input type="button" value="재구매" />
					                </div>
				                </c:if>
				        	</div>
				        </a>
	        		</c:if>
	        		<c:if test="${orderVO.rank == 1 && orderCntVO.merchant_uidCnt != 1 && orderCntVO.merchant_uid == orderVO.merchant_uid}">
				        <div class="multi-content-box">
				            <div class="multi-title">
				                총 ${orderCntVO.merchant_uidCnt}건
				            </div>
				            <div class="multi-box">
				                <div class="img-box">
				                    <img src="${ctp}/data/admin/product/thumbnail/${orderVO.FName}" alt="상품사진">
				                </div>
				                <div class="multi-content">
				                    <c:set var='paymentDate' value="${fn:replace(orderVO.payment_date,'-','.')}" />
			                        <div class="date-box">${fn:substring(paymentDate,5,10)} 결제</div>
				                    <div class="content-title">${orderVO.productName} 포함 <span>총 ${orderCntVO.merchant_uidCnt}건</span></div>
				                    <div class="price"><fmt:formatNumber value="${orderCntVO.totalPrice}" type="number" />원</div>
				                    <a href=""><span class="go-to-detail">결제상세</span></a>
				                </div>
				            </div>
				            <div class="multi-btn-box">
				                <input type="button" class="go-to-multi" value="총 ${orderCntVO.merchant_uidCnt}건 주문 펼쳐보기">
				            </div>
				        </div>
				        <div class="multi-content-box-btm">
				            <div class="btm-line"></div>
				            <!--반복구간-->
				            <c:forEach var="orderVO" items="${orderVOS}">
					            <c:if test="${orderCntVO.merchant_uid == orderVO.merchant_uid}">
						            <div class="repeat-box">
						                <c:if test="${orderVO.orderSW == 0}">
							                <div class="btm-title-status">결제완료</div>
							            </c:if>
							            <c:if test="${orderVO.orderSW == 1}">
							            	<div class="btm-title-status">배송중</div>
							            </c:if>
							            <c:if test="${orderVO.orderSW == 2}">
							            	<div class="btm-title-status" style="color: #777;">구매확정</div>
						            	</c:if>
							            <c:if test="${orderVO.orderSW == 3}">
							            	<div class="btm-title-status" style="color: #D01012;">환불/취소</div>
						            	</c:if>
						                <div class="btm-content-box">
						                    <div class="img-box">
						                        <img src="${ctp}/data/admin/product/thumbnail/${orderVO.FName}" alt="상품사진">
						                    </div>
						                    <div class="btm-content">
						                        <c:set var='paymentDate' value="${fn:replace(orderVO.payment_date,'-','.')}" />
				                        		<div class="date-box">${fn:substring(paymentDate,5,10)} 결제</div>
						                        <div class="content-title">${orderVO.productName}</div>
						                        <div class="price"><fmt:formatNumber value="${orderVO.price}" type="number" />원</div>
						                        <span class="go-to-detail">결제상세</span>
						                    </div>
						                </div>
        				                <c:if test="${orderVO.orderSW == 0}">
						            	    <div class="btm-btn-box">
							                    <input type="button" value="환불/취소" />
							                    <input type="button" value="구매확정" />
							                </div>
						                </c:if>
						                <c:if test="${orderVO.orderSW == 1}">
							                <div class="btm-btn-box">
							                    <input type="button" value="구매확정" />
							                </div>
						                </c:if>
						                <c:if test="${orderVO.orderSW == 2}">
							                <div class="btm-btn-box">
							                    <input type="button" value="리뷰작성" onclick="regReview(${orderVO.productIdx})" />
							                    <input type="button" value="재구매" />
							                </div>
						                </c:if>
						                <div class="btm-dot-line"></div>
						            </div>
					            </c:if>
				            </c:forEach>
				            <!--반복구간-->
				        </div>
        			</c:if>
				</c:forEach>
	        <!--반복-->
        	</c:forEach>
    	</div>
	</div>
	<div class="payment-margin-top" style="margin-top: 200px;"></div>
    
</body>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	<script>
	    $('.multi-content-box').on('click', function () {
	        function slideDown(target) {
	            slideUp();
	            $(target).addClass('on').next().slideDown();
	        }
	        function slideUp() {
	            $('.multi-content-box').removeClass('on').next().slideUp();
	        }
	        $(this).hasClass('on') ? slideUp() : slideDown(this);
	    });
	</script>
</html>