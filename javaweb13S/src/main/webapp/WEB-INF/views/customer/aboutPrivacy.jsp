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
    <link rel="stylesheet" href="${ctp}/css/aboutPrivacy.css">
    
    <title> 개인정보 보관방법 | LEGO SHOP</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    <div class="container">
        <div class="title"><a href="${ctp}/customer/customerMain">고객 지원</a></div>
        <div class="main-title">저희가 고객님의 데이터를 안전하게 보관하는 방법</div>
        <div class="text-box">
            <div class="text-1">LEGO 그룹이 1932년에 설립된 이래 당사의 모토는 “최고만이 최선이다”였습니다.<br> 당사에서는 제반 업무를 수행할 때 그 모토의 영감을 받고 있으며
                또 특히 고객님의 정보 보호 방법에서는 더욱 그러합니다.</div>
            <div class="text-2">LEGO 고객서비스에 연락을 주실 때 저희는 다음과 같은 고객님의 자료를 수집, 사용, 저장 및 공유할 수도 있습니다.</div>
            <div class="text-3">
                <div>◇</div>
                <div>성함, 배달 주소, 청구서 발송 주소 및 전화번호와 메일 주소를 포함한 연락처 정보.</div>
            </div>
            <div class="text-3">
                <div>◇</div>
                <div>LEGO ID가 있으면 주문서와 주문 기록에 고객님의 LEGO ID를 등록할 예정입니다.</div>
            </div>
            <div class="text-3">
                <div>◇</div>
                <div>LEGO VIP 회원인 경우에는 고객님의 주문서에 LEGO VIP 카드번호를 등록하고, 해당하는 경우 고객님께서 적립하신 포인트나 사용한 내용을 등록할 예정입니다.</div>
            </div>
            <div class="text-3">
                <div>◇</div>
                <div>LEGO LIFE 회원인 경우에는 고객님의 LEGO LIFE 회원 번호를 등록할 예정입니다.</div>
            </div>
            <div class="text-3">
                <div>◇</div>
                <div>LEGO SHOP 주문과 관련해 도움을 드리는 경우에는 고객님의 결제 정보를 처리할 수도 있으며 선택하신 결제 회사 및 저희 결제 처리 파트너사와 그 정보를 공유합니다.
                    PayPal (INICIS) 을 포함해 일부 결제 처리 회사에 제공해 주신 개인 정보는 저희가 기록으로 보관하고 있는 청구서 정보를 대체할 수도 있습니다.</div>
            </div>
            <div class="text-4">고객님께서 저희에게 동의하신 경우, 저희는 추가 정보를 다시 수집할 수도 있습니다. (예, 쿠키에 동의하셨거나, LEGO VIP, LEGO ID 또는
                레고뉴스레터에 구독 신청을 한 경우).</div>
            <div class="text-5">저희는 항상 당사의 개인 정보 보호 정책에 따라 고객님의 개인 정보를 사용, 저장 및 공유하고 있습니다. 저희가 LEGO SHOP 주문과 관련해 도움을 드리는
                경우 고객님께서 제공해 주신 개인 정보를 사용하고 공유할 수 있습니다. 그 이유는 다음과 같습니다.</div>
            <div class="text-6">
                <div>◇</div>
                <div>상품 입고, 포장, 배송, 배달, 사기 감지, 사기 예방 및 채권 회수 서비스를 제공하는 신뢰할 만한 외부 협력 업체와 고객님의 개인 정보를 공유함으로써 고객님의 주문을 처리하고
                    관리할 수 있기 때문입니다.</div>
            </div>
            <div class="text-6">
                <div>◇</div>
                <div>업데이트 목적으로 LEGO VIP 포인트의 잔액을 수정할 수 있습니다.</div>
            </div>
            <div class="text-6">
                <div>◇</div>
                <div>당사가 신뢰하는 클라우드 저장 협력 업체에 고객님의 개인 정보를 저장할 수 있습니다.</div>
            </div>
            <div class="text-6">
                <div>◇</div>
                <div>고객님의 개인 정보를 신뢰할 만한 외부 우편 발송 서비스사와 공유함으로써 상품 카탈로그를 우편으로 보낼 수 있습니다.</div>
            </div>
            <div class="text-7">이를 통해 고객을 보호할 수 있고 사기 탐지와 사기 예방을 위한 자동 의사 결정 처리 시스템을 사용하는 협력 업체와 공조할 수 있습니다. 고객님의 주문에
                영향이 미친 경우 고객님께 통보할 것이며, 자동 의사 결정이 마음에 들지 않을 경우 재검토를 요청할 수 있습니다.</div>
            <div class="text-8">저희 회사 전체에서 귀하의 데이터를 어떻게 보호하는지 좀 더 자세히 알고 싶으시다면 당사의 전체 개인 정보 보호 정책을 살펴보시기 바랍니다.</div>
        </div>
    </div>
    <div class="margin-top-text"></div>
</body>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</html>