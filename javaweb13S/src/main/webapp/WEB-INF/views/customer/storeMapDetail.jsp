<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
    <link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <link rel="stylesheet" href="${ctp}/css/default.css">
    <link rel="stylesheet" href="${ctp}/css/storeMapDetail.css">
    <title>레고®스토어 정보 | LEGO SHOP</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    <div class="storeMap-box">
        <div class="storeMap-title">
            LEGO® Store ${vo.storeName}
        </div>
        <div class="storebox">
            <img src="${ctp}/images/customer/mapImg/store (${randomNum}).webp" alt="${vo.storeName}의 이미지">
            <div id="map" style="width:100%;height:400px;"></div>
        </div>
        <div class="info-box">
            <div class="location-title">위치</div>
            <div class="location-info">${vo.storeLocation}</div>
            <c:set var="text" value="${fn:split(vo.storeLocation,' ')}" />
            <div class="addr">${text[0]} ${text[1]}</div>

            <c:if test="${vo.storeTel != '000-000-0000'}">
                <div class="tel">연락처: ${vo.storeTel}</div>
            </c:if>
            <div class="info-text-title">소개</div>
            <div class="info-text-content">
                ${vo.content}
            </div>
        </div>
    </div>
    <div class="storeMapDetail-margin"></div>
</body>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4c7fdac1c6ad321348fe3d19129ba314"></script>
	<script>

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${vo.storeCoords}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    var imageSrc = '${ctp}/images/customer/big-map-marker.png', // 마커이미지의 주소입니다    
        imageSize = new kakao.maps.Size(35, 46), // 마커이미지의 크기입니다
        imageOption = {offset: new kakao.maps.Point(15, 46)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
        
    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
        markerPosition = new kakao.maps.LatLng(${vo.storeCoords}); // 마커가 표시될 위치입니다

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition, 
        image: markerImage // 마커이미지 설정 
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
	</script>
</html>