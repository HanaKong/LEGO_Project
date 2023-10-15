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
    <link rel="stylesheet" href="${ctp}/css/customer.css">
    <title>고객지원 | LEGO SHOP</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    <div class="customer-container">
        <div class="head-container">
            <div class="content-box">
                <div class="img-box"><img src="${ctp}/images/customer/Sopia.webp" alt="캐릭터"></div>
                <div class="middle-box">
                    <div class="head-text">어떻게 도와드릴까요?</div>
                    <div class="icon-box">
                        <div class="icon">
                            <a href="${ctp}/customer/emailRequest">
                                <div class="icon-img"><img src="${ctp}/images/customer/contactUsIcon.svg" alt="연락처"></div>
                                <div class="icon-text">연락처</div>
                            </a>
                        </div>
                        <div class="icon">
                            <a href="">
                                <div class="icon-img"><img src="${ctp}/images/customer/orderStatusIcon.svg" alt=""></div>
                                <div class="icon-text">주문현황</div>
                            </a>
                        </div>
                        <div class="icon">
                            <a href="${ctp}/customer/deliveryInfo">
                                <div class="icon-img"><img src="${ctp}/images/customer/deliveryIcon.svg" alt=""></div>
                                <div class="icon-text">배송, 반품 및 취소</div>
                            </a>
                        </div>
                        <div class="icon">
                            <a href="">
                                <div class="icon-img"><img src="${ctp}/images/customer/missingBricksIcon.svg" alt=""></div>
                                <div class="icon-text">누락/파손 브릭</div>
                            </a>
                        </div>
                        <div class="icon">
                            <a href="">
                                <div class="icon-img"><img src="${ctp}/images/customer/buildingInstructionsIcon.svg" alt=""></div>
                                <div class="icon-text">조립설명서</div>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="gap-box"></div>
            </div>
        </div>
        <div class="body-container">
            <a class="menu-box" href="${ctp}/member/mypage">
                <div class="menu-text">주문 현황</div>
                <div class="menu-sub-text">주문하신 제품을 아직 받지 못하셨나요? 배송현황을 빠르고 쉽게 확인해 보세요.</div>
            </a>
            <a class="menu-box" href="${ctp}/customer/deliveryInfo">
                <div class="menu-text">배송, 반품 및 취소</div>
                <div class="menu-sub-text">배송, 지연, 반품 및 취소에 대해 알아보세요.</div>
        	</a>
            <a class="menu-box" href="">
                <div class="menu-text">누락/파손 브릭</div>
                <div class="menu-sub-text">바퀴나 날개가 누락되었거나 파손되었나요? 즉시 새 부품을 보내드릴게요.</div>
            </a>
            <a class="menu-box" href="">
                <div class="menu-text">조립설명서</div>
                <div class="menu-sub-text">이전 세트부터 최신 세트까지 수천 가지 제품의 디지털 조립설명서를 다운 받아 보세요.</div>
            </a>
            <a class="menu-box" href="${ctp}/customer/storeLocation">
                <div class="menu-text">레고 스토어 찾기</div>
                <div class="menu-sub-text">가까운 LEGO 매장을 찾아 예정된 이벤트에 대해 알아보세요.</div>
            </a>
            <a class="menu-box" href="${ctp}/customer/emailRequest">
                <div class="menu-text">연락처</div>
                <div class="menu-sub-text">레고 전문가에게 문의하세요.</div>
            </a>
        </div>
        <div class="helper-box">
            <a href=""><img src="${ctp}/images/customer/help.webp" alt=""></a>
        </div>
        <div class="data-text">
            <div class="title">저희가 고객님의 데이터를 안전하게 보관하는 방법</div>
            <div class="text">당사는 귀하의 개인 정보를 주의, 신뢰 및 존중으로 취급하기 위해 최선을 다하고 있습니다.</div>
            <div class="text"> 우리는 관행과 정책에 투명성을 제공하기 위해 개인 정보 보호 정책을 만들었습니다.</div>
            <div class="active-text"><a href="${ctp}/customer/aboutPrivacy">더 알아보기</a></div>
        </div>
    </div>
    <div class="customer-margin-top"></div>
</body>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</html>