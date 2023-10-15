<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="shortcut icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<link rel="icon" href="${ctp}/images/main/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="${ctp}/css/default.css">
<link rel="stylesheet" href="${ctp}/css/regProduct.css">
<title>추가 이미지 올리기</title>
<script type="text/javascript">
	function fCheck() {
		let fName = $("#fName").val();
		let productCode = $("#productCode").val();
		let maxSize = 1024 * 1024 * 30;
		
		if(fName.trim() == "") {
    		alert("업로드할 파일을 선택해주세요.");
    		return false;
    	}
    	else if(productCode.trim() == "") {
    		alert("상품코드를 입력해주세요.");
    		return false;
    	}
		let cnt = 1;
    	let fileSize = 0;
    	for(let i=1; i<=cnt; i++) {
    		let tempName = 'fName' + i;
    		if(isNaN(document.getElementById(tempName))) {
    			let fName = document.getElementById(tempName).value;
    			if(fName != "") {
    				fileSize += document.getElementById(tempName).files[0].size;
    				let ext = fName.substring(fName.lastIndexOf(".")+1).toUpperCase();
    				if(ext != "JPG" && ext != "WEBP" && ext != "PNG") {
    					alert("업로드 가능한 파일은 'JPG/WEBP/png' 파일입니다.");
    					return false;
    				}
    			}
    		}
    	} 
    	
    	if(fileSize > maxSize) {
    		alert("업로드할 파일의 최대용량은 30MByte입니다.");
    		return false;
    	}
    	else {
	    	myform.submit();
    	}
	}
	function vCheck() {
		let vName = $("#vName").val();
		let productCode = $("#vProductCode").val();
		let maxSize = 1024 * 1024 * 30;
		
		if(vName.trim() == "") {
    		alert("업로드할 파일을 선택해주세요.");
    		return false;
    	}
    	else if(productCode.trim() == "") {
    		alert("상품코드를 입력해주세요.");
    		return false;
    	}
		let cnt = 1;
    	let fileSize = 0;
    	for(let i=1; i<=cnt; i++) {
    		let tempName = 'vName' + i;
    		if(isNaN(document.getElementById(tempName))) {
    			let vName = document.getElementById(tempName).value;
    			if(vName != "") {
    				fileSize += document.getElementById(tempName).files[0].size;
    				let ext = vName.substring(vName.lastIndexOf(".")+1).toUpperCase();
    				if(ext != "MP4") {
    					alert("업로드 가능한 파일은 'MP4' 파일입니다.");
    					return false;
    				}
    			}
    		}
    	} 
    	
    	if(fileSize > maxSize) {
    		alert("업로드할 파일의 최대용량은 20MByte입니다.");
    		return false;
    	}
    	else {
	    	vMyform.submit();
    	}
	}
</script>
</head>
<body>
	<div class="admin-container">
		<jsp:include page="/WEB-INF/views/include/adminLeft.jsp" />
		<div class="admin-right-container"> 
			<form name="myform" method="post" enctype="multipart/form-data">
				<h2>추가 이미지 올리기</h2>
				<hr class="right-item-title-under"/>
				<div class="category-box">
					<div class="item-input-box">
			      		<div class="item-input-text">상품 코드</div>
			      		<div class="value-input-box">
			      			<input type="text" name="productCode" id="productCode" placeholder="상품 코드를 입력해주세요" class="form-control" required />
			      		</div>
			    	</div>
					<div class="item-input-box">
						<div class="item-input-text">추가 사진</div>
						<div class="value-input-box fName-box-align">
		                    <input class="fName-view" value="첨부파일" placeholder="첨부파일" readonly></input>
		                    <div class="input-input-file">
		                        <input type="file" name="file" id="fName" multiple />
		                        <label for="fName" class="fName-label">파일찾기</label>
		                    </div>
		                </div>
					</div>
			    	<div class="item-input-box-btn">
		                <input type="button" value="사진등록" onclick="fCheck()" />
		            </div>
		            <input type="hidden" name="sw" value="1">
				</div>
	    	</form>
	    	<form name="vMyform" method="post" enctype="multipart/form-data">
				<h2>추가 동영상 올리기</h2>
				<hr class="right-item-title-under"/>
				<div class="category-box">
					<div class="item-input-box">
			      		<div class="item-input-text">상품 코드</div>
			      		<div class="value-input-box">
			      			<input type="text" name="productCode" id="vProductCode" placeholder="상품 코드를 입력해주세요" class="form-control" required />
			      		</div>
			    	</div>
					<div class="item-input-box">
						<div class="item-input-text">추가 동영상</div>
						<div class="value-input-box fName-box-align">
		                    <input class="vName-view" value="첨부파일" placeholder="첨부파일" readonly></input>
		                    <div class="input-input-file">
		                        <input type="file" name="file" id="vName"/>
		                        <label for="vName" class="fName-label">파일찾기</label>
		                    </div>
		                </div>
					</div>
			    	<div class="item-input-box-btn">
		                <input type="button" value="동영상등록" onclick="vCheck()" />
		            </div>
		            <input type="hidden" name="sw" value="0">
				</div>
	    	</form>
    	</div>
	</div>
</body>
<script>
	'use strict';
	
    $("#vName").on('change', function() {
        var fileName = $("#vName").val();
        $(".vName-view").val(fileName);
    });
	
    $("#fName").on('change', function() {
        var fileName = $("#fName").val();
        $(".fName-view").val(fileName);
    });
    
</script>
</html>