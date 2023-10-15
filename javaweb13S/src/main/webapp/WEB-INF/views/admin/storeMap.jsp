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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" href="${ctp}/css/default.css">
    <link rel="stylesheet" href="${ctp}/css/storeMap.css">
    <script src="${ctp}/js/daumAddr.js"></script>
    <script>
    	function storeLocationInput() {
    		let storeName = myform.locationName.value;
    		let storeAddr = myform.addr.value;
    		let storeTel =  myform.locationTel.value;
    		let storeText =  myform.locationText.value;
    		
    		if(storeName == "") {
    			alert('지점명을 입력해주세요');
    			console.log("1");
    			return false;
    		}
    		else if(storeAddr == "") {
    			alert('주소를 입력해주세요');
    			console.log("2");
    			return false;
    		}
    		else if(storeTel == "") {
    			alert('연락처를 입력해주세요');
    			console.log("3");
    			return false;
    		}
    		else if(storeText == "") {
    			alert('설명을 입력해주세요');
    			console.log("4");
    			return false;
    		}
    		else {
    			console.log("5");
    			myform.submit();
    		}
    	}
    	
    	function storeMapDelete(idx) {
    		let ans = confirm("삭제하시겠습니까?");
    		if(!ans) {
    			return false;
    		}
    		$.ajax({
        		type : "post",
        		url : "${ctp}/admin/storeMapDelete",
        		data : {idx : idx},
        		success : function() {
        				alert("선택하신 스토어 정보가 삭제되었습니다.");
        				location.reload();
        		},
        		error : function() {
        			alert('오류 발생');
        			location.reload();
        		}
        	});
    	}
    </script>
    <title>스토어 지도 관리 | LEGO SHOP</title>
</head>
<body>
	<div class="admin-container">
		<jsp:include page="/WEB-INF/views/include/adminLeft.jsp"></jsp:include>
		<div class="admin-right-container">
			<h2>스토어 지도 관리</h2>
			<form name="myform" method="post">
				<div class="content">1. 지도 검색</div>
				<input type="text" class="locationAddr" name="addr" id="sample5_address" placeholder="주소" readonly>
				<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" style="margin-left: 10px;" />
				<div id="map" style="width: 100%; height:500px; margin-top:10px;display:none"></div>
				<div class="clickLatlng"></div>
				<div class="content">2. 지점명 입력(LEGO®STORE "OOO"점 [OOO만 입력])</div>
				<input type="text" class="locationName" name="locationName" />
				<div class="content">3. 연락처 입력(번호 없을 시 000-000-0000 입력)</div>
				<input type="text" class="locationTel" name="locationTel" oninput="autoHyphen(this)" maxlength="13" autocomplete="off" />
				<div class="content">4. 지점 설명 입력</div>
				<div class="text-box">
		            <textarea class="textContent" name="locationText" cols="75" rows="10" ></textarea>
		            <div class="textCnt">0/500</div>
		        </div>
				<div class="content">5. 저장</div>
				<input type="button" value="스토어 저장" onclick="storeLocationInput()" />
				<input type="hidden" class="coordsTemp" name="coordsTemp" />
			</form>
			<div class="storeMap-margin"></div>
			<div class="map-list-top">스토어 현황</div>
			<div class="map-list-title">
				<div class="num-title">번호</div>
				<div class="name-title">스토어명</div>
				<div class="delete-title">삭제</div>
			</div>
			<!--반복-->
			<c:forEach var="vo" items="${vos}">
				<div class="map-list-content">
					<div class="num-content">${vo.idx}</div>
					<div class="name-content">${vo.storeName }</div>
					<div class="delete-content"><a href="javascript:storeMapDelete(${vo.idx})">&times;</a></div>
				</div>
			</c:forEach>
			<!--반복-->
		</div>
	</div>
	<div class="storeMap-margin"></div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4c7fdac1c6ad321348fe3d19129ba314&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
        
    });

    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                        
                        var message = '검색한 위치의 좌표는 <span class="coords">'+ coords +'</span> 입니다. &nbsp;';
                        
                        document.querySelector('.clickLatlng').innerHTML = message;
                        document.querySelector('.coordsTemp').value = coords.toString().replace(/[()]/gim, "");
                    }
                });
            }
        }).open();
    }
    
    const autoHyphen = (target) => {
    	target.value = target.value
    	   .replace(/[^0-9]/g, '')
    	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
    }
    
	$(".textContent").keyup(function(e) {
		let content = $(this).val();
		$(".textCnt").text(content.length + "/500"); //실시간 글자수 카운팅
		if (content.length > 500) {
			alert("최대 500자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 500));
			$('.textCnt').text("(500 / 최대 500자)");
            $('.textCnt').css("color","#d01012");
            $('.textCnt').css("font-weight","900");
		}
        else {
            $('.textCnt').css("color","#333");
            $('.textCnt').css("font-weight","400");
        }
	});
</script>
</html>