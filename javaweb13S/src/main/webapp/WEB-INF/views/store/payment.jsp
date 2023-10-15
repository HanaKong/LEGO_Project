<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
	<link rel="stylesheet" href="${ctp}/css/default.css">
	<link rel="stylesheet" href="${ctp}/css/header.css">
	<link rel="stylesheet" href="${ctp}/css/payment.css">
	<link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
	<link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script>
		function customerInfo() {
			let url = "${ctp}/store/customerInfo";
			let wName = "customerInfo";
			let opt = "width=480px, height=480px, left=650px, top=200px, resizable=no, toolbars=no, menubar=no";
			let popUp = window.open(url,wName,opt);
		}
		function shippingInfo() {
			let url = "${ctp}/store/shippingInfo";
			let wName = "shippingInfo";
			let opt = "width=480px, height=580px, left=650px, top=200px, resizable=no, toolbars=no, menubar=no";
			let popUp = window.open(url,wName,opt);
		}
	</script>	
<title>결제창 | LEGO SHOP</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<form name="myform" method="post">
		<div class="payment-header">결제하기</div>
	    <div class="payment-container">
	        <div class="payment-left-box">
	            <div class="payment-product-info">
	                <div class="head">주문 상품 정보</div>
	                <!--  -->
	          		<c:forEach var="vo" items="${vos}">
		                <div class="info-box">
		                    <div class="img"><img src="${ctp}/data/admin/product/thumbnail/${vo.FName}"></div>
		                    <div class="text-box">
		                        <div class="text-1">${vo.productName}</div>
		                        <div class="text-2">수량 : ${vo.quantity}</div>
		                        <div class="text-3"><fmt:formatNumber value="${vo.price}" type="number" />원</div>
		                    </div>
		                </div>
					</c:forEach>
	                <!--  -->
	            </div>
	            <div class="payment-oder-info">
	                <div class="head">주문자 정보</div>
	                <div class="info-box">
	                    <div class="text-box">
	                        <div class="text-1" id="openerName">${memberVO.name}</div>
	                        <div class="text-2" id="openerTel">${memberVO.tel}</div>
	                        <div class="text-3" id="openerEmail">${memberVO.email}</div>
	                    </div>
	                    <div class="order-info-btn"><input type="button" value="수정" onclick="javascript:customerInfo()" /></div>
	                </div>
	            </div>
	            <div class="payment-delivery-info">
	                <div class="head">배송 정보</div>
	                <div class="info-box">
	                    <div class="text-container">
	                        <div class="text-box">
	                            <div class="text-1" id="opener2Name" >${memberVO.name}</div>
	                            <div class="text-2" id="opener2Tel" >${memberVO.tel}</div>
	                            <div class="text-3" id="opener2RoadAddr" >${fn:split(memberVO.address,'/')[1]}</div>
	                            <div class="text-3" id="opener2DetailAddr" >${fn:split(memberVO.address,'/')[2]}</div>
	                            <div class="text-3" >&#40;<span id="opener2Postcode">${fn:split(memberVO.address,'/')[0]}</span>&#41;</div>
	                        </div>
	                        <div class="delivery-info-btn"><input type="button" value="변경" onclick="shippingInfo()"/></div>
	                    </div>
	                    <div class="text-box-2">
	                        <div class="text-1">배송 메모</div>
	                        <div class="input"><input type="text" class="delivery-memo" placeholder="배송메모를 입력해주세요"></div>
	                    </div>
	                </div>
	            </div>
	            <div class="payment-point-info">
	                <div class="head">포인트</div>
	                <div class="info-box">
	                    <div class="text-box">
	                        <div class="text">포인트</div>
	                        <div class="input-box">
	                            <div class="input"><input type="number" placeholder="포인트를 입력해주세요." id="point" oninput="pointCheck()" /></div>
	                            <div class="input-btn"><input type="button" value="전액사용" onclick="pointCheckALL()"></div>
	                        </div>
	                        <div class="point-balance">보유 포인트 <span class="point-left"><fmt:formatNumber value="${memberVO.point}" type="number" /></span></div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="payment-right-box">
	            <div class="payment-final-fee">
	                <div class="head">최종 결제금액</div>
	                <div class="final-fee-box">
	                    <div class="pay-info-left">
	                        <div class="text">상품가격</div>
	                        <div class="text">포인트 사용</div>
	                        <div class="text">배송비</div>
	                    </div>
	                    <div class="pay-info-right">
	                        <div class="val"><span><fmt:formatNumber value="${finalPrice}" type="number" /></span>원</div>
	                        <div class="val">- <span class="point-right-1">0</span>원</div>
	                        <div class="val">+ <span class="delivery-charge">0</span>원</div>
	                    </div>
	                </div>
	                <div class="pay-info-btm">
	                    <div class="text">총 결제금액</div>
	                    <div class="val"><span class="real-final-charge">0</span>원</div>
	                </div>
	                <div class="pay-info-btm-2">
	                    <div class="text">
	                    	<c:if test="${sLevel != 2}">
	                        	<span><fmt:formatNumber value="${pointChk}" type="number" /></span>포인트 적립예정
	                        </c:if>
	                    	<c:if test="${sLevel == 2}">
	                        	일반회원은 포인트가 적립되지 않습니다.
	                        </c:if>
	                    </div>
	                </div>
	            </div>
	            <div class="payment-pay-info">
	                <div class="head">결제 방법</div>
	                <div class="chk-box"><input type="radio" name="payment-chk" id="kakao"><label for="kakao">카카오페이</label></div>
	            </div>
	            <div class="payment-pay-btn">
	                <input type="button" onclick="requestPay()" value="결제하기" />
	            </div>
	        </div>
	    </div>
	    <input type="hidden" class="final-amount" name="amount" />
	    <input type="hidden" class="buyer_name" name="buyer_name" />
	    <input type="hidden" class="buyer_email" name="buyer_email" />
	    <input type="hidden" class="buyer_tel" name="buyer_tel" />
	    <input type="hidden" class="buyer_addr" name="buyer_addr" />
	    <input type="hidden" class="buyer_postcode" name="buyer_postcode" />
	    <input type="hidden" class="merchant_uid" name="merchant_uid" />
	    <input type="hidden" class="memo" name="memo" />
	    <input type="hidden" class="pointUsage" name="pointUsage" />
	    <input type="hidden" class="productIdx" name="productIdx_bag" value="${cartIdxChk}">
	    
	</form>
    <div class="payment-margin"></div>
    <div style="margin-top: 300px;"></div>
    <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
<script>
	let LPoint = document.querySelector('.point-left');
	let LPointSm = document.querySelector('.point-right-1');
	let pointInput = document.querySelector('#point');
	let pointTemp = 0;
	let delivery = document.querySelector('.delivery-charge');
	let deliveryTemp = 0;
	let lastCharge = document.querySelector('.real-final-charge');
	let finalAmount = document.querySelector('.final-amount');
	
	if(${finalPrice} >= 60000) {
		delivery.textContent = 0;
		deliveryTemp = 0;
	}
	else {
		delivery.textContent = (2500).toLocaleString();
		deliveryTemp = 2500;
	}
	
	function pointCheck() {
		$('#point').on("keyup", function() {
			let point = this.value;
			
			if(point-100 > ${memberVO.point}) {
				alert("보유 포인트보다 많은 포인트를 사용할 수 없습니다.");
				this.value = ${memberVO.point} - 100;
			}
			else if(point-100 > Number(${finalPrice}) + deliveryTemp) {
				alert("결제 금액보다 많은 포인트를 사용할 수 없습니다.");
				this.value = Number(${finalPrice}) + deliveryTemp - 100;
			}
			pointTemp = Number(point);
			LPoint.textContent = Number(${memberVO.point} - point).toLocaleString(); 
			LPointSm.textContent = Number(point).toLocaleString();
			
			finalCharge = Number(${finalPrice} - pointTemp + deliveryTemp);
			finalAmount.value = finalCharge;
			lastCharge.textContent = finalCharge.toLocaleString(); 
		});
	}
	

	function pointCheckALL() {
		pointInput.value = null;
		
		pointInput.value = Number(${memberVO.point});
		
		if(pointInput.value -100 > Number(${finalPrice} + deliveryTemp)) {
			pointInput.value = Number(${finalPrice} + deliveryTemp - 100);
		}
		
		LPoint.textContent = Number(${memberVO.point} - pointInput.value).toLocaleString();
		LPointSm.textContent = Number(pointInput.value).toLocaleString();
		pointTemp = Number(pointInput.value);
		
		finalCharge = Number(${finalPrice} - pointTemp + deliveryTemp);
		finalAmount.value = finalCharge;
		lastCharge.textContent = finalCharge.toLocaleString(); 
	}
	
	finalCharge = Number(${finalPrice} - pointTemp + deliveryTemp);
	finalAmount.value = finalCharge;
	lastCharge.textContent = finalCharge.toLocaleString(); 
	
     
	function requestPay() {
		document.querySelector('.buyer_email').value = document.querySelector('#openerEmail').textContent;
		document.querySelector('.buyer_name').value = document.querySelector('#opener2Name').textContent;
		document.querySelector('.buyer_tel').value = document.querySelector('#opener2Tel').textContent;
		let addr = document.querySelector('#opener2RoadAddr').textContent +" "+ document.querySelector('#opener2DetailAddr').textContent
		document.querySelector('.buyer_addr').value = addr;
		document.querySelector('.buyer_postcode').value = document.querySelector('#opener2Postcode').textContent;
		document.querySelector('.memo').value = document.querySelector('.delivery-memo').value;
		document.querySelector('.pointUsage').value = document.querySelector('#point').value;
		console.log('1:' + document.querySelector('.pointUsage').value);
		
		let merchantUid = 'LEGO_'+new Date().getTime();
		document.querySelector('.merchant_uid').value = merchantUid;
		
		if(document.querySelector('.buyer_name').value == '000') {
			alert('이름을 입력해주세요');
			return false;
		}
		else if(document.querySelector('.buyer_tel').value == '000-0000-0000') {
			alert('전화번호를 입력해주세요');
			return false;
		}
		else if(document.querySelector('#opener2RoadAddr').textContent == '주소없음' || document.querySelector('#opener2DetailAddr').textContent == '주소없음') {
			alert('주소를 입력해주세요');
			return false;
		}
		else if(document.querySelector('.buyer_postcode').value == '(주소없음)') {
			alert('우편번호를 입력해주세요');
			return false;
		}
		else if(!document.querySelector("input[name=payment-chk]").checked) {
			alert('결제방법을 체크해주세요');	
			return false;
		}
		else {
			var IMP = window.IMP; 
			IMP.init("imp26047687");
			let paymentOk = 0;
			
			IMP.request_pay({
			    pg : 'kakaopay',
			    merchant_uid: merchantUid, // 상점에서 관리하는 주문 번호
			    name : '주문명:테스트 결제',
			    amount : document.querySelector('.final-amount').value,
			    buyer_email : document.querySelector('.buyer_email').value,
			    buyer_name : document.querySelector('.buyer_name').value,
			    buyer_tel : document.querySelector('.buyer_tel').value,
			    buyer_addr : document.querySelector('.buyer_addr').value,
			    buyer_postcode : document.querySelector('.buyer_postcode').value
			},function(rsp) {
			    if (rsp.success) {
			        var msg = '결제가 완료되었습니다.';
			        paymentOk = 1;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        paymentOk = 0;
			    }
		        alert(msg);
				if(paymentOk == 1) {
					myform.submit();
				}
			});
		}
	}
</script>
</html>