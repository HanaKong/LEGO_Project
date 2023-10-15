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
	<link rel="stylesheet" href="${ctp}/css/cart.css">
	<link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
	<link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
	<title>장바구니 | LEGO SHOP</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<div class="cart-container">
        <div class="cart-st">장바구니</div>
        <form name="myform" method="get" action="${ctp}/store/payment">
	        <div class="select-box-st">
	            <div class="select-all-st">
	                <input type="checkbox" id="cartChkAll" style="margin-right: 10px;" />
	                <label for="cartChkAll">전체선택</label>
	            </div>
	            <div class="select-del-st"><a href="javascript:cartDelete()">선택삭제</a></div>
	        </div>
	        <hr class="cart-item-box-top" />
	            <div class="cart-big-box">
	                <div class="cart-item-box" style="padding: 10px 0; font-size: 0.9rem;">
	                    <div>선택</div>
	                    <div></div>
	                    <div>상품명</div>
	                    <div>수량</div>
	                    <div>가격</div>
	                </div>
	                <hr class="cart-btm-1" />
	            </div>
	        <c:forEach var="vo" items="${vos}">
	            <div class="cart-big-box">
	                <div class="cart-item-box">
	                    <div class="cart-chk-box"><input type="checkbox" class="cartChk" name="cartChk${vo.idx}" value="${vo.price}/${vo.point}" onclick="javascript:priceChk(this)"></div>
	                    <div class="cart-img"><img src="${ctp}/data/admin/product/thumbnail/${vo.FName}" /></div>
	                    <div class="cart-title-box">
	                        <div class="cart-title">${vo.productName}</div>
	                    </div>
	                    <div class="cnt-box">
	                        <div class="num-btn" name="quantity">${vo.quantity}</div>
	                    </div>
	                    <div class="cart-price item-price"><fmt:formatNumber value="${vo.price}" type="number" /><span>원</span></div>
	                </div>
	                <hr class="cart-btm" />
	            </div>
	            <c:set var="minIdx" value="${vos[0].idx}"/>
				<c:set var="maxSize" value="${fn:length(vos)-1}"/>		
				<c:set var="maxIdx" value="${vos[maxSize].idx}"/>
	        </c:forEach>
	        <c:if test="${sCnt == 0}">
	        	<div class="cart-big-box-1">
	                장바구니에 담긴 상품이 없습니다.
	                <a href="${ctp}/store/storeMain">쇼핑하러 가기</a>
	            </div>
	        </c:if>
	        <div class="totalPrice-cart-box">
	            <div class="totalPrice-cart">결제금액 <span class="total-price" id="total-price">0</span>원</div>
				<input type="hidden" name="finalPrice" class="total-price" />
				<input type="hidden" name="cartIdxChk" class="cartIdxChk" />
				<input type="hidden" name="pointChk" class="pointChk" />
	        </div>
	        <div class="cart-pay">
	            <input type="button" class="cart-pay-btn" value="주문하기" onclick="cartSubmit()">
	        </div>
        </form>
    </div>
    <div style="margin-top: 300px;"></div>
    <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
<script>
let totalPrice = '';
let price = 0;
let point = 0;
let minIdx = Number('${minIdx}');
let maxIdx = Number('${maxIdx}');

	$(document).ready(function() {
	    $("#cartChkAll").click(function() {
	    	
	        if($("#cartChkAll").is(":checked")) {
	        	price = 0;
	        	$("input[class=cartChk]").prop("checked", true);
	        }
	        else {
	        	$("input[class=cartChk]").prop("checked", false);
	        }
	        for(let i = minIdx; i <= maxIdx; i++) {
	        	let arr = $("input[name=cartChk"+i+"]").val().split("/");
	        	let priceTemp = Number(arr[0]);
				if(isNaN(priceTemp)) continue;
				else if($("input[name=cartChk"+i+"]").is(":checked")) {
					price += Number(arr[0]);
					point += Number(arr[1]);
				}
				else {
					price -= Number(arr[0]);
					point -= Number(arr[1]);
				}
				totalPrice = document.querySelector(".total-price");
		    	totalPrice.textContent = price.toLocaleString();
		    	document.myform.finalPrice.value = price;
		    	document.myform.pointChk.value = point;
			}
	        
	        $("input[class=cartChk]").click(function() {
	    	    let total = $("input[class=cartChk]").length;
	    	    let checked = $("input[class=cartChk]:checked").length;
	    		
	    	    if(total != checked) $("#cartChkAll").prop("checked", false);
	    	    else $("#cartChkAll").prop("checked", true); 
	    	});
	    });
	});
	
	function priceChk(element) {
		let arr = element.value.split("/");
		if($("input[name="+element.name+"]").is(":checked")) {
          	price += Number(arr[0]);
          	point += Number(arr[1]);
		}
		else if($("input[name="+element.name+"]").prop("checked", false)){
    		price -= Number(arr[0]);
    		point -= Number(arr[1]);
		}
  		totalPrice = document.querySelector(".total-price");
  		totalPrice.textContent = price.toLocaleString();
  		document.myform.finalPrice.value = price;
  		document.myform.pointChk.value = point;
	}
	
	function cartSubmit() {
		let checkIdx = '';
		for(let i=minIdx; i<=maxIdx; i++) {
			if($("input[name=cartChk"+i+"]").is(":checked")) {
				checkIdx += i + "/";
				document.myform.cartIdxChk.value = checkIdx;
			}
		}
  		if(checkIdx == '') {
  			alert("결제하실 상품을 선택해주세요.");
  			return false;
  		}
  		else {
			document.myform.submit();
  		}
	}
	
	function cartDelete() {
		let ans = confirm("선택한 상품을 삭제하시겠습니까?");
		if(!ans) {
			location.reload();
			return false;
		}
		let checkIdx = '';
		for(let i=minIdx; i<=maxIdx; i++) {
			if($("input[name=cartChk"+i+"]").is(":checked")) {
				checkIdx += i + "/";
			}
		}
		let arr = checkIdx.split("/");
		
		for(let i=0; i<arr.length-1; i++) {
			idx = arr[i];
			
	    	$.ajax({
	    		type : "post",
	    		url : "${ctp}/store/cartDelete",
	    		data : {idx, idx},
	    		success : function(res) {
	    			if(res == 1) {
	    				location.href = "${ctp}/store/cart";
	    			}
	    			else {
	    			}
	    		},
	    		error : function() {
	    			alert("전송 오류");
	    		}
	    	});
		}
	}
	
	
</script>
</html>