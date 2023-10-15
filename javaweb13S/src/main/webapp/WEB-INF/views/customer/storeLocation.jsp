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
    <link rel="stylesheet" href="${ctp}/css/storeLocation.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4c7fdac1c6ad321348fe3d19129ba314"></script>
    <title>레고®스토어 찾기 | LEGO SHOP</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    <div class="map-container">
        <div class="title">레고® 스토어 찾기</div>
        <div class="big-map">
            <div id="map" style="width:100%; height:500px;"></div>
        </div>
        <div class="repeat-box">
            <!-- 반복 -->
            <c:forEach var="vo" items="${vos}">
	            <div class="map-box">
	                <div class="marker-box">
	                    <img src="${ctp}/images/customer/big-map-marker.png" alt="마커">
	                </div>
	                <div class="text-box">
	                    <div class="title-1">레고® 스토어 ${vo.storeName}</div>
	                    <div class="detail-addr">${vo.storeLocation}</div>
	                     <c:set var="text" value="${fn:split(vo.storeLocation,' ')}" />
	                    <div class="addr">${text[0]} ${text[1]}</div>
	                    <c:if test="${vo.storeTel != '000-000-0000'}">
	                    	<div class="tel">연락처: ${vo.storeTel}</div>
	                    </c:if>
	                    <div class="link"><a href="${ctp}/customer/storeMapDetail?idx=${vo.idx}">See store details</a></div>
	                </div>
	            </div>
            </c:forEach>
            <!-- 반복 -->
        </div>
    </div>
</body>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

<script>

var positions = [];
<c:forEach var="vo" items="${vos}" >
	positions.push({title: '${vo.storeName}', latlng: new kakao.maps.LatLng(${vo.storeCoords})});
</c:forEach>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(36.597645452129065, 127.68255047042719), // 지도의 중심좌표
        level: 13 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	var imageSrc = '${ctp}/images/customer/big-map-marker.png';
	
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(35, 46); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	}
	
</script> 
</html>