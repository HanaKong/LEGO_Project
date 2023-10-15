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
    <link rel="stylesheet" href="${ctp}/css/deliveryInfo.css">
    <title>title | LEGO SHOP</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    <div class="container">
        <div class="back-to-customer"><a href="${ctp}/customer/customerMain">고객 지원 페이지로 이동하기</a></div>
        <div class="delivery-info-container">
            <div class="title">배송, 반품 및 취소</div>
            <div class="first-box">
                <div class="sub-title">배송</div>
                <div class="img-box"><img src="${ctp}/images/customer/truck.png" alt="트럭 이미지"></div>
                <div class="text">주문 상품이 창고에서 출고되면 운송장 번호가 포함된 이메일을 고객님께 보내 드립니다. 현지 택배사의 웹사이트에서 배송 관련 업데이트를 확인하실 수
                    있습니다. 이메일을 받은 후 배송 조회하려면 최대 24시간이 걸릴 수 있습니다.</div>
                <div class="text"><a href="">내 주문 상태</a> 를 확인하여 운송장 번호를 확인 할 수 있습니다.</div>
                <div class="text">브릭 앤 피스 주문 (누락되거나 파손된 부품) 은 추적할 수 없습니다.</div>
                <div class="text">언제 내 주문을 받아볼 수 있는지 궁금하십니까? 배송 기간에 대한 유용한 도움말 항목 을 확인하십시오.</div>
                <div class="text">주문의 전체 또는 일부가 누락되었습니까?  더 많은 도움을 받으시려면 여기로 이동하십시오 .</div>
            </div>
            <div class="second-box">
                <div class="sub-title">반품</div>
                <div class="img-box"><img src="${ctp}/images/customer/openbox.png" alt="박스 이미지"></div>
                <div class="text">LEGO.com 에서 주문하신 후, 반품해야 하는 경우 저희에게 연락해 주시면 무료로 반품 수거를 도와 드리겠습니다.</div>
                <div class="text">해당 상품이 반품된 후 영업일 기준 2-3일 이내에 환불을 진행합니다. 환불이 완료되기까지 영업일 기준 최대 14일이 소요될 수 있습니다.</div>
            </div>
            <div class="third-box">
                <div class="sub-title">취소</div>
                <div class="img-box"><img src="${ctp}/images/customer/shopping-bag.png" alt="쇼핑백 이미지"></div>
                <div class="text">주문 취소는 주문서 상태가 '출고 준비 중' 이전 일 경우에만 가능합니다.</div>
                <div class="text">주문 취소는 아주 간단합니다! 주문한 품목이 '출고 준비 중' 상태가 아니라면 <a href="">'내 주문'</a> 페이지에서 '주문 보기' - '주문 취소'를 클릭한
                    후 안내에 따라 주시기를 바랍니다.</div>
                <div class="text">주문하신 물품이 이미 출고 진행 중인 경우, 온라인으로 주문을 취소할 수 없습니다. 이 부분과 관련하여 도움이 필요하시거나 혹은 부분 취소 및 다른 변경
                    사항이 있으신 경우, <a href="${ctp}/customer/emailRequest">문의하기</a>를 통해 연락 주시면 최선을 다해 도와 드리겠습니다.</div>
                <div class="text">VIP 포인트를 사용한 주문서를 온라인으로 취소 완료하면 포인트는 1~2일 이내에 자동 환급됩니다.</div>
            </div>
        </div>
    </div>
    <div class="delivery-info-margin"></div>  		
</body>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</html>